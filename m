Return-Path: <linux-gpio+bounces-23496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8FB0A798
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70927AA194F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F059F2E06C3;
	Fri, 18 Jul 2025 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K7jTF7MB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3292DE6F4
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852557; cv=none; b=GcgJDWblKNCfcNqdnRBUoquUZ9tiv0FhOuWosSmwbYIgW9o+Ke7Yem8p8FkpRJ0q5A/+YuVFqUHJ+fGeLcUCnUa3yQiZAFGIz9QM6C71hknhn2HS8KOKi+S7HczFxWcRuC3mI8g75nNHta1zCIj+GF2knnlZQ8uhVpZv/05sb3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852557; c=relaxed/simple;
	bh=/8ITQNX87TDjJtwoqKQOHmwkCLN38DugcUW/GK5Cn4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdJyyDSqBsvlBzhZ7KIpeeD4Z0ZVLGtYtkEaKSh/Xuj1OwAmrGOsoRGitre7q8oB88wxJUlwDUspAEGMUxAUxZugh6uLmMagJwvKrDSiIIqfs17+TrhmUdbeaPNtENHWQ6oxIXGBw5hljn71WvSGqelafm3HZNGeV0GIvhgp2/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K7jTF7MB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-558f7472d64so2858033e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752852553; x=1753457353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0myKZxZrlimKWecDsKq5/yhMZliT2ThHP1sIZx7oJA=;
        b=K7jTF7MBj7SzA+da7IU/vax9gdhPLf6wf0USul3+V+rreudPSw5S1oUOKUVvN0Bn7A
         rmD3KBLvxxQZsWrXFypU94kcNq8d9v7+ULTa51DMMsWjDXOfF3B1tWRA+5H2lG/7s8eB
         89X9iFtbO2SmKJ3u84EWM45wfNKnpZo67qwNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852553; x=1753457353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0myKZxZrlimKWecDsKq5/yhMZliT2ThHP1sIZx7oJA=;
        b=V92WrIZUP6SytnqkPyFAWsK1tau/CWyXsn7rSMZacbe96eMuu+C9faG8YjEHEf/C77
         kiEOOup9JCFUQOhOHnqEnY33ZvX2ILMPJepEaivvGYtqFdsKyjBhY17cSDPaTzTpYBOs
         u5933BCa3M3lmwt0Xx7DGsKjaOEjOAimaL5JlF03bhZHmhiskwPzD4APMOgnv0sRFV9v
         rcFeo1JLnLEc3XLs+4/WKCrectv4tkJM64xyFqOnK8s/a6kuS9OEMZcrHIUYcihl92tG
         hgB0jn3v/bY+dpE0EDiuE8uSgOQBvbARgOJGFLuEdTC81eFFPefFbGyLHL8EoAjoPHbC
         5y3w==
X-Forwarded-Encrypted: i=1; AJvYcCUNVOFhhheTwU1vm4/MwkOWj8wG2NkxyIq87z9lPn49lEvwZC6v0HJoU38BnjuRmppUfSNkuXXCnir1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46ZWLQk2Cbd5oeclsVsBQcNvV0OGvOHjgz4YAczu2eRyq9JEh
	roFW3XO8JW1URb0+cY64FEq0ifq/mU58CUCID97esFJCzfeHDMKbzNyvJ81dOiNRGg==
X-Gm-Gg: ASbGncvOUmmcYW759elxjdq9gunexxM9INRs+f2AOWO0O3ChtRcAro5ihcMSdtisRns
	oPZKl6mxLbWaIN3FcyQKO54O8Sh+XBl341tw09cEpLF1WsvcjuSc/10l3R+LvBD+7TvAqa6DYiH
	xvWlcrLvj/yBQ/679eeVx7cOd16ZKvPXSoqmkK/gqaeR0DotOExl45TGSEOvPsCjuw0ZEY+8ZVf
	n0527nsff/i+jQ8cWTAbmxK2w5HxekZcAQMjTbTUn/mbcdXhQHBv/JZBeGqQ4jvruuldzwLXJop
	6aL5jSQ5fIL/lp6JNWzHayQEuRJq52aiD94D+ENlWRrkdfwZCcgYJJ2ydYlEGr3sQspA7C2UgsC
	XFzadsAO0jm3hltIMBqX4thpCWz+BfZJEbOPipsxfAbJ19LW2MS65mVdLCXLBtnjhMYf+HXY+UX
	2j8w==
