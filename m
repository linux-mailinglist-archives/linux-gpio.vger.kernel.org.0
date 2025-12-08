Return-Path: <linux-gpio+bounces-29388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1937CAD6A6
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 15:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C363054828
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 14:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEA131D39F;
	Mon,  8 Dec 2025 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQUrKI69"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903F31AA9F;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765203198; cv=none; b=eZ5ZVuCExkt5cy6ii0sZcxccc0gth9Z98/TVB/aRHkCAZ7XHZlZ2Mfy6y/5fHW0XEHD5JzqQ1WnrkZRXJrB3yiLPzzVRfT7jakB9Ik+676JTYS4kivkIiIMrKM2FThGg0oWhlLifwkDlyN0udmWieKsbjHnZcjqmCbkKBTMD5Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765203198; c=relaxed/simple;
	bh=olyntn6uxADmnO50Fmr3qpszTjaZIxGk59owmLBONhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRkUKkyvi9Vefdgl+pK97idtlzgTIDVmx5u7cOprRSrQG5JfGw9V5LGTbCVPsnb8hlDyFUh0mCUbyN/N0U/oTtUitkgwtxTp5fPkFB12yIYMVCL0blzx1w2V5Plw0zgKgeKQ65/nIUIw/kCQ7moccI0O+uLblbyq7an1gps9v6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQUrKI69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A67C4AF13;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203197;
	bh=olyntn6uxADmnO50Fmr3qpszTjaZIxGk59owmLBONhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rQUrKI69HUaIhTYtFt1mCyDyPFr4yEA3y5hdN2dQSGambTKZggguZDKxHE/WHK3dn
	 wrbvmhiHbXAcpEyhWRifgGGxg6k0rouAN2z4HMD4RYrTZoZUfhmlqGms0ISPO8hD1y
	 m3oDy82fyZYbRCfYc6gYifKnLN3g6BjXzOq/9IIt2YgSsumWmHcCD82JwYr5ueAiE4
	 3sXaR59VcqEa9hjkA8rqOqjHew5NCv8tZM4rVoVRDJ/UWLmAB5DzpcNVP/WMvBY6NR
	 TBVLsOyH9YJ4EEeES+Gyn5eTY/Ko5yZiK/Z6T13LY1CCAAZef7jBKUJWp/hXmFo9I0
	 lShwz+qiltOPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5810D3B7F5;
	Mon,  8 Dec 2025 14:13:17 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 08 Dec 2025 16:13:13 +0200
Subject: [PATCH RESEND v8 21/21] media: i2c: remove MAX96714 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-gmsl2-3_serdes-v8-21-7b8d457e2e04@analog.com>
References: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
In-Reply-To: <20251208-gmsl2-3_serdes-v8-0-7b8d457e2e04@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 mitrutzceclan@gmail.com, Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765203192; l=2301;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=vkv6kAMtTD4MZZHDNfXqoAxjfwJqI/ktHZgnc2F++6M=;
 b=4o8w0UOGE4lJYelOAN4OZFfoQ1ac37Yi51rm4YGzA623Ki0hBSiPcgF08K+SAbj7QQ9UxlkHe
 ZcQfyaMlAoUD4Ls79t0DZDpynN7rXn7QHHdboksb+GLsg8LMmA6FM4b
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The previous MAX96714 driver has been removed and its functionality has
been moved to the MAX9296A driver which makes use of the Maxim GMSL2/3
serializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                |  1 -
 drivers/media/i2c/Kconfig  | 16 ----------------
 drivers/media/i2c/Makefile |  1 -
 3 files changed, 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad7e28897062..08ac1170baea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15228,7 +15228,6 @@ M:	Julien Massot <julien.massot@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-F:	drivers/media/i2c/max96714.c
 
 MAX96717 GMSL2 SERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4d3a861ee2f0..db827dcd735d 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1684,22 +1684,6 @@ config VIDEO_DS90UB960
 	  Device driver for the Texas Instruments DS90UB960
 	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
 
-config VIDEO_MAX96714
-	tristate "Maxim MAX96714 GMSL2 deserializer"
-	depends on OF && I2C && VIDEO_DEV
-	select I2C_MUX
-	select MEDIA_CONTROLLER
-	select GPIOLIB
-	select V4L2_CCI_I2C
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	help
-	  Device driver for the Maxim MAX96714 GMSL2 Deserializer.
-	  MAX96714 deserializers convert a GMSL2 input to MIPI CSI-2
-	  output.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called max96714.
 
 
 source "drivers/media/i2c/maxim-serdes/Kconfig"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 96bc49339341..333e4243ea2f 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -69,7 +69,6 @@ obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
 obj-$(CONFIG_VIDEO_M52790) += m52790.o
 obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
-obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
 obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o

-- 
2.43.0



