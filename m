Return-Path: <linux-gpio+bounces-26623-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D7BA3CDF
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 15:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B06C626BAB
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BA12FD7C7;
	Fri, 26 Sep 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BmGX5Z0P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478E32F8BC4
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892304; cv=none; b=A85wrKEVJgYPQpHnDbPabqYxXbH8xS1zdEWQF+E4iODPeH6b42++jVM5U8VV57UMAny1+u7V3y3Fo0R9x7KIoWOtm0sxoXBLmXfEahlPMsHRlOa73XbcSFCptX35keox3FYWqndh8fGW2T/rxEEu3XM7xbm5uFfH9bbJzFOYBVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892304; c=relaxed/simple;
	bh=7+uj94r/7LeT/xAkBfTGJ8aSRCSPNzAL0fCA+D8DD2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPig+Or6S81dbeEGntkLMPOMfnen993qqlz8b07HswKd38jUabmXkbc0JTkNNEZenVPb7l0bVpwfg4i8OA6L/FK5Mr3RZGW2PCbFCjhO8BfLpXOmveLpJFQpXKJC4LJP+98lwI2JC2fx0OZkDfXcSaDBr+TZe78aCVBDiWVaWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BmGX5Z0P; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2297507e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892294; x=1759497094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCy6Bk8e0KycgUL3e8TXrZ2btc+fiyl+rPdd78IS8Is=;
        b=BmGX5Z0PvX78ztmXsmk/MgO7YHO5kshdUTFo6L3WtxQhR3b37olVG9YSfVpI3QmYAI
         EhK0fDcsUSUO3HgE8vLcFK4A664M8X+Bzz0LHtyT64tXMPIS3PsEW6oAJDGLJiSNZl7E
         dXCAQzyq95/E8D537XqgOO3WqhOEOUoH1rkh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892294; x=1759497094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCy6Bk8e0KycgUL3e8TXrZ2btc+fiyl+rPdd78IS8Is=;
        b=EuRGKWpYmIT6R81nd7bRqlE2YtbQoeL/l7JvT+ZFxQWd2hrt/xbJ+zytaDnoNTHGjC
         YSzdmeAC9CCNRmz1vb5eMxLFmGsoLktRKVaSSd9/+aXwhweOSvTRAf2iuSxlfDo+6Heg
         mMvrDVDm1SEAf4tlV1qidScBSMr9Rv4feTEdzc8WkcxxKQnaxjzcpHDr8pdMcDZx/0aa
         wu6uDVzwJJzMjYx7CTGnqgS2jiINP81VIFPGEJQLcsmmzAsTlZyBtnskkIoG+jNzoxVu
         bR+sL2onF82WZmZCJvRQhOvrW1ChwAP/1V0l0hog5by+m97ske1kgZP0TakcxPQdNEgE
         B5qw==
X-Forwarded-Encrypted: i=1; AJvYcCW0VP8c8Zz1QTsD6OtKr24YodTf2sXfuetuGbEWNC7/MFzinQnWg+LYOHEu/BT2z6R+PG8iIP8CAybE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlvymuz8eVS+vRJVnfhZFpix7vkJy6RCDZIo2eMzrj2gAjon92
	7L+e+iQzT7j0j0F7HEyeukCKqfiHeUcxnXslPz9aYRYClROBUeyFpn1lq4IMvp7zpQ==
X-Gm-Gg: ASbGncvIa07UJMrCkGAyk2qqwCBTQc8uFxTDi9lSsNjPxrMsyA3d0cq3G/yxJ6JtEf5
	YSbMon7k0XAED2PGevbLgC33realDCVmclwYxpJrZffBp6jmu9/4ytGtX8k4redV0VSTtjMji+3
	dS3rJFd4S2aHB/sJeNeounSPxnHxwUpYuB0FW8PLs2NmRrFWhwtMHfgzucS8hxGCDV6J6p9OFop
	SWMbE2tgQGe/eyADM47+yhXFxngwZ0O+/DwbAwE2jIP2/5f9AJDNFSom+zUuB4oC1wkoL6Z949B
	GR78+qnN9PECGM69gB1LyTtUTyQ0UXvq/OmwaglwFZEa6Wm/kMhiuHDAOCYrp+PDwZnizB7Tcnf
	VT0Z50QkIF/IPHg46HZw59rcxALYX+tqasS+1zZTVUV16jsdx6gffZ2W8/rtPySiO5Sqh63W3WR
	yboA==
X-Google-Smtp-Source: AGHT+IFSULi7NpOrywI1NGNOQUbBJbkaKZRrtRNyEnHKO4o1kB5FT5TGBNkhNPYRfI8ePxwjL+x0fg==
X-Received: by 2002:a05:6512:15a9:b0:57a:2be1:d773 with SMTP id 2adb3069b0e04-582d406b8a4mr1982976e87.53.1758892293940;
        Fri, 26 Sep 2025 06:11:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:31 +0000
Subject: [PATCH v3 07/12] dt-bindings: media: Add usb-camera-module
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-7-6dc2fa5b4220@chromium.org>
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

For fixed cameras modules the OS needs to know where they are mounted.
This information is used to determine if images need to be rotated or
not.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar properties for video-interface-devices called
orientation and rotation:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add a new schema that combines usb/usb-device.yaml and
media/video-interface-devices.yaml

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../bindings/media/usb-camera-module.yaml          | 46 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/usb-camera-module.yaml b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e4ad6f557b9151751522e49b72ae6584deb0c7ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/usb-camera-module.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB Camera Module
+
+maintainers:
+  - Ricardo Ribalda <ribalda@chromium.org>
+
+description: |
+  This schema allows for annotating auxiliary information for fixed camera
+  modules. This information enables the system to determine if incoming frames
+  require rotation, mirroring, or other transformations. It also describes the
+  module's relationship with other hardware elements, such as flash LEDs or
+  Voice Coil Motors (VCMs).
+
+allOf:
+  - $ref: /schemas/usb/usb-device.yaml#
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  reg:
+    maxItems: 1
+
+required:
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    usb@11270000 {
+        reg = <0x11270000 0x1000>;
+        interrupts = <0x0 0x4e 0x0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        device@1 {
+            compatible = "usb123,4567";
+            reg = <2>;
+            orientation = <0>;
+            rotation = <90>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ee8cb2db483f6a5e96b62b6f2edd05b1427b69f5..1503502a3aed2625e8ff488456ccd7305cc74ba7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26258,6 +26258,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/usb-camera-module.yaml
 F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst

-- 
2.51.0.536.g15c5d4f767-goog


