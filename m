Return-Path: <linux-gpio+bounces-18220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1EA7AE75
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 22:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86BD1648A0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 20:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278C4205AD2;
	Thu,  3 Apr 2025 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zec3XZj0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602C2040AE
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707795; cv=none; b=KJpa1m/PBp9ANuF+5VuUhNVY8m9LYNKAfrONeI0uXsS4rzNE1wDf/az2Zg9Tm/dizKevbK7kuogy6yIRGUqkF5suNXc1DNGkON6t+CWJeJIpFrq46/LkPxhnkdzpdY7HjeCuzio8lQ72rmNDcwPmyqk45m9hroLEz1dcrmRBvTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707795; c=relaxed/simple;
	bh=XJEMprlCEsKfWYhy5LoPnYnpm2JF0ywPCss0Gv2wgfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y68FG1Dcvhh1b+NTTq1SlEjKFTdVh0CPKJT2M2LBcItEB+mahTqtRJvdOfJM3RNU88BlzNOK2iSOGzLfrUrfMNECMLtoAyOery76rZ+sW4MqyXJIqy2UZArYdjTJ+hNPAKYten3UfGiziij5CNJjoS8TXhn0wO6rjisILNScV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zec3XZj0; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso1510636e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707790; x=1744312590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktHQdoTvKewbftgZa2kS1uVSmUgEOG8hJ1cjDiKOz20=;
        b=Zec3XZj0EqGAttJQvFMhIroaiSKZImGGT1aFHzFWv6CpioaQom3O6gli82EvI9cUHm
         VqQ3G4Ss0VBw9TA2J8mLmKQf2iF7VKShIzFueOdz35utsXcCz86iG5uGAI595P/ryT9O
         /4+QlstkDtcntVVWbXb3dv+lypERJgvyuS2cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707790; x=1744312590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktHQdoTvKewbftgZa2kS1uVSmUgEOG8hJ1cjDiKOz20=;
        b=nikM2HfDGmz2DW6cVWvM4g5Rm64dJeoH3WouYbgNvt8m4BcOLO74+D3qhoA4R7oQ5v
         ma3rg9queFkfmV48ZLj5h5QWGqDmW04zkipt14hdvb3xJX9TLyCHcIP2SQFr6wnVIQAY
         81nAtEc+Vnboif6U+FonOipBQ3mQBgeQbUv1fBOQiMDef9hruyhMb6TOripnqnVHEuWI
         BC08ABMHuGfVM1Su8xCahgqekmEbDzs0yYrxScvSUCxRxEdQ/F2IjWTKrB+bT8s8qhDR
         PmeO4OqsiZKdHK48IFW0Qdhn3q9vnupC1MFbubtmv1PaIjnfCA9LtReiSm2X275Gryu5
         81CA==
X-Forwarded-Encrypted: i=1; AJvYcCXdXzoVrJgaR3dbZ20lcTqpYv3aw+C2CYvb1J31M8T/LMu9IOD4pGHH8Xn9/G6i2u0ah5pq2e4u44Dp@vger.kernel.org
X-Gm-Message-State: AOJu0YzM6VpYD1jX0NrZLnzT4+Yf2SCw6OLiuLE31wJp5oViKmG/SjIP
	mwxJBzlsj5h2QTtoLbezFej3EfLzBNv14zGs4jkko49mibESJhlNqOdNHoD3np2rU3qdQUINBEY
	=
X-Gm-Gg: ASbGnct29tAc8eGuoCWBfBIgiD++DN03ZBQbX/uSNPUKh2tlC/VCnK0qJ3Dgpl5I/hj
	/OypFjRwyKdcvbQcMDAwJmkki8JxK02Hdu0iLXQevNxiMGPv2tLfAE0/MCazdp3fQKFeIEhmwc6
	SrujScr2ek9/656rLz+VDdyLPvfAcyWmbGrWSQ6+KskPovxJqLBxvgF0ZPbMugTAcYb6EUHh4Jg
	AjHsZb+X0E22ko2btSGNH7r4IWvi6X8QNq5bMYOzlGH9vajd36Wi6SE+aR0OBYsm94AmrgrIHMD
	dy31q0lyeTqGydG+xFOuffIMkMM26qJVk+Clp6VWv/zYSXsIXsbcM5YJEIJarwJtM1K5xCSDyuH
	b0bweJ4astCP6kfWBIyxe+NCXZG2y+32tTkM=
