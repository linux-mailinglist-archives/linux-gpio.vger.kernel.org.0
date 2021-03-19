Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EC3342100
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 16:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhCSPdb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 11:33:31 -0400
Received: from mail-eopbgr30134.outbound.protection.outlook.com ([40.107.3.134]:29665
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230108AbhCSPdA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 11:33:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkQ2yE3pim0rukSRqacr3byQzCKIVUhdBHgPBajimWEYQrEQNI6ZLSxBHb3gfxxreADZbS4WkTYJG356jDNV2TqBIr/8qjrH9S1dmc7BfD21ps73zaRiiw36CiYDaiNlXn8DZId4ixaDfuWMvCL40T93Tk6Dr65SDt2J2VtzaLtHcvkZSoI55Q6zgdp2oOxjSHvFQ6mzInGe4QZrzNpylWvik2Gi4+buYemHIt/NSpiY3UHRnV7ddrr/s+ucHyXlY7akA0DurI07ZupLDgCAXR/vMxgee8NHSRmS+6CXJyHPNmK4CiUfiLwpnMCLG7MUMZj6luyB4QugBY4KUsUG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKpTZn9s89zvYF1U1e9DX+oh19ti20ZvCuD9UkV1sOY=;
 b=QyVZpNLyEnvpX6YwiZQCPUDfUIsiaZnmiFilUlUThEvfu15OAR58Iw/Mf11jK3E/0ak9lRmvkf4QVhhof7swY0Q0LBSq+EcQKyDFvwGs5qSB4rogv8eQYXfczx4aIw/34ALq/DSb3D5KIhkpHSTfU+YJtXRmfOyjOSYViz2BYEYldnZQOLIdJLiMRbqjMxZWyWfh+LbAY93j/lDX6XuvwPdyqc8mAcTdfhCZ7gzle9T8lTjnvzfwrbxKVb58U7xxE7MvcDg+0/atWJFUllKOzqRb83Vy6A0qBP6wCIqlVU30OS0+UK2Qqu2u5w9NuAWoLmOg5DU59qHmmKR/dCvmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKpTZn9s89zvYF1U1e9DX+oh19ti20ZvCuD9UkV1sOY=;
 b=Said+4VW40AVaWtLosT9GMS+RBTz/JHC8H2FC0iBFrkPBMpKhuSBYm3G+C6ZBtM8OTVqGz0iAZPuQV6bejQI8ndq1dFaLi1ZioqQ1qhosYmlerkIsZ3uwvbDRmMykLhLbrUDplAbzJJE+lXU91tCvaUeHtlAiSW9+vt4z8dZUQQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM0PR07MB6274.eurprd07.prod.outlook.com (2603:10a6:20b:152::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9; Fri, 19 Mar
 2021 15:32:53 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f%3]) with mapi id 15.20.3977.009; Fri, 19 Mar 2021
 15:32:53 +0000
Subject: Re: [PATCH v3] gpio: pl061: Support implementations without GPIOINTR
 line
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210319131205.62775-1-alexander.sverdlin@nokia.com>
 <CAHp75Vc=HnafsnnJYceBB66k+r9NcZqn7mxjdsc7dsQd_tK=LA@mail.gmail.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <028a836c-9343-f08a-3f1b-22e45f291d1a@nokia.com>
