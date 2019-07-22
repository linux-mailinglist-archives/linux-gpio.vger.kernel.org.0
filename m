Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 337656F6F7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 03:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbfGVBmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 21:42:05 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54341 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726233AbfGVBmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jul 2019 21:42:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9DADE15E;
        Sun, 21 Jul 2019 21:42:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Sun, 21 Jul 2019 21:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=sD19UniGlWFGWsLu3RCn9ozD1wbtwG0
        0v5+mI7c2100=; b=OwBudd1PA9+oGFwr7mpGTq/4NAv4oWOr6OESLTydIfnDGdX
        CzZXRdBHPHnqgLODuDUBKy631naNIBVibSFUtGHW65C/qP73Q5/nZL40xnmfOOFH
        0H+b6wtd4R/f7TucJWmHIvppHabah8rM1jjnXv+3gjF1mtdWBOfAx92HWe1u6tlK
        KRwkMpKK1xVmxcnIWqX8qoO40NXP1b7TmbdvoQUEqgEoAtIpuz9SG3pyGr/1/o4V
        GQlPeRYr5n0fxEo7hSEoCSUCfVnamUtN8vOu7LUK1Y8fF94Bj5o8RxARDknUH70P
        zPDMbAUi2rGxJKCeXkngHdabpxikmqahnkLso3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sD19Un
        iGlWFGWsLu3RCn9ozD1wbtwG00v5+mI7c2100=; b=nFrK/Af+Amv8hPX/siPpaM
        z1a/UhOMsdiloCW0hkvovmjX2Gfxaq0yKFSu/pATxGFHr4d5qxzgugrpuUmP/gIF
        Xa95nbcwnUqdtP1+xr438TlX6HZQuQD5SeIA7FdVgm8vqg3Qs6FewAhvIb2fdg7M
        RzaOttbH5hKsgjfoMIwpNrHCp80QJoamIof2YR7/2I5eoHjCT5X47PmORG6xtBHS
        yiUqwIEo++hvkNCG3/79H/0HWJVGhqG4fIlSXCkX5IocIcBJqdSoX9FvYT2woVqd
        MDy+rwRNCgQaRJXbhfAQSBruvLKVSb29R9lvGHDGGgz4Wa1OD9PQ8jgn//S+EF0Q
        ==
X-ME-Sender: <xms:ZRQ1Xd2AtTaFZuX2GtEnzDHF4JXY19_UiFlzSZtVd7S41jpMZ_k-rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeefgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:ZRQ1XZrLfYImPyaWwMPMQdGAIxNMPYn8aPSnrN-VyiLm8KsiZaUqNQ>
    <xmx:ZRQ1XXeUxeZ_FGq7ddfHIiDqlGSVbedvlya6W8c8JYwyLq1VYCaFcA>
    <xmx:ZRQ1XbtevbT7Tj1B6fLbP4pJWraphjfX3HGrvtiTmM9Bdgtn5JGunw>
    <xmx:aRQ1XZsJDQv1PJ1XcFzL_iKn4WQKe3XNndZ1fNMDSZap3tCtchR98w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6F2F2E0178; Sun, 21 Jul 2019 21:41:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <ef9d9c17-6e2d-4a4e-ac44-f8da4bb3b8eb@www.fastmail.com>
In-Reply-To: <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
 <1563564291-9692-2-git-send-email-hongweiz@ami.com>
 <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
