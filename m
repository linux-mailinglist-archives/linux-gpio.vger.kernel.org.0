Return-Path: <linux-gpio+bounces-21061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26749ACF5D8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 19:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCF2C3AF117
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 17:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA7027E7E1;
	Thu,  5 Jun 2025 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D1YRJps2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9945727A112
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145992; cv=none; b=llniGNYKEpMvD82rypm6pZy23Y0fEQIysMXgLW6hwJgdEFW7unCt0wOmIW024G6xMT1lNDtI1qaHFC0ztikdwPP1OCCxT0Pt5dpo48p9fX4S9eVidmjvxQvzYIv21THdH4wW/de3H3mCyySKkkR1x9DhwEpdpZSLxb3hGZC2MrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145992; c=relaxed/simple;
	bh=yCJh8xYi8LYreBh5dydvM47XVBLZAxTNUSYJHtb7x4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kya4G1oEYdQvjXsQsqDZbk25GKYhel1UXLbVbub2zfb2Lkxe2tyl0pepmh6vqCB6UwuT7chIpmJrGo+pUAMJPf9Fxxec1qUZ6LM7ag40azjSxhQCJbuj91yisp9iyVXKtUDfYCxKZ5XJXCVN3OuGKFDLyi8I+xVPixsarEpcDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D1YRJps2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1511222e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145985; x=1749750785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bWh2ADW8TZRmlfflymQkf2Dq+w112Fwi8JTTMtqDFE=;
        b=D1YRJps2zRih9coxBVTJrdx/51+lbtjKYRtENATLKOOVOlpyGlG9RH6yDbXUop3PFC
         Li6dRkgEYA7bQK84Z1zpJ8upk7MmM5j3Fxoi04JNCcAEX2n+XWksq9RUbGaGHLWm1hVk
         kR7Zn2Yn9TS1/lFia5inydJLM2WAwPacg8Yrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145985; x=1749750785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bWh2ADW8TZRmlfflymQkf2Dq+w112Fwi8JTTMtqDFE=;
        b=p2zpGB91Xwlhy4mI/4BmeLLVIMsFFDwJhO5/ItR/fWrdo6ldn1KtJoYS4sxIrzDhh8
         S2/ETPm5/PAfs0TJ5I3zrqz5lqjbRhKOG41R90wr4eFkJ+8foyPL2H3xZ8r0OFR9AFAA
         T6MKz/y7sq3zWGepkpNNet/0r3oy+4837EhAZGZ4O3IZL99enyqORuAb0YkNIsxE6L6X
         9bVtByxKHXujDhaV+SiGMJ6dFQGo5RE2S8KZXiC7/8/PRq3O5dOkgsusaVDFU6EfFmOj
         PconE/417gtSHT4qQxfA8v2n775rgdhhr7IiqZ/QEBCguOSC7Jo7aqwTIdFjUOg83w9D
         puCg==
X-Forwarded-Encrypted: i=1; AJvYcCXHwt5c6ctKeig4x/69Agltp+2t3cAABrtvK/yzVCKTaaSEIbz20/9wRzo/AjktXfdOby789rFKy7Wg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzikd+cijCHqnwDc6BK6qm9fEYf93yrIqRZaO5/AumiYf9gR9i4
	/5jbT2fGcIfPJCKsGxFTrEszdQmijXZ1+PkQxXtCoA1QiLGgtqfiQbFqi9XvOqW66w==
X-Gm-Gg: ASbGncs5c0ASZNMLvPFAQfMeiC2M5L2j6dSBPalTihJME8awxSLUwIhDExheqYxG9Nh
	n9SNNwr/CTYBC3j8Sn6SRFacPgx7+DqNYRC5kW263AiNxbhhMQuadaTdH71jMwiFICuB1Zy/mal
	ohfU8p+qPEhPzORzsG19uy+mx1aBhRDrB9C/YtYi4FGTq8BfYX/21rb5PBd5PY86nhrKm3NUAVS
	ulDymNbLA+WQoqkvdd/UE/0O4a2Wo3zet/kuC5z8MSSitu+dSshm9xiMFakX/KYo6r7Rhk9RXS6
	IczWTIiZo6OwECAynfshSbZgSPNaKZwd0XK/QWe7JYw+KMnGoh2SXYGGkOjEVIbLSi7UFeTta0x
	xef2PmnsTqz61P6ELcHp+JxpwvA==
X-Google-Smtp-Source: AGHT+IHP/jNThy5aDvW7T/hvxtEAhADh14D+is1JaPoxECZSvFGKZLcZx8jZje+1dqjf1fDgdS/nDw==
X-Received: by 2002:a05:6512:2247:b0:553:2dce:3aab with SMTP id 2adb3069b0e04-55366c301f2mr13260e87.40.1749145985423;
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:58 +0000
Subject: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown
 rotations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The v4l2_fwnode_device_properties contains information about the
rotation. Use it if the ssdb data is inconclusive.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 020aa52f590d66b6d333adc56ebfb9ab0561db51..6f436a8b4d23373af8a6668530333a827eca467a 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -236,37 +236,41 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 }
 
 static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
-				     struct ipu_sensor_ssdb *ssdb)
+				     struct ipu_sensor_ssdb *ssdb,
+				     struct v4l2_fwnode_device_properties *props)
 {
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
 	case IPU_SENSOR_ROTATION_INVERTED:
 		return 180;
-	default:
+	}
+
+	if (props->rotation == V4L2_FWNODE_PROPERTY_UNSET) {
 		dev_warn(ADEV_DEV(adev),
 			 "Unknown rotation %d. Assume 0 degree rotation\n",
 			 ssdb->degree);
 		return 0;
 	}
+
+	return props->rotation;
 }
 
-static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
+static enum v4l2_fwnode_orientation
+ipu_bridge_parse_orientation(struct acpi_device *adev,
+			     struct v4l2_fwnode_device_properties *props)
 {
-	struct v4l2_fwnode_device_properties props;
-	int ret;
-
-	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
-	if (!ret || props.rotation == V4L2_FWNODE_PROPERTY_UNSET) {
+	if (props->orientation == V4L2_FWNODE_PROPERTY_UNSET) {
 		dev_warn(ADEV_DEV(adev), "Using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
 	}
 
-	return props.orientation;
+	return props->orientation;
 }
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 {
+	struct v4l2_fwnode_device_properties props;
 	struct ipu_sensor_ssdb ssdb = {};
 	int ret;
 
@@ -274,6 +278,10 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	if (ret)
 		return ret;
 
+	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
+	if (ret)
+		return ret;
+
 	if (ssdb.vcmtype > ARRAY_SIZE(ipu_vcm_types)) {
 		dev_warn(ADEV_DEV(adev), "Unknown VCM type %d\n", ssdb.vcmtype);
 		ssdb.vcmtype = 0;
@@ -287,8 +295,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->link = ssdb.link;
 	sensor->lanes = ssdb.lanes;
 	sensor->mclkspeed = ssdb.mclkspeed;
-	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
-	sensor->orientation = ipu_bridge_parse_orientation(adev);
+	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb, &props);
+	sensor->orientation = ipu_bridge_parse_orientation(adev, &props);
 
 	if (ssdb.vcmtype)
 		sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];

-- 
2.50.0.rc0.642.g800a2b2222-goog


