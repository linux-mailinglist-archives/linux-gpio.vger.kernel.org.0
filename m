Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCF5386C74
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 23:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245389AbhEQVoS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 17:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245384AbhEQVoR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 17:44:17 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EDBC061573;
        Mon, 17 May 2021 14:43:00 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so394074pjb.2;
        Mon, 17 May 2021 14:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YkF+60OFsiXklOOeHGzY2rXDGOD+az645p7FpABDSJQ=;
        b=TiBwU8xLRdCDGWbhqN+6pW/NGnSeazADLchO5Qnny2GZghBXJWpSFkWm+TK0gz1y3w
         80vSawpGrtbHXM+R5XcThyaoU/mPxlIb48/t1z14Y1RPNcI+QYeQY4ZibZ81I7n5Krv5
         IR4nIeSbECOa38eXRt7dbE3SnmZDUydBjcx43Dorpq+uPLJgqppC6QtmuPfQWqScpF0/
         j1y8y8JGoZ9dXr0f4D3D6Gg/+9YXZkD7yDawAOYXEB75L6YUcPqaNcXLN1UDm9vUM0fX
         XezMMXaSU1OOb8AM7lur5tZtjl0wqMoWwzoXmF7M/+N9knZGD41eJovpHaU2wJDgVDW+
         25Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkF+60OFsiXklOOeHGzY2rXDGOD+az645p7FpABDSJQ=;
        b=Y9CpBc+QMB1zM2mzCpWi3lWvBVy9sTU3fO0C9tWE7V5o6bZyfWyRIc6jIxCzHXjS8F
         p+Ye+wrifp6lyRum8Z++a9agVvvWMH/mgHSqmrLhyCyrPhuAyeuYDQZtdqoOFFAxadq1
         ZngltW471GGNDRLXhpjFFvFdH5OyM7UvKQpG+oXQvSg6DrlGyfDEbQ8Uqr2NHHnZx/rE
         phyFpdW0GmT2ITY57J/bLsqcxbSCkhezEskbd7hDBuWkeRdWY3+8JXYY6d//XXgjS1I+
         sTdKEMk8XI3eKNiMd3x1wFm/QnluOM5e0kAz3hOdQGh5BaRCIVToqgkpy7MLpXFo/Bui
         luJw==
X-Gm-Message-State: AOAM530ffEGnaujjWmpHgzr1Lm2KI0jUNOHmtgp+hTJrjk4I166HOuEB
        7BrWFH3bOTO54GDzrav2ZPIolr5CWKAICmYkxaA=
X-Google-Smtp-Source: ABdhPJzfjGKhQZ9huDDTXMgAyDLDG/q/7gyugWfEAFK7w66R6VNvrYW5v4d6rsG0eXh3V45ZfnK52OiI7zM9oZxINzc=
X-Received: by 2002:a17:90a:6c23:: with SMTP id x32mr1554708pjj.228.1621287779604;
 Mon, 17 May 2021 14:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <041077d195f1cc81bf6363388cb4adfb06cff4ef.1621279162.git.sander@svanheule.net>
In-Reply-To: <041077d195f1cc81bf6363388cb4adfb06cff4ef.1621279162.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 00:42:43 +0300
Message-ID: <CAHp75Vf0Qo-hBUAOwhxGiH6azFg0OPV8OkUSfTxWet__MBF9yA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] pinctrl: Add RTL8231 pin control and GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.
>
> Although described in the bindings, pin debouncing and drive strength
> selection are currently not implemented. Debouncing is only available
> for the six highest GPIOs, and must be emulated when other pins are used
> for (button) inputs anyway.

...

> +struct rtl8231_pin_desc {
> +       unsigned int number;
> +       const char *name;
> +       enum rtl8231_pin_function functions;
> +       u8 reg;
> +       u8 offset;
> +       u8 gpio_function_value;
> +};

I would see rather

sturct pinctrl_pin_desc desc;

