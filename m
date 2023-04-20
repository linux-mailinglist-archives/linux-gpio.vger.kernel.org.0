Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732676E9CF3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 22:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjDTUUA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 16:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjDTUT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 16:19:59 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942E41FC2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 13:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVqlNGiJSnZ1P6V69TbAhlrZcN1ccI0bTmdWasF69S3iO+qqe+Xkk2CtyYfmrVXR+Wx4x0zfxwQonGcxg466tbAp8oh0j90bbli2lgG2rqdNQlsr8y1hUfPKppg+u1afOisln747RLpbKO7i0E6+q8IHZVeaspHcOrPOB27loYy1x+eZs6SD1N9E2sHH6gSf4sTRNXK7sDBVp19rvSulpGi8ktmdzoS/62mthpMeMLnQRt8E0skTWvBeqTQKjN2revElO4yb3U+7aD/hNTTpI2Cv18qnwIcKmmFNukUbFWgcLomw4zenr3RmzpgXowafezju/5iONwF/okikq6xsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/5MfoTVpPZw/N9wZoG5FejwjL51+h76uBay3Qz+jrg=;
 b=fPKQj6ST/AWpT1k24KzRaLNK9u/LzxeokSuNTFj+fb1XSKiuJ1MG+izDqO2PweZjYvnlxZj+RKVGbC6AbxXeB0JhWbrz6tg9EOi6RGnZa+OX6tgzjUXRH5FOn+2Yf3Ngd4ydK2e5D6mBKU08kXK0UOGay3+qU8jaVp8vBst7Tub4GmhUHyMTpK94+Jr3r6mODz5zVPSPCdAY1jkSBhS7Ft18AKEyNjqHQbM3Agkaz/DQeUtjDto9MQYRiAKR1TfXpIPGFO2QDew5Hn9qiBlMH+q+k2QcvPHGQLMK6wYVDYkGlc3sxmE0b+EAYrSWy4cooHBNINb064gdYGBrOBGeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/5MfoTVpPZw/N9wZoG5FejwjL51+h76uBay3Qz+jrg=;
 b=e5qUCOT17AUbuJZd+aR2x5b2rCWTmEaVY8tbB6zILZtPuq+8fS0bm2hNMb2YXqVwiUr5Q4tu3+y2GuTQE+QM+1JZ9x9u06AIpay+OKu1Phd+OpHtRyoLoaDNnpVbj25ZIn+jVo37ZHG/QTjgyyLUIq8rK9D4xx3svnFfv8BY+DBNJjMXCrrzpmQEjzD+hy9UoY/d+AP2Xsb+YtblqGYNFH28XdN3alBBtMgfVNB7Li7D+mI+xz/M13LwR6YGAHeAl8wOA4Og3aKGCRW8yoS4Sc0DOq0Px48r3uZTz3Ii48UDxujEFyXiBxctwSnN9gdglTyQp4PlAaKEijilQARORA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by CH2PR12MB4955.namprd12.prod.outlook.com (2603:10b6:610:68::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 20:19:56 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::265:64aa:fb3e:288%4]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 20:19:56 +0000
