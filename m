Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99274328C7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 23:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhJRVMZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 17:12:25 -0400
Received: from mail-mw2nam12on2048.outbound.protection.outlook.com ([40.107.244.48]:53729
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231883AbhJRVMZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 17:12:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqhF0QrAaNQq99VXFxOSvfDLC6ksNwwBimLwQoQRrYiE9JOh7BTmNOWHX8PGL/tFIE4zximQcSRaRp9Oe5wb5nvvTfVbK9vGYObL6XloKdkxwKrfOWZAknilAXY2761Eh7py6VFQufhNn7MZvnNH/GCcAtza1x+bFeUiEWxgb8dD4W1hkQfxtZIz9q7SBQ6K0NK1aKp9898a6zQZ1o6FeTJ5oKRbGhlP24CNz0jCX93qBtbvZFF5bz5+UVbNTGodYUq864vJAADuw3wbjyS5fIKZ6p/Q3X5Ajp+Pvn7EmbI+gT7QWDNAQCwl9bXBWlwLDoF3+ieRYOu7Oom4EuYMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acxwY8MQLHivgI64s82BtYiRyUHYUbc3FTmcu08lTlw=;
 b=iTw+Qga73IBkDcfRAI7XySnk94F4AQRJ0WHpC2nDjVqLuSJbDpt9lpVy4GIDnsRfBm37qBlbVTwtJfu1msODp68ou485igrsd0ctDHHpV/bA1nc+WIZz8TDotN54uns2wSMPCvILjU2FlfHx/gw23wOCN6osFFnJy7NspJssUWEkUIXDyZuycSXoNc2w/feWaJvAHRTunRO4mqRNFH5O2LFN5C292sJxXFVdzTS9movmClaGWMBYmlH0uAN6Wt9rGzqnZ+gi80Gu+es0S73u9BHr5SHWNALSIosLtM880ew/03LWIajuiYM4RrZru4MtsIdI+VHTWfeX++knR61tWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acxwY8MQLHivgI64s82BtYiRyUHYUbc3FTmcu08lTlw=;
 b=iCZRg0U46SZnOjIeVIrVLR8XR5nMW3KrY7QBh8AV29hOm16ZS70RzxqqoqKqWbKpTwx3RnwZ67oY8WLRAfuFPbBUWcEB5T3PbleqcxWVHU230DrukinYIEz0v1ej/PLt+2/xJyH6ZSFffR1sJanqk3cv/86tuRPSOJRbl55EdCs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 21:10:10 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 21:10:10 +0000
Message-ID: <48df5717-cf83-cc28-2f0e-f38baa96a2da@amd.com>
Date:   Mon, 18 Oct 2021 16:10:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] pinctrl: amd: Fix wakeups when IRQ is shared with SCI
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
References: <20211015144332.700-1-mario.limonciello@amd.com>
 <CAHp75Vfx0uyOgP7q7cs=VNaZC1_hWkdMy8VFw_MpXbaYJxSmFQ@mail.gmail.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <CAHp75Vfx0uyOgP7q7cs=VNaZC1_hWkdMy8VFw_MpXbaYJxSmFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:806:a7::14) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
