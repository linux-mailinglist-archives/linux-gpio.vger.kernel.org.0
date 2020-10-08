Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7556D2872E7
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 12:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbgJHK5p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 06:57:45 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:52512 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbgJHK5p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 06:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602154663; x=1633690663;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=sbsYblhM7HBECp1Iw7gGZrJTSXmYJPEc0TVl2NmfuLg=;
  b=MqfoNOH+ENnqGb4DK3xPwdc8JeEBqbtmtxOsZCcFbgqMvFwNehgW1ZbV
   Wg5IMMMByesJNMkl2Qijzc0Ih98eA9fJyn8//5CQDBhkv7JmErFEhzEPX
   eefcnE104LjwRimEQHbuQLLoRA53kR/JGr1SSSAQnv3sZ+RYarluaZlMi
   fZetf+rl9n5rGwqbZZsIL6w1fnh1IYwwtq4/sAlfCsIrSODNrAn+cJZgq
   O8prJTqQoMLJ+4ocGws88NzG/uEAkA6EpZxCXWXNV7ISvQF4vPjopKxmv
   yOJu/gbkMgLLqsFDfaIDpSwvc8j+UE8YIaQ3xjV25TLStdX4vG0GJ3fpS
   A==;
IronPort-SDR: W1L25IG2YRzeJ5cgA1BK2uWtRzxQrvEmH+oYQPDzJnJ/1O1H5EFRAOenV5rsudJBysL0AIYeBE
 gS3mDqkS0LjTZ31CANbCIAiHVaeY3p2O+RLJB0wp8ab2heD3isdSnIzIIG/mFag1xll++laeIr
 hMeW2fiW2Y7CRltm0XgQYo/jM3whPNoT9KN3ukc+jPOL22CBvt2ZyRmAW5nGct9VBDH6ZD2MW1
 lZ2CKm7r/6CPAoZ8TJcNNftGE4lS7JAh+PGtuWIaE8HdEhyd1hKkBpPfYhJ9xapry388n3bgVU
 /Bk=
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="29188573"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Oct 2020 03:57:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 8 Oct 2020 03:57:18 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 8 Oct 2020 03:57:41 -0700
References: <20201006142532.2247515-1-lars.povlsen@microchip.com> <20201006142532.2247515-3-lars.povlsen@microchip.com> <CACRpkda+OSgma3E0XxXUk8a2yrn5Hpu3a47cBN50rOkoSMkiwQ@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RESEND PATCH v3 2/3] pinctrl: pinctrl-mchp-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CACRpkda+OSgma3E0XxXUk8a2yrn5Hpu3a47cBN50rOkoSMkiwQ@mail.gmail.com>
Date:   Thu, 8 Oct 2020 12:57:39 +0200
Message-ID: <87ft6px9wc.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> Hi Lars!
>
> Thanks for the update, this looks much improved!

Glad you like it! It's been a difficult birth...

>
> Some further hints at things I saw here:
>
> On Tue, Oct 6, 2020 at 4:25 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
>> (SGPIO) device used in various SoC's.
>>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>
>> +       /* 2 banks: IN/OUT */
>> +       struct {
>> +               struct gpio_chip gpio;
>> +               struct pinctrl_desc pctl_desc;
>> +               struct pinctrl_dev *pctl_dev;
>> +       } bank[2];
>
> Is it really good to use index [0,1] to refer to these?
> Isnt it easier to do something like:
>
> struct sgpio_bank {
>          struct gpio_chip gpio;
>          struct pinctrl_desc pctl_desc;
>          struct pinctrl_dev *pctl_dev;
> };
>
> struct sgpio_priv {
>         (...)
>         struct sgpio_bank in;
>         struct sgpio_bank out;
>         (...)
> };
>
> This way you I think the code becomes clearer.
>

I have done the change as suggested, and I think your right - looks
better. Also helped loose the "is_input" helper functions.

>> +static inline bool sgpio_pctl_is_input(struct sgpio_priv *priv,
>> +                                      struct pinctrl_dev *pctl)
>> +{
>> +       /* 1st index is input */
>> +       return pctl == priv->bank[0].pctl_dev;
>> +}
>> +
>> +static inline bool sgpio_gpio_is_input(struct sgpio_priv *priv,
>> +                                      struct gpio_chip *gc)
>> +{
>> +       /* 1st index is input */
>> +       return gc == &priv->bank[0].gpio;
>> +}
>
> Isn't it easier to just add a
>
> bool is_input;
>
> to the struct gpio_bank?

Yes, did that.

>
>> +static inline u32 sgpio_readl(struct sgpio_priv *priv, u32 rno, u32 off)
>> +{
>> +       u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
>> +
>> +       return readl(reg);
>> +}
>> +
>> +static inline void sgpio_writel(struct sgpio_priv *priv,
>> +                               u32 val, u32 rno, u32 off)
>> +{
>> +       u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
>> +
>> +       writel(val, reg);
>> +}
>> +
>> +static inline void sgpio_clrsetbits(struct sgpio_priv *priv,
>> +                                   u32 rno, u32 off, u32 clear, u32 set)
>> +{
>> +       u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
>> +       u32 val = readl(reg);
>> +
>> +       val &= ~clear;
>> +       val |= set;
>> +
>> +       writel(val, reg);
>> +}
>
> These accessors are somewhat re-implementing regmap-mmio, especially
> the clrsetbits. I would consider just creating a regmap for each
> struct sgpio_bank and manipulate the register through that.
> (Not any requirement just a suggestion.)
>

