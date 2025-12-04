Return-Path: <linux-gpio+bounces-29244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA17CA3157
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 10:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 773A03004509
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 09:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D313358C6;
	Thu,  4 Dec 2025 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQuSmASX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE73358A7;
	Thu,  4 Dec 2025 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841806; cv=none; b=fFId6gTedVZnImPBb24FBQ0bPvMrpc0MNrWO6rwaI6DzUwip5UnAaUlPyeCLJ54ToenP9evNdlvgRXzMSREfxCnr+uO6iA7Fkz7BiK9ijjE5R+3WIYC7teVxKCA7lqoSHSGc0F8BmStoIILZYIqMCk1MBahukXSzlHA/FOZXEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841806; c=relaxed/simple;
	bh=lwjULcWlHssyXmM+S8MGi7sA11IRLk+JJGhHPFBMevY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RU+SHG15ozy+jeJkYCxaVQLikumHJPb2OJbag5dcy/juaOVVesE0a9YzKJAXtzlChCGBVz/Ta9VDdAgtyHEPzJSFI47PeeqZPxSsgKrCmwBGvZ9DxeNUFdrglzWEAppQvwRsNyg+aGn2RAVzvp8wQ9DPL80UqUa1gm5maRm2qPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQuSmASX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB1BC4CEFB;
	Thu,  4 Dec 2025 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841805;
	bh=lwjULcWlHssyXmM+S8MGi7sA11IRLk+JJGhHPFBMevY=;
	h=From:To:Cc:Subject:Date:From;
	b=UQuSmASXPI80sTRwqV12H79DD4YMKpn1K6asnpoaVzXC1W2GNtLRhVHrouw6ZSAjv
	 OEIe+eBDoSi0QlUqhQDJzM+1rmSo0E9AngUAmXsyoKT3lKSsYaaFS+2mcDDACEXDZs
	 le073FdX+lWoOD6ctg4E10vqwjERZX6n41xcn8pSpqzPFaMuzKCYbQijCctN1H5m6q
	 dtWP7ZbvHp0dxwOK3E5Obh7PI9v6f42kkFBp5fRwLX6Sul3SzGxvm1OWn+V5tJeVnt
	 SZY6yJWPYPYzTfmkf09rw2oVmxT/GpbBC7Wxjio0i/innnI/tEHBaLW1iaLmdQUa+D
	 69ojIkgcoS8vA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Peng Fan <peng.fan@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: tb10x: fix OF_GPIO dependency
Date: Thu,  4 Dec 2025 10:49:47 +0100
Message-Id: <20251204095001.1031736-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting OF_GPIO is generally not allowed, it always gets enabled
when both GPIOLIB and OF are turned on.

The tb10x driver now warns about this after it was enabled for
compile-testing:

WARNING: unmet direct dependencies detected for OF_GPIO
  Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])

Use the usual 'depends on' here.

Fixes: 682fbb18e14c ("gpio: tb10x: allow building the module with COMPILE_TEST=y")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 0fed90ef587a..a1fd130a2408 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -735,9 +735,9 @@ config GPIO_TANGIER
 config GPIO_TB10X
 	bool "Abilis Systems TB10x GPIO controller"
 	depends on ARC_PLAT_TB10X || COMPILE_TEST
+	depends on OF_GPIO
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
-	select OF_GPIO
 
 config GPIO_TEGRA
 	tristate "NVIDIA Tegra GPIO support"
-- 
2.39.5


