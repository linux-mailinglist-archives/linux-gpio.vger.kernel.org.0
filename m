Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415F63774B0
	for <lists+linux-gpio@lfdr.de>; Sun,  9 May 2021 02:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhEIAUJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 20:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhEIAUI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 20:20:08 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A529C061573
        for <linux-gpio@vger.kernel.org>; Sat,  8 May 2021 17:19:05 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id e11so2743643ljn.13
        for <linux-gpio@vger.kernel.org>; Sat, 08 May 2021 17:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qpNO09z6ZmadBd56yRYdadNcpRqIARDEuzpJbLavNTc=;
        b=KQb+U0lms78RQkO8DPmn5XEjIkPeRjoQxn/yKZKG9V4pHgrohQMRnr8zQgG2ML1UJa
         m0TahKGN90/zU7qYZZW4Tv4hQbYqP6AksgCnxZRUEIsVRSeQ4TdMVzj3ih19iB0LnOLb
         AF0CEnsJypdmcpye7WsI0WAgz7TKaeBxyM1Vp+WiRvYcAdCPRzW8u0ZLDGvnIKXNuRiP
         UreFmKe9cfRlhx9nQzWR2xTp73hKWVx+5Ueg+3J4hulBJMnXkZhEs7UrPLGt9Enczn+6
         VpXy5UlTCxUe1imSGCAf2Pkbzog6qFMr6ytQtJnR8LnD26zK+jvLiiLA354IEMjiGe+Y
         tbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qpNO09z6ZmadBd56yRYdadNcpRqIARDEuzpJbLavNTc=;
        b=fSnRtjCf2e5gA4SSjK1w4ej2t0oxZ7LWaI9iNRKMKMPqi5AA4aaGwyaAIJmGhw1+oa
         U3KCIwzeYMpKV8+IJ3QgKUf/9Xekus0zUV3p01Ri6q8NNy1+cUggjr/f6demCJLviQCG
         wXSGzrwxS1S3ASLLSrymFXFINQo9XanzUJbYVJ8T31hJTRRRBQ7GnexskX/ZIng3GbLT
         ZBtN1Mr8hmk6zgCOs8jFV4+dQXyOJiacCZD4h5iFm2aeAtigxDaRUIM4mjAsuofWOv0C
         F+/8Ttjjke05cDS//aqMCZu0KPy4jEHkSJ/8v30MMOuyaBL2l7VmxipginlriwHG5X0P
         HaRQ==
X-Gm-Message-State: AOAM5317xcAZpbpgZgxQmXY1kU3zuvlq6PSZSUYqW8+msR7NxJ+zbR95
        7GvEe+/trzGhYFqDmLC2JYKX3sTmFeYqtFnxAlHH4g==
X-Google-Smtp-Source: ABdhPJyVrfk1ueXuSiYhxjwXKe/WNTUKvyhUDAi2vZ9WRakT3rQS6+L3JI0U/DRakIfltmM/BO5nrfj2qnKeeLtomBY=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr13669134lji.438.1620519543447;
 Sat, 08 May 2021 17:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org>
In-Reply-To: <20210508142000.85116-2-kettenis@openbsd.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 May 2021 02:18:52 +0200
Message-ID: <CACRpkdbexpwu9hDWFYe38-+issVw051YfJ-_hatZVmWzkh4M+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
To:     kettenis@openbsd.org
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mark,

here is a second note on pin mux layout:

On Sat, May 8, 2021 at 4:20 PM Mark Kettenis <kettenis@openbsd.org> wrote:

> +        pcie_pins: pcie-pins {
> +          pinmux = <APPLE_PINMUX(150, 1)>,
> +                   <APPLE_PINMUX(151, 1)>,
> +                   <APPLE_PINMUX(32, 1)>;
(...)
> +#define APPLE_PINMUX(pin, func) ((pin) | ((func) << 16))
> +#define APPLE_PIN(pinmux) ((pinmux) & 0xffff)
> +#define APPLE_FUNC(pinmux) ((pinmux) >> 16)

Since the word altfunction is used, I suppose that this is
one of those pin controllers where each pin can be
muxed individually (usually with one register or one group
of bits per pin).

So this is one way to do it, which

Another way is what Qualcomm is doing and looks for
example like this:

pinctrl@800000 {
         /* eMMMC pins, all 8 data lines connected */
         dragon_sdcc1_pins: sdcc1 {
                 mux {
                         pins = "gpio159", "gpio160", "gpio161",
                              "gpio162", "gpio163", "gpio164",
                              "gpio165", "gpio166", "gpio167",
                              "gpio168";
                         function = "sdc1";
                 };
(...)

Here all pins have a name and they get assigned as a group
to a function. Each pin is referenced by name.

Some people don't like this because they like bitstuffing and
bitfiddling and are worried that the DTB file strings will take
up too much memory, and they have to include all these
strings in their operating system driver.

However there are clear upsides to it, when you later on
come to set up the electrical pin config:

                cmd {
                         pins = "gpio168"; /* SDC1 CMD */
                         drive-strength = <12>;
                         bias-pull-up;
                 };
                 data {
                         /* SDC1 D0 to D7 */
                         pins = "gpio159", "gpio160", "gpio161", "gpio162",
                               "gpio163", "gpio164", "gpio165", "gpio166";
                         drive-strength = <8>;
                         bias-pull-none;
                  };

As you can see this becomes quite readable. It is clear and
crisp which pins are set up for pull-up and not, and what
drive strength is used on each pin.

But notice first and foremost this: the muxing is done in
one node, and the electrical config is done in two separate
nodes, breaking muxing and config into two different
categories in the device tree.

The problem with the magic number approach to muxing
is that the magic numbers will fall through to the
electrical pin config later and indeed it looks like in the STM32
device trees:

sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
        pins1 {
                pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
                                <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
                                <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
                                <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
                                <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
                slew-rate = <3>;
                drive-push-pull;
                bias-disable;
        };
        pins2 {
                pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
                slew-rate = <3>;
                drive-open-drain;
                bias-disable;
         };
};

Notice here how the pins need to be separated into two subnodes
in order to set different electrical configuration on them, and how
muxing and configuration are mixed up. This is a side effect of
using the "pinmux" attribute rather than "pins" and "function".

So make sure you really like this rather than the other approach
in your device trees.

I will definately insist that you electrical config be done similar
to how STM32 does it when you implement that later, for
example any magic numbers for electrical config is not
acceptable, you will have to find a way to use drive-open-drain;
and such flags in the device tree.

Sadly we have something like three different ways to do
pin control device tree, as a result of failure to find consensus.

Yours,
Linus Walleij
