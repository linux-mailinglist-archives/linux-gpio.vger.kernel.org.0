Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447F3DF5B3
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 21:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbfJUTJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 15:09:22 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37049 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUTJV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 15:09:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id e11so6531809wrv.4;
        Mon, 21 Oct 2019 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lm2MdE7bg6ucG+O+h22ANo41xDirJAvHAUNlahea5r4=;
        b=DowZfqxulsRoXZ+O/ntfN4ld+3PnLsYxNONALSjCsd49aSu+Z9n1HAQ4QRTGCuC2t4
         zcKC0GacDlt8e6pFq3d4dlBkSYkQFvNEdzJM7dmdSrQxcRkCkv9YifepKVkTkOCrsvbn
         fjiuKren0HQ9tV5WBs2yZX6NW+7EOxmEvCRzocQsv2HkvM0R8qRJPAl/Voe/arXRDBXx
         ZefEJZEBXD4N9nztZ3ZxgRgPaBF1FR3sLwE7+qVBJ+NUMi6rC8Exl2bkcDjUFikDzBUk
         qUJOyJfaI4W/v3+es0zDjoZ6fUMma4zTOl+AN39qogEYmr4aCEKm7sruJ3bv3mObgZoW
         xGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Lm2MdE7bg6ucG+O+h22ANo41xDirJAvHAUNlahea5r4=;
        b=KHj4cVEfEVXJ9cGIK7ZdscaKiX2nK8NFyK8a7yY8Zu0zRtsqO3NXf9XY7wkxclsGU+
         +DQmGfHvTpNvPMhCajdDnBRZEvXaLfiZuD1KT6FfCJ5CvNIm5TyT1qaAtYPozcaa6Uin
         agfZ6BwUeSba/TWbBtHxdcgbvJeM2pVtz5++b90MNz4Mcu3e5XE+QCgmnOJOXG0twJhq
         11QEKkqn8I6HLH82sbyZqUoQ8L2WL+68W3nVogbQD7CXQhU7omvyhWW2n1rE31Kblu1e
         ho9bO8+oRXn4QpYRKdzMGnLKDtBOK6mzLCzfLa2Ky0lOnuDcjOQjlonbARghbXlgx6WG
         4lXQ==
X-Gm-Message-State: APjAAAVioDsk2a3u86HpP0RkQLWphwPrlCLGpTRSb99sognnCMLct0zm
        GzJu2AFlj7lbmefIvFX1o+Y=
X-Google-Smtp-Source: APXvYqzLfuCKu1x+cFs7/o50Szu2JuRJ7BLLkPcqpku7wF8NmDEh6unYygssTrtfVG4S4eEionZPkQ==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr1910544wrp.8.1571684956534;
        Mon, 21 Oct 2019 12:09:16 -0700 (PDT)
Received: from [192.168.1.19] (bdt167.neoplus.adsl.tpnet.pl. [83.28.5.167])
        by smtp.gmail.com with ESMTPSA id c6sm9706617wmc.9.2019.10.21.12.09.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 12:09:15 -0700 (PDT)
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com>
 <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com>
Date:   Mon, 21 Oct 2019 21:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

On 10/21/19 10:00 AM, Vaittinen, Matti wrote:
> Hello Dan,
> 
> Thanks for taking the time to check my driver :) I truly appreciate all
> the help!
> 
> A "fundamental question" regarding these review comments is whether I
> should add DT entries for these LEDs or not. I thought I shouldn't but
> I would like to get a comment from Rob regarding it.

If the LED controller is a part of MFD device probed from DT then
there is no doubt it should have corresponding DT sub-node.

We've recently added some standardization of LED naming so please
use the new 'function' and 'color' DT properties in the bindings.

Please refer to Documentation/devicetree/bindings/leds/common.txt.

You should register LED class devices using
devm_led_classdev_register_ext() API to benefit from generic support
for LED name composition. This support is available in Linus tree
starting from 5.4-rc1.

