Return-Path: <linux-gpio+bounces-27263-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AF9BECD6F
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 12:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08EE188CB7A
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Oct 2025 10:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155BF2F39C2;
	Sat, 18 Oct 2025 10:22:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail2.mroth.net (mail2.mroth.net [138.201.95.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB36D2F28E2;
	Sat, 18 Oct 2025 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.201.95.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782953; cv=none; b=pSDxh7ZC03IEPapojGqEJHZ3yJzIuER2zDK/fcmIoLeQPgPVu+LYYgEwYl6/VhD1hyilIyHGQjv+B//XwKvdrNllhetpQ8Cff2ZQJwTZQVtyOimr/xUgvDvBXCxRjmlTMqkZC3MJbjJpDne4AQOeqIccJsE0qfB2vATrOu2Z+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782953; c=relaxed/simple;
	bh=erETI8DD7TGV3bXnNGNOcX54bZm+clWFdGy76BY89no=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q7I6JCwRjRLv/MidenyNmE++jpL7q0IyAAh6CojhGE31pvQKW5uPnPpay5PP+x2blviEcLvMHR+8RYTjQ2rnngyuKtQoKh8zEGuO6tvNS5bLlJa2AiNOsCJHQf1SY37v42fZP0rpu6SKeaIW8saoSJ1oyvGiO6fi37xekSDO+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mroth.net; spf=pass smtp.mailfrom=mroth.net; arc=none smtp.client-ip=138.201.95.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mroth.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mroth.net
Received: from pc1.home (unknown [IPv6:2001:9e8:a25b:70f1:365e:50e3:e235:ca15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail2.mroth.net (Postfix) with ESMTPSA id 44D883F2;
	Sat, 18 Oct 2025 12:14:51 +0200 (CEST)
From: Michael Roth <mail@mroth.net>
To: linus.walleij@linaro.org
Cc: brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Roth <mail@mroth.net>
Subject: [PATCH] gpio: pca953x: clarify log messages about auto increment feature
Date: Sat, 18 Oct 2025 12:14:04 +0200
Message-Id: <20251018101404.3630905-1-mail@mroth.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe messages currently print "using AI" and "using no AI",
which can be confusing to users unfamiliar with the datasheet term.

Clarify these by spelling out "auto increment", which is the meaning
of the AI bit described in the register map.

No functional change, only clearer log wording and matching comment
update.

Signed-off-by: Michael Roth <mail@mroth.net>
---
 drivers/gpio/gpio-pca953x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b46927f55..360c14f69 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -306,7 +306,7 @@ static inline u8 pca953x_get_bit_mask(struct pca953x_chip *chip, unsigned int of
  *     Interrupt mask register		0x40 + 5 * bank_size	RW
  *     Interrupt status register	0x40 + 6 * bank_size	R
  *
- * - Registers with bit 0x80 set, the AI bit
+ * - Registers with bit 0x80 set, the AI bit (auto increment)
  *   The bit is cleared and the registers fall into one of the
  *   categories above.
  */
@@ -1203,10 +1203,10 @@ static int pca953x_probe(struct i2c_client *client)
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
 	if (NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
-		dev_info(dev, "using AI\n");
+		dev_info(dev, "using auto increment\n");
 		regmap_config = &pca953x_ai_i2c_regmap;
 	} else {
-		dev_info(dev, "using no AI\n");
+		dev_info(dev, "using no auto increment\n");
 		regmap_config = &pca953x_i2c_regmap;
 	}
 
-- 
2.34.1


