Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E271127E50B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729248AbgI3JVq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbgI3JVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:21:40 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14992C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:21:40 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so1268076lfb.6
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDALLkEBZ3g+XnHosKYd5kNAL+8/krUGOWN367VieQw=;
        b=UcVYPUG6V9xpIygyNaSFeeW11q0jC3otxEzCW5tdEYBbg2lLdQhtIH7CzmwXgKaiS3
         1BN34bY6ziO20ONgBRrIi18eR/G5aXmO560OEv6xdTyBRf4JCzkCpB427MuiEvyInR0A
         K1YF0fdMW0euDWU9AxB7jUAjIjslPtI2sA3sjcWu3vR6aBxRwHPJrSTscaBI0qtD5NRu
         reohlHs1BYRxasdl0rGel7ICYX3AyV6n+L4LSDD1LD78OLCIEjdMmVasW84Auj566N/r
         8/jTnB3duHLfevNiq7WjY3GFi/su0eLx3h548CZm0cVu9W5GLXxydMB4vCcbwB6fwx55
         ejew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDALLkEBZ3g+XnHosKYd5kNAL+8/krUGOWN367VieQw=;
        b=QWFQub8mWBKn2AJh20liQ/d9XDksM/BkSeVthZMV2HWDSfvWjoKXSQIfR4+6ctFJt5
         IV3XHgcchG6w01kuIznncKzs4iBMARnq0TZwH/3urYNOmZBsKa0SxkFn2799I+/igyc6
         MHhKansCeRt3co8AABrBhjvMSBn0BV3Lhb64Ynuy8euE6OpGbaGmQdaU8PZ52rFM5hJ8
         4c5SQC6gBHAISvLAAz1Dg7LMzQgYou6v+WUKfOFcBy5hJMTKlUlZrN7Bl2jEBTVD1oZR
         a2edSpH1qglc3Fx5o3yb50yndZtp+Q7QRmfxaCynAvBmuupQWezP2NcyQnlnKS/53PgR
         0xWA==
X-Gm-Message-State: AOAM532wUfKjRm9j3ukNxxU20Mc9iKXYVe2ySw19YeWpmcOT3dzRK20e
        cW0Bsq67voV/0eRriBBYxlcSgwSavpqCSSIENB1eAg==
X-Google-Smtp-Source: ABdhPJwA8MFQ966zPAFFRvo1oCHuuRNQ2mM89Bj+Zwhrq8WSo27dINGhXF6SeriHIm3TsyAfpOcS/0a0OIVG6S2W3I8=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr512735lfg.441.1601457698203;
 Wed, 30 Sep 2020 02:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200903133528.8595-1-lars.povlsen@microchip.com>
 <20200903133528.8595-2-lars.povlsen@microchip.com> <CACRpkdZUQG1T_Bx5G275tSjDez0skDKGSc370B57FZ35NA6iEA@mail.gmail.com>
 <87r1r5wky3.fsf@soft-dev15.microsemi.net>
In-Reply-To: <87r1r5wky3.fsf@soft-dev15.microsemi.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:21:27 +0200
Message-ID: <CACRpkdYxK6Uf1_3Me7hbJZ+rPAUXCj4k7D2e5je7iBNZosEtQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add bindings for
 pinctrl-mchp-sgpio driver
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lars,

thanks for working on this!

On Sun, Sep 13, 2020 at 9:11 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> > What I do not understand is why this GPIO controller is placed in the
> > bindings of the pin controllers? Do you plan to add pin control
> > properties to the bindings in the future?
>
> I have made provisions for some of the generic pinconf parameters, and
> since the controller also has support for some alternate modes like
> (syncronized) blink at various rates, I thought I better add it as
> pinctrl straight away.

OK fair enough let's keep the bindings here.

BTW the latter function sounds like some kind of PWM?

> >> +  gpio-controller: true
> >> +
> >> +  '#gpio-cells':
> >> +    description: GPIO consumers must specify four arguments, first the
> >> +      port number, then the bit number, then a input/output flag and
> >> +      finally the GPIO flags (from include/dt-bindings/gpio/gpio.h).
> >> +      The dt-bindings/gpio/mchp-sgpio.h file define manifest constants
> >> +      PIN_INPUT and PIN_OUTPUT.
> >> +    const: 4
> >
> > I do not follow this new third input/output flag at all.
>
> Its actually a sort of bank address, since the individual "pins" are
> unidirectional.

