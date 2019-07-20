Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7A4F6EE63
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 10:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfGTINL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 04:13:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33272 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726895AbfGTINL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 04:13:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so32894363ljg.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2019 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0jjqiEWK8ZwPUy1E/hBEFEfeUX6fZKXUCvS400AT+E=;
        b=yPSEvpAhtbj/j09qHG2JWZfrDA4ejU9evwOJais+pJ0lGCPO05Gns70r4+pQNpZ4xK
         lDKoKVvkmiGIDLP+l/FkDXc1fKJsf9Uk4CdBZeUDu+IsFD4fs/jH9Vh+YJrDGixb3HJ3
         Ue7R1TwHlXHvmgyfmDJqycCgkmTCbjCHYxmEh2EdRFsmKmntYBYBfVUhRjzsgZeVPYb+
         8K4202ecZU1xhmPNMkuAY7dkNXe1ab5LPwhjlJnovA4AmK+Wz/yOz1qlHoDUXr4Yj0SC
         kiaxocC37eF3GwefxCq3OJiGqjz7iJVeDnWpJnKKiO4nhTokU6iSmnvj/ddVQoxSY787
         XpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0jjqiEWK8ZwPUy1E/hBEFEfeUX6fZKXUCvS400AT+E=;
        b=rIeElyEEGEw07BbJN1/p974v7eyyN8RP5rO0shmlWkHtsOrRHwUgCi7IFADFf3mt2K
         uuBHn7lxMfS+jySDaVgc6Ps4w1epuqbDNPipj0ZK/aU4T3Rcq/0NU53QZjXcb2VgxL7e
         mta0aSfh7zLGGDycTeC0iXZnsP+wWe30PDkDfUQv3MloccYbA5qigXSUV8iuhdv8Z8ZR
         JXuMH1D+0x0Q4pzWlrKISKgQ51wWGr3Z/mo+HDqkcizvdkzMc5B4GRd2ws2SMVVoYNz6
         0BH0iN1Zw16k2aF5TWowJV5TcsYGr0mVooG9c+oWKxeCuQ3vjEbsKEJQYWZ8Y0Nv8Rcf
         E3Eg==
X-Gm-Message-State: APjAAAWzfVJKDhCzYWiLyr4/1kZeWpQZJcoWu6KR5pd6lROXYz2sEBK3
        qADiIj5gX50CdSLliXxjqv1pNr8zI19TjYMHyVyAIQ==
X-Google-Smtp-Source: APXvYqxPq0egzZ9v6Hlqgi5GtM0dh5ZLA6APWqqK+dAf0wl4ZE3tiHWf4L7DfCkkNOMh235amVo0TuFZXRekFrjKVAc=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr12432277ljs.54.1563610388042;
 Sat, 20 Jul 2019 01:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com> <1563564291-9692-2-git-send-email-hongweiz@ami.com>
In-Reply-To: <1563564291-9692-2-git-send-email-hongweiz@ami.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jul 2019 10:12:56 +0200
Message-ID: <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
Subject: Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
To:     Hongwei Zhang <hongweiz@ami.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hongwei,

after looking close at the driver and bindings I have this feeback:

On Fri, Jul 19, 2019 at 9:25 PM Hongwei Zhang <hongweiz@ami.com> wrote:

+- reg                  : Address and length of the register set for the device

This 0x100 range may look simple but in the driver it looks like
this:

+static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
+       {
+               .val_regs = 0x0000,
+               .rdata_reg = 0x0070,
+               .irq_regs = 0x0004,
+               .names = { "A", "B", "C", "D" },
+       },
+       {
+               .val_regs = 0x001C,
+               .rdata_reg = 0x0074,
+               .irq_regs = 0x0020,
+               .names = { "E", "F", "G", "H" },
+       },
+       {
+               .val_regs = 0x0038,
+               .rdata_reg = 0x0078,
+               .irq_regs = 0x003C,
+               .names = { "I", "J" },
+       },
+};

So first break this into up to 10 different instances with one device
per bank instead.

For each device:

reg = <0x1e780200 4>, <x1e780204 ..>, <0x1e780270 ..>;
reg-names = "val", "irq", "rdata";

This way you use the device tree features for locating the
register offsets instead of hard-coding it into the driver,
which will make the driver simpler.

> +- ngpios               : number of GPIO pins to serialise.
> +                         (should be multiple of 8, up to 80 pins)

This is wrong. This should be split into 10 different devices providing
8 GPIO lines each. The "ngpios" is not intended to subdivide
banks, but for the case where you use say bits 0..11 of 32 bits in
a register by setting ngpios to 12.

I see that they use the same clock divider and the same interrupt,
but this is better to partition into a separate clock divider driver
and up to 10 instances of GPIO devices with 8 GPIOs each.

I also see that they use the same interrupt. This is fine, in your
driver just grab a shared IRQ and all the IRQ handlers will be
traversed. This is a well known pattern for all operating systems.

> +- clocks                : A phandle to the APB clock for SGPM clock division
> +
> +- bus-frequency                : SGPM CLK frequency

I see that there is a common clock control register in offset 0x54.

Split this out to a separate clock driver that provides a divided clock
that all GPIO blocks can get, no matter if you use 1, 2 .. 10 of these
blocks.

The fact that these GPIO banks and the clock register is in the same
memory range does not really matter. Split up the memory range in
on reg = per GPIO chip and one reg for the clock.

> +  Example:
> +       sgpio: sgpio@1e780200 {
> +               #gpio-cells = <2>;
> +               compatible = "aspeed,ast2500-sgpio";
> +               gpio-controller;
> +               interrupts = <40>;
> +               reg = <0x1e780200 0x0100>;
> +               clocks = <&syscon ASPEED_CLK_APB>;
> +               interrupt-controller;
> +               ngpios = <8>;
> +               bus-frequency = <12000000>;
> +       };

Splitting this up into a clock controller and 1-10 instances of sgpio
will make things simpler, because it will closer reflect what the hardware
people are doing: they have just created 10 instances of the same
block, and added a clock divider.

You can put the 1-10 instances and the clock divider inside a collected
node "simple-bus" in the device tree:

{
    compatible = "simple-bus";

    sgpio0: sgpio {
        compatible = "aspeed,ast2500-sgpio";
        reg = <0x1e780200 ...> ...;
        clk = <&sgpioclk>;
    };
    sgpio1: sgpio {
        ...
    };
    ...
    sgpioclk: clock {
          compatible = "aspeed,sgpio-clock";
          reg = 0x1e780254 4>;
    };
};

This is a better fit with the actual hardware and will make it much
easier to write drivers.

Admittedly DT device partitioning of SoC devices is a grey area,
but here I think the DT infrastructure helps you to break things
down and make it easier, I am thinking in a divide-and-conquer
way about it.

Yours,
Linus Walleij
