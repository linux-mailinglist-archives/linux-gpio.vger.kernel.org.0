Return-Path: <linux-gpio+bounces-28516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144CC5DCCA
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 16:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B95E44F1677
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF0832E13D;
	Fri, 14 Nov 2025 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYvwz6mv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3460B329E71;
	Fri, 14 Nov 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131911; cv=none; b=cSrrVNLgTPahMikvh8dQIbXqkg5pnN4nWjQPqFECj0wwtKdGIIz1wCw41iif33D6tol40o+EByaF7dJYW9XrG293nN+HCmpsBzL8odh80anDEgdrNySDsEGa+o3RNFlSiy7ATqLGLbysSVcfDfvjp6xfU/63VJloeSJ4nMeEOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131911; c=relaxed/simple;
	bh=olyntn6uxADmnO50Fmr3qpszTjaZIxGk59owmLBONhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rl5s3yywaKVGyuQlt/Nt2vVNIp0DkyoIfxHmb7cA2EJYNmjN5QLR+ndK6yt7gUjc+hmbS0q28hIzV5Ha8v5aRBZt/1p0MHLoMD5S4apOiHOPWF6GPJ0OoFwhaQqQIlYF/dP+0VOYGx2mtAxDlskj9gUDRXouMHJKDc7+bO2yquE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYvwz6mv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DE2DC2BC9E;
	Fri, 14 Nov 2025 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131911;
	bh=olyntn6uxADmnO50Fmr3qpszTjaZIxGk59owmLBONhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nYvwz6mv1wSp6uaQEW09Y0hyoR4kROrbroGoX8tJ4FfYBWmeVgzKfjhQ5p/t88xP5
	 XzCyRmoIfiIfiDHKa3RpS/iNPbVfsCgjs8Z+ecjRvs6+iu1iriphIX9yFOSwxvavZL
	 Cr27UlXgMcSjJKQu1XsqsghZopbJSPpKWsSytnGzDdqRdIsw8Qck2a3Elj+BZyEg3q
	 pBMOo+4MVzXbVLr9S/AhlhLsCfPzEyXROQC0E2+5fe5BbRXBNgtzAeqxp2xUqHfI4g
	 lIvsbH8QOkfiYl90fB8aZ20xKSWABLZFhFqLL5O2dAD0+h6KR8WHq9Dfx2EoaT2+rh
	 ojrGOlB5WIxXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05974CE7B1B;
	Fri, 14 Nov 2025 14:51:51 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:52:01 +0200
Subject: [PATCH v8 21/21] media: i2c: remove MAX96714 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-gmsl2-3_serdes-v8-21-47499d907990@analog.com>
References: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
In-Reply-To: <20251114-gmsl2-3_serdes-v8-0-47499d907990@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=2301;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=vkv6kAMtTD4MZZHDNfXqoAxjfwJqI/ktHZgnc2F++6M=;
 b=PMhd6eoDAQGxvK5DeWiLB+DFnJCLn2SwHKRKCTLYNGlHpYzOfEgx63IdCG0UwUtPjg/uLjc2G
 DLR+r5IW+pQCsoZGHVBdwdvPH/dzbHrWFW+zGQH3oL3QOx+zyAfmrPk
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



