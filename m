Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F0139239D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 02:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbhE0ANO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 20:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233935AbhE0AND (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 20:13:03 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB534C061354
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 17:10:57 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id q1so5227418lfo.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nehi2xiovSz0luWoQKcuh28nVQh01nMIvGrMSXitflQ=;
        b=DMmqwS1ghgj2bDfyBSBk47v0/nSgx/k5jnSzkoeHUW2z4MU3sVOMSfyWy9Wfi392Ex
         pbPZM/PyL6NkUVwEASJ396rZWLSopx48RPjvRjLs4iBfUzoTOv5UrrM6uhOKnY3yTJ1O
         ub3O3WGaM3Peu+V42rBv3LHkg1yEsd00eAN2PhqQda4qFKXvFJEAq95Chi9ljGSYuXn2
         LPv/YxVy5NXyzV7LCj01XHe5deCo7A8/kXVsQwjkb621p0XSxJVHIlFt1Q7WeEmKBYVG
         O2DMph5HwIhLEli3dfcbuuyXjP2oHKHTvvt9pev/cDx2rWQPyMYRBMxtY2tzUt2ZgYlt
         uJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nehi2xiovSz0luWoQKcuh28nVQh01nMIvGrMSXitflQ=;
        b=aAOMlq0jUggAKvbN99olA2zB1uEBb3GGdX4cQznPbaX8kCeqJkZPXpt20DkMIGVvdU
         3glBGnLJ5gHHiZlD6K2jZZ1D1aMxYUCCHAd1EHwig1+SJD5vry4F3VTWlVDWPvE+nc13
         o1ZfzkJ3UHvazt+5CWnN2dwqJvu2raPKGc5Vfrv1NJAFnr4+BFcfyRtUIXvolSGEF/to
         S8mMcgepBTYpoGKHXcvdOrmqB+Mv2CVxZEf8uQxGHp4JCtkRHbnbdLao1zCyEWMcsp63
         RxRILfjjFblT8T4ceWu+KL+r+Sw57ulufQ4uJ04DnHgVG72Sh8M3DjqQXMfdL9SFs4C+
         hEEQ==
X-Gm-Message-State: AOAM532jemaH2n02j7FPHZsVKYPmOYKkrMp5sKgLBBZfhiq/hnTbFINS
        zmLM37Jm2Ou8I+uzs+T7YigM2+IOImHWyBn/iDM26w==
X-Google-Smtp-Source: ABdhPJz+hI/9wbY5Q3gzEUE2heh/2leFPiBZgNmCuOpx6ELgFK8esu3NRyNd/fowKw/q7DPFp8iyIpXW8CM9Bz6wVJk=
X-Received: by 2002:a19:f616:: with SMTP id x22mr421868lfe.291.1622074255990;
 Wed, 26 May 2021 17:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210524092605.734-1-lakshmi.sowjanya.d@intel.com> <20210524092605.734-3-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210524092605.734-3-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 02:10:43 +0200
Message-ID: <CACRpkdbJPSuNexLE6m-H+=ztaxHRAWT06wwMg95c17O-hR_Cdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Intel Keem Bay pinctrl driver
To:     lakshmi.sowjanya.d@intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>, tamal.saha@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lakshmi,

thanks for your patch!

On Mon, May 24, 2021 at 11:26 AM <lakshmi.sowjanya.d@intel.com> wrote:

> From: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
>
> Add pinctrl driver to enable pin control support in the Intel Keem Bay SoC.

That's a very terse summary, please include some info on the SoC
and that it is not x86 (I guess not?)

What really lacks is a description of how the interrupts are routed and
grouped, there is some details about 4 GPIOs sharing one interrupt
but this really needs to be explained, the code is way to terse to
understand. Probably we also need comments in the code itself
to be able to read it and understand the interrupt handling, so add
some of that, illustrations would be good, anything that make it
crystal clear how the GPIO interrupts are grouped and work.

The pin mux / config on the other hand is very straight-forward,
not much to say about that.

> Signed-off-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Signed-off-by: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>
> Reviewed-by: Mark Gross <mgross@linux.intel.com>
> Tested-by: A, JyothiX <jyothix.a@intel.com>

My first reaction is "how is this hardware different from pinctrl-equilibrium.c?
Also known as "Intel Lightning Mountain".
Can it share code with the former?

Can you do what post pin controller families do and abstract out a
generic pincontrol driver for this family with equilibrium and keembay
as plug-ins? The registers seem to differ so I am not sure if it
can be done.

> +       select GPIO_GENERIC

Are you really using this? It would be great if you did.

> +/* GPIO data registers' offsets */
> +#define KEEMBAY_GPIO_DATA_OUT          0x000
> +#define KEEMBAY_GPIO_DATA_IN           0x020
> +#define KEEMBAY_GPIO_DATA_IN_RAW       0x040
> +#define KEEMBAY_GPIO_DATA_HIGH         0x060
> +#define KEEMBAY_GPIO_DATA_LOW          0x080
> +
> +/* GPIO Interrupt and mode registers' offsets */
> +#define KEEMBAY_GPIO_INT_CFG           0x000
> +#define KEEMBAY_GPIO_MODE              0x070

Yeah I haven't seen this before.
(Andy please make sure it doesn't look like some other Intel.)

I guess this hardware is all brand new.

> +/* GPIO mode register bit fields */
> +#define KEEMBAY_GPIO_MODE_PULLUP_MASK  GENMASK(13, 12)
> +#define KEEMBAY_GPIO_MODE_DRIVE_MASK   GENMASK(8, 7)
> +#define KEEMBAY_GPIO_MODE_INV_MASK     GENMASK(5, 4)
> +#define KEEMBAY_GPIO_MODE_SELECT_MASK  GENMASK(2, 0)
> +#define KEEMBAY_GPIO_MODE_DIR_OVR      BIT(15)
> +#define KEEMBAY_GPIO_MODE_REN          BIT(11)
> +#define KEEMBAY_GPIO_MODE_SCHMITT_EN   BIT(10)
> +#define KEEMBAY_GPIO_MODE_SLEW_RATE    BIT(9)
> +#define KEEMBAY_GPIO_IRQ_ENABLE                BIT(7)
> +#define KEEMBAY_GPIO_MODE_DIR          BIT(3)
> +#define KEEMBAY_GPIO_MODE_DEFAULT      0x7
> +#define KEEMBAY_GPIO_MODE_INV_VAL      0x3
> +
> +#define KEEMBAY_GPIO_DISABLE           0
> +#define KEEMBAY_GPIO_PULL_UP           1
> +#define KEEMBAY_GPIO_PULL_DOWN         2
> +#define KEEMBAY_GPIO_BUS_HOLD          3
> +#define KEEMBAY_GPIO_NUM_IRQ           8
> +#define KEEMBAY_GPIO_MAX_PER_IRQ       4
> +#define KEEMBAY_GPIO_MAX_PER_REG       32
> +#define KEEMBAY_GPIO_MIN_STRENGTH      2
> +#define KEEMBAY_GPIO_MAX_STRENGTH      12
> +#define KEEMBAY_GPIO_SENSE_LOW         (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING)

Lots of config features!

(...)
> +       KEEMBAY_PIN_DESC(79, "GPIO79",
> +                        KEEMBAY_MUX(0x0, "PCIE_M0"),
> +                        KEEMBAY_MUX(0x1, "I2C2_M1"),
> +                        KEEMBAY_MUX(0x2, "SLVDS1_M2"),
> +                        KEEMBAY_MUX(0x3, "TPIU_M3"),
> +                        KEEMBAY_MUX(0x4, "I3C2_M4"),
> +                        KEEMBAY_MUX(0x5, "LCD_M5"),
> +                        KEEMBAY_MUX(0x6, "UART3_M6"),
> +                        KEEMBAY_MUX(0x7, "GPIO_M7")),

I see each pin gets muxed individually.

> +static inline u32 keembay_read_gpio_reg(void __iomem *base, unsigned int pin)
> +{
> +       return keembay_read_reg(base, pin / KEEMBAY_GPIO_MAX_PER_REG);
> +}
> +
> +static inline u32 keembay_read_pin(void __iomem *base, unsigned int pin)
> +{
> +       u32 val = keembay_read_gpio_reg(base, pin);
> +
> +       return !!(val & BIT(pin % KEEMBAY_GPIO_MAX_PER_REG));
> +}

So this is clamping to 32 bits.

What about the old trick of registering one gpiochip per 32 bits and using
GENERIC_GPIO for each? No can do? It is pretty easy to tie it together
using the gpio-ranges see
Documentation/devicetree/bindings/gpio/gpio.txt

> +static void keembay_gpio_invert(struct keembay_pinctrl *kpc, unsigned int pin)
> +{
> +       unsigned int val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
> +
> +       val |= FIELD_PREP(KEEMBAY_GPIO_MODE_INV_MASK, KEEMBAY_GPIO_MODE_INV_VAL);
> +       keembay_write_reg(val, kpc->base1 + KEEMBAY_GPIO_MODE, pin);
> +}

Why would you want to invert? OK I guess I read and see..

> +static int keembay_request_gpio(struct pinctrl_dev *pctldev,
> +                               struct pinctrl_gpio_range *range, unsigned int pin)
> +{
> +       struct keembay_pinctrl *kpc = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int val;
> +
> +       if (pin >= kpc->npins)
> +               return -EINVAL;
> +
> +       val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
> +       val = FIELD_GET(KEEMBAY_GPIO_MODE_SELECT_MASK, val);
> +
> +       /* As per Pin Mux Map, Modes 0 to 6 are for peripherals */
> +       if (val != KEEMBAY_GPIO_MODE_DEFAULT)
> +               return -EBUSY;
> +
> +       return 0;
> +}

> +static u32 keembay_pinconf_get_pull(struct keembay_pinctrl *kpc, unsigned int pin)

All of these pinconf accessors look pretty good.

> +       val = u32_replace_bits(val, pull, KEEMBAY_GPIO_MODE_PULLUP_MASK);

Aha bitfield. Smart!

> +static const struct pinctrl_ops keembay_pctlops = {
> +       .get_groups_count       = pinctrl_generic_get_group_count,
> +       .get_group_name         = pinctrl_generic_get_group_name,
> +       .get_group_pins         = pinctrl_generic_get_group_pins,
> +       .dt_node_to_map         = pinconf_generic_dt_node_to_map_all,
> +       .dt_free_map            = pinconf_generic_dt_free_map,
> +};
> +
> +static const struct pinmux_ops keembay_pmxops = {
> +       .get_functions_count    = pinmux_generic_get_function_count,
> +       .get_function_name      = pinmux_generic_get_function_name,
> +       .get_function_groups    = pinmux_generic_get_function_groups,
> +       .gpio_request_enable    = keembay_request_gpio,
> +       .set_mux                = keembay_set_mux,
> +};

Nice reuse of the generic stuff, nice use of gpio_request_enable()!

> +static int keembay_gpio_get(struct gpio_chip *gc, unsigned int pin)
> +{
> +       struct keembay_pinctrl *kpc = gpiochip_get_data(gc);
> +       unsigned int val, offset;
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&kpc->lock, flags);
> +       val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
> +       offset = (val & KEEMBAY_GPIO_MODE_DIR) ? KEEMBAY_GPIO_DATA_IN : KEEMBAY_GPIO_DATA_OUT;
> +
> +       val = keembay_read_pin(kpc->base0 + offset, pin);
> +       raw_spin_unlock_irqrestore(&kpc->lock, flags);
> +
> +       return val;
> +}
> +
> +static void keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
> +{
> +       struct keembay_pinctrl *kpc = gpiochip_get_data(gc);
> +       unsigned int reg_val;
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&kpc->lock, flags);
> +       reg_val = keembay_read_gpio_reg(kpc->base0 + KEEMBAY_GPIO_DATA_OUT, pin);
> +       if (val)
> +               keembay_write_gpio_reg(reg_val | BIT(pin % KEEMBAY_GPIO_MAX_PER_REG),
> +                                      kpc->base0 + KEEMBAY_GPIO_DATA_HIGH, pin);
> +       else
> +               keembay_write_gpio_reg(~reg_val | BIT(pin % KEEMBAY_GPIO_MAX_PER_REG),
> +                                      kpc->base0 + KEEMBAY_GPIO_DATA_LOW, pin);
> +
> +       raw_spin_unlock_irqrestore(&kpc->lock, flags);
> +}