Where drv_data describes the rest of the data for pin

...

> +static int rtl8231_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
> +       const unsigned int **pins, unsigned int *num_pins)
> +{

> +       if (selector < ARRAY_SIZE(rtl8231_pins)) {

Can we use traditional pattern, i.e.

  if (... >= ARRAY_SIZE(...))
    return -EINVAL;

  ...
  return 0;

?

> +               *pins = &rtl8231_pins[selector].number;
> +               *num_pins = 1;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}

...

> +static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
> +       unsigned int group_selector)
> +{

> +       int err = 0;

Redundant variable.

> +       switch (func_flag) {
> +       case RTL8231_PIN_FUNCTION_LED:
> +       case RTL8231_PIN_FUNCTION_PWM:
> +               err = regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);
> +               break;
> +       case RTL8231_PIN_FUNCTION_GPIO:
> +               err = regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return err;
> +}

...

> +static const struct pinmux_ops rtl8231_pinmux_ops = {
> +       .set_mux = rtl8231_set_mux,
> +       .get_functions_count = rtl8231_get_functions_count,
> +       .get_function_name = rtl8231_get_function_name,
> +       .get_function_groups = rtl8231_get_function_groups,
> +       .gpio_request_enable = rtl8231_gpio_request_enable,

> +       .strict = true

Leave comma for non-terminator entries.

> +};
> +
> +

One blank line is enough.

...