> On Thu, 2019-10-17 at 09:04 -0500, Dan Murphy wrote:
>> Matt
>>
>> On 10/17/19 4:53 AM, Matti Vaittinen wrote:
>>> ROHM BD71828 power management IC has two LED outputs for charge
>>> status
>>> and button pressing indications. The LED outputs can also be forced
>>> bs SW so add driver allowing to use these LEDs for other
>>> indications
>> s/bs/by
>>> as well.
>>>
>>> Leds are controlled by SW using 'Force ON' bits. Please note the
>>> constrains mentioned in data-sheet:
>>> 1. If one LED is forced ON - then also the other LED is forced.
>>> 	=> You can't use SW control to force ON one LED and allow HW
>>> 	   to control the other.
>>> 2. You can't force both LEDs OFF. If the FORCE bit for both LED's
>>> is
>>>     zero, then LEDs are controlled by HW and indicate
>>> button/charger
>>>     states as explained in data-sheet.
>>>
>>> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>>> ---
>>>   drivers/leds/Kconfig        | 10 ++++
>>>   drivers/leds/Makefile       |  1 +
>>>   drivers/leds/leds-bd71828.c | 97
>>> +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 108 insertions(+)
>>>   create mode 100644 drivers/leds/leds-bd71828.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index b0fdeef10bd9..ec59f28bcb39 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -529,6 +529,16 @@ config LEDS_BD2802
>>>   	  This option enables support for BD2802GU RGB LED driver chips
>>>   	  accessed via the I2C bus.
>>>   
>>> +config LEDS_BD71828
>>> +	tristate "LED driver for LED pins on ROHM BD71828 PMIC"
>>> +	depends on LEDS_CLASS
>> doesn't this have a dependency on MFD_ROHM_BD71828
>>> +	depends on I2C
>>> +	help
>>> +	  This option enables support for LED outputs located on ROHM
>>> +	   BD71828 power management IC. ROHM BD71828 has two led output
>>> pins
>>> +	   which can be left to indicate HW states or controlled by SW.
>>> Say
>>> +	   yes here if you want to enable SW control for these LEDs.
>>> +
>>
>> Add module statement
> 
> What is the module statement? Do you mean the 'if you compile this as a
> module it will be called blahblah' or 'choose M to blahblah'?
> 
> I've never understood why some entries have those statements. 'Choose
> M' stuff is help for config system - why should each module explain how
> to use configs? This information should be in more generic
> documentation. Furthermore, the 'tristate' there already says you can
> compile this as a module. Module name on the other hand really is
> module's property but it may well change if one changes the name of the
> file. That should not require change in KConfig. Furthermore, where do
> you need the module name? And if you really need the module name you
> should check the config name from Makefile to be sure - module/file
> names in comments or docs tend to get outdated.
> 
> After all this being said - I can add any boilerplate text in KConfig
> if necessary - I just see zero benefit from this. And if you didn't
> mean this - can you then please tell me what is the module statement?

Yes, like you noticed, this is boilerplate so please follow the
convention. If you'd like to discuss its relevance please submit
a message to kernel-janitors@vger.kernel.org.

>>>   config LEDS_INTEL_SS4200
>>>   	tristate "LED driver for Intel NAS SS4200 series"
>>>   	depends on LEDS_CLASS
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 41fb073a39c1..2a8f6a8e4c7c 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_AN30259A)		+=
>>> leds-an30259a.o
>>>   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>>>   obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
>>>   obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
>>> +obj-$(CONFIG_LEDS_BD71828)		+= leds-bd71828.o
>>>   obj-$(CONFIG_LEDS_CPCAP)		+= leds-cpcap.o
>>>   obj-$(CONFIG_LEDS_LOCOMO)		+= leds-locomo.o
>>>   obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
>>> diff --git a/drivers/leds/leds-bd71828.c b/drivers/leds/leds-
>>> bd71828.c
>>> new file mode 100644
>>> index 000000000000..2427619444f5
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-bd71828.c
>>> @@ -0,0 +1,97 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// Copyright (C) 2019 ROHM Semiconductors
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/mfd/rohm-bd71828.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#define BD71828_LED_TO_DATA(l) ((l)->id == ID_GREEN_LED ? \
>>> +	container_of((l), struct bd71828_leds, green) : \
>>> +	container_of((l), struct bd71828_leds, amber))
>>
>> I don't think we should be defining the color as the variable. The 
>> outputs can drive any color LED.
> 
> I used the colors mentioned in BD71828 data-sheet. It is true someone
> might use different LEDs on their board but at least this naming allows
> one to match the output to one in data-sheet. I can add comment
> explaining this if you thin it's worth mentioning.

I see you've come up with below definitions in rohm-bd71828.h:

#define BD71828_MASK_LED_AMBER		0x80
#define BD71828_MASK_LED_GREEN		0x40

Is this how those bit fields are named in the data sheet?

>>> +
>>> +enum {
>>> +	ID_GREEN_LED,
>>> +	ID_AMBER_LED,
>>> +	ID_NMBR_OF,
>>> +};
>>> +
>>
>> Please use the color_id in linux/include/dt-bindings/leds/common.h
> 
> Maybe I should not include anything from dt-bindings if I don't use DT
> for this sub-device? (Please see the comments below).

But you should.

