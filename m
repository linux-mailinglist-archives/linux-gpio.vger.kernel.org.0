Return-Path: <linux-gpio+bounces-22713-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D5AF726C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D6E818901EF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F2D2E7F0D;
	Thu,  3 Jul 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fO0oKpLI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9E2E7BDC;
	Thu,  3 Jul 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542346; cv=none; b=TkC3MqI0hqMiw2ZlSNn5FIFZXVgWNBtnfwrivR8ys+Jz/Ac+aJoGIKkGOkHhI+jQHbBhktekj/mkH5reH3z/EarTGta+vg2aUXsDJEPvHYb0rHN95EzWC88Z8Z7HNcddTZSv4mG0rWIHoVi/ujbI6sIIg5R/OgJLvwuDRTeqNXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542346; c=relaxed/simple;
	bh=0+BrFq8UJUgrXrzTNW/WoFpuZ6X2firnB27vkFu+wfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eLWCieaHL3YiN+LqK3OT5aBn5AQ+iEcPUIe7bOUfb9BB3HnVHBsf9xLKut+G3o/x41UMY+TVtiOHRjfCx68JxMIfRQBn8T7nwbM7PScFCA7M7cjukfnLA/W+DD7wzWpElvnP2/tvcQjJTvY8Z3N7xqL0DQA0vc4t6nLyJ1eofqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fO0oKpLI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14038C4CEEB;
	Thu,  3 Jul 2025 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542345;
	bh=0+BrFq8UJUgrXrzTNW/WoFpuZ6X2firnB27vkFu+wfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fO0oKpLIXupdZpDCPZDwAB7a9R6vua594b/SVSQtty2o5fqA4iFj7ekiBMF2JdhEE
	 QvuEC5HDkwg3cBozvkQFTq6FkcVgyvVnrakAGjS/Mct9KIsgqj1+EiXjx54NMwo4Fs
	 ql+71WayUQPU/PKISIFU1nuFZgPNH7KzP4pUqgGuUTg0ot15TYjIwCtBDkZVZ1o0fR
	 adC3BDGW1HYt3vgTahc5Xzdl8jqWiS+VhFcWAVQqHK5szwsLCrp3HH1idZwx0QAuBn
	 3WbyiQy1KzlP6ew0myu952lfhelN/XrI1gYx9rszrPOqvGwG5qcvsTQ3wUAa29JZ4W
	 sdBTzB4RY4LjA==
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
Subject: [PATCH v3 7/8] regulator: tps6594-regulator: refactor variant descriptions
Date: Thu,  3 Jul 2025 13:31:52 +0200
Message-Id: <20250703113153.2447110-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703113153.2447110-1-mwalle@kernel.org>
References: <20250703113153.2447110-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using conditionals or tri state operators throughout the
.probe() provide a description per variant. This will make it much
easier to add new variants later.

While at it, make the variable naming more consistent.

