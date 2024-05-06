Return-Path: <linux-gpio+bounces-6142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A58BD11A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE942842FB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FF015535B;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNWS0c7A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218215359F;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=uKp73a9814zQTAYj5TX1jTNQxrIi280/LdKIMWJZRjJSLR1yaSKGCLauQc6CovZDCA2Gg+F40tD8Ow9lZS9Vsq6uIEx7+yQtAXn7fp2NNC/g5CEe/p4FARUmrXPB7cFJpF3I1p4vCeIVyZZraFpa5Cj5KZSe/APMsg/z/CwcAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=Wuk22wlBQckYaKY1MQvvxaDZ5/OzjHLdVhwSrf/Ys6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N09rswsrF+zhk2qF4zF5rb8DL3vtOZfw6BjGJyPweyh9u/K1twpfFx5SVQeibXvZzFRpY2I2vkISTvDZktlt2ejb/A1z0Ooe8gJtHh40Cp52Cnx8h164SPyfJQmbqKKXWm9lyP13c4/J5jUEjK/amv3QQ7jMvi77Za1hm6hTF6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNWS0c7A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8B2C4AF68;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=Wuk22wlBQckYaKY1MQvvxaDZ5/OzjHLdVhwSrf/Ys6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jNWS0c7A2MtlH5FWua/YmeJWdwguEgdt3iAsXT8ulGsXej5N4u+NDtwOKva93TXa9
	 Uq/cOT00nLHdD8QA2jX+eS6/ITnjjxiFOD7kd6IRcG+R7x+YS30C8lbNLpXqlVI5gw
	 YbiJjZV8Iarvmk4z68Y9GW/Oaj3bAmYx/R6HQ43sS6Abk7kFPJTQ+G5Wz7/3I028IF
	 VSYmHTEtPLuRilRQFwQ5+gUJ2292ib2xRfVRxNIUxGghW5xqReR9RGa7RZwHbL5OB1
	 GLEqcRfkAMRK8BTi9Q5F4+DJqJqFmKmoOaTfzY4DhM7yE3XiqHhiknGIAl8jLh25ix
	 YubgIJO2T9U1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyp-000000006CB-49HO;
	Mon, 06 May 2024 17:10:16 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 02/13] mfd: pm8008: fix regmap irq chip initialisation
Date: Mon,  6 May 2024 17:08:19 +0200
Message-ID: <20240506150830.23709-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regmap irq array is potentially shared between multiple PMICs and
should only contain static data.

Use a custom macro to initialise also the type fields and drop the
unnecessary updates on each probe.

Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 66 +++++++++++++++------------------------
 1 file changed, 25 insertions(+), 41 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 3ac3742f438b..d53c987b0d49 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -56,15 +56,27 @@ static unsigned int pm8008_config_regs[] = {
 	INT_POL_LOW_OFFSET,
 };
 
-static struct regmap_irq pm8008_irqs[] = {
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_UVLO,	PM8008_MISC,	BIT(0)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OVLO,	PM8008_MISC,	BIT(1)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST2,	PM8008_MISC,	BIT(2)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST3,	PM8008_MISC,	BIT(3)),
-	REGMAP_IRQ_REG(PM8008_IRQ_MISC_LDO_OCP,	PM8008_MISC,	BIT(4)),
-	REGMAP_IRQ_REG(PM8008_IRQ_TEMP_ALARM,	PM8008_TEMP_ALARM, BIT(0)),
-	REGMAP_IRQ_REG(PM8008_IRQ_GPIO1,	PM8008_GPIO1,	BIT(0)),
-	REGMAP_IRQ_REG(PM8008_IRQ_GPIO2,	PM8008_GPIO2,	BIT(0)),
+#define _IRQ(_irq, _off, _mask, _types)			\
+	[_irq] = {					\
+		.reg_offset = (_off),			\
+		.mask = (_mask),			\
+		.type = {				\
+			.type_reg_offset = (_off),	\
+			.types_supported = (_types),	\
+		},					\
+	}
+
+#define _IRQ_TYPE_ALL (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)
+
+static const struct regmap_irq pm8008_irqs[] = {
+	_IRQ(PM8008_IRQ_MISC_UVLO,    PM8008_MISC,	BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OVLO,    PM8008_MISC,	BIT(1), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OTST2,   PM8008_MISC,	BIT(2), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), _IRQ_TYPE_ALL),
+	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), _IRQ_TYPE_ALL),
+	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), _IRQ_TYPE_ALL),
 };
 
 static const unsigned int pm8008_periph_base[] = {
@@ -143,38 +155,9 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
 	.max_register	= 0xFFFF,
 };
 
-static int pm8008_probe_irq_peripherals(struct device *dev,
-					struct regmap *regmap,
-					int client_irq)
-{
-	int rc, i;
-	struct regmap_irq_type *type;
-	struct regmap_irq_chip_data *irq_data;
-
-	for (i = 0; i < ARRAY_SIZE(pm8008_irqs); i++) {
-		type = &pm8008_irqs[i].type;
-
-		type->type_reg_offset = pm8008_irqs[i].reg_offset;
-
-		if (type->type_reg_offset == PM8008_MISC)
-			type->types_supported = IRQ_TYPE_EDGE_RISING;
-		else
-			type->types_supported = (IRQ_TYPE_EDGE_BOTH |
-				IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW);
-	}
-
-	rc = devm_regmap_add_irq_chip(dev, regmap, client_irq,
-			IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-	if (rc) {
-		dev_err(dev, "Failed to add IRQ chip: %d\n", rc);
-		return rc;
-	}
-
-	return 0;
-}
-
 static int pm8008_probe(struct i2c_client *client)
 {
+	struct regmap_irq_chip_data *irq_data;
 	int rc;
 	struct device *dev;
 	struct regmap *regmap;
@@ -187,9 +170,10 @@ static int pm8008_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, regmap);
 
 	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
-		rc = pm8008_probe_irq_peripherals(dev, regmap, client->irq);
+		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
+				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
 		if (rc)
-			dev_err(dev, "Failed to probe irq periphs: %d\n", rc);
+			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
 	}
 
 	return devm_of_platform_populate(dev);
-- 
2.43.2


