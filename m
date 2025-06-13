Return-Path: <linux-gpio+bounces-21534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1E7AD8B4A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6C681BC37EC
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09CD2E88BF;
	Fri, 13 Jun 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuIdQAxe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D392E88B3;
	Fri, 13 Jun 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815152; cv=none; b=hvrhPvwWgk+sp+eivYDwa5RtLNF/xSCnH/31Hm6b3jqS92qXKpX3nDcguWYFwNCVbdlIRsf+EJ0AC+BUyl5IDhO529pEmAACvZVFMVOwLzojQ4rOnjS15xAqYfJE5GV9ebL0hUnp0wwfLRGip9OefKdpCeIPbjQBKCzyWCdib1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815152; c=relaxed/simple;
	bh=FaKY9ZyumwZvqSE3ddu6DnEKSv4S4JD/L8RDteD+O1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EYi5RVLF/ayr12JmObNsImGjhc1qNr17kh9qT8j7ZjZH9PXNd0JFR/ixRsVchAceo9MLog5RS78B+Mg60ipQyf0NMMHlH1A5fLwR6qoa2/y1LMnMwbf8vptQjNULUSN3FLQMLXuj8mF38cToHTfsMzpooRRkQxoyVK9XbgBQWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuIdQAxe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7C2C4CEF2;
	Fri, 13 Jun 2025 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815152;
	bh=FaKY9ZyumwZvqSE3ddu6DnEKSv4S4JD/L8RDteD+O1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PuIdQAxeP3R8iOGn3qw7rztdEHVAN2+RJv+y3eMNUX4kXcQzaCFKOKCRvRJbvTUew
	 u5aGzvMmWU+4NS17vFihceYNoEaTN9J4cq2VLChI2OHiONEC61G84AnXOa6nCkvMti
	 JbenCYD2xNPB8RjFQCc1CHXRAeteWf/Hi83U2OOfYWzYlfEZ8kDRMVImhJ1xltCnTS
	 kUpth4ZKzJsAsgr0y0vNMzIavKCswbG67C5nLb61yvNg2yuVq/74E+CjxWYSSLfhlT
	 oafCgLF2op8gcVdFhDWzNRw3S2m6c09V2vJw6NoZmxzILYyd9HbY0tJaXMszDDc87x
	 MMmYp6To7WruA==
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
Subject: [PATCH v2 7/7] regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators
Date: Fri, 13 Jun 2025 13:45:18 +0200
Message-Id: <20250613114518.1772109-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613114518.1772109-1-mwalle@kernel.org>
References: <20250613114518.1772109-1-mwalle@kernel.org>
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
 drivers/regulator/tps6594-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/tps6594-regulator.c b/drivers/regulator/tps6594-regulator.c
index 39adb2db6de8..ab882daec7c5 100644
--- a/drivers/regulator/tps6594-regulator.c
+++ b/drivers/regulator/tps6594-regulator.c
@@ -577,6 +577,13 @@ static const struct tps6594_regulator_desc tps65224_reg_desc = {
 	.num_ext_irqs = ARRAY_SIZE(tps65224_ext_regulator_irq_types),
 };
 
+static const struct tps6594_regulator_desc tps652g1_reg_desc = {
+	.ldo_regs = tps65224_ldo_regs,
+	.num_ldo_regs = ARRAY_SIZE(tps65224_ldo_regs),
+	.buck_regs = tps65224_buck_regs,
+	.num_buck_regs = ARRAY_SIZE(tps65224_buck_regs),
+};
+
 static const struct tps6594_regulator_desc tps6594_reg_desc = {
 	.multi_phase_regs = tps6594_multi_regs,
 	.num_multi_phase_regs = ARRAY_SIZE(tps6594_multi_regs),
@@ -627,6 +634,9 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 	case TPS65224:
 		desc = &tps65224_reg_desc;
 		break;
+	case TPS652G1:
+		desc = &tps652g1_reg_desc;
+		break;
 	case TPS6594:
 	case TPS6593:
 		desc = &tps6594_reg_desc;
@@ -716,6 +726,9 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 					     "failed to register %s regulator\n",
 					     pdev->name);
 
+		if (!desc->num_irq_types)
+			continue;
+
 		/* config multiphase buck12+buck34 */
 		if (i == MULTI_BUCK12_34)
 			buck_idx = 2;
@@ -759,6 +772,9 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 			return dev_err_probe(tps->dev, PTR_ERR(rdev),
 					     "failed to register %s regulator\n", pdev->name);
 
+		if (!desc->num_irq_types)
+			continue;
+
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 						 desc->bucks_irq_types[i],
 						 desc->num_irq_types, &irq_idx);
@@ -773,6 +789,9 @@ static int tps6594_regulator_probe(struct platform_device *pdev)
 					     "failed to register %s regulator\n",
 					     pdev->name);
 
+		if (!desc->num_irq_types)
+			continue;
+
 		error = tps6594_request_reg_irqs(pdev, rdev, irq_data,
 						 desc->ldos_irq_types[i],
 						 desc->num_irq_types, &irq_idx);
-- 
2.39.5


