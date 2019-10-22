Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B117CE0ACC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfJVRki (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:40:38 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53973 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfJVRki (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Oct 2019 13:40:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id i13so3006704wmd.3;
        Tue, 22 Oct 2019 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gK3DXgcpHafHjeajgavQ41Mfsxw0dIakrDogI55eL4A=;
        b=TRsnjTdxtFG4BHLo59RSw2p2e/nm9zNTfbdJJ1DTEaoCn3OYw1T6oOYnVmQNU6sHlg
         EJ6mzcapE/d2JtnYAm0fbo4Kkue7cfXkyxyjGIGvWWgAfVUN4OhfqFxUFi1PH+c9hGlY
         ycK0aIh+8JCcaXIBJPZQD7ijXJz77vZwYto5Ftgq2IjCiv7MitrrwMHUJxDydPEnN68/
         SUyF01/JA0mPivma0sgJvAzyMnZOBVFDrnP9HMmgPbuBlX6Ua29eZCnPZ9Z8PQKO0TIS
         MLEEEbISFDhvsXk+Ga0cejw2OyXsPxYy6eQdIbWp3Dy2SQ0OQo75rnSNf+4DVj46DIN4
         VjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gK3DXgcpHafHjeajgavQ41Mfsxw0dIakrDogI55eL4A=;
        b=h/0NHa1PHG/ot74qtbBWSC1mBvPTT+PnpNvmDGil8bxn5VAmG2ucSpwonrEhWAZp+H
         w17yiPkGn9pWgpbWc9qQEWZUCQBBKVlTIusb3cVrPtZty/w2tBFOJ/waGRHTyIxx3dvZ
         wTenQnfeWWZ3lWb2t/Fa/zpW+I0bHA7mo5QHBEDXg/3IV1913kTgEsuXJorOVGv3jyfg
         cOZ7wGTmrxUsn0E+/+ypJz0JzK5DngHf5YsiZGMnfiv/2EmOt/34EcE7E2tRtjTDBjYz
         ifYQpxigUThr8i4hSStlUXXnLfGOOXudJvuabUAA2ZdhAgJ+mS5FUK9d8A91764nD0Xc
         srEA==
X-Gm-Message-State: APjAAAVeHZHJEXc8zDk6Q1BQmkUUduIZjPUKi1aEZKb/6t3UAgrJtlbM
        QRJt+KReJsOPiJpUlDyJlrQ=
X-Google-Smtp-Source: APXvYqxjxXZ5qj/I86enwN3YHNcdPz3Ob5Is9JySQo9Viunk+F6K24nhAuEh911p/iMCeLLq37951g==
X-Received: by 2002:a1c:20c9:: with SMTP id g192mr3767705wmg.74.1571766031499;
        Tue, 22 Oct 2019 10:40:31 -0700 (PDT)
Received: from [192.168.1.19] (bfv17.neoplus.adsl.tpnet.pl. [83.28.59.17])
        by smtp.gmail.com with ESMTPSA id s13sm17140818wmc.28.2019.10.22.10.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 10:40:30 -0700 (PDT)
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
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
 <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com>
 <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com>
Date:   Tue, 22 Oct 2019 19:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Matti,

On 10/22/19 2:40 PM, Vaittinen, Matti wrote:
> Hello Jacek,
> 
> Thanks for the clarifications. I think I now understand the LED
> subsystem a bit better :)
> 
> On Mon, 2019-10-21 at 21:09 +0200, Jacek Anaszewski wrote:
>> Hi Matti,
>>
>> On 10/21/19 10:00 AM, Vaittinen, Matti wrote:
>>> Hello Dan,
>>>
>>> Thanks for taking the time to check my driver :) I truly appreciate
>>> all
>>> the help!
>>>
>>> A "fundamental question" regarding these review comments is whether
>>> I
>>> should add DT entries for these LEDs or not. I thought I shouldn't
>>> but
>>> I would like to get a comment from Rob regarding it.
>>
>> If the LED controller is a part of MFD device probed from DT then
>> there is no doubt it should have corresponding DT sub-node.
> 
> Sorry but I still see no much benefit from adding this information in
> DT. Why should it have corresponding DT-node if the LED properties are
> fixed and if we only wish to allow user-space control and have no
> dependencies to other devices in DT? 
> 
> In this specific case the information we can provide from DT is
> supposed to be fixed. No board based variation. Furthermore, there is
> not much generic driver/led core functionality which would be able to
> parse and utilize relevant information from DT. I think we can only
> give the name (function) and colour. And they are supposed to be fixed
> and thus could be just hard-coded in driver. Hard-coding these would be
> simpler and less error prone for users (no DT bindings to write) and
> simpler to create and probably also to maintain (no separate binding
> documents needed for LEDs).