X-Google-Smtp-Source: AGHT+IGci1vQOFQMMl+qEzOSUifBeMVciDHPPF3UMhgKYZbmLXQkHMvTkLZEJPwdCUkuOzwCEuhUrA==
X-Received: by 2002:ac2:4bd6:0:b0:551:ecf4:2cd8 with SMTP id 2adb3069b0e04-55a2fe66ba5mr1159536e87.23.1752852553168;
        Fri, 18 Jul 2025 08:29:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9d6dsm2268601fa.83.2025.07.18.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:29:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Jul 2025 15:29:10 +0000
Subject: [PATCH v5 1/5] media: uvcvideo: Factor out gpio functions to its
 own file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-uvc-subdev-v5-1-a5869b071b0d@chromium.org>
References: <20250718-uvc-subdev-v5-0-a5869b071b0d@chromium.org>
In-Reply-To: <20250718-uvc-subdev-v5-0-a5869b071b0d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Yunke Cao <yunkec@chromium.org>, linux-gpio@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>
X-Mailer: b4 0.14.2

This is just a refactor patch, no new functionality is added.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Makefile     |   3 +-
 drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
 drivers/media/usb/uvc/uvc_gpio.c   | 122 +++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |   7 +++
 4 files changed, 133 insertions(+), 120 deletions(-)

diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
--- a/drivers/media/usb/uvc/Makefile
+++ b/drivers/media/usb/uvc/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
-		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
+		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
+		  uvc_gpio.o
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
 uvcvideo-objs  += uvc_entity.o
 endif
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 775bede0d93d9b3e5391914aa395326d3de6a3b1..56bf741e55ed22052f2f4773244ef49c08a2fdae 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -8,7 +8,6 @@
 
 #include <linux/atomic.h>
 #include <linux/bits.h>
-#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -795,8 +794,8 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
-		unsigned int num_pads, unsigned int extra_size)
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
@@ -1245,122 +1244,6 @@ static int uvc_parse_control(struct uvc_device *dev)
 	return 0;
 }
 
-/* -----------------------------------------------------------------------------
- * Privacy GPIO
- */
-
-static void uvc_gpio_event(struct uvc_device *dev)
-{
-	struct uvc_entity *unit = dev->gpio_unit;
-	struct uvc_video_chain *chain;
-	u8 new_val;
-
-	if (!unit)
-		return;
-
-	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
-
-	/* GPIO entities are always on the first chain. */
-	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
-	uvc_ctrl_status_event(chain, unit->controls, &new_val);
-}
-
-static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
-			    u8 cs, void *data, u16 size)
-{
-	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
-		return -EINVAL;
-
-	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
-
-	return 0;
-}
-
-static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
-			     u8 cs, u8 *caps)
-{
-	if (cs != UVC_CT_PRIVACY_CONTROL)
-		return -EINVAL;
-
-	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
-	return 0;
-}
-
-static irqreturn_t uvc_gpio_irq(int irq, void *data)
-{
-	struct uvc_device *dev = data;
-
-	uvc_gpio_event(dev);
-	return IRQ_HANDLED;
-}
-
-static int uvc_gpio_parse(struct uvc_device *dev)
-{
-	struct uvc_entity *unit;
-	struct gpio_desc *gpio_privacy;
-	int irq;
-
-	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
-					       GPIOD_IN);
-	if (!gpio_privacy)
-		return 0;
-
-	if (IS_ERR(gpio_privacy))
-		return dev_err_probe(&dev->intf->dev,
-				     PTR_ERR(gpio_privacy),
-				     "Can't get privacy GPIO\n");
-
-	irq = gpiod_to_irq(gpio_privacy);
-	if (irq < 0)
-		return dev_err_probe(&dev->intf->dev, irq,
-				     "No IRQ for privacy GPIO\n");
-
-	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
-	if (!unit)
-		return -ENOMEM;
-
-	unit->gpio.gpio_privacy = gpio_privacy;
-	unit->gpio.irq = irq;
-	unit->gpio.bControlSize = 1;
-	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
-	unit->gpio.bmControls[0] = 1;
-	unit->get_cur = uvc_gpio_get_cur;
-	unit->get_info = uvc_gpio_get_info;
-	strscpy(unit->name, "GPIO", sizeof(unit->name));
-
-	list_add_tail(&unit->list, &dev->entities);
-
-	dev->gpio_unit = unit;
-
-	return 0;
-}
-
-static int uvc_gpio_init_irq(struct uvc_device *dev)
-{
-	struct uvc_entity *unit = dev->gpio_unit;
-	int ret;
-
-	if (!unit || unit->gpio.irq < 0)
-		return 0;
-
-	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
-				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
-				   IRQF_TRIGGER_RISING,
-				   "uvc_privacy_gpio", dev);
-
-	unit->gpio.initialized = !ret;
-
-	return ret;
-}
-
-static void uvc_gpio_deinit(struct uvc_device *dev)
-{
-	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
-		return;
-
-	free_irq(dev->gpio_unit->gpio.irq, dev);
-}
-
 /* ------------------------------------------------------------------------
  * UVC device scan
  */
diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
new file mode 100644
index 0000000000000000000000000000000000000000..45c169eb933815baab3d166abace46f269d9241e
--- /dev/null
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *      uvc_gpio.c  --  USB Video Class driver
+ *
+ *      Copyright 2024 Google LLC
+ */
+
+#include <linux/kernel.h>
+#include <linux/gpio/consumer.h>
+#include "uvcvideo.h"
+
+static void uvc_gpio_event(struct uvc_device *dev)
+{
+	struct uvc_entity *unit = dev->gpio_unit;
+	struct uvc_video_chain *chain;
+	u8 new_val;
+
+	if (!unit)
+		return;
+
+	new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+
+	/* GPIO entities are always on the first chain. */
+	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
+	uvc_ctrl_status_event(chain, unit->controls, &new_val);
+}
+
+static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
+			    u8 cs, void *data, u16 size)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
+		return -EINVAL;
+
+	*(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
+
+	return 0;
+}
+
+static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
+			     u8 cs, u8 *caps)
+{
+	if (cs != UVC_CT_PRIVACY_CONTROL)
+		return -EINVAL;
+
+	*caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
+	return 0;
+}
+
+static irqreturn_t uvc_gpio_irq(int irq, void *data)
+{
+	struct uvc_device *dev = data;
+
+	uvc_gpio_event(dev);
+	return IRQ_HANDLED;
+}
+
+int uvc_gpio_parse(struct uvc_device *dev)
+{
+	struct uvc_entity *unit;
+	struct gpio_desc *gpio_privacy;
+	int irq;
+
+	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
+					       GPIOD_IN);
+	if (!gpio_privacy)
+		return 0;
+
+	if (IS_ERR(gpio_privacy))
+		return dev_err_probe(&dev->intf->dev,
+				     PTR_ERR(gpio_privacy),
+				     "Can't get privacy GPIO\n");
+
+	irq = gpiod_to_irq(gpio_privacy);
+	if (irq < 0)
+		return dev_err_probe(&dev->intf->dev, irq,
+				     "No IRQ for privacy GPIO\n");
+
+	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
+
+	unit->gpio.gpio_privacy = gpio_privacy;
+	unit->gpio.irq = irq;
+	unit->gpio.bControlSize = 1;
+	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
+	unit->gpio.bmControls[0] = 1;
+	unit->get_cur = uvc_gpio_get_cur;
+	unit->get_info = uvc_gpio_get_info;
+	strscpy(unit->name, "GPIO", sizeof(unit->name));
+
+	list_add_tail(&unit->list, &dev->entities);
+
+	dev->gpio_unit = unit;
+
+	return 0;
+}
+
+int uvc_gpio_init_irq(struct uvc_device *dev)
+{
+	struct uvc_entity *unit = dev->gpio_unit;
+	int ret;
+
+	if (!unit || unit->gpio.irq < 0)
+		return 0;
+
+	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
+				   IRQF_TRIGGER_RISING,
+				   "uvc_privacy_gpio", dev);
+
+	unit->gpio.initialized = !ret;
+
+	return ret;
+}
+
+void uvc_gpio_deinit(struct uvc_device *dev)
+{
+	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
+		return;
+
+	free_irq(dev->gpio_unit->gpio.irq, dev);
+}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254fc4fe930ae61c9d0425f04d4cd074a617e..63df6fb89ed29c76ed0ded9283a2c5e817bf6500 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -688,6 +688,8 @@ do {									\
  */
 
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
+struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
+				    unsigned int extra_size);
 
 /* Video buffers queue management. */
 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
@@ -814,4 +816,9 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
 size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
+/* gpio */
+int uvc_gpio_parse(struct uvc_device *dev);
+int uvc_gpio_init_irq(struct uvc_device *dev);
+void uvc_gpio_deinit(struct uvc_device *dev);
+
 #endif

-- 
2.50.0.727.gbf7dc18ff4-goog