This patch is only compile-time tested.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/tps6594-regulator.c | 199 +++++++++++++++-----------
 1 file changed, 112 insertions(+), 87 deletions(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index 2c7c4df80695..39adb2db6de8 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -21,10 +21,6 @@
 #define BUCK_NB			5
 #define LDO_NB			4
 #define MULTI_PHASE_NB		4
-/* TPS6593 and LP8764 supports OV, UV, SC, ILIM */
-#define REGS_INT_NB		4
-/* TPS65224 supports OV or UV */
-#define TPS65224_REGS_INT_NB	1
 
 enum tps6594_regulator_id {
 	/* DCDC's */
@@ -192,7 +188,7 @@ static const struct regulator_ops tps6594_ldos_4_ops = {
 	.map_voltage		= regulator_map_voltage_linear_range,
 };
 
-static const struct regulator_desc buck_regs[] = {
+static const struct regulator_desc tps6594_buck_regs[] = {
 	TPS6594_REGULATOR("BUCK1", "buck1", TPS6594_BUCK_1,
 			  REGULATOR_VOLTAGE, tps6594_bucks_ops, TPS6594_MASK_BUCKS_VSET,
 			  TPS6594_REG_BUCKX_VOUT_1(0),
@@ -549,6 +545,63 @@ static int tps6594_request_reg_irqs(struct platform_device *pdev,
 	return 0;
 }
 
+struct tps6594_regulator_desc {
+	const struct regulator_desc *multi_phase_regs;
+	unsigned int num_multi_phase_regs;
+
+	const struct regulator_desc *buck_regs;
+	int num_buck_regs;
+
+	const struct regulator_desc *ldo_regs;
+	int num_ldo_regs;
+
+	const struct tps6594_regulator_irq_type **bucks_irq_types;
+	const struct tps6594_regulator_irq_type **ldos_irq_types;
+	int num_irq_types;
+
+	const struct tps6594_regulator_irq_type *ext_irq_types;
+	int num_ext_irqs;
+};
+
+static const struct tps6594_regulator_desc tps65224_reg_desc = {
+	.multi_phase_regs = tps65224_multi_regs,
+	.num_multi_phase_regs = ARRAY_SIZE(tps65224_multi_regs),
+	.buck_regs = tps65224_buck_regs,
+	.num_buck_regs = ARRAY_SIZE(tps65224_buck_regs),
+	.ldo_regs = tps65224_ldo_regs,
+	.num_ldo_regs = ARRAY_SIZE(tps65224_ldo_regs),
+	.bucks_irq_types = tps65224_bucks_irq_types,
+	.ldos_irq_types = tps65224_ldos_irq_types,
+	.num_irq_types = 1, /* OV or UV */
+	.ext_irq_types = tps65224_ext_regulator_irq_types,
+	.num_ext_irqs = ARRAY_SIZE(tps65224_ext_regulator_irq_types),
+};
+
+static const struct tps6594_regulator_desc tps6594_reg_desc = {
+	.multi_phase_regs = tps6594_multi_regs,
+	.num_multi_phase_regs = ARRAY_SIZE(tps6594_multi_regs),
+	.buck_regs = tps6594_buck_regs,
+	.num_buck_regs = ARRAY_SIZE(tps6594_buck_regs),
+	.ldo_regs = tps6594_ldo_regs,
+	.num_ldo_regs = ARRAY_SIZE(tps6594_ldo_regs),
+	.bucks_irq_types = tps6594_bucks_irq_types,
+	.ldos_irq_types = tps6594_ldos_irq_types,
+	.num_irq_types = 4, /* OV, UV, SC and ILIM */
+	.ext_irq_types = tps6594_ext_regulator_irq_types,
+	.num_ext_irqs = 2, /* only VCCA OV and UV */
+};
+
+static const struct tps6594_regulator_desc lp8764_reg_desc = {
+	.multi_phase_regs = tps6594_multi_regs,
+	.num_multi_phase_regs = ARRAY_SIZE(tps6594_multi_regs),
+	.buck_regs = tps6594_buck_regs,
+	.num_buck_regs = ARRAY_SIZE(tps6594_buck_regs),
+	.bucks_irq_types = tps6594_bucks_irq_types,
+	.num_irq_types = 4, /* OV, UV, SC and ILIM */
+	.ext_irq_types = tps6594_ext_regulator_irq_types,
+	.num_ext_irqs = ARRAY_SIZE(tps6594_ext_regulator_irq_types),
+};
+
 static int tps6594_regulator_probe(struct platform_device *pdev)
 {
 	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
@@ -559,38 +612,32 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	struct tps6594_regulator_irq_data *irq_data;
 	struct tps6594_ext_regulator_irq_data *irq_ext_reg_data;
 	const struct tps6594_regulator_irq_type *irq_type;
-	const struct tps6594_regulator_irq_type *irq_types;
 	bool buck_configured[BUCK_NB] = { false };
 	bool buck_multi[MULTI_PHASE_NB] = { false };
+	const struct tps6594_regulator_desc *desc;
+	const struct regulator_desc *multi_regs;
 
 	const char *npname;
 	int error, i, irq, multi;
 	int irq_idx = 0;
 	int buck_idx = 0;
-	int nr_ldo;
-	int nr_buck;
-	int nr_types;
-	unsigned int irq_count;
-	unsigned int multi_phase_cnt;
 	size_t reg_irq_nb;
-	const struct tps6594_regulator_irq_type **bucks_irq_types;
-	const struct regulator_desc *multi_regs;
-	const struct tps6594_regulator_irq_type **ldos_irq_types;
-	const struct regulator_desc *ldo_regs;
 
-	if (tps->chip_id == TPS65224) {
-		bucks_irq_types = tps65224_bucks_irq_types;
-		multi_regs = tps65224_multi_regs;
-		ldos_irq_types = tps65224_ldos_irq_types;
-		ldo_regs = tps65224_ldo_regs;
-		multi_phase_cnt = ARRAY_SIZE(tps65224_multi_regs);
-	} else {
-		bucks_irq_types = tps6594_bucks_irq_types;
-		multi_regs = tps6594_multi_regs;
-		ldos_irq_types = tps6594_ldos_irq_types;
-		ldo_regs = tps6594_ldo_regs;
-		multi_phase_cnt = ARRAY_SIZE(tps6594_multi_regs);
-	}
+	switch (tps->chip_id) {
+	case TPS65224:
+		desc = &tps65224_reg_desc;
+		break;
+	case TPS6594:
+	case TPS6593:
+		desc = &tps6594_reg_desc;
+		break;
+	case LP8764:
+		desc = &lp8764_reg_desc;
+		break;
+	default:
+		dev_err(tps->dev, "unknown chip_id %lu\n", tps->chip_id);
+		return -EINVAL;
+	};
 
 	enum {
 		MULTI_BUCK12,
@@ -611,13 +658,14 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	 * In case of Multiphase configuration, value should be defined for
 	 * buck_configured to avoid creating bucks for every buck in multiphase
 	 */
-	for (multi = 0; multi < multi_phase_cnt; multi++) {
-		np = of_find_node_by_name(tps->dev->of_node, multi_regs[multi].supply_name);
+	for (multi = 0; multi < desc->num_multi_phase_regs; multi++) {
+		multi_regs = &desc->multi_phase_regs[multi];
+		np = of_find_node_by_name(tps->dev->of_node, multi_regs->supply_name);
 		npname = of_node_full_name(np);
 		np_pmic_parent = of_get_parent(of_get_parent(np));
 		if (of_node_cmp(of_node_full_name(np_pmic_parent), tps->dev->of_node->full_name))
 			continue;
-		if (strcmp(npname, multi_regs[multi].supply_name) == 0) {
+		if (strcmp(npname, multi_regs->supply_name) == 0) {
 			switch (multi) {
 			case MULTI_BUCK12:
 				buck_multi[0] = true;
@@ -650,28 +698,19 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (tps->chip_id == TPS65224) {
-		nr_buck = ARRAY_SIZE(tps65224_buck_regs);
-		nr_ldo = ARRAY_SIZE(tps65224_ldo_regs);
-		nr_types = TPS65224_REGS_INT_NB;
-	} else {
-		nr_buck = ARRAY_SIZE(buck_regs);
-		nr_ldo = (tps->chip_id == LP8764) ? 0 : ARRAY_SIZE(tps6594_ldo_regs);
-		nr_types = REGS_INT_NB;
-	}
-
-	reg_irq_nb = nr_types * (nr_buck + nr_ldo);
+	reg_irq_nb = desc->num_irq_types * (desc->num_buck_regs + desc->num_ldo_regs);
 
 	irq_data = devm_kmalloc_array(tps->dev, reg_irq_nb,
 				      sizeof(struct tps6594_regulator_irq_data), GFP_KERNEL);
 	if (!irq_data)
 		return -ENOMEM;
 
-	for (i = 0; i < multi_phase_cnt; i++) {
+	for (i = 0; i < desc->num_multi_phase_regs; i++) {
 		if (!buck_multi[i])
 			continue;
 
-		rdev = devm_regulator_register(&pdev->dev, &multi_regs[i], &config);
+		rdev = devm_regulator_register(&pdev->dev, &desc->multi_phase_regs[i],
+					       &config);
 		if (IS_ERR(rdev))
 			return dev_err_probe(tps->dev, PTR_ERR(rdev),
 					     "failed to register %s regulator\n",
@@ -682,89 +721,74 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 			buck_idx = 2;
 
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-						 bucks_irq_types[buck_idx],
-						 nr_types, &irq_idx);
+						 desc->bucks_irq_types[buck_idx],
+						 desc->num_irq_types, &irq_idx);
 		if (error)
 			return error;
 
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-						 bucks_irq_types[buck_idx + 1],
-						 nr_types, &irq_idx);
+						 desc->bucks_irq_types[buck_idx + 1],
+						 desc->num_irq_types, &irq_idx);
 		if (error)
 			return error;
 
 		if (i == MULTI_BUCK123 || i == MULTI_BUCK1234) {
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-							 bucks_irq_types[buck_idx + 2],
-							 nr_types, &irq_idx);
+							 desc->bucks_irq_types[buck_idx + 2],
+							 desc->num_irq_types,
+							 &irq_idx);
 			if (error)
 				return error;
 		}
 		if (i == MULTI_BUCK1234) {
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-							 bucks_irq_types[buck_idx + 3],
-							 nr_types, &irq_idx);
+							 desc->bucks_irq_types[buck_idx + 3],
+							 desc->num_irq_types,
+							 &irq_idx);
 			if (error)
 				return error;
 		}
 	}
 
-	for (i = 0; i < nr_buck; i++) {
+	for (i = 0; i < desc->num_buck_regs; i++) {
 		if (buck_configured[i])
 			continue;
 
-		const struct regulator_desc *buck_cfg = (tps->chip_id == TPS65224) ?
-							 tps65224_buck_regs : buck_regs;
-
-		rdev = devm_regulator_register(&pdev->dev, &buck_cfg[i], &config);
+		rdev = devm_regulator_register(&pdev->dev, &desc->buck_regs[i], &config);
 		if (IS_ERR(rdev))
 			return dev_err_probe(tps->dev, PTR_ERR(rdev),
 					     "failed to register %s regulator\n", pdev->name);
 
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-						 bucks_irq_types[i], nr_types, &irq_idx);
+						 desc->bucks_irq_types[i],
+						 desc->num_irq_types, &irq_idx);
 		if (error)
 			return error;
 	}
 
-	/* LP8764 doesn't have LDO */
-	if (tps->chip_id != LP8764) {
-		for (i = 0; i < nr_ldo; i++) {
-			rdev = devm_regulator_register(&pdev->dev, &ldo_regs[i], &config);
-			if (IS_ERR(rdev))
-				return dev_err_probe(tps->dev, PTR_ERR(rdev),
-						     "failed to register %s regulator\n",
-						     pdev->name);
-
-			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-							 ldos_irq_types[i], nr_types,
-							 &irq_idx);
-			if (error)
-				return error;
-		}
-	}
+	for (i = 0; i < desc->num_ldo_regs; i++) {
+		rdev = devm_regulator_register(&pdev->dev, &desc->ldo_regs[i], &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     pdev->name);
 
-	if (tps->chip_id == TPS65224) {
-		irq_types = tps65224_ext_regulator_irq_types;
-		irq_count = ARRAY_SIZE(tps65224_ext_regulator_irq_types);
-	} else {
-		irq_types = tps6594_ext_regulator_irq_types;
-		if (tps->chip_id == LP8764)
-			irq_count = ARRAY_SIZE(tps6594_ext_regulator_irq_types);
-		else
-			/* TPS6593 supports only VCCA OV and UV */
-			irq_count = 2;
+		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
+						 desc->ldos_irq_types[i],
+						 desc->num_irq_types, &irq_idx);
+		if (error)
+			return error;
 	}
 
 	irq_ext_reg_data = devm_kmalloc_array(tps->dev,
-					      irq_count,
+					      desc->num_ext_irqs,
 					      sizeof(struct tps6594_ext_regulator_irq_data),
 					      GFP_KERNEL);
 	if (!irq_ext_reg_data)
 		return -ENOMEM;
 
-	for (i = 0; i < irq_count; ++i) {
-		irq_type = &irq_types[i];
+	for (i = 0; i < desc->num_ext_irqs; ++i) {
+		irq_type = &desc->ext_irq_types[i];
 		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
 		if (irq < 0)
 			return -EINVAL;
@@ -782,6 +806,7 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 					     "failed to request %s IRQ %d\n",
 					     irq_type->irq_name, irq);
 	}
+
 	return 0;
 }
 
-- 
2.39.5


