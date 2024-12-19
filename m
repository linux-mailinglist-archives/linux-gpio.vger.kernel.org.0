Return-Path: <linux-gpio+bounces-14010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1629F78A7
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 10:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F308188B8D3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A85221463;
	Thu, 19 Dec 2024 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QKgmfrK4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B41FCCFF;
	Thu, 19 Dec 2024 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734601205; cv=none; b=uM/WuJSSBrZfTErR3QKMPFF6ZyOO6vtU147igOQsEO0THCFRIVitqP2L79O//WBTGXkVroZVEESgGRsYBnwDgxYdhH65ZTc/JNI4RM3TaturyOwjwzX0u4solqtqAy/gLI3dxMHcEXZ436MEkcuJV0KVN9Pb5fpYs6EU1ohgbKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734601205; c=relaxed/simple;
	bh=asoMtNr/7DDL+ZS1NzT0fU5ntAUMb/bchJkHSjjqXcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kySr533gQ/zRwSY61Nv1rYRSdqNoR4oT2jV60bwDQ09ZIDdVAH94FBf0M8llRgSit+WjogXP4aFKByH+O/HuhObMVTf2SKPEckq0xQUALut/rswG4oNj03+AfhfkIdZx95xOee9x3RKtbqiIe4gHFmXo+iQGtHlt1IxSc2rqYT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QKgmfrK4; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3912020003;
	Thu, 19 Dec 2024 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734601194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rt3bGd+gANsuXeKES7jxLUhMTlz/ejc4AkMBDKGVYGQ=;
	b=QKgmfrK4w2mjYEPybmwCQyRb+8EIbfawwFbyKCeQ4LgCR9L8OIdvbluz1fA4gTZC6rMOhd
	0tHZ9vRlOX5UFOM/GEH7OJXKa/5Gy1yNMQX4ZwUncAinJZ+RLpQnrsgaP+fkLa4InMVQKz
	CWVB5hINoei6CY8P47Z5v9V1QzC2iJP3yUJR9iNtCGgvpOkbe6tSgotJqjEXNBjyaQcF4e
	zw920XluaJzY8E2RAPhX12Qi87+mXtmMWa8YKkH/vWwSUsvPTGYj+GlQ8bAiv3pGzon2GF
	P+nsxg1tKMzuZacarZiIHO96NEVsvwV1Thhme6B37erCSuYtrbSNSnR2Bma7sA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 19 Dec 2024 10:39:46 +0100
Subject: [PATCH] gpio: pca953x: log an error when failing to get the reset
 GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOHpY2cC/x3MywqAIBBA0V+JWTfgowf2K9EibLKBUNGIQPr3p
 OVZ3FsgU2LKMDUFEt2cOfgK2TZgj9U7Qt6qQQnVSSUNRruaXj94Boc+YKJMF7rIAfd+FIOwRms
 9Qu1jop2f/z0v7/sBuHNFx2sAAAA=
X-Change-ID: 20241219-pca953x-log-no-reset-gpio-f57060c93337
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com

When the dirver fails getting this GPIO, it fails silently. Log an error
message to make debugging a lot easier by just reading dmesg.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpio/gpio-pca953x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 272febc3230e90baf370811f498383b9fb12cc6f..be4c9981ebc404ad5c1e1b0ba9f9f948122de462 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1088,7 +1088,8 @@ static int pca953x_probe(struct i2c_client *client)
 		 */
 		reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 		if (IS_ERR(reset_gpio))
-			return PTR_ERR(reset_gpio);
+			return dev_err_probe(dev, PTR_ERR(reset_gpio),
+					     "Failed to get reset gpio\n");
 	}
 
 	chip->client = client;

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241219-pca953x-log-no-reset-gpio-f57060c93337

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