AFAICS it is possible to connect LED of arbitrary color to the iouts
of this device. If this is the case then it is justified to have DT
node only to allow for LED name customization.

> But assuming this is Ok to DT-folks and if you insist - I will add LED
> information to DT for the next patches. Hopefully this extra complexity
> helps in some oddball use-case which I can't foresee =)
> 
> Then what comes to the DT format.
> 
> Do you think LED subsystem should try to follow the convention with
> other sub-systems and not introduce multiple compatibles for single
> device? MFD can handle instantiating the sub-devices just fine even
> when sub-devices have no own compatible property or of_match. Maybe we
> should also avoid unnecessary sub-nodes when they are not really
> required.

This is beyond my scope of responsibility. It is MFD subsystem thing to
choose the way of LED class driver instantiation. When it comes to
LED subsystem - it expects single compatible pertaining to a physical
device.

Nonetheless, so far we used to have separate compatibles for drivers of
MFD devices' LED cells. If we are going to change that I'd like to see
explicit DT maintainer's statement confirming that.

And one benefit of having separate nodes per MFD cells is that we can
easily discern the support for which cells is to be turned on.

> If we look at clk and GPIOs it is nowadays preferred (as per my
> understanding after discussions with Stephen, Rob and some others -
> please correct me if I am wrong) to place the 'provider' information in
> the MFD node and obtain the relevant properties from parent->of_node in
> the sub-device driver (or for generic properties, in the core
> framework) - at least for simple cases. I guess rationale was that it
> reflects the real hardware better when no artificial sub-nodes are
> required?
> 
> I see the example bindings (like max77693 below) you pointed to me
> don't follow that convention but create own sub nodes with own
> compatible properties in MFD for all the logical blocks.
> 
> I am asking this as I was "strongly advieced" (a.k.a told to change my
> approach if I wish to get driver ion their trees ;]) by Rob and Stephen
> to not do that with previous PMIC drivers I upstreamed.
> 
> As example - the relevant bindings for BD71837 clock output were
> originally:
> 
> pmic: bd71837@4b {
> 	compatible = "rohm,bd71837";
> 
> 	regulators {
> 		...
> 	};
> 
> 	/* Clock node */
> 	clk: bd71837-32k-out {
> 		compatible = "rohm,bd71837-clk";
> 		#clock-cells = <0>;
> 		clock-frequency  = <32768>;
> 		clock-output-names = "bd71837-32k-out";
> 	};
> };
> 
> but it was preferred to not have the the clk sub-node and place the
> provider information directly in pmic node instead. Result was:
> 
> pmic: bd71837@4b {
> 	compatible = "rohm,bd71837";
> 
> 	#clock-cells = <0>;
> 	clock-frequency  = <32768>;
> 	clock-output-names = "bd71837-32k-out";
> 
> 	regulators {
> 		...
> 	};
> };
> 
> clk consumers can then live anywhere in DT and just refer to clock
> provider via reference.
> 
> The sub-device driver is instantiated by MFD and it does not need the
> DT (or compatible) for this. After that the sub-driver can fetch the
> parent DT node and looks for relevant information - or just passes that
> node to core if it expects no driver specific properties.
> 
> The bd70528 is another example. It is a MFD with drivers for
> regulators, clk-gate, few GPIOs, watchdog, charger and rtc. It still
> has only one compatible in DT, and only MFD node with regulators sub-
> node. There is no need for WDG, RTC or charger to be present in DT. (In
> my books LEDs for BD71828 would fall in the same category but I guess I
> already mentioned that xD ).
> 
> pmic: pmic@4b {
> 	compatible = "rohm,bd70528";
> 	reg = <0x4b>;
> 	interrupt-parent = <&gpio1>;
> 	interrupts = <29 GPIO_ACTIVE_LOW>;
> 	clocks = <&osc 0>;
> 	#clock-cells = <0>;
> 	clock-output-names = "bd70528-32k-out";
> 	#gpio-cells = <2>;
> 	gpio-controller;
> 	interrupt-controller;
> 	#interrupt-cells = <2>;
> 
> 	regulators {
> 		...
> 	};
> };
> 
> So, to make LED subsystem at least partially follow same principle I
> suggest I'll do following:
> 
> Where max77693 does:
> max77693@66 {
> 		compatible = "maxim,max77693";
> 		reg = <0x66>;
> 		interrupt-parent = <&gpx1>;
> 		interrupts = <5 2>;
> 
> 		regulators {
> 			esafeout@1 {
> 				regulator-compatible = "ESAFEOUT1";
> 				...
> 			};
> 		};
> 
> 		haptic {
> 			compatible = "maxim,max77693-haptic";
> 			...
> 		};
> 
> 		charger {
> 			compatible = "maxim,max77693-charger";
> 			...
> 		};
> 
> 		led {
> 			compatible = "maxim,max77693-led";
> 			...
> 
> 			camera_flash: flash-led {
> 				label = "max77693-flash";
> 				...
> 			};
> 		};
> 	};
> 
> I would go with:
> 
> 	pmic: pmic@4b {
> 		compatible = "rohm,bd71828";
> 		reg = <0x4b>;
> 		interrupt-parent = <&gpio1>;
> 		interrupts = <29 GPIO_ACTIVE_LOW>;
> 		clocks = <&osc 0>;
> 		#clock-cells = <0>;
> 		clock-output-names = "bd71828-32k-out";
> 		gpio-controller;
> 		#gpio-cells = <2>;
> 		ngpios = <4>;
> 		gpio-reserved-ranges = <0 1 2 1>;
> 		gpio-line-names = "EPDEN";
> 		rohm,dvs-vsel-gpios = <&gpio1 12 0>,
> 				      <&gpio1 13 0>;
> 		regulators {
> 			...
> 		};
> 		
> 		chg-led {
> 			function = LED_FUNCTION_CHARGING;
> 			color = LED_COLOR_ID_AMBER;
> 		};
> 
> 		pwr-led {
> 			function = LED_FUNCTION_POWER;
> 			color = LED_COLOR_ID_GREEN;
> 		};

This way you would probably need to probe LED class driver twice,
instead of letting it behave in a standard way and parse child LED
nodes.

> 	};
> 
> How do you see this? Or do you really wish to have this one extra node:
> 
> 	pmic: pmic@4b {
> 		compatible = "rohm,bd71828";
> 		
> reg = <0x4b>;
> 		interrupt-parent = <&gpio1>;
> 		interru
> pts = <29 GPIO_ACTIVE_LOW>;
> 		clocks = <&osc 0>;
> 		
> #clock-cells = <0>;
> 		clock-output-names = "bd71828-32k-out";
> 		gpio-controller;
> 		#gpio-cells = <2>;
> 	
> 	ngpios = <4>;
> 		gpio-reserved-ranges = <0 1 2 1>;
> 	
> 	gpio-line-names = "EPDEN";
> 		rohm,dvs-vsel-gpios =
> <&gpio1 12 0>,
> 				      <&gpio1 13 0>;
> 		
> regulators {
> 			...
> 		};
> 		
> 		leds-dummy {

Why leds-dummy ?

The convention is to have led-controller@unit-address as the parent LED
controller node.

> 			chg-led {
s/chg-led/led0/

> 				function = LED_FUNCTION_CHARGING;
> 				color = LED_COLOR_ID_AMBER;
> 			};
> 
> 			pwr-led {

s/pwr-led/led1/

This is ePAPR requirement that DT node name should describe the
general class of device.

> 				function = LED_FUNCTION_POWER;
> 				color = LED_COLOR_ID_GREEN;
> 			};

Common LED bindings say this is the proper way to go. However you
would need compatible to probe LED class driver in DT based way.
If you plan to do it otherwise then it makes no sense to have
DT nodes for LEDs.

> 		};
> 	};
> 
> 
>> We've recently added some standardization of LED naming so please
>> use the new 'function' and 'color' DT properties in the bindings.
>>
>> Please refer to Documentation/devicetree/bindings/leds/common.txt.
>>
>> You should register LED class devices using
>> devm_led_classdev_register_ext() API to benefit from generic support
>> for LED name composition. This support is available in Linus tree
>> starting from 5.4-rc1.
> 
> Thanks for the hint. So this API would make the name out of function
> and colour given via dt, right?

