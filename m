Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAC2114E16
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 10:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfLFJR7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 04:17:59 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39686 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfLFJR4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 04:17:56 -0500
Received: by mail-ot1-f67.google.com with SMTP id 77so5236469oty.6;
        Fri, 06 Dec 2019 01:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LnYDT3hI/k51rxu2RaEtNc8OwzQHfHd+q89Ne01SQkk=;
        b=i8XqSJ8EyU3t8phhK3P1n3Vpc58AD0GLFDx0f4/nFn2f7RC6nQnbb0pWWTomGtoA2C
         c5fFw5n1hdHBUfIzjfHj/TlTmpDVFq92dwDPMcNUVbg6yFf+lOo3JXNOQ/6WaO3IZuXr
         o+DKK/R4H2fUcnU2NGEXmDwIBYIXirkX2hLgcTwbfDqIiTT0qdjfe9FKZQRHWa98kUJX
         7MGEmmhIrZPOUM546BLPDx6niA8YOmicOJxLwbBnEVg/xxSWJ34T+OK0HaZcShj4TM8h
         +BWA4dmM+2CmZ7E80E8liDjhaDBAMQAlkJsKeGfBcEgYlXNhj5FAg2J7Rq/JauAvcWt6
         u81w==
X-Gm-Message-State: APjAAAWf+Ot67oMaGFU3qjlFzOdyil+x382sF+mHh/XNzFi9ghDueMM0
        6EVsQlWJh1lQqrQhCAEftW8AIMktCL/6ewfiC54=
X-Google-Smtp-Source: APXvYqywT7RKZxy4+aQ3yqIAX1ukNQgZt1Pm6duFwv33bTsc5FszW5c30r7KI+ch+vUt5vv52/IvfRSxlMnY6lawJl4=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr5241089otm.297.1575623875215;
 Fri, 06 Dec 2019 01:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-5-geert+renesas@glider.be> <20191205210653.GA29969@bogus>
In-Reply-To: <20191205210653.GA29969@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Dec 2019 10:17:43 +0100
Message-ID: <CAMuHMdXKPC7-XaezodwL1Dhvke6PUVSZEbvN-sm3Uh6T61qbhQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: gpio: Add gpio-repeater bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Thu, Dec 5, 2019 at 10:06 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Nov 27, 2019 at 09:42:50AM +0100, Geert Uytterhoeven wrote:
> > Add Device Tree bindings for a GPIO repeater, with optional translation
> > of physical signal properties.  This is useful for describing explicitly
> > the presence of e.g. an inverter on a GPIO line, and was inspired by the
> > non-YAML gpio-inverter bindings by Harish Jenny K N
> > <harish_kandiga@mentor.com>[1].
> >
> > Note that this is different from a GPIO Nexus Node[2], which cannot do
> > physical signal property translation.
>
> It can't? Why not? The point of the passthru mask is to not do
> translation of flags, but without it you are always doing translation of
> cells.

Thanks for pushing me deeper into nexuses!
You're right, you can map from one type to another.
However, you cannot handle the "double inversion" of an ACTIVE_LOW
signal with a physical inverter added:

        nexus: led-nexus {
                #gpio-cells = <2>;
                gpio-map = <0 0 &gpio2 19 GPIO_ACTIVE_LOW>,     // inverted
                           <1 0 &gpio2 20 GPIO_ACTIVE_HIGH>,    // noninverted
                           <2 0 &gpio2 21 GPIO_ACTIVE_LOW>;     // inverted
                gpio-map-mask = <3 0>;
                // default gpio-map-pass-thru = <0 0>;
        };

        leds {
                compatible = "gpio-leds";
                led6-inverted {
                        gpios = <&nexus 0 GPIO_ACTIVE_HIGH>;
                };
                led7-noninverted {
                        gpios = <&nexus 1 GPIO_ACTIVE_HIGH>;
                };
                led8-double-inverted {  // FAILS: still inverted
                        gpios = <&nexus 2 GPIO_ACTIVE_LOW>;
                };
        };

It "works" if the last entry in gpio-map is changed to GPIO_ACTIVE_HIGH.
Still, the consumer would see the final translated polarity, and not the
actual one it needs to program the consumer for.

> > While an inverter can be described implicitly by exchanging the
> > GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags, this has its limitations.
> > Each GPIO line has only a single GPIO_ACTIVE_* flag, but applies to both
> > th provider and consumer sides:
> >   1. The GPIO provider (controller) looks at the flags to know the
> >      polarity, so it can translate between logical (active/not active)
> >      and physical (high/low) signal levels.
> >   2. While the signal polarity is usually fixed on the GPIO consumer
> >      side (e.g. an LED is tied to either the supply voltage or GND),
> >      it may be configurable on some devices, and both sides need to
> >      agree.  Hence the GPIO_ACTIVE_* flag as seen by the consumer must
> >      match the actual polarity.
> >      There exists a similar issue with interrupt flags, where both the
> >      interrupt controller and the device generating the interrupt need
> >      to agree, which breaks in the presence of a physical inverter not
> >      described in DT (see e.g. [3]).
>
> Adding an inverted flag as I've suggested would also solve this issue.

As per your suggestion in "Re: [PATCH V4 2/2] gpio: inverter: document
the inverter bindings"?
https://lore.kernel.org/linux-devicetree/CAL_JsqLp___2O-naU+2PPQy0QmJX6+aN3hByz-OB9+qFvWgN9Q@mail.gmail.com/

Oh, now I understand. I was misguided by Harish' interpretation
https://lore.kernel.org/linux-devicetree/dde73334-a26d-b53f-6b97-4101c1cdc185@mentor.com/
which assumed an "inverted" property, e.g.

    inverted = /bits/ 8 <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0>;

But you actually meant a new GPIO_INVERTED flag, to be ORed into the 2nd
cell of a GPIO specifier? I.e. add to include/dt-bindings/gpio/gpio.h"

    /* Bit 6 expresses the presence of a physical inverter */
    #define GPIO_INVERTED 64

We need to be very careful in defining to which side the GPIO_ACTIVE_*
applies to (consumer?), and which side the GPIO_INVERTED flag (provider?).
Still, this doesn't help if e.g. a FET is used instead of a push-pull
inverter, as the former needs translation of other flags (which the
nexus can do, the caveats above still applies, though).

Same for adding IRQ_TYPE_INVERTED.

Related issue: how to handle physical inverters on SPI chip select lines,
if the SPI slave can be configured for both polarities?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
