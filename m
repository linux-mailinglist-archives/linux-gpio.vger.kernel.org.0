Return-Path: <linux-gpio+bounces-23497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03532B0A795
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A884D7BE969
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1D12E11B8;
	Fri, 18 Jul 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UEQ8JVmJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDED2DEA7C
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852559; cv=none; b=em1YbUCkUOyp2ILtmg+lf+X/hjfRB2+WSgeVn7YQIwDMytXpQGTQgXW0xsIPh43zv+ScbQ2elW5FTR2wwK6KbIU4AEnVLcQ1nhFEvPuo4tLUlo4656Ti+SFSTs8NI3sl/rSLn9FsSylu+wqiinQBTWuyTnTKUaYpQifve386RBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852559; c=relaxed/simple;
	bh=vXvUh0/lx8vV9ufWmUh/Vz59CiW2e51IxBQ5UwdiB8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHuG6xERYEptZA0AvPzNDh8J6UCgN0GW7cYrH8AEoXCzlcGy/Se+DBNYFkXErCDQz5GlMM28lEMW5woEmegM3bo08Obn0Mmb9lE31mpMuK8V/AnDaPzAp2WHoYFWQYdkgQ9RNo2wLrF4zQjp2ndmkdh/u6IArQV5VpujUVOuxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UEQ8JVmJ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso19271401fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752852554; x=1753457354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UNTtgLj5d8F+iVA0Rt40rNJLWBH3Yh3XuCxnqOYkd4=;
        b=UEQ8JVmJagiDb1OcKdl5EEUztD1+NhiGHEiSMJmeiEOmMo3EglB68tDl8OcHqamdiv
         X8hukCc4/oYzNwB15130xGnDvnHVgYRrd0sNG4PRpXxHZXnIP8gRAQs5KfONy+s+Gh/c
         7H1GQ58dg5zvgJkD6N3XUmeVJO8TO/yUSKBHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852554; x=1753457354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UNTtgLj5d8F+iVA0Rt40rNJLWBH3Yh3XuCxnqOYkd4=;
        b=s4wnzcwTV3PuoEoDp4wTJQbahtlXRckv++gdwlNHEDqlRP5HOAYXKaj651K2JBApb5
         thBfPw4HNn+tiYM3GXExCACFNlcVXl3eCGBvtn8dYPTFYoT1xNlWLwLSxuGmAxNsT6FL
         YpwumF6ST8v7fy7Rr+CxYR+eA2vxuNs/LpJ9J05i+9Jt9V6nlIcMOs266qHR3UgZsF0s
         ete3j5PdW7mY4fxoGT25diLSQbpl18nncyeBKL9KX0LHvNjLVqdwz6tNUR4gVE2rJCmZ
         7ihotK4bzZN3oUWua5RI7NC2zeCiPEutsLDdguaAsbrE6BnBZJYrmBaJShSY4r2wlQ1g
         qCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjecUhsq7SPEP0L0KRWVrccZg/QQeMFT9N/9J9LhLLjzU/r94xloTWCiRILF8lvHWDmte5IfY5oKgj@vger.kernel.org
X-Gm-Message-State: AOJu0YykC9YV2fy0P70lNI6eoCP2ht4eJra6gLDeYsQLSjiW89gICqDn
	H6nnIEIh5E8eS2nEPlomBmbPwHH8AWZpNXfv7iK0dLzN1KtbwOnRO+bS52VEUK3hRwUDNtUgDAE
	/u7s=
X-Gm-Gg: ASbGncua4TcVxxQ/XHlOPgZU6YXHFJqb06blU0YVdlr/jxCwwTew4lBgGaDb7Ems3WT
	fm3bhM3NIH+h+Wm3KdJHSNuSrhPhOWQYnJF+tcVtP5RoyfcJR/GgNJnl1IcOHQxiJ1pp/qn2Slx
	K9dwQ6ZxeWd6ev1DPldWiFbKJe+uixAiL0UFjSf2qhhy007RkdbWoPEUhftXF6dDSk8lq+hffKg
	DIUHw9sfXJ+dEd4GEpCoYNYWsk9iGfDKmap+myWeFanLO13lWXaSVPgjwjAjDsDV+KrPjsYPjfl
	VId7CYSHBWuSySE0UZkcnUJQw9vShhg3qcWPCBQJuE2Cdw5Zteoyz6+GwytylmMwAfFAUd2Yfxb
	f1pYlhe6d5iLUwf9J38f7P2c4YZB+/AVFBgiPXBDZ3dJTkqzoZEynj+TVGrWeXpAOUpSD9Cs86M
	zY0Q==
X-Google-Smtp-Source: AGHT+IFNsaEOVl0URzbGSFqOvOait6YxwkgAbxxzfplQU3FHkjkAop2mcAXuOEtkx0JO/lbdJ5ZvQA==
X-Received: by 2002:a2e:a592:0:b0:32f:1c0f:fb7b with SMTP id 38308e7fff4ca-3309a577ef8mr22131451fa.26.1752852553734;
        Fri, 18 Jul 2025 08:29:13 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9d6dsm2268601fa.83.2025.07.18.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:29:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Jul 2025 15:29:11 +0000
