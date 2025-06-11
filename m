Return-Path: <linux-gpio+bounces-21398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB2AD571A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160931BC255A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416FA2BD01E;
	Wed, 11 Jun 2025 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgmfmKQR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01182BCF7B;
	Wed, 11 Jun 2025 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648728; cv=none; b=GZw2kWLm8HdRWfpGuNVrghMysISuHN+4ygKCPvzAZJpQXpnfXsWPMpyR86MByPs4U8WQW9fqH1FyU/2AG+UycW4TDCz/JbNfXgDVLIcxCA49pqc0TgVZRs5YKR/xlLDbtwey9ZNSeq/OPxlP461F2WbGEhWzlV3qQ785xfbmdVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648728; c=relaxed/simple;
	bh=XiSy6EA+nY4FGmZhH6fU8zZo9na9VIQe0Qv5BQB5i4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fu2tnuJ+3srdC6kXil0iIxzEpp3+2L1c9eHht7ka16C7Xx1eHO5LRgU32cTXf2xXN1qLkgk+Fv2c2bD+7t9DyYF5pQXsGa4BY3EWV8CN1YI3005b2zqHuf0DEJqju68ZqpYWSIVB5Dn+MagAtGg8Z/5HW52TvpRM0pgywCWYLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgmfmKQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC86FC4CEEE;
	Wed, 11 Jun 2025 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648727;
	bh=XiSy6EA+nY4FGmZhH6fU8zZo9na9VIQe0Qv5BQB5i4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PgmfmKQRS/2BiTQLkQf3VrOESp1mSELSO8JW8xYjcW9+8Azsf7eVB/1mgqeyvXqLM
	 Dw959O/+9soTBcH2N9EAcTdbDTM1uLvmEv/6VRFWrfBGhqcjoyALC9D4SKTWKSWcvb
	 OdbIf3V780ZLj1+gxwzpNBVpvYzpbowc1rLuKsWwvnNlhdErmWlqL+oxNpOblHniq7
	 +ycrYK0IhBNh80rl8UfuWzhwLhQlhEdCeZ4CZxe9ZSYH+JKsfzCGC+4HhX/w7t6R0/
	 55b46pcOrkuXz7GqscwjpnMFOQC6uuiEhs+3F8iU4eosaLvI/zytb8akJtk+tTbuSU
	 Egvy3QKmSW1MA==
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Panis <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 5/5] regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators
Date: Wed, 11 Jun 2025 15:31:37 +0200
Message-Id: <20250611133137.1686183-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611133137.1686183-1-mwalle@kernel.org>
References: <20250611133137.1686183-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TI TPS652G1 is a stripped down version of the TPS65224 PMIC. It
doesn't feature the multiphase buck converter nor any voltage
monitoring. Due to the latter there are no interrupts serviced. In case
of the TPS652G1 any interrupt related setup is just skipped.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/regulator/tps6594-regulator.c | 41 +++++++++++++++++++++------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index 51264c869aa0..401bc9ca4cd6 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -578,6 +578,7 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	const struct tps6594_regulator_irq_type **ldos_irq_types;
 	const struct regulator_desc *ldo_regs;
 	size_t interrupt_count;
