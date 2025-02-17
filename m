Return-Path: <linux-gpio+bounces-16132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87860A383F8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 14:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A40CA1643E3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A326421C191;
	Mon, 17 Feb 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8RXlzdF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CD215F49;
	Mon, 17 Feb 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797692; cv=none; b=F5wDGWtRWytb+SDfkVn/PMcG/C7iBDf2Dupj1wX9Ngj2kVc7CASvAbYS+WDQHzJqzfAx+z4N5meW/ncYThKbxAnZ9XoRZr7kqqMEkJ1s0WlT9ICLLbQnohLhQ2Ui2Dovq3bNWhcF0c7wDsXj6iR2gAxpVrL7Lq9ql/tN4qVxyg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797692; c=relaxed/simple;
	bh=TRuesCIASsENowkyLfM2C67vODr26gLW9azX9UwdM3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoMIZMtUvwO35VGCcjf7fGi/hK+5302mMOWyjynKkHTcFssrvRr5ZMOb4YlyijidULsn8dnLNA4VHTl2NWhjjXdP6tcy//3adsBjp5nktEyjuNZ9VPHM5Vb6+5K/dSXvF2jOglwKyWIRJITkEtQzMQBmNOU7nsW91QYRS86cYpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8RXlzdF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0138C4CEE2;
	Mon, 17 Feb 2025 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739797692;
	bh=TRuesCIASsENowkyLfM2C67vODr26gLW9azX9UwdM3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k8RXlzdFhbS1/8QLQFRhux/AppJcJ6966iFhCyNP69b8K21nF1ZWolxY7zRYIgxrL
	 MNEcwbDqeAb5m+dsBNRJ/IAfa7MTYsip3eFs1D9jHZSGSDDrxu0kINyIrokYJa2klJ
	 1H3/99MDVSLUHPeYydA+bpe2YmDy8QQ16r5eNPw9kKxc7epbPCLV4kYizc7MB4qkuS
	 Kw6l06vJoN3xQ9Ezq2CtsumlrmWjCkgdedUgAfykGA/QmT7zIV3Mp3wJOB/E4JVhba
	 fqLPFMkZ8+TSv690LKNHObopWDorkslZcRsIytAJolY9G9F78HHfD8UKHnmJuQdSL4
	 Pwc7lQ3cNJidA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FA7C021A9;
	Mon, 17 Feb 2025 13:08:11 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 14:07:51 +0100
Subject: [PATCH 1/2] drivers: gpio: Add support for PCF8574T.
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-gpio-pcf8574t-v1-1-137e140df5fc@gmail.com>
References: <20250217-gpio-pcf8574t-v1-0-137e140df5fc@gmail.com>
In-Reply-To: <20250217-gpio-pcf8574t-v1-0-137e140df5fc@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739797690; l=1707;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=NOilr3HjpQ2oJwKALY56/6mHBbZIdGAWuyLI56+xsUI=;
 b=sKvDFTQlBO+NeSz7z25NPSzCWoyS+E5DMNcVsDhEZ2ucbeo25xuwX7zPYjlCj2BtSTvp9VAlo
 wTn92AND2faCHsd5CjQONktugAJCSsLWoG7NodqPsx3MhLfrSobWM27
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Add support for the PCF8574T 8-bit I2C I/O expander.

The driver is tested with:
	+ tools/lsgpio
	+ tools/gpio-hammer
	+ some LEDs

[1] https://www.nxp.com/docs/en/data-sheet/PCF8574_PCF8574A.pdf

Signed-off-by: Tóth János <gomba007@gmail.com>
---
 drivers/gpio/Kconfig        | 2 +-
 drivers/gpio/gpio-pcf857x.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 98b4d1633b25..d7cdc3cc1b00 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1193,7 +1193,7 @@ config GPIO_PCF857X
 	  Most of these parts are from NXP, though TI is a second source for
 	  some of them.  Compatible models include:
 
-	  8 bits:   pcf8574, pcf8574a, pca8574, pca8574a,
+	  8 bits:   pcf8574, pcf8574a, pcf8574t, pca8574, pca8574a,
 	            pca9670, pca9672, pca9674, pca9674a,
 	            max7328, max7329
 
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 7c57eaeb0afe..2464c527a4e8 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -20,6 +20,7 @@
 static const struct i2c_device_id pcf857x_id[] = {
 	{ "pcf8574", 8 },
 	{ "pcf8574a", 8 },
+	{ "pcf8574t", 8 },
 	{ "pca8574", 8 },
 	{ "pca9670", 8 },
 	{ "pca9672", 8 },
@@ -38,6 +39,7 @@ MODULE_DEVICE_TABLE(i2c, pcf857x_id);
 static const struct of_device_id pcf857x_of_table[] = {
 	{ .compatible = "nxp,pcf8574", (void *)8 },
 	{ .compatible = "nxp,pcf8574a", (void *)8 },
+	{ .compatible = "nxp,pcf8574t", (void *)8 },
 	{ .compatible = "nxp,pca8574", (void *)8 },
 	{ .compatible = "nxp,pca9670", (void *)8 },
 	{ .compatible = "nxp,pca9672", (void *)8 },

-- 
2.34.1



