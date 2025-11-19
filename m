Return-Path: <linux-gpio+bounces-28768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D237CC6F51E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 219E24FD8D0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0103624B8;
	Wed, 19 Nov 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpemjFIK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF03612C5;
	Wed, 19 Nov 2025 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562165; cv=none; b=MtRxZswib3G7C3uIdpbPCV3Bqu+lae5XK5LwuG9uYGGsKYyoQD9ml1XfubYfthast2HPa/Myz/CE2Vg/5kwmrJHkqzBH6+MJJLrsxer562V6VSiWaq/XgpcP5e9pls3oxSU2t6sntLjHhMWqL7MbXV2DMpxffr7XOc/GGMWpLSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562165; c=relaxed/simple;
	bh=Y9o/qBfpUr3TD8yDdRfXuJK9HtHcbYA4WdgqHPo4JCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ds5JUbvn+6k7CFTp3HILEvdPILYgYAH+TL2CwjAQUtpw6CGz0jHdOTyySMmwsmJwVafEp92+1KmkMZd0xP5darRJOZM7pOiyihI86UqF7aiRmI0TBgSl3bEgwl3MiMQz5zdja9eczq6jH/JRxyG5/J/2yjQS3/XbWehg3Tuxg1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpemjFIK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222B6C116C6;
	Wed, 19 Nov 2025 14:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763562165;
	bh=Y9o/qBfpUr3TD8yDdRfXuJK9HtHcbYA4WdgqHPo4JCg=;
	h=From:To:Cc:Subject:Date:From;
	b=BpemjFIKxc3GyXpTR5k8T+2Q+s6AhcWJMEzAmD+OF5aqTIlEGdj9KGQ6z8v5yyvkr
	 YRnpP4OZKKksJTtF/2St/CJSfUXO9gv21aJgz4Nm8CR8mLfyNaHPp5DFV+kwOVv2/X
	 6hhvPBkqO2dVVuj7KwwnYVmRlDT1ESZDNl2LRsxVmORa73l3eky8txyR85NMMwJpYq
	 yj0NZnlSrZUESWZK4KUrQZ7samCifpWG7QvuNaimkLG3XEYw/7oh5pwuDc5smFp/Km
	 8FafpD2kKvZ3d/LP9nqsE1W7wWzvPpEuu8H8HPpaNGVRrR/rA4ciX5ZTjng0YtGp73
	 JzvG35cpRRkWQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] gpio: fxl6408: Add suspend/resume support
Date: Wed, 19 Nov 2025 22:04:55 +0800
Message-ID: <20251119140455.10096-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, during suspend, do nothing; during resume, just sync the
regmap cache to hw regs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
since v3:
 - simplify the patch a lot by removing fxl6408_chip wrapper structure,
   thank Bart for the suggestion.

since v2:
 - drop the reset pin support patch since no users now

since v1:
 - fix W=1 build error on nios2 platform

 drivers/gpio/gpio-fxl6408.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 86ebc66b1104..afc1b8461dab 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -123,6 +123,8 @@ static int fxl6408_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	i2c_set_clientdata(client, gpio_config.regmap);
+
 	/* Disable High-Z of outputs, so that our OUTPUT updates actually take effect. */
 	ret = regmap_write(gpio_config.regmap, FXL6408_REG_OUTPUT_HIGH_Z, 0);
 	if (ret)
@@ -131,6 +133,16 @@ static int fxl6408_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
 
+static int fxl6408_resume(struct device *dev)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+
+	regcache_mark_dirty(regmap);
+	return regcache_sync(regmap);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(fxl6408_pm_ops, NULL, fxl6408_resume);
+
 static const __maybe_unused struct of_device_id fxl6408_dt_ids[] = {
 	{ .compatible = "fcs,fxl6408" },
 	{ }
@@ -146,6 +158,7 @@ MODULE_DEVICE_TABLE(i2c, fxl6408_id);
 static struct i2c_driver fxl6408_driver = {
 	.driver = {
 		.name	= "fxl6408",
+		.pm	= pm_sleep_ptr(&fxl6408_pm_ops),
 		.of_match_table = fxl6408_dt_ids,
 	},
 	.probe		= fxl6408_probe,
-- 
2.51.0


