Return-Path: <linux-gpio+bounces-28515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D4C5DD60
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 16:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C58F34EC89E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB5632D43B;
	Fri, 14 Nov 2025 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4qsKGXU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A058329E61;
	Fri, 14 Nov 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131911; cv=none; b=AnJJPO2H68qSeqPiFNoI9hDp4XKH0Te2JAUOm+64gF8ROQRfiQjE/823d2asD2wvvw6DcCKtM8Jdl70eLhxNnuD/i+FFZ48eYUUg65H2BAHYOrh0iykpWb1jdIaUB9ujFEabbDukQ3imGnLU0qalu7pgfVPn7go9ccuBAiWm7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131911; c=relaxed/simple;
	bh=UZu58m8XGcSJGkVg4fcmuSuWPz3gR74p7GjWOYOP+J4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGN8b27Y/RdjTkKBZZMPiou/n4QFFK6URtzqWUEqh66/prfENzRB6ojus7wDuHPRVXu+7u1FZekecuhElM40qbqgi1fepRjwP32boz7bNaarIzqbovx5awVqbGQN+zbXWchilO7a/ZMrZSKIqdohBjjy6o0WmETQbf1Ln5z7lgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4qsKGXU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0736C19421;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763131911;
	bh=UZu58m8XGcSJGkVg4fcmuSuWPz3gR74p7GjWOYOP+J4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G4qsKGXUjqYp45hivlumRK/PYMhYJhs0jjJZKT/vbheWBHzTTDdIp8oGoFYJDfbSH
	 kjZhahnpIAWlNHYMWhY0rl6d496tJOgpG87k8hcB29dl/N15Rdq8JyNiRXtfwG/9LA
	 34C6Yl4lfEpAXi182QxJ8Y+BdzzZOmwl4629vdbBc0DBZfTbyKffKos2levXWXwZaQ
	 qe2HQEvZOedtNudOE/LmKXNrunEYh4s5oUfWYKyIIR47QPY9pcjm6YakXnP58OCJtD
	 y/SQBbCYvoF5VdDgzLGqvgZTZ1OrXfummsBvIfb7+JQQBvaE5SZL1BDDftanHSQy+L
	 1zuxjYDtr9zpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF25CE7B1F;
	Fri, 14 Nov 2025 14:51:50 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 14 Nov 2025 16:52:00 +0200
Subject: [PATCH v8 20/21] media: i2c: remove MAX96717 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-gmsl2-3_serdes-v8-20-47499d907990@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763131906; l=2278;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=Uby6G6BvwgKOObBXcLlxO1bh2+JafLSgY3oYvgugXOs=;
 b=iQRmH1li302QehwZadf9bX7Ag/nO+Lqh+ZfjHdvzbAPsy4fB+PaWysfTQS6Sk0jxdqKNKaMTB
 tAwscwEP+5jADBWIsqe+h/5zlKdwuZey6hIywccWVNmwooSlzCml1fG
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The previous MAX96717 driver has been removed and its functionality has
been moved to a MAX96717 driver which makes use of the Maxim GMSL2/3
serializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                |  1 -
 drivers/media/i2c/Kconfig  | 16 ----------------
 drivers/media/i2c/Makefile |  1 -
 3 files changed, 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a6a04ce2787..ad7e28897062 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15235,7 +15235,6 @@ M:	Julien Massot <julien.massot@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
-F:	drivers/media/i2c/max96717.c
 
 MAX9860 MONO AUDIO VOICE CODEC DRIVER
 M:	Peter Rosin <peda@axentia.se>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 37f86e6de969..4d3a861ee2f0 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1701,22 +1701,6 @@ config VIDEO_MAX96714
 	  To compile this driver as a module, choose M here: the
 	  module will be called max96714.
 
-config VIDEO_MAX96717
-	tristate "Maxim MAX96717 GMSL2 Serializer support"
-	depends on I2C && VIDEO_DEV && COMMON_CLK
-	select I2C_MUX
-	select MEDIA_CONTROLLER
-	select GPIOLIB
-	select V4L2_CCI_I2C
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	help
-	  Device driver for the Maxim MAX96717 GMSL2 Serializer.
-	  MAX96717 serializers convert video on a MIPI CSI-2
-	  input to a GMSL2 output.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called max96717.
 
 source "drivers/media/i2c/maxim-serdes/Kconfig"
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index be3200b23819..96bc49339341 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -70,7 +70,6 @@ obj-$(CONFIG_VIDEO_M52790) += m52790.o
 obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
-obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
 obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o

-- 
2.43.0



