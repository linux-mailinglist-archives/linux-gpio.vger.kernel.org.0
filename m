Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA5E3AF1DB
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 19:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhFUR1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 13:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhFUR1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 13:27:45 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68FBC061574;
        Mon, 21 Jun 2021 10:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=L+lMV6AjikKwGor43KEcUq86KYglHxWVK1hGJ6yKg8g=; b=M/v1m9N75GRzLwsIEPcejJHs70
        K/Q3VYFFekxzT80gZeJMhDMaiw5SdlOfFGLgeH0xuZKlmXe1Qjjv4+xp28iooUhhPZeDyM+LoMqgt
        zWxJKzOD/8Uurs8cZdb2sZePBtBL6Z/GcUK0RR/eUZ8nOYWuAYY2rjlvRRncCIDSOLECeO+51CiFL
        O8CeA15qt9I4HkHUYMyzPmCyWinmoPR9RP7jSTC9NaSZwnDiR0G4xHaspfguxjudT5IV4n8g/iUo6
        8kgkvDWIyn3qR76Hw1W/QmqgCB1SlOZkBXlO8ZXBvlzkXOMq7JSFlqdaXugiQCfkzjoQWZhaDgzsF
        oa9VrvHw==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164]:49245 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1lvNfl-0002Cj-0g; Mon, 21 Jun 2021 20:25:22 +0300
Received: by localdomain (sSMTP sendmail emulation); Mon, 21 Jun 2021 20:25:20 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Mon, 21 Jun 2021 20:20:51 +0300
Message-Id: <20210621172053.107045-1-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: [PATCH v5 0/2] gpio: add generic gpio cascade
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello all,

Thank you for your review comments so far. Here comes new attempt at the gpio
multiplexer driver. There are quite a lot of changes if you look at the diff
based on the v4. Functionality is still the same, though. Only renaming,
refactoring and some more documentation.

What was done
 - rename 'gpio-mux-input' -> 'gpio-cascade' in sources
 - bindings were changed to reflect the renaming
 - refactoring here and there, renaming variables
 - documentation was made simpler and more verbose

Drew: I chose to drop the Reviewed-by and Tested-by tags because, even though
mostly renaming, bindings were changed too and that affects functionality. If
you have the time, could you please have another look?

Linus: I hope the changes to the documentation were what you had in mind.

Rob: I fixed a couple of errors that you bot detected but one is due to missing
schema file (gpio-mux) and adding that is not in the scope of this work.

Andy: I dropped the Reported-by tag the bot had instructed me to add.

Thanks,
Mauri

diff between v4 and v5

