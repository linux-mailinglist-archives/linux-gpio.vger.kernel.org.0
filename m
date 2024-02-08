Return-Path: <linux-gpio+bounces-3101-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0AE84DF06
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 12:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B681F2D609
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AC47E595;
	Thu,  8 Feb 2024 10:54:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.ltts.com (unknown [14.140.155.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CD7E564;
	Thu,  8 Feb 2024 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.140.155.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389660; cv=none; b=mjaEZBnjmUVFgQMooSVq6fl3gYX6rqLxmK74Vxr/iuZEuPBvrOhO+EwZY+lL12Kn6DaBBnsYG4hHdY28wx8mJt53JDg6IsY5LXyOM6QJAnZ/jZLgvuf6cpigtl0kkFAqILHbYJTTf3Cj24FJ4XHSqn7IuXsywjGvaZZtXRGd7yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389660; c=relaxed/simple;
	bh=ANFQs58thb6Sfo8Tnd1vzz2cEfX0deEseKjVLICGrQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ttcLQkLE+RWvdN22YeE6cnYrKwR+7aitqQMbXbFX8ZyQHqc/9xQcfa6mkzgGXM3GsIXexrOWijVS+ehFB6n9ROHTmx6+zd4SwtxcbR3WqQ7/cKxCr33t94MmEux9A0CVFBLz/fwSmc8jdrPPYu4Yts6a+0bGRaNt14fFdGBKPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=14.140.155.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: TAhd6pcVHKMaYigVkRSSK7GU6x93gLmCYm2Kwj7WSlSI02hONGblYV0k+dEW7kjF8V9FDFA22B
 Xel16cPLgYCw==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa2.ltts.com with ESMTP; 08 Feb 2024 16:24:08 +0530
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
Subject: [RESEND PATCH v1 10/13] misc: tps6594-esm: Add TI TPS65224 PMIC ESM
Date: Thu,  8 Feb 2024 16:23:40 +0530
Message-Id: <20240208105343.1212902-11-bhargav.r@ltts.com>
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

Add support for TPS65224 Error Signal Monitor in the TPS6594 ESM driver
as they share significant functionality.

Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
---
 drivers/misc/tps6594-esm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/tps6594-esm.c b/drivers/misc/tps6594-esm.c
index d0f86b0e9..445d82bd3 100644
--- a/drivers/misc/tps6594-esm.c
+++ b/drivers/misc/tps6594-esm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * ESM (Error Signal Monitor) driver for TI TPS6594/TPS6593/LP8764 PMICs
+ * ESM (Error Signal Monitor) driver for TI TPS65224/TPS6594/TPS6593/LP8764 PMICs
  *
  * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
  */
@@ -20,6 +20,8 @@
 #define ESM_MODE_CFG_CLR  0x0
 #define ESM_START_CLR     0x0
 
+static struct reg_field tps65224_esm_mode_cfg = REG_FIELD(TPS6594_REG_ESM_MCU_MODE_CFG,  5, 6);
+static struct reg_field tps65224_esm_start    = REG_FIELD(TPS6594_REG_ESM_MCU_START_REG, 0, 0);
 static struct reg_field tps6594_esm_mode_cfg  = REG_FIELD(TPS6594_REG_ESM_SOC_MODE_CFG,  5, 6);
 static struct reg_field tps6594_esm_start     = REG_FIELD(TPS6594_REG_ESM_SOC_START_REG, 0, 0);
 
@@ -87,8 +89,14 @@ static int tps6594_esm_probe(struct platform_device *pdev)
 	if (!esm)
 		return -ENOMEM;
 
-	esm->esm_mode_cfg = devm_regmap_field_alloc(dev, tps->regmap, tps6594_esm_mode_cfg);
-	esm->esm_start = devm_regmap_field_alloc(dev, tps->regmap, tps6594_esm_start);
+	if (tps->chip_id == TPS65224) {
+		esm->esm_mode_cfg = devm_regmap_field_alloc(dev, tps->regmap,
+							    tps65224_esm_mode_cfg);
+		esm->esm_start = devm_regmap_field_alloc(dev, tps->regmap, tps65224_esm_start);
+	} else {
+		esm->esm_mode_cfg = devm_regmap_field_alloc(dev, tps->regmap, tps6594_esm_mode_cfg);
+		esm->esm_start = devm_regmap_field_alloc(dev, tps->regmap, tps6594_esm_start);
+	}
 
 	if (IS_ERR(esm->esm_mode_cfg)) {
 		dev_err(dev, "esm_mode_cfg reg field init failed\n");
@@ -176,5 +184,6 @@ module_platform_driver(tps6594_esm_driver);
 
 MODULE_ALIAS("platform:tps6594-esm");
 MODULE_AUTHOR("Julien Panis <jpanis@baylibre.com>");
+MODULE_AUTHOR("Bhargav Raviprakash <bhargav.r@ltts.com>");
 MODULE_DESCRIPTION("TPS6594 Error Signal Monitor Driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1


