Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B261E3130
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 23:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390398AbgEZV2A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 17:28:00 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:39417 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390211AbgEZV17 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 17:27:59 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 1E4162304C;
        Tue, 26 May 2020 23:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590528477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v1prg2AxKlPkUY+YRJw3VW568pjZYParmSiyD+lvqy4=;
        b=C41jJIgiWGa3naA6SPxOtWInxa4SXpkUwdeU9rmO4SvzAgfOeYc6sTjGKBzIkmgZegYZev
        A6Y5Tvniz+HuZXZRtKBs18F4CWWtiYZ1OTpnIKtbxD9eoDbFfCDPoRyvOcgC49bvsq7vcq
        8uOdm4qngOvyLCsdb0Q9Wch1K3JTkP8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 26 May 2020 23:27:57 +0200
From:   Michael Walle <michael@walle.cc>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/2] gpio: add a reusable generic gpio_chip using
 regmap
In-Reply-To: <d245b4f5-065f-4c82-ef8e-d906b363fdcf@linux.intel.com>
References: <20200525160741.21729-1-michael@walle.cc>
 <20200525160741.21729-3-michael@walle.cc>
 <d245b4f5-065f-4c82-ef8e-d906b363fdcf@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <6d08ebbfbc9f656cb5650ede988cf36d@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2020-05-26 19:29, schrieb Pierre-Louis Bossart:
>> +struct gpio_regmap {
>> +    struct device *parent;
>> +    struct regmap *regmap;
>> +    struct gpio_chip gpio_chip;
>> +
>> +    int reg_stride;
>> +    int ngpio_per_reg;
>> +    unsigned int reg_dat_base;
>> +    unsigned int reg_set_base;
>> +    unsigned int reg_clr_base;
>> +    unsigned int reg_dir_in_base;
>> +    unsigned int reg_dir_out_base;
> 
> I wonder if a base is enough, shouldn't there be a 'last' or something
> that constrains the range of regmap addresses to be used for gpios?

This should be covered on the regmap, shouldn't it?

> related question since I couldn't figure out how to convert my PCM512x
> example, where there are 6 GPIOs configured with 3 regmap-visible
> registers [1], to this mapping.
> 
> GPIO_EN defines if the GPIO is used or not (each bitfield is tied to a
> GPIO)
> 
> GPIO_CONTROL_1 defines the level (each bitfield is tied to a GPIO)
> 
> GPIO_OUTPUT_1+offset defines what signal is routed to each GPIO. I am
> really not sure how this part would be handled?
> 
> That's 8 registers total to deal with GPIOs.

Looks like you need a custom xlate function:

int pcm512x_gpio_regmap_xlate(struct gpio_regmap *gpio, unsigned int 
base,
                               unsigned int offset, unsigned int *reg,
                               unsigned int *mask)
{
   switch (base)
   case GPIO_EN:
   case GPIO_CONTROL_1:
      *reg = base;
      *mask = (1 << offset);
      break;
   case GPIO_OUTPUT_1:
      *reg = base + offset;
      *mask = ...
      break;
}

base is always one of the xx_base properties in the "struct
gpio_regmap_config".

>> +/**
>> + * struct gpio_regmap_config - Description of a generic regmap
>> gpio_chip.
>> + *
>> + * @parent:        The parent device
>> + * @regmap:        The regmap used to access the registers
>> + *            given, the name of the device is used
>> + * @label:        (Optional) Descriptive name for GPIO controller.
>> + *            If not given, the name of the device is used.
>> + * @ngpio:        Number of GPIOs
>> + * @reg_dat_base:    (Optional) (in) register base address
>> + * @reg_set_base:    (Optional) set register base address
>> + * @reg_clr_base:    (Optional) clear register base address
>> + * @reg_dir_in_base:    (Optional) in setting register base address
>> + * @reg_dir_out_base:    (Optional) out setting register base
>> address
>> + * @reg_stride:        (Optional) May be set if the registers (of
>> the
>> + *            same type, dat, set, etc) are not consecutive.
>> + * @ngpio_per_reg:    Number of GPIOs per register
>> + * @irq_domain:        (Optional) IRQ domain if the controller is
>> + *            interrupt-capable
>> + * @reg_mask_xlate:     (Optional) Translates base address and GPIO
>> + *            offset to a register/bitmask pair. If not
>> + *            given the default gpio_regmap_simple_xlate()
>> + *            is used.
>> + *
>> + * The reg_mask_xlate translates a given base address and GPIO
>> offset to
>> + * register and mask pair. The base address is one of the given
>> reg_*_base.
>> + *
>> + * All base addresses may have the special value
>> GPIO_REGMAP_ADDR_ZERO
>> + * which forces the address to the value 0.
>> + */
>> +struct gpio_regmap_config {
>> +    struct device *parent;
>> +    struct regmap *regmap;
>> +
>> +    const char *label;
>> +    int ngpio;
> 
> could we add a .names field for the gpio_chip, I found this useful for
> PCM512x GPIO support, e.g.

Sure, I have the names in the device tree.

But I'd prefer that you'd do a patch on top of this (assuming it is
applied soon), because you can actually test it and there might be
missing more.

[snip]

-michael