1:  496558967cd8 ! 1:  83defaf33475 dt-bindings: gpio-mux-input: add documentation
    @@ Metadata
     Author: Mauri Sandberg <maukka@ext.kapsi.fi>
     
      ## Commit message ##
    -    dt-bindings: gpio-mux-input: add documentation
    +    dt-bindings: gpio-cascade: add documentation
     
    -    Add documentation for a general GPIO multiplexer.
    +    Add documentation for a general GPIO cascade. It allows building
    +    one-to-many cascades of GPIO lines using multiplexer to choose
    +    the cascaded line.
     
         Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
    -    Tested-by: Drew Fustini <drew@beagleboard.org>
    -    Reviewed-by: Drew Fustini <drew@beagleboard.org>
         ---
    +    v4 -> v5:
    +     - renamed gpio-mux-input -> gpio-cascade
    +     - changed vague term 'pin' to 'upstream line'
    +     - added more verbose description for the module
    +     - added missing 'mux-controls' entry
    +     - dropped Tested-by and Reviewed-by due to changes in bindings
         v3 -> v4:
          - Changed author email
          - Included Tested-by and Reviewed-by from Drew
         v2 -> v3: added a complete example on dual 4-way multiplexer
         v1 -> v2: added a little bit more text in the binding documenation
     
    - ## Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml (new) ##
    + ## Documentation/devicetree/bindings/gpio/gpio-cascade.yaml (new) ##
     @@
     +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
     +%YAML 1.2
     +---
    -+$id: http://devicetree.org/schemas/gpio/gpio-mux-input.yaml#
    ++$id: http://devicetree.org/schemas/gpio/gpio-cascade.yaml#
     +$schema: http://devicetree.org/meta-schemas/core.yaml#
     +
    -+title: Generic GPIO input multiplexer
    ++title: Generic GPIO cascade
     +
     +maintainers:
     +  - Mauri Sandberg <maukka@ext.kapsi.fi>
     +
     +description: |
    -+  A generic GPIO based input multiplexer
    ++  A generic GPIO cascade
     +
    -+  This driver uses a mux-controller to drive the multiplexer and has a single
    -+  output pin for reading the inputs to the mux.
    ++  This hardware construction cascades (multiplexes) several GPIO lines from
    ++  one-to-many using a software controlled multiplexer. The most common use
    ++  case is probably reading several inputs by switching the multiplexer over
    ++  several input lines, which in practice works well since input lines has
    ++  high impedance.
     +
    -+  For GPIO consumer documentation see gpio.txt.
    ++  Constructions with multiplexed outputs are also possible using open drain
    ++  electronics.
    ++
    ++  The number of cascaded GPIO lines is limited by the technology used to
    ++  switch over the cascaded lines. There are readily available dual/triple
    ++  4-to-1 multiplexers, for example, and others.
    ++
    ++  Illustration (pins used to drive the multiplexer are omitted for clarity)
    ++
    ++                 /|---- Cascaded GPIO line 0
    ++  Upstream      | |---- Cascaded GPIO line 1
    ++  GPIO line ----+ | .
    ++                | | .
    ++                 \|---- Cascaded GPIO line n
     +
     +properties:
     +  compatible:
     +    enum:
    -+      - gpio-mux-input
    ++      - gpio-cascade
     +
     +  gpio-controller: true
     +
     +  '#gpio-cells':
     +    const: 2
     +
    -+  pin-gpios:
    ++  mux-controls:
    ++    minItems: 1
    ++    maxItems: 1
     +    description: |
    -+      The GPIO pin used as the output from the multiplexer
    ++      The mux controller that will be driving the GPIO cascade.
    ++
    ++  upstream-gpios:
    ++    description: |
    ++      The GPIO line used as the upstream line will convey the status to/from
    ++      cascaded GPIO lines. In an input mode, by using this line, it is
    ++      possible to read the status from selected cascaded GPIO line.
    ++
    ++      In an output mode the status of the upstream GPIO will be conveyed to
    ++      the selected cascaded GPIO line.
     +
     +required:
     +  - compatible
     +  - gpio-controller
     +  - "#gpio-cells"
    -+  - pin-gpios
    ++  - mux-controls
    ++  - upstream-gpios
     +
     +additionalProperties: false
     +
    @@ Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml (new)
     +    };
     +
     +    gpio2: key-mux1 {
    -+        compatible = "gpio-mux-input";
    ++        compatible = "gpio-cascade";
     +        mux-controls = <&mux>;
     +
     +        gpio-controller;
     +        #gpio-cells = <2>;
     +
    -+        // GPIOs used by this node, mux pin
    -+        pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
    ++        // GPIOs used by this node, upstream pin
    ++        upstream-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
     +    };
     +
     +    gpio3: key-mux2 {
    -+        compatible = "gpio-mux-input";
    ++        compatible = "gpio-cascade";
     +        mux-controls = <&mux>;
     +
     +        gpio-controller;
     +        #gpio-cells = <2>;
     +
    -+        // GPIOs used by this node, mux pin
    -+        pin-gpios = <&gpio 14 GPIO_ACTIVE_HIGH>;
    ++        // GPIOs used by this node, upstream pin
    ++        upstream-gpios = <&gpio 14 GPIO_ACTIVE_HIGH>;
     +    };
     +
     +...