Right.

>>> On Thu, 2019-10-17 at 09:04 -0500, Dan Murphy wrote:
>>>> Matt
>>>>
>>>> On 10/17/19 4:53 AM, Matti Vaittinen wrote:
>>>>> ROHM BD71828 power management IC has two LED outputs for charge
>>>>> status
>>>>> and button pressing indications. The LED outputs can also be
>>>>> forced
>>>>> bs SW so add driver allowing to use these LEDs for other
>>>>> indications
>>>> s/bs/by
>>>>> as well.
>>>>>
>>>>> Leds are controlled by SW using 'Force ON' bits. Please note
>>>>> the
>>>>> constrains mentioned in data-sheet:
>>>>> 1. If one LED is forced ON - then also the other LED is forced.
>>>>> 	=> You can't use SW control to force ON one LED and
>>>>> allow HW
>>>>> 	   to control the other.
>>>>> 2. You can't force both LEDs OFF. If the FORCE bit for both
>>>>> LED's
>>>>> is
>>>>>     zero, then LEDs are controlled by HW and indicate
>>>>> button/charger
>>>>>     states as explained in data-sheet.
>>>>>
>>>>> Signed-off-by: Matti Vaittinen <
>>>>> matti.vaittinen@fi.rohmeurope.com>
>>>>> ---
>>>>>   drivers/leds/Kconfig        | 10 ++++
>>>>>   drivers/leds/Makefile       |  1 +
>>>>>   drivers/leds/leds-bd71828.c | 97
>>>>> +++++++++++++++++++++++++++++++++++++
>>>>>   3 files changed, 108 insertions(+)
>>>>>   create mode 100644 drivers/leds/leds-bd71828.c
>>>>>
>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>> index b0fdeef10bd9..ec59f28bcb39 100644
>>>>> --- a/drivers/leds/Kconfig
>>>>> +++ b/drivers/leds/Kconfig
>>>>> @@ -529,6 +529,16 @@ config LEDS_BD2802
>>>>>   	  This option enables support for BD2802GU RGB LED
>>>>> driver chips
>>>>>   	  accessed via the I2C bus.
>>>>>   
>>>>> +config LEDS_BD71828
>>>>> +	tristate "LED driver for LED pins on ROHM BD71828 PMIC"
>>>>> +	depends on LEDS_CLASS
>>>> doesn't this have a dependency on MFD_ROHM_BD71828
>>>>> +	depends on I2C
>>>>> +	help
>>>>> +	  This option enables support for LED outputs located
>>>>> on ROHM
>>>>> +	   BD71828 power management IC. ROHM BD71828 has two
>>>>> led output
>>>>> pins
>>>>> +	   which can be left to indicate HW states or
>>>>> controlled by SW.
>>>>> Say
>>>>> +	   yes here if you want to enable SW control for these
>>>>> LEDs.
>>>>> +
>>>>
>>>> Add module statement
>>>
>>> What is the module statement? Do you mean the 'if you compile this
>>> as a
>>> module it will be called blahblah' or 'choose M to blahblah'?
>>>
>>> I've never understood why some entries have those statements.
>>> 'Choose
>>> M' stuff is help for config system - why should each module explain
>>> how
>>> to use configs? This information should be in more generic
>>> documentation. Furthermore, the 'tristate' there already says you
>>> can
>>> compile this as a module. Module name on the other hand really is
>>> module's property but it may well change if one changes the name of
>>> the
>>> file. That should not require change in KConfig. Furthermore, where
>>> do
>>> you need the module name? And if you really need the module name
>>> you
>>> should check the config name from Makefile to be sure - module/file
>>> names in comments or docs tend to get outdated.
>>>
>>> After all this being said - I can add any boilerplate text in
>>> KConfig
>>> if necessary - I just see zero benefit from this. And if you didn't
>>> mean this - can you then please tell me what is the module
>>> statement?
>>
>> Yes, like you noticed, this is boilerplate so please follow the
>> convention. If you'd like to discuss its relevance please submit
>> a message to kernel-janitors@vger.kernel.org.
> 
> I did follow the convention. There is 67 tristated LED drivers which do
> NOT add this module building babbling in description. Then there is 14
> drivers which do. So common convention even in LED subsystem is to NOT
> include meaningless mumbojumbo there.
> 
> So even regarding convention it is better to have short description to
> the point. That actually makes the requiring boilerplate even more
> useless. But as I said, I can put any meaningless letters there.
> (again, if I can't convince you to reconsider how you like the LED
> subsystem to appear like). Knowing how hard it is to help people
> reducing waste - it's may be easier for me than discussing this further
> :(

I will not insist - it's up to you. Unless Dan who raised the
issue sees that differently.

>>>>>   config LEDS_INTEL_SS4200
>>>>>   	tristate "LED driver for Intel NAS SS4200 series"
>>>>>   	depends on LEDS_CLASS
>>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>>>> index 41fb073a39c1..2a8f6a8e4c7c 100644
>>>>> --- a/drivers/leds/Makefile
>>>>> +++ b/drivers/leds/Makefile
>>>>> @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_AN30259A)		+=
>>>>> leds-an30259a.o
>>>>>   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>>>>>   obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
>>>>>   obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
>>>>> +obj-$(CONFIG_LEDS_BD71828)		+= leds-bd71828.o
>>>>>   obj-$(CONFIG_LEDS_CPCAP)		+= leds-cpcap.o
>>>>>   obj-$(CONFIG_LEDS_LOCOMO)		+= leds-locomo.o
>>>>>   obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
>>>>> diff --git a/drivers/leds/leds-bd71828.c b/drivers/leds/leds-
>>>>> bd71828.c
>>>>> new file mode 100644
>>>>> index 000000000000..2427619444f5
>>>>> --- /dev/null
>>>>> +++ b/drivers/leds/leds-bd71828.c
>>>>> @@ -0,0 +1,97 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +// Copyright (C) 2019 ROHM Semiconductors
>>>>> +
>>>>> +#include <linux/device.h>
>>>>> +#include <linux/err.h>
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/leds.h>
>>>>> +#include <linux/mfd/rohm-bd71828.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/platform_device.h>
>>>>> +#include <linux/regmap.h>
>>>>> +#include <linux/slab.h>
>>>>> +
>>>>> +#define BD71828_LED_TO_DATA(l) ((l)->id == ID_GREEN_LED ? \
>>>>> +	container_of((l), struct bd71828_leds, green) : \
>>>>> +	container_of((l), struct bd71828_leds, amber))
>>>>
>>>> I don't think we should be defining the color as the variable.
>>>> The 
>>>> outputs can drive any color LED.
>>>
>>> I used the colors mentioned in BD71828 data-sheet. It is true
>>> someone
>>> might use different LEDs on their board but at least this naming
>>> allows
>>> one to match the output to one in data-sheet. I can add comment
>>> explaining this if you thin it's worth mentioning.
>>
>> I see you've come up with below definitions in rohm-bd71828.h:
>>
>> #define BD71828_MASK_LED_AMBER		0x80
>> #define BD71828_MASK_LED_GREEN		0x40
>>
>> Is this how those bit fields are named in the data sheet?
> 
> The leds are through the document referred as "GRNLED" and "AMBLED".
> These specific bits are named "AMBLED_FORCE_ON" and "GRNLED_FORCE_ON".

