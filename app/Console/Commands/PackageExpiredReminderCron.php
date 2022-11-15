<?php

namespace App\Console\Commands;

use App\Models\Company;
use Illuminate\Console\Command;

class PackageExpiredReminderCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'package-reminder:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Package Expired Reminder';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $company = Company::select('companies.id as cid',
            'companies.name as name', 'companies.description as description', 'companies.logo_id as logo_id', 'companies.contact as contact',
            'companies.business_email as business_email', 'companies.address as address', 'companies.abn as abn', 'companies.website as website',
            'companies.trading_name as trading_name', 'companies.rto_code as rto_code', 'companies.country_name as country_name', 'companies.admin as admin',
            'companies.fb_ac_credential as fb_ac_credential', 'companies.app_id as app_id', 'companies.secret_key as secret_key', 'companies.form as form',
            'companies.business_type as business_type', 'companies.active as active',
            'packages.id as pid', 'packages.package_name as package_name', 'packages.package_type as package_type', 'packages.package_type_limit as package_type_limit',
            'packages.package_details as package_details', 'packages.price as price', 'com_subscription.created_at as package_date', 'com_subscription.active as package_status')
            ->join('com_subscription', function ($join) {
                $join->on('companies.id', '=', 'com_subscription.company_id');
            })
            ->join('packages', function ($join) {
                $join->on('com_subscription.subscription_id', '=', 'packages.id');
            })
            // Filter Time limit (Type = 2)
            ->where('packages.package_type', '=', 2)
           ///////
            ->where('com_subscription.active', '=', 1)
            ->where('companies.active', 1)
            ->get();

        \Log::info(json_encode($company));
        //return 0;
    }
}
