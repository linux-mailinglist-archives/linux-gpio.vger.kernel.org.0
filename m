Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5045E3D8B1A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 11:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhG1Jtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 05:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhG1Jtt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 05:49:49 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8441C061757;
        Wed, 28 Jul 2021 02:49:47 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 56EE32222E;
        Wed, 28 Jul 2021 11:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1627465785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wSwNdWOzcxnppq8rt6ZnreiwiQj3iUz9ZFkmSObTj88=;
        b=ZIA9+a1lDl/W8HdwSQ3giERKNld3dgV3jYmBI2BuFt6/p7954j8IvFYmqvsD3YIUWY8RH4
        BFGBB80iJu+WU3Pevyv0R0XRHsbyMj8uE6VHz2rWWjYnd5hb/M+IY3TmuqMqoCDdzgrzC5
        sktonDiGJAjXtGBBbuvacNvfIW3PSqs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Jul 2021 11:49:41 +0200
From:   Michael Walle <michael@walle.cc>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
In-Reply-To: <20210727052851.GA3147871@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
 <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
 <20210726071124.GA9184@x1> <dad13b899b69436acc1804b7c3438639@walle.cc>
 <20210727052851.GA3147871@x1>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ff76b62927e3f5f016f6c4c11ca16ccf@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

Am 2021-07-27 07:28, schrieb Drew Fustini:
[..]
>> > > Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
>> > > of GPIO_GENERIC calling bgpio_init() in probe().
>> >
>> > Thank you for the suggestion. However, I am not sure that will work for
>> > this SoC.
>> >
>> > The GPIO registers are described in section 12 of JH7100 datasheet [1]
>> > and I don't think they fit the expectation of gpio-mmio.c because there
>> > is a seperate register for each GPIO line for output data value and
>> > output enable.
>> >
>> > There are 64 output data config registers which are 4 bytes wide. There
>> > are 64 output enable config registers which are 4 bytes wide too. Output
>> > data and output enable registers for a given GPIO pad are contiguous.
>> > GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
>> > is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
>> > effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
>> > Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.
>> >
>> > However, GPIO input data does use just one bit for each line. GPIODIN_0
>> > at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].

Mh, I'm not sure I'm understanding the datasheet/registers. _DOUT_CFG
and _DOEN_CFG seem to specify the pad where this GPIO is mapped to.
Shouldn't this be some kind of pinctrl then? Apparently you can map
any GPIO number to any output pad, no? Or at least to all pads
which are described in Table 11-2. What happens if two different GPIOs
are mapped to the same pad? Bit 31 in these _CFG seems to be an invert
bit, but what does it invert?

Similar, the input GPIOs are connected to an output pad by all the
GPI_*_CFG registers.

To me it seems, that there two multiplexers for each GPIO, where
you can connect any GPIOn to any input pad and output pad. Sound
like a huge overkill. I must be missing something here.

But what puzzles me the most, where do I set the actual GPIO output
value?

