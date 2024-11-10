Return-Path: <linux-gpio+bounces-12786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D29C349E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 22:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37137281738
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 21:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB4D149C4A;
	Sun, 10 Nov 2024 21:00:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648BF224D6
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731272453; cv=none; b=bnZE13AkBVrHsOpOu+XG7sFCyvYl3UxZGiEInmFYnurMy6uUF/+eGJ9gy8cnzfFm3WBuik8LfcnmAtWfTosT99zezhgUKACYrQV5x1ae+em1WAX6ONsvFD8KhwUx4Fo2nxmtRt+hvH/leRWyCbRGGMAfOanoz0lsHvGVVFUlnQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731272453; c=relaxed/simple;
	bh=xT1oVb9NpWC5R2d9TuBbIB+PsiQJSZuYSy4aGbdjdFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeBhEgT3oXZV0CTaOyMZ8noHlj7pTfXicoHiXoTgTR2NmaTtNS9TbSolMaHXyJ3VIwDGiYRKu9sCIyF3p2amV48EfhmlgaPoVPFGJS5NDvVFOzb3plBhLmbE7CrU14dbGhuqnDsAp+IKPoeAKLn55rb15lvUqz9vS+exafP3Y2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id dc5d416a-9fa6-11ef-8874-005056bdd08f;
	Sun, 10 Nov 2024 23:00:48 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 2/6] pinctrl: cy8c95x0: switch to using devm_regulator_get_enable()
Date: Sun, 10 Nov 2024 22:59:42 +0200
Message-ID: <20241110210040.18918-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110210040.18918-1-andy.shevchenko@gmail.com>
References: <20241110210040.18918-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not actively manage regulator state past probe() time,
so we can use devm_regulator_get_enable() to simplify the code.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 58 ++++++------------------------
 1 file changed, 11 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 5f533dff4417..cb6d9458c1e8 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -141,7 +141,6 @@ static const struct dmi_system_id cy8c95x0_dmi_acpi_irq_info[] = {
  * @nport:          Number of Gports in this chip
  * @gpio_chip:      gpiolib chip
  * @driver_data:    private driver data
- * @regulator:      Pointer to the regulator for the IC
  * @dev:            struct device
  * @pctldev:        pin controller device
  * @pinctrl_desc:   pin controller description
@@ -163,7 +162,6 @@ struct cy8c95x0_pinctrl {
 	int nport;
 	struct gpio_chip gpio_chip;
 	unsigned long driver_data;
-	struct regulator *regulator;
 	struct device *dev;
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pinctrl_desc;
@@ -1434,7 +1432,6 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	struct cy8c95x0_pinctrl *chip;
 	struct regmap_config regmap_conf;
 	struct regmap_range_cfg regmap_range_conf;
-	struct regulator *reg;
 	int ret;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
@@ -1448,8 +1445,6 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	if (!chip->driver_data)
 		return -ENODEV;
 
-	i2c_set_clientdata(client, chip);
-
 	chip->tpin = chip->driver_data & CY8C95X0_GPIO_MASK;
 	chip->nport = DIV_ROUND_UP(CY8C95X0_PIN_TO_OFFSET(chip->tpin), BANK_SZ);
 
@@ -1472,26 +1467,15 @@ static int cy8c95x0_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	reg = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(reg)) {
-		if (PTR_ERR(reg) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-	} else {
-		ret = regulator_enable(reg);
-		if (ret) {
-			dev_err(&client->dev, "failed to enable regulator vdd: %d\n", ret);
-			return ret;
-		}
-		chip->regulator = reg;
-	}
+	ret = devm_regulator_get_enable(&client->dev, "vdd");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "failed to enable regulator vdd\n");
 
 	/* bring the chip out of reset if reset pin is provided */
 	chip->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(chip->gpio_reset)) {
-		ret = dev_err_probe(chip->dev, PTR_ERR(chip->gpio_reset),
-				    "Failed to get GPIO 'reset'\n");
-		goto err_exit;
-	} else if (chip->gpio_reset) {
+	if (IS_ERR(chip->gpio_reset))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->gpio_reset), "Failed to get GPIO 'reset'\n");
+	if (chip->gpio_reset) {
 		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(chip->gpio_reset, 0);
 		usleep_range(250000, 300000);
@@ -1506,10 +1490,8 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	regmap_conf.num_reg_defaults_raw = regmap_range_conf.range_max;
 
 	chip->regmap = devm_regmap_init_i2c(client, &regmap_conf);
-	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		goto err_exit;
-	}
+	if (IS_ERR(chip->regmap))
+		return PTR_ERR(chip->regmap);
 
 	bitmap_zero(chip->push_pull, MAX_LINE);
 	bitmap_zero(chip->shiftmask, MAX_LINE);
@@ -1525,31 +1507,14 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	if (client->irq) {
 		ret = cy8c95x0_irq_setup(chip, client->irq);
 		if (ret)
-			goto err_exit;
+			return ret;
 	}
 
 	ret = cy8c95x0_setup_pinctrl(chip);
 	if (ret)
-		goto err_exit;
+		return ret;
 
-	ret = cy8c95x0_setup_gpiochip(chip);
-	if (ret)
-		goto err_exit;
-
-	return 0;
-
-err_exit:
-	if (!IS_ERR_OR_NULL(chip->regulator))
-		regulator_disable(chip->regulator);
-	return ret;
-}
-
-static void cy8c95x0_remove(struct i2c_client *client)
-{
-	struct cy8c95x0_pinctrl *chip = i2c_get_clientdata(client);
-
-	if (!IS_ERR_OR_NULL(chip->regulator))
-		regulator_disable(chip->regulator);
+	return cy8c95x0_setup_gpiochip(chip);
 }
 
 static const struct acpi_device_id cy8c95x0_acpi_ids[] = {
@@ -1565,7 +1530,6 @@ static struct i2c_driver cy8c95x0_driver = {
 		.acpi_match_table = cy8c95x0_acpi_ids,
 	},
 	.probe		= cy8c95x0_probe,
-	.remove		= cy8c95x0_remove,
 	.id_table	= cy8c95x0_id,
 	.detect		= cy8c95x0_detect,
 };
-- 
2.47.0