X-Google-Smtp-Source: AGHT+IGVmGTZb50MVDuSzioZRE+RjuIhc164Y+aVsClKCW9Z3Yiby6JXeaNfKhHGp2ARsGmyfYIwxw==
X-Received: by 2002:a05:6512:a94:b0:545:22ec:8b6c with SMTP id 2adb3069b0e04-54c2280a275mr116502e87.35.1743707789796;
        Thu, 03 Apr 2025 12:16:29 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:28 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:18 +0000
Subject: [PATCH 7/8] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-7-1a0cc595a62d@chromium.org>
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

Fetch the orientation from the fwnode and map it into a control.

The uvc driver does not use the media controller, so we need to create a
virtual entity, like we previously did with the external gpio.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Makefile     |  2 +-
 drivers/media/usb/uvc/uvc_ctrl.c   | 21 +++++++++++
 drivers/media/usb/uvc/uvc_driver.c | 14 ++++++--
 drivers/media/usb/uvc/uvc_entity.c |  1 +
 drivers/media/usb/uvc/uvc_fwnode.c | 73 ++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   | 15 ++++++++
 include/linux/usb/uvc.h            |  3 ++
 7 files changed, 125 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 85514b6e538fbb8284e574ca14700f2d749e1a2e..2a5b76aab756c21011d966f3ce0410ff6b8e5b19 100644
--- a/drivers/media/usb/uvc/Makefile
+++ b/drivers/media/usb/uvc/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
 		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
-		  uvc_gpio.o
+		  uvc_gpio.o uvc_fwnode.o
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
 uvcvideo-objs  += uvc_entity.o
 endif
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index cbf19aa1d82374a08cf79b6a6787fa348b83523a..df84bf292dcab6b833fbd3c70eccbe9e567ee567 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -376,6 +376,13 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_GET_DEF
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_FWNODE,
+		.selector	= 0,
+		.index		= 0,
+		.size		= 1,
+		.flags		= UVC_CTRL_FLAG_GET_CUR,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -975,6 +982,17 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
 		.name		= "Region of Interest Auto Ctrls",
 	},
