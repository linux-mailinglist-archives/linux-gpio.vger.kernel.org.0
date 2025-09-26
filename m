Return-Path: <linux-gpio+bounces-26621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFFEBA3CE4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 15:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F3F2A39C4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61A42FD1C1;
	Fri, 26 Sep 2025 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KG5EvNbt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BA2FAC12
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892303; cv=none; b=Wa7cWJ9RJygOvxk/3LAPpJPchd7AyI71a0bXabsPk4YbXKVnrLT5U9wWCJxxc8ZT4we0YTcunr3mubEgcWmLPKqFoslCS3FAD8gtfPs0HKLR3Pys2YGHZUhCIgD5kLRocPx1xgVlZetN+8m3wyifTWabxrPpg++vzrW1z2VDMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892303; c=relaxed/simple;
	bh=0RIh4sUDiZBXgZTKOmEK1Orq2YrtKqmiRHFViDVMTyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYQiR5+y/8S/bxGLgt4ze/TwQbUudZqZzPgBD/zoouwqs9TvfeXSg8Fma0OsmQd7a/bIEzwhk6s++QEIYnmcWRxWK1aqrFd32Uz5ZaGtuwpzNxKToZ8WCdTtkdPgKOJucwHBT4oSm37vFdBR3l5nIhThrpmaiTdgYNgmK7cBm/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KG5EvNbt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57933d3e498so2476346e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892296; x=1759497096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYyVOOG6RRM8nz0iAqyuD1/OPjUMPsAlYF5n8yOgLvk=;
        b=KG5EvNbtKUjspmqz8X1KRmEfTDKa0Xhu3kNmyB18jauXyVqhtTZDKqNKBo36Od8P36
         HW5Z5N79kGDQV1yZeOinF/p/os6f470i/0puhOr8aCGeed0IPNdnqyCewSANahWHh1JJ
         7gkEEFlqaDVX23qF6jfU5SNHo/H0QUU6RvxHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892296; x=1759497096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYyVOOG6RRM8nz0iAqyuD1/OPjUMPsAlYF5n8yOgLvk=;
        b=Lv9pxlPsbPE/Is8T/oL8ilwhdTOPYRkH9ig/j1Fc5nT1C43icmO+W9oPwcftliVbKo
         8ic15qj9EY5RF3TaZmI+kW1u1ogwgnBGAKcWmXVRjj2E/O95uKcI4c89C6vUVDhkbOsz
         Iact1U/SphbHh6f+ZoGWyZM8Vw3MMDdohIcqeHQfQn39c+qVJui1owKzC4A+OYNx3Hul
         t9zq2k6yXj6mI2TvWnIn2ite0mINZnmRcEoLXksYOyj+/EX35hiyYqD/S95O6rhBSde4
         gd4XFdwaJD+x25s3HzIHVTPVhhZWC+GIvd4kiWu2TTOzTfkCADngOs0cTng7v2ervij4
         5a3g==
X-Forwarded-Encrypted: i=1; AJvYcCVax/5NoLl8n+wlc6paq/W3hxZ8B0sBeBrut2U4ZRznTROCQe+8Qdepzo48BIigTWrpGu2DZ5OByNyq@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+V/AwWs32sg1zM6EC0XV3fMfqaQXf8GFxwku20eeMeIb7k9N
	CNQSSOmue7WCuK9T5HfbQTC+fm4+nYuOjjTa3vmE4rtrOE98d/5lXJQTgNJnKcwkYw==
X-Gm-Gg: ASbGncsYcyKW72xnrekXTAgX7EVzl4vCD08gEqF0LvYMO5hYi0iI4gJ7ZHApcCl2BBs
	vFnNF/6D4gPVHnBiTCFCKqAd90Q8gtKiAaTGxC8+gAwMMPBiXdab6hwLlT6hsAGP8G6AaWWsQKm
	FE0XlHeNV/MNg2POer3TpCkgpuyymNZgWi68H0bUG8mt4fZ/UfSibkC0UU5tFXlMhCk2+Dgk8oz
	Z2oT+OtP3aasmwt7tmDnqs3O6CWSnXARK/urzzF1HoTLj9S7GL7rN49LSTAurgGOObFKr5DhteQ
	S/3RTy0cBYVcLtZqs/WnCMr/LsGg0BwiC+RJ0miBturrkQWxrcL39KzHN04jUl4n1z46AIPkbrh
	W50CvMN0snMGDqv6rQd5o0nhTONlUkabcpaZbescBlWpJorAcU7/Td3VaOEHHURi+Y/06jGi2WY
	uS4g==
