Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73003D35E7
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 10:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhGWHTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 03:19:06 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47031 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234376AbhGWHTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 03:19:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2FBCA581648;
        Fri, 23 Jul 2021 03:59:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 23 Jul 2021 03:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=SMX8m+YSURBok
        a0Y4s6uw+SSNshgRk1Rz/kH60UznJo=; b=FYtpMWf1LBo9jfhviI6WyCJ+K9ooA
        /wyvKrWsvEoDcXz9UIznr4ZVzNkx9+6TeEDC+IubGhDVNOk654C5rwdRuIVDwq1G
        G/SsFvUSYlF0TKgEWIdUXS8vcal8BTR5Bt5c1iTL3xoDKsQIShGzcxvnTt3xy7Y7
        OjvWGZWtBY/pJJaq/b+8A+d260y8cviyrHqtlBZJv0pnUA8w3rqIFpwpaeF6Y75i
        XBpPjSXUAOWOFNTF48qMOhBZQpbg8kpZBugMFPO1tQsIWu59YfqM8nzXTsvDrpnS
        BKMMeBiTaHBpVq+bPmGH/nfGHiThIixjgZbu6npUGN8yNdTKlwyDssUgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=SMX8m+YSURBoka0Y4s6uw+SSNshgRk1Rz/kH60UznJo=; b=fXjA7rXd
        gkdE7zRkiYYAs9SgGMyvSiCBfl/Z4SaP2gWRWDKOoySUlNmRMXhQdEATW0pJrBas
        Z1un7AYOG5lhEEtkXCzI7JU3RGbUsq6zCpCeora0kiiRTzSohpJ/ngrfZjS4KY7m
        B605ccfFJ7aYGbe7qIeyI9MaMkTYpP53yKcsos+noGsyWuScgnf/KCTxT3ZfGlju
        0ZioXW0+x3COD8x8TtcSPaxbCdTdrLsBBDr+dzNeSwYGa9IWEty5HoX3ZC29L9AR
        6fBuA22ZJ/ha6EVKEy7vVPMP+qs+JPo6gd6xwYpDppofVACNRqhjvCBcx3rRNudy
        jvsyJUHS43QW5w==
X-ME-Sender: <xms:6nb6YDX_T44RzrHe8Q0F-IlJb_kI42RN9Psb6ZkOMrf8TtZl9rOTCg>
    <xme:6nb6YLljK_pLQrPN31w5Dvm5FLnmN07G6qbPlAgdLn__gP1g5LorelEIdXm9FvLKH
    AC5W5vr1uRLDiBVZQ>
X-ME-Received: <xmr:6nb6YPYD_tPmT3dmE7KBkWPwxFYHulYQdhLYoXXkA2wamJ7YeIUScRZ2RSn0rxkvartk4yefr6EBhphvtTjzrA_WXyKHltJWUIzRK_qQXAi3fCT00mUSnvXGeBxdkcC9o9jOkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepvddvuefftdeuhedujedvgffhgfevvd
    ehgedtjeetudeiteekhffhfeejheettdffnecuffhomhgrihhnpehmuhigrdhgrhhouhhp
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
    hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6nb6YOUfYrrXC_8jkpmVGJrEA1ZAtlIrmZmVim-WB40Ei_MKYlBGcA>
    <xmx:6nb6YNkWz71RFQExcZpX3FhO4a11zaNgidv-moxO1q2TiniLLt8K5w>
    <xmx:6nb6YLdMpp7MhI2NPXxPMcQwX5vIXYeCjbDAiy_abcnoEcnG-tNUBw>
    <xmx:6nb6YOgDA4i_qzIR2n1rRnNwXkVHApuo_BqrBtLd_UFp0WGv7ImgAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:34 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/6] leds: pca955x: Use pinctrl to map GPIOs to pins
Date:   Fri, 23 Jul 2021 17:28:56 +0930
Message-Id: <20210723075858.376378-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The leds-pca955x driver currently assumes that the GPIO numberspace and
the pin numberspace are the same. This quickly falls apart with a
devicetree binding such as the following:

	pca0: pca9552@61 {
		compatible = "nxp,pca9552";
		reg = <0x61>;
		#address-cells = <1>;
		#size-cells = <0>;

		gpio-controller;
		#gpio-cells = <2>;

		led@0 {
			reg = <0>;
			type = <PCA955X_TYPE_LED>;
		};

		gpio@1 {
			reg = <1>;
			type = <PCA955X_TYPE_GPIO>;
		};
	};

