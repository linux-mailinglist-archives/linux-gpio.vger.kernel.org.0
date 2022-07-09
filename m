Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C861A56C9CE
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jul 2022 16:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiGIOGg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jul 2022 10:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiGIOGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jul 2022 10:06:36 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BB34AD44
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jul 2022 07:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgDZjOq5uw3acKKVvIgvc4Fh/ec+eRdA46N/44ENN87h06/RhEp/uiEDf8hevcO1Nsxvs7U0TPhrwd9QtzzD5vXkUjgBO6PHbU91Nagfc+nPPj9tkzzAzAfbIYIYszdDLUvlI/4/W/Rg8+g1vuXL/7zL4Nl/UAD3fQEsfCwqTN0sGUIqmQ3bA9B4n9klKh3smMeVy0EYw0oQ7zT/jjyy1U0VPuyFPyr3D/9GU3/yLGjobWX5Za7CnQzHuSqtnPkrLEXcGjm8yNWyXw/mI7LBVwhFVLMT3WHgg343LdvhrlqxE+pqBSs0SidZLrGMlVRXsIA/05Q3H+64P9Nau+XYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRKHg9SSA6ViZSWq2lz2Ty0BgDFGc64AZPWrbguyFkI=;
 b=XukOGWUsyRKWncBxdE9eQB22tMPGd4SkN9eW3qNfNkvYejz8dN3IBi5CxP1yJ568GLyTVgU58LNPF/eQxCYq9G62n7weKIcrbzZ/VFNOnN82w789YhsAb6Eoo6zdHm/EN07yQechVoXShVO5WOg5w6kQ6qdW7VbWN+JoBF9dhPUAgMQP1JiIHQHMhM+5I9s9aD4hjsgTSRP8nRDDHZZ7coI5299x8MW6195w9pA6ouAz8cFwQww8Eta/JcyAHZID4jV7w0hBTZdANGb+Wcj5YJGRPg+6b9Mq0vRUDeCk7pBXF46OUP8Gd6qRNNIP7hxMMpKIKRqpu/TdfZ2wNWYmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRKHg9SSA6ViZSWq2lz2Ty0BgDFGc64AZPWrbguyFkI=;
 b=RClhtPXgyCofHnHScYK32Jk4PvaD2gPGJoEYeQr+5hRC7fQfi26LmUDwp2L4BJzlx/Nzq/0Z16xGuTghndC0auiXcN6GHWnDXN5NoWHj5hBWcZHWe781Laq+olkXDMG30Qk1Ba1mqACsPjNkaSDslXMtum2L/Gq+Qs7pfHnxW/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6302.namprd12.prod.outlook.com (2603:10b6:8:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Sat, 9 Jul
 2022 14:06:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%5]) with mapi id 15.20.5417.020; Sat, 9 Jul 2022
 14:06:32 +0000
Message-ID: <64457e5e-060b-0514-aa1c-501b34d3a968@amd.com>
Date:   Sat, 9 Jul 2022 09:06:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] pinctrl: amd: Don't save/restore interrupt status and
 wake status bits
Content-Language: en-US
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
References: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
 <20220613064127.220416-3-Basavaraj.Natikar@amd.com>
 <MN0PR12MB6101592307B55649B8EFE47AE2AB9@MN0PR12MB6101.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB6101592307B55649B8EFE47AE2AB9@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d321cae-4c1c-468b-dfa9-08da61b43a36
