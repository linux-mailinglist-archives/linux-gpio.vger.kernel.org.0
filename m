Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9D32831CD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 10:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJEIVI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 04:21:08 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:4668 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgJEIVI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 04:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1601886067; x=1633422067;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=XMuN0bNMo3ru9pfjhL9Lk/8bn2f2+41c5m3S+Lnm8Lk=;
  b=LnjNzZzbd0LQuIXsQkWWv9pWCoy4FH4gZ1kaZMDz1ng61qmv2SBGUq4y
   OFsrlBheXHcna7woLXq1vR0RFMy9o/bi2QlHlPLLvPpGzDrHqpV7Trv9D
   Mt50cKvSzl2TiJHAheqPPIQq7Lv+rYrlgTkBvlpI2U22umDEnHFaVFGXS
   Xb1r8l7ivNTqhMT1th+zryRRVi6Q3SjyR5CjsMNIu0fyVkqdIISNKeSB/
   RYFNISNpaOE614ZmMPA18C6zscsqePlK3ksWEjb14R7Lq6dq4xaTnpR7a
   M6QrqzSSn1ZLuvFW0H9PA5OI1PRZ2184TdnLRWg/3b+dQlkNZGn1W5/mk
   g==;
IronPort-SDR: pyKFPTQM1P4WcuEoDRkyK3x4CeHDogceLVDDPsF8i0nEtMl3dOqfpTsF4isW5sYYeLK8zw3yNS
 /0BSfNmzMavXiNFGD2YfcJw0SaeXEZ9KPQdaL06l5MWKwWZ2nS6m7jiOnL+7IdQ3CjlsqJqJCW
 RKYLz8YdrJSOwvf+iQ20NvpQrRBLqrO+BAPeiFhln3VVJko9pjZHXw5FqiHN8C25E1JZBe8EWU
 hUeIue3yf4J4UfOt9huE3RdevCa/ypKXG6xozks9Y9A0QFIzrbJ1Z0Yre1QyABZQi0D3Vhvafd
 DMk=
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="28719323"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2020 01:21:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 5 Oct 2020 01:21:04 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 5 Oct 2020 01:21:03 -0700
References: <20200903133528.8595-1-lars.povlsen@microchip.com> <20200903133528.8595-2-lars.povlsen@microchip.com> <CACRpkdZUQG1T_Bx5G275tSjDez0skDKGSc370B57FZ35NA6iEA@mail.gmail.com> <87r1r5wky3.fsf@soft-dev15.microsemi.net> <CACRpkdYxK6Uf1_3Me7hbJZ+rPAUXCj4k7D2e5je7iBNZosEtQw@mail.gmail.com>
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
In-Reply-To: <CACRpkdYxK6Uf1_3Me7hbJZ+rPAUXCj4k7D2e5je7iBNZosEtQw@mail.gmail.com>
Date:   Mon, 5 Oct 2020 10:21:02 +0200
Message-ID: <87lfglxevl.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> Hi Lars,
>
> thanks for working on this!
>
> On Sun, Sep 13, 2020 at 9:11 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> > What I do not understand is why this GPIO controller is placed in the
>> > bindings of the pin controllers? Do you plan to add pin control
>> > properties to the bindings in the future?
>>
>> I have made provisions for some of the generic pinconf parameters, and
>> since the controller also has support for some alternate modes like
>> (syncronized) blink at various rates, I thought I better add it as
>> pinctrl straight away.
>
> OK fair enough let's keep the bindings here.
>
> BTW the latter function sounds like some kind of PWM?

Yes, it has PWM functionality as well.

>
>> >> +  gpio-controller: true
>> >> +
>> >> +  '#gpio-cells':
>> >> +    description: GPIO consumers must specify four arguments, first the
>> >> +      port number, then the bit number, then a input/output flag and
>> >> +      finally the GPIO flags (from include/dt-bindings/gpio/gpio.h).
>> >> +      The dt-bindings/gpio/mchp-sgpio.h file define manifest constants
>> >> +      PIN_INPUT and PIN_OUTPUT.
>> >> +    const: 4
>> >
>> > I do not follow this new third input/output flag at all.
>>
>> Its actually a sort of bank address, since the individual "pins" are
>> unidirectional.
>
> I'm a bit confused here...
> The standard advice for any "banked" GPIOs is to represent
> each "bank" as a separate node (with a corresponding gpio_chip
> in the Linux kernel). Then you can just use the standard
> bindings to pick a line from one of these nodes.

Yes, that seems to be a good model.