OK, so then it's reasonable to use those names in the driver.
I would only add a comment next to the definitions, highlighting
that their names don't imply the scope of supported colors as this is
entirely irrelevant.

>>>>> +
>>>>> +enum {
>>>>> +	ID_GREEN_LED,
>>>>> +	ID_AMBER_LED,
>>>>> +	ID_NMBR_OF,
>>>>> +};
>>>>> +
>>>>
>>>> Please use the color_id in linux/include/dt-
>>>> bindings/leds/common.h
>>>
>>> Maybe I should not include anything from dt-bindings if I don't use
>>> DT
>>> for this sub-device? (Please see the comments below).
>>
>> But you should.
> 
> Is this your final say? You think I can't convince you to reconsider?
> 
> Anyways, this is LED ID, not color property. Eg, this is not defining
> the color, this is identifying the LED. Please see the macro:
> 
> #define BD71828_LED_TO_DATA(l) ((l)->id == ID_GREEN_LED ? \
>         container_of((l), struct bd71828_leds, green) : \
>         container_of((l), struct bd71828_leds, amber))
> 
> which is used to obtain the pointer to driver data based on pointer to
> led structure. Eg, we get the correct offset by determining which LED
> was contolled (based on the LED ID).
> 
>>
>>>>> +struct bd71828_led {
>>>>> +	int id;
>>>>> +	struct led_classdev l;
>>>>> +	u8 force_mask;
>>>>> +};
>>>>> +
>>>>> +struct bd71828_leds {
>>>>> +	struct rohm_regmap_dev *bd71828;
>>>>> +	struct bd71828_led green;
>>>>> +	struct bd71828_led amber;
>>>>> +};
>>>>> +
>>>>> +static int bd71828_led_brightness_set(struct led_classdev
>>>>> *led_cdev,
>>>>> +				      enum led_brightness
>>>>> value)
>>>>> +{
>>>>> +	struct bd71828_led *l = container_of(led_cdev, struct
>>>>> bd71828_led, l);
>>>>> +	struct bd71828_leds *data;
>>>>> +	unsigned int val = BD71828_LED_OFF;
>>>>> +
>>>>> +	data = BD71828_LED_TO_DATA(l);
>>>>> +	if (value != LED_OFF)
>>>>> +		val = BD71828_LED_ON;
>>>>> +
>>>>> +	return regmap_update_bits(data->bd71828->regmap,
>>>>> BD71828_REG_LED_CTRL,
>>>>> +			    l->force_mask, val);
>>>>> +}
>>>>> +
>>>>> +static int bd71828_led_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	struct rohm_regmap_dev *bd71828;
>>>>> +	struct bd71828_leds *l;
>>>>> +	struct bd71828_led *g, *a;
>>>>> +	static const char *GNAME = "bd71828-green-led";
>>>>> +	static const char *ANAME = "bd71828-amber-led";
>>>> The LED class creates the name it can get it from the DT.
>>>
>>> I did not add DT node for LEDs as I thought this is preferred way
>>> when
>>> there is not much HW information to bring from DT. I am not sure as
>>> previous PMICs I did drivers for didn't have LEDs though. Currently
>>> this is a MFD sub-device and gets no data from DT. Actually the
>>> driver
>>> crashed when I first didn't explicitly give these names.
>>
>> Please compare below bindings of MFD devices with LED support:
>>
>> Documentation/devicetree/bindings/mfd/max77693.txt
>> Documentation/devicetree/bindings/mfd/ti-lmu.txt
>>
>> Please follow them but use new 'function' and 'color' properties
>> instead of 'label'.
>>
>>>>> +	int ret;
>>>>> +
>>>>> +	pr_info("bd71828 LED driver probed\n");
>>> as a comment from myself - this print should be eliminated or by
>>> minimum converted to dev_dbg.
>>>
>>>>> +
>>>>> +	bd71828 = dev_get_drvdata(pdev->dev.parent);
>>>>> +	l = devm_kzalloc(&pdev->dev, sizeof(*l), GFP_KERNEL);
>>>>> +	if (!l)
>>>>> +		return -ENOMEM;
>>>>> +	l->bd71828 = bd71828;
>>>>> +	a = &l->amber;
>>>>> +	g = &l->green;
>>>>> +	a->id = ID_AMBER_LED;
>>>>> +	g->id = ID_GREEN_LED;
>>>>> +	a->force_mask = BD71828_MASK_LED_AMBER;
>>>>> +	g->force_mask = BD71828_MASK_LED_GREEN;
>>>>> +
>>>>> +	a->l.name = ANAME;
>>>>> +	g->l.name = GNAME;
>>>>> +	a->l.brightness_set_blocking =
>>>>> bd71828_led_brightness_set;
>>>>> +	g->l.brightness_set_blocking =
>>>>> bd71828_led_brightness_set;
>>>>> +
>>>>> +	ret = devm_led_classdev_register(&pdev->dev, &g->l);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	return devm_led_classdev_register(&pdev->dev, &a->l);
>>
>> This way you force users to always register two LED class devices
>> whereas they might need only one. Please compare how other LED class
>> drivers handle DT parsing and LED class device registration.
> 
> I am not sure if I understand correctly what you mean by using only one
> class device. As I (hopefully) somewhere said - users can't control
> only one of these LEDs. If they decide to enable one led by SW, then
> they inevitably control also the other. Thus it is better that user
> gets control to both of the LEDs if they take the control for one.
> 
> Or do you mean I could achieve the control for both of these LEDs via
> only one class device?

