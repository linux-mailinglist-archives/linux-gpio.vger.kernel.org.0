Return-Path: <linux-gpio+bounces-24093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F20B1EBDE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EBD316A368
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA89E28640E;
	Fri,  8 Aug 2025 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmUgA3UX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06BC286402;
	Fri,  8 Aug 2025 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666611; cv=none; b=JzlKKZ660UaQhbuSe11lssnbikN7cjl07DnrCTM43Js2bDKv6z2Inr1OhDwk/5+v7gpI5vV/m8kgdOwL33xwJgrRlrJXIriMW/3iPEpWltIJQHwVvhtQ7V/RmZinWDHMF0J+Pgi/QXpOT5V9N1c9lppx3NFU+fNahq10O9rmkTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666611; c=relaxed/simple;
	bh=QyoziH7eFTjreQvo7zxyM6YBQswPsmGNJzt+Kj9c6W8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sb6QNviWoOCqDi0N6+YZkgMT86gSdpn2jddBXimrGfOZx1Gz47qSO5UT1qgsilGt+lEeddo9IMqmE5BZdg1Idj8WINjyZHq5AKUY5sxhd0OAuR8o3xSAAG7yOYO3cyW2z1pUzSdx0KZjX86Ypc1w4TeK56iXIb6BqrgeEF7vjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmUgA3UX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0969C4CEF7;
	Fri,  8 Aug 2025 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666611;
	bh=QyoziH7eFTjreQvo7zxyM6YBQswPsmGNJzt+Kj9c6W8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CmUgA3UXSAtleN8QCMePagd3fwknaAzrvBF/OoK+8YWnk/lPGIOCe7YLtmQBleUXL
	 10xPoRK0s0EDVkXURb2azrQfYNEqmFBHIfRIyWPG0h/wLFbfrOYDi7E0flh7D7LXrJ
	 zgYoLTLRRuXF1PBP0WVWOzGDjQmgVqg1nT30UL//5arcbw/pUKTXsuBBuajIxXgL/x
	 812m9iGYZBZKjhRIPNZM4vmDPeimEdZrAFLwkTNoG7MmHDSVe0IH23y30MXqqRDNe2
	 oCecdALkF7w6SDhUqP4wDbcskpQ/jPEOlwEVN673UNug47C/nvZdb5bQ+z2Wd+NZ+V
	 3LwS8HngVOOLQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sven Peter <sven@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/21] mfd: aat2870: add GPIOLIB_LEGACY dependency
Date: Fri,  8 Aug 2025 17:17:58 +0200
Message-Id: <20250808151822.536879-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This driver uses the legacy gpiolib interfaces to get gpio
numbers from platform data.  There are no in-tree users of
this driver, so nothing defines the platform data.

Add a dependency on GPIOLIB_LEGACY for the moment to avoid the build
failure, and make sure the sound driver does not get built without the
mfd portion either pass that dependency along.

Alternatively, we could remove the mfd driver along with the backlight
and regulator portions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6d52a3d22430..d2bb88bd5917 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -129,6 +129,7 @@ config MFD_AAT2870_CORE
 	select MFD_CORE
 	depends on I2C=y
 	depends on GPIOLIB || COMPILE_TEST
+	depends on GPIOLIB_LEGACY
 	help
 	  If you say yes here you get support for the AAT2870.
 	  This driver provides common support for accessing the device,
-- 
2.39.5


