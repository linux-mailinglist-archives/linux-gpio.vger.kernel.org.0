Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E732680ED
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Sep 2020 21:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgIMTLy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 15:11:54 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:48942 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgIMTLx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 15:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600024312; x=1631560312;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=+VgAIgh+Py6mj3na0ijrCwl0Z/NjJ7JtWl8Awedh1FA=;
  b=MUJf0WxysCxuB7+IlnMt+OjzfenZ2XbASqcIya6BGGbhdtBwdtI8fbQy
   KOSCDRIbiTXZfSnmc3pRY3/ZyhmGS/+oXjbhmCoIMQIAD2+0Qseytz6T8
   sov882jWnulzK+8/ZeDcy6RZx67Qq7jOm31BUji581HiJ8IPp7MBOfFy7
   zUm9xzOxxnIcy9B0QPJXjvv7g5zsZ8DPR5Q9w3RLVFFHSCWIjj+5cB1Mq
   h+f5TRWME/1oUsAzgqldAcp156QJ/zJGKUZZcl7KFO2EwOkDLkEBUOn+9
   kmd+r1Rk9QoEN/6+Cn3kTLpE9oqY+Mx+bPIBJN9SGUUiez2P0/fASkIxE
   g==;
IronPort-SDR: WhudMxrX8gTYscexf1bBtUECJhaQfGrVZURQ5Z2R7JfYTIOwHxsjpQCYuDhfytqh/f9LMIDB3i
 N0pCPkevfMA7Idm3l8J7Y6ZtKS/Al0/vF59HJmr5aUfLZlZhkkkLkmvxDloUC//WZkwtbEvRqn
 KIHVHsz3Z1JCek9S+JDkSm0BF1Og1dQ6DvvBsZgQ9+052zvPc6nAnLMJHmjP8WQR9mwyXvTuzY
 pSiugo+sD2jKWf2hWdWPZZ87U6BTeXINUOUQBL9bmLkNwRyNhCiZ8H15JSsuN9ciY5HjXhlI67
 9M0=
X-IronPort-AV: E=Sophos;i="5.76,423,1592895600"; 
   d="scan'208";a="95548931"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Sep 2020 12:11:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 13 Sep 2020 12:11:47 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sun, 13 Sep 2020 12:11:45 -0700
References: <20200903133528.8595-1-lars.povlsen@microchip.com> <20200903133528.8595-2-lars.povlsen@microchip.com> <CACRpkdZUQG1T_Bx5G275tSjDez0skDKGSc370B57FZ35NA6iEA@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-mchp-sgpio driver
In-Reply-To: <CACRpkdZUQG1T_Bx5G275tSjDez0skDKGSc370B57FZ35NA6iEA@mail.gmail.com>
Date:   Sun, 13 Sep 2020 21:11:48 +0200
Message-ID: <87r1r5wky3.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> Hi Lars,
>
> thanks for your patch!

You're welcome - thank you for you taking time to review it!

>
> On Thu, Sep 3, 2020 at 3:35 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> This adds DT bindings for the Microsemi/Microchip SGPIO controller,
>
> What I do not understand is why this GPIO controller is placed in the
> bindings of the pin controllers? Do you plan to add pin control
> properties to the bindings in the future?

I have made provisions for some of the generic pinconf parameters, and
since the controller also has support for some alternate modes like
(syncronized) blink at various rates, I thought I better add it as
pinctrl straight away.

>
>> +description: |
>> +  By using a serial interface, the SIO controller significantly extend
>> +  the number of available GPIOs with a minimum number of additional
>> +  pins on the device. The primary purpose of the SIO controllers is to
>> +  connect control signals from SFP modules and to act as an LED
>> +  controller.
>
> This doesn't sound like it will ever be pin control?

above.

>
>> +  gpio-controller: true
>> +
>> +  '#gpio-cells':
>> +    description: GPIO consumers must specify four arguments, first the
>> +      port number, then the bit number, then a input/output flag and
>> +      finally the GPIO flags (from include/dt-bindings/gpio/gpio.h).
>> +      The dt-bindings/gpio/mchp-sgpio.h file define manifest constants
>> +      PIN_INPUT and PIN_OUTPUT.
>> +    const: 4
>
> I do not follow this new third input/output flag at all.
>

