Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23DF3D1FAE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 06:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfJJEf6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 00:35:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:20349 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726304AbfJJEf6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Oct 2019 00:35:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 21:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; 
   d="scan'208";a="368954237"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 09 Oct 2019 21:35:56 -0700
Received: from [10.226.38.65] (unknown [10.226.38.65])
        by linux.intel.com (Postfix) with ESMTP id B53885802BC;
        Wed,  9 Oct 2019 21:35:50 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] pinctrl: Add pinmux & GPIO controller driver for
 new SoC
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <65898579e78b4b3bb5db9ddc884a818046c1eb4c.1568274587.git.rahul.tanwar@linux.intel.com>
 <CACRpkdbFDTR140_a1FabyjCP2MnBTg-xo2BWnchEvCP161cFLw@mail.gmail.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <f4cf3553-be3b-ffed-e801-ecb698309a63@linux.intel.com>
Date:   Thu, 10 Oct 2019 12:35:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbFDTR140_a1FabyjCP2MnBTg-xo2BWnchEvCP161cFLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Linus,

Thanks for taking time out to review.

On 5/10/2019 4:28 AM, Linus Walleij wrote:
>> +config PINCTRL_EQUILIBRIUM
>> +       tristate "Generic pinctrl and GPIO driver for Intel Lightning Mountain SoC"
>> +       select PINMUX
>> +       select PINCONF
>> +       select GPIOLIB
>> +       select GPIOLIB_IRQCHIP
> Nice use of the GPIOLIB_IRQCHIP.
>
> Are you sure you can't just use GPIO_GENERIC as well?
> This is almost always usable when you have a register with
> n consecutive bits representing GPIO lines.
>
> Look how we use bgpio_init() in e.g. drivers/gpio/gpio-ftgpio010.c
> to cut down on boilerplate code, and we also get a spinlock
> protection and .get/.set_multiple() implementation for free.

I went through gpio-mmio.c & gpio-ftgpio010.c code. My understanding is
that GPIO_GENERIC can support a max of 64 consecutive bits representing
GPIO lines. We have more than 100 GPIO's and they are spread out across
4 different banks with non consecutive registers i.e. DATA_IN_0~31@offset0x0,
DATA_IN_32~63@offset0x100 and so on. In other words, i think we can not
support memory mapped GPIO controller.

>> +#include <linux/pinctrl/consumer.h>
>> +#include <linux/pinctrl/machine.h>
> Why do you need these two includes?

Yes, these are redundant. I will remove them. Thanks.

>> +static const struct pin_config pin_cfg_type[] = {
>> +       {"intel,pullup",                PINCONF_TYPE_PULL_UP},
>> +       {"intel,pulldown",              PINCONF_TYPE_PULL_DOWN},
>> +       {"intel,drive-current",         PINCONF_TYPE_DRIVE_CURRENT},
>> +       {"intel,slew-rate",             PINCONF_TYPE_SLEW_RATE},
>> +       {"intel,open-drain",            PINCONF_TYPE_OPEN_DRAIN},
>> +       {"intel,output",                PINCONF_TYPE_OUTPUT},
>> +};
> So... if we are adding a new driver with a new DT binding,
> why use the made-up "intel," prefixed flags when we have the
> standard DT flags from
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> already handled by the core?

Yes, Andy & Rob have also raised same concerns. I will switch to using
standard DT properties & generic pinconf and remove redundant code.
Thanks.

>> +static inline void eqbr_set_val(void __iomem *addr, u32 offset,
>> +                               u32 mask, u32 set, raw_spinlock_t *lock)
>> +{
>> +       u32 val;
>> +       unsigned long flags;
>> +
>> +       raw_spin_lock_irqsave(lock, flags);
>> +       val = readl(addr) & ~(mask << offset);
>> +       writel(val | ((set & mask) << offset), addr);
>> +       raw_spin_unlock_irqrestore(lock, flags);
>> +}
> Mask-and-set is usually achieved with regmap-mmio if you
> dont use GPIO_GENERIC, but I think you can just use
> GPIO_GENERIC. All of these:

