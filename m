Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747B3412DF5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 06:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhIUElc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 00:41:32 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:36915 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhIUEl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 00:41:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id BBE642B01431;
        Tue, 21 Sep 2021 00:39:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 21 Sep 2021 00:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=y8C3PeXv/OI/h
        b14OCinqJ4MadEm08z455GpvMLLQAk=; b=HQIp4cj2TvE3yHzH8z2/57wpiR2QB
        Bv/I4J1rQ3ykgvKvk42fVPH+5LxlAhCGiqQFhRYtoTq5S7UTgW/VH1z52/1xf+Ut
        Evs95xT2sEYiDSHHPDi3ZcLiDBq0kBMw5wkDRigMaiN4AmBDDrLQVMDY90T5el0D
        UXSPeYadDS4wcshEPRjIColGIsGC6sb1DHuSZhWx/+VreZF2SmBoUOD58Ur1a3bd
        myhhVKGPimJ8WwDbWHs416JRTM0IvGDqA/aa2wW5DtY5x6ldCFFhpKZZcLzxzLqU
        EvEK5W6pt/d4nU+/QJJuJdopb3Zu4qzyOwKk6FSicMo28BNLz61heUxeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=y8C3PeXv/OI/hb14OCinqJ4MadEm08z455GpvMLLQAk=; b=ZnVpgopv
        YJavCbMO57gihqw6gjx0d2fr9JuYFv/B+tksAmdM5qggns3uM24RqRAzf6QsUc5P
        VYUqyOeS6AHbE6NxZ8EfmQVTKi53BuQQUgKfBCDW5W7ZXoYF/iDpyROqP0dYUHUG
        JFlGpQWvRWLjl+NdjYiHx/IUe/HPI611Ouc8xuNDrx1ZNnhcz33ezk6JixcvxzTD
        vTTp8hV3nlD3JCQdbHE7xMSGqfMs3TPeeWBeoJg55QaAura3UGcSJFGm2G0r5UBl
        JE++C0JSlhMngY5NHKP95v4uUALs/xb2uoLQoG4Hv8mQnqsZKtAZlV7kmwULQG/4
        kWR7vzCSYlF9Kg==
X-ME-Sender: <xms:HWJJYUzWQDQUt0F-KKn8wsdiuxjERedgpQuSWDF9hnHIGNTnZX8qpg>
    <xme:HWJJYYSiKT7ZY2bpvhEha0XDUgNBZRd1MGyJVlZegG3HtF7mxZzvSB38dJARYjGD4
    cZ6H6FAhj1WPTNwUg>
X-ME-Received: <xmr:HWJJYWUizSA7ixHK1wpHdVQmq8qnILint_fs6ruyuY0NG3iesMuYZq5a3KbtUgQemBt-dMMOEeJsmm1Fi4LKmQPE1bx7Fo1lCP1OT7roM_dzrLM-IltxqDiGBEjuOqdj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeifedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:HWJJYSjPPdRmRt0WQHQuVvP3E5bdwBvHsLaRTZKiplSeL5e3WvEozw>
    <xmx:HWJJYWDoksui64s819zjmmBfPwSzhu_i0m6LLVPslS2LlnVMHLB1fA>
    <xmx:HWJJYTLNuaPMz8w3Wz8xpBl6BES46XTQXoVlQnSUCIHNeOEp0yRA2Q>
    <xmx:HmJJYa5SBLJJ73GqrRjDaylz-7Pkxe6rXsmJ6t3Pr8PIk245kj77Dezvu2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Sep 2021 00:39:53 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH 1/2] leds: pca955x: Make the gpiochip always expose all pins
Date:   Tue, 21 Sep 2021 14:09:35 +0930
Message-Id: <20210921043936.468001-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921043936.468001-1-andrew@aj.id.au>
References: <20210921043936.468001-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The devicetree binding allows specifying which pins are GPIO vs LED.
Limiting the instantiated gpiochip to just these pins as the driver
currently does requires an arbitrary mapping between pins and GPIOs, but
such a mapping is not implemented by the driver. As a result,
specifying GPIOs in such a way that they don't map 1-to-1 to pin indexes
does not function as expected.

Establishing such a mapping is more complex than not and even if we did,
doing so leads to a slightly hairy userspace experience as the behaviour
of the PCA955x gpiochip would depend on how the pins are assigned in the
devicetree. Instead, always expose all pins via the gpiochip to provide
a stable interface and track which pins are in use.

Specifying a pin as `type = <PCA955X_TYPE_GPIO>;` in the devicetree
becomes a no-op.

I've assessed the impact of this change by looking through all of the
affected devicetrees as of the tag leds-5.15-rc1:

