Return-Path: <linux-gpio+bounces-18219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D7A7AE64
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 22:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0655188DAAD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 20:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C151204C15;
	Thu,  3 Apr 2025 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DUVN8BoL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43F20100C
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707793; cv=none; b=Rkfkpkm+ZbPlq9cDxCTZ6kIm9L3PhMw1MBpCqPkGS5OTeJtBju3jEREsu5MiQu9JKVIwLXJDs89sl2I5DnZ1NzmBto1tTtj4b9mhG9LaIfuiqtAt4PRL1efXm2UuGsSHG37ACB6JhYaHG1U6F5SlCwG7mNKFz+1wu4X67zKew44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707793; c=relaxed/simple;
	bh=FkbqQupMpzx0wszT8hmcVx+KkNGgx/ddD0tHr201vd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5NyYJp4x2j7Mg/vkC/ikCatcIxo93fscGE7E9bCeIVCw9Wdq17ybZOvbJIyFTz//PyKLv01UJ+HGeXwLUL2fykWR6PGjzuRqvRs1tzutSi2s8bA4i5rQInY3Hw23Q8sKnxorGdtpfY7mL23e1A/nam6TaS5J47W9f8GvO5anmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DUVN8BoL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549967c72bcso1445918e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707787; x=1744312587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ka+lvT2WWas4h5SU2dyS9iOFUZ7NSTxVoiGdeZqTAM=;
        b=DUVN8BoLDufoqp6l9PgZ5nVu3y253dfDUXL3m5TFpnDjZ3dSFN7nP4iUbleHFalBTX
         w80OnXcSo1FFVsDLrQyDbl3Y6f4h0474jHBY6XzRh0KXF6j0X5k8ZJFiX3qeTgf3IxeK
         +IrnGEhZH2B3yyG51KNx2kjMbPi8IodSCNHto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707787; x=1744312587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ka+lvT2WWas4h5SU2dyS9iOFUZ7NSTxVoiGdeZqTAM=;
        b=B+KCwjVUNdW8yylaNSb37q5x8MsFQR381GEhebhsI38qxvkMZGoONn6aNeFdP56VK4
         pWbRE+EzbGv2djGyZavCu/NTXZiHHAGL8Bm9Octxr66aQ1hDc1x4ti0EHo2Z4BzjL4zh
         eCoLeia4LLSSOu5syxVWIvQ1PB7uLuL4Od6GIxydH24REn0Qvhp3Ss5pRGQUQRjdZM5F
         Ep32gH4BGmG0HJHNKZkXpkUkYgx45pMjHebNinvW8rq1ZL4qxePD8ngIAThTV7X2lx1A
         zOtkIYWxlE/yTftWw/YOTu2GhgXi5+KAS32RghA7Zhpy/BYVjiq3WwQscU/ZCfI8Uj4u
         irkA==
X-Forwarded-Encrypted: i=1; AJvYcCW/LElINU3FPLCbL8vIWHGP9NZe9EAd4uW54Qj2gkUgWj0xNwPDKZ8CfizXdenBYt/Aoz1rgkgiEiYw@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmtWtZEoiYS4uoB2IAuPCA7OZ3cye6V+d9BfIuXThI4ofJUiw
	zlkhgpP5Pz8DKIZgqJiBZLBcrYO3OzxzfWyFBs9omELk0JPALYiXumRpQDa2hVQEee8EBF34gig
	=
X-Gm-Gg: ASbGncvUuIEG1ElvKwg/4Q/PFGtDeza1baTruCkHa/DKCM8tZGaFmual3JgUHKkT7qr
	zGOgH7huGCWFqvxxuwevw94anIN5HVz/t/W0oIbRr/INoYo4udCZ35VfSo6vIOBfsSq29gnOeXw
	Jk7gF/Nyhwawii+OGVhkpYwlnl39iSd2CA8HVJYwKNYYq+58wsvP7zHbwcc8Of/8Gxt9LfxEfJw
	gYB0fnnXP5Axji5WXh5R3p8y/qJeehnPurebT/v0WC+NwlvRA6jABHY5xxr+yfR2NovBidRq1wg
	SYP6kCuqueiZB3de+982rFFfeeqDICJmoCcIvKCLS0v7+hA/SRy6/TU2eLnOcCwgs3xYJVs/rt7
	CfzjSpdj0dSXk6t6vpt+K0ecV
X-Google-Smtp-Source: AGHT+IEoqeMaCo7VWkarYWDP+GRzyBsI/lGXquNjw+btFYnKJTWgwFNKTpnH5nMpaFghhD3kro9NkQ==
X-Received: by 2002:a05:6512:3a87:b0:549:31e4:9ea with SMTP id 2adb3069b0e04-54c2282454fmr77746e87.52.1743707786957;
        Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:15 +0000
Subject: [PATCH 4/8] media: ipu-bridge: Use v4l2_fwnode_device_parse helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-4-1a0cc595a62d@chromium.org>
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

v4l2_fwnode_device_parse now supports acpi devices as well. Use the
helper instead of re-implement the logic.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1cb7458556004d2073688bb0d11defd01f2f61b7..79e6998d37dfde50bd4b44584c8864178527d951 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -251,36 +251,16 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 
 static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
 {
-	enum v4l2_fwnode_orientation orientation;
-	struct acpi_pld_info *pld = NULL;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
 
-	if (!acpi_get_physical_device_location(ACPI_PTR(adev->handle), &pld)) {
-		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
+	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
+	if (!ret || props.rotation == V4L2_FWNODE_PROPERTY_UNSET) {
+		dev_warn(ADEV_DEV(adev), "Using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
 	}
 
-	switch (pld->panel) {
-	case ACPI_PLD_PANEL_FRONT:
-		orientation = V4L2_FWNODE_ORIENTATION_FRONT;
-		break;
-	case ACPI_PLD_PANEL_BACK:
-		orientation = V4L2_FWNODE_ORIENTATION_BACK;
-		break;
-	case ACPI_PLD_PANEL_TOP:
-	case ACPI_PLD_PANEL_LEFT:
-	case ACPI_PLD_PANEL_RIGHT:
-	case ACPI_PLD_PANEL_UNKNOWN:
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	default:
-		dev_warn(ADEV_DEV(adev), "Unknown _PLD panel val %d\n",
-			 pld->panel);
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	}
-
-	ACPI_FREE(pld);
-	return orientation;
+	return props.rotation;
 }
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)

-- 
2.49.0.504.g3bcea36a83-goog