Its actually a sort of bank address, since the individual "pins" are
unidirectional.

The PIN_INPUT/PIN_OUTPUT is defined in similar fashion in other pinctrl
binding header files... I can drop the define and use, but as it will be
used to address individual pins, I think it adds to readability.

Like this (excerpts from a DT with a switchdev driver using SFP's and
LED's on sgpio):

/{
	leds {
		compatible = "gpio-leds";
		led@0 {
			label = "eth60:yellow";
			gpios = <&sgpio1 28 0 PIN_OUTPUT GPIO_ACTIVE_LOW>;
			default-state = "off";
		};
		...
	};
};

&axi {
	sfp_eth60: sfp-eth60 {
		compatible	   = "sff,sfp";
		i2c-bus            = <&i2c152>;
		tx-disable-gpios   = <&sgpio2 28 0 PIN_OUTPUT GPIO_ACTIVE_LOW>;
		rate-select0-gpios = <&sgpio2 28 1 PIN_OUTPUT GPIO_ACTIVE_HIGH>;
		los-gpios          = <&sgpio2 28 0 PIN_INPUT GPIO_ACTIVE_HIGH>;
		mod-def0-gpios     = <&sgpio2 28 1 PIN_INPUT GPIO_ACTIVE_LOW>;
		tx-fault-gpios     = <&sgpio2 28 2 PIN_INPUT GPIO_ACTIVE_HIGH>;
	};
	...
};
                
> - If it is a property of the hardware, it is something the driver should
>   handle by determining which hardware it is from the compatible
>   string.
>
> - If it is a configuration it should be turned into something that is generic
>   and useful for *all* GPIO controllers. If it is pin config it should use
>   the pinconf bindings rather than shortcuts like this, but I think it is
>   something the driver can do as an effect of the pin being requested
>   as input or output in the operating system, depending on who the
>   consumer is. Linux for example has GPIOD_OUT_LOW,
>   GPIOD_OUT_HIGH, GPIOD_IN, GPIOD_ASIS...
>
> - Is it not just a hog? We have bindings for those.

I hope the above shed some light on this.

>
>> +  microchip,sgpio-port-ranges:
>> +    description: This is a sequence of tuples, defining intervals of
>> +      enabled ports in the serial input stream. The enabled ports must
>> +      match the hardware configuration in order for signals to be
>> +      properly written/read to/from the controller holding
>> +      registers. Being tuples, then number of arguments must be
>> +      even. The tuples mast be ordered (low, high) and are
>> +      inclusive. Arguments must be between 0 and 31.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 64
>
> And you are *absolutely sure* that you can't just figure this out
> from the compatible string? Or add a few compatible strings for
> the existing variants?
>

Yes, this really needs to be configured for each board individually -
and cant be probed. It defines how the bitstream to/from the shift
registers is constructed/demuxed.

>> +  microchip,sgpio-frequency:
>> +    description: The sgpio controller frequency (Hz). This dictates
>> +      the serial bitstream speed, which again affects the latency in
>> +      getting control signals back and forth between external shift
>> +      registers. The speed must be no larger than half the system
>> +      clock, and larger than zero.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    default: 12500000
>
> I understand why you need this binding now, OK.
>
>> +/* mchp-sgpio specific pin type defines */
>> +#undef PIN_OUTPUT
>> +#undef PIN_INPUT
>> +#define PIN_OUTPUT     0
>> +#define PIN_INPUT      1
>
> I'm not a fan of this. It seems like something that should be set in
> response to the gpiochip callbacks .direction_input and
> .direction_output callbacks.
>

As I tried to explain above, its a part of the pin address - aka bank
selector - whether your are accessing the input or the output side. And
since the directions have totally different - and concurrent - use, they
need to be individually addressed, not "configured".

In the example presented, sgpio2-p28b0 IN is loss-of-signal, and the
OUT is the sfp tx-disable control.

> Yours,
> Linus Walleij

---Lars

-- 
Lars Povlsen,
Microchip
