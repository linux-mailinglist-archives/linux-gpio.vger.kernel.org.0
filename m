Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5DA377619
	for <lists+linux-gpio@lfdr.de>; Sun,  9 May 2021 11:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhEIJrX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 May 2021 05:47:23 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:50771 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhEIJrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 May 2021 05:47:22 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 88a9b5b7;
        Sun, 9 May 2021 11:46:17 +0200 (CEST)
Date:   Sun, 9 May 2021 11:46:17 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kettenis@openbsd.org, devicetree@vger.kernel.org, marcan@marcan.st,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CACRpkdbexpwu9hDWFYe38-+issVw051YfJ-_hatZVmWzkh4M+w@mail.gmail.com>
        (message from Linus Walleij on Sun, 9 May 2021 02:18:52 +0200)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org> <CACRpkdbexpwu9hDWFYe38-+issVw051YfJ-_hatZVmWzkh4M+w@mail.gmail.com>
Message-ID: <c1bd67fcc0390275@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: Linus Walleij <linus.walleij@linaro.org>
> Date: Sun, 9 May 2021 02:18:52 +0200

Hi Linus,

> here is a second note on pin mux layout:
> 
> On Sat, May 8, 2021 at 4:20 PM Mark Kettenis <kettenis@openbsd.org> wrote:
> 
> > +        pcie_pins: pcie-pins {
> > +          pinmux = <APPLE_PINMUX(150, 1)>,
> > +                   <APPLE_PINMUX(151, 1)>,
> > +                   <APPLE_PINMUX(32, 1)>;
> (...)
> > +#define APPLE_PINMUX(pin, func) ((pin) | ((func) << 16))
> > +#define APPLE_PIN(pinmux) ((pinmux) & 0xffff)
> > +#define APPLE_FUNC(pinmux) ((pinmux) >> 16)
> 
> Since the word altfunction is used, I suppose that this is
> one of those pin controllers where each pin can be
> muxed individually (usually with one register or one group
> of bits per pin).

Right.  So far it seems that there are just two functions: GPIO and a
peripheral mode.  But there are some unused bits in the register right
next to the bit that controls the function, so maybe we'll see other
function numbers in the future.

> So this is one way to do it, which
> 
> Another way is what Qualcomm is doing and looks for
> example like this:
> 
> pinctrl@800000 {
>          /* eMMMC pins, all 8 data lines connected */
>          dragon_sdcc1_pins: sdcc1 {
>                  mux {
>                          pins = "gpio159", "gpio160", "gpio161",
>                               "gpio162", "gpio163", "gpio164",
>                               "gpio165", "gpio166", "gpio167",
>                               "gpio168";
>                          function = "sdc1";
>                  };
> (...)
> 
> Here all pins have a name and they get assigned as a group
> to a function. Each pin is referenced by name.

Since we will probably never have a data sheet or board schematics for
the Apple devices giving meaningful names to the pins isn't really
possible.  So you'd end up with generic "gpioNNN" names like in the
example above.

> Some people don't like this because they like bitstuffing and
> bitfiddling and are worried that the DTB file strings will take
> up too much memory, and they have to include all these
> strings in their operating system driver.

The memory thing is certainly a consideration for U-Boot, although not
particularly for this platform.  With my OpenBSD hat on I must say
that we try to avoid string parsing in the kernel as much as possible,
which is why I would prefer pin numbers over strings.  Interestingly
enough the pinmux-node.yaml schema allows the use of numbers instead
of strings for the "pins" property.  But neither U-Boot nor Linux
seems to implement support for this in its generic pinctrl/pinmux
code.

However, the main reason for me to pick the "pinmux" scheme used by
STM32 is to make things a bit more future proof.  We expect Apple to
come out with new models and new SoCs on a regular basis and there is
some evidence that Apple tends to re-uses hardware blocks between SoC
generations.  So we hope that it will be possible to add support for
new Apple hardware by simply providing new device trees in m1n1 (the
bootloader developed by Asahi).  Then all we have to do is update m1n1
with a new device tree and people can simply use an existing distro
without having to wait until the latest kernel becomes available for
their distro.  My feeling is that this is a bit easier to achieve
using the bitstuffing/fiddling approach, although with some wisely
chosen names for the alternate functions, the string-based approach
might work as well.

> However there are clear upsides to it, when you later on
> come to set up the electrical pin config:
> 
>                 cmd {
>                          pins = "gpio168"; /* SDC1 CMD */
>                          drive-strength = <12>;
>                          bias-pull-up;
>                  };
>                  data {
>                          /* SDC1 D0 to D7 */
>                          pins = "gpio159", "gpio160", "gpio161", "gpio162",
>                                "gpio163", "gpio164", "gpio165", "gpio166";
>                          drive-strength = <8>;
>                          bias-pull-none;
>                   };
> 
> As you can see this becomes quite readable. It is clear and
> crisp which pins are set up for pull-up and not, and what
> drive strength is used on each pin.
> 
> But notice first and foremost this: the muxing is done in
> one node, and the electrical config is done in two separate
> nodes, breaking muxing and config into two different
> categories in the device tree.

I do see the elegance of this approach.

> The problem with the magic number approach to muxing
> is that the magic numbers will fall through to the
> electrical pin config later and indeed it looks like in the STM32
> device trees:
> 
> sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
>         pins1 {
>                 pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
>                                 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
>                                 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
>                                 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
>                                 <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
>                 slew-rate = <3>;
>                 drive-push-pull;
>                 bias-disable;
>         };
>         pins2 {
>                 pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
>                 slew-rate = <3>;
>                 drive-open-drain;
>                 bias-disable;
>          };
> };
> 
> Notice here how the pins need to be separated into two subnodes
> in order to set different electrical configuration on them, and how
> muxing and configuration are mixed up. This is a side effect of
> using the "pinmux" attribute rather than "pins" and "function".
> 
> So make sure you really like this rather than the other approach
> in your device trees.

Right.  So far it seems we don't need to set the electrical config on
any of the pins and I don't think we've identified any bits in the
register that change the electrical configuration.  Although there are
some hints in the Apple device tree that there are pins that need some
additional configuration.  But I also see some evidence that the Apple
firmware on these devices already sets up most of the pins for us.

> I will definately insist that you electrical config be done similar
> to how STM32 does it when you implement that later, for
> example any magic numbers for electrical config is not
> acceptable, you will have to find a way to use drive-open-drain;
> and such flags in the device tree.

Agreed.  The plan was that when we get at the point where we need to
fiddle with the electrical configuration of pins, we simply add a
reference to pincfg-node.yaml to the schema.

> Sadly we have something like three different ways to do
> pin control device tree, as a result of failure to find consensus.

Thank you for giving quite an extensive explanation of the options.  I
think all things considered, I am still happy with using the "pinmux"
property, but if Hector or Sven think the "pin"/"function" approach
with strings is better, I can change it.  Implementing that approach
in U-Boot isn't a huge burden either.  In fact that was pretty much
what my initial implementation based on the bindings used by Corellium
did.
