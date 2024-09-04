Return-Path: <linux-gpio+bounces-9767-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBD96B644
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67FA41C21EE1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCCC1CC886;
	Wed,  4 Sep 2024 09:16:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E9A155C96
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725441394; cv=none; b=sAqDUw519ZCjF7PezplwDvrYy2YW5hDqoZAsC3ApHOF+Q5vn7R3Hifkp4JOWkubbX/Fj6Z03TDmkNOp4Yv7D5pwRxORpkk5o1Lo+IMyQsq53nUaUxNpuOSqf4zBbQYoj06AOK2bVYIKS5xFr+rJRNBXWwg6H2keClY4OIPlj20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725441394; c=relaxed/simple;
	bh=EtwVs8+yScxbL9IdzxYu1juaHCYRmOBjWIfoNYxCCO0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XgiImVZBv7CVpodH7pEn/Y5Xg5uhOLv1bIcGwLruN4YwrlNBtFhusP2m0QGB3qyWa/sr4eLWRyK//SSSLqt5+Cv5AIdJ7697P5lreZxunUZr0OvN+RsBo/UtcUJmUuRK5l/jtEJpdUL3bHJUkygBLw20KEPfp1SgAHA/Lg94+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4WzGrb4XbCz50SBQ
	for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 11:09:03 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ef52:68c5:eac1:f6b5])
	by albert.telenet-ops.be with cmsmtp
	id 898v2D00T3m5in10698vWk; Wed, 04 Sep 2024 11:08:56 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slm0S-0026XW-PT;
	Wed, 04 Sep 2024 11:08:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slm0V-0044NM-Fh;
	Wed, 04 Sep 2024 11:08:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Damien Le Moal <dlemoal@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: k210: Make (p)clk local to k210_fpioa_probe()
Date: Wed,  4 Sep 2024 11:08:53 +0200
Message-Id: <77f543046d4d5c19206f829ddcf8e093d3e3f6da.1725440917.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were never any users of k210_fpioa_data.clk and
k210_fpioa_data.pclk outside k210_fpioa_probe().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinctrl-k210.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 0f6b55fec31de700..caf20215aaba5e9b 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -96,8 +96,6 @@ struct k210_fpioa_data {
 	struct k210_fpioa __iomem *fpioa;
 	struct regmap *sysctl_map;
 	u32 power_offset;
-	struct clk *clk;
-	struct clk *pclk;
 };
 
 #define K210_PIN_NAME(i)	("IO_" #i)
@@ -925,6 +923,7 @@ static int k210_fpioa_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct k210_fpioa_data *pdata;
+	struct clk *clk, *pclk;
 
 	dev_info(dev, "K210 FPIOA pin controller\n");
 
@@ -939,13 +938,13 @@ static int k210_fpioa_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->fpioa))
 		return PTR_ERR(pdata->fpioa);
 
-	pdata->clk = devm_clk_get_enabled(dev, "ref");
-	if (IS_ERR(pdata->clk))
-		return PTR_ERR(pdata->clk);
+	clk = devm_clk_get_enabled(dev, "ref");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
-	pdata->pclk = devm_clk_get_optional_enabled(dev, "pclk");
-	if (IS_ERR(pdata->pclk))
-		return PTR_ERR(pdata->pclk);
+	pclk = devm_clk_get_optional_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return PTR_ERR(pclk);
 
 	pdata->sysctl_map =
 		syscon_regmap_lookup_by_phandle_args(np,
-- 
2.34.1


