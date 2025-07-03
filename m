Return-Path: <linux-gpio+bounces-22711-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47437AF7262
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2683F1C837CA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B612E6D26;
	Thu,  3 Jul 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqTGygiM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027B92E6D1C;
	Thu,  3 Jul 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542340; cv=none; b=Q6oPImXPS6Fq5HUTXREQk2o0jWs9+6SXLaBfs7DH7izQxGTR12R+sGoPTlmCCpi0YTW73t48fuG38Qas5FvfY1YHq39qXcQXcEXAasiXNtPt+wxCkYsSxQ2naAl2tqSCU38CWLxDnmReBMiVUE2QxoamR5BAaO5hsqCi5MfEYcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542340; c=relaxed/simple;
	bh=nTrlgvIw4zBK4D3q9sYSa9w4/R3QYV0kl1AgSzTtEJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TeudIOybsv05/4QYMjRU34bKtTCRKmZeGh5PHPkiZU/jQCL/ewqExkmLz2slbxjx12fN+LH9RMPP199zXh2KS8QqaJaM85HfQg5M29AvVfLRj2bf7fbmcy2/3wOniSPfPRTU3EBhQJ5IbLV0jbbvLnHX55grGSOP7VaS7xEHYv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqTGygiM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8EFC4CEE3;
	Thu,  3 Jul 2025 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542339;
	bh=nTrlgvIw4zBK4D3q9sYSa9w4/R3QYV0kl1AgSzTtEJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mqTGygiMoViXMGHKsF7yVTIW+SNVQjUhLeoMBL/KkD8RG/4tXRp74YAsGkBuEkvGc
	 z/qYeLnKdGYBw5HueKWj5TzOMKAxRPLRJ3VuxHEJ+AQdUEByeWBdcD76xi/+ApZXOt
	 rjnx+A3c+Xdn4gK/uAxglvUFMlstD4H8uzHd9tgCl5mmtx8G3Tn036Fxo/YPMnsPiI
	 2cXes/OJDkYq+UIrKzY8IuL3odk9Vy5skMvaxpqaUxkXh8DFZpziKfb872mcjJA1QC
	 HFlZzGz/I4rqczwLPastkP5y9eeyk7oC8cl5R7LyfeXcR89fkl/oMtMGnYPsGAP1tR
	 +EyeBVjYg2nCg==
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
Subject: [PATCH v3 5/8] regulator: tps6594-regulator: remove interrupt_count
Date: Thu,  3 Jul 2025 13:31:50 +0200
Message-Id: <20250703113153.2447110-6-mwalle@kernel.org>
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

In .probe() interrupt_count and nr_types is essentially the same. It
contains the number of different interrupt per LDO or buck converter.
Drop one. This is a preparation patch to further simplify the handling
of different variants of this PMIC.

This patch is only compile-time tested.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/tps6594-regulator.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index 51264c869aa0..26669f3f1033 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -577,18 +577,15 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	const struct regulator_desc *multi_regs;
 	const struct tps6594_regulator_irq_type **ldos_irq_types;
 	const struct regulator_desc *ldo_regs;
-	size_t interrupt_count;
 
 	if (tps->chip_id == TPS65224) {
 		bucks_irq_types = tps65224_bucks_irq_types;
-		interrupt_count = ARRAY_SIZE(tps65224_buck1_irq_types);
 		multi_regs = tps65224_multi_regs;
 		ldos_irq_types = tps65224_ldos_irq_types;
 		ldo_regs = tps65224_ldo_regs;
 		multi_phase_cnt = ARRAY_SIZE(tps65224_multi_regs);
 	} else {
 		bucks_irq_types = tps6594_bucks_irq_types;
-		interrupt_count = ARRAY_SIZE(tps6594_buck1_irq_types);
 		multi_regs = tps6594_multi_regs;
 		ldos_irq_types = tps6594_ldos_irq_types;
 		ldo_regs = tps6594_ldo_regs;
@@ -686,29 +683,27 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 						 bucks_irq_types[buck_idx],
-						 interrupt_count, &irq_idx);
+						 nr_types, &irq_idx);
 		if (error)
 			return error;
 
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 						 bucks_irq_types[buck_idx + 1],
-						 interrupt_count, &irq_idx);
+						 nr_types, &irq_idx);
 		if (error)
 			return error;
 
 		if (i == MULTI_BUCK123 || i == MULTI_BUCK1234) {
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 							 tps6594_bucks_irq_types[buck_idx + 2],
-							 interrupt_count,
-							 &irq_idx);
+							 nr_types, &irq_idx);
 			if (error)
 				return error;
 		}
 		if (i == MULTI_BUCK1234) {
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 							 tps6594_bucks_irq_types[buck_idx + 3],
-							 interrupt_count,
-							 &irq_idx);
+							 nr_types, &irq_idx);
 			if (error)
 				return error;
 		}
@@ -727,7 +722,7 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 					     "failed to register %s regulator\n", pdev->name);
 
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-						 bucks_irq_types[i], interrupt_count, &irq_idx);
+						 bucks_irq_types[i], nr_types, &irq_idx);
 		if (error)
 			return error;
 	}
@@ -742,7 +737,7 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 						     pdev->name);
 
 			error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
-							 ldos_irq_types[i], interrupt_count,
+							 ldos_irq_types[i], nr_types,
 							 &irq_idx);
 			if (error)
 				return error;
-- 
2.39.5