Received: from [10.236.178.93] (165.204.77.1) by SA9PR10CA0009.namprd10.prod.outlook.com (2603:10b6:806:a7::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 21:10:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72383a49-a871-4259-38f2-08d9927bab24
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2542128E51422D38491667F3E2BC9@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZdYcwJhG3p7QwYBFRwuUtlYlRfqpRux8hvOcueVQQZytbs8PpE+05mzh8UM2l7Qt/AopIrUsoJrvI5GAQKiE8UZ8lTed4lvT0LmrFZMezAjqBIBzLOdTNOpVicbQk0ictoAcgnxxYVWAjdq/3qvYNxmdH2jozrYbJjv0dKWRfEP6KIMTPfEhpthOFW1o/X4gWv4bhpHb0SCd6TZEcLRWMQNtvPc5hJc2zuUDBmMiJT7UbJB0NXMmSwR3mR5wsPX9LLrXkXNPixk6AvYEadcw84xNjNnVLG98BOA5b6ZWsQNUCzYVE/cZ55S/yK31y5aP1Z9agm8QZa5D1eZ6dyChdIUDmIEHb2FGLz5JNJ8xEgOS11P0YAgtpMySH4fcK57HQqFBXYTFl0Dyl7JbeJCrV4QqF0IBEOmVB5lyEshXNI7p2/vaqfHxBBjyaND3OV7QmNbbN7ooHfKxDKERdiTwIuMaYFEyiH1ZLW8Fkf1I8tm1wSiqXi03AfFioYX9aU8PgT38i2CoikRzF4CDXMpMyBif+2L5DPYWaRuNgOr1Xn90LBUDTFSSLdipfIkJbYXUGFri2yoW1UYcQPmZfNnDcnKUmuXRDf6fV5pjmmNxXZCb/AaPfooZRNOSas/7A4Hr33eJreKcAhC3XYTukr/X0b6lAJ3AO/J7oPueC1oaDZ6GKvF8E+a3JJ0QOqGWGJntxQejh9MLp7KMn/OpHGdiWjwDm83Ay7TmKKfUyZqV7po=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(16576012)(2906002)(66946007)(956004)(66556008)(8936002)(53546011)(54906003)(2616005)(86362001)(45080400002)(26005)(66476007)(966005)(4326008)(8676002)(6916009)(5660300002)(36756003)(31686004)(186003)(38100700002)(6486002)(83380400001)(508600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjBLLzd3bVI2Nzk1VXJScHVQeG9PSTVleFR1MTJ5eVF1cndPcVE2SDJTY2h4?=
 =?utf-8?B?QWFmSzFxQjZsYk9kMUVQUFNMMitMRFp1cy9ZWUMrbkRkUFNFdWpkM2pGdGU5?=
 =?utf-8?B?dHBkNGVLdGxvUGppU1k4c2UzMWVRQzcyUFJmc216QlpyUVlYMStzVS9NN1I0?=
 =?utf-8?B?ZnV5Y2V3dGVsTkFtRFhzczM5QlpRRnpFUFM0TGNSR2oycys2bGhnU3c4V1p6?=
 =?utf-8?B?Rk1IY3VEQ0o0eittenNVUnN0SWNsR0owR0dHWkltK2ZIbjZtVjZ6cHl3UEJP?=
 =?utf-8?B?Z1BYakROYmx1VFhveXdXNnpoRjMyelgrWTExdi9ERGxHb3BDcWxRaDVad0NK?=
 =?utf-8?B?cHpPNFBFc3dteWt5QWY3UThJeFhlMFBpYWRPR0szalJHcGVyc21Ud0pPa2F2?=
 =?utf-8?B?VFhGalBZcXdCakpQWmU4aDJFR3ZxMmxzOHk0ZTVTL3V5VmgrL3UwR1lmd1Zh?=
 =?utf-8?B?NEVQL2o0QkgxQWxWcTRNYXphblZFMW5oTXA1eklyVEhjdkJFWkt3S29PUXMw?=
 =?utf-8?B?NGJIbjQvUSsxUGxvZ3BZbXIranplaW9lcU9jZlRwNERrekdERXRtUXBMNXRm?=
 =?utf-8?B?dGc1Z3BkbVkrTnUreXRNZjZZWUV0eTVub0o3TXdjQW4vc3lVd0RnWXVsMGZL?=
 =?utf-8?B?SFQrK0xObTUrbS9ZWm1VUTVZcWdQVUhNUzB4SlJCV2ZJOGxQME1obDdCcFp4?=
 =?utf-8?B?UHZ0REhIUkw4Sk9YRDZtRkJsU3FjaFJrZ2gwTU1OWFAwcTkzRldzZUVXUm9W?=
 =?utf-8?B?Qk81clRZMWRubmtvcnFPd1FFc3hKSElva2hjVlpBeVFUK2l5UUlOamxud2Q3?=
 =?utf-8?B?VEdacmd0MHI1REY0dFRzM0g5ck92cVZxdmJhQnR3T1RKb005bEhSczlMSUVR?=
 =?utf-8?B?UVIxeWdnbUkweGw4c2dSZ1VrRk9VU3MzSHcxUHltTXNQOCtjbGVPc0FEWnBS?=
 =?utf-8?B?dU9yRFRJdVZ2TDBGYXFuU1hlbXk1R2w1RzVDMVFUZjFrWnBMblAxNVJvb2hs?=
 =?utf-8?B?bFp5VDNFZHpmL1BKbzJKc0NtM0dOVGt0VS8vNEhMTFk1ZnovUHVTR1gzdXp3?=
 =?utf-8?B?Wi9zZVBGQlAyenowMzhJdm9VbjUxWHBxNldDQTVLcTh1dXBpZGlJSXVXcUpm?=
 =?utf-8?B?TUNJVWpRaXVkeCswMFluYVVEb1J4UHlJcHEraDAraTVYZCtoUkUzbGQzME9a?=
 =?utf-8?B?TGlXb1ROelF1dEZ4MXNhRkR3TTVSMXdYc3FYdHpPOHh6elVkVHE1VlhjcDdw?=
 =?utf-8?B?d2RhWkxtMkFuR3R0ZWdKajJoL0E2ejZqRHE5WXg2aVhBYUZVWlVvSXJOOWNU?=
 =?utf-8?B?RUV5R2ZnQlJqUlVMUllLalM5SWRvMmE1aUVhSXcxcFY2NVJpN0N4VnF0UUdx?=
 =?utf-8?B?NkoyTld3TVFHWHBsMTR6MkRhRjYrTHREc3UzcDBhNDgvS042T3doKzFwSDdI?=
 =?utf-8?B?K3o4ME1NRE02V05mRE9MSEVFTDU2MmFsa2ZwbTBDVStrbW8wbUI0WHNXSllm?=
 =?utf-8?B?RmJRRlJGNDFDUnpjd2E2dWRwY1o1VDZaYkRIN2Rlb05aQlFTb1o0Qjl6S29o?=
 =?utf-8?B?TFIyMlgySC80dEk4OFUvV1RZUGpCVXRvWDUzb0hhbjRLRHY4Y1NNWWRXV0xX?=
 =?utf-8?B?V3ZjN3JXc1RqWWNaVlhJM0lnZnlnNkZncjF5Z2l0VTVlMXZsSktOMjZVUXdh?=
 =?utf-8?B?dTZvTWpzaE5nK0hPdW93YXgvTmdacmkvVmRZQ1loblFsQmpXbmNkcHo4eFhr?=
 =?utf-8?Q?fHqwT8KRJlT6MENA27wa3xbwtewF0yuPw9FKQht?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72383a49-a871-4259-38f2-08d9927bab24
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 21:10:10.1557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iy43O6nsjlX/4ANpRg1nFEaXQAgU97yVtR0ZmSLCVVE7VSy1QCftabZenjLkU/777ZC9/zeoYUuib6vOjvGnKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/16/2021 13:22, Andy Shevchenko wrote:
> 
> 
> On Friday, October 15, 2021, Mario Limonciello 
> <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> wrote:
> 
>     On some Lenovo AMD Gen2 platforms the IRQ for the SCI and pinctrl
>     drivers
>     are shared.  Due to how the s2idle loop handling works, this case needs
>     an extra explicit check whether the interrupt was caused by SCI or by
>     the GPIO controller.
> 
>     To fix this rework the existing IRQ handler function to function as a
>     checker and an IRQ handler depending on the calling arguments.
> 
>     BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1738
>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1738&data=04%7C01%7Cmario.limonciello%40amd.com%7C1c5f3ad58d0341eff45408d990d1f3b4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637700053699095015%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=PsivJX46L3Msg6QfcOvlKz0ickWoqwvM7oR5hZp2oMg%3D&reserved=0>
>     Signed-off-by: Mario Limonciello <mario.limonciello@amd.com
>     <mailto:mario.limonciello@amd.com>>
>     ---
>       drivers/pinctrl/Kconfig       |  2 +-
>       drivers/pinctrl/pinctrl-amd.c | 27 ++++++++++++++++++++++++---
>       2 files changed, 25 insertions(+), 4 deletions(-)
> 
>     diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>     index 31921108e456..bd67babe9e87 100644
>     --- a/drivers/pinctrl/Kconfig
>     +++ b/drivers/pinctrl/Kconfig
>     @@ -96,7 +96,7 @@ config PINCTRL_AT91PIO4
>       config PINCTRL_AMD
>              tristate "AMD GPIO pin control"
>              depends on HAS_IOMEM
>     -       depends on ACPI || COMPILE_TEST
>     +       depends on ACPI
> 
> 
> 
> Stray change?

I had thought the need for acpi_register_wakeup_handler would force it, 
but compile checking it appears to still work with:

CONFIG_COMPILE_TEST=y
CONFIG_ACPI=n

Will drop it, thanks.

> 
>              select GPIOLIB
>              select GPIOLIB_IRQCHIP
>              select PINMUX
>     diff --git a/drivers/pinctrl/pinctrl-amd.c
>     b/drivers/pinctrl/pinctrl-amd.c
>     index 8d0f88e9ca88..f228e1dadef9 100644
>     --- a/drivers/pinctrl/pinctrl-amd.c
>     +++ b/drivers/pinctrl/pinctrl-amd.c
>     @@ -598,16 +598,16 @@ static struct irq_chip amd_gpio_irqchip = {
> 
>       #define PIN_IRQ_PENDING        (BIT(INTERRUPT_STS_OFF) |
>     BIT(WAKE_STS_OFF))
> 
>     -static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
>     +static bool _amd_gpio_irq_handler(int irq, void *dev_id)
>       {
>              struct amd_gpio *gpio_dev = dev_id;
>              struct gpio_chip *gc = &gpio_dev->gc;
>     -       irqreturn_t ret = IRQ_NONE;
>              unsigned int i, irqnr;
>              unsigned long flags;
>              u32 __iomem *regs;
>              u32  regval;
>              u64 status, mask;
>     +       bool ret = false;
> 
>              /* Read the wake status */
>              raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>     @@ -627,6 +627,12 @@ static irqreturn_t amd_gpio_irq_handler(int
>     irq, void *dev_id)
>                      /* Each status bit covers four pins */
>                      for (i = 0; i < 4; i++) {
>                              regval = readl(regs + i);
>     +                       /* called from resume context on a shared
>     IRQ, just
>     +                        * checking wake source.
>     +                        */
>     +                       if (irq < 0 && !(regval & BIT(WAKE_STS_OFF)))
>     +                               return true;
>     +
>                              if (!(regval & PIN_IRQ_PENDING) ||
>                                  !(regval & BIT(INTERRUPT_MASK_OFF)))
>                                      continue;
>     @@ -650,9 +656,12 @@ static irqreturn_t amd_gpio_irq_handler(int
>     irq, void *dev_id)
>                              }
>                              writel(regval, regs + i);
>                              raw_spin_unlock_irqrestore(&gpio_dev->lock,
>     flags);
>     -                       ret = IRQ_HANDLED;
>     +                       ret = true;
>                      }
>              }
>     +       /* called from resume context on shared IRQ but didn't cause
>     wake */
>     +       if (irq < 0)
>     +               return ret;
> 
>              /* Signal EOI to the GPIO unit */
>              raw_spin_lock_irqsave(&gpio_dev->lock, flags);
>     @@ -664,6 +673,16 @@ static irqreturn_t amd_gpio_irq_handler(int
>     irq, void *dev_id)
>              return ret;
>       }
> 
>     +static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
>     +{
>     +       return _amd_gpio_irq_handler(irq, dev_id) ? IRQ_HANDLED :
>     IRQ_NONE;
>     +}
> 
> 
> IRQ_RETVAL()

Thanks, will change it.

> 
>     +
>     +static bool amd_gpio_check_wake(void *dev_id)
>     +{
>     +       return _amd_gpio_irq_handler(-1, dev_id);
>     +}
>     +
>       static int amd_get_groups_count(struct pinctrl_dev *pctldev)
>       {
>              struct amd_gpio *gpio_dev = pinctrl_dev_get_drvdata(pctldev);
>     @@ -1002,6 +1021,7 @@ static int amd_gpio_probe(struct
>     platform_device *pdev)
>                      goto out2;
> 
>              platform_set_drvdata(pdev, gpio_dev);
>     +       acpi_register_wakeup_handler(gpio_dev->irq,
>     amd_gpio_check_wake, gpio_dev);
> 
>              dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
>              return ret;
>     @@ -1019,6 +1039,7 @@ static int amd_gpio_remove(struct
>     platform_device *pdev)
>              gpio_dev = platform_get_drvdata(pdev);
> 
>              gpiochip_remove(&gpio_dev->gc);
>     +       acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
> 
>              return 0;
>       }
>     -- 
>     2.25.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