2:  782e009ba54b ! 2:  d1063611d6ac gpio: gpio-mux-input: add generic gpio input multiplexer
    @@ Metadata
     Author: Mauri Sandberg <maukka@ext.kapsi.fi>
     
      ## Commit message ##
    -    gpio: gpio-mux-input: add generic gpio input multiplexer
    +    gpio: gpio-cascade: add generic GPIO cascade
     
    -    Adds support for a generic GPIO multiplexer. To drive the multiplexer a
    -    mux-controller is needed. The output pin of the multiplexer is a GPIO
    -    pin.
    +    Adds support for a building cascades of GPIO lines. That is, it allows
    +    setups when there is one upstream line and multiple cascaded lines, out
    +    of which one can be chosen at a time. The status of the upstream line
    +    can be conveyd to the selected cascaded line or, vice versa, the status
    +    of the cascaded line can be conveyed to the upstream line.
    +
    +    A gpio-mux is being used to select, which cascaded GPIO line is being
    +    used at any given time.
    +
    +    At the moment only input direction is supported. In future it should be
    +    possible to add support for output direction, too.
     
    -    Reported-by: kernel test robot <lkp@intel.com>
         Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
    -    Tested-by: Drew Fustini <drew@beagleboard.org>
    -    Reviewed-by: Drew Fustini <drew@beagleboard.org>
         ---
    +    v4 -> v5:
    +     - renamed gpio-mux-input -> gpio-cascade. refactored code accordingly
    +       here and there and changed to use new bindings and compatible string
    +       - ambigious and vague 'pin' was rename to 'upstream_line'
    +     - dropped Tested-by and Reviewed-by due to changes in bindings
    +     - dropped Reported-by suggested by an automatic bot as it was not really
    +       appropriate to begin with
    +     - functionally it's the same as v4
         v3 -> v4:
          - Changed author email
          - Included Tested-by and Reviewed-by from Drew
    @@ drivers/gpio/Kconfig: config GPIO_MOCKUP
      
     +comment "Other GPIO expanders"
     +
    -+config GPIO_MUX_INPUT
    -+	tristate "General GPIO input multiplexer"
    ++config GPIO_CASCADE
    ++	tristate "General GPIO cascade"
     +	depends on OF_GPIO
     +	select MULTIPLEXER
     +	select MUX_GPIO
     +	help
    -+	  Say yes here to enable support for generic GPIO input multiplexer.
    ++	  Say yes here to enable support for generic GPIO cascade.
     +
    -+	  This driver uses a mux-controller to drive the multiplexer and has a
    -+	  single output pin for reading the inputs to the mux. The driver can
    -+	  be used in situations when GPIO pins are used to select what
    -+	  multiplexer pin should be used for reading input and the output pin
    -+	  of the multiplexer is connected to a GPIO input pin.
    ++	  This allows building one-to-many cascades of GPIO lines using
    ++	  different types of multiplexers readily available. At the
    ++	  moment only input lines are supported.
     +
      endif
     
      ## drivers/gpio/Makefile ##
    -@@ drivers/gpio/Makefile: obj-$(CONFIG_GPIO_MPC5200)		+= gpio-mpc5200.o
    - obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
    - obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
    - obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
    -+obj-$(CONFIG_GPIO_MUX_INPUT)		+= gpio-mux-input.o
    - obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
    - obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
    - obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
    +@@ drivers/gpio/Makefile: obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
    + obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
    + obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
    + obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
    ++obj-$(CONFIG_GPIO_CASCADE)		+= gpio-cascade.o
    + obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
    + obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
    + obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
     
    - ## drivers/gpio/gpio-mux-input.c (new) ##
    + ## drivers/gpio/gpio-cascade.c (new) ##
     @@
     +// SPDX-License-Identifier: GPL-2.0-only
     +/*
    -+ *  A generic GPIO input multiplexer driver
    ++ *  A generic GPIO cascade driver
     + *
     + *  Copyright (C) 2021 Mauri Sandberg <maukka@ext.kapsi.fi>
     + *
    ++ * This allows building cascades of GPIO lines in a manner illustrated
    ++ * below:
    ++ *
    ++ *                 /|---- Cascaded GPIO line 0
    ++ *  Upstream      | |---- Cascaded GPIO line 1
    ++ *  GPIO line ----+ | .
    ++ *                | | .
    ++ *                 \|---- Cascaded GPIO line n
    ++ *
    ++ * A gpio-mux is being used to select, which cascaded line is being
    ++ * addressed at any given time.
    ++ *
    ++ * At the moment only input mode is supported due to lack of means for
    ++ * testing output functionality. At least theoretically output should be
    ++ * possible with an open drain constructions.
     + */
     +
     +#include <linux/module.h>
    @@ drivers/gpio/gpio-mux-input.c (new)
     +#include <linux/platform_device.h>
     +#include <linux/mux/consumer.h>
     +
    -+struct gpio_mux_input {
    ++struct gpio_cascade {
     +	struct device		*parent;
     +	struct gpio_chip	gpio_chip;
     +	struct mux_control	*mux_control;
    -+	struct gpio_desc	*mux_pin;
    ++	struct gpio_desc	*upstream_line;
     +};
     +
    -+static struct gpio_mux_input *gpio_to_mux(struct gpio_chip *gc)
    ++static struct gpio_cascade *chip_to_cascade(struct gpio_chip *gc)
     +{
    -+	return container_of(gc, struct gpio_mux_input, gpio_chip);
    ++	return container_of(gc, struct gpio_cascade, gpio_chip);
     +}
     +
    -+static int gpio_mux_input_get_direction(struct gpio_chip *gc,
    ++static int gpio_cascade_get_direction(struct gpio_chip *gc,
     +					unsigned int offset)
     +{
     +	return GPIO_LINE_DIRECTION_IN;
     +}
     +
    -+static int gpio_mux_input_get_value(struct gpio_chip *gc, unsigned int offset)
    ++static int gpio_cascade_get_value(struct gpio_chip *gc, unsigned int offset)
     +{
    -+	struct gpio_mux_input *mux;
    ++	struct gpio_cascade *cas;
     +	int ret;
     +
    -+	mux = gpio_to_mux(gc);
    -+	ret = mux_control_select(mux->mux_control, offset);
    ++	cas = chip_to_cascade(gc);
    ++	ret = mux_control_select(cas->mux_control, offset);
     +	if (ret)
     +		return ret;
     +
    -+	ret = gpiod_get_value(mux->mux_pin);
    -+	mux_control_deselect(mux->mux_control);
    ++	ret = gpiod_get_value(cas->upstream_line);
    ++	mux_control_deselect(cas->mux_control);
     +	return ret;
     +}
     +
    -+static int gpio_mux_input_probe(struct platform_device *pdev)
    ++static int gpio_cascade_probe(struct platform_device *pdev)
     +{
     +	struct device_node *np = pdev->dev.of_node;
     +	struct device *dev = &pdev->dev;
    -+	struct gpio_mux_input *mux;
    ++	struct gpio_cascade *cas;
     +	struct mux_control *mc;
    -+	struct gpio_desc *pin;
    ++	struct gpio_desc *upstream;
     +	struct gpio_chip *gc;
     +	int err;
     +
    -+	mux = devm_kzalloc(dev, sizeof(struct gpio_mux_input), GFP_KERNEL);
    -+	if (mux == NULL)
    ++	cas = devm_kzalloc(dev, sizeof(struct gpio_cascade), GFP_KERNEL);
    ++	if (cas == NULL)
     +		return -ENOMEM;
     +
     +	mc = devm_mux_control_get(dev, NULL);
    @@ drivers/gpio/gpio-mux-input.c (new)
     +		return err;
     +	}
     +
    -+	mux->mux_control = mc;
    -+	pin = devm_gpiod_get(dev, "pin",  GPIOD_IN);
    -+	if (IS_ERR(pin)) {
    -+		err = (int) PTR_ERR(pin);
    -+		dev_err(dev, "unable to claim output pin: %d\n", err);
    ++	cas->mux_control = mc;
    ++	upstream = devm_gpiod_get(dev, "upstream",  GPIOD_IN);
    ++	if (IS_ERR(upstream)) {
    ++		err = (int) PTR_ERR(upstream);
    ++		dev_err(dev, "unable to claim upstream GPIO line: %d\n", err);
     +		return err;
     +	}
     +
    -+	mux->mux_pin = pin;
    -+	mux->parent = dev;
    ++	cas->upstream_line = upstream;
    ++	cas->parent = dev;
     +
    -+	gc = &mux->gpio_chip;
    -+	gc->get = gpio_mux_input_get_value;
    -+	gc->get_direction = gpio_mux_input_get_direction;
    ++	gc = &cas->gpio_chip;
    ++	gc->get = gpio_cascade_get_value;
    ++	gc->get_direction = gpio_cascade_get_direction;
     +
     +	gc->base = -1;
     +	gc->ngpio = mux_control_states(mc);
    -+	gc->label = dev_name(mux->parent);
    -+	gc->parent = mux->parent;
    ++	gc->label = dev_name(cas->parent);
    ++	gc->parent = cas->parent;
     +	gc->owner = THIS_MODULE;
     +	gc->of_node = np;
     +
    -+	err = gpiochip_add(&mux->gpio_chip);
    ++	err = gpiochip_add(&cas->gpio_chip);
     +	if (err) {
     +		dev_err(dev, "unable to add gpio chip, err=%d\n", err);
     +		return err;
     +	}
     +
    -+	platform_set_drvdata(pdev, mux);
    -+	dev_info(dev, "registered %u input GPIOs\n", gc->ngpio);
    ++	platform_set_drvdata(pdev, cas);
    ++	dev_info(dev, "registered %u cascaded GPIO lines\n", gc->ngpio);
     +	return 0;
     +}
     +
    -+static const struct of_device_id gpio_mux_input_id[] = {
    ++static const struct of_device_id gpio_cascade_id[] = {
     +	{
    -+		.compatible = "gpio-mux-input",
    ++		.compatible = "gpio-cascade",
     +		.data = NULL,
     +	},
     +	{ /* sentinel */ }
     +};
    -+MODULE_DEVICE_TABLE(of, gpio_mux_input_id);
    ++MODULE_DEVICE_TABLE(of, gpio_cascade_id);
     +
    -+static struct platform_driver gpio_mux_input_driver = {
    ++static struct platform_driver gpio_cascade_driver = {
     +	.driver	= {
    -+		.name		= "gpio-mux-input",
    -+		.of_match_table = gpio_mux_input_id,
    ++		.name		= "gpio-cascade",
    ++		.of_match_table = gpio_cascade_id,
     +	},
    -+	.probe	= gpio_mux_input_probe,
    ++	.probe	= gpio_cascade_probe,
     +};
    -+module_platform_driver(gpio_mux_input_driver);
    ++module_platform_driver(gpio_cascade_driver);
     +
     +MODULE_AUTHOR("Mauri Sandberg <maukka@ext.kapsi.fi>");
    -+MODULE_DESCRIPTION("Generic GPIO input multiplexer");
    ++MODULE_DESCRIPTION("Generic GPIO cascade");
     +MODULE_LICENSE("GPL");

Mauri Sandberg (2):
  dt-bindings: gpio-cascade: add documentation
  gpio: gpio-cascade: add generic GPIO cascade

 .../bindings/gpio/gpio-cascade.yaml           | 103 +++++++++++++
 drivers/gpio/Kconfig                          |  14 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-cascade.c                   | 139 ++++++++++++++++++
 4 files changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cascade.yaml
 create mode 100644 drivers/gpio/gpio-cascade.c


base-commit: 6d49b3a0f351925b5ea5047166c112b7590b918a
-- 
2.25.1