As mentioned above, we cannot use GPIO_GENERIC. And there was no specific
reason/motivation for us to use regmap-mmio because most of the driver's
that we referenced were using readl()/write(). Do you recommend us to remove
readl()/writel() and switch to regmap-mmio based design ?

>> +static int intel_eqbr_gpio_get_dir(struct gpio_chip *gc, unsigned int offset)
>> +static int intel_eqbr_gpio_dir_input(struct gpio_chip *gc, unsigned int offset)
>> +static int intel_eqbr_gpio_dir_output(struct gpio_chip *gc, unsigned int offset,
>> +static void intel_eqbr_gpio_set(struct gpio_chip *gc,
>> +                               unsigned int offset, int dir)
>> +static int intel_eqbr_gpio_get(struct gpio_chip *gc, unsigned int offset)
> Look very bit-per-bit mapped.
>
>> +static int intel_eqbr_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +       struct intel_gpio_desc *desc = gpiochip_get_data(gc);
> Since struct gpio_desc means a per-line state container
> and struct intel_gpio_desc refers to the whole chip, I think this
> struct should be renamed something like struct eqbr_gpio.

Just to clarify, we have 4 different GPIO banks and each GPIO bank is
implemented as a separate gpio_chip. So we have 4 instances of gpio_desc
each one having its own gpio_chip. What i mean to say is that gpio_desc
is actually not a per-line state container, its a per gpio_chip container.

>> +       unsigned int virq;
>> +
>> +       if (!desc->irq_domain)
>> +               return -ENODEV;
>> +
>> +       virq = irq_find_mapping(desc->irq_domain, offset);
>> +       if (virq)
>> +               return virq;
>> +       else
>> +               return irq_create_mapping(desc->irq_domain, offset);
>> +}
>> +
>> +static int gpiochip_setup(struct device *dev, struct intel_gpio_desc *desc)
>> +{
> (...)
>> +       gc->to_irq              = intel_eqbr_gpio_to_irq;
> You don't need any of this funku stuff. The GPIOLIB_IRQCHIP
> provides default implementations to do all this for you.
> Just look in drivers/gpio/gpio-ftgpio010.c and follow
> the pattern (look how I set up struct gpio_irq_chip using
> *girq etc). If you need anything custom we need some
> special motivation here.

Yes, i checked gpio-ftgpio010.c and agree that this is already handled
under GPIOLIB_IRQCHIP. I will make these changes in V2. Thanks.

>> +       gc->of_node             = desc->node;
>> +       gc->parent              = dev;
> I would allocate a dynamic irqchip as part of the
> struct intel_gpio_desc and populate it dynamically with
> function pointers.
>
> struct gpio_irq_chip *girq;
>
> girq = &gc->irq;
> girq->chip = ...

Agree, i will follow this approach as part of switching to reusing
GPIOLIB_IRQCHIP default implementations. Thanks.

>> +static int eqbr_gpio_irq_req_res(struct irq_data *d)
>> +{
>> +       struct intel_gpio_desc *desc = irq_data_get_irq_chip_data(d);
>> +       unsigned int offset;
>> +       int ret;
>> +
>> +       offset = irqd_to_hwirq(d);
>> +
>> +       /* gpio must be set as input */
>> +       intel_eqbr_gpio_dir_input(&desc->chip, offset);
> Please move this to the .irq_enable() callback instead.

Well noted.

>> +       ret = gpiochip_lock_as_irq(&desc->chip, offset);
>> +       if (ret) {
>> +               pr_err("%s: Failed to lock gpio %u as irq!\n",
>> +                      desc->name, offset);
>> +               return ret;
>> +       }
>> +       eqbr_gpio_enable_irq(d);
> Why are you calling this here? It is premature I think,
> isn't the call in .unmask() soon enough? The latter is
> what we rely upon.

Agree, have already changed it.

>> +static void eqbr_gpio_irq_rel_res(struct irq_data *d)
>> +{
>> +       struct intel_gpio_desc *desc = irq_data_get_irq_chip_data(d);
>> +       unsigned int offset = irqd_to_hwirq(d);
>> +
>> +       eqbr_gpio_disable_irq(d);
> No need to do this, .irq_mask() has already done it at this
> point.

Agree, have already changed it.

>> +       gpiochip_unlock_as_irq(&desc->chip, offset);
>> +}
> I think the core default implementations should be fine for both
> reqres and relres.

I also observed this when referring to gpio-ftgpio010.c. Will change to
default implementations.

>> +static struct irq_chip eqbr_irq_chip = {
>> +       .name                   = "gpio_irq",
>> +       .irq_mask               = eqbr_gpio_disable_irq,
>> +       .irq_unmask             = eqbr_gpio_enable_irq,
>> +       .irq_ack                = eqbr_gpio_ack_irq,
>> +       .irq_mask_ack           = eqbr_gpio_mask_ack_irq,
>> +       .irq_set_type           = eqbr_gpio_set_irq_type,
>> +       .irq_request_resources  = eqbr_gpio_irq_req_res,
>> +       .irq_release_resources  = eqbr_gpio_irq_rel_res,
>> +};
> So please add a struct irq_chip to the state container
> (struct intel_gpio_desc) and assign these functions directly
> in probe (again look at gpio-ftgpio010.c).

Yup, agree. Will change. Thanks.

>> +static void eqbr_irq_handler(struct irq_desc *desc)
>> +{
>> +       struct intel_gpio_desc *gc;
>> +       struct irq_chip *ic;
>> +       u32 pins, offset;
>> +       unsigned int virq;
>> +
>> +       gc = irq_desc_get_handler_data(desc);
>> +       ic = irq_desc_get_chip(desc);
> When using the GPIOLIB_IRQCHIP follow the pattern from
> other drivers and assume the handler data is the struct gpio_chip
> instead.
>
> struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> struct intel_gpio_desc *i = gpiochip_get_data(gc);
> (...)

Well noted.

>> +static int irqchip_setup(struct device *dev, struct intel_gpio_desc *desc)
>> +{
>> +       struct device_node *np = desc->node;
>> +
>> +       if (!of_property_read_bool(np, "interrupt-controller")) {
>> +               dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
>> +                        desc->name);
>> +               return 0;
>> +       }
> OK just skip assigning *girq with the chip etc for this case.

I understand. BTW, this call is in the probe path. I am planning to do girq
setup on the lines of gpio-ftgpio010.c in this function instead of probe.
So yes, i can skip assigning chip to girq for this case in this function.

>> +       desc->irq_domain = irq_domain_add_linear(desc->node,
>> +                                                desc->bank->nr_pins,
>> +                                                &gc_irqdomain_ops, desc);
>> +       if (!desc->irq_domain) {
>> +               dev_err(dev, "%s: failed to create gpio irq domain!\n",
>> +                       desc->name);
>> +               return -ENODEV;
>> +       }
>> +       irq_set_chained_handler_and_data(desc->virq, eqbr_irq_handler, desc);
> Let GPIOLIB_IRQCHIP handle these things for you instead of
> making your own domain etc.

Yes, got it now. Thanks.

>> +static int gpiolib_reg(struct intel_pinctrl_drv_data *drvdata)
>> +{
>> +       struct device_node *np;
>> +       struct intel_gpio_desc *desc;
>> +       struct device *dev;
>> +       int i, ret;
>> +       char name[32];
>> +       struct resource res;
>> +
>> +       dev = drvdata->dev;
>> +       for (i = 0; i < drvdata->nr_gpio_descs; i++) {
>> +               desc = drvdata->gpio_desc + i;
>> +               np = desc->node;
>> +               sprintf(name, "gpiochip%d", i);
>> +               desc->name = devm_kmemdup(dev, name,
>> +                                         strlen(name) + 1, GFP_KERNEL);
>> +               if (!desc->name)
>> +                       return -ENOMEM;
>> +               if (of_address_to_resource(np, 0, &res)) {
>> +                       dev_err(dev, "Failed to get GPIO register addrss\n");
> Speling

Well noted.

>> +                       return -ENXIO;
>> +               }
>> +               desc->membase = devm_ioremap_resource(dev, &res);
>> +               if (IS_ERR(desc->membase)) {
>> +                       dev_err(dev, "ioremap fail\n");
>> +                       return PTR_ERR(desc->membase);
>> +               }
>> +               dev_dbg(dev, "gpio resource: %pr\n", &res);
>> +               dev_dbg(dev, "gpiochip membase: %px\n", desc->membase);
>> +
>> +               desc->virq = irq_of_parse_and_map(np, 0);
>> +               if (!desc->virq) {
>> +                       dev_err(dev, "%s: failed to parse and map irq\n",
>> +                               name);
>> +                       return -ENXIO;
>> +               }
>> +               raw_spin_lock_init(&desc->lock);
>> +
>> +               ret = gpiochip_setup(dev, desc);
>> +               if (ret)
>> +                       return ret;
>> +               ret = irqchip_setup(dev, desc);
>> +               if (ret)
>> +                       return ret;
> Bake these two into a single function setting up gpio_chip and
> irq_chip. With proper use of GPIOLIB_IRQCHIP it will be so
> much simpler anyway.

Agree. Will change accordingly. Thanks.

>> +static int parse_mux_info(struct device_node *np)
>> +{
>> +       int ret;
>> +       const char *str;
>> +
>> +       ret = of_property_read_string(np, "intel,function", &str);
>> +       if (ret)
>> +               return -ENODEV;
>> +       ret = of_property_read_string(np, "intel,groups", &str);
>> +       if (ret)
>> +               return -ENODEV;
>> +
>> +       return ret;
>> +}
> Again these are intel,foo-specific properties for things we already
> have standard bindings for, so use those.

Yes, this will most likely go away because pinctrl_ops->dt_node_to_map()
uses this function to count group map entries. And based on your comments,
i will switch to using pinconf generic with standard properties which already
handles dt_node_to_map() & dt_free_map().

>> +static int add_config(struct intel_pinctrl_drv_data *drvdata,
>> +                     unsigned long **confs, unsigned int *nr_conf,
>> +                     unsigned long pinconf)
>> +{
>> +       unsigned long *configs;
>> +       struct device *dev = drvdata->dev;
>> +       unsigned int num_conf = *nr_conf + 1;
>> +
>> +       if (!(*nr_conf)) {
>> +               configs = devm_kcalloc(dev, 1, sizeof(pinconf), GFP_KERNEL);
>> +               if (!configs)
>> +                       return -ENOMEM;
>> +       } else {
>> +               configs = devm_kmemdup(dev, *confs,
>> +                                      num_conf * sizeof(pinconf), GFP_KERNEL);
>> +               if (!configs)
>> +                       return -ENOMEM;
>> +               devm_kfree(dev, *confs);
>> +       }
>> +
>> +       configs[num_conf - 1] = pinconf;
>> +       *confs = configs;
>> +       *nr_conf = num_conf;
>> +
>> +       return 0;
>> +}
>> +
>> +static void eqbr_add_map_mux(struct device_node *np, struct pinctrl_map **map,
>> +                            int *index)
>> +{
>> +       int idx = *index;
>> +       const char *function, *group;
>> +
>> +       of_property_read_string(np, "intel,function", &function);
>> +       of_property_read_string(np, "intel,groups", &group);
>> +
>> +       (*map)[idx].type = PIN_MAP_TYPE_MUX_GROUP;
>> +       (*map)[idx].data.mux.group = group;
>> +       (*map)[idx].data.mux.function = function;
>> +       *index = idx + 1;
>> +}
>> +
>> +static void eqbr_add_map_configs(struct device_node *np,
>> +                                struct pinctrl_map **map, int *index,
>> +                                unsigned long *configs, unsigned int nr_config)
>> +{
>> +       int idx = *index;
>> +       const char *group;
>> +
>> +       of_property_read_string(np, "intel,groups", &group);
>> +       (*map)[idx].type = PIN_MAP_TYPE_CONFIGS_GROUP;
>> +       (*map)[idx].data.configs.group_or_pin = group;
>> +       (*map)[idx].data.configs.configs = configs;
>> +       (*map)[idx].data.configs.num_configs = nr_config;
>> +       *index = idx + 1;
>> +}
>> +
>> +static int eqbr_dt_node_to_map(struct pinctrl_dev *pctldev,
>> +                              struct device_node *np,
>> +                              struct pinctrl_map **map, unsigned int *num_maps)
>> +{
>> +       struct intel_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
>> +       unsigned int map_cnt, nr_config;
>> +       unsigned long pin_conf, *configs = NULL;
>> +       int i, ret;
>> +       unsigned int val;
>> +       bool func = false;
>> +
>> +       *map = NULL;
>> +       *num_maps = map_cnt = nr_config = 0;
>> +
>> +       ret = parse_mux_info(np);
>> +       if (!ret) {
>> +               map_cnt++;
>> +               func = true;
>> +       }
>> +
>> +       for (i = 0; i < ARRAY_SIZE(pin_cfg_type); i++) {
>> +               ret = of_property_read_u32(np, pin_cfg_type[i].property, &val);
>> +               if (!ret) {
>> +                       pin_conf = PINCONF_PACK(pin_cfg_type[i].type, val);
>> +                       ret = add_config(pctl, &configs, &nr_config, pin_conf);
>> +                       if (ret)
>> +                               return ret;
>> +               }
>> +       }
>> +
>> +       /**
>> +        * Create pinctrl_map for each groups, per group per entry.
>> +        * Create pinctrl_map for pin config, per group per entry.
>> +        */
>> +       if (nr_config)
>> +               map_cnt++;
>> +
>> +       *map = devm_kcalloc(pctl->dev, map_cnt, sizeof(**map), GFP_KERNEL);
>> +       if (!*map)
>> +               return -ENOMEM;
>> +
>> +       i = 0;
>> +       if (func)
>> +               eqbr_add_map_mux(np, map, &i);
>> +       if (nr_config)
>> +               eqbr_add_map_configs(np, map, &i, configs, nr_config);
>> +
>> +       *num_maps = map_cnt;
>> +
>> +       return 0;
>> +}
> With the library code for the standard bindings select
> GENERIC_PINMUX_FUNCTIONS and select GENERIC_PINCONF
> most of the above goes away as well.

Agree, clear about it now. All this goes away with GENERIC_PINCONF.
Not yet sure about GENERIC_PINMUX_FUNCTIONS. Need to test if generic
pinmux functions are ok to use for us. Seems not many driveruse
generic pinmux presently.

>> +static void eqbr_dt_free_map(struct pinctrl_dev *pctldev,
>> +                            struct pinctrl_map *map, unsigned int num_maps)
>> +{
>> +       struct intel_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
>> +       int i;
>> +
>> +       for (i = 0; i < num_maps; i++)
>> +               if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
>> +                       devm_kfree(pctl->dev, map[i].data.configs.configs);
>> +       devm_kfree(pctl->dev, map);
>> +}
> In this case I think you can use the library function
> pinctrl_utils_free_map() just as is.

Yup, thanks.

> Now I ran out of time, but the generic advice is to use
> library code and standard bindings as much as you can
> and all will shrink down considerably. Start with the
> above pointers and I will look closer after that!
>
> Yours,
> Linus Walleij

Regards,
Rahul
