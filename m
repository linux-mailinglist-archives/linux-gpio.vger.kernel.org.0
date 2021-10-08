Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7904270A4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 20:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239741AbhJHSVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 14:21:16 -0400
Received: from mail-dm6nam12on2063.outbound.protection.outlook.com ([40.107.243.63]:62689
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235604AbhJHSVP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Oct 2021 14:21:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyIazTYGmPYr7p1rSwD1Fa51zfezX5v+13Baun6eywdEAD0fGZGdNy8+LIc/AzaLEqcQeLXJ6J37OBzKV4IbT8ju54YouSH25wD3xFoto+gNGDUhCbNtxTYY2aOPBasodQlw5JpNrseM3AQLe7tKtYRTgjoZk8YvGRLARlbf5oRcCAZcBCDOg2dEi6EHBHCKWnEU89lsU+3TsmGnVYJzM9sX7z2NzUm/OCds7RXyq03TvQXnBvT2DvUexgd4XPCbVvmUDWDgfbHw9ZHOTeBUA8ewhgjad/dF2GtjFoAEng+4XEwoNSkOSnzGpVLiV6czPtooKydAbFKEdJ/U/qZfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbirUpDqNQz8/NJEsu8/d2czrEx9fcFmAjg6+7ecZGE=;
 b=jxeOC2gEn+KW9QbVcJszuOxjCNLJwYB5Ev/djc6GFFK++QdAPJwdvA2/O7ZGBoCHgq4epkJ/OQjdY0SdGo/GLA9jfcrbW1CUI4psySffoWewtOj5ugGDGVKOiAkEmo8XLRRA4gnttbCTfXBUGOXOiJ/FatfA1R145Tjnuwzq/m43XuvYXwkbATAbneDxLFzZdQQ1UvMHwfPqWTV2bszQakEFC1qo14FPiPD+WwOlFVZepEGnNog3xQaEwOcIJ/WaVKpecUDq0+lFqCw3ab2WTbqes/2XcANNMW6DsC99jD2292opOQCATYRvr67Zwyr1pvNZQpoqPMVFwz6952NMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbirUpDqNQz8/NJEsu8/d2czrEx9fcFmAjg6+7ecZGE=;
 b=DHYb5b7bscp//Cr/c4/OahNUPD8V4n9vVXN3zkaaMVtUE+4gXxhOUsy4B3g0Tww2bza1bBwAXtiEifCcDVQQFRttAq8nYVVlb3xOYDweOxw+kkokGVh1vFuP4JFi/7mPDVstFltFEwzFmn+ZEkY9CBaTjvEV2nX4GK+VCQr/wNQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB4671.namprd12.prod.outlook.com (2603:10b6:805:e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 18:19:18 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%5]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 18:19:18 +0000
Subject: Re: [PATCH 1/1] pinctrl: amd: disable and mask interrupts on probe
To:     Sachi King <nakato@nakato.io>, linux-gpio@vger.kernel.org,
        basavaraj.natikar@amd.com
Cc:     linux-kernel@vger.kernel.org,
        Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <20211001161714.2053597-1-nakato@nakato.io>
 <20211001161714.2053597-2-nakato@nakato.io>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <8cf02fe2-252d-02b5-d227-9091bee57f76@amd.com>
Date:   Fri, 8 Oct 2021 13:19:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211001161714.2053597-2-nakato@nakato.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0601CA0004.namprd06.prod.outlook.com
 (2603:10b6:803:2f::14) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
Received: from [10.254.54.68] (165.204.77.11) by SN4PR0601CA0004.namprd06.prod.outlook.com (2603:10b6:803:2f::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 18:19:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cf781f2-bf14-48a8-0708-08d98a88249a
X-MS-TrafficTypeDiagnostic: SN6PR12MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB46711F820639F8AC7197E5E9E2B29@SN6PR12MB4671.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEtUoh+wR7z/NSkALlF7hyCQl+Z5nprb/dhyt6XwEpsZbsZeKtOwYW0slex5yVbJSBW6eLnKW84vUUUBUx6R/tLO4XlBnvWMu+NKeOvCp5esNY0fwWLzRrnjzcrYY6VHfxsUgqu7Cm5N2qCLzlr0ivPHQOcM4oLTjOMXkuGlzvZ25grAb/KkgJQRAjEj4bCJCLP/BWc5NmWgi3DTRO+Mt0Cc3/YES6OTcwwvr3g6cN5WLFpxi0mdsfWHALXBZ2Nr5hJ4sWRE5AnbMGvYrEqJJ1i7jN7l7ORFNlA+MwCFMANZ1Kh8+sX5kxd+mkufwuwnlGgHwRrsPqSsXSZ2n2D3byE/SxqsYf+C8VWvL3uQhCSqlermvkKlWrxma3D9CgQ82EDvyWzpppUPF+KeY1NO23mmlTSRILlw/e59OgbbE+zRnkQcolBssefxQC0yIBvoXB/kxr4XKydHMNtTOuiHq5O4V72GP9j+5syMIyEYtv5dEoltTgebcikHBHKrs5zKVLXq9HewSXjwwJflcAISsL5hgEVojIXJcVTlN2SPEsT4wYO6LwnA9jhsyjpU+aYVgBt3G0epPDgV4VRmgdCELhf1lenlziK1EfpjFnSORQpQ5Mtomzl6Rk/Px3l3TyrXqZMx+VfqqlxYImf5S/nXxHEHkYveUUCUcLwcN5rweJvlC3CfEAZaqmh2QZgX0cXkEqdzSQlGUvmA9C798tgIY8nvCld03iCXsgBIR0ZsZ44Gu5uZ0o5a1p1NwBvjlx6C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(4326008)(956004)(86362001)(186003)(83380400001)(26005)(38100700002)(45080400002)(508600001)(6486002)(66476007)(316002)(66946007)(16576012)(31696002)(8676002)(36756003)(5660300002)(2906002)(6636002)(31686004)(66556008)(8936002)(54906003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFneVkzTjg3em16TlVRaEFNNnhiOFAwcHBuZlI3ZFdwVVhEWElCK3hYTzRN?=
 =?utf-8?B?OVRWQXRFZ2F6VHYydlpFT3hMdXVlVzc3M2hXamhjTnFiTDEraDlwcERMTU9Y?=
 =?utf-8?B?dHFKZ0hkbml3cFEvU2xqWkJhQmh0WFplc3FEWlhBRkM4T0RXY2RhU1NGd0p0?=
 =?utf-8?B?MXE3MFdiTFFNQXo4WHhFUzM5NmlYQ0JsWU43OVlaVFR1T2p5cFJYLzBjYWM5?=
 =?utf-8?B?K3Vya2tXREVGdWdxQnk4UTlxRno5aTZodG8xMUIxMlNVaENqc2s1bitBSFpM?=
 =?utf-8?B?VFhTbm5XSmFNNVNSS2pJcTc5b2M2K2N0ek1QVnhhcDZPSEdGQXVRSGdOY3JE?=
 =?utf-8?B?ZHZpT2lVZnZCRXdvNmMxUi9MR2k1bjJVNis5MTB2RnNJd0ZFajJaaDBRMCsv?=
 =?utf-8?B?NVp2R0Rwb0FWaXk2Q2Znb0lTOHBPUU52OE5kK2NHcWJNT1EwNG92c3NkRmpr?=
 =?utf-8?B?RG1OS0hlaWVpQ3BqbTBWakN6dWFHSkw0SWQ5anRjcmNueFdmS3hweXJXcjNP?=
 =?utf-8?B?TmlVYnZIbFFlTmQ0cmV3RGp2RXkyOHFPbnl2U284MloxM2toaDk0cnBiY2N6?=
 =?utf-8?B?anlRSGNHYUhLb1ExbzFiTE5aa3ZaS1h2NVpKZXg5VVJFT2hPUjhEdzF6Uml0?=
 =?utf-8?B?dzRzKzZ0dlJUanoyTW9FS2laVTdNWm1RUUtqVUxCOEt5MGtwSXAzbWlTZG9E?=
 =?utf-8?B?ZllZM1hqQmxKK2doNlNOMzNDRFFYUEl6TSswSHBqZldYSGxyV3N2MTQ5ZElN?=
 =?utf-8?B?bzFlcGc0dTBxT0Q3VDFYZVhkZmpOSjhGejdJMnhWNlE3U3k0Sld0NHNDVVFD?=
 =?utf-8?B?VzRGTHY3T1VIWHR6eWxiQTJHTHFRcDdsRkh4L1A0MXJTL1hGazRFcVJ3V2tT?=
 =?utf-8?B?M1JrNFFxUitPZXR2dFpyR3lZVWRtM0xyWVhLYnA3V3Y4SFplS01OeGYxdkh2?=
 =?utf-8?B?VjFrTEZadmZFMHMwZFNzK2g3M21uSHBRYm1iS1VIQXhvNFhVdzFHR1FSZzRT?=
 =?utf-8?B?SWZHeUdsaEpldmE2UVlZcTJRUTM5ZVhpdHo3MEFTbVFOQWpHU1llUGs0RklL?=
 =?utf-8?B?cnR1QlNTTDFBOVNGSk93V1pGc3lsbVMrSWRrcjgxaTZheUUxUzA3MkJIU00z?=
 =?utf-8?B?QW1TUHYwd1U5SDQ1aEpZSHc0SVRlbTRVdEhMZmFmNzFET28rSjJYc1Q4REM1?=
 =?utf-8?B?REs5WHJwVEF0U0FQa0FxT2RRMDYyeUxlT0dndXAxVlVCMURoaExrTElLNHg3?=
 =?utf-8?B?Sk10YXMrTEc5NTdwbXJNRmJXcVBuSkc0Nk1ZblhFY0FUbVJnbWliV2tWMllI?=
 =?utf-8?B?N0x2SXNJaE80MEhQby93Vk5sMzFyWlpvdEtwS0tsRS9QajA5WGZ6a2p5Z0VG?=
 =?utf-8?B?WE5JSWdQSHF0UUVHSTBEYngwdWxMSzRKYmhNR1lxOUdYTFNCVWthdWRkZkl5?=
 =?utf-8?B?T0JmMWUxaVhQeGJGd01KVE51YlRDcjFoa3FUQU9sNzZPYVZCWmpqYVhQQ0RZ?=
 =?utf-8?B?THp0dlM3TE1yTXBoZjhJZGhMR29Cc05kZG9SMy9CODBJVGJIcnZUWW8xU0NN?=
 =?utf-8?B?ZFBDYmwzM1VYd0xDNlYzbEtXa1daMk5kb0hNWE5XUHpucVdnckk0VWxTUG04?=
 =?utf-8?B?TjdnYUtyTC8rd3JlNS9vVEUzdUpEQ0dvSjZudjJYdERVUzAxNG1VbWRpaDZG?=
 =?utf-8?B?Rnc2cUJSc2ZTWk9oMTVadUo4UzU4enQ4KzN4THY0ZFZ2emNJV1hEZSsydEwy?=
 =?utf-8?Q?m+1HycwnGG93T7MN0mG++L5zwQsWRAZ6s5zJI3T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf781f2-bf14-48a8-0708-08d98a88249a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 18:19:18.5846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwVFF8N4A/0uqOZmYm2fBhoVN9muLui/Iq2RZSOiSZStRcZSfeQE9Y3kjl0ze9dhXPySiC7pdCf84t1FIrLs7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4671
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/1/2021 11:17, Sachi King wrote:
> Some systems such as the Microsoft Surface Laptop 4 leave interrupts
> enabled and configured for use in sleep states on boot, which cause
> unexpected behaviour such as spurious wakes and failed resumes in
> s2idle states.
> 
> As interrupts should not be enabled until they are claimed and
> explicitly enabled, disabling any interrupts mistakenly left enabled by
> firmware should be safe.
> 

So I did test this on a handful of platforms and confirmed that the 
events declared in _AEI are still being enabled and passed properly.

So if no other changes needed you can add my:
Tested-by: Mario Limonciello <mario.limonciello@amd.com>

> Signed-off-by: Sachi King <nakato@nakato.io>
> ---
>   drivers/pinctrl/pinctrl-amd.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index c001f2ed20f8..aa4136cd312d 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -830,6 +830,32 @@ static const struct pinconf_ops amd_pinconf_ops = {
>   	.pin_config_group_set = amd_pinconf_group_set,
>   };
>   
> +static void amd_gpio_irq_init(struct amd_gpio *gpio_dev) {
> +	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
> +	unsigned long flags;
> +	u32 pin_reg, mask;
> +	int i;
> +
> +	mask = BIT(WAKE_CNTRL_OFF_S0I3) | BIT(WAKE_CNTRL_OFF_S3)
> +		| BIT(INTERRUPT_MASK_OFF) | BIT(INTERRUPT_ENABLE_OFF)
> +	        | BIT(INTERRUPT_MASK_OFF) | BIT(WAKE_CNTRL_OFF_S4);
> +
> +	for (i = 0; i < desc->npins; i++) {
> +		int pin = desc->pins[i].number;
> +		const struct pin_desc *pd = pin_desc_get(gpio_dev->pctrl, pin);
> +		if (!pd)
> +			continue;
> +
> +		raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> +
> +		pin_reg = readl(gpio_dev->base + i * 4);
> +		pin_reg &= ~mask;
> +		writel(pin_reg, gpio_dev->base + i * 4);
> +
> +		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
> +	}
> +}
> +
>   #ifdef CONFIG_PM_SLEEP
>   static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
>   {
> @@ -967,6 +993,9 @@ static int amd_gpio_probe(struct platform_device *pdev)
>   		return PTR_ERR(gpio_dev->pctrl);
>   	}
>   
> +	/* Disable and mask interrupts */
> +	amd_gpio_irq_init(gpio_dev);
> +

As the pinctrl device was just registered, I do wonder if this actually 
needs a mutex in case another thread tries to enable the pins at the 
same time.  I might be wrong here though and things are OK because the 
pin range isn't added until later on in probe.


>   	girq = &gpio_dev->gc.irq;
>   	girq->chip = &amd_gpio_irqchip;
>   	/* This will let us handle the parent IRQ in the driver */
> 

