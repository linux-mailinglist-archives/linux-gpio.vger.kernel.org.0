Return-Path: <linux-gpio+bounces-15530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599CA2C242
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 13:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13FE43AC594
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FEA1DFDA2;
	Fri,  7 Feb 2025 12:12:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9A1DF97D;
	Fri,  7 Feb 2025 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930337; cv=none; b=NBic+kvU1oY1ihdbdcKDhVg81UT+nd73AhTA8PcLO6G1sI6/t4Q0fryTkBhKeqFq6x7CgCinxXK9XHQT0ovyMp6Q6LWXtr272itUsV2TtUgZzn3zbwYZ/O+zbcp6TihQhFP8eAh9+bw3ZaUJ7DWRrqlhFqtLUgkO3+86OZy+T1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930337; c=relaxed/simple;
	bh=JHVNcI3xg4IrPDaXnnLHrbwRcYBbXD8MmMYM+m8cIxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g7ucMMLSawh+XgJ9jxKe6iD5vJczDKFUD9QVWacnEuPK+OsjgXfMZ/rERGppJW8E+gprEphmMNfwPG8Rb3DhAIhqHUt3uBbGaRwmF6PYrdxPLESteMupcL8vNJ3w4CalzzY80NFgE+gg9KTgQjzmCuOQb8Fstf8X2ho73zO5SO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1D9FF342FDD;
	Fri, 07 Feb 2025 12:12:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 07 Feb 2025 20:11:42 +0800
Subject: [PATCH] pinctrl: spacemit: enable config option
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAH34pWcC/x2MQQqAIBAAvyJ7bsEkC/pKdKhcaylMVCIQ/550H
 JiZDJECU4RRZAj0cOTbVWgbAduxuJ2QTWVQUmmp5IBni57dlsKFt0/VRkN6Ndb0a6cIaucDWX7
 /5zSX8gFzfmeRYwAAAA==
X-Change-ID: 20250207-k1-pinctrl-option-de5bdfd6b42e
To: Linus Walleij <linus.walleij@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=JHVNcI3xg4IrPDaXnnLHrbwRcYBbXD8MmMYM+m8cIxY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnpfiYZWflhguUmnNsz2Ee2Fm6knaCOFupVZUID
 MU7bzEB0NSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ6X4mF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277c0xD/9QSxsI/yGV+w8nXX
 IyjEUQiRt+ioHM9mdbjlpQZlxg064SV6PFNJhvuyZuXKslsnava4tySY1VwWVWggZsguyD0ZlHI
 drKklsQ19Lj7Fhr140KgPHzLldl7OSqLU0aBLkpWTEZcS4UWA2Sxh4PbLWVZZ4zOxyrDN5npP/Z
 tGgI+Eaa/BzLj5UaavGoC8uRnVPXpvcCBWDCojGT3Mm2j1rvBJNt4uCO86DT6qGo11xaFP8obJB
 ftB4g5d/W/MeMvphkXHWDFzgmYX5Q8MhGw2CwhpsuOt30JyVNmHzOqWEvHQXpQzQShWuJJakYgx
 VCrpGvlkeJhzWb6Ga2c1dsTlgZGmWZQKQH8nVN+3FOCRAqO8tWKd3zgcewPuHI5YZOt0261YL06
 x0oDhWqFkhdrA7AKMnd94Lmx1W1ZbQom2/Wg53Ap99Y8aDCVy9dK1Q2fuCJOcd1HWAcvN896506
 1JNVtB+3eWIJbYHSJr9U34dkd8vMWLZ4gYO4Ayo1q822S2N94wxv2BJ9yrgAYdNM9FbeWZr27x+
 cxUGLS1sRTXbCavDMvuPd3Hg3WybmGA6ZcsVDuQZmd4t2h5hKawvDfnAqNYMhn0gIe28ung7IyO
 D/3nwcEUsaSeJQ3W3nlzvWeFpLy4/FK0b9VKK9sgRSpok1OgK2KUeyyt+ER6f3aCLJ0w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Pinctrl is an essential driver for SpacemiT's SoC,
so let's enable it by default for this SoC.

The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
'make defconfig' to select kernel configuration options.
This result in a broken uart driver where fail at probe()
stage due to no pins found.

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Reported-by: Alex Elder <elder@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
when using make defconfig, thus fail to initilize uart driver which requst
pins during probe stage.
---
 arch/riscv/Kconfig.socs          | 1 +
 drivers/pinctrl/spacemit/Kconfig | 1 +
 2 files changed, 2 insertions(+)

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
index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
--- a/drivers/pinctrl/spacemit/Kconfig
+++ b/drivers/pinctrl/spacemit/Kconfig
@@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
 	tristate "SpacemiT K1 SoC Pinctrl driver"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on OF
+	default ARCH_SPACEMIT
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e

Best regards,
-- 
Yixun Lan


