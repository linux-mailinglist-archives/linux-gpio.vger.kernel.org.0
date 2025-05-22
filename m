Return-Path: <linux-gpio+bounces-20510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43615AC1699
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 00:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1E71B60F0A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 22:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5942626FDB5;
	Thu, 22 May 2025 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubxFqvUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0426FDAA;
	Thu, 22 May 2025 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952542; cv=none; b=fYlksbgtLIfQG6KQH9LoMQyuUQrLlTaP+paOe/pnE9ZJO9dpqO4HF/PHoznLnAq/dVyjXY7hLSAAaEj7EnE+Pjvx5tDqmC6pyzO7X5lB4NsmqWwqFTRRQymwzyKmv4YuOF45VYdFEdqKMGVEQdZu7IIvtw3ZLueiJ2VTxG+jIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952542; c=relaxed/simple;
	bh=8Heg3DYrKI2MOyzC5jsXnWtT8wSPjc+SWAPoe7WiKBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ifGajMm3rjFI2MBdy5Y4/utcE7wOJSkUvNHWKuRfczlSNGFoDjnu2k7uw9JE3QtLd1qP1vQdGXrVH1OMwv4biGYb+TstoUYLLfNES8JQXn5XWbOSFsCXAClBJ+fbJODSPo5QylqQb3+d1UVk1+EVFpFUxy0p3I9KvFWTyPfLExU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubxFqvUo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8AB9C4CEE4;
	Thu, 22 May 2025 22:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747952541;
	bh=8Heg3DYrKI2MOyzC5jsXnWtT8wSPjc+SWAPoe7WiKBY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ubxFqvUoYDRVP5MUA5zRABi20ocrjC3B3cGsBzu1fDbzt6yUuZlWg3N9fUgTIPR1x
	 J2N823+a6gq+M+lT7Uz7E3N4WXgRmV/2+ZD8RC4GJHdRDFRam/go8NkE0gh9f7cML/
	 tbql1Y8ffRjIVMm0AMvi34T5hvb8Aavwute1UKxYUCylNi2FjgP9qEX5Nd2oyYMo6s
	 Bz0OkPoyOJ33VGLpGSbys9yUu/0jENUQelRbQlhMvMkkHLHUvotC++qXTPMfo/BIU5
	 1RulqyQx9OSHe+W2ZWK1jz9PEMSRi3zXXLMA+w7mvcMpdHlVnxlVajkFt+FwDZ5ko0
	 HyrmVnGuD7GqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8C6C54E65;
	Thu, 22 May 2025 22:22:21 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 22 May 2025 17:22:20 -0500
Subject: [PATCH v2] gpio: palmas: Allow building as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJujL2gC/2WNyw7CIBREf6W5azGAUlJX/ofpAnm0NymFgCGah
 n8Xa1y5mzPJnNkg24Q2w6XbINmCGcPagB860LNaJ0vQNAZOuaCCUzJFDCSqxav8zWoYnKbn3mj
 poM1isg6fu/I2Np4xP0J67Q+FfdqfjP/LCiOMmP7O1EnK3jpxnbzC5aiDh7HW+gbqsFKLsAAAA
 A==
X-Change-ID: 20250520-gpio-palmas-gpio-a99fc046dc7f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747952541; l=2236;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=tHJHuNFICwcMsJaMONFWu87HoiCqqBLOs7mW/BwS8Qs=;
 b=wjo5VcVlO2btnmfx0266CVRxnVr1EpSH6HyMKfW2hpC4VXMan3s9ZypYctSCT+tCWz4yi8aqg
 N+8dKltnCWxAF3STuQg0hntmj4lnmaEht1kCuZ6Ls976WNF/fjzsSJZ
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The driver works fine as a module, so allowing building as such. This
drops the driver specific init in favor of the module macro which does
the same, plus handling exit.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Drop module alias and add module device table
- Link to v1: https://lore.kernel.org/r/20250522-gpio-palmas-gpio-v1-1-d6b1a3776ef5@gmail.com
---
 drivers/gpio/Kconfig       |  2 +-
 drivers/gpio/gpio-palmas.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

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
index 28dba7048509a3ef9c7972c1be53ea30adddabb0..eaef29f59292de5281f31e196961d90974e65b75 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -140,6 +140,7 @@ static const struct of_device_id of_palmas_gpio_match[] = {
 	{ .compatible = "ti,tps80036-gpio", .data = &tps80036_dev_data,},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
 
 static int palmas_gpio_probe(struct platform_device *pdev)
 {
@@ -191,9 +192,8 @@ static struct platform_driver palmas_gpio_driver = {
 	.driver.of_match_table = of_palmas_gpio_match,
 	.probe		= palmas_gpio_probe,
 };
+module_platform_driver(palmas_gpio_driver);
 
-static int __init palmas_gpio_init(void)
-{
-	return platform_driver_register(&palmas_gpio_driver);
-}
-subsys_initcall(palmas_gpio_init);
+MODULE_DESCRIPTION("TI PALMAS series GPIO driver");
+MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
+MODULE_LICENSE("GPL");

---
base-commit: b36ddb9210e6812eb1c86ad46b66cc46aa193487
change-id: 20250520-gpio-palmas-gpio-a99fc046dc7f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



