Return-Path: <linux-gpio+bounces-26618-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 285FDBA3CA0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 15:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E42C1C04C8F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067942FBE1B;
	Fri, 26 Sep 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WIUId/8i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3ED2F7ADA
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892300; cv=none; b=B+LLKU8pcGm585H3SoIeWVqSZ3JPeiP9bmEjvoYu0WeNeOnWbzGdzL6+k2XsK0lv2S1epHBABXt8rsmzjUlYSd6dzVNOknzAYLn7a0Rz8UxEZRtf046au7xVbS8jFl3LbV9rg1UojtDTKw5WXgWJ97M2ZiauQpdogLvnO8bCBI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892300; c=relaxed/simple;
	bh=uQKx1xhIU5eIYcqCEj+wgLYNzIbICgNjQdDV8Jtr5o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLz3htPdlaJmHw7gIV5CMQ2kvgrZQ7O0MEhxEHkl4SNxXuLCEmT7nUZMFaFveH7Tmtxk60xefSjnHWYJf7NHZc2JdM9zJWnqVkLzRebEsXEwMIjZKQj5PFdlQL0g4+5Fh8xNA6ZvfgAT8hvRYI4Tv50EJh0r6QXykD2R6le8190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WIUId/8i; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57a604fecb4so2646056e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892293; x=1759497093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ2xc23cnAfVOxiaEtcKmtjDZaiDvCUR7nAT9mLWhLU=;
        b=WIUId/8iT+6SwyIGvX3TRYP4VupuoS0vQG83UY55JuPAK4lj/4jhPJMhCIp7cHPIwh
         s+ru4i3wDIGi/NSn+UJ7TJF0Rw23gsui1BQL9MqgyJk2o1FPGQQrEgKR8dWyYzzr4JGf
         bn+VDC1rE7OFfTOIIzoMOZLZeGqSNlDIaX6SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892293; x=1759497093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZ2xc23cnAfVOxiaEtcKmtjDZaiDvCUR7nAT9mLWhLU=;
        b=MTYpxYhvNgiLqVfXmbz1nS79/yNRBMQ+VJ5PdL8ZxKJ1MTy2AyMLFeeTyVcdZnqL2V
         bFftYIsI2ry5jEYyMAsUBhj4j8BGo+16h8htnMUmmCx8xs0mSh56Rk7xeQd3K0p32baT
         Ec/tycBGv0LcLhWZCZ49swePKL0CrTiOTz1vcTapXD+R6E54rQJEGOEUxmW5kOI7ZRMB
         Kf+vKFgYKVX9mwOx8o6YZHHdlGuqxDUPx09xkj2nh3nyxsFK2eUWecz3SObsVIHxne2X
         u4Vf5HdxXC/W16l6V+w7QqqDA3BsBG8mcMr6PNgiEPsrRrUC+xyMCgtLI/fmOYTNgxe2
         dbmA==
X-Forwarded-Encrypted: i=1; AJvYcCUBNHyvW508ldx0iYam+htlpw/bVS8P7QzkamPpk1UCRMgGtwFZS7fctQXcFXFGsDgRsEVCpuyP4CNj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5cwd7pJ1G+Clzi2wLTopeudp9UqueESe+88mXRX1NxvOxzUcM
	lDIir9sQ3VKNjyhRCCrwJAQCEr9fqi6xGZeX1KKqn1y61ww6zq0aZzFP6Avn19FMyA==
X-Gm-Gg: ASbGnctEeS9NsjObnU2CL0SyPVh70Q+L8CgEkE/lpbf17gU1XN47XFrIlkgTCtNVqO3
	JA6pXlRPyVqscjkDDUlNGp9CLdazl1L2C8SgLha43Bc1pFr2+sokIV4Cac/mG6JaE4WuoJrnPFo
	2A6ZdOInZE5f2p5yho2siR5ypUxAuiYbgDYVk6qHJ33cIHB++IKA55SWPjCkO1Tkpqvf5OzbPY9
	uEtlFfQGsJAKaxivBe42y9vBjfiSy3RNvEEvVj/xHsTkUHWM1DPEhgomQWyDIMP1H1EjLB3A6YG
	f9Pl9Z7fT/T2SkVHeXIpC1eQ545AVBXaW7SjVk7Tl8/xS7heOPhKtYmw6I2+wrtC0LjMTzNVFCL
	CqI0RVXDZ5vCMzCUehRJmsiLdjLapC4CqtMd62K9M/D0ahhsgfx2exZlQsNBbMl0tuH1WCWq4QQ
	HO5+bwY421xuCrSbHjthJOkmA=
X-Google-Smtp-Source: AGHT+IEc/rDB1XIEkZ7T9M5CIKlYJn+bt+sf74IR95Ks98OS/SI0N6MNxqx7nWfz1ihO3nPV6De8mw==
X-Received: by 2002:ac2:4183:0:b0:584:2ad8:7ce3 with SMTP id 2adb3069b0e04-5842ad87e22mr755887e87.22.1758892292551;
        Fri, 26 Sep 2025 06:11:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:29 +0000
Subject: [PATCH v3 05/12] media: ipu-bridge: Use v4l2_fwnode_device_parse
 helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-5-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

v4l2_fwnode_device_parse now supports ACPI devices as well. Use the
helper instead of re-implement the logic.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/Kconfig      |  1 +
 drivers/media/pci/intel/ipu-bridge.c | 42 +++++++++++-------------------------
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
index d9fcddce028bf736557e2c6c289d4f8056d80756..69e3108ba02c4f0bc56b0e26ddce9f86775099f6 100644
--- a/drivers/media/pci/intel/Kconfig
+++ b/drivers/media/pci/intel/Kconfig
@@ -8,6 +8,7 @@ config IPU_BRIDGE
 	tristate "Intel IPU Bridge"
 	depends on ACPI || COMPILE_TEST
 	depends on I2C
+	select V4L2_FWNODE
 	help
 	  The IPU bridge is a helper library for Intel IPU drivers to
 	  function on systems shipped with Windows.
diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 4e579352ab2c0be656576fa223429432940747d8..441d1a5979fe94bee4738da68e185a44dbd411d4 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -257,42 +257,22 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 	}
 }
 
-static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
+static enum v4l2_fwnode_orientation
+ipu_bridge_parse_orientation(struct acpi_device *adev,
+			     struct v4l2_fwnode_device_properties *props)
 {
-	enum v4l2_fwnode_orientation orientation;
-	struct acpi_pld_info *pld = NULL;
-
-	if (!acpi_get_physical_device_location(ACPI_PTR(adev->handle), &pld)) {
-		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
+	if (props->orientation == V4L2_FWNODE_PROPERTY_UNSET) {
+		acpi_handle_warn(acpi_device_handle(adev),
+				 "Using default orientation\n");
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
+	return props->orientation;
 }
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 {
+	struct v4l2_fwnode_device_properties props;
 	struct ipu_sensor_ssdb ssdb = {};
 	int ret;
 
@@ -300,6 +280,10 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	if (ret)
 		return ret;
 
+	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
+	if (ret)
+		return ret;
+
 	if (ssdb.vcmtype > ARRAY_SIZE(ipu_vcm_types)) {
 		dev_warn(ADEV_DEV(adev), "Unknown VCM type %d\n", ssdb.vcmtype);
 		ssdb.vcmtype = 0;
@@ -314,7 +298,7 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->lanes = ssdb.lanes;
 	sensor->mclkspeed = ssdb.mclkspeed;
 	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
-	sensor->orientation = ipu_bridge_parse_orientation(adev);
+	sensor->orientation = ipu_bridge_parse_orientation(adev, &props);
 
 	if (ssdb.vcmtype)
 		sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];

-- 
2.51.0.536.g15c5d4f767-goog


