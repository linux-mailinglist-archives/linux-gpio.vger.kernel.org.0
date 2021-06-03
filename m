Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC222399EDA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 12:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhFCKVg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 06:21:36 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:47031 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhFCKVg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 06:21:36 -0400
Received: by mail-pf1-f175.google.com with SMTP id u126so551837pfu.13;
        Thu, 03 Jun 2021 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgjvM0zh5YlyyxWSFyEtI+cVcD+OznWzAG+Y41HIaW8=;
        b=NcV/iRDn30Tc2OQDm/694bebecXRWiVM3e10VTJMZDEhiviDySxwa45/ZpQl+MZIJA
         Wntz9QjPx0iQTFcbaDgfZQYQpRM0I07i5BwcFMKfeBulcAsyAVK81i0x4rfkfQYi4n4g
         aDM793Fh7u/GE2NzmTDh7RPEk2r7Fl4jiNG9MIK6lKEnac6PjlkZoeJQZhTmR4FKAmq+
         ddeeFPpLREcrketDAy0v8XwkNv6DpNHT2wiJgLokTkkEWp5SxN0SmbOFbV/nda71mSxw
         1r7/7D5uYvlLf5mT7aiE4iLANAHXU8EPyCdUdDX7uf4pbCCiDAcx+CXF2uuXrfEHVWDn
         vTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgjvM0zh5YlyyxWSFyEtI+cVcD+OznWzAG+Y41HIaW8=;
        b=jsCWslAm0f+GprIwoqCQPYGxb77hqTnXcMY7lwFrttJvcOlOHccGuBEexd+tKmJhm4
         zCWJ6WKnvaLUnIoAZDQgwFwYghsQP1biROqdD8T1X3USTvtnDTnLzbs/5ZJy/I2sxh9u
         Itx9XCIzDmDcYWrULXT6+16YEbfQ7Z1RiG4Zha5noQO7z/4IQO152tIbiNCCxvMBceZp
         kphdBZ0xzAOLfeGCF8X9B6RTgxTMuieweN+Z7SPjOAESiZl8RKARCmG3H2Yg4aIC799G
         /mBwrFTdFXQ5K3KN/IQWWFDJ8aP3YQ3J0Z5M9GeBlaMAFcUUo7gc9t6rrTVUGu4IggV6
         RpEw==
X-Gm-Message-State: AOAM532I0idul3RTsnSzbRiKXPObbb8eY5vKNQCx+C7UkYCmaC2pH6O8
        8BEi2QZYWX26SQWZ5xlPAVX2QeIHY781qD5ODSU=
X-Google-Smtp-Source: ABdhPJzWmeCKsCpBofkzXUiOQBOJJGtU5s3y5Dtqv7dKK08bn/5fONM9Qhp/7y67R2ixSEbWh0M+53lgraU4KvDxFQ8=
X-Received: by 2002:aa7:957d:0:b029:2ea:c56c:7b3e with SMTP id
 x29-20020aa7957d0000b02902eac56c7b3emr3354786pfq.40.1622715522342; Thu, 03
 Jun 2021 03:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622713678.git.sander@svanheule.net> <5d184778a6562e24abfa6e5dd2f7dbde4fede3fe.1622713678.git.sander@svanheule.net>
In-Reply-To: <5d184778a6562e24abfa6e5dd2f7dbde4fede3fe.1622713678.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Jun 2021 13:18:26 +0300
Message-ID: <CAHp75VcjwkachsTJMHPN+nAOdtbNtMV0pgWh8FTzWqMtspdoCA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: Add RTL8231 pin control and GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 3, 2021 at 1:01 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.
>
> Debouncing is only available for the six highest GPIOs, and must be
> emulated when other pins are used for (button) inputs. Although
> described in the bindings, drive strength selection is currently not
> implemented.

Now it looks so nice that I have a temptation to give 2+ tags, but
let's do with one in accordance with process:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks for doing this! It's a good example of how we can do it in
other cases with regmap and this kind of hardware limitation / design.