Date:   Mon, 22 Jul 2019 11:12:11 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Hongwei Zhang" <hongweiz@ami.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Sat, 20 Jul 2019, at 17:43, Linus Walleij wrote:
> Hi Hongwei,
> 
> after looking close at the driver and bindings I have this feeback:
> 
> On Fri, Jul 19, 2019 at 9:25 PM Hongwei Zhang <hongweiz@ami.com> wrote:
> 
> +- reg                  : Address and length of the register set for the device
> 
> This 0x100 range may look simple but in the driver it looks like
> this:
> 
> +static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
> +       {
> +               .val_regs = 0x0000,
> +               .rdata_reg = 0x0070,
> +               .irq_regs = 0x0004,
> +               .names = { "A", "B", "C", "D" },
> +       },
> +       {
> +               .val_regs = 0x001C,
> +               .rdata_reg = 0x0074,
> +               .irq_regs = 0x0020,
> +               .names = { "E", "F", "G", "H" },
> +       },
> +       {
> +               .val_regs = 0x0038,
> +               .rdata_reg = 0x0078,
> +               .irq_regs = 0x003C,
> +               .names = { "I", "J" },
> +       },
> +};
> 
> So first break this into up to 10 different instances with one device
> per bank instead.
> 
> For each device:
> 
> reg = <0x1e780200 4>, <x1e780204 ..>, <0x1e780270 ..>;
> reg-names = "val", "irq", "rdata";
> 
> This way you use the device tree features for locating the
> register offsets instead of hard-coding it into the driver,
> which will make the driver simpler.
> 
> > +- ngpios               : number of GPIO pins to serialise.
> > +                         (should be multiple of 8, up to 80 pins)
> 
> This is wrong. This should be split into 10 different devices providing
> 8 GPIO lines each. The "ngpios" is not intended to subdivide
> banks, but for the case where you use say bits 0..11 of 32 bits in
> a register by setting ngpios to 12.
> 
> I see that they use the same clock divider and the same interrupt,
> but this is better to partition into a separate clock divider driver
> and up to 10 instances of GPIO devices with 8 GPIOs each.
> 
> I also see that they use the same interrupt. This is fine, in your
> driver just grab a shared IRQ and all the IRQ handlers will be
> traversed. This is a well known pattern for all operating systems.
> 
> > +- clocks                : A phandle to the APB clock for SGPM clock division
> > +
> > +- bus-frequency                : SGPM CLK frequency
> 
> I see that there is a common clock control register in offset 0x54.
> 
> Split this out to a separate clock driver that provides a divided clock
> that all GPIO blocks can get, no matter if you use 1, 2 .. 10 of these
> blocks.
> 
> The fact that these GPIO banks and the clock register is in the same
> memory range does not really matter. Split up the memory range in
> on reg = per GPIO chip and one reg for the clock.

The issue that I see with this is that the SGPIO bus clock configuration
is not the only field in the SGPIO control register - it also contains the
number of GPIOs the bus should output along with a bus enable bit.
The clock, and particularly the number of GPIOs (due to the nature
of the SGPIO bus) both need to be configured before we set the
enable bit (or obviously all can be done simultaneously).

I'll explore some of the options below (it's a bit train-of-thought,
hopefully it makes sense):

If the clock driver owns the control register, it also needs to know how
many GPIOs we want to emit on the bus. This seems like an awkward
configuration parameter for a clock driver.

To avoid the weird parameter we could protect the control register
with a lock shared between the clock driver and the SGPIO driver. This
way the SGPIO driver could have the ngpios parameter, and request
the clock after its written the ngpios value to the control register. A
regmap would be useful here to avoid the resource clash and it also
provides the required lock.

However, you're also going down the path of splitting the driver such
that there's one instance per bank. With this approach we need to
solve two problems: Accounting for the total number of GPIOs, and
only enabling the bus after the last bank has had its driver probed.

The accounting might be handled by accumulating the number of
GPIOs in each bank in the control register itself, e.g. the driver
implementation does something like:

spin_lock(...)
ctrl = ioread32(...)
ngpios = FIELD_GET(ASPEED_SGPIO_CTRL_NGPIOS, ctrl);
ngpios += 8;
ctrl &= ~ASPEED_SGPIO_CTRL_NGPIOS;
ctrl |= FIELD_PREP(ASPEED_SGPIO_CTRL_NGPIOS, ngpios);
iowrite32(ctrl, ...);
spin_unlock(...);

This works on cold boot of the device when the ngpios field is set to
zero due to reset, however will fail on subsequent warm reboots if
the GPIO IP block is protected from reset by the SoC's watchdog
configuration: the field will not be zeroed in this case, and the
value of the field is represented by `NR_BOOTS * NR_GPIOS`,
which is incorrect. To do this correctly I guess we would need some
other global state held in the driver implementation (zeroed when
the kernel is loaded), and write the incremented value to the control
register on each probe() invocation.

However, that aside, we can't simply enable the bus in the clock
enable callback if enable is called per-bank, as it is called once on
the first request with further requests simply refcounted as you
mentioned. This is exactly the behaviour we can't tolerate with the
bus: it must only be enabled after the last GPIO bank is registered,
when we know the total number of GPIOs to emit. So we can only
call clk_prepare_enable() after the last bank is probed, or in the
probe() of the last bank if the driver has some way to tell it is the
last instance. In my mind per-bank clock management makes the
implementation more involved than it should be, and isn't really
reflective of what the clk subsystem is trying to achieve (violates
clk_prepare()/clk_enable() post conditions, or boils down to just
calling devm_clk_get() in probe() with no further action, which 
seems kinda pointless).

Having a separate clk implementation whose instance is requested
once by a monolithic SGPIO driver matches how the hardware is
designed. However, given the issue of sharing the register with the
GPIO count, in my opinion it seems to make more sense to leave the
driver design as is and minimise the accidental complexity
introduced by the behavioural mismatch of the clk abstraction
and the addition of locking where it wasn't previously necessary.

Interested in your thoughts.

Andrew
