Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55C534D203
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 16:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhC2OA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 10:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbhC2OAX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 10:00:23 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C45C061574
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 07:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=vcbTqteJ81mRxHNHg6AsWMGlatiRt0pAV4oqBQ3co3c=; b=dUsMk44bek1MnPlQD1t7jJUwXu
        k4Jyir3zt6e/frAYt9zKBKgjJOXYeEBZSZgFctN+iB1cKqmcUgRDcXLeMopnV96DU3ySewmow5WhC
        bOMPyAmgC8vW48syHQFc4XAQCHAfT1FiCzGtTsm/I5eBp6mQ8kcMfd2iwsOLJ3Uz4MNySnGu0bHRR
        tVVpIXj8xMBc2EUZpCLNTr21b5w8tjWFODXS5QaZ29UfG/WRJXeCdF1l/uHXMmCDRSgbh0+dQFJ4/
        BNdFn8gE5lOP0LaD5nU6GK69Poboxfze2t14WKqZ84RMfrGSVvOEcMoC1YqpX6LHhfnzkAcXBDo98
        Q9LqONbQ==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lQsRF-0006SJ-Fo; Mon, 29 Mar 2021 17:00:18 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 29 Mar 2021 17:00:12 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, drew@beagleboard.org
Subject: [RFC v2 0/2] gpio: add generic gpio input multiplexer
Date:   Mon, 29 Mar 2021 16:57:27 +0300
Message-Id: <20210329135729.10523-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v2:
 - removed .owner from platform_driver as per test bot's instruction
 - added MODULE_AUTHOR, MODULE_DESCRIPTION, MODULE_LICENSE
 - added gpio_mux_input_get_direction as it's recommended for all chips
 - removed because this is input only chip:
     gpio_mux_input_set_value
 - removed because they are not needed for input/output only chips:
     gpio_mux_input_direction_input
     gpio_mux_input_direction_output
 - fixed typo in an error message
 - added info message about successful registration
 - removed can_sleep flag as this does not sleep while getting GPIO value
   like I2C or SPI do
 - added a little bit more text in the binding documenation
 - Updated description in Kconfig

rangediff v1...v2
1:  addd7422268e ! 1:  37eef51e67be dt-bindings: gpio-mux-input: add documentation
    @@ Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml (new)
     +$id: http://devicetree.org/schemas/gpio/gpio-mux-input.yaml#
     +$schema: http://devicetree.org/meta-schemas/core.yaml#
     +
    -+title: GPIO input multiplexer
    ++title: Generic GPIO input multiplexer
     +
     +maintainers:
     +  - Mauri Sandberg <sandberg@mailfence.com>
    @@ Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml (new)
     +description: |
     +  A generic GPIO based input multiplexer
     +
    -+  This driver uses mux-controller to drive the multiplexer.
    ++  This driver uses a mux-controller to drive the multiplexer and has a single
    ++  output pin for reading the inputs to the mux.
     +
    -+  For consumer use see gpio.txt.
    ++  For GPIO consumer documentation see gpio.txt.
     +
     +properties:
     +  compatible:
    @@ Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml (new)
     +
     +  pin-gpios:
     +    description: |
    -+      The GPIO pin used the output from the multiplexer
    ++      The GPIO pin used as the output from the multiplexer
     +
     +required:
     +  - compatible
    @@ Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml (new)
     +        #gpio-cells = <2>;
     +
     +        // GPIOs used by this node, mux output pin
    -+        pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;	/* 1y */
    ++        pin-gpios = <&gpio 12 GPIO_ACTIVE_HIGH>;
     +    };
     +
     +...