AFAIU the LEDs, when in SW mode, can be controlled independently, right?
Because if not then there is no point in having separate LED class
devices.

But if I get it right, then allowing for registering only one LED class
device is entirely justifiable - think of a situation when the iout
remains not connected on the board.

>>
>>>>> +}
>>>>> +
>>>>
>>>> This looks different.  Not sure why you register both LEDs in
>>>> this
>>>> probe.
>>>>
>>>> You can use the DT to define both LEDs and then each will be
>>>> probed
>>>> and 
>>>> registered separately.
>>>
>>> As I mentioned above, this driver is currently not using DT at all.
>>> Reason why it does not is that I didn't know all the LEDs are
>>> usually
>>> having own DT entries/drivers.
>>>
>>> But there is actually reason for bundling the LEDs to same driver.
>>> What
>>> is not shown in driver is that LEDs can be controlled by PMIC state
>>> machine so that they are indicating charger states. Other option is
>>
>> This can be handled by the LED trigger that your driver should
>> expose.
>> On activation the trigger would setup the hardware to control the
>> LEDs. But that can be covered later.
> 
> Yet another thing for me to learn =) I looked at the trigger properties
> in DT. That looked like a way to make the LED framework to "bind" the
> LED state to some trigger. (For example make the LED framework to
> toggle specific LED state when USB device is plugged?)
> 
> If this is the case then it might not be relevant for BD71828. Here the
> LED is by-default controlled by HW. Eg, when charger starts charging
> the battery, the PMIC will lit the LED. It will do so also when power
> button is pressed or certain problems are detected. This reqires no SW
> interaction.

