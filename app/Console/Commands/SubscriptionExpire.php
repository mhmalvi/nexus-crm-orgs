<?php

namespace App\Console\Commands;

use App\Models\Company;
use Illuminate\Console\Command;

class SubscriptionExpire extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:subscription-expire';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Subscription expiry';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $isExists = Company::select('end_date')->exists();
        if($isExists){
            $results = Company::select('end_date')->get();
            if($results){
                foreach($results as $result){
                    print_r($result);
                }
            }
        }
    }
}