>>> +struct bd71828_led {
>>> +	int id;
>>> +	struct led_classdev l;
>>> +	u8 force_mask;
>>> +};
>>> +
>>> +struct bd71828_leds {
>>> +	struct rohm_regmap_dev *bd71828;
>>> +	struct bd71828_led green;
>>> +	struct bd71828_led amber;
>>> +};
>>> +
>>> +static int bd71828_led_brightness_set(struct led_classdev
>>> *led_cdev,
>>> +				      enum led_brightness value)
>>> +{
>>> +	struct bd71828_led *l = container_of(led_cdev, struct
>>> bd71828_led, l);
>>> +	struct bd71828_leds *data;
>>> +	unsigned int val = BD71828_LED_OFF;
>>> +
>>> +	data = BD71828_LED_TO_DATA(l);
>>> +	if (value != LED_OFF)
>>> +		val = BD71828_LED_ON;
>>> +
>>> +	return regmap_update_bits(data->bd71828->regmap,
>>> BD71828_REG_LED_CTRL,
>>> +			    l->force_mask, val);
>>> +}
>>> +
>>> +static int bd71828_led_probe(struct platform_device *pdev)
>>> +{
>>> +	struct rohm_regmap_dev *bd71828;
>>> +	struct bd71828_leds *l;
>>> +	struct bd71828_led *g, *a;
>>> +	static const char *GNAME = "bd71828-green-led";
>>> +	static const char *ANAME = "bd71828-amber-led";
>> The LED class creates the name it can get it from the DT.
> 
> I did not add DT node for LEDs as I thought this is preferred way when
> there is not much HW information to bring from DT. I am not sure as
> previous PMICs I did drivers for didn't have LEDs though. Currently
> this is a MFD sub-device and gets no data from DT. Actually the driver
> crashed when I first didn't explicitly give these names.

Please compare below bindings of MFD devices with LED support:

Documentation/devicetree/bindings/mfd/max77693.txt
Documentation/devicetree/bindings/mfd/ti-lmu.txt

Please follow them but use new 'function' and 'color' properties
instead of 'label'.

>>> +	int ret;
>>> +
>>> +	pr_info("bd71828 LED driver probed\n");
> as a comment from myself - this print should be eliminated or by
> minimum converted to dev_dbg.
> 
>>> +
>>> +	bd71828 = dev_get_drvdata(pdev->dev.parent);
>>> +	l = devm_kzalloc(&pdev->dev, sizeof(*l), GFP_KERNEL);
>>> +	if (!l)
>>> +		return -ENOMEM;
>>> +	l->bd71828 = bd71828;
>>> +	a = &l->amber;
>>> +	g = &l->green;
>>> +	a->id = ID_AMBER_LED;
>>> +	g->id = ID_GREEN_LED;
>>> +	a->force_mask = BD71828_MASK_LED_AMBER;
>>> +	g->force_mask = BD71828_MASK_LED_GREEN;
>>> +
>>> +	a->l.name = ANAME;
>>> +	g->l.name = GNAME;
>>> +	a->l.brightness_set_blocking = bd71828_led_brightness_set;
>>> +	g->l.brightness_set_blocking = bd71828_led_brightness_set;
>>> +
>>> +	ret = devm_led_classdev_register(&pdev->dev, &g->l);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return devm_led_classdev_register(&pdev->dev, &a->l);

This way you force users to always register two LED class devices
whereas they might need only one. Please compare how other LED class
drivers handle DT parsing and LED class device registration.

>>> +}
>>> +
>>
>> This looks different.  Not sure why you register both LEDs in this
>> probe.
>>
>> You can use the DT to define both LEDs and then each will be probed
>> and 
>> registered separately.
> 
> As I mentioned above, this driver is currently not using DT at all.
> Reason why it does not is that I didn't know all the LEDs are usually
> having own DT entries/drivers.
> 
> But there is actually reason for bundling the LEDs to same driver. What
> is not shown in driver is that LEDs can be controlled by PMIC state
> machine so that they are indicating charger states. Other option is

This can be handled by the LED trigger that your driver should expose.
On activation the trigger would setup the hardware to control the
LEDs. But that can be covered later.

> driving LEDs using this driver - but forcing one of the LEDs will cause
> also the other LED to be under SW control. Eg, one can't control just
> single LED using SW, its both of them or none.

So this limitation will have to by documented in the trigger ABI.

>> This is how it is commonly done.
>>
>> You can reference the LM36274 led driver as this is a MFD device to
>> the 
>> ti-lmu.c in the MFD directory.
> 
> Thanks for pointing this out. I will gladly see how others have it
> implemented! I just would like to know if the DT binding is really a
> must? In this case I am unsure what LED related extra information we
> could really give from DT (for this specific device).
> 
> I just checked the lm36274 you mentioned. I see that also lm36274 do
> parse the dt and set the name itself (so maybe the led_class is not
> doing this after all?) - although the name setting code in lm36274 is a
> bit peculiar as it loops through all child nodes and overwrites the old
> name if it finds more than one "label" properties from nodes (if I read
> the code correctly).
> 
> In any case I am unsure what is the benefit from using DT and adding
> the DT parsing code for this PMIC's LEDs. I could understand DT usage
> if LED class handled dt parsing and if there was something to configure
> in BD71828 LEDs - but I see no such benefits in this case.

I hope I was able to clarify most of your doubts.

-- 
Best regards,
Jacek Anaszewski
