Return-Path: <linux-gpio+bounces-6870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543778D3CAB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8DC51F24B68
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57125190699;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1VZZ7iS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642A18735B;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=ARsHhCw9lrfsTD5cBOWxP1g4XF8LCNa4ian1GIM2B4DapG+O+6apGPceSDEGiTaVCTY9CMH8zdV1feO5F5lqkFi//gvk8YmyCl19zbuLTs+cDdX/Oieax3FpSgilrTV9nOj+K5wm0T4rRX3wgUyrRWGw//x+ktQGb+LijJ54qqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=CMzX95BYhopK+WIO+dnov/qG98VPRvKcCjXdO2f6tTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ly6DCO5coq85Ohrtry2YR3IupUR8hxWT0CAin7WITfP9ALxuv2JDTBeMhhK9o40ppvmazEYSeBWI/7ck4Y12+CHdCv+qzs9XWo/TBZ9EeFDwwDyL9A2hbChVxRSc1DiydhcnGHhf3gsd0rs1s5dJkyxoOIhY3XVkVcn1k4H4yjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1VZZ7iS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC04C2BD10;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000235;
	bh=CMzX95BYhopK+WIO+dnov/qG98VPRvKcCjXdO2f6tTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k1VZZ7iS25A6L58/8A5UPrXW995EwZJL/51lKKigJs+U+3d1lS6EqyycE/kndywVK
	 l48+qG9wTxrquvUYQpuoBecH9SXQoeJXk+iEBQ76xf8gmFcxq1/0pfqdj78ctCJKT/
	 cVV9tK9TJGdngKhv5tbSla1ogzZPfSEs+lBAUze57/EmEc+GLeMCPtnFTzkx9AsdWM
	 aQs2FBo3LGVrqwmZhqNrbNr3tp39SlR6a3zwLN03sogDzX8dqFuBd9XhVeA6q1HtQf
	 K0n/mIFRMf4zKWddIcA30l3inGSeQVzu4ordJNkzPZ8mffOcPhhgv3SWetw2gScTEf
	 +jOP+XvQNWduw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004im-28x3;
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
Subject: [PATCH v2 03/14] mfd: pm8008: deassert reset on probe
Date: Wed, 29 May 2024 18:29:47 +0200
Message-ID: <20240529162958.18081-4-johan+linaro@kernel.org>
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

Request and deassert any (optional) reset gpio during probe in case it
has been left asserted by the boot firmware.

Note the reset line is not asserted to avoid reverting to the default
I2C address in case the firmware has configured an alternate address.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index f71c490f25c8..5a77155a63d7 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -156,6 +157,7 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	struct gpio_desc *reset;
 	int rc;
 	struct device *dev;
 	struct regmap *regmap;
@@ -167,6 +169,16 @@ static int pm8008_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, regmap);
 
+	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	/*
+	 * The PMIC does not appear to require a post-reset delay, but wait
+	 * for a millisecond for now anyway.
+	 */
+	usleep_range(1000, 2000);
+
 	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
 		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
 				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-- 
2.44.1


