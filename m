Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D3234009D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 09:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhCRIFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 04:05:13 -0400
Received: from mail-eopbgr80135.outbound.protection.outlook.com ([40.107.8.135]:61982
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229743AbhCRIEs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 04:04:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQKk/IsY4gw8/4HBgQ83pQhZcqH00iclaWLn8JoPo2VxGbiMfQ6FBTvkG3sEZxwns4KiPE2SEivvGpR7YbEaAYqd1gOKp2rgySnBvtWFJv6bnbf7jxWLyLS0pYDAQwV3JNZhZZv/eGwYovbER1SfFrDNIXH+8Cq+hgur/ANw5Vf2we1VPLxaifNJEPLmv0FYdib7Dt25NNdR+OjDXa97uzTvvwgZrblrLdhytQBTefjt+RzsD2cAaOMh++4bxMwXkq30Gt+Hx5B1t3XDYcdpuyMzYevi53X6CD3jEJVWjblR8dlkbfQ3/I200HymoLi2S5IxpmLcGFYUtWiaFZWzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAL59lNuqx3lFAR0zxz0F+MTjAangVu9TjRzXa4t6b4=;
 b=dUpWJVGV5BlhI+PXVF2mwu7wGXU6gbFZOtn054kdOPnN9Hw4N9EY6V28Z+23ax8K8eEGvocPhuuDginYhgAo/OW0zzCioDXs6FCpILJ69dF8Hmgko6VveG3UyuWrmjGEaj6OeIUQN0tMgE2r0XaXKfPN17r98KLHAc03XRw6QuZd7AONqzR5RoQ/JMWo/63wHlxx50Wi2qZk8gZ1rWB4Rb47LBfmVNZfYKjeRaVWaPkxu2xYSxQBqiOAIp5dnN5w2FnxGcXIxi9hCvzmvhfyRi8TuOmkvjf4mEmH3y6QrhVSVkMh5dRT1FiheLS0rxagpaRxVVWaak3EOqnhtKCYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAL59lNuqx3lFAR0zxz0F+MTjAangVu9TjRzXa4t6b4=;
 b=iestRHcxT5WOXY+pbuzMyt1YQU66BcFJseZrepkxzUYFWKICwbPH5U8UmGdDcDzSTgHlNVh3ZYp7pfSBzPxO2bContoSYLxbsnzZ87M8WtgBvZzopnOeZAnNDKswiMwxiRSSeZ2yTWv4GCXJmhz5d7M/ed0RrAT7FbLz7/mQBNU=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM9PR07MB7331.eurprd07.prod.outlook.com (2603:10a6:20b:2c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9; Thu, 18 Mar
 2021 08:04:46 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::7c49:66bd:9795:1a3f%3]) with mapi id 15.20.3977.009; Thu, 18 Mar 2021
 08:04:46 +0000
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR
 line
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <4d473e20-6065-6ac9-a0a3-10ed095e42a4@nokia.com>
Date:   Thu, 18 Mar 2021 09:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210317155919.41450-2-alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.167]
X-ClientProxiedBy: AM6P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::41) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by AM6P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 08:04:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9956c49a-fae7-46a0-7b76-08d8e9e47e95
X-MS-TrafficTypeDiagnostic: AM9PR07MB7331:
X-Microsoft-Antispam-PRVS: <AM9PR07MB7331BDF5F1A279857D0473EE88699@AM9PR07MB7331.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HC7u2Tr68trxWUWOZkAI6s19igBW8tR9Pu6ANwo0bzoe/S2dgB0A4SOSRdGla46QDsaHZZV4BpWwT7xaJqJxsjX5pgjIOulvFKnUlW3w6UG+F7UlF8/Uu+w4NHwLlkYrv+5+Hj/3YD8bkLdg87Y1WZF0C/dLbl53C7nju79NhPP9AXzrS75uAthwvTL2FTIzYFp7XNIKufVf2m+SjmxG80YKjATR0lQz9MlzNMSKQZcOqLsFptWhdbkvMXaJU8jQ0aDkr4gTYAYuMWgIrk1EDwR+caz59b33oQ0QXLalFopmBtLmt5o9EUzPun6MVZMOnaxpW1rbi4GmCzBDfYlIaDItHY7jfN+JUdUb9ViSR5wtw8/elyk+4oXeV042fCnrpSU3wcCdY380rX3+2Q7f8UAn0fxnCL7QO63q8iS1lv7Gc41llIUqKpyB50xGjmO/cuzRePCngj/1k1+j/BwecV44vwdtTv/AEpBJ5rfj3HwOezcpOT42e9T7BafSaH6FB2AvIc+xn82mcFFeUMb5vQ5AR6pDWWFhd+RJdnFR0vs/QCcSIgw9CFt+Ryk4zx/KnLp0qJj7jxk4FpFnzICWzUCew8XjNa0jZvzhxVPSIbqL8cuQHZ/XKy0Usg3P3t1LzgpBtP3TrCeVnm6FyNPJmIkL9o2Tz+WTKaLnyjk0dFXG0Rlqhcd85PU5YjavL68ZJYziWWqMdkPYEx8G/K/GbiNjDrWfDpBHvUH2c2VIuifI2e4IcOqrnwq+5el2r1/t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(53546011)(8936002)(6506007)(478600001)(54906003)(6512007)(4326008)(44832011)(52116002)(83380400001)(5660300002)(66476007)(6666004)(66556008)(16526019)(66946007)(186003)(2906002)(36756003)(6486002)(966005)(6916009)(31696002)(316002)(31686004)(2616005)(86362001)(38100700001)(956004)(8676002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WXhEbklWbEIrZWVDWDU4aTVqM09PK0pUU3dmQi9oYXphd042WVNtbldwNkR2?=
 =?utf-8?B?eHQ0SHpHMTE3RjNTTmN1dTFyUjVZTlFhS0tISjJwRHVUNTFIRDgxR1pJeFpr?=
 =?utf-8?B?STh6K3RrNE5aRGtJclFiT0RCeXlHWUxaYTRsR29oSzRhNFpBZ2dBKzhWcTRT?=
 =?utf-8?B?S1FmSldFNTE2T1BBdFc0dlZVTURzdmNrQ0UwSHgrVTM0TDFEc3UyZ09NT0gx?=
 =?utf-8?B?QVIybmM2VHZ2VWxmUVBDMmx2OEp1bFEveU9oMVZmbWNPK1FMbFMxcWZqMnRC?=
 =?utf-8?B?c3B3bm1jc3FLeXZucVppNFJxaUhRc0tnWGc0YUl0T0RxRnFlUnJyQ09IZTIr?=
 =?utf-8?B?L3dGdDNqcDdNa0kvNnZiUzNmS0FETlN6K1VvcWpkY2VHTEtROHFHcVhxaG9P?=
 =?utf-8?B?a0s3ck1vWlBjVzFXTElXQXlFNjdVemM0eUZHWG1PV0hJeEszcUJFQWtHNnlH?=
 =?utf-8?B?bURiV0p2YVF1ek1sVmdvQ04zSERya0pOcml3NHdIQkQ1RmFhOE5pVXJnZXVk?=
 =?utf-8?B?czBHQmpUTlZNbDFmTDdTcmZ4NHNmV0xtYnNWZVR4L29oYXFZQ2hqZVhQbmJo?=
 =?utf-8?B?VkVwbVRLOEV0NHpNUGVuRmpObmVPNUZaQ2c1Z3lCa3RmVHVlaG92aDhDVlZu?=
 =?utf-8?B?L0dub25rRExRM2V3bTQzZDhqR0JQcnpRT3FTU1cxdFNWOTBGK2x1YmEvcXlP?=
 =?utf-8?B?alIvaHEvajYzRklSVUVBSDIvVWdSUEhROGFWaC9IYnZIbmE5ZStiVFoxOElS?=
 =?utf-8?B?R0NQZVV0dGJXdkJ3MDcrSlJXbDF0NXhOcG9wSEErZVF0SjAvYlhiN2FjdkVC?=
 =?utf-8?B?cXArbzdFaUJzVFZzbUdTWG9pNm84YUdiQjBIQUF2R2ZmSTA4ak0zTk1LWUc4?=
 =?utf-8?B?VHdLYngyR2R3UVBNb3VxNzJPNmROTEtIY3d4SnZKejhvekJSeFd6UzhZb0NC?=
 =?utf-8?B?djBPaWVoaTZqa28ydXJpSWhRY21xM2JpMTV4bDlWTXdRN3NHdHRtZXgrV3BM?=
 =?utf-8?B?Y2x3MDZORng0bHpTOW5mOWxIeUU0UFpYTGNFTVA2U2lxeTJkdXVkMlkxTTMw?=
 =?utf-8?B?ajhudFBDNFU2bG1nU1pJQzdxWGEzcE5ySlYwYzF6RzM5TFBKTjdoSHliS21i?=
 =?utf-8?B?eTZ0V2JGYkFBOGQ1VG94Z01LdzM3a3M2YkFzZUJlUzZEZVMvRzc0am56NURE?=
 =?utf-8?B?aWdJMVgzZ0VNQjJ0QjYzbHQwem5Ea3UvbDl3S3JmRzRhQ3ZFTnM0YzFTNlhU?=
 =?utf-8?B?MnFNOGtBZER0T0Jzck9aamJWa25QenBLWFNuYTg0NlpMSnRTMFZpN1JQWEJV?=
 =?utf-8?B?RjhrKytBeVR6Yjlkc3pYVHd5NUwyakdDdFROQkE3Vjg2RkpYcFF6MXZieW95?=
 =?utf-8?B?K2s0cXVJQTh1bHd5TTNRSHNkVkNkUGhZb2lwQzh6UTc2L0x5QkV0YStqVlEy?=
 =?utf-8?B?YnoxakMvK3VETWEvdlgxSkZITkhTQlBBWjFzQk52YjkvNk5zVDU5bFpzQVZv?=
 =?utf-8?B?Um1PTm9SQzNrMHF0S2RVd1FheGFkNHVtR0FGQTVZSDBMOXpxV3B5SlR0Qzg4?=
 =?utf-8?B?UHhPNFpMMU9EMW04RjdlUmxoR0tRMXFBdzJNMFpMV01tU2dOSVhnWUNPdW0r?=
 =?utf-8?B?dUhkMXlMTUtPTzJDbDVTUmkzYTl3YzBPREpVa0Izd2RVaWhrRDRvVTRUUS9h?=
 =?utf-8?B?RlhOblhCQ2IyVnJNaTF2bktFSGlxd2ZvQ1hyT3orOEprV2RpYlRjcmtGY1N5?=
 =?utf-8?Q?MsfmUXoe5S9Ijw52ZuDhhZmZcBN4M/UwkLsWBYU?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9956c49a-fae7-46a0-7b76-08d8e9e47e95
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 08:04:46.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPH1JOOFmYJi56Z9/CaiWTtJ4uPmIaDnWoY7nrhudmpnachDcvgNYOlI3k6qTKIp2U3v9nNxrkdFQZTM8ktSgm8bMwATXHVGAh6cFUsd2ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7331
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello all!

Please ignore the below patch, the implementation is incomplete!

On 17/03/2021 16:59, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> There are several implementations of PL061 which lack GPIOINTR signal in
> hardware and only have individual GPIOMIS[7:0] interrupts. Use the
> hierarchical interrupt support of the gpiolib in these cases (if at least 8
> IRQs are configured for the PL061).
> 
> One in-tree example is arch/arm/boot/dts/axm55xx.dtsi, PL061 instances have
> 8 IRQs defined, but current driver supports only the first one, so only one
> pin would work as IRQ trigger.
> 
> Link: https://lore.kernel.org/linux-gpio/CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/gpio/Kconfig      |  1 +
>  drivers/gpio/gpio-pl061.c | 46 +++++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b8013cf..6601758 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -426,6 +426,7 @@ config GPIO_PL061
>  	depends on ARM_AMBA
>  	select IRQ_DOMAIN
>  	select GPIOLIB_IRQCHIP
> +	select IRQ_DOMAIN_HIERARCHY
>  	help
>  	  Say yes here to support the PrimeCell PL061 GPIO device
>  
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 3439120..3c70386 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -282,6 +282,23 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
>  	return irq_set_irq_wake(pl061->parent_irq, state);
>  }
>  
> +static int pl061_child_to_parent_hwirq(struct gpio_chip *gc, unsigned int child,
> +				       unsigned int child_type,
> +				       unsigned int *parent,
> +				       unsigned int *parent_type)
> +{
> +	struct amba_device *adev = to_amba_device(gc->parent);
> +	unsigned int irq = adev->irq[child];
> +	struct irq_data *d = irq_get_irq_data(irq);
> +
> +	if (!d)
> +		return -EINVAL;
> +
> +	*parent_type = irqd_get_trigger_type(d);
> +	*parent = irqd_to_hwirq(d);
> +	return 0;
> +}
> +
>  static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>  	struct device *dev = &adev->dev;
> @@ -332,16 +349,31 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>  
>  	girq = &pl061->gc.irq;
>  	girq->chip = &pl061->irq_chip;
> -	girq->parent_handler = pl061_irq_handler;
> -	girq->num_parents = 1;
> -	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> -				     GFP_KERNEL);
> -	if (!girq->parents)
> -		return -ENOMEM;
> -	girq->parents[0] = irq;
>  	girq->default_type = IRQ_TYPE_NONE;
>  	girq->handler = handle_bad_irq;
>  
> +	/*
> +	 * There are some PL061 implementations which lack GPIOINTR in hardware
> +	 * and only have individual GPIOMIS[7:0] signals. We distinguish them by
> +	 * the number of IRQs assigned to the AMBA device.
> +	 */
> +	if (!adev->irq[PL061_GPIO_NR - 1]) {
> +		WARN_ON(adev->irq[1]);
> +
> +		girq->parent_handler = pl061_irq_handler;
> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +		girq->parents[0] = irq;
> +	} else {
> +		girq->fwnode = dev->fwnode;
> +		girq->parent_domain =
> +			irq_get_irq_data(adev->irq[PL061_GPIO_NR - 1])->domain;
> +		girq->child_to_parent_hwirq = pl061_child_to_parent_hwirq;
> +	}
> +
>  	ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
>  	if (ret)
>  		return ret;
> 

-- 
Best regards,
Alexander Sverdlin.
