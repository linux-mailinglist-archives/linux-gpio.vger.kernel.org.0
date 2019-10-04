Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE41DCC42D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 22:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730947AbfJDU2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 16:28:31 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43215 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731104AbfJDU2b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 16:28:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id n14so7734576ljj.10
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DmuBCT6DgL6itaWFoxeQWoH1LVbchfnraupeJ5lYDdA=;
        b=LgoVak/dsMpsma44xWiwwM0sUW9ybzmHrzY+NPC5+mYPiPNM+1+IAUXpoHkdjAnGIf
         qk1U2yvTOcYdpPCFOoDnLwL+v+GhZXb/e6PHNpfdGpeky4eCMH5dsiENZhaUQbBXmqHU
         Ti5qS1iKywIBO5OE0YwJawONpj0Nj5ityXI9ixbWcSWRR456sdXDDOZt7gIg8qrKaH3Z
         TQqEbFCuToiQY2b1l+XNG8mzXV+nhIp9rZt+FNgTf0FaJOE3I902TF94SdZySYuR6L83
         5mP64Okh4ZrMrHSMNtF9cRR2pCAileGVS7KqSu9d1Pj73tCGBPnCe535LYk6zMe1/x/h
         fIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmuBCT6DgL6itaWFoxeQWoH1LVbchfnraupeJ5lYDdA=;
        b=o9CY9GoO/yCB6/p94mxMHqToFKvHsV7pJDmf1XT0IsJPoXUYjfP3aM8Zec/bnfycBm
         9H0r9qm1mEpIFIQbRzsjzd9nap30fVPIT/60ZUcnxPzKVXoH+81Qjzr5b786SI8R8Roh
         w0FBINETlp1ZIs+yi839niCEjpejuuBoT3ybmrR22CEMxRs7TbC8yxv0Vo4g7UqLaQsH
         TtGqTU4aLkkESt4G3ovAMnuK72C4Uac4mo+EyGd0CN9XdO4xBPAMEB4nSVtVXH2wAXR1
         bLjpSqB21w5jP7jxnsxZ3U9gRI7ZvPMMt9DXgwopaUNcSV5cmaS9Snir29GaNCeTnXKE
         6Y2Q==
X-Gm-Message-State: APjAAAUg+ncQktHb1oNZjsKCEp6EBsUYazzghzhdO/vRed8AWHlQ6JnB
        XMS8EJkde2aHQ+RHXEGNn/k5J/TQrp/HyzsmU9GgRg==
X-Google-Smtp-Source: APXvYqytlnsPpzqPLainDGe13NKBn9FNsQAOj+xWRgVRRcuxRcO4HorZOHsiUiNlyMufYZap03zzMRdEFFQdkwVtBbg=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr9278200ljc.99.1570220908068;
 Fri, 04 Oct 2019 13:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com> <65898579e78b4b3bb5db9ddc884a818046c1eb4c.1568274587.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <65898579e78b4b3bb5db9ddc884a818046c1eb4c.1568274587.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 22:28:16 +0200
Message-ID: <CACRpkdbFDTR140_a1FabyjCP2MnBTg-xo2BWnchEvCP161cFLw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: Add pinmux & GPIO controller driver for
 new SoC
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rahul,

this is an interesting patch!

Let's dive in and fix the things not already pointed out in review.

It will need some work but I am sure you can get there.

On Thu, Sep 12, 2019 at 9:59 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Intel Lightning Mountain SoC has a pinmux controller & GPIO controller IP
> which controls pin multiplexing & configuration including GPIO functions
> selection & GPIO attributes configuration. Add GPIO & pin control framework
> based driver for this IP.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
(...)

> +config PINCTRL_EQUILIBRIUM
> +       tristate "Generic pinctrl and GPIO driver for Intel Lightning Mountain SoC"
> +       select PINMUX
> +       select PINCONF
> +       select GPIOLIB
> +       select GPIOLIB_IRQCHIP

Nice use of the GPIOLIB_IRQCHIP.

Are you sure you can't just use GPIO_GENERIC as well?
This is almost always usable when you have a register with
n consecutive bits representing GPIO lines.

Look how we use bgpio_init() in e.g. drivers/gpio/gpio-ftgpio010.c
to cut down on boilerplate code, and we also get a spinlock
protection and .get/.set_multiple() implementation for free.

> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/machine.h>

Why do you need these two includes?

> +static const struct pin_config pin_cfg_type[] = {
> +       {"intel,pullup",                PINCONF_TYPE_PULL_UP},
> +       {"intel,pulldown",              PINCONF_TYPE_PULL_DOWN},
> +       {"intel,drive-current",         PINCONF_TYPE_DRIVE_CURRENT},
> +       {"intel,slew-rate",             PINCONF_TYPE_SLEW_RATE},
> +       {"intel,open-drain",            PINCONF_TYPE_OPEN_DRAIN},
> +       {"intel,output",                PINCONF_TYPE_OUTPUT},
> +};

