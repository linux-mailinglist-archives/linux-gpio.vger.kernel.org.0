Return-Path: <linux-gpio+bounces-6476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C75CD8CA00B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 17:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 693EC1F218F1
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2024 15:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B33913775F;
	Mon, 20 May 2024 15:48:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE45579A;
	Mon, 20 May 2024 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220106; cv=none; b=evn1HarwSEnCwpn4fV0F7EhU8xN05QI9SPw4XR2WKYq9bT2AvVcKjII37TBKPtgOeluEDOsEIOpo6Ze7j4sz6X9jyqx2GrLjHWbinDDtuqMHRFmLADO+FtzTbXTQ7YARv7ISsz0Nz2hkweEQJAU2NQfy2YlnRIdTS0u1EZ34Kk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220106; c=relaxed/simple;
	bh=8sPgUO6A6S54NHecpLAH9MdSYbkpfIj4fhZVkGGxefs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b8xz1l+Vj9JZ19NyFaOb90dM6kFLzIocN3UEhEuuhI88NstcxX/73TgpZdd3zgvjaFceon3hmIjytpLDzdZnmOs87lChb0OUCGaAb9LUXPdbOM90Wxjf79oICnGnq9N46MvOhQh9EnfdqLs2R5OIlNgjKTokrkP7gpOd06HJ9hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost.localdomain (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTPS id B36492003AE;
	Mon, 20 May 2024 17:48:11 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 7035340039; Mon, 20 May 2024 17:47:03 +0200 (CEST)
Date: Mon, 20 May 2024 17:47:03 +0200
From: Etienne Buira <etienne.buira@free.fr>
To: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, etienne.buira@free.fr
Subject: [PATCH] gpio-syscon: do not report bogus error
Message-ID: <Zktwd4Y8zu6XSGaE@Z926fQmE5jqhFMgp6>
Mail-Followup-To: linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	etienne.buira@free.fr
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Do not issue "can't read the data register offset!" when gpio,syscon-dev
is not set albeit unneeded.  gpio-syscon is used with rk3328 chip, but
this iomem region is documented in
Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml and
does not require gpio,syscon-dev setting.

v3:
  - moved from flag to parent regmap detection

Signed-off-by: Etienne Buira <etienne.buira@free.fr>
---
 drivers/gpio/gpio-syscon.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 6e1a2581e6ae..3a90a3a1caea 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -208,6 +208,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	struct syscon_gpio_priv *priv;
 	struct device_node *np = dev->of_node;
 	int ret;
+	bool use_parent_regmap = false;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -216,24 +217,28 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	priv->data = of_device_get_match_data(dev);
 
 	priv->syscon = syscon_regmap_lookup_by_phandle(np, "gpio,syscon-dev");
-	if (IS_ERR(priv->syscon) && np->parent)
+	if (IS_ERR(priv->syscon) && np->parent) {
 		priv->syscon = syscon_node_to_regmap(np->parent);
+		use_parent_regmap = true;
+	}
 	if (IS_ERR(priv->syscon))
 		return PTR_ERR(priv->syscon);
 
-	ret = of_property_read_u32_index(np, "gpio,syscon-dev", 1,
-					 &priv->dreg_offset);
-	if (ret)
-		dev_err(dev, "can't read the data register offset!\n");
+	if (!use_parent_regmap) {
+		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 1,
+						 &priv->dreg_offset);
+		if (ret)
+			dev_err(dev, "can't read the data register offset!\n");
 
-	priv->dreg_offset <<= 3;
+		priv->dreg_offset <<= 3;
 
-	ret = of_property_read_u32_index(np, "gpio,syscon-dev", 2,
-					 &priv->dir_reg_offset);
-	if (ret)
-		dev_dbg(dev, "can't read the dir register offset!\n");
+		ret = of_property_read_u32_index(np, "gpio,syscon-dev", 2,
+						 &priv->dir_reg_offset);
+		if (ret)
+			dev_dbg(dev, "can't read the dir register offset!\n");
 
-	priv->dir_reg_offset <<= 3;
+		priv->dir_reg_offset <<= 3;
+	}
 
 	priv->chip.parent = dev;
 	priv->chip.owner = THIS_MODULE;

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.43.0


