Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BA85BC349
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 09:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiISHC2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 03:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiISHC1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 03:02:27 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2086.outbound.protection.outlook.com [40.107.95.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB6F1D0E7;
        Mon, 19 Sep 2022 00:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTGLYaeeauTYicAHkNMgzJWKqktAM2BrynSe4o2Ewt6Pv/TBT+cdws4RwPaayRbMPKE68Atesto1IvvPRXVytVt/4B2TyaT1NLoX7dijl8BvBpfHUpv/4DBj92YGiE22qs7Dg9ZBSzQB45J9A/XpW7ukOt5G5ndrFhUCwyZZMAd/LcfUnkPlnSWTkBlIK/pNuFQ8Q6ZeT+Tja7j3Ueqf91IeqygKEm3g0fJq+BJzZiS473IpDDQyAuULnzkvIYVmYjpEZJqHJdqEUX71HCbFYaaxgXBu0GRsFxG3XUA+FUDMb+38YLWWD7SRiQ9iXv8qrwcvl7tT5ZpKcLkduhOP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cuf72fCzheVTr/GYcHh2Qegj6jlajYShG2rVUj6n53s=;
 b=QYv5p8m5+C/pdzUBgHCD3EvcYJCkWQdNTh1RkHLsaOjSFVgYpTcpgPtPoGrvVnVqLXhvviZ8IPyxJHDF7NxVd8FMLy6G44Hnz2kV+pqF0cYDqDnI08BG49DTs4VvfRMEfy+Fag7TYkGIl5BjVHspMLsW+P3yzPMbcWHYe35/HSvGaI3h5iUu2rp4Pm2IP5xVDBDnlu5uFKJzlEM5wp+e8LrT0pNdw8J69MLcOSOr1ehtfCQeDjghlgE+4w65z6sSxZ4Ll8l5l9zCoUHOX6wF1/xzbOhdzLl5VpwIYIIguZvw7B79FvNFNbKNpYrD0l6wXai/ALRLfh2KGheB2pD0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gorani.run smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cuf72fCzheVTr/GYcHh2Qegj6jlajYShG2rVUj6n53s=;
 b=dRQdacxMB9nutvA0vYxLsN66jflvjyKCrex0iQ2JYqhJARVoL/0ohPVclMNE0FHsNsc6V6CcDZGtMk/z6H6bzxVcyKpb0FSy6xMOrv99ETcvpHlVX2rYSt96RrMJRZ8kWdVLz+aqTm/SHGDXqTxz9pigJ4sXghS72DzNyP+2jZE=
Received: from DS7P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::24) by
 DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.19; Mon, 19 Sep 2022 07:02:24 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::82) by DS7P222CA0007.outlook.office365.com
 (2603:10b6:8:2e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Mon, 19 Sep 2022 07:02:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Mon, 19 Sep 2022 07:02:23 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 19 Sep
 2022 02:02:18 -0500
Message-ID: <31bf7452-5f1d-2590-58de-3b9b73c132f9@amd.com>
Date:   Mon, 19 Sep 2022 09:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
Content-Language: en-US
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        Sungbo Eo <mans0n@gorani.run>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220915114803.26185-1-shubhrajyoti.datta@amd.com>
 <20220915114803.26185-3-shubhrajyoti.datta@amd.com>
 <d756107b-5cc5-53ba-b420-d4664e3a9bb7@gorani.run>
 <BY5PR12MB49027576A8D06800293630FE814D9@BY5PR12MB4902.namprd12.prod.outlook.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <BY5PR12MB49027576A8D06800293630FE814D9@BY5PR12MB4902.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT047:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2030463f-8656-458a-07d6-08da9a0ce731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gad5b3OzuUBNXInwUu2yVwD+s7IWwDG3HTt+r/s1FvJzJFGaeU/UdObAv0REEbjyiXxOWHJobL3y5jtoXluIh7dIBM6EB1FuKc4aEiGM5Vs3e0GdlkdZV65S9YgfHG5lz2q+ldYzfvEv6jYSbXx5dyGPF082t5q49HeckZRkw7z7j6+g3vU37iEV8xKAhllrtBcJvomHd6ftgkhauxFJWEaMNPSoQDNewGZ52Hap9y5PinB6d6Mn/2bWtEQcazLzGovCpGGd0SgQYDlUHYMKtikjlJDQKu/m6S3mM2aBQ3ObqcOALcyh7r1nH93HZBIhLPS07WTG8roXA06vAcvKcquz1K2KkiFWFjyCEClVEquxA2CB8Ln6cL2Fm/lY5ti0vtQCLEDpdviVU5wD1LV11DzBZVHUesnw9lEmG9hsZOKGm+sRsVUyc38e7Hxzt1CS0wfa2re2acmEFCsTaeDibBHcDJ968opQ3rFw78WCEHIUAGMe+vhLJatjn1poo9zs0w7PUHSxSui7hHdAUYfJuUEQ5iMx3Lp2xWR6YfhtZZHlt4H2+l7PkmgJ6B6rLtIGD7avbMvqQIF7oq5B+w/0unbxfZU9px8t+UTudFThOIfk4hgMT4ZFWsvhNkwU7jb9n6VkMsmPOzSb0RW93f5zu2ghiMCUhgtpLceXWTUAs8fHMfNdw8QjdnHbSBQxQd2CsM69VEYewkCSl28+XyaEBMJJ3vqd8/MjeSxMEeH2hSVMOqVzLLiniWV9Gs4c0Jl9zzHpdB78bWbQiXUGPs7SOqiWOW5MuHdJZCkS82qn0IjvkwOHlooPyN/nwq6LTCoM6kwtPkvZqQpSXM7WVaC9aAgETjRtvdZpSfWeXxDbLVs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(53546011)(26005)(2616005)(31686004)(45080400002)(81166007)(356005)(44832011)(478600001)(966005)(2906002)(5660300002)(36860700001)(82310400005)(82740400003)(36756003)(31696002)(86362001)(40460700003)(336012)(186003)(16526019)(426003)(47076005)(6666004)(40480700001)(83380400001)(41300700001)(4326008)(316002)(54906003)(16576012)(8676002)(110136005)(70586007)(70206006)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 07:02:23.4444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2030463f-8656-458a-07d6-08da9a0ce731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/19/22 08:32, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
> 
> Hi Sunbo,
> 
>> -----Original Message-----
>> From: Sungbo Eo <mans0n@gorani.run>
>> Sent: Saturday, September 17, 2022 7:31 PM
>> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
>> Cc: linux-gpio@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>;
>> devicetree@vger.kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> robh+dt@kernel.org; brgl@bgdev.pl; linus.walleij@linaro.org; Andy
>> Shevchenko <andy.shevchenko@gmail.com>
>> Subject: Re: [PATCH v2 2/2] gpio: pca9570: add slg7xl45106 support
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi,
>>
>> Thanks for the update.
>> I was thinking I should reply to your patch in the last month, but I was a little
>> busy at the time and I forgot to do so...
>>
>> On 2022-09-15 20:48, Shubhrajyoti Datta wrote:
>>> slg7xl45106 is a I2C GPO expander.
>>> Add a compatible string for the same. Also update the driver to write
>>> and read from it.
>>>
>>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>>> ---
>>> v2:
>>> Use platform data insted of compatible
>>
>> Moving the command property into the new platform structure is nice.
>> And please add more description about the device in the commit message.
>> We don't even know the full name of the vendor from your patch.
>> I like the older version of your patch in that perspective.
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.
>> kernel.org%2Fall%2F1656426829-1008-3-git-send-email-
>> shubhrajyoti.datta%40xilinx.com%2F&amp;data=05%7C01%7Cshubhrajyoti.d
>> atta%40amd.com%7C9758241b75fc461113b608da98b50869%7C3dd8961fe488
>> 4e608e11a82d994e183d%7C0%7C0%7C637990201003357055%7CUnknown%7
>> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
>> LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=x0RHFhr9X0L3VBzTRyRy
>> VfLhm74gx7jBqUs2NEFhKcI%3D&amp;reserved=0
>> And a link to the device datasheet would be also nice (if possible).
>>
> 
> Will update the description.
> 
>>>
>>>   drivers/gpio/gpio-pca9570.c | 39
>>> +++++++++++++++++++++++++++++++++----
>>>   1 file changed, 35 insertions(+), 4 deletions(-)
>>
>> And I was also thinking that tpic2810 driver might be more appropriate then
>> this pca9570 driver for a device with one command byte.
>> Actually I had forked tpic2810 to create pca9570 to support a device without
>> any command byte.
>> Come to think of it, the two drivers may even be consolidated into a single
>> generic one... What do you think?
> 
> I agree.
> It looks to me that the current driver should work for the tpic2810 also by adding the compatible.
> Do you agree?

You will have to solve issue with Kconfig symbols. Anyway if you want to merge 
these two drivers together it has to be done on the top of this series anyway. 
It means get this first part merged and then another device can be on the top of 
this series.

Thanks,
Michal