> Signed-off-by: Sander Vanheule <sander@svanheule.net>
>
> ---
> v4:
> - Switch to pinmux_generic for pin functions
> - Add pin debounce pinconf
> - Virtual addresses and cacheing
> - Use PRT_ERR_OR_ZERO in pinctrl/gpio probe
> - Drop direction-first quirk for gpio-regmap
>
> v3:
> - Use static pin description for pin controller
> - Fix gpio consumer resource leak
>
> v2:
> - Use gpio-regmap with direction-before-value output
> ---
>  drivers/pinctrl/Kconfig           |  11 +
>  drivers/pinctrl/Makefile          |   1 +
>  drivers/pinctrl/pinctrl-rtl8231.c | 438 ++++++++++++++++++++++++++++++
>  3 files changed, 450 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-rtl8231.c
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index c2c7e7963ed0..a02c1befbee4 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -221,6 +221,17 @@ config PINCTRL_ROCKCHIP
>         help
>            This support pinctrl and gpio driver for Rockchip SoCs.
>
> +config PINCTRL_RTL8231
> +       tristate "Realtek RTL8231 GPIO expander's pin controller"
> +       depends on MFD_RTL8231
> +       default MFD_RTL8231
> +       select GPIO_REGMAP
> +       select GENERIC_PINCONF
> +       select GENERIC_PINMUX_FUNCTIONS
> +       help
> +         Support for RTL8231 expander's GPIOs and pin controller.
> +         When built as a module, the module will be called pinctrl-rtl8231.
> +
>  config PINCTRL_SINGLE
>         tristate "One-register-per-pin type device tree based pinctrl driver"
>         depends on OF
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 5ef5334a797f..239603efb317 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_PINCTRL_PALMAS)  += pinctrl-palmas.o
>  obj-$(CONFIG_PINCTRL_PIC32)    += pinctrl-pic32.o
>  obj-$(CONFIG_PINCTRL_PISTACHIO)        += pinctrl-pistachio.o
>  obj-$(CONFIG_PINCTRL_ROCKCHIP) += pinctrl-rockchip.o
> +obj-$(CONFIG_PINCTRL_RTL8231)  += pinctrl-rtl8231.o
>  obj-$(CONFIG_PINCTRL_SINGLE)   += pinctrl-single.o
>  obj-$(CONFIG_PINCTRL_SX150X)   += pinctrl-sx150x.o
>  obj-$(CONFIG_ARCH_TEGRA)       += tegra/
> diff --git a/drivers/pinctrl/pinctrl-rtl8231.c b/drivers/pinctrl/pinctrl-rtl8231.c
> new file mode 100644
> index 000000000000..a0f37633b744
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-rtl8231.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/bitfield.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "core.h"
> +#include "pinmux.h"
> +#include <linux/mfd/rtl8231.h>
> +
> +#define RTL8231_NUM_GPIOS              37
> +#define RTL8231_DEBOUNCE_USEC          100000
> +#define RTL8231_DEBOUNCE_MIN_OFFSET    31
> +
> +struct rtl8231_pin_ctrl {
> +       struct pinctrl_desc pctl_desc;
> +       struct regmap *map;
> +};
> +
> +/*
> + * Pin controller functionality
> + */
> +static const char * const rtl8231_pin_function_names[] = {
> +       "gpio",
> +       "led",
> +       "pwm",
> +};
> +
> +enum rtl8231_pin_function {
> +       RTL8231_PIN_FUNCTION_GPIO = BIT(0),
> +       RTL8231_PIN_FUNCTION_LED = BIT(1),
> +       RTL8231_PIN_FUNCTION_PWM = BIT(2),
> +};
> +
> +struct rtl8231_pin_desc {
> +       const enum rtl8231_pin_function functions;
> +       const u8 reg;
> +       const u8 offset;
> +       const u8 gpio_function_value;
> +};
> +
> +#define RTL8231_PIN_DESC(_num, _func, _reg, _fld, _val)                \
> +       [_num] = {                                              \
> +               .functions = RTL8231_PIN_FUNCTION_GPIO | _func, \
> +               .reg = _reg,                                    \
> +               .offset = _fld,                                 \
> +               .gpio_function_value = _val,                    \
> +       }
> +#define RTL8231_GPIO_PIN_DESC(_num, _reg, _fld)                        \
> +       RTL8231_PIN_DESC(_num, 0, _reg, _fld, RTL8231_PIN_MODE_GPIO)
> +#define RTL8231_LED_PIN_DESC(_num, _reg, _fld)                 \
> +       RTL8231_PIN_DESC(_num, RTL8231_PIN_FUNCTION_LED, _reg, _fld, RTL8231_PIN_MODE_GPIO)
> +#define RTL8231_PWM_PIN_DESC(_num, _reg, _fld)                 \
> +       RTL8231_PIN_DESC(_num, RTL8231_PIN_FUNCTION_PWM, _reg, _fld, 0)
> +
> +/*
> + * All pins have a GPIO/LED mux bit, but the bits for pins 35/36 are read-only. Use this bit
> + * for the GPIO-only pin instead of a placeholder, so the rest of the logic can stay generic.
> + */
> +static struct rtl8231_pin_desc rtl8231_pin_data[RTL8231_NUM_GPIOS] = {
> +       RTL8231_LED_PIN_DESC(0, RTL8231_REG_PIN_MODE0, 0),
> +       RTL8231_LED_PIN_DESC(1, RTL8231_REG_PIN_MODE0, 1),
> +       RTL8231_LED_PIN_DESC(2, RTL8231_REG_PIN_MODE0, 2),
> +       RTL8231_LED_PIN_DESC(3, RTL8231_REG_PIN_MODE0, 3),
> +       RTL8231_LED_PIN_DESC(4, RTL8231_REG_PIN_MODE0, 4),
> +       RTL8231_LED_PIN_DESC(5, RTL8231_REG_PIN_MODE0, 5),
> +       RTL8231_LED_PIN_DESC(6, RTL8231_REG_PIN_MODE0, 6),
> +       RTL8231_LED_PIN_DESC(7, RTL8231_REG_PIN_MODE0, 7),
> +       RTL8231_LED_PIN_DESC(8, RTL8231_REG_PIN_MODE0, 8),
> +       RTL8231_LED_PIN_DESC(9, RTL8231_REG_PIN_MODE0, 9),
> +       RTL8231_LED_PIN_DESC(10, RTL8231_REG_PIN_MODE0, 10),
> +       RTL8231_LED_PIN_DESC(11, RTL8231_REG_PIN_MODE0, 11),
> +       RTL8231_LED_PIN_DESC(12, RTL8231_REG_PIN_MODE0, 12),
> +       RTL8231_LED_PIN_DESC(13, RTL8231_REG_PIN_MODE0, 13),
> +       RTL8231_LED_PIN_DESC(14, RTL8231_REG_PIN_MODE0, 14),
> +       RTL8231_LED_PIN_DESC(15, RTL8231_REG_PIN_MODE0, 15),
> +       RTL8231_LED_PIN_DESC(16, RTL8231_REG_PIN_MODE1, 0),
> +       RTL8231_LED_PIN_DESC(17, RTL8231_REG_PIN_MODE1, 1),
> +       RTL8231_LED_PIN_DESC(18, RTL8231_REG_PIN_MODE1, 2),
> +       RTL8231_LED_PIN_DESC(19, RTL8231_REG_PIN_MODE1, 3),
> +       RTL8231_LED_PIN_DESC(20, RTL8231_REG_PIN_MODE1, 4),
> +       RTL8231_LED_PIN_DESC(21, RTL8231_REG_PIN_MODE1, 5),
> +       RTL8231_LED_PIN_DESC(22, RTL8231_REG_PIN_MODE1, 6),
> +       RTL8231_LED_PIN_DESC(23, RTL8231_REG_PIN_MODE1, 7),
> +       RTL8231_LED_PIN_DESC(24, RTL8231_REG_PIN_MODE1, 8),
> +       RTL8231_LED_PIN_DESC(25, RTL8231_REG_PIN_MODE1, 9),
> +       RTL8231_LED_PIN_DESC(26, RTL8231_REG_PIN_MODE1, 10),
> +       RTL8231_LED_PIN_DESC(27, RTL8231_REG_PIN_MODE1, 11),
> +       RTL8231_LED_PIN_DESC(28, RTL8231_REG_PIN_MODE1, 12),
> +       RTL8231_LED_PIN_DESC(29, RTL8231_REG_PIN_MODE1, 13),
> +       RTL8231_LED_PIN_DESC(30, RTL8231_REG_PIN_MODE1, 14),
> +       RTL8231_LED_PIN_DESC(31, RTL8231_REG_PIN_MODE1, 15),
> +       RTL8231_LED_PIN_DESC(32, RTL8231_REG_PIN_HI_CFG, 0),
> +       RTL8231_LED_PIN_DESC(33, RTL8231_REG_PIN_HI_CFG, 1),
> +       RTL8231_LED_PIN_DESC(34, RTL8231_REG_PIN_HI_CFG, 2),
> +       RTL8231_PWM_PIN_DESC(35, RTL8231_REG_FUNC1, 3),
> +       RTL8231_GPIO_PIN_DESC(36, RTL8231_REG_PIN_HI_CFG, 4),
> +};
> +
> +#define RTL8231_PIN(_num)                              \
> +       {                                               \
> +               .number = _num,                         \
> +               .name = "gpio" #_num,                   \
> +               .drv_data = &rtl8231_pin_data[_num]     \
> +       }
> +
> +static const struct pinctrl_pin_desc rtl8231_pins[RTL8231_NUM_GPIOS] = {
> +       RTL8231_PIN(0),
> +       RTL8231_PIN(1),
> +       RTL8231_PIN(2),
> +       RTL8231_PIN(3),
> +       RTL8231_PIN(4),
> +       RTL8231_PIN(5),
> +       RTL8231_PIN(6),
> +       RTL8231_PIN(7),
> +       RTL8231_PIN(8),
> +       RTL8231_PIN(9),
> +       RTL8231_PIN(10),
> +       RTL8231_PIN(11),
> +       RTL8231_PIN(12),
> +       RTL8231_PIN(13),
> +       RTL8231_PIN(14),
> +       RTL8231_PIN(15),
> +       RTL8231_PIN(16),
> +       RTL8231_PIN(17),
> +       RTL8231_PIN(18),
> +       RTL8231_PIN(19),
> +       RTL8231_PIN(20),
> +       RTL8231_PIN(21),
> +       RTL8231_PIN(22),
> +       RTL8231_PIN(23),
> +       RTL8231_PIN(24),
> +       RTL8231_PIN(25),
> +       RTL8231_PIN(26),
> +       RTL8231_PIN(27),
> +       RTL8231_PIN(28),
> +       RTL8231_PIN(29),
> +       RTL8231_PIN(30),
> +       RTL8231_PIN(31),
> +       RTL8231_PIN(32),
> +       RTL8231_PIN(33),
> +       RTL8231_PIN(34),
> +       RTL8231_PIN(35),
> +       RTL8231_PIN(36),
> +};
> +
> +static int rtl8231_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +       return ARRAY_SIZE(rtl8231_pins);
> +}
> +
> +static const char *rtl8231_get_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
> +{
> +       return rtl8231_pins[selector].name;
> +}
> +
> +static int rtl8231_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
> +       const unsigned int **pins, unsigned int *num_pins)
> +{
> +       if (selector >= ARRAY_SIZE(rtl8231_pins))
> +               return -EINVAL;
> +
> +       *pins = &rtl8231_pins[selector].number;
> +       *num_pins = 1;
> +
> +       return 0;
> +}
> +
> +static const struct pinctrl_ops rtl8231_pinctrl_ops = {
> +       .get_groups_count = rtl8231_get_groups_count,
> +       .get_group_name = rtl8231_get_group_name,
> +       .get_group_pins = rtl8231_get_group_pins,
> +       .dt_node_to_map = pinconf_generic_dt_node_to_map_all,
> +       .dt_free_map = pinconf_generic_dt_free_map,
> +};
> +
> +static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
> +       unsigned int group_selector)
> +{
> +       const struct function_desc *func = pinmux_generic_get_function(pctldev, func_selector);
> +       const struct rtl8231_pin_desc *desc = rtl8231_pins[group_selector].drv_data;
> +       const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int func_flag = (unsigned int) func->data;
> +       unsigned int function_mask;
> +       unsigned int gpio_function;
> +
> +       if (!(desc->functions & func_flag))
> +               return -EINVAL;
> +
> +       function_mask = BIT(desc->offset);
> +       gpio_function = desc->gpio_function_value << desc->offset;
> +
> +       if (func_flag == RTL8231_PIN_FUNCTION_GPIO)
> +               return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
> +       else
> +               return regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);
> +}
> +
> +static int rtl8231_gpio_request_enable(struct pinctrl_dev *pctldev,
> +       struct pinctrl_gpio_range *range, unsigned int offset)
> +{
> +       const struct rtl8231_pin_desc *desc = rtl8231_pins[offset].drv_data;
> +       struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int function_mask;
> +       unsigned int gpio_function;
> +
> +       function_mask = BIT(desc->offset);
> +       gpio_function = desc->gpio_function_value << desc->offset;
> +
> +       return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
> +}
> +
> +static const struct pinmux_ops rtl8231_pinmux_ops = {
> +       .get_functions_count = pinmux_generic_get_function_count,
> +       .get_function_name = pinmux_generic_get_function_name,
> +       .get_function_groups = pinmux_generic_get_function_groups,
> +       .set_mux = rtl8231_set_mux,
> +       .gpio_request_enable = rtl8231_gpio_request_enable,
> +       .strict = true,
> +};
> +
> +static int rtl8231_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
> +       unsigned long *config)
> +{
> +       struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int param = pinconf_to_config_param(*config);
> +       unsigned int arg;
> +       int err;
> +       int v;
> +
> +       switch (param) {
> +       case PIN_CONFIG_INPUT_DEBOUNCE:
> +               if (offset < RTL8231_DEBOUNCE_MIN_OFFSET)
> +                       return -EINVAL;
> +
> +               err = regmap_read(ctrl->map, RTL8231_REG_FUNC1, &v);
> +               if (err)
> +                       return err;
> +
> +               v = FIELD_GET(RTL8231_FUNC1_DEBOUNCE_MASK, v);
> +               if (v & BIT(offset - RTL8231_DEBOUNCE_MIN_OFFSET))
> +                       arg = RTL8231_DEBOUNCE_USEC;
> +               else
> +                       arg = 0;
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       *config = pinconf_to_config_packed(param, arg);
> +
> +       return 0;
> +}
> +
> +static int rtl8231_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
> +       unsigned long *configs, unsigned int num_configs)
> +{
> +       struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned int param, arg;
> +       unsigned int pin_mask;
> +       int err;
> +       int i;
> +
> +       for (i = 0; i < num_configs; i++) {
> +               param = pinconf_to_config_param(configs[i]);
> +               arg = pinconf_to_config_argument(configs[i]);
> +
> +               switch (param) {
> +               case PIN_CONFIG_INPUT_DEBOUNCE:
> +                       if (offset < RTL8231_DEBOUNCE_MIN_OFFSET)
> +                               return -EINVAL;
> +
> +                       pin_mask = FIELD_PREP(RTL8231_FUNC1_DEBOUNCE_MASK,
> +                               BIT(offset - RTL8231_DEBOUNCE_MIN_OFFSET));
> +
> +                       switch (arg) {
> +                       case 0:
> +                               err = regmap_update_bits(ctrl->map, RTL8231_REG_FUNC1,
> +                                       pin_mask, 0);
> +                               break;
> +                       case RTL8231_DEBOUNCE_USEC:
> +                               err = regmap_update_bits(ctrl->map, RTL8231_REG_FUNC1,
> +                                       pin_mask, pin_mask);
> +                               break;
> +                       default:
> +                               return -EINVAL;
> +                       }
> +
> +                       break;
> +               default:
> +                       return -ENOTSUPP;
> +               }
> +       }
> +
> +       return err;
> +}
> +
> +static const struct pinconf_ops rtl8231_pinconf_ops = {
> +       .is_generic = true,
> +       .pin_config_get = rtl8231_pin_config_get,
> +       .pin_config_set = rtl8231_pin_config_set,
> +};
> +
> +static int rtl8231_pinctrl_init_functions(struct pinctrl_dev *pctl, struct rtl8231_pin_ctrl *ctrl)
> +{
> +       const char *function_name;
> +       const char **groups;
> +       unsigned int f_idx;
> +       unsigned int pin;
> +       int num_groups;
> +       int err;
> +
> +       for (f_idx = 0; f_idx < ARRAY_SIZE(rtl8231_pin_function_names); f_idx++) {
> +               function_name = rtl8231_pin_function_names[f_idx];
> +
> +               for (pin = 0, num_groups = 0; pin < ctrl->pctl_desc.npins; pin++)
> +                       if (rtl8231_pin_data[pin].functions & BIT(f_idx))
> +                               num_groups++;
> +
> +               groups = devm_kcalloc(pctl->dev, num_groups, sizeof(*groups), GFP_KERNEL);
> +               if (!groups)
> +                       return -ENOMEM;
> +
> +               for (pin = 0, num_groups = 0; pin < ctrl->pctl_desc.npins; pin++)
> +                       if (rtl8231_pin_data[pin].functions & BIT(f_idx))
> +                               groups[num_groups++] = rtl8231_pins[pin].name;
> +
> +               err = pinmux_generic_add_function(pctl, function_name, groups, num_groups,
> +                       (void *) BIT(f_idx));
> +               if (err < 0)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
> +{
> +       struct pinctrl_dev *pctldev;
> +       int err;
> +
> +       ctrl->pctl_desc.name = "rtl8231-pinctrl";
> +       ctrl->pctl_desc.owner = THIS_MODULE;
> +       ctrl->pctl_desc.confops = &rtl8231_pinconf_ops;
> +       ctrl->pctl_desc.pctlops = &rtl8231_pinctrl_ops;
> +       ctrl->pctl_desc.pmxops = &rtl8231_pinmux_ops;
> +       ctrl->pctl_desc.npins = ARRAY_SIZE(rtl8231_pins);
> +       ctrl->pctl_desc.pins = rtl8231_pins;
> +
> +       err = devm_pinctrl_register_and_init(dev->parent, &ctrl->pctl_desc, ctrl, &pctldev);
> +       if (err) {
> +               dev_err(dev, "failed to register pin controller\n");
> +               return err;
> +       }
> +
> +       err = rtl8231_pinctrl_init_functions(pctldev, ctrl);
> +       if (err)
> +               return err;
> +
> +       err = pinctrl_enable(pctldev);
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
> +       if (base == RTL8231_REG_GPIO_DATA_IN0 || base == RTL8231_VREG_GPIO_DATA_OUT0
> +               || offset < 32) {
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
> +       int err;
> +
> +       ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->map = dev_get_regmap(dev->parent, NULL);
> +       if (!ctrl->map)
> +               return -ENODEV;
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
> +       gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA_IN0);
> +       gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(RTL8231_VREG_GPIO_DATA_OUT0);
> +       gpio_cfg.reg_dir_in_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DIR0);
> +
> +       gpio_cfg.reg_mask_xlate = rtl8231_gpio_reg_mask_xlate;
> +
> +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_cfg));
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
