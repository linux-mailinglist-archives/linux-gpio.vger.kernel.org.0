Return-Path: <linux-gpio+bounces-21124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C170AAD1CAD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 13:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97CA3A3334
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jun 2025 11:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E6622ACF7;
	Mon,  9 Jun 2025 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MhmnjE03"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71CF1DE2C9;
	Mon,  9 Jun 2025 11:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749469901; cv=none; b=Uja6qYqcEGEARbbb+vpXjLVkIrOAR80JyIyd4u0L1MkGOqnVIaSniPy+N71gts7+G0NOnLVi/4yHzsSIsNHXhSVVOVfszBaVqIZkWxkHHd58W/aPa7xD3FbGQ0Xoz3lRtFFfwxbWVBLFTCBE+LUWQqCXgJxZXsuAb2fbGq8RsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749469901; c=relaxed/simple;
	bh=wRnzep0un26/I6l2B9rLwcxLBqjgLGGglUlDx+xg5MQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CnCMG+S6xUIKZAxbNuNUVAzW6ZYiGiRKLe2ccKYMNufYX18q5Fe6l2gsvSL64zEK+UoXH0eRU8NLpEfHMYcGXsI4iua4OYQRATr036B0koSpVkje5Vl+GfoJRl6RC4vGmGvaZDTQSoN8ZQvk8Zvh65XlPvZh3atsDB+AohJaqC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MhmnjE03; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C045D439F7;
	Mon,  9 Jun 2025 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749469889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V3C4n3ou7ij5UokZQiLqkdL4RwROiCMcbEbk2tj+ftE=;
	b=MhmnjE03JZ4ZUzUFi628UWJeHoA4CxpNFhowA8nz0Mq5itorCsof1S5dJ/sPtEIBFbo1Jk
	Hwy9sKtXMoE+VsshcCvWY4aQi05oMVWEaNGYjo1T0dR8W+EBZw9E4OIz81AGzdwAlM8n75
	2S+VvR+H07zXSDHTo48yn8Sq4KUIZFSqhQfVvTrnquZZj6UCWEoHoDpFDd6fbQpyznWbrC
	A4WGlnLqKUz40b7mb/ENkP4GxS/W4M7EmGv0N4rUlnfvOZAh01XVgUGi4BFenPxDeeMxCY
	MQyOkQ2VCAYBSi5zwXQEJ94eZHPYAx5IUAPY9ZA4FFH6YDYqKg3JUAVp2NpqFQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 13:51:15 +0200
Subject: [PATCH] pinctrl: cirrus: madera-core: Use
 devm_pinctrl_register_mappings()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALLKRmgC/z2NQQqDQAxFryJZNxClCvYqpYs4E8dAnQ6JiCDev
 UMXXb734f0TXEzF4dGcYLKr6ydXaG8NhIVzEtRYGTrqehpoxKI5bPbGlaMYY5R9/TuTpL6J1bF
 Ulxx5IKYpTGPb36E2i8msx+/v+bquLx4RDJl/AAAA
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgffgffejtdeivdeifeeltdffgfeludekudeiueffffejuedvgfejteeuffegtdenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrthgthhgvshesohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomhdprhgtp
 hhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrfhesohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

Use devm_pinctrl_register_mappings(), so the mappings are automatically
unregistered by the core. If pinctrl_enable() failed during the probe,
pinctrl_mappings were not freed. Now it is done by the core.

Fixes: 218d72a77b0b ("pinctrl: madera: Add driver for Cirrus Logic Madera codecs")
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Compile tested only.
---
 drivers/pinctrl/cirrus/pinctrl-madera-core.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index 73ec5b9beb49..d19ef13224cc 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -1061,8 +1061,9 @@ static int madera_pin_probe(struct platform_device *pdev)
 
 	/* if the configuration is provided through pdata, apply it */
 	if (pdata->gpio_configs) {
-		ret = pinctrl_register_mappings(pdata->gpio_configs,
-						pdata->n_gpio_configs);
+		ret = devm_pinctrl_register_mappings(priv->dev,
+						     pdata->gpio_configs,
+						     pdata->n_gpio_configs);
 		if (ret)
 			return dev_err_probe(priv->dev, ret,
 						"Failed to register pdata mappings\n");
@@ -1081,17 +1082,8 @@ static int madera_pin_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void madera_pin_remove(struct platform_device *pdev)
-{
-	struct madera_pin_private *priv = platform_get_drvdata(pdev);
-
-	if (priv->madera->pdata.gpio_configs)
-		pinctrl_unregister_mappings(priv->madera->pdata.gpio_configs);
-}
-
 static struct platform_driver madera_pin_driver = {
 	.probe = madera_pin_probe,
-	.remove = madera_pin_remove,
 	.driver = {
 		.name = "madera-pinctrl",
 	},

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-pinctrl-madera-devm-pinctrl-register-mappings-a60a0bcb9154

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


