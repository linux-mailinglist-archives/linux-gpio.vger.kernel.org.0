Return-Path: <linux-gpio+bounces-22664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAFAF6116
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 20:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A6851C40C30
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 18:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A4F2E498F;
	Wed,  2 Jul 2025 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8tDE0kA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7DD2E498A;
	Wed,  2 Jul 2025 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480579; cv=none; b=Nw6xzuHazS9ddiLUUCL/2AFKKUfaSKa+3j4oC4y+XWWJaD06WcA2KUH2vXn7MLQe3RwwnlgmMYZk87oWpli26+DHaWvE6LN00Toe5d6+ILaBMDOp/boh0jh8tDGdlmNf2dWd5EKcdf3SDp5Nq5nFIP6w7FXpYIWeT2SpnC23hf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480579; c=relaxed/simple;
	bh=YP2MPlGskJVnWUdfQs7e4oSd7UUpWeF7Jwjc0h89YJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i3hEf/yc8PjFyGwJuZPrSWKksLNQ9K1cgviiLRU4kymD9Wd4we/GkUWgmQp+t1aMx3Ed8UmGWvR+86gtQ8eJ8dfSHZpcLeUwag5NykG7kAaTu4wB5NK3PFAln7vyNFvhGMYIYcME4ikkRsTLSvGbdsOHXTiMVhzFw2Sw8C0E1TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8tDE0kA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF3A1C4CEE7;
	Wed,  2 Jul 2025 18:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480578;
	bh=YP2MPlGskJVnWUdfQs7e4oSd7UUpWeF7Jwjc0h89YJ0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Y8tDE0kAH4/TrIa93i3aDgxU8CLD/LJ9ixes9THs8dcrY6RHG5vzkHtvnMFCKRcB7
	 rpZhd8OcC7Lux0V4c0DmSo5CWr3fiBgWmD3NtXghL49BrXNKs4bukEcwJOH7S2RgcZ
	 QXQktT4kSKhZm0MUhnMjfjLdnXI0cX2qpxnJm9ai3tqhn8qaKenT4fKg16ojYAGR+W
	 imM4SRgtle8Eb/y7JD0p0hLHgaDpphX0Vnh3kSlJeoW6OwS4O3v7+Oj3q5ZBap2CDh
	 FMvz+CLtfeKYyOcvIwPL0AhrcfbIgl0Bai8t0P7kdNCADJI/DoBJNmqbTvJfbMO4SY
	 SlKa8pbX5k80Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D957C8303C;
	Wed,  2 Jul 2025 18:22:58 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 02 Jul 2025 13:22:51 -0500
Subject: [PATCH v4] gpio: palmas: Allow building as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-palmas-gpio-v4-1-26ba48252f27@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPp4ZWgC/4XPywrCMBAF0F+RrI3k2RhX/oe4SPNoA21TEglK6
 b+bVkRRwd3cgXuGmUCy0dsEDpsJRJt98mEogW03QLdqaCz0pmRAEOGIEwSb0Qc4qq5X6TErKZ1
 GrDJaOFBqY7TOX1fydC659ekS4m29kPGyfWLkG8sYYmiqGisqRGUdPza98t1Ohx4sWCb/AFKAv
 XQEScOUZPIToC9AoF8ALYAt/1BqUa05ewfmeb4D6FVqUTIBAAA=
X-Change-ID: 20250520-gpio-palmas-gpio-a99fc046dc7f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751480578; l=2399;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ivC7eqcoxMdy7HJHAY3izwyHHqtk1ICVncUYA+Giqr0=;
 b=7/hqoROkVeC0zMqs0IU+Xu0Uq8nlXGOZLpZ73PiK44wpaf8kKhKH4HADhq0fUZUSvVPkPH3UU
 iP6hE9FDpkUBIM0WpDBtjICRNpeop1Tif5EApuZsa8wnr/WXODVlDwD
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
Changes in v4:
- Rebased on next-20250702
- Link to v3: https://lore.kernel.org/r/20250702-gpio-palmas-gpio-v3-1-e04633e0bc54@gmail.com

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
index 44f922e10db2f8dcbdacf79ccd27b0fd9cd93564..dcea3c1bb31c81cafb88a66a4c25ed28090612c0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1501,7 +1501,7 @@ config GPIO_MAX77759
 	  called gpio-max77759.
 
 config GPIO_PALMAS
-	bool "TI PALMAS series PMICs GPIO"
+	tristate "TI PALMAS series PMICs GPIO"
 	depends on MFD_PALMAS
 	help
 	  Select this option to enable GPIO driver for the TI PALMAS
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index a076daee00658a9e423a0d78f14ad48d61956d7a..9329d8ce8f59842cfe95f41b85c8e5ea6bf440b8 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -139,6 +139,7 @@ static const struct of_device_id of_palmas_gpio_match[] = {
 	{ .compatible = "ti,tps80036-gpio", .data = &tps80036_dev_data,},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
 
 static int palmas_gpio_probe(struct platform_device *pdev)
 {
@@ -196,3 +197,13 @@ static int __init palmas_gpio_init(void)
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
base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
change-id: 20250520-gpio-palmas-gpio-a99fc046dc7f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



