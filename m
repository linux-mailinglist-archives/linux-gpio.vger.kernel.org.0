Return-Path: <linux-gpio+bounces-4174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50F873BF8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 17:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12951C24217
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 16:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9939B135A67;
	Wed,  6 Mar 2024 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hCJvtefM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E31EF1C
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 16:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709741991; cv=none; b=Do3I5VMcR0eSNznpR2gmHPt0KIw8mq1y5hMPAa+ZEXfdjmzQiWuG+k07tfDvT9puEGFSCbGgRqGebmOQ5cw2Z6h0Uxhlos/RBRba3EQT9lhscK/GfLVbtS0SjIShR9PiJoohPUtgEp48H/GNrk1USbUpHUt+EzGi0zezSdDtZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709741991; c=relaxed/simple;
	bh=JNDXqGalVWym56X3SjJMw3OpAUpJcLTT/FK1xeGd5Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UGP1ZJ/eu6ZGR2AfXbybO9FLwr7dbaG/sPYxOLp8NYSjfFTcLmwMXG7F89DjjkSehESJtoDSR2LdEW+Ne4NhVJurLrR6i8IflLVjF0CYy7j8wpFZWb84ELp5xhK2nsmyeTQ+sVVY0HA48XHNNGfwzA2lTp1WW0K2FFN/79BptgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hCJvtefM; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC4C760005;
	Wed,  6 Mar 2024 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709741986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YYUgi6y98rVwXF9/HCwv2EL6n26X0lsTIfuWkZhJcug=;
	b=hCJvtefMWw1xEeLzlaTXz+rs/sCcf/4FPRE32cDZLhkqcEeuQs4uvIoTS24gQhT9VR6esW
	h52L9y1qJjYYX01d9deD2sdofUtgT9XDKeedYUVzlKEpQVumX9q1dShbeBaF3oV23e70Jj
	TjeP/L2usYe/ReDhWTxVUWSVg3yEpIEsm21zk02hTBhEKIFbCDrmoMeEE3eUEkqaciZznj
	IohFj1YLvQbwQq1Lo9cmB7X9QhtjdA2wWe5+D2eYPM6AScvb0w6G/H/mJ7FIVZVCi59SsH
	aKAsbKvZ31LbHDTdRgetLt+WPNy25nDBAl889hviEBHv1UddEuhFcbCirVG/hg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 17:19:45 +0100
Subject: [PATCH] pinctrl: nomadik: fix dereference of error pointer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-gpio-err-fix-v1-1-a3605ba2336f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKCX6GUC/x2MSQqAMAwAvyI5G+jihl8RD7VGDbiUFEQR/27xO
 AMzD0QSpght9oDQyZGPPYHOM/CL22dCHhODUaZQVlW4DeuNc+ADSQQnvrC0VuvG1xPVDlIXhJL
 +n13/vh+UmCuuYwAAAA==
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

If nmk_gpio_populate_chip() returns an error, avoid deferencing its
return value.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-gpio/5ee722f8-7582-420d-8477-45be6acde90f@moroto.mountain/
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Fix a smatch-reported potential bug. Thanks Dan for the bug report.
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 47d5484f6bdf..cb0f0d5a5e45 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1228,9 +1228,10 @@ static int nmk_pinctrl_probe(struct platform_device *pdev)
 		if (IS_ERR(nmk_chip))
 			dev_err(&pdev->dev,
 				"could not populate nmk chip struct - continue anyway\n");
+		else
+			/* We are NOT compatible with mobileye,eyeq5-gpio. */
+			BUG_ON(nmk_chip->is_mobileye_soc);
 		fwnode_handle_put(gpio_fwnode);
-		/* We are NOT compatible with mobileye,eyeq5-gpio. */
-		BUG_ON(nmk_chip->is_mobileye_soc);
 	}
 
 	prcm_fwnode = fwnode_find_reference(fwnode, "prcm", 0);

---
base-commit: 7d2b279d9db028a2c1095668296defb18aabcb0f
change-id: 20240306-mbly-gpio-err-fix-533118c7fe7a

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