Date:   Fri, 19 Mar 2021 16:32:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAHp75Vc=HnafsnnJYceBB66k+r9NcZqn7mxjdsc7dsQd_tK=LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.168]
X-ClientProxiedBy: VI1P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::30) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.168) by VI1P189CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:802:2a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 15:32:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80be8189-19b5-463d-3dfa-08d8eaec4321
X-MS-TrafficTypeDiagnostic: AM0PR07MB6274:
X-Microsoft-Antispam-PRVS: <AM0PR07MB627442FF716F39997013D05788689@AM0PR07MB6274.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1kfyVHB/ppbThBOIHSrDx9Ohn4rKO72eogiyedChMgyIX+Cz2TIxEilLFgI0CE5EiJCUYx9qGq2djWsPfJEP7Pq1ATU1lT0LT89j3Pv28bUf+pd9YcDYoRgP+MChVkzSs2uWSjY7tuYhERGsR36XDFt+1dOu+dRpdyXFDWK+pnw5HYXSGpca5dG8J1lMqtV+kkySrYotGhRoZecOkdiXrjSHM6z+XDMmBwtGpVxFKNGg9Zds610zGUlh7HB/Z+mwJ6ALbcqE0hIZ1+f74pyreVJW6edKQD+TQVPOF0mADTiBRg3z1TupqGGexLEVknNDnftZ/LyxnK9YYJefMcVavSKdcwGz/6cSpt3Ho/Ckx/el486LcGhDX7Ez/onfGVhqEclxLyz5V6tu++cLxpr9vI3QelKPlUB1cOwS9GBGdh1vemki6Xby5P8awqx5j6A73NJLjUEpiK6vbxVri/dXEY1p3Jgx7kvyQfw26QHabrNo/CDU9dPJA2KdXTLayBoHZCRKRep0p9EEXcQtA0xxG1KuQjVUzKcfxUty3Rlr2M0Rji4CrpnUz5l67PAr8tuonGQsk8UKpKwLCA6CJDhpQB1ZkZfklvH8UsEvsuazKfKmLgVMrIarluDSERrIOvIzHKrvZa4rv9Aptt2Sl558amauyOe0AcHAwK8GrkHsyivY3GVkCT5gAGZa2m0FnXSkhPw8jSw8XtP+wuZm8MeAvQXK3qXJTBRA0mz+lQ6lWm6flCjfdqOCBELsi0isbxpt0pnlBpIvcomxqzoguMi4kizFFU97fqegHyXX/96t/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(31696002)(44832011)(8936002)(5660300002)(54906003)(316002)(38100700001)(66556008)(6916009)(86362001)(6506007)(52116002)(4326008)(31686004)(6486002)(36756003)(966005)(2616005)(186003)(16526019)(26005)(956004)(478600001)(6666004)(2906002)(66476007)(8676002)(66946007)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmtQRVE0QWtEclUvaVVwWW5TeTB4M1JUSWJvNlRrRENNOHlleVltU0pnUExy?=
 =?utf-8?B?WXNDTzhxUXNOUlN3cE42WWZnYlRRSmx3eHNNVTF0NEI1NWNYMHJSZDFNS1dY?=
 =?utf-8?B?b3VQaEtsdU5VV00yamVGbVNoYjZnWVdpU0RiVHJtZ0tpOEhhMXFBcHorSFU5?=
 =?utf-8?B?azE2REljNlM1b3BFL2NDMDM1MStuODl1ZkE3dXYwS01sRGM0bnpya2tRVUVt?=
 =?utf-8?B?OTdlK1dYTVhqMVNGT3AySDV2dWZaVjFDS2xiVC9WbU5IZWg3eHduQW5tc0Vx?=
 =?utf-8?B?aGVIcklHQmJHWlprSmRFdnFRMjRTVlZ4TFNCOWpyNC9hZ3RteUFTVlFYRmZp?=
 =?utf-8?B?MVNlQVJLVWVVc21XZ3RabUx2Ulp1Q2JhaFNjcXRMejFQVjh1bTdJVzF2NGd1?=
 =?utf-8?B?b1pJQ3MzWWdoeXN6QzNmOW5CRE9yVXVqcTl6SUN0M0poQ2R5dHNpazZkeG5k?=
 =?utf-8?B?dk1vQVdncDRFbTNyOWJzUGdsbjQyUnZRdEJjUTJYUXA2bmdjU0h4WG84SFVO?=
 =?utf-8?B?WVMyRjZnaldtbS9zcFRVd2hzeVBFNndxeGtpSkVkUTJnSEtFVmp4NVczam1i?=
 =?utf-8?B?ZnFqVEgzZVMrQXAzYTY3eEJLcndsOVZTTjRMd0k3QWJwVkFxN1FhUFBrczFX?=
 =?utf-8?B?aWl0aVlKM2I0bTVuUFJPY3RsTnFTZVJ2R2IvSlQ5MmdBYVYzcUtFWFRNR0Yy?=
 =?utf-8?B?eE9SdkxGb3A4OTdjamh6Z2puUTVtWGdwMTFFSTRHR0x0SDZpc2xSbzNheTdt?=
 =?utf-8?B?RTRFVVRkV2V5OGNiQTArR3Z2djdjMFFBV1IwbmJUZmRkNmdwcWpWK3RNM2Fp?=
 =?utf-8?B?V3NJcnVQU0M4UEswaVlMeHFUdkMzTVpzSGIyQm1oZXJwRU40VUZDWUVNa0p2?=
 =?utf-8?B?VkZNdUlKejBZaFZvRS8vTFBZc2lQS05oMElTMHgrWHVCdEswNm5NUm5MTlFr?=
 =?utf-8?B?ZHhBUDhLUTF1TEd4b2Q0UGFiVW8za2pGaEhnb2VoTWp0NFA5QmpYSkIwQzNt?=
 =?utf-8?B?R3hhU0RabHl0c1l2ZlRYbjdtb1FXcXV0cnI2eHNCVWk2eVcxMHpkWTBBRjJR?=
 =?utf-8?B?aklxS1NpMnJMNjY3RnZtWk8xZlBzV0hmaks5TkZhVnpOd3RuVXFJZlBocU1L?=
 =?utf-8?B?WEttSEEzaTJKYTQvNXl6MllkV0xxYTVHU3FUcHI2VFBucmUrMGoxbDBXOFJp?=
 =?utf-8?B?SkN0SjBDYnh2K3Z1KzBzV0tlK01wUUNxcXpxdXdQQjQ1aVc2S1lxZmw1NXZm?=
 =?utf-8?B?QTFRUGhTSnNZQlpkSmRFSVJTUEpQTUJnYml6TzBRUXlHUGtLSG8vUlUzQ0Qx?=
 =?utf-8?B?RkRHRC9VRFdKSlN4T2d5Z2hKWHQvZ1NhR2F0UXpMQlNBNk5hczZFR0VwVnZE?=
 =?utf-8?B?TjB2OEwrSzg2UG1FSmh5eTliK25ubUZhbERhdDhEcjViQUppRS9xSm9VYWJT?=
 =?utf-8?B?bVZNbGVCdzJLYlRXOGJSSWtGdWZIUjU2TEgyMHY0OG1mZ01NZUt2enVNOU5Z?=
 =?utf-8?B?YWtnVTk4dGdRSUd5OUFlcWlaT1JiSjJOc1NDVHBvN3ExV1dNTVN3YXlodHhS?=
 =?utf-8?B?T3BLTUxUQUx5bUZkVGRJNVpPVGswSURCZk9NbmtwUkN2V2tuQlExTFc4blpt?=
 =?utf-8?B?RGhYelo0ZHFCUHpScG5RaS9ob3MwejRKQkpqb1dJZEdJdGl0VVdGWVZOMitI?=
 =?utf-8?B?eVV2LzdyMjNqN0NEdnA3Zjl2YjY3L0xYTWd1NW5YZlBpeEQ3aTBLOUxRSWlr?=
 =?utf-8?Q?n3anTaM7qWy9NxED2nlN8lplD+RNyLzNQ2053/H?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80be8189-19b5-463d-3dfa-08d8eaec4321
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 15:32:53.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpTh9/3a6uKbpxVUlcCsbmub/4wnOACsInYbVpYHeFBcRWWRSQjMtpDxFudAAGG29WSR7n3V5Mj1j/BSsx8odOOHUILBMX86ZwTRl+ucqm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6274
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

>> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>>
>> There are several implementations of PL061 which lack GPIOINTR signal in
>> hardware and only have individual GPIOMIS[7:0] interrupts. Use the
>> hierarchical interrupt support of the gpiolib in these cases (if at least 8
>> IRQs are configured for the PL061).
>>
>> One in-tree example is arch/arm/boot/dts/axm55xx.dtsi, PL061 instances have
>> 8 IRQs defined, but current driver supports only the first one, so only one
>> pin would work as IRQ trigger.
> 
> an IRQ
> 
> I'm wondering if the GPIO library support for IRQ hierarchy is what
> you are looking for.

do you have a better suggestion? That's why I reference the below discussion from 2017, where 
Linus Walleij suggested to use it. Well, the initial patch was just 11-liner and PL061 is
rather counterexample and doesn't fit well into the existing hierarchical infrastructure. 

>> Link: https://lore.kernel.org/linux-gpio/CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com/

[...]

>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -469,6 +469,7 @@ config GPIO_PL061
>>         depends on ARM_AMBA
>>         select IRQ_DOMAIN
>>         select GPIOLIB_IRQCHIP
>> +       select IRQ_DOMAIN_HIERARCHY

-- 
Best regards,
Alexander Sverdlin.
