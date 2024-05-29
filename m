Return-Path: <linux-gpio+bounces-6877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892AA8D3CC5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA9A2285F99
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1091C9ED7;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTc+cHhp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8D6194C68;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=NR8J/HnX7mcf0YfGYGzSnyx5monT6KSLxx413TPLTuN0mrUiXx6W37JwVT7UypyDaQS0E2X7FmCaUB71vO9NeF6xLOjZs82cYK3GAVCKSpN3bQ9Uzc/BVcQu5ABfc1obek1CWZUXN0xtU+8B6zhBgiyZrJSfYwc0YNJPLOA0N5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=2q8uKA69UrATuj6FRt0GVVqnEyADsM00txP6nQDM2tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4Rd2VWnyU3NLbjdAakt37M2Mbg0HT/7NMTKew8JgkHuSLMzRx67krgOLRifW4leoqB39wsLjCXuiRNuuQPASs8wzMEZTxSN+5GABaUVqm0x4ogyJwwJ68IwKuSsJq1VJDPh5YWeWCI8hhWiKl9HhQq2Sm4WOy0E3zlJQiMTh2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTc+cHhp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D944C4AF07;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000235;
	bh=2q8uKA69UrATuj6FRt0GVVqnEyADsM00txP6nQDM2tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QTc+cHhp+mlJVys6+DmmcCUMfF9Df7Mso5WBnbpCap491+vYMb3f6IajcUpgBJL6R
	 uuEXVYRLCKERUUGkNF2lQPPkPYznWTpvdjOdIIqMcrv6VYLityd2Iar8pjz++aODpZ
	 ZmH34eCXi/5VATN2wmBloBwMPsbKnqN7ENOimqQxLgRe1DiNdbfHhEFkQEMA5L0/Ww
	 1dSC2qATQwsMCp4YUn33MS6QSqCH4gga6Zyt8rWj5kP6s+NVt68pK4lSOfHj2VbVee
	 ShwR9hNzz8cagYuCMrWTG09RTfE33b+nhj9WYwliejk5N/1+B1E+EoC5jUaHoRyDpL
	 VViTL+bQKKlVA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004ik-1oZd;
	Wed, 29 May 2024 18:30:35 +0200
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
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 02/14] mfd: pm8008: fix regmap irq chip initialisation
Date: Wed, 29 May 2024 18:29:46 +0200
Message-ID: <20240529162958.18081-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240529162958.18081-1-johan+linaro@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
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
 drivers/mfd/qcom-pm8008.c | 64 ++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 41 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 3ac3742f438b..f71c490f25c8 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -56,15 +56,25 @@ static unsigned int pm8008_config_regs[] = {
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
+static const struct regmap_irq pm8008_irqs[] = {
+	_IRQ(PM8008_IRQ_MISC_UVLO,    PM8008_MISC,	BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OVLO,    PM8008_MISC,	BIT(1), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OTST2,   PM8008_MISC,	BIT(2), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
+	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
+	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
@@ -143,38 +153,9 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
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
@@ -187,9 +168,10 @@ static int pm8008_probe(struct i2c_client *client)
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
2.44.1


