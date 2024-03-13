Return-Path: <linux-gpio+bounces-4303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6687B568
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 00:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2ED2820FF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Mar 2024 23:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FD45EE81;
	Wed, 13 Mar 2024 23:54:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498285D8F6
	for <linux-gpio@vger.kernel.org>; Wed, 13 Mar 2024 23:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374076; cv=none; b=HJKdN5szVLmSU2bnSLKPqiI05FjuYXHvts9V/jR+WfdYzDL6bASeVsRJxkVTDxSS4XEARF0tzUaScobHtf3wjDK2oWY+N0BxhCJJBgCVZK2XHpSfpAHoHBEB6huh1/pA8LwZS3mHnn/rZskIzrFgCK/oiZptNA17ANgASx1oFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374076; c=relaxed/simple;
	bh=GLJSgRLelWjt7dIinJmYtT1PfasRJUH2zmyz15NzJ20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7v20JlrDWUCJXTgMn+JouJqniP+cSJdH5oZqt36ulfr5WWfYmLaaSOMnmXH8D0YH2dwYQSl3qPYolHzy34/NssuTbDrgTxmFp4vuKKsvcwaUXXTyEgeUwEzH6pKtwf2keUKu4UgcPeIM+ZmeKLnNY4LjqRvnKEd3iwPOeqlnTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 096ee361-e195-11ee-a9de-005056bdf889;
	Thu, 14 Mar 2024 01:54:32 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 08/11] pinctrl: aw9523: Make use of dev_err_probe()
Date: Thu, 14 Mar 2024 01:52:11 +0200
Message-ID: <20240313235422.180075-9-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313235422.180075-1-andy.shevchenko@gmail.com>
References: <20240313235422.180075-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Simplify the error handling in probe function by switching from
dev_err() to dev_err_probe().

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 44b798c39e26b..17c359f9c45c0 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -816,10 +816,8 @@ static int aw9523_init_irq(struct aw9523 *awi, int irq)
 
 	ret = devm_request_threaded_irq(dev, irq, NULL, aw9523_irq_thread_func,
 					IRQF_ONESHOT, dev_name(dev), awi);
-	if (ret) {
-		dev_err(dev, "Failed to request irq %d\n", irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
 
 	girq = &awi->gpio.irq;
 	gpio_irq_chip_set_chip(girq, &aw9523_irq_chip);
@@ -1016,8 +1014,7 @@ static int aw9523_probe(struct i2c_client *client)
 
 	awi->pctl = devm_pinctrl_register(dev, pdesc, awi);
 	if (IS_ERR(awi->pctl)) {
-		ret = PTR_ERR(awi->pctl);
-		dev_err(dev, "Cannot register pinctrl: %d", ret);
+		ret = dev_err_probe(dev, PTR_ERR(awi->pctl), "Cannot register pinctrl");
 		goto err_disable_vregs;
 	}
 
-- 
2.44.0