This results in a gpiochip with 1 gpio at offset 0 that should control a
pin at offset 1 on the pca9552. Instead the accessing GPIO 0 of the
gpiochip attempts to drive pin 0.

Making the GPIO controller cover the entire chip opens up conflicts
between the LED and GPIO controllers for the pins. What's needed is a
mapping between the GPIO numberspace and the pin numberspace, with
mutually exclusive access to each pin for the LED and GPIO controllers.
Broadly, this is the responsibility of the pinctrl and pinmux
subsystems.

Rework the driver to implement pinctrl and pinmux (despite the lack of
actual mux hardware), and back the gpiochip and LED controller on to the
resulting pin controller.

This effort implements a custom devicetree device mapping callback for
pinctrl to parse maps from the existing devicetree binding for the
PCA955x devices. Subnodes that set `type = <PCA955X_TYPE_LED>`
automatically have a mux group map generated for the default state. This
causes probe() to claim the appropriate LED pins for the LED controller
from the pinctroller. If subnodes of `type = <PCA955X_TYPE_GPIO>` are
specified then the gpiochip implements the correct behaviour for what
the binding intended - an appropriate GPIO pin mapping is generated and
applied to the pincontroller for the specified number of pins.

For future PCA955x devicetree nodes, devices that require a mix of LED
and GPIO pins can specify the number and numberspace mappings with the
`ngpios` and `gpio-ranges` properties from generic GPIO binding. Thus
the only subnodes that need to be specified are those for the LEDs.

The result is that we now have an accurate mapping between GPIO and pin
numberspaces with mutually exclusive access to the pins. In addition,
any pin conflict issues can be resolved through the usual debugfs
properties exposed by the pinctrl subsystem.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 478 +++++++++++++++++++++++++++++++-----
 1 file changed, 422 insertions(+), 56 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 6614291b288e..9e08dbb05bc5 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -45,6 +45,8 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -73,6 +75,7 @@ struct pca955x_chipdef {
 	int			bits;
 	u8			slv_addr;	/* 7-bit slave address mask */
 	int			slv_addr_shift;	/* Number of bits to ignore */
+	struct pinctrl_desc	*pinctrl;
 };
 
 struct pca955x {
@@ -80,6 +83,8 @@ struct pca955x {
 	struct pca955x_led *leds;
 	struct pca955x_chipdef	*chipdef;
 	struct i2c_client	*client;
+	struct pinctrl_desc	*pctldesc;
+	struct pinctrl_dev	*pctldev;
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	struct gpio_chip gpio;
 #endif
@@ -253,6 +258,15 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static int
+pca955x_set_pin_value(struct pca955x *pca955x, unsigned int pin, int val)
+{
+	struct led_classdev *cdev = &pca955x->leds[pin].led_cdev;
+	int state = val ? PCA955X_GPIO_HIGH : PCA955X_GPIO_LOW;
+
+	return pca955x_led_set(cdev, state);
+}
+
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 /*
  * Read the INPUT register, which contains the state of LEDs.
@@ -271,64 +285,348 @@ static int pca955x_read_input(struct i2c_client *client, int n, u8 *val)
 
 }
 
-static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
+static void
+pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
+	int pin;
 
-	if (led->type == PCA955X_TYPE_GPIO)
-		return 0;
+	pin = pinctrl_gpio_as_pin(pca955x->pctldev, gc->base + offset);
+	if (pin < 0) {
+		dev_err(gc->parent, "Failed to look up pin for GPIO %d\n",
+			offset);
+		return;
+	}
 
-	return -EBUSY;
-}
-
-static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
-			     int val)
-{
-	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
-
-	if (val)
-		return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_HIGH);
-
-	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_LOW);
-}
-
-static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				   int val)
-{
-	pca955x_set_value(gc, offset, val);
+	pca955x_set_pin_value(pca955x, pin, val);
 }
 
 static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
 	u8 reg = 0;
+	int pin;
+
+	pin = pinctrl_gpio_as_pin(pca955x->pctldev, gc->base + offset);
+	if (pin < 0)
+		return pin;
 
 	/* There is nothing we can do about errors */
-	pca955x_read_input(pca955x->client, led->led_num / 8, &reg);
+	pca955x_read_input(pca955x->client, pin / 8, &reg);
 
-	return !!(reg & (1 << (led->led_num % 8)));
+	return !!(reg & (1 << (pin % 8)));
 }
 
-static int pca955x_gpio_direction_input(struct gpio_chip *gc,
-					unsigned int offset)
+static int
+pca955x_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
+	struct led_classdev *cdev;
+	int pin;
 
-	/* To use as input ensure pin is not driven. */
-	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_INPUT);
+	pin = pinctrl_gpio_as_pin(pca955x->pctldev, gc->base + offset);
+	if (pin < 0)
+		return pin;
+
+	cdev = &pca955x->leds[pin].led_cdev;
+
+	return pca955x_led_set(cdev, PCA955X_GPIO_INPUT);
 }
 