>> I'd say, that should work with the .reg_mask_xlate of the gpio-regmap.
>> 
>> -michael
> 
> Thanks, yes, I think trying to figure out how .reg_mask_xlate would 
> need
> to work this SoC.  I believe these are the only two implementations.
> 
> From drivers/gpio/gpio-regmap.c:
> 
>   static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
> 				      unsigned int base, unsigned int offset,
> 				      unsigned int *reg, unsigned int *mask)
>   {
> 	  unsigned int line = offset % gpio->ngpio_per_reg;
> 	  unsigned int stride = offset / gpio->ngpio_per_reg;
> 
> 	  *reg = base + stride * gpio->reg_stride;
> 	  *mask = BIT(line);
> 
> 	  return 0;
>   }
> 
> From drivers/pinctrl/bcm/pinctrl-bcm63xx.c:
> 
>   static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
> 				    unsigned int base, unsigned int offset,
> 				    unsigned int *reg, unsigned int *mask)
>   {
> 	  unsigned int line = offset % BCM63XX_BANK_GPIOS;
> 	  unsigned int stride = offset / BCM63XX_BANK_GPIOS;
> 
> 	  *reg = base - stride * BCM63XX_BANK_SIZE;
> 	  *mask = BIT(line);
> 
> 	  return 0;
>   }
> 
> Let's say a driver calls gpio_regmap_set(chip, 0, 5) to set line 5 to
> value 1.
> 
> I believe this would result in call to:
> 
>   gpio->reg_mask_xlate(gpio, gpio->reg_set_base, 5, &reg, &mask)
> 
> Then this would be called to set the register:
> 
>   regmap_update_bits(gpio->regmap, reg, mask, mask);
> 
> From datasheet section 12 [1], there are 64 output data registers which
> are 4 bytes wide. There are 64 output enable registers which are also 4
> bytes wide too. Output data and output enable registers for a GPIO line
> are contiguous. Thus GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54.
> The forumla is GPIOn_DOUT_CFG is 0x50+8n and GPIOn_DOEN_CFG is 0x54+8n.
> Thus for GPIO line 5:
> 
>   GPIO5_DOUT_CFG is 0x50 + 0x28 = 0x78
>   GPIO5_DOEN_CFG is 0x54 + 0x28 = 0x7C
> 
> Enable GPIO line 5 as output by writing 0x1 to 0x7C and set output 
> value
> to 1 by writing 1 to 0x7C.
> 
> Using gpio_regmap_simple_xlate() as a template, I am thinking through
> xlate for this gpio controller:
> 
> 
> static int gpio_regmap_starfive_xlate(struct gpio_regmap *gpio,
> 				      unsigned int base, unsigned int offset,
> 				      unsigned int *reg, unsigned int *mask)
> {
> 	// reg_set_base is passed as base
> 	// let reg_set_base = 0x50 (GPIO0_DOUT_CFG)
> 	// let gpio->reg_stride = 8
> 	// let offest = 5 (for gpio line 5)
> 
> 	*reg = base + offset * gpio->reg_stride;
> 	// *reg = base:0x50 + offset:0x5 * reg_stride:0x8
> 	// *reg = 0x50 + 0x28
> 	// *reg=  0x78
> 
> 	// Each gpio line has a full register, not just a bit. To output
> 	// a digital 1, then GPIO5_DOUT_CFG would be 0x1. To output
> 	// digital 0, GPIO5_DOUT_CFG would be 0x0. Thus I think the mask
> 	// should be the least significant bit.
> 	*mask = BIT(1);
> 
> 	return 0;
> }
> 
> Let's walk through what would happen if gpio_regmap_set() was the
> caller:
> 
> static void gpio_regmap_set(struct gpio_chip *chip, unsigned int 
> offset,
> 			    int val)
> {
> 	// for gpio line, offset = 5
> 	// if want to set line 5 high, then val = 1
> 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> 
> 	// reg_set_base would be set to 0x50 (GPIO0_DOUT_CFG)
> 	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
> 	unsigned int reg, mask;
> 
> 	gpio->reg_mask_xlate(gpio, base /* 0x50 */, offset /* 5 */, &reg, 
> &mask);
> 	if (val) /* if val is 1 */
> 		regmap_update_bits(gpio->regmap, reg, mask, mask);
> 		// if mask returned was 0x1, then this would set the
> 		// bit 0 in GPIO5_DOUT_CFG
> 	else /* if val is 0 */
> 		regmap_update_bits(gpio->regmap, reg, mask, 0);
> 		// if mask returned was 0x1, then this would clear
> 		// bit 0 in GPIO5_DOUT_CFG
> }
> 
> Now for the output enable register GPIO5_DOEN_CFG, the output driver is
> active low so 0x0 is actually enables output where as 0x1 disables
> output.  Thus maybe I need to add logic like:
> 
> 
> static int gpio_regmap_starfive_xlate(struct gpio_regmap *gpio,
> 				      unsigned int base, unsigned int offset,
> 				      unsigned int *reg, unsigned int *mask)
> {
> 	<snip>
> 	if (base == GPIO0_DOUT_CFG)
> 		*mask = 0x1U;
> 	else if (base == GPIO0_DOEN_CFG)
> 		*bit = ~(0x1U);
> 
> 	return 0;
> }
> 
> What do you think of that approach?

I'm also not opposed to add a new flag to gpio-regmap which
invert the value itself.

But the idea was that you can differentiate in _xlate() by the
base register offset, like you already did:

static int gpio_regmap_starfive_xlate(struct gpio_regmap *gpio,
				      unsigned int base, unsigned int offset,
				      unsigned int *reg, unsigned int *mask)
{
	switch (base) {
	case GPIO0_DOUT_CFG:
		/* do some custom mapping just for DOUT_CFG */
	case GPIO0_DOEN_CFG:
		/* do some custom mapping just for DOEN_CFG */
	default:
		/* do normal mapping */
}

> Are there any other examples of regmap xlate that I missed?

No there aren't much yet. Usually the simple one is enough.

-michael

> [1] 
> https://github.com/starfive-tech/beaglev_doc/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf

