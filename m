Return-Path: <linux-gpio+bounces-20483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E5AC1051
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 17:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 059C53BF648
	for <lists+linux-gpio@lfdr.de>; Thu, 22 May 2025 15:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3B4299942;
	Thu, 22 May 2025 15:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJ+P5ZKq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA9428A402;
	Thu, 22 May 2025 15:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929157; cv=none; b=j2LD4RWUV0Fj2yDJQg55wfGzSHiMeDMAJllVtTtu0PEwMe9ge/YPQfb4bG0k5n19YGbSTsocQYcbJxRjDcBvxB8ttFf6T/Jm8XH5D4wON7OH7g4E1rEAJ2MLFml4h6C6oc61322DYLcXg7MzpuHsywWRNt0WB3UsmahzrXmTS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929157; c=relaxed/simple;
	bh=TuqPvPa0KFbs0i4Sez0e8pGGu8fLrLdtUf67/hwY7zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G903ZQ9EjjURvXKWnc/ucfVPMGuKn+FhEigy8iMqf5+wKl+T0fBh00MW6tF0wYTCHJAFVhS5iuuPVGViiyWC0bFNbAGlG1IU8fraQNyI3v1L5qeMrQwdmZNZWhk1XXUlvL1Aah1117ghzPI/9DuyfzcvjlQgC3jV2LC6RLl87B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJ+P5ZKq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CA03C4CEEA;
	Thu, 22 May 2025 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747929157;
	bh=TuqPvPa0KFbs0i4Sez0e8pGGu8fLrLdtUf67/hwY7zc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VJ+P5ZKqH5Rdk1mgyB73cdhHwdOHir6bn3BPb19mx8Q6GG4qvTftwpu8j7ssYmDsu
	 zv6w9iKoVPqy6VePtl6dB45lV54gNPpsY0RMaG7N0nLjYYq48+9pNdlKkNyTHzLrPE
	 FXWfBDI5MKpNAwStUl0SQtPGGWQqI2pGg2OI1hTLEoZlg4KRpiKWAbH5dWuz9zGXNS
	 pqKvQWnF8tCjuLuk6LkJbSdep9QFE6XuaqKTRXEQURHcF0Z2zaJN4jmlfunSYehSeJ
	 c04Iwhbt8Zg00pfBBQWEUMl5wmCr4t+EiOU8/4P5AK1Qq6UoPRLlkrXToNsXcfTnz4
	 z0EYDZut/LSMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C23FC54E65;
	Thu, 22 May 2025 15:52:37 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 22 May 2025 10:52:32 -0500
Subject: [PATCH] gpio: palmas: Allow building as a module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-gpio-palmas-gpio-v1-1-d6b1a3776ef5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD9IL2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMD3fSCzHzdgsSc3MRiCDvR0jIt2cDELCXZPE0JqK2gKDUtswJsZHR
 sbS0AksojLWIAAAA=
X-Change-ID: 20250520-gpio-palmas-gpio-a99fc046dc7f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747929156; l=1831;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=pgQV1y1p+7TtH8m/CBCGl6uKbuXEGSGVeVp8ilM/kAI=;
 b=SmQgz7oXQiNMOJaWbRJp9qhuVxXfP0XyXez4YXtuQ1dzsIsah1i4l/ZDtEkcCe/3wMrofbDrG
 XZfq4v8sHE0DoajCNESNtRGT59oToTggj5mU7wRU+VIiEHeRUBSllHm
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
index 28dba7048509a3ef9c7972c1be53ea30adddabb0..c70782be502b2719bb30cf3e40065c89ecec3cc2 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -191,9 +191,9 @@ static struct platform_driver palmas_gpio_driver = {
 	.driver.of_match_table = of_palmas_gpio_match,
 	.probe		= palmas_gpio_probe,
 };
+module_platform_driver(palmas_gpio_driver);
 
-static int __init palmas_gpio_init(void)
-{
-	return platform_driver_register(&palmas_gpio_driver);
-}
-subsys_initcall(palmas_gpio_init);
+MODULE_ALIAS("platform:palmas_gpio");
+MODULE_DESCRIPTION("TI PALMAS series GPIO driver");
+MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
+MODULE_LICENSE("GPL");

---
base-commit: b36ddb9210e6812eb1c86ad46b66cc46aa193487
change-id: 20250520-gpio-palmas-gpio-a99fc046dc7f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



