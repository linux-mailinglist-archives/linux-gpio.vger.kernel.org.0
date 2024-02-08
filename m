Return-Path: <linux-gpio+bounces-3098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DEE84DEFC
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E451F2D535
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3AF7D40A;
	Thu,  8 Feb 2024 10:54:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.ltts.com (unknown [14.140.155.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00557C096;
	Thu,  8 Feb 2024 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.140.155.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389656; cv=none; b=G4muljuBRwCpHjB/uyn7xVA5BVVxdJA3StL+EdwNIi26B6t7A8OOHNfBjIheOt4lGjfn4LVKZEJ8p+z4KPB3v8BYTlqgjgBHsmQv8bO0uVNryb/+dElapjQkPlYjG0QKulnbI4NvV369nmZrTNOMhI57w2ES6Frv1dQHpL4KguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389656; c=relaxed/simple;
	bh=6KBxbdjaQLnVhpeBHZmuCEbJu0n286hs7uzybtzFK9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U+dQPCEQkfqPbsRzJBvgzyvYt/ouBj2m/yyx8rGegDZ9mPcD0bBsvxCVypLdMvxklV2Qzf2Vokvs+GsMvzQdwODq/6EYuVzhDUO2/9Ra+IX2qWU4yneT2BhXtwjbmGJ3KH2AbXO/Hq9W6zJdDBiC9VOjxO6n4EF9sGWdb/EuqcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=14.140.155.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: r0BWyASaDcZAtS3hM409m+P30Hyi75hEtN/aNBj/BGOODeFPo0lSu2DuIWZ5uZ6sL1y4PV6at4
 3TGSTZ4n1pFw==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa2.ltts.com with ESMTP; 08 Feb 2024 16:24:06 +0530
From: Bhargav Raviprakash <bhargav.r@ltts.com>
To: linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com,
	lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jpanis@baylibre.com,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	Bhargav Raviprakash <bhargav.r@ltts.com>
Subject: [RESEND PATCH v1 08/13] misc: tps6594-esm: reversion check limited to TPS6594 family
Date: Thu,  8 Feb 2024 16:23:38 +0530
Message-Id: <20240208105343.1212902-9-bhargav.r@ltts.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240208105343.1212902-1-bhargav.r@ltts.com>
References: <20240208105343.1212902-1-bhargav.r@ltts.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reversion check is only applicable on TPS6594 family of PMICs.
Conditionally add that check if the chip_id is one of the PMIC in
the TPS6594 family.

Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
---
 drivers/misc/tps6594-esm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/tps6594-esm.c b/drivers/misc/tps6594-esm.c
index b4d67a1a2..8ec5af9dc 100644
--- a/drivers/misc/tps6594-esm.c
+++ b/drivers/misc/tps6594-esm.c
@@ -45,13 +45,17 @@ static int tps6594_esm_probe(struct platform_device *pdev)
 	 * As a consequence, ESM can not be used on those PMIC.
 	 * Check the version and return an error in case of revision 1.
 	 */
-	ret = regmap_read(tps->regmap, TPS6594_REG_DEV_REV, &rev);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to read PMIC revision\n");
-	if (rev == TPS6594_DEV_REV_1)
-		return dev_err_probe(dev, -ENODEV,
-			      "ESM not supported for revision 1 PMIC\n");
+	if (tps->chip_id == TPS6594 ||
+	    tps->chip_id == TPS6593 ||
+	    tps->chip_id == LP8764) {
+		ret = regmap_read(tps->regmap, TPS6594_REG_DEV_REV, &rev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to read PMIC revision\n");
+		if (rev == TPS6594_DEV_REV_1)
+			return dev_err_probe(dev, -ENODEV,
+				      "ESM not supported for revision 1 PMIC\n");
+	}
 
 	for (i = 0; i < pdev->num_resources; i++) {
 		irq = platform_get_irq_byname(pdev, pdev->resource[i].name);
-- 
2.25.1


