Return-Path: <linux-gpio+bounces-22554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC7AF0AFA
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 07:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2F23A6D23
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 05:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCE71F5820;
	Wed,  2 Jul 2025 05:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tx7K539G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034761E5B70;
	Wed,  2 Jul 2025 05:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751435793; cv=none; b=h0QIPGElHyk1YSiC2kdBTrKlWTSsDaSADWjnc1/XoKPe8+iAOmKca9X7KFKueY/i3+hl9Lh83nOuMRSbukqZQelVM1XtmWkzmvoXHzozySZBU2WszRbeBfEc30Fy2L0o5OIL9dBuqSFbZJbJX8WonD1RegKke3x4Yob8xVnOx3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751435793; c=relaxed/simple;
	bh=jslbkJL0O5bOdAAZ/MmetGmEMVRPjlROegRHIkFK8Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cm/Z1yuTJiyG7pPDLF0TRJefMMbAgAU1UkjR7a6sLtgLD1RiWcDV2jUz5FI6jYnq3uPlUYRujY8AXlfoasC+2tWoSPuwBRxTS7LuqocgA9ez6pKLhStEG5fbxKfaGs1V5Fq/Oq5FRSFDeggXwO468fweRITI/UjdhA2B484pA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tx7K539G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87327C4CEEE;
	Wed,  2 Jul 2025 05:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751435791;
	bh=jslbkJL0O5bOdAAZ/MmetGmEMVRPjlROegRHIkFK8Rs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tx7K539GA8ZhaA5D+SukCGIJ/hTulbUlFsH8qIPpBLESPotpZv7p1xmyulsAUh2f7
	 hvEd7I5QD8JqnXFUmR5VKXKCzsCTz3o8x51LxvdTnChuKyjJGju/mhnVwJBoSMYdrt
	 QLnkjqi25J/IowN6o6EAPX+gno4efjEBASuVKNZneIOsYOafnn21EtUP5jo1kk3EyS
	 2hffpVO60KvIsAHZz1UzrHkZ/iVvQY+rEJbIsPIUCV5puZ1vI8ZGbQaVF5z5RK4yrJ
	 E+cZPPPrU3/Yk+lqnu3dKywl7aOVn+yh5OliJ+u5jrnZE54J7bCrV+pB3iiQqnR0TP
	 1Nfhmi59U6tNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7404EC7EE30;
	Wed,  2 Jul 2025 05:56:31 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 02 Jul 2025 00:56:26 -0500
Subject: [PATCH v3] gpio: palmas: Allow building as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-palmas-gpio-v3-1-e04633e0bc54@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAnKZGgC/4XNSwrCMBCA4avIrI0k6cu48h7iYsyjHWibkkhQS
 u9uWhEEF+7mH5hvZog2kI1w2s0QbKJIfsxR7HegOxxby8jkBsllxSvJWTuRZxP2A8b3jEo5zcv
 a6MZBPpuCdfTYyMs1d0fx7sNz+5DEuv1g8hdLgglm6pvAomlq66pzOyD1B+0HWLEk/wEyA0flJ
 FemRFWqb2BZlhe1sK618QAAAA==
X-Change-ID: 20250520-gpio-palmas-gpio-a99fc046dc7f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751435790; l=2298;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=wuPE+Xa58DGHAJ94TOlU6rlu8eroAUhZO7AO/CSPQEY=;
 b=iYX8TbCNm5Bdn/chuijhB+twCaPd6mcIeWGhUpxAQnndjZBy+dh3QaEZLvHY1b7jGyAXRm/fl
 sNHA7INVOLECzegyyW6+4F5xWqVes+IwNKrXFlwiv66T0AsvcrXLQ6N
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The driver works fine as a module, so allowing building as such. This
adds an exit handler to support module unload.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v3:
- Drop use of module init macro and add exit handler
- Link to v2: https://lore.kernel.org/r/20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com

Changes in v2:
- Drop module alias and add module device table
- Link to v1: https://lore.kernel.org/r/20250522-gpio-palmas-gpio-v1-1-d6b1a3776ef5@gmail.com
---
 drivers/gpio/Kconfig       |  2 +-
 drivers/gpio/gpio-palmas.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f2c39bbff83a33dcb12b2d32aa3ebc358a0dd949..be5d823516d0e2bff4b4231dac6a82bf10887118 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1464,7 +1464,7 @@ config GPIO_MAX77650
 	  These chips have a single pin that can be configured as GPIO.
 
 config GPIO_PALMAS
-	bool "TI PALMAS series PMICs GPIO"
+	tristate "TI PALMAS series PMICs GPIO"
 	depends on MFD_PALMAS
 	help
 	  Select this option to enable GPIO driver for the TI PALMAS
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 28dba7048509a3ef9c7972c1be53ea30adddabb0..232b3ac52b3362c33ea8b068d5932f682816a5e4 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -140,6 +140,7 @@ static const struct of_device_id of_palmas_gpio_match[] = {
 	{ .compatible = "ti,tps80036-gpio", .data = &tps80036_dev_data,},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
 
 static int palmas_gpio_probe(struct platform_device *pdev)
 {
@@ -197,3 +198,13 @@ static int __init palmas_gpio_init(void)
 	return platform_driver_register(&palmas_gpio_driver);
 }
 subsys_initcall(palmas_gpio_init);
+
+static void __exit palmas_gpio_exit(void)
+{
+	platform_driver_unregister(&palmas_gpio_driver);
+}
+module_exit(palmas_gpio_exit);
+
+MODULE_DESCRIPTION("TI PALMAS series GPIO driver");
+MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
+MODULE_LICENSE("GPL");

---
base-commit: b36ddb9210e6812eb1c86ad46b66cc46aa193487
change-id: 20250520-gpio-palmas-gpio-a99fc046dc7f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