```
$ git grep -l 'pca955[0123]' $(find . -name dts -type d)
arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
```

These are all IBM-associated platforms. I've analysed both the
devicetrees and schematics where necessary to determine whether any
systems hit the hazard of the current broken behaviour. For the most
part, the systems specify the pins as either all LEDs or all GPIOs, or
at least do so in a way such that the broken behaviour isn't exposed.

The main counter-point to this observation is the Everest system whose
devicetree describes a large number of PCA955x devices and in some cases
has pin assignments that hit the hazard. However, there does not seem to
be any use of the affected GPIOs in the userspace associated with
Everest.

Regardless, any use of the hazardous GPIOs in Everest is already broken,
so let's fix the interface and then fix any already broken userspace
with it.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 63 +++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a6b5699aeae4..77c0f461ab95 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -37,6 +37,7 @@
  *  bits the chip supports.
  */
 
+#include <linux/bitops.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -118,6 +119,7 @@ struct pca955x {
 	struct pca955x_led *leds;
 	struct pca955x_chipdef	*chipdef;
 	struct i2c_client	*client;
+	unsigned long active_pins;
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	struct gpio_chip gpio;
 #endif
@@ -360,12 +362,15 @@ static int pca955x_read_input(struct i2c_client *client, int n, u8 *val)
 static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
-	struct pca955x_led *led = &pca955x->leds[offset];
 
-	if (led->type == PCA955X_TYPE_GPIO)
-		return 0;
+	return test_and_set_bit(offset, &pca955x->active_pins) ? -EBUSY : 0;
+}
 
-	return -EBUSY;
+static void pca955x_gpio_free_pin(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+
+	clear_bit(offset, &pca955x->active_pins);
 }
 
 static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
@@ -489,7 +494,6 @@ static int pca955x_probe(struct i2c_client *client)
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
-	int ngpios = 0;
 	bool set_default_label = false;
 	bool keep_pwm = false;
 	char default_label[8];
@@ -567,9 +571,7 @@ static int pca955x_probe(struct i2c_client *client)
 
 		switch (pca955x_led->type) {
 		case PCA955X_TYPE_NONE:
-			break;
 		case PCA955X_TYPE_GPIO:
-			ngpios++;
 			break;
 		case PCA955X_TYPE_LED:
 			led = &pca955x_led->led_cdev;
@@ -613,6 +615,8 @@ static int pca955x_probe(struct i2c_client *client)
 			if (err)
 				return err;
 
+			set_bit(i, &pca955x->active_pins);
+
 			/*
 			 * For default-state == "keep", let the core update the
 			 * brightness from the hardware, then check the
@@ -650,31 +654,30 @@ static int pca955x_probe(struct i2c_client *client)
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
+	pca955x->gpio.label = "gpio-pca955x";
+	pca955x->gpio.direction_input = pca955x_gpio_direction_input;
+	pca955x->gpio.direction_output = pca955x_gpio_direction_output;
+	pca955x->gpio.set = pca955x_gpio_set_value;
+	pca955x->gpio.get = pca955x_gpio_get_value;
+	pca955x->gpio.request = pca955x_gpio_request_pin;
+	pca955x->gpio.free = pca955x_gpio_free_pin;
+	pca955x->gpio.can_sleep = 1;
+	pca955x->gpio.base = -1;
+	pca955x->gpio.ngpio = chip->bits;
+	pca955x->gpio.parent = &client->dev;
+	pca955x->gpio.owner = THIS_MODULE;
 
-		err = devm_gpiochip_add_data(&client->dev, &pca955x->gpio,
-					     pca955x);
-		if (err) {
-			/* Use data->gpio.dev as a flag for freeing gpiochip */
-			pca955x->gpio.parent = NULL;
-			dev_warn(&client->dev, "could not add gpiochip\n");
-			return err;
-		}
-		dev_info(&client->dev, "gpios %i...%i\n",
-			 pca955x->gpio.base, pca955x->gpio.base +
-			 pca955x->gpio.ngpio - 1);
+	err = devm_gpiochip_add_data(&client->dev, &pca955x->gpio,
+				     pca955x);
+	if (err) {
+		/* Use data->gpio.dev as a flag for freeing gpiochip */
+		pca955x->gpio.parent = NULL;
+		dev_warn(&client->dev, "could not add gpiochip\n");
+		return err;
 	}
+	dev_info(&client->dev, "gpios %i...%i\n",
+		 pca955x->gpio.base, pca955x->gpio.base +
+		 pca955x->gpio.ngpio - 1);
 #endif
 
 	return 0;
-- 
2.30.2