-static int pca955x_gpio_direction_output(struct gpio_chip *gc,
-					 unsigned int offset, int val)
+static int
+pca955x_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
+			      int val)
 {
-	return pca955x_set_value(gc, offset, val);
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	int pin;
+
+	pin = pinctrl_gpio_as_pin(pca955x->pctldev, gc->base + offset);
+	if (pin < 0)
+		return pin;
+
+	return pca955x_set_pin_value(pca955x, pin, val);
+}
+
+static int
+pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
+{
+	return pinctrl_gpio_request(gc->base + offset);
+}
+
+static void
+pca955x_gpio_free_pin(struct gpio_chip *gc, unsigned int offset)
+{
+	int rc;
+
+	/* Go high-impedance */
+	rc = pca955x_gpio_direction_input(gc, offset);
+	if (rc < 0)
+		dev_err(gc->parent, "Failed to set direction for GPIO %u:%u\n", gc->base, offset);
+
+	pinctrl_gpio_free(gc->base + offset);
 }
 #endif /* CONFIG_LEDS_PCA955X_GPIO */
 
+static const struct pinctrl_pin_desc pca9552_pinctrl_pins[] = {
+	PINCTRL_PIN(0, "LED0"),
+	PINCTRL_PIN(1, "LED1"),
+	PINCTRL_PIN(2, "LED2"),
+	PINCTRL_PIN(3, "LED3"),
+	PINCTRL_PIN(4, "LED4"),
+	PINCTRL_PIN(5, "LED5"),
+	PINCTRL_PIN(6, "LED6"),
+	PINCTRL_PIN(7, "LED7"),
+	PINCTRL_PIN(8, "LED8"),
+	PINCTRL_PIN(9, "LED9"),
+	PINCTRL_PIN(10, "LED10"),
+	PINCTRL_PIN(11, "LED11"),
+	PINCTRL_PIN(12, "LED12"),
+	PINCTRL_PIN(13, "LED13"),
+	PINCTRL_PIN(14, "LED14"),
+	PINCTRL_PIN(15, "LED15"),
+};
+
+static const char * const pca9552_groups[] = {
+	"LED0", "LED1", "LED2",  "LED3",  "LED4",  "LED5",  "LED6",  "LED7",
+	"LED8", "LED9", "LED10", "LED11", "LED12", "LED13", "LED14", "LED15",
+};
+
+static const unsigned int pca9552_group_pins[] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
+};
+
+static const char *pca955x_pinctrl_dev_name(struct pca955x *pca955x)
+{
+	/* The controller is its only consumer via leds and gpios */
+	return dev_name(&pca955x->client->dev);
+}
+
+static int pca955x_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct pca955x *pca955x = pinctrl_dev_get_drvdata(pctldev);
+
+	/* We have as many groups as we have LEDs */
+	return pca955x->chipdef->bits;
+}
+
+static const char *
+pca955x_pinctrl_get_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	struct pca955x *pca955x = pinctrl_dev_get_drvdata(pctldev);
+
+	if (unlikely(selector > pca955x->chipdef->bits)) {
+		dev_err(&pca955x->client->dev,
+			"Group selector (%u) exceeds groups count (%u)\n",
+			selector, pca955x->chipdef->bits);
+		return NULL;
+	}
+
+	if (unlikely(selector > ARRAY_SIZE(pca9552_groups))) {
+		dev_err(&pca955x->client->dev,
+			"Group selector (%u) exceeds the supported group count (%u)\n",
+			selector, ARRAY_SIZE(pca9552_groups));
+		return NULL;
+	}
+
+	return pca9552_groups[selector];
+}
+
+static int
+pca955x_pinctrl_get_group_pins(struct pinctrl_dev *pctldev, unsigned int  selector,
+			       const unsigned int **pins, unsigned int *num_pins)
+{
+	struct pca955x *pca955x = pinctrl_dev_get_drvdata(pctldev);
+
+	if (unlikely(selector > pca955x->chipdef->bits)) {
+		dev_err(&pca955x->client->dev,
+			"Group selector (%u) exceeds groups count (%u)\n",
+			selector, pca955x->chipdef->bits);
+		return -EINVAL;
+	}
+
+	if (unlikely(selector > ARRAY_SIZE(pca9552_group_pins))) {
+		dev_err(&pca955x->client->dev,
+			"Group selector (%u) exceeds the supported group count (%u)\n",
+			selector, ARRAY_SIZE(pca9552_groups));
+		return -EINVAL;
+	}
+
+	*pins = &pca9552_group_pins[selector];
+	*num_pins = 1;
+
+	return 0;
+}
+
+static int pca955x_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return 1;
+}
+
+static const char *
+pca955x_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	struct pca955x *pca955x = pinctrl_dev_get_drvdata(pctldev);
+
+	if (selector != 0)
+		dev_err(&pca955x->client->dev, "Only the 'LED' function is supported");
+
+	return "LED";
+}
+
+static int pca955x_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
+					      unsigned int selector,
+					      const char * const **groups,
+					      unsigned int *num_groups)
+{
+	struct pca955x *pca955x = pinctrl_dev_get_drvdata(pctldev);
+
+	if (unlikely(pca955x->chipdef->bits > ARRAY_SIZE(pca9552_groups))) {
+		dev_warn(&pca955x->client->dev,
+			 "Unsupported PCA955x configuration, LED count exceed LED group count\n");
+		return -EINVAL;
+	}
+
+	if (selector != 0)
+		dev_err(&pca955x->client->dev, "Only the 'LED' function is supported");
+
+	*groups = &pca9552_groups[0];
+	*num_groups = pca955x->chipdef->bits;
+
+	return 0;
+}
+
+static int
+pca955x_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
+		       unsigned int group_selector)
+{
+	/* There's no actual mux as such. */
+	return 0;
+}
+
+/*
+ * Implement pinctrl map parsing in a way that's backwards compatible with the
+ * existing devicetree binding.
+ */
+static int
+pca955x_dt_dev_to_map(struct pinctrl_dev *pctldev, struct device *dev)
+{
+	struct pca955x *pca955x = pinctrl_dev_get_drvdata(pctldev);
+	struct pinctrl_desc *pctldesc = pca955x->pctldesc;
+	struct fwnode_handle *child;
+	struct pinctrl_map *maps;
+	unsigned int i = 0;
+	int rc;
+
+	if (WARN_ON(dev != &pca955x->client->dev))
+		return -EINVAL;
+
+	/* Only 1 possible mux config per LED, no further allocations needed */
+	maps = devm_kmalloc_array(dev, pca955x->chipdef->bits, sizeof(*maps), GFP_KERNEL);
+	if (!maps)
+		return -ENOMEM;
+
+	device_for_each_child_node(dev, child) {
+		struct pinctrl_map *m;
+		u32 type;
+		u32 reg;
+
+		/* Default to PCA955X_TYPE_LED as we do in pca955x_get_pdata */
+		rc = fwnode_property_read_u32(child, "type", &type);
+		if (rc == -EINVAL)
+			type = PCA955X_TYPE_LED;
+		else if (rc < 0)
+			goto cleanup_maps;
+
+		if (type != PCA955X_TYPE_LED)
+			continue;
+
+		rc = fwnode_property_read_u32(child, "reg", &reg);
+		if (rc < 0)
+			goto cleanup_maps;
+
+		if (i >= pca955x->chipdef->bits) {
+			dev_err(dev,
+				"The number of pin configuration nodes exceeds the number of available pins (%u)\n",
+				pca955x->chipdef->bits);
+			break;
+		}
+
+		m = &maps[i];
+
+		m->dev_name = pctldesc->name;
+		m->name = PINCTRL_STATE_DEFAULT;
+		m->type = PIN_MAP_TYPE_MUX_GROUP;
+		m->ctrl_dev_name = pctldesc->name;
+		m->data.mux.function = "LED";
+		m->data.mux.group = devm_kasprintf(dev, GFP_KERNEL, "LED%d", reg);
+		if (!m->data.mux.group) {
+			rc = -ENOMEM;
+			goto cleanup_maps;
+		}
+
+		i++;
+	}
+
+	/* Trim the map allocation as required */
+	if (i < pca955x->chipdef->bits) {
+		struct pinctrl_map *trimmed;
+
+		trimmed = devm_krealloc(dev, maps, i * sizeof(*maps), GFP_KERNEL);
+		if (trimmed)
+			maps = trimmed;
+		else
+			dev_warn(dev, "Failed to trim pinctrl maps\n");
+	}
+
+	pinctrl_register_mappings(maps, i);
+
+	return 0;
+
+cleanup_maps:
+	while (i--)
+		devm_kfree(dev, maps[i].data.mux.group);
+
+	devm_kfree(dev, maps);
+
+	return rc;
+}
+
+static void
+pca955x_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
+		    unsigned int num_maps)
+{
+	struct pca955x *pca955x = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = &pca955x->client->dev;
+	struct pinctrl_map *iter = map;
+
+	if (!iter)
+		return;
+
+	while (num_maps) {
+		devm_kfree(dev, iter->data.mux.group);
+		iter++;
+		num_maps--;
+	}
+
+	devm_kfree(dev, map);
+}
+
+static const struct pinctrl_ops pca955x_pinctrl_ops = {
+	.get_groups_count	= pca955x_pinctrl_get_groups_count,
+	.get_group_name		= pca955x_pinctrl_get_group_name,
+	.get_group_pins		= pca955x_pinctrl_get_group_pins,
+	.dt_dev_to_map		= pca955x_dt_dev_to_map,
+	.dt_free_map		= pca955x_dt_free_map,
+};
+
+static const struct pinmux_ops pca955x_pinmux_ops = {
+	.get_functions_count	= pca955x_pinmux_get_functions_count,
+	.get_function_name	= pca955x_pinmux_get_function_name,
+	.get_function_groups	= pca955x_pinmux_get_function_groups,
+	.set_mux		= pca955x_pinmux_set_mux,
+	.strict = true,
+};
+
 static struct pca955x_platform_data *
 pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 {
@@ -434,7 +732,12 @@ static int pca955x_probe(struct i2c_client *client,
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
-	int ngpios = 0;
+	u32 ngpios = 0;
+	struct fwnode_handle *fwnode;
+
+	fwnode = dev_fwnode(&client->dev);
+	if (!fwnode)
+		return -ENODATA;
 
 	chip = &pca955x_chipdefs[id->driver_data];
 	adapter = client->adapter;
@@ -476,12 +779,35 @@ static int pca955x_probe(struct i2c_client *client,
 	if (!pca955x->leds)
 		return -ENOMEM;
 
+	pca955x->pctldesc = devm_kzalloc(&client->dev,
+			sizeof(*pca955x->pctldesc), GFP_KERNEL);
+	if (!pca955x->pctldesc)
+		return -ENOMEM;
+
 	i2c_set_clientdata(client, pca955x);
 
 	mutex_init(&pca955x->lock);
 	pca955x->client = client;
 	pca955x->chipdef = chip;
 
+	/* pinctrl */
+	pca955x->pctldesc->name = pca955x_pinctrl_dev_name(pca955x);
+	if (!pca955x->pctldesc->name)
+		return -ENOMEM;
+
+	pca955x->pctldesc->pins = &pca9552_pinctrl_pins[0];
+	pca955x->pctldesc->npins = chip->bits;
+	pca955x->pctldesc->pctlops = &pca955x_pinctrl_ops;
+	pca955x->pctldesc->pmxops = &pca955x_pinmux_ops;
+	pca955x->pctldesc->owner = THIS_MODULE;
+
+	err = devm_pinctrl_register_and_init(&client->dev, pca955x->pctldesc,
+					     pca955x, &pca955x->pctldev);
+	if (err) {
+		dev_err(&client->dev, "Failed to register pincontroller: %d\n", err);
+		return err;
+	}
+
 	for (i = 0; i < chip->bits; i++) {
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
@@ -527,6 +853,12 @@ static int pca955x_probe(struct i2c_client *client,
 		}
 	}
 
+	err = pinctrl_enable(pca955x->pctldev);
+	if (err) {
+		dev_err(&client->dev, "Failed to enable pincontroller: %d\n", err);
+		return err;
+	}
+
 	/* PWM0 is used for half brightness or 50% duty cycle */
 	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
 	if (err)
@@ -546,30 +878,64 @@ static int pca955x_probe(struct i2c_client *client,
 		return err;
 
 #ifdef CONFIG_LEDS_PCA955X_GPIO
-	if (ngpios) {
-		pca955x->gpio.label = "gpio-pca955x";
-		pca955x->gpio.direction_input = pca955x_gpio_direction_input;
-		pca955x->gpio.direction_output = pca955x_gpio_direction_output;
-		pca955x->gpio.set = pca955x_gpio_set_value;
-		pca955x->gpio.get = pca955x_gpio_get_value;
-		pca955x->gpio.request = pca955x_gpio_request_pin;
-		pca955x->gpio.can_sleep = 1;
-		pca955x->gpio.base = -1;
-		pca955x->gpio.ngpio = ngpios;
-		pca955x->gpio.parent = &client->dev;
-		pca955x->gpio.owner = THIS_MODULE;
+	/* Always register the gpiochip, no-longer conditional on ngpios */
+	pca955x->gpio.label = "gpio-pca955x";
+	pca955x->gpio.direction_input = pca955x_gpio_direction_input;
+	pca955x->gpio.direction_output = pca955x_gpio_direction_output;
+	pca955x->gpio.set = pca955x_gpio_set_value;
+	pca955x->gpio.get = pca955x_gpio_get_value;
+	pca955x->gpio.request = pca955x_gpio_request_pin;
+	pca955x->gpio.free = pca955x_gpio_free_pin;
+	pca955x->gpio.can_sleep = 1;
+	pca955x->gpio.base = -1;
+	pca955x->gpio.parent = &client->dev;
+	pca955x->gpio.owner = THIS_MODULE;
 
-		err = devm_gpiochip_add_data(&client->dev, &pca955x->gpio,
-					     pca955x);
-		if (err) {
-			/* Use data->gpio.dev as a flag for freeing gpiochip */
-			pca955x->gpio.parent = NULL;
-			dev_warn(&client->dev, "could not add gpiochip\n");
+	if (!ngpios) {
+		err = fwnode_property_read_u32(fwnode, "ngpios", &ngpios);
+		if (err < 0 && err != -EINVAL)
 			return err;
+	}
+
+	if (!ngpios)
+		ngpios = chip->bits;
+
+
+	pca955x->gpio.ngpio = ngpios;
+
+	err = devm_gpiochip_add_data(&client->dev, &pca955x->gpio, pca955x);
+	if (err) {
+		/* Use data->gpio.dev as a flag for freeing gpiochip */
+		pca955x->gpio.parent = NULL;
+		dev_warn(&client->dev, "could not add gpiochip\n");
+		return err;
+	}
+
+	if (!device_property_present(&client->dev, "gpio-ranges")) {
+		struct fwnode_handle *child;
+		unsigned int i = 0;
+
+		device_for_each_child_node(&client->dev, child) {
+			u32 type;
+			u32 reg;
+
+			err = fwnode_property_read_u32(child, "reg", &reg);
+			if (err < 0)
+				return err;
+
+			err = fwnode_property_read_u32(child, "type", &type);
+			if (err < 0)
+				continue;
+
+			/* XXX: Do something less wasteful? */
+			err = gpiochip_add_pin_range(&pca955x->gpio,
+					pca955x_pinctrl_dev_name(pca955x),
+					i, reg, 1);
+			if (err)
+				return err;
+
+			i++;
 		}
-		dev_info(&client->dev, "gpios %i...%i\n",
-			 pca955x->gpio.base, pca955x->gpio.base +
-			 pca955x->gpio.ngpio - 1);
 	}
 #endif
 
-- 
2.30.2