Subject: [PATCH v5 2/5] media: uvcvideo: Re-implement privacy GPIO as an
 input device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-uvc-subdev-v5-2-a5869b071b0d@chromium.org>
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

Reimplement privacy GPIO as an input device.

This is an attempt to unify how we notify userspace about a camera that
is covered.

Replace the previous V4L2_CID_PRIVACY control with evdev
SW_CAMERA_LENS_COVER.

This has some main benefits:
- It unifies behaviour with other drivers.
- It allows reading the privacy events without powering up the camera.
- It allows reading the privacy gpio and the internal gpio control (if
  present).

Although this introduces an ABI change, we have only seen ChromeOS using
this feature.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Kconfig      |  2 +-
 drivers/media/usb/uvc/Makefile     |  6 ++--
 drivers/media/usb/uvc/uvc_ctrl.c   | 20 -----------
 drivers/media/usb/uvc/uvc_driver.c |  3 +-
 drivers/media/usb/uvc/uvc_gpio.c   | 72 +++++++++++++-------------------------
 drivers/media/usb/uvc/uvc_status.c | 13 +++++--
 drivers/media/usb/uvc/uvcvideo.h   | 15 +++++---
 7 files changed, 51 insertions(+), 80 deletions(-)

diff --git a/drivers/media/usb/uvc/Kconfig b/drivers/media/usb/uvc/Kconfig
index 579532272fd6d7a8ef65c1a3a892b723f40e584e..cdbba7fd5bee2427d7f908283a6648d0a4888e0d 100644
--- a/drivers/media/usb/uvc/Kconfig
+++ b/drivers/media/usb/uvc/Kconfig
@@ -17,6 +17,6 @@ config USB_VIDEO_CLASS_INPUT_EVDEV
 	depends on USB_VIDEO_CLASS=INPUT || INPUT=y
 	help
 	  This option makes USB Video Class devices register an input device
-	  to report button events.
+	  to report button events and privacy GPIO.
 
 	  If you are in doubt, say Y.
diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
index 85514b6e538fbb8284e574ca14700f2d749e1a2e..b36b124da7a8190760353b22805e8cd23a7723c2 100644
--- a/drivers/media/usb/uvc/Makefile
+++ b/drivers/media/usb/uvc/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
-		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
-		  uvc_gpio.o
+		  uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
 ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
 uvcvideo-objs  += uvc_entity.o
 endif