X-MS-TrafficTypeDiagnostic: DM4PR12MB6302:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XeUA4gpXFRnSVtZUWyvh8kLHtnsrh5e+RDJhxDpqeyTsdUkaKtUkYui1lqH4Ixlq8ipKRKQYHDLMU0Vsmqeo+eRripYTJrxR5LMVEBBZxTkizpxAmR5O6EXShA8RQNJm9on3KW9Iycz7crQRD7+hZ9Mgb+Q2+XWzwwlEfkbXNwbK0QzMNJVpgRbu69amtLvlknOKUNPfZEC7Bik0uDy9DqoCenlTkUpBnR+BJ1Xs2LI+jnIyhx8i2iXtl3ZCwRkq+QtLQxNPrDsps9sjKaso5mQ+Oru5WFvH/qEkrVAis/NqRhT4aeI6H12atjLJtJHh9g+f3+Uoq+4oYNRxgySSOpEP1kMbgfuil8L4nGwnePQx9NoUKL6wFmrUZ1DVDWI9g8QvG7eLRhgTRrij5g3gYlnTdVID7VGRXrT9PYOfx+ji3d3yapQtH62YWX8s+TAALVY6yRwZ29f1ReeoafxipCKcKFW+6X2S8vFX/dQJMRhAg34I7AaFf1QZ/5HRtUHTLDurXUYvWaYh5sk/J+RWWFpmVv34+SivH3EPYI8LOn8GrZhH4HjXGO2MYbcu/KSwy4yVDaDVPz5f+8VrZP7i2oXIlCY02HhBkiIM45peeAgmdVZyPJ16BmJIfpyXBkJcs3Kqdc5/BNeZLECSlaX2xl38GIoQIYt/baD03uBPvyvFYVvf3po+vOsr5UJmUJM4PoqLEyV9EYM4AbtCPvqZMo8/hraqLlDtJU9SUZ82RZwxqQcTtJuU2I+e5QhcM3xiwV0ejGmR7G24vZWL7Yw9qv8uQoqudEWzf9Cy9VAfiBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(66476007)(6636002)(66556008)(6506007)(66946007)(316002)(6486002)(53546011)(966005)(41300700001)(110136005)(6666004)(478600001)(8936002)(8676002)(2906002)(44832011)(2616005)(5660300002)(38100700002)(31696002)(86362001)(31686004)(36756003)(186003)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjQ4M3d6WEJrbEM2RG9rbnA2cDFjUXlEdUI0QXBYSkhCdldGZ0xhYW1YMjJW?=
 =?utf-8?B?ampOSS9KQnpwL2Y4ZmthM3EzS3IraDkydFI2RVlSWUJ6NzJuUCtsSDZlbkdJ?=
 =?utf-8?B?UkxjVmd0eklBN1FPOTdFb0EzN3FGMkRRZ2FVT2UvMU5MQUFrb0tKakFMK3U1?=
 =?utf-8?B?c0pqb0JpblBkWC9adVJMQXVJZmpqQ1U3RGJHRmdKbjdQTzFxS1Z3VFpYRjhl?=
 =?utf-8?B?WmdnODFIV0J0VnJTL2RLa0lHaFpNLzRZdi9pRG9BYmhvUXgvZmh6OTRNa0Jv?=
 =?utf-8?B?ZDJpbUZEUTFsN0ZzYiswM1VrbEZPZHVtY2NBVSt4RElwMGx4NmVlME0vcHhy?=
 =?utf-8?B?d1ZZYzlraFBQbjBvcUU1ZmI3cDRMREhlWjdWK0xPazZIWWExZUhERVNtY2hQ?=
 =?utf-8?B?NFVVdWpjSWxiU0tRaGwxbDQ2ZkNCRTY1M1IxN0o2SXp5WEJOem9KWTRlelNl?=
 =?utf-8?B?SUtNMlhmNm9iL3FNang0U05ac2xubUZtVXIveGdMUjkvNk8vc3lLZXFzZ0tr?=
 =?utf-8?B?b2QvWGVyeUNBN0ZtNEkybjBUdk12Sml6TE53OXpHU2FOblM1U3hNTnJiT1pl?=
 =?utf-8?B?b2JVMEsxWWpGYnJPdE9JeDVtMGVUSkN4M2drLy8rc1dQSmdReXBheUFxbXMx?=
 =?utf-8?B?b3U5Tk1UVExPS1dqYjJzNVZRMlpzdjFVbTk2cGhLOXVWblliZDJRSGdpRHdw?=
 =?utf-8?B?SGo4NkVZWU9HeVJPTW1lWEdlZ3NkdUZMUHZMQWg3SjBPQndLN3l2VDNFNE9M?=
 =?utf-8?B?WG1QVnRwdXNKYnZidWxIaVZiWlI0bm5PcFJPMi9QT0xtQkt0dXkvWGwwQXZv?=
 =?utf-8?B?bDdwRGcyTHBMdjlXb2RwZFpvUTdwMW1wN0l5dWErL0gxZUxTVGc4LzhzUVBQ?=
 =?utf-8?B?ckhDSVlpK3Arc3E4L0JnWVFmR1RDVGd3bVJScVlvSVlXaU80b3dzaGlPS215?=
 =?utf-8?B?bzA1aTRDMjNuSHVyY21qemdxVnY2SXRIM00ybTNNNHAvL3YzSXk0MlB1R3ZR?=
 =?utf-8?B?OE9EcERXdGJYMnRPdmpKTjYrRW51ajNranFlcmhCaHFHclBSSldIZlJ1WWtD?=
 =?utf-8?B?MDhPeDJERHRjcFowMENHVzBkMDl6S2Fjb1lzYlpvcXFaRWVXUHVCMFREMGNl?=
 =?utf-8?B?UUFvNUt2ajF6Sm5mSUVjcnhRZ1BIZGZzTm5QV3lyaFFsa28xVXlkUDBUcmg1?=
 =?utf-8?B?SE9RNDUwaHIrakVxb09FU0d4LzQ2VE1ielNMSm42bEM3R3JnaWxBNHZ0Yi8v?=
 =?utf-8?B?ZXVlY2lydExBL2FlM2tZQjlkaEFKYzdvNVo0b0R2dnQ0K0g3VE1uRXphTVFt?=
 =?utf-8?B?MHBiVXRzZHBQaCt6Wi9PczJpZ3FWWTdraGd0b3pBR1YxdjZBWnNGM1Y2NTll?=
 =?utf-8?B?eTRPK3FvV0lkV3hJdC9nTXZidFhGbzRtVkNYT25xaFVLdVpVSjZ4THZTN2lU?=
 =?utf-8?B?eldkcGdoRlNFemp2NW0xZzRFY1VNZDdrYi9hMnh4cFB6TUdBZXZaQVhPQnRz?=
 =?utf-8?B?bnZvZVEzTmhka09kNFFtSXlGRENQbnNrMVNVQmlYM2daT2x4SHA0amF6Visz?=
 =?utf-8?B?anZNSDlhWWd1Y01xKzlZbEZYNEtTYXNYM2hnaXRteEFnV3dEZ284Z0xkMldr?=
 =?utf-8?B?MGRTTGhteUdkbVhQSVM0MG15eUlCZUVtME1uS2RwbXMvdEpUaGpSWTVvNmtM?=
 =?utf-8?B?b09UVG5YTy9mb0JuUUp1NHdQbTg1YmFsTzNzRGJobE5TU2d0NHJvVm9NUjFK?=
 =?utf-8?B?b0ovWE0rbnBVTUdtRG4vaGVwMXRteU9Rbm9qYTJoQ1N3cjVSdmhCcWJUSFJp?=
 =?utf-8?B?Z3RQMEYwV0F3Mnc1bTl6UTFiald6cEEzc1I2dkpuSy9HRlBrSno1NWllT1lt?=
 =?utf-8?B?dmtqU2cvZ2JQcTdaeHphekhNMzdRTXZITmJEN0NpUUJLRjNlSnNrQ2hSWHF0?=
 =?utf-8?B?YjFTczlJcE5aaTFkcXpadG1aOUg4YzRGTGg3RHViWVdGUW9JUG1CSCtWWHVV?=
 =?utf-8?B?aFNIWTdLNFBOb3YvQmVzSWdsN0pabDFDanAwKzNIYi8zdnA0cUFmVWhJUDFX?=
 =?utf-8?B?V1RtdWJOK0pSZ1diZVNMSUZyOUxlWWM3UjlBQUM3QUtBbjNTRUVCQjdZSjV4?=
 =?utf-8?B?R3ZvS1lsQXFTNURDUUEwR1lXZXltZ3pEVTUwaUxlSmRPOEtyZ1BBKzhyZFVu?=
 =?utf-8?Q?eEV7TQkT3hFYCJhcxJm9tHMJ0u7/jBFflbim3woQx/zd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d321cae-4c1c-468b-dfa9-08da61b43a36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2022 14:06:32.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd4BpGnnsifJocQ3iV38PhWwDU/ukUC2RcpDVTmfuIYZmEqZ4KtAfxFAQicJNQ15aDmr61yn1yrfqcP581lw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6302
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 6/13/22 09:17, Limonciello, Mario wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Natikar, Basavaraj <Basavaraj.Natikar@amd.com>
>> Sent: Monday, June 13, 2022 01:41
>> To: linus.walleij@linaro.org; linux-gpio@vger.kernel.org; S-k, Shyam-sundar
>> <Shyam-sundar.S-k@amd.com>
>> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; Natikar, Basavaraj
>> <Basavaraj.Natikar@amd.com>
>> Subject: [PATCH 2/3] pinctrl: amd: Don't save/restore interrupt status and wake
>> status bits
>>
>> Saving/restoring interrupt and wake status bits across suspend can
>> cause the suspend to fail if an IRQ is serviced across the
>> suspend cycle.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> I think this should also pick up this tag:
> Fixes: 79d2c8bede2c ("pinctrl/amd: save pin registers over suspend/resume")