So... if we are adding a new driver with a new DT binding,
why use the made-up "intel," prefixed flags when we have the
standard DT flags from
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
already handled by the core?

> +static inline void eqbr_set_val(void __iomem *addr, u32 offset,
> +                               u32 mask, u32 set, raw_spinlock_t *lock)
> +{
> +       u32 val;
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(lock, flags);
> +       val = readl(addr) & ~(mask << offset);
> +       writel(val | ((set & mask) << offset), addr);
> +       raw_spin_unlock_irqrestore(lock, flags);
> +}

Mask-and-set is usually achieved with regmap-mmio if you
dont use GPIO_GENERIC, but I think you can just use
GPIO_GENERIC. All of these:

> +static int intel_eqbr_gpio_get_dir(struct gpio_chip *gc, unsigned int offset)
> +static int intel_eqbr_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
> +static int intel_eqbr_gpio_dir_output(struct gpio_chip *gc, unsigned int offset,
> +static void intel_eqbr_gpio_set(struct gpio_chip *gc,
> +                               unsigned int offset, int dir)
> +static int intel_eqbr_gpio_get(struct gpio_chip *gc, unsigned int offset)

Look very bit-per-bit mapped.

> +static int eqbr_irq_map(struct irq_domain *d,
> +                       unsigned int virq, irq_hw_number_t hw)
> +{
> +       struct intel_gpio_desc *desc = d->host_data;
> +
> +       irq_set_chip_data(virq, desc);
> +       irq_set_chip_and_handler(virq, desc->ic, handle_level_irq);
> +       return 0;
> +}
> +
> +static const struct irq_domain_ops gc_irqdomain_ops = {
> +       .map    = eqbr_irq_map,
> +       .xlate  = irq_domain_xlate_twocell,
> +};
> +
(...)
> +static int intel_eqbr_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct intel_gpio_desc *desc = gpiochip_get_data(gc);

Since struct gpio_desc means a per-line state container
and struct intel_gpio_desc refers to the whole chip, I think this
struct should be renamed something like struct eqbr_gpio.

> +       unsigned int virq;
> +
> +       if (!desc->irq_domain)
> +               return -ENODEV;
> +
> +       virq = irq_find_mapping(desc->irq_domain, offset);
> +       if (virq)
> +               return virq;
> +       else
> +               return irq_create_mapping(desc->irq_domain, offset);
> +}
> +
> +static int gpiochip_setup(struct device *dev, struct intel_gpio_desc *desc)
> +{
(...)
> +       gc->to_irq              = intel_eqbr_gpio_to_irq;

You don't need any of this funku stuff. The GPIOLIB_IRQCHIP
provides default implementations to do all this for you.
Just look in drivers/gpio/gpio-ftgpio010.c and follow
the pattern (look how I set up struct gpio_irq_chip using
*girq etc). If you need anything custom we need some
special motivation here.

> +       gc->of_node             = desc->node;
> +       gc->parent              = dev;

I would allocate a dynamic irqchip as part of the
struct intel_gpio_desc and populate it dynamically with
function pointers.

struct gpio_irq_chip *girq;

girq = &gc->irq;
girq->chip = ...

> +       ret = devm_gpiochip_add_data(dev, gc, desc);
> +       if (ret)
> +               dev_err(dev, "failed to register gpiochip: %s, err: %d\n",
> +                       gc->label, ret);
> +
> +       return ret;
> +}