+	const struct regulator_desc *buck_cfg;
 
 	if (tps->chip_id == TPS65224) {
 		bucks_irq_types = tps65224_bucks_irq_types;
@@ -586,6 +587,12 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 		ldos_irq_types = tps65224_ldos_irq_types;
 		ldo_regs = tps65224_ldo_regs;
 		multi_phase_cnt = ARRAY_SIZE(tps65224_multi_regs);
+		buck_cfg = tps65224_buck_regs;
+	} else if (tps->chip_id == TPS652G1) {
+		ldo_regs = tps65224_ldo_regs;
+		/* TPS652G1 doesn't have multi phase buck converters */
+		multi_phase_cnt = 0;
+		buck_cfg = tps65224_buck_regs;
 	} else {
 		bucks_irq_types = tps6594_bucks_irq_types;
 		interrupt_count = ARRAY_SIZE(tps6594_buck1_irq_types);
@@ -593,6 +600,7 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 		ldos_irq_types = tps6594_ldos_irq_types;
 		ldo_regs = tps6594_ldo_regs;
 		multi_phase_cnt = ARRAY_SIZE(tps6594_multi_regs);
+		buck_cfg = buck_regs;
 	}
 
 	enum {
@@ -657,18 +665,24 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 		nr_buck = ARRAY_SIZE(tps65224_buck_regs);
 		nr_ldo = ARRAY_SIZE(tps65224_ldo_regs);
 		nr_types = TPS65224_REGS_INT_NB;
+	} else if (tps->chip_id == TPS652G1) {
+		nr_buck = ARRAY_SIZE(tps65224_buck_regs);
+		nr_ldo = ARRAY_SIZE(tps65224_ldo_regs);
 	} else {
 		nr_buck = ARRAY_SIZE(buck_regs);
 		nr_ldo = (tps->chip_id == LP8764) ? 0 : ARRAY_SIZE(tps6594_ldo_regs);
 		nr_types = REGS_INT_NB;
 	}
 
-	reg_irq_nb = nr_types * (nr_buck + nr_ldo);
+	if (tps->chip_id != TPS652G1) {
+		reg_irq_nb = nr_types * (nr_buck + nr_ldo);
 
-	irq_data = devm_kmalloc_array(tps->dev, reg_irq_nb,
-				      sizeof(struct tps6594_regulator_irq_data), GFP_KERNEL);
-	if (!irq_data)
-		return -ENOMEM;
+		irq_data = devm_kmalloc_array(tps->dev, reg_irq_nb,
+					      sizeof(struct tps6594_regulator_irq_data),
+					      GFP_KERNEL);
+		if (!irq_data)
+			return -ENOMEM;
+	}
 
 	for (i = 0; i < multi_phase_cnt; i++) {
 		if (!buck_multi[i])
@@ -680,6 +694,10 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 					     "failed to register %s regulator\n",
 					     pdev->name);
 
+		/* skip interrupts */
+		if (tps->chip_id == TPS652G1)
+			continue;
+
 		/* config multiphase buck12+buck34 */
 		if (i == MULTI_BUCK12_34)
 			buck_idx = 2;
@@ -718,14 +736,15 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 		if (buck_configured[i])
 			continue;
 
-		const struct regulator_desc *buck_cfg = (tps->chip_id == TPS65224) ?
-							 tps65224_buck_regs : buck_regs;
-
 		rdev = devm_regulator_register(&pdev->dev, &buck_cfg[i], &config);
 		if (IS_ERR(rdev))
 			return dev_err_probe(tps->dev, PTR_ERR(rdev),
 					     "failed to register %s regulator\n", pdev->name);
 
+		/* skip interrupts */
+		if (tps->chip_id == TPS652G1)
+			continue;
+
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 						 bucks_irq_types[i], interrupt_count, &irq_idx);
 		if (error)
@@ -741,6 +760,10 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 						     "failed to register %s regulator\n",
 						     pdev->name);
 
+			/* skip interrupts */
+			if (tps->chip_id == TPS652G1)
+				continue;
+
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 							 ldos_irq_types[i], interrupt_count,
 							 &irq_idx);
@@ -752,6 +775,8 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	if (tps->chip_id == TPS65224) {
 		irq_types = tps65224_ext_regulator_irq_types;
 		irq_count = ARRAY_SIZE(tps65224_ext_regulator_irq_types);
+	} else if (tps->chip_id == TPS652G1) {
+		irq_count = 0;
 	} else {
 		irq_types = tps6594_ext_regulator_irq_types;
 		if (tps->chip_id == LP8764)
-- 
2.39.5