This was confirmed to fix a bug reported to AMD gitlab with multiple 
suspend/resume cycles.  So one more tag to add:

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1333

> 
>> ---
>>   drivers/pinctrl/pinctrl-amd.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>> index ff3d0edbea48..40e23b5795b0 100644
>> --- a/drivers/pinctrl/pinctrl-amd.c
>> +++ b/drivers/pinctrl/pinctrl-amd.c
>> @@ -917,6 +917,7 @@ static int amd_gpio_suspend(struct device *dev)
>>   {
>>   	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
>>   	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
>> +	unsigned long flags;
>>   	int i;
>>
>>   	for (i = 0; i < desc->npins; i++) {
>> @@ -925,7 +926,9 @@ static int amd_gpio_suspend(struct device *dev)
>>   		if (!amd_gpio_should_save(gpio_dev, pin))
>>   			continue;
>>
>> -		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin*4);
>> +		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>> +		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin * 4) &
>> ~PIN_IRQ_PENDING;
>> +		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>>   	}
>>
>>   	return 0;
>> @@ -935,6 +938,7 @@ static int amd_gpio_resume(struct device *dev)
>>   {
>>   	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
>>   	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
>> +	unsigned long flags;
>>   	int i;
>>
>>   	for (i = 0; i < desc->npins; i++) {
>> @@ -943,7 +947,10 @@ static int amd_gpio_resume(struct device *dev)
>>   		if (!amd_gpio_should_save(gpio_dev, pin))
>>   			continue;
>>
>> -		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin*4);
>> +		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>> +		gpio_dev->saved_regs[i] |= readl(gpio_dev->base + pin * 4) &
>> PIN_IRQ_PENDING;
>> +		writel(gpio_dev->saved_regs[i], gpio_dev->base + pin * 4);
>> +		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>>   	}
>>
>>   	return 0;
>> --
>> 2.25.1

