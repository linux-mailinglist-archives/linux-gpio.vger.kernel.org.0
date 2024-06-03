Return-Path: <linux-gpio+bounces-7042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 995888D7D2D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2EFB1C2166B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24CB56458;
	Mon,  3 Jun 2024 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kJcZnF1n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E854AEF5;
	Mon,  3 Jun 2024 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402897; cv=none; b=D+KN/cE+PyabmZZanO5OPXQiNN7baGdo0XmRe3egWXDlAHBNesKOU8p+lCl04NfmBig1XOtzpIERVT3TnXYztsDms6u/40uQqvyf1uL97gUgTGK39k89jMlB9RPBG65010Eift2K/nMPJk+pLCymq65McoYXzkrhomdIDvr/mAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402897; c=relaxed/simple;
	bh=OfJ1v8LmA6mNpHYBeRjLRPtYp398TYQP1NikawbZ4jY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kuNKzo1raFdgzVgrtYwsSpBfuz5mDBLyC3MZy5AfRHgpeKEi0dM9xE0W8i/R3yodIQNvJGm45O9Vi7gkhnvSJkvvnUr3MDlKjwaE0xJSuxg71xYdJK+oiq5VEkzr52EMx2sDG9gl27aE4crG9NdyntWrO92CpZ+ZWXV+9sSDMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kJcZnF1n; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34227C0011;
	Mon,  3 Jun 2024 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717402888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gu2XHe19XSpb+VgVm3wUODziOEYkalPD1w4V/84MF8c=;
	b=kJcZnF1n3JOnk/MuEuZ3dn0jMOkEUPkoA0y6a3fiqJKuiYG7mKAiV+UysAK0+OFxrnaxam
	l2zvuoKGM1M6zNAYuzOvd0JeSHuYftBF42IkMbC0RVwM/xiDO7u/7XT3SCB6YCRq2vY2jg
	o2QqP2QJ8+TAVEUEGnM1P6o3m0OFldV30Zr4jY5qwgLDu2842RzR8bdPlRP2PP7pCUbrqU
	8lNFn/BN5ZsJKa058PVdubPh7GdONG8ZtmUTqn7oUNPtz+fHAOlojCfXD8BIqhJmECtBoY
	VKamKtM1e6FWe0b96A7McX9Z9IyHPhFpCpFzHCKJqpwjNDiAt0UwkkycajMwuw==
From: Thomas Richard <thomas.richard@bootlin.com>
To: linus.walleij@linaro.org
Cc: m.nirmaladevi@ltts.com,
	bhargav.r@ltts.com,
	lee@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	u-kumar1@ti.com,
	gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH] pinctrl: tps6594: add missing support for LP8764 PMIC
Date: Mon,  3 Jun 2024 10:21:10 +0200
Message-Id: <20240603082110.2104977-1-thomas.richard@bootlin.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

Add missing support for LP8764 PMIC in the probe().

Fixes: 208829715917 (pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl and GPIO)
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---

Issue detected with v6.10-rc1 (and reproduced with 6.10-rc2) using a TI
J7200 EVM board.

tps6594-pinctrl tps6594-pinctrl.8.auto: error -EINVAL: Couldn't register gpio_regmap driver
tps6594-pinctrl tps6594-pinctrl.8.auto: probe with driver tps6594-pinctrl failed with error -22

 drivers/pinctrl/pinctrl-tps6594.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-tps6594.c
index 085047320853..5e7c7cf93445 100644
--- a/drivers/pinctrl/pinctrl-tps6594.c
+++ b/drivers/pinctrl/pinctrl-tps6594.c
@@ -486,6 +486,7 @@ static int tps6594_pinctrl_probe(struct platform_device *pdev)
 		break;
 	case TPS6593:
 	case TPS6594:
+	case LP8764:
 		pctrl_desc->pins = tps6594_pins;
 		pctrl_desc->npins = ARRAY_SIZE(tps6594_pins);
 
-- 
2.39.2