The trigger can be always deactivated from sysfs as well as set up
again.

> 
> What this driver intends to do is to allow SW to take over this. Eg, if
> system is designed so that it is preferably to use these LEDs for some
> other purpose it can be done by loading this LED driver and allowing
> user-space to control these LEDs via sysfs.

So the LED trigger interface would help to signalize in which state
the LED is. If the trigger is set then it means the LED is under hw
control.

>>> driving LEDs using this driver - but forcing one of the LEDs will
>>> cause
>>> also the other LED to be under SW control. Eg, one can't control
>>> just
>>> single LED using SW, its both of them or none.
>>
>> So this limitation will have to by documented in the trigger ABI.
>>
>>>> This is how it is commonly done.
>>>>
>>>> You can reference the LM36274 led driver as this is a MFD device
>>>> to
>>>> the 
>>>> ti-lmu.c in the MFD directory.
>>>
>>> Thanks for pointing this out. I will gladly see how others have it
>>> implemented! I just would like to know if the DT binding is really
>>> a
>>> must? In this case I am unsure what LED related extra information
>>> we
>>> could really give from DT (for this specific device).
>>>
>>> I just checked the lm36274 you mentioned. I see that also lm36274
>>> do
>>> parse the dt and set the name itself (so maybe the led_class is not
>>> doing this after all?) - although the name setting code in lm36274
>>> is a
>>> bit peculiar as it loops through all child nodes and overwrites the
>>> old
>>> name if it finds more than one "label" properties from nodes (if I
>>> read
>>> the code correctly).
>>>
>>> In any case I am unsure what is the benefit from using DT and
>>> adding
>>> the DT parsing code for this PMIC's LEDs. I could understand DT
>>> usage
>>> if LED class handled dt parsing and if there was something to
>>> configure
>>> in BD71828 LEDs - but I see no such benefits in this case.
>>
>> I hope I was able to clarify most of your doubts.
> 
> Thanks again for taking the time to check this out. I appreciate the
> effort you guys put into this! And what comes to my doubts - yes, I
> still have a few ;) But I am sure we can work this out. Thanks a bunch
> for this discussion Jacek!

You're welcome!

-- 
Best regards,
Jacek Anaszewski