Humm, not sure if these few functions warrants using regmap. I'll have a
closer look.

>> +static void sgpio_output_set(struct sgpio_priv *priv,
>> +                            struct sgpio_port_addr *addr,
>> +                            int value)
>> +{
>> +       u32 mask = 3 << (3 * addr->bit);
>> +       value = (value & 3) << (3 * addr->bit);
>
> I would spell it out a bit so it becomes clear what is going in
> and use the bits helpers.
>
> value & 3 doesn't make much sense since value here is always
> 0 or 1. Thus if value is 1 it in effect becomes value = 1 << (3 * addr->bit)
> so with the above helper bit:
>
> unsigned int bit = 3 * addr->bit;
> u32 mask = GENMASK(bit+1, bit);
> u32 val = BIT(bit);
>
> This way it becomes clear that you set the output usin the lower
> of the two bits.
>
> Also note that I use val rather than value to avoid overwriting
> the parameter: it is legal but confusing. Let the compiler optimize
> register use.
>

I will change as suggested.

>> +static int sgpio_output_get(struct sgpio_priv *priv,
>> +                           struct sgpio_port_addr *addr)
>> +{
>> +       u32 portval = sgpio_readl(priv, REG_PORT_CONFIG, addr->port);
>> +       int ret;
>> +
>> +       ret = SGPIO_X_PORT_CFG_BIT_SOURCE(priv, portval);
>> +       ret = !!(ret & (3 << (3 * addr->bit)));
>
> Is the output direction really controlled by both bits?
>
> ret = !!(ret & (BIT(3 * addr->bit))); ?
>

The 3 bits are actually "mode" not direction. The direction is fixed as
described earlier.

0: Forced 0
1: Forced 1
2: Blink mode 0
3: Blink mode 1
4: Link activity blink mode 0
5: Link activity blink mode 1

But you are still right the (forced) _value_ can still be read using
just the first bit. I will change to using just the first bit.

>> +static int microchip_sgpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +       struct sgpio_priv *priv = gpiochip_get_data(gc);
>> +
>> +       return sgpio_gpio_is_input(priv, gc); /* 0=out, 1=in */
>
> You can use the #defines from <linux/gpio/driver.h> if you want to be explicit:
>
> return sgpio_gpio_is_input(priv, gc) ? GPIO_LINE_DIRECTION_IN :
> GPIO_LINE_DIRECTION_OUT;
>

Yes, good suggestion. Also using bank->is_input now.

>> +static int microchip_sgpio_of_xlate(struct gpio_chip *gc,
>> +                              const struct of_phandle_args *gpiospec,
>> +                              u32 *flags)
>> +{
>> +       struct sgpio_priv *priv = gpiochip_get_data(gc);
>> +       int pin;
>> +
>> +       if (gpiospec->args[0] > SGPIO_BITS_PER_WORD ||
>> +           gpiospec->args[1] > priv->bitcount)
>> +               return -EINVAL;
>> +
>> +       pin = gpiospec->args[1] + (gpiospec->args[0] * priv->bitcount);
>> +
>> +       if (pin > gc->ngpio)
>> +               return -EINVAL;
>> +
>> +       if (flags)
>> +               *flags = gpiospec->args[2];
>> +
>> +       return pin;
>> +}
>
> I'm still not convinced that you need the flags in args[2].
>
> Just using the default of_gpio_simple_xlate() with one flag
> should be fine. But I will go and review the bindings to figure
> this out.
>

Ok, I just assumed the std GPIO flags in args[2] were kind of mandatory,
I mean polarity would be needed?

F.ex. a GPIO (led) looks like this now:

    led@0 {
            label = "eth60:yellow";
            gpios = <&sgpio_out1 28 1 GPIO_ACTIVE_LOW>;
            default-state = "off";
    };

>> +       gc->of_xlate            = microchip_sgpio_of_xlate;
>> +       gc->of_gpio_n_cells     = 3;
>
> So I'm sceptical to this.
>
> Why can't you just use the pin index in cell 0 directly
> and avoid cell 1?
>

You scepticism has surfaced before :-). The (now) 2 indices relates to
how the hardware address signals.

Each signal/pin is addressed by port, bit number and direction. We now
have the direction encoded in the bank/phandle.

While it would be possible to just produce a linear range of (32 *
width), hardware designs and documentation use pXXbY (as "p28b1" above),
making the cross reference much better using the 2 indices when
specifying a pin (as opposed to using f.ex. value "60" in the example).

Hope this helps.

Thank you for your comments, I will refresh later today.

---Lars

> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
