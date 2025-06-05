Return-Path: <linux-gpio+bounces-21058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44211ACF5C7
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 19:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 958EE189AF0A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 17:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D048027C163;
	Thu,  5 Jun 2025 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q9SfuKhf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7232798EC
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145989; cv=none; b=ce7HYedbjCvL7daXmmPGfmL/aw9/bDomrV7KEAuTge3vWhooEQWEp9grox8hyDrHO4Sy1j/So4XzyM9EizBOcxkrLxFyqI+vig7A2+MKSNYNW1iUTWHAzC+/HgJH4pZgrt6ZTtLCCoj2JC20osBZiTIdF+aT05v8c6V4wBKDAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145989; c=relaxed/simple;
	bh=eN2NqpRnpXYpl4E3GCmZNzKt19bmwjyh05by15ZauKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuW23hUSkEoFDNzsK4zS6POUNtJIi1+IGycuVv+gSmWTgQSVsQhRJw1HO3NbQbxjKwb8PwwuZhFVJZ2f+8uRIDbYT1h//M06y5bR+k2WZZ0a1AJi8GC42CSk4nhvTMMP68ERlms734xdvoIgiiOMhaUHwfsI2jo+22Zr/l7IUrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q9SfuKhf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so1309678e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145984; x=1749750784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/BKOipaa0AeDKKmUIkRbQ0YnQTBaMveRhFI1BloNvM=;
        b=Q9SfuKhflYnlcPWMjOga76HYIaNOo02cO//qVkzvyO8fknsjawD9AYiFXh36Ow56+6
         8E3FJ9Nx/kMata0brO30hXR9hlcObkNkTqc58bnjj/nimFv6eoTBUUTmH8x4CUV3u16A
         Tj1keHwAJLI2q9QkggPCcwKa9mf+lxhP88p1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145984; x=1749750784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/BKOipaa0AeDKKmUIkRbQ0YnQTBaMveRhFI1BloNvM=;
        b=OEwxP77gP77bKTQIT02wbZ1J6U2z8cgibQyC6s+3tI5rUwyOH8BXuj/wvyRijrMay7
         3eajBjxe7OugQbKhoMGSFilNCLI3oQEp02+muz8dwVIX9b9Z385vecWWbO8qdHhR+kOS
         jUJKyG0OP/Y/vbhNCDTdS8Swn0xQ5n/nFSfUAaCLvIIGNTGUj9/hKdcgtik7dUJQ+Wd2
         MKbmIFDMqXCmae1dnkhdqw+1nz0rWzJlBWDviWrRm2DvR1ZVIzp2ewD7JP6/dMjDkPIi
         +pEGfYFLQPStPWqnpOII55nR83UX/I1OM6nto1khqPPFgqq+mEUI6yQ8LMScqYr3+kvu
         rObQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKn6wnPSeAWL9M7e1Uq0TLvEB6Jl9VWlLuCbLSekx1CIjI4N+c+MrS3/ZvGhPwlKuTdcZg6mitIsB3@vger.kernel.org
X-Gm-Message-State: AOJu0YxljIgud1pH1fIknRwqITGCIbBL/LP0+8Bat7HsJ79eIMNIPRD/
	tfAjVskYp1Y5gHB97cWphrqYL7lSsxv9wOfXQCZ1AcrfYyrUO0y5axdyS6yhpcjuQA==
X-Gm-Gg: ASbGncvlLYa+Q23gHz3ELNYiVI/jUgrkgbTlikB34ZDbtV/3g6b7FeRyP664/SaEOOv
	89W/0IU1YZOLBe0FjeYllytP2K0QMfiAw7FLf2xznSsg+MdTqtOQOayjQBSv14a1/d+9YD8/ZL3
	ahfa9FOOrfWyv3sVUrIZuzeVsOBi9ovfQwU60cZ7tgYDAcgaszaKS0UrSP8R3U55EeoEUUTcx29
	UA9HkpVsrWd30I7delNDLKOjq5P6n+Juyk6zaPCNBNtDdXVA3SFOVetReXiouNUgFrhwYGVdlyP
	5stWnRV8UdjVwmKBE+ckuX5hfYvZjZvxcmkaaOJ/JZw2TRgKcBjE529HNkxvbOSbdtDBnIovIaI
	R4Lyl40BE8ID3IBF03ZMU2dIUQg==
X-Google-Smtp-Source: AGHT+IFdxuqyfHnNl8OVH+/gLEAeEElSe/53dZeUw33MEGW+QrVTJwknGhZW8Toc3Ow5cY8PaKjVgQ==
X-Received: by 2002:a05:6512:1289:b0:553:3892:5eaa with SMTP id 2adb3069b0e04-55366c38b6amr15211e87.55.1749145983869;
        Thu, 05 Jun 2025 10:53:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:55 +0000
Subject: [PATCH v2 02/12] media: v4l: fwnode: Support ACPI's _PLD for
 v4l2_fwnode_device_parse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-2-5710f9d030aa@chromium.org>
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

Currently v4l2_fwnode_device_parse() obtains the orientation and
rotation via fwnode properties.

Extend the function to support as well ACPI devices with _PLD info.

We give a higher priority to fwnode, because it might contain quirks
injected via swnodes.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 85 ++++++++++++++++++++++++++++++++---
 1 file changed, 79 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..379290ab3cfde74c8f663d61837a9a95011b5ae0 100644
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
@@ -807,16 +808,65 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
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
+	if (!is_acpi_device_node(dev_fwnode(dev)))
+		return 0;
+
+	if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
+		dev_dbg(dev, "acpi _PLD call failed\n");
+		return 0;
+	}
+
+	if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
+		switch (pld->panel) {
+		case ACPI_PLD_PANEL_FRONT:
+			props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
+			break;
+		case ACPI_PLD_PANEL_BACK:
+			props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
+			break;
+		case ACPI_PLD_PANEL_TOP:
+		case ACPI_PLD_PANEL_LEFT:
+		case ACPI_PLD_PANEL_RIGHT:
+		case ACPI_PLD_PANEL_UNKNOWN:
+			props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
+			break;
+		default:
+			dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
+			ret = -EINVAL;
+			goto done;
+		}
+	}
+
+	if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET) {
+		switch (pld->rotation) {
+		case 0 ... 7:
+			props->rotation = pld->rotation * 45;
+			break;
+		default:
+			dev_dbg(dev, "Unknown _PLD rotation val %d\n", pld->panel);
+			ret = -EINVAL;
+			goto done;
+		}
+	}
+
+done:
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
@@ -833,7 +883,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
 		dev_dbg(dev, "device orientation: %u\n", val);
 	}
 
-	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
 	if (!ret) {
 		if (val >= 360) {
@@ -847,6 +896,30 @@ int v4l2_fwnode_device_parse(struct device *dev,
 
 	return 0;
 }
+
+int v4l2_fwnode_device_parse(struct device *dev,
+			     struct v4l2_fwnode_device_properties *props)
+{
+	int ret;
+
+	memset(props, 0, sizeof(*props));
+
+	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
+	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
+
+	/* Start by looking into swnodes and dt. */
+	ret =  v4l2_fwnode_device_parse_dt(dev, props);
+	if (ret)
+		return ret;
+
+	/* Orientation and rotation found!, we are ready. */
+	if (props->orientation != V4L2_FWNODE_PROPERTY_UNSET &&
+	    props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
+		return 0;
+
+	/* Let's check the acpi table. */
+	return v4l2_fwnode_device_parse_acpi(dev, props);
+}
 EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
 
 /*

-- 
2.50.0.rc0.642.g800a2b2222-goog