I'm a bit confused here...
The standard advice for any "banked" GPIOs is to represent
each "bank" as a separate node (with a corresponding gpio_chip
in the Linux kernel). Then you can just use the standard
bindings to pick a line from one of these nodes.

> The PIN_INPUT/PIN_OUTPUT is defined in similar fashion in other pinctrl
> binding header files... I can drop the define and use, but as it will be
> used to address individual pins, I think it adds to readability.

Hmmm. What makes these names expecially confusing is the
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml defines:
input-enable
input-disable
output-enable
output-high
output-low

In the Linux kernel further there is:
include/linux/pinctrl/pinconf-generic.h that defines:
PIN_CONFIG_INPUT_ENABLE
PIN_CONFIG_OUTPUT_ENABLE
PIN_CONFIG_OUTPUT

Since you are using the pin control framework this gets really
hard to hash out.

I don't really understand why it is needed.

> Like this (excerpts from a DT with a switchdev driver using SFP's and
> LED's on sgpio):
>
> /{
>         leds {
>                 compatible = "gpio-leds";
>                 led@0 {
>                         label = "eth60:yellow";
>                         gpios = <&sgpio1 28 0 PIN_OUTPUT GPIO_ACTIVE_LOW>;
>                         default-state = "off";
>                 };
>                 ...
>         };
> };

If what you intend to achieve is to make the GPIO come up in output mode,
you can either just have the driver do that as needed by the consumer.
If you absolutely have to do it in the device tree, then implement
pin control (pin config) and have it something like this:

leds {
        compatible = "gpio-leds";
        pinctrl-names = "default";
        pinctrl-0 = <&my_led_pinctrl>;
        led@0 {
                label = "eth60:yellow";
                gpios = <&sgpio1 28 GPIO_ACTIVE_LOW>;
                default-state = "off";
        };
        ...

        my_led_pinctrl: pinctrl-led {
                pins = "gpio95"; // Just an example way of referring to the pin
                bias-disable;
                output-enable;
        };
};

> >> +  microchip,sgpio-port-ranges:
> >> +    description: This is a sequence of tuples, defining intervals of
> >> +      enabled ports in the serial input stream. The enabled ports must
> >> +      match the hardware configuration in order for signals to be
> >> +      properly written/read to/from the controller holding
> >> +      registers. Being tuples, then number of arguments must be
> >> +      even. The tuples mast be ordered (low, high) and are
> >> +      inclusive. Arguments must be between 0 and 31.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 2
> >> +    maxItems: 64
> >
> > And you are *absolutely sure* that you can't just figure this out
> > from the compatible string? Or add a few compatible strings for
> > the existing variants?
>
> Yes, this really needs to be configured for each board individually -
> and cant be probed. It defines how the bitstream to/from the shift
> registers is constructed/demuxed.

And you have considered the option of simply letting the driver
check which board we are then? The property at the very
top of the device tree.

if (of_machine_is_compatible("my_board")) {
    ....
} else if (of_machine_is_compatible("my_other_board")) {
    ....
}

So that you simply use the board compatible string to determine
this?

> >> +/* mchp-sgpio specific pin type defines */
> >> +#undef PIN_OUTPUT
> >> +#undef PIN_INPUT
> >> +#define PIN_OUTPUT     0
> >> +#define PIN_INPUT      1
> >
> > I'm not a fan of this. It seems like something that should be set in
> > response to the gpiochip callbacks .direction_input and
> > .direction_output callbacks.
> >
>
> As I tried to explain above, its a part of the pin address - aka bank
> selector - whether your are accessing the input or the output side. And
> since the directions have totally different - and concurrent - use, they
> need to be individually addressed, not "configured".
>
> In the example presented, sgpio2-p28b0 IN is loss-of-signal, and the
> OUT is the sfp tx-disable control.

I suspect the proper way to do it is to create one node for
the input side and one node for the output side and also create
two different gpio chips in the kernel.

my-device {
       compatible = "my-device";
       gpioin: input-gpio {
           ....
       };
       gpioout: output-gpio {
           ....
       };
};

Note: I didn't think over the naming in this example.

You will need code in your driver to parse the subnodes and
populate two gpio_chips.

Yours,
Linus Walleij