(...)
> +static int eqbr_gpio_irq_req_res(struct irq_data *d)
> +{
> +       struct intel_gpio_desc *desc = irq_data_get_irq_chip_data(d);
> +       unsigned int offset;
> +       int ret;
> +
> +       offset = irqd_to_hwirq(d);
> +
> +       /* gpio must be set as input */
> +       intel_eqbr_gpio_dir_input(&desc->chip, offset);

Please move this to the .irq_enable() callback instead.

> +       ret = gpiochip_lock_as_irq(&desc->chip, offset);
> +       if (ret) {
> +               pr_err("%s: Failed to lock gpio %u as irq!\n",
> +                      desc->name, offset);
> +               return ret;
> +       }
> +       eqbr_gpio_enable_irq(d);

Why are you calling this here? It is premature I think,
isn't the call in .unmask() soon enough? The latter is
what we rely upon.

> +static void eqbr_gpio_irq_rel_res(struct irq_data *d)
> +{
> +       struct intel_gpio_desc *desc = irq_data_get_irq_chip_data(d);
> +       unsigned int offset = irqd_to_hwirq(d);
> +
> +       eqbr_gpio_disable_irq(d);

No need to do this, .irq_mask() has already done it at this
point.

> +       gpiochip_unlock_as_irq(&desc->chip, offset);
> +}

I think the core default implementations should be fine for both
reqres and relres.

> +static struct irq_chip eqbr_irq_chip = {
> +       .name                   = "gpio_irq",
> +       .irq_mask               = eqbr_gpio_disable_irq,
> +       .irq_unmask             = eqbr_gpio_enable_irq,
> +       .irq_ack                = eqbr_gpio_ack_irq,
> +       .irq_mask_ack           = eqbr_gpio_mask_ack_irq,
> +       .irq_set_type           = eqbr_gpio_set_irq_type,
> +       .irq_request_resources  = eqbr_gpio_irq_req_res,
> +       .irq_release_resources  = eqbr_gpio_irq_rel_res,
> +};

So please add a struct irq_chip to the state container
(struct intel_gpio_desc) and assign these functions directly
in probe (again look at gpio-ftgpio010.c).

> +static void eqbr_irq_handler(struct irq_desc *desc)
> +{
> +       struct intel_gpio_desc *gc;
> +       struct irq_chip *ic;
> +       u32 pins, offset;
> +       unsigned int virq;
> +
> +       gc = irq_desc_get_handler_data(desc);
> +       ic = irq_desc_get_chip(desc);

When using the GPIOLIB_IRQCHIP follow the pattern from
other drivers and assume the handler data is the struct gpio_chip
instead.

struct gpio_chip *gc = irq_desc_get_handler_data(desc);
struct intel_gpio_desc *i = gpiochip_get_data(gc);
(...)

> +static int irqchip_setup(struct device *dev, struct intel_gpio_desc *desc)
> +{
> +       struct device_node *np = desc->node;
> +
> +       if (!of_property_read_bool(np, "interrupt-controller")) {
> +               dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
> +                        desc->name);
> +               return 0;
> +       }

OK just skip assigning *girq with the chip etc for this case.

> +       desc->irq_domain = irq_domain_add_linear(desc->node,
> +                                                desc->bank->nr_pins,
> +                                                &gc_irqdomain_ops, desc);
> +       if (!desc->irq_domain) {
> +               dev_err(dev, "%s: failed to create gpio irq domain!\n",
> +                       desc->name);
> +               return -ENODEV;
> +       }
> +       irq_set_chained_handler_and_data(desc->virq, eqbr_irq_handler, desc);

Let GPIOLIB_IRQCHIP handle these things for you instead of
making your own domain etc.

> +static int gpiolib_reg(struct intel_pinctrl_drv_data *drvdata)
> +{
> +       struct device_node *np;
> +       struct intel_gpio_desc *desc;
> +       struct device *dev;
> +       int i, ret;
> +       char name[32];
> +       struct resource res;
> +
> +       dev = drvdata->dev;
> +       for (i = 0; i < drvdata->nr_gpio_descs; i++) {
> +               desc = drvdata->gpio_desc + i;
> +               np = desc->node;
> +               sprintf(name, "gpiochip%d", i);
> +               desc->name = devm_kmemdup(dev, name,
> +                                         strlen(name) + 1, GFP_KERNEL);
> +               if (!desc->name)
> +                       return -ENOMEM;
> +               if (of_address_to_resource(np, 0, &res)) {
> +                       dev_err(dev, "Failed to get GPIO register addrss\n");

Speling

> +                       return -ENXIO;
> +               }
> +               desc->membase = devm_ioremap_resource(dev, &res);
> +               if (IS_ERR(desc->membase)) {
> +                       dev_err(dev, "ioremap fail\n");
> +                       return PTR_ERR(desc->membase);
> +               }
> +               dev_dbg(dev, "gpio resource: %pr\n", &res);
> +               dev_dbg(dev, "gpiochip membase: %px\n", desc->membase);
> +
> +               desc->virq = irq_of_parse_and_map(np, 0);
> +               if (!desc->virq) {
> +                       dev_err(dev, "%s: failed to parse and map irq\n",
> +                               name);
> +                       return -ENXIO;
> +               }
> +               raw_spin_lock_init(&desc->lock);
> +
> +               ret = gpiochip_setup(dev, desc);
> +               if (ret)
> +                       return ret;
> +               ret = irqchip_setup(dev, desc);
> +               if (ret)
> +                       return ret;

Bake these two into a single function setting up gpio_chip and
irq_chip. With proper use of GPIOLIB_IRQCHIP it will be so
much simpler anyway.

> +static int parse_mux_info(struct device_node *np)
> +{
> +       int ret;
> +       const char *str;
> +
> +       ret = of_property_read_string(np, "intel,function", &str);
> +       if (ret)
> +               return -ENODEV;
> +       ret = of_property_read_string(np, "intel,groups", &str);
> +       if (ret)
> +               return -ENODEV;
> +
> +       return ret;
> +}

Again these are intel,foo-specific properties for things we already
have standard bindings for, so use those.

> +static int add_config(struct intel_pinctrl_drv_data *drvdata,
> +                     unsigned long **confs, unsigned int *nr_conf,
> +                     unsigned long pinconf)
> +{
> +       unsigned long *configs;
> +       struct device *dev = drvdata->dev;
> +       unsigned int num_conf = *nr_conf + 1;
> +
> +       if (!(*nr_conf)) {
> +               configs = devm_kcalloc(dev, 1, sizeof(pinconf), GFP_KERNEL);
> +               if (!configs)
> +                       return -ENOMEM;
> +       } else {
> +               configs = devm_kmemdup(dev, *confs,
> +                                      num_conf * sizeof(pinconf), GFP_KERNEL);
> +               if (!configs)
> +                       return -ENOMEM;
> +               devm_kfree(dev, *confs);
> +       }
> +
> +       configs[num_conf - 1] = pinconf;
> +       *confs = configs;
> +       *nr_conf = num_conf;
> +
> +       return 0;
> +}
> +
> +static void eqbr_add_map_mux(struct device_node *np, struct pinctrl_map **map,
> +                            int *index)
> +{
> +       int idx = *index;
> +       const char *function, *group;
> +
> +       of_property_read_string(np, "intel,function", &function);
> +       of_property_read_string(np, "intel,groups", &group);
> +
> +       (*map)[idx].type = PIN_MAP_TYPE_MUX_GROUP;
> +       (*map)[idx].data.mux.group = group;
> +       (*map)[idx].data.mux.function = function;
> +       *index = idx + 1;
> +}
> +
> +static void eqbr_add_map_configs(struct device_node *np,
> +                                struct pinctrl_map **map, int *index,
> +                                unsigned long *configs, unsigned int nr_config)
> +{
> +       int idx = *index;
> +       const char *group;
> +
> +       of_property_read_string(np, "intel,groups", &group);
> +       (*map)[idx].type = PIN_MAP_TYPE_CONFIGS_GROUP;
> +       (*map)[idx].data.configs.group_or_pin = group;
> +       (*map)[idx].data.configs.configs = configs;
> +       (*map)[idx].data.configs.num_configs = nr_config;
> +       *index = idx + 1;
> +}
> +
> +static int eqbr_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                              struct device_node *np,
> +                              struct pinctrl_map **map, unsigned int *num_maps)
> +{
> +       struct intel_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int map_cnt, nr_config;
> +       unsigned long pin_conf, *configs = NULL;
> +       int i, ret;
> +       unsigned int val;
> +       bool func = false;
> +
> +       *map = NULL;
> +       *num_maps = map_cnt = nr_config = 0;
> +
> +       ret = parse_mux_info(np);
> +       if (!ret) {
> +               map_cnt++;
> +               func = true;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(pin_cfg_type); i++) {
> +               ret = of_property_read_u32(np, pin_cfg_type[i].property, &val);
> +               if (!ret) {
> +                       pin_conf = PINCONF_PACK(pin_cfg_type[i].type, val);
> +                       ret = add_config(pctl, &configs, &nr_config, pin_conf);
> +                       if (ret)
> +                               return ret;
> +               }
> +       }
> +
> +       /**
> +        * Create pinctrl_map for each groups, per group per entry.
> +        * Create pinctrl_map for pin config, per group per entry.
> +        */
> +       if (nr_config)
> +               map_cnt++;
> +
> +       *map = devm_kcalloc(pctl->dev, map_cnt, sizeof(**map), GFP_KERNEL);
> +       if (!*map)
> +               return -ENOMEM;
> +
> +       i = 0;
> +       if (func)
> +               eqbr_add_map_mux(np, map, &i);
> +       if (nr_config)
> +               eqbr_add_map_configs(np, map, &i, configs, nr_config);
> +
> +       *num_maps = map_cnt;
> +
> +       return 0;
> +}

With the library code for the standard bindings select
GENERIC_PINMUX_FUNCTIONS and select GENERIC_PINCONF
most of the above goes away as well.

> +static void eqbr_dt_free_map(struct pinctrl_dev *pctldev,
> +                            struct pinctrl_map *map, unsigned int num_maps)
> +{
> +       struct intel_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> +       int i;
> +
> +       for (i = 0; i < num_maps; i++)
> +               if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
> +                       devm_kfree(pctl->dev, map[i].data.configs.configs);
> +       devm_kfree(pctl->dev, map);
> +}

In this case I think you can use the library function
pinctrl_utils_free_map() just as is.

Now I ran out of time, but the generic advice is to use
library code and standard bindings as much as you can
and all will shrink down considerably. Start with the
above pointers and I will look closer after that!

Yours,
Linus Walleij
