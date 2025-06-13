Return-Path: <linux-gpio+bounces-21531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A42CDAD8B51
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 13:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5F1E3BF55F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 11:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F2F2E7F03;
	Fri, 13 Jun 2025 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6eiOwsO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66B2E6D1C;
	Fri, 13 Jun 2025 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815143; cv=none; b=nNk5XQNxzfcgdVYfZDCrfESkJpxaMus9MMHo71ZErCY0sR0ZZSPhvMma2oiDZ6c5dYY3lAUJv889HiNRICLVBsJkN6CvisvGdDVp2VUMR7ma4uGwUBWHktcwyCjYXR8P/RqmvIPLnyPqpezIhPF3MU5c24WQJhtWPJTUd/Mgh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815143; c=relaxed/simple;
	bh=MJb6yGjyd0nLSykH0FPSp1Xt8IpOmNQGYqP8wqImXE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZIWMbmmMi/lp0jHnQ5ZUtmExl52o1LLNLHXYxrVL4Chq7h3JPXTm/ZJbSQEphqlTh99sa2ae6IDpXu1y4V9mo/bWyEk3liG+5LyzJCC1ju8APGKKFTIuZbGrzAf//gjy7Pj80NX5V7niGUUJz+53VaLaZnG3O0rFsPNlEwjfLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6eiOwsO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3ACC4CEE3;
	Fri, 13 Jun 2025 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815143;
	bh=MJb6yGjyd0nLSykH0FPSp1Xt8IpOmNQGYqP8wqImXE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q6eiOwsOxPCtSBIs5Ytxg3zT5DPO7UEBt7mmcPoyaO7TJYu7auaG2VetPyf0wWLl5
	 Tgg90jM6qi5vt4PO6dhw12EuYucc3U7drgS8k/9kqXMgQ7PqYnjt0lD1PIqA1TjxAy
	 Nwsp02q7e6ayAhieEhRg56gQeTsaCjYwddGzUXfVCMXU1BljrSyeUHYQfIK6VrFf/b
	 M6EAb328a7y96c7+j1+Ofpf0YCzc98+2ZoyWwxv22f69xmQZNakAWUSKgO8w+WaXBi
	 EIU2EL5clOoD7RCZsCbGfwf8YE3BVBL1qIDuCzagK4xKTrAy80eSlRn9syUT+iHfNG
	 7LdLnG7ULSG/Q==
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
Subject: [PATCH v2 4/7] regulator: tps6594-regulator: remove interrupt_count
Date: Fri, 13 Jun 2025 13:45:15 +0200
Message-Id: <20250613114518.1772109-5-mwalle@kernel.org>
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

In .probe() interrupt_count and nr_types is essentially the same. It
contains the number of different interrupt per LDO or buck converter.
Drop one. This is a preparation patch to further simplify the handling
of different variants of this PMIC.

This patch is only compile-time tested.

Signed-off-by: Michael Walle <mwalle@kernel.org>
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