So the spinlock protects against stuff that GPIO_GENERIC in
gpio-mmio.c is already implementing for single 8/16/32/64 bit
registers.

So if you could split this controller into one gpio_chip per
register, you could reuse all that.

> +static void keembay_gpio_irq_handler(struct irq_desc *desc)
> +{
> +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +       unsigned int kmb_irq = irq_desc_get_irq(desc);
> +       unsigned long reg, clump = 0, bit = 0;
> +       unsigned int src, trig, pin, val;
> +       struct irq_chip *parent_chip;
> +       struct keembay_pinctrl *kpc;
> +
> +       for (src = 0; src < KEEMBAY_GPIO_NUM_IRQ; src++) {
> +               if (kmb_irq == gc->irq.parents[src])
> +                       break;
> +       }
> +
> +       if (src == KEEMBAY_GPIO_NUM_IRQ)
> +               return;

So this gets a bit awkward to look up we need to understand the
way GPIOs are grouped into IRQs here.

> +
> +       parent_chip = irq_desc_get_chip(desc);
> +       kpc = gpiochip_get_data(gc);
> +
> +       chained_irq_enter(parent_chip, desc);
> +       reg = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_INT_CFG, src);
> +       trig = kpc->irq[src].trigger;
> +
> +       /*
> +        * Each Interrupt line can be shared up to 4 GPIO pins. Enable bit and
> +        * input values were checked to indentify the source of the Interrupt.

Indentify?

> +        * The checked enable bit positions are 7, 15, 23 and 31.
> +        */
> +       for_each_set_clump8(bit, clump, &reg, BITS_PER_TYPE(typeof(reg))) {
> +               pin = clump & ~KEEMBAY_GPIO_IRQ_ENABLE;
> +               val = keembay_read_pin(kpc->base0 + KEEMBAY_GPIO_DATA_IN, pin);
> +               kmb_irq = irq_linear_revmap(gc->irq.domain, pin);
> +
> +               if (val && (trig & IRQ_TYPE_SENSE_MASK))
> +                       generic_handle_irq(kmb_irq);

Put in a comment why you have to check the trigger.

(...)

> +static int keembay_pinctrl_reg(struct keembay_pinctrl *kpc,  struct device *dev)
> +{
> +       int ret = of_property_read_u32(dev->of_node, "num-gpios", &kpc->npins);

ngpios is the standard property. Use that. Also change the bindings to
reflect this.

The GPIO chip does not implement .set_config though it should be
super simple: just use gpiochip_generic_config() like
drivers/pinctrl/intel/pinctrl-intel.c does.

I guess I will have more comments once I understand the hardware.

Yours,
Linus Walleij