+ifeq ($(CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV),y)
+uvcvideo-objs  += uvc_gpio.o
+endif
 obj-$(CONFIG_USB_VIDEO_CLASS) += uvcvideo.o
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index efe609d7087752cb2ef516eef0fce12acd13e747..17a9af857308c6311824807f6e3438974bc88f55 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -350,14 +350,6 @@ static const struct uvc_control_info uvc_ctrls[] = {
 				| UVC_CTRL_FLAG_RESTORE
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
-	{
-		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
-		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.index		= 0,
-		.size		= 1,
-		.flags		= UVC_CTRL_FLAG_GET_CUR
-				| UVC_CTRL_FLAG_AUTO_UPDATE,
-	},
 	/*
 	 * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated
 	 * by sensors.
@@ -939,15 +931,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
-	{
-		.id		= V4L2_CID_PRIVACY,
-		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
-		.selector	= UVC_CT_PRIVACY_CONTROL,
-		.size		= 1,
-		.offset		= 0,
-		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
-		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
-	},
 	{
 		.entity		= UVC_GUID_UVC_PROCESSING,
 		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
@@ -3252,9 +3235,6 @@ static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
 		} else if (UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {
 			bmControls = entity->camera.bmControls;
 			bControlSize = entity->camera.bControlSize;
-		} else if (UVC_ENTITY_TYPE(entity) == UVC_EXT_GPIO_UNIT) {
-			bmControls = entity->gpio.bmControls;
-			bControlSize = entity->gpio.bControlSize;
 		}
 
 		/* Remove bogus/blacklisted controls */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 56bf741e55ed22052f2f4773244ef49c08a2fdae..89a4ac8a358f508220bca43078964bc2a8a6c4a5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2158,6 +2158,7 @@ static int uvc_probe(struct usb_interface *intf,
 	if (ret < 0)
 		goto error;
 #endif
+
 	/* Save our data pointer in the interface data. */
 	usb_set_intfdata(intf, dev);
 
@@ -2169,7 +2170,7 @@ static int uvc_probe(struct usb_interface *intf,
 			 ret);
 	}
 
-	ret = uvc_gpio_init_irq(dev);
+	ret = uvc_gpio_init(dev);
 	if (ret < 0) {
 		dev_err(&dev->udev->dev,
 			"Unable to request privacy GPIO IRQ (%d)\n", ret);
diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
index 45c169eb933815baab3d166abace46f269d9241e..93727185b9125d5a0ebf7fcede5ed8983ecddd5f 100644
--- a/drivers/media/usb/uvc/uvc_gpio.c
+++ b/drivers/media/usb/uvc/uvc_gpio.c
@@ -7,57 +7,29 @@
 
 #include <linux/kernel.h>
 #include <linux/gpio/consumer.h>
+#include <linux/input.h>
 #include "uvcvideo.h"
 
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
 static irqreturn_t uvc_gpio_irq(int irq, void *data)
 {
 	struct uvc_device *dev = data;
+	struct uvc_gpio *uvc_gpio = &dev->gpio_unit->gpio;
+	int new_val;
+
+	new_val = gpiod_get_value_cansleep(uvc_gpio->gpio_privacy);
+	if (new_val < 0)
+		return IRQ_HANDLED;
+
+	input_report_switch(dev->input, SW_CAMERA_LENS_COVER, new_val);
+	input_sync(dev->input);
 
-	uvc_gpio_event(dev);
 	return IRQ_HANDLED;
 }
 
 int uvc_gpio_parse(struct uvc_device *dev)
 {
-	struct uvc_entity *unit;
 	struct gpio_desc *gpio_privacy;
+	struct uvc_entity *unit;
 	int irq;
 
 	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
@@ -81,13 +53,7 @@ int uvc_gpio_parse(struct uvc_device *dev)
 
 	unit->gpio.gpio_privacy = gpio_privacy;
 	unit->gpio.irq = irq;
-	unit->gpio.bControlSize = 1;
-	unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
-	unit->gpio.bmControls[0] = 1;
-	unit->get_cur = uvc_gpio_get_cur;
-	unit->get_info = uvc_gpio_get_info;
 	strscpy(unit->name, "GPIO", sizeof(unit->name));
-
 	list_add_tail(&unit->list, &dev->entities);
 
 	dev->gpio_unit = unit;
@@ -95,22 +61,32 @@ int uvc_gpio_parse(struct uvc_device *dev)
 	return 0;
 }
 
-int uvc_gpio_init_irq(struct uvc_device *dev)
+int uvc_gpio_init(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
+	int init_val;
 	int ret;
 
 	if (!unit || unit->gpio.irq < 0)
 		return 0;
 
+	init_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
+	if (init_val < 0)
+		return init_val;
+
 	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
 				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
 				   IRQF_TRIGGER_RISING,
 				   "uvc_privacy_gpio", dev);
+	if (ret)
+		return ret;
+
+	input_report_switch(dev->input, SW_CAMERA_LENS_COVER, init_val);
+	input_sync(dev->input);
 
-	unit->gpio.initialized = !ret;
+	unit->gpio.initialized = true;
 
-	return ret;
+	return 0;
 }
 
 void uvc_gpio_deinit(struct uvc_device *dev)
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index ee01dce4b7834b05aab95379191c305cf8cec7f7..664ba59af8ecad5511c9dea924bf037b2aafc0d0 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -44,7 +44,7 @@ static int uvc_input_init(struct uvc_device *dev)
 	struct input_dev *input;
 	int ret;
 
-	if (!uvc_input_has_button(dev))
+	if (!uvc_input_has_button(dev) && !dev->gpio_unit)
 		return 0;
 
 	input = input_allocate_device();
@@ -59,8 +59,15 @@ static int uvc_input_init(struct uvc_device *dev)
 	usb_to_input_id(dev->udev, &input->id);
 	input->dev.parent = &dev->intf->dev;
 
-	__set_bit(EV_KEY, input->evbit);
-	__set_bit(KEY_CAMERA, input->keybit);
+	if (uvc_input_has_button(dev)) {
+		__set_bit(EV_KEY, input->evbit);
+		__set_bit(KEY_CAMERA, input->keybit);
+	}
+
+	if (dev->gpio_unit) {
+		__set_bit(EV_SW, input->evbit);
+		__set_bit(SW_CAMERA_LENS_COVER, input->swbit);
+	}
 
 	if ((ret = input_register_device(input)) < 0)
 		goto error;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 63df6fb89ed29c76ed0ded9283a2c5e817bf6500..aca857d3f5608550faa5241f3b515bb9837f70ab 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -15,6 +15,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/media-device.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
@@ -238,12 +239,10 @@ struct uvc_entity {
 			u8  *bmControlsType;
 		} extension;
 
-		struct {
-			u8  bControlSize;
-			u8  *bmControls;
-			struct gpio_desc *gpio_privacy;
+		struct uvc_gpio {
 			int irq;
 			bool initialized;
+			struct gpio_desc *gpio_privacy;
 		} gpio;
 	};
 
@@ -817,8 +816,14 @@ size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
 			    size_t size);
 
 /* gpio */
+#ifdef CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
 int uvc_gpio_parse(struct uvc_device *dev);
-int uvc_gpio_init_irq(struct uvc_device *dev);
+int uvc_gpio_init(struct uvc_device *dev);
 void uvc_gpio_deinit(struct uvc_device *dev);
+#else
+static inline int uvc_gpio_parse(struct uvc_device *dev) {return 0; }
+static inline int uvc_gpio_init(struct uvc_device *dev) {return 0; }
+static inline void uvc_gpio_deinit(struct uvc_device *dev) {};
+#endif
 
 #endif

-- 
2.50.0.727.gbf7dc18ff4-goog