Message-ID: <0ec147e4-7be8-3187-0a37-249f42533724@nvidia.com>
Date:   Thu, 20 Apr 2023 13:19:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] hte: tegra-194: Use proper includes
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
References: <20230117084159.485234-1-linus.walleij@linaro.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20230117084159.485234-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|CH2PR12MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: 14dbf1f0-e41b-4f76-afc0-08db41dc9bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yx+xzC5nINaZSA6KH2ZXldkbkKgZIjJbvl/efR9dnCVPPfwC7BYh4R5BDrFlwCqGdUMcXSRQ8ELXyPMa/YluEGFziLERMJf2BmELdez8i9VtVY62hUaCQwIb84KPgBB9NoWLvUyT6o8E5tfcPS0pQrycsBFwXJMdLBpISe2kmffz6f67MJwMKp0Wjm0Hu2+kWff9cqj+ahtkBGqIkiLIHoCI4QwzVK0+lsvYa3bUbvMnXCmvk3byDj7xpBRRzXHkjikuSDI8+QSe5+q2QIOKTHHgzyy1H0VQtMpBuVAeAKo0ITlsPYQTgneORZYbf8kLGXvnkZ7PlM6Av4zKY3+kDx4f5DCpS4vBHy3x5i+VhlzNLgi+eGIpmyqzPxdd0Z6jYBgwm5B33L/QcVnhdbrsUMyVSVp2jgLZjxr0bcMkpH1Og41x/FDr0ZO5X7y9MBdhGglNFc97uz4eRg9TRfaLGxoiAy7XxG0wZeyBsNRshKOlNa/ZwJat4Ss5XL/POu7CUo4n9P2EbeCXTeWh1+gKKWWxXBIMm6cpHBOpJzAF8xeSNZMQSO3u5Bfrl5e+w6GQYTsquDd0jwF3zuSzonuYrDqttdlf7nQY8DALaRxFCIXGUb/JgCV/NIrfdzFz2dYYoHoIOJWIyMbIXOamJO6wZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(8936002)(38100700002)(8676002)(5660300002)(36756003)(86362001)(31696002)(6506007)(6486002)(6666004)(26005)(6512007)(478600001)(2616005)(31686004)(83380400001)(53546011)(186003)(316002)(4326008)(66556008)(6916009)(66476007)(66946007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVwQkhjWUlyMlNLZVNZYVFhM0dvcmFwVDh3Vi9XdFVyYjBWUmZTRldxK3k0?=
 =?utf-8?B?RUluT0cwQ2ZuUjZ2dDMxTWhxUDMrR2hpYjdJazRVbzhmTFBCWHZwUjFybnRj?=
 =?utf-8?B?UVNBRm5zMGlVWXR4Z0F3aHFxSTNYNzN4dG9KZkRTdG5oTkdpT2ljUFA2UzdK?=
 =?utf-8?B?YXNtVnEvVDFGKzZaMXg1aDRnVW54UEs4eVpYMVhlbzZ6OS9zSXBUV1BsTFY5?=
 =?utf-8?B?TWc5dk82djVMN3VBM3pDdU9uM1NodzFlVFcxSnYyLzhSN1hORGgzQ1FMNnNT?=
 =?utf-8?B?aUpBYnhxb3dXTk43cnl4YlNXcFRvWmpSbElVNHpacHZjMnhoNW9MdU90dVNq?=
 =?utf-8?B?ZFZUbnFlRmVUQlA5OXJCeDZMQnJEYjYySmNHdzNNZnV0L1p5RERBbklDdWZH?=
 =?utf-8?B?ZnlyREJSUnpFWitzd0JSak9yc2lZNkVvN2kvVlRXU3NQWHVod3pYZktmUFJz?=
 =?utf-8?B?b3h5VkZ6cElONTNtekg3TmNlSWdWOGhZRnd0ZFhaWHJtUlZOeG1GeEFUako0?=
 =?utf-8?B?NWt3OGtBT0RMelVPbFZIMms4RnZQbmFhd0ZRbzF3VjUwc09HQklXSzJrdU8r?=
 =?utf-8?B?Y0EzMjkvZytILzI1NUtLUUdTOEYrK1JHV1FSWnE0RjlyUnlqdnl2T1ZwRXRH?=
 =?utf-8?B?cnZBSkhseXU0SmkwS3VYa1FuemdrZldoTzdldURsaFEwOXVabjdVblBobS9Y?=
 =?utf-8?B?ZDJuWVM0dXhReGlKaFg5QUlmaU1VYng4dU5BWlg5S2pxeUg3RERHSjd0R2xS?=
 =?utf-8?B?Nk9LNGsxNTdrSVhFOGwzSk12QlVwbklvLzJSWGNBL1hORWlTQnduYXVGdVRY?=
 =?utf-8?B?UDUxRjZ3T3UxNFlYbXI0TGVqTWtUYXRQd0t5T1Q1bHBWWmhKUTVkL05xeUhF?=
 =?utf-8?B?Y09meENVay9GT3RLOFFhQjk0enRZaXJOQ2lHaUgzMXJoam5la1hDZEphQ3R5?=
 =?utf-8?B?T2VtenhTOHl6Y2dOcjZkcUhrdGtTd2tnVUhJSEtzVXlaSE9CN0FVUUdOTXNE?=
 =?utf-8?B?M1dUUXg0UkduMk02d0pNenk4ZGZQb0xTRVFQU3B0elF1eXJ3aEJWbmREdXNr?=
 =?utf-8?B?aXR0L0plU3g2UHhkczNOWk9lZkJUdTFnVmlmUGRrZGcwRmF6aXhqdG12QmxT?=
 =?utf-8?B?anNCNGdSS0ZTdG5NazByM2c2MmtVRkNIUzF5ZCt3enBYeWU5bm51aTBWOTJS?=
 =?utf-8?B?a0lWMWwvK0w5UmhHUHZhNWFVRWdmVTlOMXBnVTFqOEJPSU84OE1Uc1FCNmtk?=
 =?utf-8?B?SEVMaEYzN2RzWmxPK0RVeWlTOU90bXRPZTZPN0tSa0NlQWdya0ZJcXVSeW44?=
 =?utf-8?B?SFhqTGtlVTNIT2c4MWpJSXJ4eXh0YksyZTFZY25VRkdCZUx6N2FTMjcwdjht?=
 =?utf-8?B?SXBBbTZQazVIcG1YeDVCU1l0VlBWb29IZHJKMnpTSXF3SXBKYjdtdyt1a2dE?=
 =?utf-8?B?MGVDSWRHbUhaaWdpSHJXU3c5UjE4bGRVT2RQcWhHblRtL0xNTkd3cU1vWXh2?=
 =?utf-8?B?VXJvN2R5bmdRaHBsMVptbzM0OTlzNHBTZ01uMFhNWmhOVmtodEhMZXBQOHlE?=
 =?utf-8?B?R2JMYmhYQWxocW1hSHlYUlExcHRaeGdZQjBSREMvSzJ2bGZQQkEzY2xmNFVT?=
 =?utf-8?B?dlJqbkVvQTB5UVhuaE85TlZQT1ExRk9RUytLNTRwYlB2MTB0eVBFUkMwQVpY?=
 =?utf-8?B?dnZhYkdHZFpIM2htQzNXMmwrcWpSK0J3OC9xUHFnV2dCYmxDb2N3dmY2K0ZW?=
 =?utf-8?B?WXZBeC9KY056bTVBMER1WHh5VVgvQjlIajJScDlFaEliemRTVW9zZWptZ1RQ?=
 =?utf-8?B?WHFJVWg4dm95OU9wSmZmSzN0NmlMajJaSmdxR01NNHNRaERreE9xQWVma2V5?=
 =?utf-8?B?ZjhDQXcybzM1dmIwRWV0OHBLaEk1UWVlNUVVU3VwbkU0Nlc4emRaYitGdmpG?=
 =?utf-8?B?N0dZRHVQRGNaVkVNV0ZaZXQvbGJtOFpMQU9QY09OTTlpNTFQdGs5bllPbzAy?=
 =?utf-8?B?SnVLWjlHa0xzQ3dHVTZ1cVd4SC90azZpV3NjMHk2TTBEeHlCL0lGTGFJUzNv?=
 =?utf-8?B?c0QzdS9Mdk1hWW54VFVuYTJxMnBOb3o1bGhBL3RoWGtyLzdIRjFDaHpkOFA4?=
 =?utf-8?Q?T09//cM35w8Z6krJ6IrD7QJR0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14dbf1f0-e41b-4f76-afc0-08db41dc9bc2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 20:19:56.7993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLTA2bocboAKiRTNGn0JvTLOccAPoNWJf+r9uTOxkYf48wIWfOnFxzbMO49+TMl7mP/UoOQ291EsehY08Qfwcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4955
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/17/23 12:41 AM, Linus Walleij wrote:
> The test driver uses the gpiod consumer API so include the right
> <linux/gpio/consumer.h> header. This may cause a problem with
> struct of_device_id being implcitly pulled in by the legacy
> header <linux/gpio.h> so include <linux/mod_devicetable.h>
> explicitly as well.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Its mod_devicetable not mod_device_table oops.
> ---
>  drivers/hte/hte-tegra194-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
> index 5d776a185bd6..79eb866558d3 100644
> --- a/drivers/hte/hte-tegra194-test.c
> +++ b/drivers/hte/hte-tegra194-test.c
> @@ -6,10 +6,11 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/interrupt.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/timer.h>
>  #include <linux/platform_device.h>
>  #include <linux/workqueue.h>

I am not sure if I have followed up on this patchset. It seems this gives an error mod_devicetable.h not found. Perhaps you meant, linux/mod_devicetable.h instead?

