Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C82420515
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 05:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbhJDDlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Oct 2021 23:41:13 -0400
Received: from marcansoft.com ([212.63.210.85]:45770 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230295AbhJDDlN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 3 Oct 2021 23:41:13 -0400
X-Greylist: delayed 361 seconds by postgrey-1.27 at vger.kernel.org; Sun, 03 Oct 2021 23:41:12 EDT
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 36A05419C2;
        Mon,  4 Oct 2021 03:33:15 +0000 (UTC)
To:     Joey Gouly <joey.gouly@arm.com>, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd@arm.com,
        Stan Skowronek <stan@corellium.com>
References: <20211001191209.29988-1-joey.gouly@arm.com>
 <20211001191209.29988-4-joey.gouly@arm.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 3/3] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Message-ID: <e18d09cb-ec5f-0e15-e701-f6ae5108b23e@marcan.st>
Date:   Mon, 4 Oct 2021 12:33:15 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001191209.29988-4-joey.gouly@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/10/2021 04.12, Joey Gouly wrote:
> +#define REG_GPIO(x)          (4 * (x))
> +#define REG_GPIOx_DATA       BIT(0)
> +#define REG_GPIOx_MODE_MASK  GENMASK(3, 1)
> +#define REG_GPIOx_OUT        1
> +#define REG_GPIOx_IN_IRQ_HI  2
> +#define REG_GPIOx_IN_IRQ_LO  3
> +#define REG_GPIOx_IN_IRQ_UP  4
> +#define REG_GPIOx_IN_IRQ_DN  5
> +#define REG_GPIOx_IN_IRQ_ANY 6
> +#define REG_GPIOx_IN_IRQ_OFF 7
> +#define REG_GPIOx_PERIPH     BIT(5)
> +#define REG_GPIOx_CFG_DONE   BIT(9)
> +#define REG_GPIOx_GRP_MASK   GENMASK(18, 16)
> +#define REG_IRQ(g, x)        (0x800 + 0x40 * (g) + 4 * ((x) >> 5))

Can we update these defines with the correct definitions and names we 
figured out the other day and add the missing ones? We now know a bunch 
of these are wrong (e.g. CFG_DONE is INPUT_ENABLE, PERIPH should be two 
bits, we're missing pull-up control, drive strength, schmitt trigger and 
lock bits). Even if we don't implement all the features in the driver 
yet, we should have all the register bit defines for documentation 
purposes at least.

> +	if (!(prev & REG_GPIOx_CFG_DONE))
> +		writel_relaxed(cfg & ~REG_GPIOx_CFG_DONE, ppin);
> +	writel_relaxed(cfg, ppin);

We already determined this dance doesn't make any sense; if we want to 
change the pin config before enabling the input buffer (whether this 
serves any purpose at all is an open question) then that should be 
handled in the upper code responsible for enabling/disabling the input 
buffer, not in the core register wrappers.

> +	if (func)
> +		apple_gpio_set_reg(pctl, group, 0,
> +				   REG_GPIOx_PERIPH | REG_GPIOx_CFG_DONE);
> +	else
> +		apple_gpio_set_reg(pctl, group, REG_GPIOx_PERIPH,
> +				   REG_GPIOx_CFG_DONE);

Func is two bits (4 functions) :)

> +static void apple_gpio_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +				int value)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> +
> +	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA,
> +			   REG_GPIOx_CFG_DONE | (value & REG_GPIOx_DATA));
> +}

`value ? REG_GPIOx_DATA : 0` please, otherwise this makes assumptions 
about value always being 1 and REG_GPIOx_DATA being the LSB.

Also as we now know, REG_GPIOx_CFG_DONE is nonsense and doesn't belong 
here. Let's drop the cargo cult and drive the hardware based on how it 
works, not how macOS or Corellium decided to do things.

> +static int apple_gpio_gpio_direction_input(struct gpio_chip *chip,
> +					   unsigned int offset)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> +
> +	apple_gpio_set_reg(pctl, offset, REG_GPIOx_MODE_MASK | REG_GPIOx_DATA,
> +			   FIELD_PREP(REG_GPIOx_MODE_MASK,
> +				      REG_GPIOx_IN_IRQ_OFF) |
> +				   REG_GPIOx_CFG_DONE);

Is hardcoding IRQ_OFF correct here? Shouldn't this be getting the 
intended IRQ state from somewhere, or is it always guaranteed that that 
gets set later?

> +static int apple_gpio_gpio_direction_output(struct gpio_chip *chip,
> +					    unsigned int offset, int value)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> +
> +	apple_gpio_set_reg(pctl, offset, REG_GPIOx_PERIPH | REG_GPIOx_DATA,
> +			   FIELD_PREP(REG_GPIOx_MODE_MASK, REG_GPIOx_OUT) |
> +				   (value & REG_GPIOx_DATA) |
> +				   REG_GPIOx_CFG_DONE);

I actually wonder if we should even bother turning on the input buffer 
for output pins, given we're shadowing the value anyway. Seems 
unnecessary and might save a few nanowatts.

Also, why is this clearing the peripheral (yet direction_input isn't)?

> +static void apple_gpio_gpio_irq_mask(struct irq_data *data)
> +{
> +	struct apple_gpio_pinctrl *pctl =
> +		gpiochip_get_data(irq_data_get_irq_chip_data(data));
> +	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE_MASK,
> +			   FIELD_PREP(REG_GPIOx_MODE_MASK,
> +				      REG_GPIOx_IN_IRQ_OFF) |
> +				   REG_GPIOx_CFG_DONE);
> +}

-REG_GPIOx_CFG_DONE please

> +
> +static void apple_gpio_gpio_irq_unmask(struct irq_data *data)
> +{
> +	struct apple_gpio_pinctrl *pctl =
> +		gpiochip_get_data(irq_data_get_irq_chip_data(data));
> +	u32 irqtype = apple_gpio_irq_type(irqd_get_trigger_type(data));
> +
> +	if (WARN_ON(irqtype < 0))
> +		return;
> +	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_MODE_MASK,
> +			   FIELD_PREP(REG_GPIOx_MODE_MASK, irqtype) |
> +				   REG_GPIOx_CFG_DONE);

Ditto

> +static unsigned int apple_gpio_gpio_irq_startup(struct irq_data *data)
> +{
> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> +
> +	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP_MASK,
> +			   FIELD_PREP(REG_GPIOx_GRP_MASK, 0));

I guess we're only using a single IRQ group right now?

The driver structure looks good (though see the regmap suggestion from 
Linus). Let's just get the actual hardware part right. I didn't spend a 
couple hours poking register bits with a multimeter, a scope, and a 
breadboard for nothing ;)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