> +static int rtl8231_pinctrl_init_functions(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
> +{
> +       struct rtl8231_function *function;
> +       const char **group_name;
> +       unsigned int f_idx;
> +       unsigned int pin;
> +
> +       ctrl->nfunctions = ARRAY_SIZE(rtl8231_pin_function_names);
> +       ctrl->functions = devm_kcalloc(dev, ctrl->nfunctions, sizeof(*ctrl->functions), GFP_KERNEL);
> +       if (IS_ERR(ctrl->functions)) {

Wrong.


> +               dev_err(dev, "failed to allocate pin function descriptors\n");

Noisy message, user space will print the similar.

> +               return PTR_ERR(ctrl->functions);
> +       }
> +
> +       for (f_idx = 0; f_idx < ctrl->nfunctions; f_idx++) {
> +               function = &ctrl->functions[f_idx];
> +               function->name = rtl8231_pin_function_names[f_idx];
> +
> +               for (pin = 0; pin < ctrl->pctl_desc.npins; pin++)
> +                       if (rtl8231_pins[pin].functions & BIT(f_idx))
> +                               function->ngroups++;
> +
> +               function->groups = devm_kcalloc(dev, function->ngroups,
> +                       sizeof(*function->groups), GFP_KERNEL);

> +               if (IS_ERR(function->groups)) {
> +                       dev_err(dev, "failed to allocate pin function group names\n");
> +                       return PTR_ERR(function->groups);
> +               }

Ditto.

> +               group_name = function->groups;
> +               for (pin = 0; pin < ctrl->pctl_desc.npins; pin++)
> +                       if (rtl8231_pins[pin].functions & BIT(f_idx))
> +                               *group_name++ = rtl8231_pins[pin].name;
> +       }
> +
> +       return 0;
> +}
> +
> +static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
> +{
> +       struct pinctrl_dev *pctl;
> +       struct pinctrl_pin_desc *pins;
> +       unsigned int pin;

> +       int err = 0;

Check entire series for unnecessary assignments.They

> +
> +       ctrl->pctl_desc.name = "rtl8231-pinctrl",
> +       ctrl->pctl_desc.owner = THIS_MODULE,
> +       ctrl->pctl_desc.pctlops = &rtl8231_pinctrl_ops,
> +       ctrl->pctl_desc.pmxops = &rtl8231_pinmux_ops,
> +
> +       ctrl->pctl_desc.npins = ARRAY_SIZE(rtl8231_pins);
> +       pins = devm_kcalloc(dev, ctrl->pctl_desc.npins, sizeof(*pins), GFP_KERNEL);
> +       if (IS_ERR(pins)) {
> +               dev_err(dev, "failed to allocate pin descriptors\n");
> +               return PTR_ERR(pins);
> +       }

Ditto.

> +       ctrl->pctl_desc.pins = pins;
> +
> +       for (pin = 0; pin < ctrl->pctl_desc.npins; pin++) {
> +               pins[pin].number = rtl8231_pins[pin].number;
> +               pins[pin].name = rtl8231_pins[pin].name;
> +       }
> +
> +       err = rtl8231_pinctrl_init_functions(dev, ctrl);
> +       if (err)
> +               return err;
> +
> +       err = devm_pinctrl_register_and_init(dev->parent, &ctrl->pctl_desc, ctrl, &pctl);
> +       if (err) {
> +               dev_err(dev, "failed to register pin controller\n");
> +               return err;
> +       }
> +
> +       err = pinctrl_enable(pctl);
> +       if (err)
> +               dev_err(dev, "failed to enable pin controller\n");
> +
> +       return err;
> +}
> +
> +/*
> + * GPIO controller functionality
> + */
> +static int rtl8231_gpio_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
> +       unsigned int offset, unsigned int *reg, unsigned int *mask)
> +{
> +       unsigned int pin_mask = BIT(offset % RTL8231_BITS_VAL);
> +
> +       if (base == RTL8231_REG_GPIO_DATA0 || offset < 32) {
> +               *reg = base + offset / RTL8231_BITS_VAL;
> +               *mask = pin_mask;
> +       } else if (base == RTL8231_REG_GPIO_DIR0) {
> +               *reg = RTL8231_REG_PIN_HI_CFG;
> +               *mask = FIELD_PREP(RTL8231_PIN_HI_CFG_DIR_MASK, pin_mask);
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int rtl8231_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct rtl8231_pin_ctrl *ctrl;
> +       struct gpio_regmap_config gpio_cfg = {};
> +       struct gpio_regmap *gr;
> +       int err;
> +
> +       ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->map = dev_get_regmap(dev->parent, NULL);
> +       if (IS_ERR_OR_NULL(ctrl->map)) {
> +               dev_err(dev, "failed to retrieve regmap\n");
> +               if (!ctrl->map)
> +                       return -ENODEV;
> +               else
> +                       return PTR_ERR(ctrl->map);
> +       }
> +
> +       err = rtl8231_pinctrl_init(dev, ctrl);
> +       if (err)
> +               return err;
> +
> +       gpio_cfg.regmap = ctrl->map;
> +       gpio_cfg.parent = dev->parent;
> +       gpio_cfg.ngpio = RTL8231_NUM_GPIOS;
> +       gpio_cfg.ngpio_per_reg = RTL8231_BITS_VAL;
> +
> +       gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
> +       gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
> +       gpio_cfg.reg_dir_in_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DIR0);
> +       gpio_cfg.no_set_on_input = true;
> +
> +       gpio_cfg.reg_mask_xlate = rtl8231_gpio_reg_mask_xlate;
> +
> +       gr = devm_gpio_regmap_register(dev, &gpio_cfg);
> +       if (IS_ERR(gr)) {
> +               dev_err(dev, "failed to register gpio controller\n");
> +               return PTR_ERR(gr);
> +       }
> +
> +       return 0;
> +}
> +
> +static struct platform_driver rtl8231_pinctrl_driver = {
> +       .driver = {
> +               .name = "rtl8231-pinctrl",
> +       },
> +       .probe = rtl8231_pinctrl_probe,
> +};
> +module_platform_driver(rtl8231_pinctrl_driver);
> +
> +MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
> +MODULE_DESCRIPTION("Realtek RTL8231 pin control and GPIO support");
> +MODULE_LICENSE("GPL v2");
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