2:  067ac01b2ce6 ! 2:  01e497d16a25 gpio: gpio-mux-input: add generic gpio input multiplexer
    @@ Metadata
      ## Commit message ##
         gpio: gpio-mux-input: add generic gpio input multiplexer
     
    -    Suppport for a general GPIO multiplexer. To drive the multiplexer a
    +    Adds support for a generic GPIO multiplexer. To drive the multiplexer a
         mux-controller is needed. The output pin of the multiplexer is a GPIO
         pin.
     
    +    Reported-by: kernel test robot <lkp@intel.com>
         Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
     
      ## drivers/gpio/Kconfig ##
    @@ drivers/gpio/Kconfig: config GPIO_SIM
     +
     +config GPIO_MUX_INPUT
     +	tristate "General GPIO input multiplexer"
    ++	depends on OF_GPIO
     +	select MULTIPLEXER
     +	select MUX_GPIO
    -+	depends on OF_GPIO
     +	help
    -+	  Say yes here to enable support for generic GPIO input multiplexer. This
    -+	  needs a multiplexer controller to drive the select pins.
    ++	  Say yes here to enable support for generic GPIO input multiplexer.
    ++
    ++  	  This driver uses a mux-controller to drive the multiplexer and has a
    ++  	  single output pin for reading the inputs to the mux.
     +
      endif
     
    @@ drivers/gpio/gpio-mux-input.c (new)
     +	return container_of(gc, struct gpio_mux_input, gpio_chip);
     +}
     +
    -+static int gpio_mux_input_direction_input(struct gpio_chip *gc,
    -+				       unsigned int offset)
    -+{
    -+	return 0;
    -+}
    -+
    -+static int gpio_mux_input_direction_output(struct gpio_chip *gc,
    -+					unsigned int offset, int val)
    ++static int gpio_mux_input_get_direction(struct gpio_chip *gc,
    ++					unsigned int offset)
     +{
    -+	return -EINVAL;
    ++	return GPIO_LINE_DIRECTION_IN;
     +}
     +
     +static int gpio_mux_input_get_value(struct gpio_chip *gc, unsigned int offset)
    @@ drivers/gpio/gpio-mux-input.c (new)
     +	return ret;
     +}
     +
    -+static void gpio_mux_input_set_value(struct gpio_chip *gc,
    -+				  unsigned int offset, int val)
    -+{
    -+	/* not supported */
    -+}
    -+
     +static int gpio_mux_input_probe(struct platform_device *pdev)
     +{
     +	struct device_node *np = pdev->dev.of_node;
    @@ drivers/gpio/gpio-mux-input.c (new)
     +	pin = gpiod_get(&pdev->dev, "pin",  GPIOD_IN);
     +	if (IS_ERR(pin)) {
     +		err = (int) PTR_ERR(pin);
    -+		dev_err(&pdev->dev, "unable to claim pin GPIOs: %d\n", err);
    ++		dev_err(&pdev->dev, "unable to claim pin GPIO: %d\n", err);
     +		goto err_free_mc;
     +	}
     +
    @@ drivers/gpio/gpio-mux-input.c (new)
     +	mux->parent = &pdev->dev;
     +
     +	gc = &mux->gpio_chip;
    -+	gc->direction_input  = gpio_mux_input_direction_input;
    -+	gc->direction_output = gpio_mux_input_direction_output;
     +	gc->get = gpio_mux_input_get_value;
    -+	gc->set = gpio_mux_input_set_value;
    -+	gc->can_sleep = 1;
    ++	gc->get_direction = gpio_mux_input_get_direction;
     +
     +	gc->base = -1;
     +	gc->ngpio = mux_control_states(mc);
    @@ drivers/gpio/gpio-mux-input.c (new)
     +	}
     +
     +	platform_set_drvdata(pdev, mux);
    ++
    ++	dev_info(&pdev->dev, "registered %u input GPIOs\n", gc->ngpio);
    ++
     +	return 0;
     +
     +err_free_pin:
    @@ drivers/gpio/gpio-mux-input.c (new)
     +static struct platform_driver gpio_mux_input_driver = {
     +	.driver	= {
     +		.name		= "gpio-mux-input",
    -+		.owner		= THIS_MODULE,
     +		.of_match_table = gpio_mux_input_id,
     +	},
     +	.probe	= gpio_mux_input_probe,
     +};
     +module_platform_driver(gpio_mux_input_driver);
    ++
    ++MODULE_AUTHOR("Mauri Sandberg <sandberg@mailfence.com>");
    ++MODULE_DESCRIPTION("Generic GPIO input multiplexer");
    ++MODULE_LICENSE("GPL");


Mauri Sandberg (2):
  dt-bindings: gpio-mux-input: add documentation
  gpio: gpio-mux-input: add generic gpio input multiplexer

 .../bindings/gpio/gpio-mux-input.yaml         |  56 ++++++++
 drivers/gpio/Kconfig                          |  13 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-mux-input.c                 | 134 ++++++++++++++++++
 4 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
 create mode 100644 drivers/gpio/gpio-mux-input.c


base-commit: 9d940ab7264574be59ce3a953dc33de9250429eb
-- 
2.25.1

