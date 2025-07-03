Return-Path: <linux-gpio+bounces-22714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50307AF7275
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 13:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C585625BC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 11:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368142E8E0A;
	Thu,  3 Jul 2025 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZ2J6VF1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C492E4242;
	Thu,  3 Jul 2025 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542349; cv=none; b=DrA53yEfHN7cxHQvR0F81NeKEhcEKm0pYVDEjMnfv42CEf1Ai62nHKBBqQ6An1/PCuNWP4pPc2CqgkCK9aGqVEKQTTb/XPJQQzam+ZcJK6MrWN0Kq56EtSt9/kW/qG9YyVWTNHpzn133OfaJ5XbuONIr9yNJ+S9aO7oAxwvJ4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542349; c=relaxed/simple;
	bh=3KImKcixsymPQbWmcMwg6wTAMzEv4bSW9MSSSpiBfvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TWJahP6h25L9u1sSchNIUv7IST9WbmHYKvFp/79RZwmxpeIThhtsOQLe1wTPjYA4+wrDNp9mI4PpUcROsAajBcRvy/2EcprsJ9UVJaPQr7WLMaJjJvqBABqo/ETwOPE9+gD+ot8vGfuB3Th0g8YvVx5q6IqmRpK80Psv+pJ353U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZ2J6VF1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27914C4CEED;
	Thu,  3 Jul 2025 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542348;
	bh=3KImKcixsymPQbWmcMwg6wTAMzEv4bSW9MSSSpiBfvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iZ2J6VF1Fhuzs0vcSA/IkbtEitA0bPewCNAriCsgNzSYiQk+1Rr/81nsNukXLPADv
	 Hs323Yc1ZLu7W8yUIYbRBiXCBGCztzvFmkqbh8D0AaGwxEZpy1ofNh/kNPK2k2M1Aw
	 yabRp7oqoGBYi5dGS2/mZhJ91vfDzMaY+tO2nQWgxHi41ND7Hn6lfVv/iyHuXHgWv/
	 T9/MHCX6qvfZqvUS8T6hnTEWeItLMaV5/rr5iljxk7yzcVekoy5aUT4eX+xHr+UmHs
	 VQGOGEOiqz6za2jB36Rbyva8pAn7fYNMEH5aUblexZgMKZqTr8F2PjNqXtNHcMy4Zf
	 gyQDSunOLnrvg==
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
Subject: [PATCH v3 8/8] regulator: tps6594-regulator: Add TI TPS652G1 PMIC regulators
Date: Thu,  3 Jul 2025 13:31:53 +0200
Message-Id: <20250703113153.2447110-9-mwalle@kernel.org>
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

The TI TPS652G1 is a stripped down version of the TPS65224 PMIC. It
doesn't feature the multiphase buck converter nor any voltage
monitoring. Due to the latter there are no interrupts serviced. In case
of the TPS652G1 any interrupt related setup is just skipped.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Mark Brown <broonie@kernel.org>
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