+	{
+		.id		= V4L2_CID_CAMERA_ORIENTATION,
+		.entity		= UVC_GUID_FWNODE,
+		.selector	= 0,
+		.size		= 8,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+		.menu_mask	= GENMASK(V4L2_CAMERA_ORIENTATION_EXTERNAL,
+					  V4L2_CAMERA_ORIENTATION_FRONT),
+	},
 };
 
 /* ------------------------------------------------------------------------
@@ -3170,6 +3188,9 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
 			bmControls = entity->gpio.bmControls;
 			bControlSize = entity->gpio.bControlSize;
+		} else if (UVC_ENTITY_TYPE(entity) == UVC_FWNODE_UNIT) {
+			bmControls = entity->fwnode.bmControls;
+			bControlSize = entity->fwnode.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b52e1ff401e24f69b867b5e975cda4260463e760..9a8e5d94b3eba09e1ee1be20bad5b016b6def915 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1752,11 +1752,15 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -1;
 	}
 
-	/* Add GPIO entity to the first chain. */
-	if (dev->gpio_unit) {
+	/* Add virtual entities to the first chain. */
+	if (dev->gpio_unit || dev->fwnode_unit) {
 		chain = list_first_entry(&dev->chains,
 					 struct uvc_video_chain, list);
-		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
+		if (dev->gpio_unit)
+			list_add_tail(&dev->gpio_unit->chain, &chain->entities);
+		if (dev->fwnode_unit)
+			list_add_tail(&dev->fwnode_unit->chain,
+				      &chain->entities);
 	}
 
 	return 0;
@@ -2132,6 +2136,10 @@ static int uvc_probe(struct usb_interface *intf,
 	if (ret < 0)
 		goto error;
 
+	ret = uvc_fwnode_parse(dev);
+	if (ret < 0)
+		goto error;
+
 	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		 udev->product ? udev->product : "<unnamed>",
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..01eeba2f049e9ebb25e091340a133656acbf28ca 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -106,6 +106,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
 		case UVC_EXT_GPIO_UNIT:
+		case UVC_FWNODE_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;
diff --git a/drivers/media/usb/uvc/uvc_fwnode.c b/drivers/media/usb/uvc/uvc_fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..20f7b8847551acfd44cbf09bcbf653d89985561f
--- /dev/null
+++ b/drivers/media/usb/uvc/uvc_fwnode.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *      uvc_fwnode.c  --  USB Video Class driver
+ *
+ *      Copyright 2025 Google LLC
+ */
+
+#include <linux/kernel.h>
+#include <linux/usb/uvc.h>
+#include <media/v4l2-fwnode.h>
+#include "uvcvideo.h"
+
+static int uvc_fwnode_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
+			      u8 cs, void *data, u16 size)
+{
+	if (size < 1)
+		return -EINVAL;
+
+	switch (entity->fwnode.props.orientation) {
+	case V4L2_FWNODE_ORIENTATION_FRONT:
+		*(u8 *)data = V4L2_CAMERA_ORIENTATION_FRONT;
+		break;
+	case V4L2_FWNODE_ORIENTATION_BACK:
+		*(u8 *)data = V4L2_CAMERA_ORIENTATION_BACK;
+		break;
+	default:
+		*(u8 *)data = V4L2_CAMERA_ORIENTATION_EXTERNAL;
+	}
+
+	return 0;
+}
+
+static int uvc_fwnode_get_info(struct uvc_device *dev,
+			       struct uvc_entity *entity, u8 cs, u8 *caps)
+{
+	*caps = UVC_CONTROL_CAP_GET;
+	return 0;
+}
+
+int uvc_fwnode_parse(struct uvc_device *dev)
+{
+	static const u8 uvc_fwnode_guid[] = UVC_GUID_FWNODE;
+	struct v4l2_fwnode_device_properties props;
+	struct uvc_entity *unit;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(&dev->udev->dev, &props);
+	if (ret)
+		return dev_err_probe(&dev->intf->dev, ret,
+				     "Can't parse fwnode\n");
+
+	if (props.orientation == V4L2_FWNODE_PROPERTY_UNSET)
+		return 0;
+
+	unit = uvc_alloc_entity(UVC_FWNODE_UNIT, UVC_FWNODE_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
+
+	memcpy(unit->guid, uvc_fwnode_guid, sizeof(unit->guid));
+	unit->fwnode.props = props;
+	unit->fwnode.bControlSize = 1;
+	unit->fwnode.bmControls = (u8 *)unit + sizeof(*unit);
+	unit->fwnode.bmControls[0] = 1;
+	unit->get_cur = uvc_fwnode_get_cur;
+	unit->get_info = uvc_fwnode_get_info;
+	strscpy(unit->name, "FWNODE", sizeof(unit->name));
+
+	list_add_tail(&unit->list, &dev->entities);
+
+	dev->fwnode_unit = unit;
+
+	return 0;
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index aef96b96499ce09ffa286c51793482afd9832097..c52ab99bf8d21ab37270d27ffc040fd115b3f5ba 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -19,6 +19,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
 #include <media/videobuf2-v4l2.h>
+#include <media/v4l2-fwnode.h>
 
 /* --------------------------------------------------------------------------
  * UVC constants
@@ -41,6 +42,9 @@
 #define UVC_EXT_GPIO_UNIT		0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID		0x100
 
+#define UVC_FWNODE_UNIT			0x7ffd
+#define UVC_FWNODE_UNIT_ID		0x101
+
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
@@ -242,6 +246,12 @@ struct uvc_entity {
 			int irq;
 			bool initialized;
 		} gpio;
+
+		struct {
+			u8  bControlSize;
+			u8  *bmControls;
+			struct v4l2_fwnode_device_properties props;
+		} fwnode;
 	};
 
 	u8 bNrInPins;
@@ -617,6 +627,7 @@ struct uvc_device {
 	} async_ctrl;
 
 	struct uvc_entity *gpio_unit;
+	struct uvc_entity *fwnode_unit;
 };
 
 enum uvc_handle_state {
@@ -835,4 +846,8 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 int uvc_gpio_parse(struct uvc_device *dev);
 int uvc_gpio_init_irq(struct uvc_device *dev);
 void uvc_gpio_deinit(struct uvc_device *dev);
+
+/* fwnode */
+int uvc_fwnode_parse(struct uvc_device *dev);
+
 #endif
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index bce95153e5a65613a710d7316fc17cf5462b5bce..d818839b0442988d94ab44935e1ce855b0adf4a1 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_FWNODE \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
 
 #define UVC_GUID_FORMAT_MJPEG \
 	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
2.49.0.504.g3bcea36a83-goog