X-Google-Smtp-Source: AGHT+IGpDWvtokITIA2zTptMNOmw/ZYaGZaFcnmGwqV7Ib3ziWjeQpXNcwBL/nnOmUeOfVGug4KhQg==
X-Received: by 2002:a05:6512:220d:b0:577:494e:ca63 with SMTP id 2adb3069b0e04-582d0740473mr2291049e87.12.1758892294482;
        Fri, 26 Sep 2025 06:11:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:32 +0000
Subject: [PATCH v3 08/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-8-6dc2fa5b4220@chromium.org>
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

Fetch the orientation from the fwnode and map it into a control.

The uvc driver does not use the media controller, so we need to create a
software entity, like we previously did with the external gpio.

We do not re-purpose the external gpio entity because its is planned to
remove it.

We need to make uvc_alloc_entity non static.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Kconfig        |  1 +
 drivers/media/usb/uvc/Makefile       |  3 +-
 drivers/media/usb/uvc/uvc_ctrl.c     | 21 ++++++++++
 drivers/media/usb/uvc/uvc_driver.c   | 22 +++++++----
 drivers/media/usb/uvc/uvc_entity.c   |  1 +
 drivers/media/usb/uvc/uvc_swentity.c | 76 ++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h     | 17 ++++++++
 include/linux/usb/uvc.h              |  3 ++
 8 files changed, 135 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/Kconfig b/drivers/media/usb/uvc/Kconfig
index 579532272fd6d7a8ef65c1a3a892b723f40e584e..65f9cf81c8f434c50910db0ae94788af182eb4c4 100644
--- a/drivers/media/usb/uvc/Kconfig
+++ b/drivers/media/usb/uvc/Kconfig
@@ -4,6 +4,7 @@ config USB_VIDEO_CLASS
 	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	select UVC_COMMON
+	select V4L2_FWNODE
 	help
 	  Support for the USB Video Class (UVC).  Currently only video
 	  input devices, such as webcams, are supported.
diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..b4398177c4bb0a9bd49dfd4ca7f2e933b4a1d7df 100644
--- a/drivers/media/usb/uvc/Makefile
+++ b/drivers/media/usb/uvc/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
-		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
+		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
+		  uvc_swentity.o
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
 uvcvideo-objs  += uvc_entity.o
 endif
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a869257e9b7c07eaa7d725d107bd1cb57d3c7377..aa9de84de9236540c46ee78fb8458873d503786e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -385,6 +385,13 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_GET_RANGE
 				| UVC_CTRL_FLAG_RESTORE,
 	},
+	{
+		.entity		= UVC_GUID_SWENTITY,
+		.selector	= 0,
+		.index		= 0,
+		.size		= 1,
+		.flags		= UVC_CTRL_FLAG_GET_CUR,
+	},
 };
 
 static const u32 uvc_control_classes[] = {
@@ -1009,6 +1016,17 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.menu_mask	= BIT(V4L2_COLORFX_VIVID) |
 				  BIT(V4L2_COLORFX_NONE),
 	},
+	{
+		.id		= V4L2_CID_CAMERA_ORIENTATION,
+		.entity		= UVC_GUID_SWENTITY,
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
@@ -3281,6 +3299,9 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
 			bmControls = entity->gpio.bmControls;
 			bControlSize = entity->gpio.bControlSize;
+		} else if (UVC_ENTITY_TYPE(entity) == UVC_SWENTITY_UNIT) {
+			bmControls = entity->swentity.bmControls;
+			bControlSize = entity->swentity.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fa61f1d0ea2c3d52c560b2f0834e52ca75c4227e..91edc7703b1987d8dfd552999edbdbf1b4653f3f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -794,9 +794,9 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
-					       u16 id, unsigned int num_pads,
-					       unsigned int extra_size)
+struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
+					u16 id, unsigned int num_pads,
+					unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
@@ -1887,12 +1887,14 @@ static int uvc_scan_device(struct uvc_device *dev)
 		return -ENODEV;
 	}
 
-	/* Add GPIO entity to the first chain. */
-	if (dev->gpio_unit) {
-		chain = list_first_entry(&dev->chains,
-					 struct uvc_video_chain, list);
+	/* Add virtual entities to the first chain. */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+
+	if (dev->gpio_unit)
 		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
-	}
+
+	if (dev->swentity_unit)
+		list_add_tail(&dev->swentity_unit->chain, &chain->entities);
 
 	return 0;
 }
