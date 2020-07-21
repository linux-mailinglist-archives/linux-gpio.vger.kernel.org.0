Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2219228BC6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 00:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgGUWF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 18:05:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:8066 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbgGUWF6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 18:05:58 -0400
IronPort-SDR: uJ0j+Yx19o4FaRjoMP2XO1lS42YgKDswEtahtJL4c7FiYP85H7LVGGMs8Ob61iFZ+jF5jiI54D
 dUmu0xcNPXpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="211781089"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; 
   d="scan'208";a="211781089"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 15:05:57 -0700
IronPort-SDR: Zs/uBRtM99+HeaAvP2bLSYVQEsxMgtW1wRqU2DKf8gzuCmWYCLmEzzSXPvZFeZxdODOZxnrbKn
 Lwq5xNaXZS+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; 
   d="scan'208";a="392490399"
Received: from ddperry-mobl.amr.corp.intel.com (HELO [10.254.78.60]) ([10.254.78.60])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2020 15:05:56 -0700
Subject: Re: [PATCH v2] gpio: crystalcove: Use irqchip template
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>
References: <20200721140153.369171-1-linus.walleij@linaro.org>
 <50c79c0d-3942-c248-fef0-27fa3592b89c@linux.intel.com>
 <20200721215411.GR3703480@smile.fi.intel.com>
From:   "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <9a0ddc8a-8c8f-614f-56ed-3e59e9fb60f0@linux.intel.com>
Date:   Tue, 21 Jul 2020 15:05:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721215411.GR3703480@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/21/20 2:54 PM, Andy Shevchenko wrote:
> On Tue, Jul 21, 2020 at 10:08:57AM -0700, Kuppuswamy, Sathyanarayanan wrote:
>> Hi,
>>
>> On 7/21/20 7:01 AM, Linus Walleij wrote:
>>> This makes the driver use the irqchip template to assign
>>> properties to the gpio_irq_chip instead of using the
>>> explicit calls to gpiochip_irqchip_add_nested() and
>>> gpiochip_set_nested_irqchip(). The irqchip is instead
>>> added while adding the gpiochip.
>> Looks good to me.
> 
> Thanks!
> 
>>      Reviewed-by: Kuppuswamy Sathyanarayanan
>> <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> It's not first time your tag goes like this. Please, fix your tools to be it like
> Reviewed-by: Name <address@com>
> (no leading spaces, no split -- one line)
Ok. I will fix it in future emails.
> 
>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>> ---
>>> ChangeLog v1->V2:
>>> - Fixed a variable name ch->cg
>>> ---
>>>    drivers/gpio/gpio-crystalcove.c | 24 +++++++++++++++---------
>>>    1 file changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
>>> index 14d1f4c933b6..39349b0e6923 100644
>>> --- a/drivers/gpio/gpio-crystalcove.c
>>> +++ b/drivers/gpio/gpio-crystalcove.c
>>> @@ -330,6 +330,7 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>>>    	int retval;
>>>    	struct device *dev = pdev->dev.parent;
>>>    	struct intel_soc_pmic *pmic = dev_get_drvdata(dev);
>>> +	struct gpio_irq_chip *girq;
>>>    	if (irq < 0)
>>>    		return irq;
>>> @@ -353,14 +354,15 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>>>    	cg->chip.dbg_show = crystalcove_gpio_dbg_show;
>>>    	cg->regmap = pmic->regmap;
>>> -	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
>>> -	if (retval) {
>>> -		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
>>> -		return retval;
>>> -	}
>>> -
>>> -	gpiochip_irqchip_add_nested(&cg->chip, &crystalcove_irqchip, 0,
>>> -				    handle_simple_irq, IRQ_TYPE_NONE);
>>> +	girq = &cg->chip.irq;
>>> +	girq->chip = &crystalcove_irqchip;
>>> +	/* This will let us handle the parent IRQ in the driver */
>>> +	girq->parent_handler = NULL;
>>> +	girq->num_parents = 0;
>>> +	girq->parents = NULL;
>>> +	girq->default_type = IRQ_TYPE_NONE;
>>> +	girq->handler = handle_simple_irq;
>>> +	girq->threaded = true;
>>>    	retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
>>>    				      IRQF_ONESHOT, KBUILD_MODNAME, cg);
>>> @@ -370,7 +372,11 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>>>    		return retval;
>>>    	}
>>> -	gpiochip_set_nested_irqchip(&cg->chip, &crystalcove_irqchip, irq);
>>> +	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
>>> +	if (retval) {
>>> +		dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
>>> +		return retval;
>>> +	}
>>>    	return 0;
>>>    }
>>>
>>
>> -- 
>> Sathyanarayanan Kuppuswamy
>> Linux Kernel Developer
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