>
>> The PIN_INPUT/PIN_OUTPUT is defined in similar fashion in other pinctrl
>> binding header files... I can drop the define and use, but as it will be
>> used to address individual pins, I think it adds to readability.
>
> Hmmm. What makes these names expecially confusing is the
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml defines:
> input-enable
> input-disable
> output-enable
> output-high
> output-low
>
> In the Linux kernel further there is:
> include/linux/pinctrl/pinconf-generic.h that defines:
> PIN_CONFIG_INPUT_ENABLE
> PIN_CONFIG_OUTPUT_ENABLE
> PIN_CONFIG_OUTPUT
>
> Since you are using the pin control framework this gets really
> hard to hash out.
>

Yes, as the pins are fixed-function, the "input-enable", "input-disable"
and "output-enable" are not really useful.

> I don't really understand why it is needed.
>
>> Like this (excerpts from a DT with a switchdev driver using SFP's and
>> LED's on sgpio):
>>
>> /{
>>         leds {
>>                 compatible = "gpio-leds";
>>                 led@0 {
>>                         label = "eth60:yellow";
>>                         gpios = <&sgpio1 28 0 PIN_OUTPUT GPIO_ACTIVE_LOW>;
>>                         default-state = "off";
>>                 };
>>                 ...
>>         };
>> };
>
> If what you intend to achieve is to make the GPIO come up in output mode,
> you can either just have the driver do that as needed by the consumer.
> If you absolutely have to do it in the device tree, then implement
> pin control (pin config) and have it something like this:
>
> leds {
>         compatible = "gpio-leds";
>         pinctrl-names = "default";
>         pinctrl-0 = <&my_led_pinctrl>;
>         led@0 {
>                 label = "eth60:yellow";
>                 gpios = <&sgpio1 28 GPIO_ACTIVE_LOW>;
>                 default-state = "off";
>         };
>         ...
>
>         my_led_pinctrl: pinctrl-led {
>                 pins = "gpio95"; // Just an example way of referring to the pin
>                 bias-disable;
>                 output-enable;
>         };
> };

No, the PIN_OUTPUT is purely for adressing. But as you suggested, I'll
split the into separate nodes. That will eliminate the "PIN_OUTPUT" and
the bindings header.

>
>> >> +  microchip,sgpio-port-ranges:
>> >> +    description: This is a sequence of tuples, defining intervals of
>> >> +      enabled ports in the serial input stream. The enabled ports must
>> >> +      match the hardware configuration in order for signals to be
>> >> +      properly written/read to/from the controller holding
>> >> +      registers. Being tuples, then number of arguments must be
>> >> +      even. The tuples mast be ordered (low, high) and are
>> >> +      inclusive. Arguments must be between 0 and 31.
>> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> >> +    minItems: 2
>> >> +    maxItems: 64
>> >
>> > And you are *absolutely sure* that you can't just figure this out
>> > from the compatible string? Or add a few compatible strings for
>> > the existing variants?
>>
>> Yes, this really needs to be configured for each board individually -
>> and cant be probed. It defines how the bitstream to/from the shift
>> registers is constructed/demuxed.
>
> And you have considered the option of simply letting the driver
> check which board we are then? The property at the very
> top of the device tree.
>
> if (of_machine_is_compatible("my_board")) {
>     ....
> } else if (of_machine_is_compatible("my_other_board")) {
>     ....
> }

No, board-specific code is undesireable, as our customers should be able
to design own boards without driver changes.

>
> So that you simply use the board compatible string to determine
> this?
>
>> >> +/* mchp-sgpio specific pin type defines */
>> >> +#undef PIN_OUTPUT
>> >> +#undef PIN_INPUT
>> >> +#define PIN_OUTPUT     0
>> >> +#define PIN_INPUT      1
>> >
>> > I'm not a fan of this. It seems like something that should be set in
>> > response to the gpiochip callbacks .direction_input and
>> > .direction_output callbacks.
>> >
>>
>> As I tried to explain above, its a part of the pin address - aka bank
>> selector - whether your are accessing the input or the output side. And
>> since the directions have totally different - and concurrent - use, they
>> need to be individually addressed, not "configured".
>>
>> In the example presented, sgpio2-p28b0 IN is loss-of-signal, and the
>> OUT is the sfp tx-disable control.
>
> I suspect the proper way to do it is to create one node for
> the input side and one node for the output side and also create
> two different gpio chips in the kernel.
>
> my-device {
>        compatible = "my-device";
>        gpioin: input-gpio {
>            ....
>        };
>        gpioout: output-gpio {
>            ....
>        };
> };
>
> Note: I didn't think over the naming in this example.
>
> You will need code in your driver to parse the subnodes and
> populate two gpio_chips.

Yes, I will modify the driver to use separate nodes for each direction.

Thank you for your comments, it is highly appreciated.

---Lars

>
> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
