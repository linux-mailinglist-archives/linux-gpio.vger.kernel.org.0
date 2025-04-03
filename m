Return-Path: <linux-gpio+bounces-18217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF70A7AE16
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 22:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6470E7A297E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 20:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268CF202F68;
	Thu,  3 Apr 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CkE1vVcq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C625200130
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707791; cv=none; b=Bbx/jx0FDupLSlgoTwiHQvc1eKYfygSvE9kxYAS+DAntTawL0YzcZ5NvTBnsdJqriFnPHtb9Jx+IhGU9JyAwE/gffmBtnU3UEXpVwlNaJQolaACLX0F+mEbendw6st/3wavck0ZZWTjqQWZw6aG1EtHIOHx6i7Qk8UchstZHJYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707791; c=relaxed/simple;
	bh=bGaAiPeWPDujMReJfDlyeCQH1PMh/OahseP2Qm+tEqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVeH3SFoprjRfQuibdyitjPwnkl65/9CIMOH8g7ogdnalYS47nsIt+IHoZyZggxnLu+P2x4xjTi9e88OjqjG5EOpLO8/UFL4CDIJ2IfoDRquAwt1zYSiKQ5xtsWohSER3KKVXYrLSmWZlOwDWeC1Xn65E0JP31siG8pFyYMCTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CkE1vVcq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549963b5551so1505293e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707786; x=1744312586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEqJQbM1Mf4t3pD37/T8xo0WrUZj8tqnA7nqQpopQiI=;
        b=CkE1vVcqmJ0VCZcMDdAuIgZ55E3XcNguuTEqB8SAxg3SuSdWoLcHrL4zjrsWbCPNnN
         1BBOMSPCKJ9UItHXgbun4sj1cUVQaTnSnY7joVOQWFTtgs+XyFKZWrSRGFtDwVSBjkgY
         2LujMk+EasSKezzcYqwIH5ZnlYiz5vehVx0qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707786; x=1744312586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEqJQbM1Mf4t3pD37/T8xo0WrUZj8tqnA7nqQpopQiI=;
        b=rDH8g71ZxiwsnyWIaABZiJvKTyyqbG1JWgnbKdP+8P4vbmZxYlOgkeMm5s+YuP0Hpz
         KEiX2nP5Ww2mbhE5Wpo3kmfOKNUlOvN59OZtf3zGQb8meRS3vsIVVNF8XvC51Pdxpshd
         w4uYAnbq9GRa/Ict8NEWTSN3bs9QgsB5lt18DdFWENm7WQzcqdpY8DnIKGv3AJfDRccY
         BLk3ibGd1hbamWq8yU6nqFZk1rhuQLru/aAuSKCgfq47k2Rxgt9p+41KU6Gvr4XGM8BE
         sKgtSoeDE8xNv0AqtuaPdHKK192i+CRIizXZsBPTHcAEGxPVAP84Wx/GLog1Uk7tlTfX
         V/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrUPc1w1OpQ5HhxsHKL6JOuZE28dKu/9nVpKb227hT54dNV2tB7dv9EPeMD1d+fChSmBbw9AtzTx4P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rG3dT8aZogMYx25UB4ST+Y6DbrkRGYn7mY4eFKxDNBZCOqzp
	ZtrO20uOc4fCQ0k9YnabFjLq5tV79g+re2oz55KdCwTprwjcLlvZbVrjrp9Vxxuvg63rNNS/mZY
	=
X-Gm-Gg: ASbGncs/oHsk8vG1Lp/xazYIqNgBho6xqvXq2f7/EFQgMJpXprRDWNRNi9GxWm4Q7+L
	X0cNcoF6VsBt62TNOkPyjkEQa/1+Xfcg/VW7+ObOtaEDYNnVOMXkdX7IrCYDlOlEetAW66Wv6A+
	k7+erkb1+r8d1dSWxHyuBvQC76FbSM2wfAET+WzfyGZxP6LnSCdz1VZQJAH8PGYTN+zgEAjj8uv
	ylrD7tNl5McZWsUC3ujzbXXjCTma5yI0DUle6UmbT/JxmvkqvX32mX9Ei7l4gsA+iutOpVJ9TSi
	SphbVOiCK/vS3zAqqrPySiywLXOHEfVuvVKIqp7KuLcOd3LQzqbZ+qYAC8FGsesrpI8ab7GUCXe
	zx8u09vRmSCMcILkj+Up9T24l
X-Google-Smtp-Source: AGHT+IEtxSrTjJbJCoji6jyspDiVzgskf1D1Wes/27FHcNtXF4JkR2nUjJNmG5ErLGGAKBQY96uhEw==
X-Received: by 2002:a05:6512:3c9c:b0:545:2c2c:5802 with SMTP id 2adb3069b0e04-54c227fec79mr118358e87.48.1743707785840;
        Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:14 +0000
Subject: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for
 v4l2_fwnode_device_parse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
In-Reply-To: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.

We initially add support only for orientation via the ACPI _PLD method.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -15,6 +15,7 @@
  * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
  */
 #include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
 
-int v4l2_fwnode_device_parse(struct device *dev,
-			     struct v4l2_fwnode_device_properties *props)
+static int v4l2_fwnode_device_parse_acpi(struct device *dev,
+					 struct v4l2_fwnode_device_properties *props)
+{
+	struct acpi_pld_info *pld;
+	int ret = 0;
+
+	if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
+		dev_dbg(dev, "acpi _PLD call failed\n");
+		return 0;
+	}
+
+	switch (pld->panel) {
+	case ACPI_PLD_PANEL_FRONT:
+		props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
+		break;
+	case ACPI_PLD_PANEL_BACK:
+		props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
+		break;
+	case ACPI_PLD_PANEL_TOP:
+	case ACPI_PLD_PANEL_LEFT:
+	case ACPI_PLD_PANEL_RIGHT:
+	case ACPI_PLD_PANEL_UNKNOWN:
+		props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
+		break;
+	default:
+		dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
+		ret = -EINVAL;
+		break;
+	}
+
+	ACPI_FREE(pld);
+	return ret;
+}
+
+static int v4l2_fwnode_device_parse_dt(struct device *dev,
+				       struct v4l2_fwnode_device_properties *props)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	u32 val;
 	int ret;
 
-	memset(props, 0, sizeof(*props));
-
-	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "orientation", &val);
 	if (!ret) {
 		switch (val) {
@@ -833,7 +865,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
 		dev_dbg(dev, "device orientation: %u\n", val);
 	}
 
-	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
 	if (!ret) {
 		if (val >= 360) {
@@ -847,6 +878,21 @@ int v4l2_fwnode_device_parse(struct device *dev,
 
 	return 0;
 }
+
+int v4l2_fwnode_device_parse(struct device *dev,
+			     struct v4l2_fwnode_device_properties *props)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+
+	memset(props, 0, sizeof(*props));
+
+	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
+	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
+
+	if (is_acpi_device_node(fwnode))
+		return v4l2_fwnode_device_parse_acpi(dev, props);
+	return v4l2_fwnode_device_parse_dt(dev, props);
+}
 EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
 
 /*

-- 
2.49.0.504.g3bcea36a83-goog


