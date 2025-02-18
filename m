Return-Path: <linux-gpio+bounces-16172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93970A38FF0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 01:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61F1C171D2C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 00:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55A8C2FA;
	Tue, 18 Feb 2025 00:32:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0627F6FB0;
	Tue, 18 Feb 2025 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739838730; cv=none; b=jswDo1DITmQjrav6aUQLzCTA5PoH8x+ae89AFlHq6c8FT3vstI0PMMAu4v14NPERztmlgUVvqBNLT4UdJBxq9doHJjUIw41dLYIrnbYnFt71rMM+gWoEgSI+JDwWaXmbUsLUP9jySDXT5tyJZmXRzUimXs6fkTNwb05QVFWEF78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739838730; c=relaxed/simple;
	bh=qyQ+sKQ9+9qwFMd1kJ+yVxNWqzCvsbg6kJ8Eskv5KLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GQeEfKpueyFe6XX+VJRUx/K3IDPPR3u2WGjwNkVL4DTK+aPlrvL+rTP7Gu1cU27u6c47h5Qs4+Y1gSgcYoMij2oLmKVh902CU4GJa3KcQN0V4VWWF8oXp4m9WR+vcMCRvLYnXDpy1jwGY0PVivOjUrp8u2AhnXdN5ngzk0tslyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CCCAE34311C;
	Tue, 18 Feb 2025 00:32:04 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 18 Feb 2025 08:31:44 +0800
Subject: [PATCH v3] pinctrl: spacemit: enable config option
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAO/Us2cC/33NwQ7CIAyA4VdZehYDyNz05HsYD2PtNqIBAoRol
 r27bCdNjMe/ab/OECkYinCuZgiUTTTOljjsKuinzo7EDJYGyWXNJW/YXTBvbJ/CgzmfyjZDqjU
 OeNRKEpQ7H2gwz8283kpPJiYXXtuLLNbpPy0LJhi1XUMKW8XVcBnJJuf2Loywcll+EEL+ImQhN
 FKDHdc9x9MXsSzLG7kdA572AAAA
X-Change-ID: 20250207-k1-pinctrl-option-de5bdfd6b42e
To: Linus Walleij <linus.walleij@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
 Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=qyQ+sKQ9+9qwFMd1kJ+yVxNWqzCvsbg6kJ8Eskv5KLc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBns9UBSIp+GNcJNVHURIgB8oPCS3L3QZGyR4P2i
 FL+slJ0ueyJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7PVAV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XAFD/4wY7mqXi03X/kJnX
 OIHfqEC5cMQcF39mdaTPKlK2HDQQHBC0OfzfIA7i8SuJX1e633Gi6uI6s5rCY34hAQAM7b3RFN7
 el1uJyPSKRj9X2s3wi4QukxcwlaOD0qZohO+lqiGJZ4+rGwOgmH4Vy0++fHLhYpxdxKnhf0acvq
 nsfd+7cRSpREVwn68nOU1yKdbHrdaQYTUt6UT91SXtXUb61tuEONg9SRyq1wOi4VocxjwpDT+SR
 X+gNJCO+uuTWJ2ipOddY/3FQW5xlFEqKILs0bYuNz11EZ/mfeeBhS2FlgyeKCt1bdgqHE/HIQtn
 xN7qz9BS/wd16SlASObe2/2E3y9e3N0+hFOrnDPtusL11uzZsP3oY7Io9MH4ps2nU2zADnuyBfq
 H7dTEKpXz8lc3GiQ0MOo5wsYyRBB6YHc5V1A6b2H54j+4flN6PxxGh6uCEZDo7XZOuboi2Svt3D
 1SKB7gsfD4zYTnTjEOTQ9kEVAuXrfXJgFo2FBe4VQdUCRMOBTLlnNtlxsJSuXoCALgEqZ3hlvXa
 Grg9Rs4Q5+UJ/rpjYl4qeX9cy5LzlBMCYMh0/qXkTFVeHoZhNMjLRCR+jYbGsdvWLXo22Q2kr+I
 y4FcPIW56C+1ZmQZR/zg24Og3rxcyVia0kqIJi3pq2bmfmqYTepGwSxI5pkQdnyXcwOg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Pinctrl is an essential driver for SpacemiT's SoC,
The uart driver requires it, same as sd card driver,
so let's enable it by default for this SoC.

The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
'make defconfig' to select kernel configuration options.
This result in a broken uart driver where fail at probe()
stage due to no pins found.

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Reported-by: Alex Elder <elder@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
when using make defconfig, thus fail to initilize uart driver which requst
pins during probe stage.
---
Changes in v3:
- switch PINCTRL_SPACEMIT_K1 from tristate to bool
- Link to v2: https://lore.kernel.org/r/20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org

Changes in v2:
- set default as y
- Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
---
 arch/riscv/Kconfig.socs               | 1 +
 drivers/pinctrl/spacemit/Kconfig      | 3 ++-
 drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -26,6 +26,7 @@ config ARCH_SOPHGO
 
 config ARCH_SPACEMIT
 	bool "SpacemiT SoCs"
+	select PINCTRL
 	help
 	  This enables support for SpacemiT SoC platform hardware.
 
diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..a2f98b3f8a75580d2d157008997cc48f42a89368 100644
--- a/drivers/pinctrl/spacemit/Kconfig
+++ b/drivers/pinctrl/spacemit/Kconfig
@@ -4,9 +4,10 @@
 #
 
 config PINCTRL_SPACEMIT_K1
-	tristate "SpacemiT K1 SoC Pinctrl driver"
+	bool "SpacemiT K1 SoC Pinctrl driver"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on OF
+	default y
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index a32579d736130c80bd12f0f9d8b3b2f69c428b3d..59fd555ff38d4453f446263a8fdb4a61faf63cfc 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -1044,7 +1044,7 @@ static struct platform_driver k1_pinctrl_driver = {
 		.of_match_table		= k1_pinctrl_ids,
 	},
 };
-module_platform_driver(k1_pinctrl_driver);
+builtin_platform_driver(k1_pinctrl_driver);
 
 MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
 MODULE_DESCRIPTION("Pinctrl driver for the SpacemiT K1 SoC");

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e

Best regards,
-- 
Yixun Lan