@@ -2244,6 +2246,10 @@ static int uvc_probe(struct usb_interface *intf,
 	if (ret < 0)
 		goto error;
 
+	ret = uvc_swentity_init(dev);
+	if (ret < 0)
+		goto error;
+
 	dev_info(&dev->intf->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,
 		 udev->product ? udev->product : "<unnamed>",
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index ee1007add243036f68b7014ca621813e461fa73d..d5125fdd829a7e11f7083762531f811069e0e43f 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -86,6 +86,7 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_VC_PROCESSING_UNIT:
 		case UVC_VC_EXTENSION_UNIT:
 		case UVC_EXT_GPIO_UNIT:
+		case UVC_SWENTITY_UNIT:
 			/* For lack of a better option. */
 			function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 			break;
diff --git a/drivers/media/usb/uvc/uvc_swentity.c b/drivers/media/usb/uvc/uvc_swentity.c
new file mode 100644
index 0000000000000000000000000000000000000000..eefc5d08e370515181f74590f2f38189770b01b2
--- /dev/null
+++ b/drivers/media/usb/uvc/uvc_swentity.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *      uvc_swentity.c  --  USB Video Class driver
+ *
+ *      Copyright 2025 Google LLC
+ */
+
+#include <linux/kernel.h>
+#include <linux/usb/uvc.h>
+
+#include <media/v4l2-fwnode.h>
+
+#include "uvcvideo.h"
+
+static int uvc_swentity_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
+				u8 cs, void *data, u16 size)
+{
+	if (size < 1)
+		return -EINVAL;
+
+	switch (entity->swentity.props.orientation) {
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
+static int uvc_swentity_get_info(struct uvc_device *dev,
+				 struct uvc_entity *entity, u8 cs, u8 *caps)
+{
+	*caps = UVC_CONTROL_CAP_GET;
+	return 0;
+}
+
+int uvc_swentity_init(struct uvc_device *dev)
+{
+	static const u8 uvc_swentity_guid[] = UVC_GUID_SWENTITY;
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
+	unit = uvc_alloc_new_entity(dev, UVC_SWENTITY_UNIT,
+				    UVC_SWENTITY_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
+
+	memcpy(unit->guid, uvc_swentity_guid, sizeof(unit->guid));
+	unit->swentity.props = props;
+	unit->swentity.bControlSize = 1;
+	unit->swentity.bmControls = (u8 *)unit + sizeof(*unit);
+	unit->swentity.bmControls[0] = 1;
+	unit->get_cur = uvc_swentity_get_cur;
+	unit->get_info = uvc_swentity_get_info;
+	strscpy(unit->name, "SWENTITY", sizeof(unit->name));
+
+	list_add_tail(&unit->list, &dev->entities);
+
+	dev->swentity_unit = unit;
+
+	return 0;
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 24292efbe47d3cd440252afb85ecbc826e2eedc1..04ca5dcce11d902dbfdf32f2a962159ba7940a39 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -18,6 +18,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
+#include <media/v4l2-fwnode.h>
 #include <media/videobuf2-v4l2.h>
 
 /* --------------------------------------------------------------------------
@@ -38,6 +39,9 @@
 	(UVC_ENTITY_IS_TERM(entity) && \
 	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
 
+#define UVC_SWENTITY_UNIT		0x7ffd
+#define UVC_SWENTITY_UNIT_ID		0x101
+
 #define UVC_EXT_GPIO_UNIT		0x7ffe
 #define UVC_EXT_GPIO_UNIT_ID		0x100
 
@@ -247,6 +251,12 @@ struct uvc_entity {
 			int irq;
 			bool initialized;
 		} gpio;
+
+		struct {
+			u8  bControlSize;
+			u8  *bmControls;
+			struct v4l2_fwnode_device_properties props;
+		} swentity;
 	};
 
 	u8 bNrInPins;
@@ -623,6 +633,7 @@ struct uvc_device {
 	} async_ctrl;
 
 	struct uvc_entity *gpio_unit;
+	struct uvc_entity *swentity_unit;
 };
 
 struct uvc_fh {
@@ -688,6 +699,9 @@ do {									\
  */
 
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
+struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
+					u16 id, unsigned int num_pads,
+					unsigned int extra_size);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
@@ -813,4 +827,7 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
 size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
+/* swentity */
+int uvc_swentity_init(struct uvc_device *dev);
+
 #endif
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index 22e0dab0809e296e089940620ae0e8838e109701..654182c2d22cdd9c72709247c1c8cabf9f5b19ee 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -29,6 +29,9 @@
 #define UVC_GUID_EXT_GPIO_CONTROLLER \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
+#define UVC_GUID_SWENTITY \
+	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
+	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04}
 #define UVC_GUID_CHROMEOS_XU \
 	{0x24, 0xe9, 0xd7, 0x74, 0xc9, 0x49, 0x45, 0x4a, \
 	 0x98, 0xa3, 0xc8, 0x07, 0x7e, 0x05, 0x1c, 0xa3}

-- 
2.51.0.536.g15c5d4f767-goog


