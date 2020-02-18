Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9288716253D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 12:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBRLHR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 06:07:17 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51953 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgBRLHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 06:07:17 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j40ie-0000iS-Ni; Tue, 18 Feb 2020 12:07:12 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1j40ie-0002OZ-24; Tue, 18 Feb 2020 12:07:12 +0100
Date:   Tue, 18 Feb 2020 12:07:12 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] pinctrl: da9062: add driver support
Message-ID: <20200218110712.7wllleu2w5myphyb@pengutronix.de>
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-4-m.felsch@pengutronix.de>
 <AM6PR10MB2263733CA8E02F39A647258D80310@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR10MB2263733CA8E02F39A647258D80310@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:05:45 up 95 days,  2:24, 122 users,  load average: 0.27, 0.55,
 0.42
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

gentle ping. The mfd-code and the dt-bindings are landed in 5.6-rc1 but
this patch is missing.

Regards,
  Marco

On 20-01-17 09:57, Adam Thomson wrote:
> On 08 January 2020 10:48, Marco Felsch wrote:
> 
> > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > be used as input, output or have a special use-case.
> > 
> > The patch adds the support for the normal input/output use-case.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> A little late, but:
> 
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> 
> > ---
> > Changelog:
> > v4:
> > - add missing PIN_CONFIG_BIAS_DISABLE
> > 
> > v3:
> > - add comment for gpio private include
> > - add missing bits.h include
> > - add pin_config state container and set initial pin state to push-pull
> > - make use of GPIO_LINE_DIRECTION_{IN,OUT}
> > - update MAINTAINERS entry -> gpio-da90??.c already covered but not
> >   pinctrl-da90??.c
> > 
> > v2:
> > - fix minor style issue
> > - move from drivers/gpio to drivers/pinctrl
> > - Fix spelling issue
> > - rename local gpio_dir to gpio_mode
> > - Add datasheet reference and TODO notes
> > - move gpio to mfd-root node to avoid hierarchical interrupt chips
> > - Add gpio-controller property check
> > - remove of_device_id since we drop the gpio of-subnode
> > - Drop da9062_gpio_get_hwgpio
> > ---
> >  MAINTAINERS                      |   1 +
> >  drivers/pinctrl/Kconfig          |  12 ++
> >  drivers/pinctrl/Makefile         |   1 +
> >  drivers/pinctrl/pinctrl-da9062.c | 300 +++++++++++++++++++++++++++++++
> >  4 files changed, 314 insertions(+)
> >  create mode 100644 drivers/pinctrl/pinctrl-da9062.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bd5847e802de..9692ff05cd14 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4867,6 +4867,7 @@ F:	drivers/leds/leds-da90??.c
> >  F:	drivers/mfd/da903x.c
> >  F:	drivers/mfd/da90??-*.c
> >  F:	drivers/mfd/da91??-*.c
> > +F:	drivers/pinctrl/pinctrl-da90??.c
> >  F:	drivers/power/supply/da9052-battery.c
> >  F:	drivers/power/supply/da91??-*.c
> >  F:	drivers/regulator/da903x.c
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 3bfbf2ff6e2b..88a3864f32a5 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -126,6 +126,18 @@ config PINCTRL_DA850_PUPD
> >  	  Driver for TI DA850/OMAP-L138/AM18XX pinconf. Used to control
> >  	  pullup/pulldown pin groups.
> > 
> > +config PINCTRL_DA9062
> > +	tristate "Dialog Semiconductor DA9062 PMIC pinctrl and GPIO Support"
> > +	depends on MFD_DA9062
> > +	select GPIOLIB
> > +	help
> > +	  The Dialog DA9062 PMIC provides multiple GPIOs that can be muxed for
> > +	  different functions. This driver bundles a pinctrl driver to select the
> > +	  function muxing and a GPIO driver to handle the GPIO when the GPIO
> > +	  function is selected.
> > +
> > +	  Say yes to enable pinctrl and GPIO support for the DA9062 PMIC.
> > +
> >  config PINCTRL_DIGICOLOR
> >  	bool
> >  	depends on OF && (ARCH_DIGICOLOR || COMPILE_TEST)
> > diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> > index 879f312bfb75..0b36a1cfca8a 100644
> > --- a/drivers/pinctrl/Makefile
> > +++ b/drivers/pinctrl/Makefile
> > @@ -16,6 +16,7 @@ obj-$(CONFIG_PINCTRL_AT91PIO4)	+= pinctrl-at91-
> > pio4.o
> >  obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
> >  obj-$(CONFIG_PINCTRL_BM1880)	+= pinctrl-bm1880.o
> >  obj-$(CONFIG_PINCTRL_DA850_PUPD) += pinctrl-da850-pupd.o
> > +obj-$(CONFIG_PINCTRL_DA9062)	+= pinctrl-da9062.o
> >  obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
> >  obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
> >  obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
> > diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
> > new file mode 100644
> > index 000000000000..f704ee0b2fd9
> > --- /dev/null
> > +++ b/drivers/pinctrl/pinctrl-da9062.c
> > @@ -0,0 +1,300 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Dialog DA9062 pinctrl and GPIO driver.
> > + * Based on DA9055 GPIO driver.
> > + *
> > + * TODO:
> > + *   - add pinmux and pinctrl support (gpio alternate mode)
> > + *
> > + * Documents:
> > + * [1] https://www.dialog-
> > semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
> > + *
> > + * Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > + */
> > +#include <linux/bits.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <linux/gpio/driver.h>
> > +
> > +#include <linux/mfd/da9062/core.h>
> > +#include <linux/mfd/da9062/registers.h>
> > +
> > +/*
> > + * We need this get the gpio_desc from a <gpio_chip,offset> tuple to decide if
> > + * the gpio is active low without a vendor specific dt-binding.
> > + */
> > +#include <../gpio/gpiolib.h>
> > +
> > +#define DA9062_TYPE(offset)		(4 * (offset % 2))
> > +#define DA9062_PIN_SHIFT(offset)	(4 * (offset % 2))
> > +#define DA9062_PIN_ALTERNATE		0x00 /* gpio alternate mode */
> > +#define DA9062_PIN_GPI			0x01 /* gpio in */
> > +#define DA9062_PIN_GPO_OD		0x02 /* gpio out open-drain */
> > +#define DA9062_PIN_GPO_PP		0x03 /* gpio out push-pull */
> > +#define DA9062_GPIO_NUM			5
> > +
> > +struct da9062_pctl {
> > +	struct da9062 *da9062;
> > +	struct gpio_chip gc;
> > +	unsigned int pin_config[DA9062_GPIO_NUM];
> > +};
> > +
> > +static int da9062_pctl_get_pin_mode(struct da9062_pctl *pctl,
> > +				    unsigned int offset)
> > +{
> > +	struct regmap *regmap = pctl->da9062->regmap;
> > +	int ret, val;
> > +
> > +	ret = regmap_read(regmap, DA9062AA_GPIO_0_1 + (offset >> 1), &val);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	val >>= DA9062_PIN_SHIFT(offset);
> > +	val &= DA9062AA_GPIO0_PIN_MASK;
> > +
> > +	return val;
> > +}
> > +
> > +static int da9062_pctl_set_pin_mode(struct da9062_pctl *pctl,
> > +				    unsigned int offset, unsigned int mode_req)
> > +{
> > +	struct regmap *regmap = pctl->da9062->regmap;
> > +	unsigned int mode = mode_req;
> > +	unsigned int mask;
> > +	int ret;
> > +
> > +	mode &= DA9062AA_GPIO0_PIN_MASK;
> > +	mode <<= DA9062_PIN_SHIFT(offset);
> > +	mask = DA9062AA_GPIO0_PIN_MASK << DA9062_PIN_SHIFT(offset);
> > +
> > +	ret = regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >> 1),
> > +				 mask, mode);
> > +	if (!ret)
> > +		pctl->pin_config[offset] = mode_req;
> > +
> > +	return ret;
> > +}
> > +
> > +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	struct regmap *regmap = pctl->da9062->regmap;
> > +	int gpio_mode, val;
> > +	int ret;
> > +
> > +	gpio_mode = da9062_pctl_get_pin_mode(pctl, offset);
> > +	if (gpio_mode < 0)
> > +		return gpio_mode;
> > +
> > +	switch (gpio_mode) {
> > +	case DA9062_PIN_ALTERNATE:
> > +		return -ENOTSUPP;
> > +	case DA9062_PIN_GPI:
> > +		ret = regmap_read(regmap, DA9062AA_STATUS_B, &val);
> > +		if (ret < 0)
> > +			return ret;
> > +		break;
> > +	case DA9062_PIN_GPO_OD:
> > +	case DA9062_PIN_GPO_PP:
> > +		ret = regmap_read(regmap, DA9062AA_GPIO_MODE0_4, &val);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	return !!(val & BIT(offset));
> > +}
> > +
> > +static void da9062_gpio_set(struct gpio_chip *gc, unsigned int offset,
> > +			    int value)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	struct regmap *regmap = pctl->da9062->regmap;
> > +
> > +	regmap_update_bits(regmap, DA9062AA_GPIO_MODE0_4, BIT(offset),
> > +			   value << offset);
> > +}
> > +
> > +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	int gpio_mode;
> > +
> > +	gpio_mode = da9062_pctl_get_pin_mode(pctl, offset);
> > +	if (gpio_mode < 0)
> > +		return gpio_mode;
> > +
> > +	switch (gpio_mode) {
> > +	case DA9062_PIN_ALTERNATE:
> > +		return -ENOTSUPP;
> > +	case DA9062_PIN_GPI:
> > +		return GPIO_LINE_DIRECTION_IN;
> > +	case DA9062_PIN_GPO_OD:
> > +	case DA9062_PIN_GPO_PP:
> > +		return GPIO_LINE_DIRECTION_OUT;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > +				       unsigned int offset)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	struct regmap *regmap = pctl->da9062->regmap;
> > +	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
> > +	unsigned int gpi_type;
> > +	int ret;
> > +
> > +	ret = da9062_pctl_set_pin_mode(pctl, offset, DA9062_PIN_GPI);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * If the gpio is active low we should set it in hw too. No worries
> > +	 * about gpio_get() because we read and return the gpio-level. So the
> > +	 * gpiolib active_low handling is still correct.
> > +	 *
> > +	 * 0 - active low, 1 - active high
> > +	 */
> > +	gpi_type = !gpiod_is_active_low(desc);
> > +
> > +	return regmap_update_bits(regmap, DA9062AA_GPIO_0_1 + (offset >>
> > 1),
> > +				DA9062AA_GPIO0_TYPE_MASK <<
> > DA9062_TYPE(offset),
> > +				gpi_type << DA9062_TYPE(offset));
> > +}
> > +
> > +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> > +					unsigned int offset, int value)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	unsigned int pin_config = pctl->pin_config[offset];
> > +	int ret;
> > +
> > +	ret = da9062_pctl_set_pin_mode(pctl, offset, pin_config);
> > +	if (ret)
> > +		return ret;
> > +
> > +	da9062_gpio_set(gc, offset, value);
> > +
> > +	return 0;
> > +}
> > +
> > +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> > +				  unsigned long config)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	struct regmap *regmap = pctl->da9062->regmap;
> > +	int gpio_mode;
> > +
> > +	/*
> > +	 * We need to meet the following restrictions [1, Figure 18]:
> > +	 * - PIN_CONFIG_BIAS_PULL_DOWN -> only allowed if the pin is used as
> > +	 *				  gpio input
> > +	 * - PIN_CONFIG_BIAS_PULL_UP   -> only allowed if the pin is used as
> > +	 *				  gpio output open-drain.
> > +	 */
> > +
> > +	switch (pinconf_to_config_param(config)) {
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > +					  BIT(offset), 0);
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		gpio_mode = da9062_pctl_get_pin_mode(pctl, offset);
> > +		if (gpio_mode < 0)
> > +			return -EINVAL;
> > +		else if (gpio_mode != DA9062_PIN_GPI)
> > +			return -ENOTSUPP;
> > +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > +					  BIT(offset), BIT(offset));
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		gpio_mode = da9062_pctl_get_pin_mode(pctl, offset);
> > +		if (gpio_mode < 0)
> > +			return -EINVAL;
> > +		else if (gpio_mode != DA9062_PIN_GPO_OD)
> > +			return -ENOTSUPP;
> > +		return regmap_update_bits(regmap, DA9062AA_CONFIG_K,
> > +					  BIT(offset), BIT(offset));
> > +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> > +		return da9062_pctl_set_pin_mode(pctl, offset,
> > +						DA9062_PIN_GPO_OD);
> > +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> > +		return da9062_pctl_set_pin_mode(pctl, offset,
> > +						DA9062_PIN_GPO_PP);
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +}
> > +
> > +static int da9062_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +	struct da9062_pctl *pctl = gpiochip_get_data(gc);
> > +	struct da9062 *da9062 = pctl->da9062;
> > +
> > +	return regmap_irq_get_virq(da9062->regmap_irq,
> > +				   DA9062_IRQ_GPI0 + offset);
> > +}
> > +
> > +static const struct gpio_chip reference_gc = {
> > +	.owner = THIS_MODULE,
> > +	.get = da9062_gpio_get,
> > +	.set = da9062_gpio_set,
> > +	.get_direction = da9062_gpio_get_direction,
> > +	.direction_input = da9062_gpio_direction_input,
> > +	.direction_output = da9062_gpio_direction_output,
> > +	.set_config = da9062_gpio_set_config,
> > +	.to_irq = da9062_gpio_to_irq,
> > +	.can_sleep = true,
> > +	.ngpio = DA9062_GPIO_NUM,
> > +	.base = -1,
> > +};
> > +
> > +static int da9062_pctl_probe(struct platform_device *pdev)
> > +{
> > +	struct device *parent = pdev->dev.parent;
> > +	struct da9062_pctl *pctl;
> > +	int i;
> > +
> > +	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> > +	if (!pctl)
> > +		return -ENOMEM;
> > +
> > +	pctl->da9062 = dev_get_drvdata(parent);
> > +	if (!pctl->da9062)
> > +		return -EINVAL;
> > +
> > +	if (!device_property_present(parent, "gpio-controller"))
> > +		return 0;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(pctl->pin_config); i++)
> > +		pctl->pin_config[i] = DA9062_PIN_GPO_PP;
> > +
> > +	/*
> > +	 * Currently the driver handles only the GPIO support. The
> > +	 * pinctrl/pinmux support can be added later if needed.
> > +	 */
> > +	pctl->gc = reference_gc;
> > +	pctl->gc.label = dev_name(&pdev->dev);
> > +	pctl->gc.parent = &pdev->dev;
> > +#ifdef CONFIG_OF_GPIO
> > +	pctl->gc.of_node = parent->of_node;
> > +#endif
> > +
> > +	platform_set_drvdata(pdev, pctl);
> > +
> > +	return devm_gpiochip_add_data(&pdev->dev, &pctl->gc, pctl);
> > +}
> > +
> > +static struct platform_driver da9062_pctl_driver = {
> > +	.probe = da9062_pctl_probe,
> > +	.driver = {
> > +		.name	= "da9062-gpio",
> > +	},
> > +};
> > +module_platform_driver(da9062_pctl_driver);
> > +
> > +MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de>");
> > +MODULE_DESCRIPTION("DA9062 PMIC pinctrl and GPIO Driver");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:da9062-gpio");
> > --
> > 2.20.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
