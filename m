Return-Path: <linux-gpio+bounces-23500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB19B0A793
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 154A81888484
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3622E1C7B;
	Fri, 18 Jul 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dQEKioxu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A332E0403
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852562; cv=none; b=Yf+KKpaXwNO/EVovqI+XYU3iImvC6n8+8k3j7xHq/KWRgz2xrls24QskMJeRwfBi1J/iIteaQReDt3KDYBWFy3I7ipOVmV05bmWPILE4lZB8qnhmrn8h6WO3qJsxD8Q3Crc4k4qvNTWdFriJdUcm9bu2lqRpf5ZnEddiJD0BfHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852562; c=relaxed/simple;
	bh=SILD7FqXDKzPN+v5mJfgmM2lCLPnFDjcKYYpG/ct3s0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3J2W1VNp6cpeXMxhNyDg0Qf/+v4i4sGzUstkGvmZHxziaLdiqFgFqP3BE6qQKSWrHWEzPnr9oOkQymvEnpqOq/qk+onuyH7ZTrmcEO0rdw7MAnsKWZIu8LEj9wtvqragp2upWvYJinuPan+sNaPrcRzORSXLFgUBtWFhZwqiTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dQEKioxu; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553d771435fso2408891e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 08:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752852555; x=1753457355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW6jrFQzXbLcjEcOPYhLhert2s0KBo9YRnvAtQmafP0=;
        b=dQEKioxuMUhEVjxMKVd1pE1pf6VdIUG+LptdSUJX2R9XvqQgtRoAk43/8eYaUsrzU/
         0wYiBYvDQDPo0pI9Qy7xkEtH8Sthbqe3mUDcda040WmzjrSQ0jJ4jweJXJ6xJAQ8lzrP
         qo4yYrfeBvnD82w5MK1xQQtqcR5vbPYe68Hj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852555; x=1753457355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW6jrFQzXbLcjEcOPYhLhert2s0KBo9YRnvAtQmafP0=;
        b=XvXe3egKiAZlPpwEGyt7uYm8E9vx10tumD3jlCfc/Y8nUk/RNnZmDAnsk5wqD2i7zJ
         U8r39KsS9807bl5wWbMUvMnFmFCKbC3NLD+o8R63P93RSMOl4qUftJJZpjkqlEHhxrb1
         NdbBGzbkqV0l7ncBACybPfpHotazoaFNGvo6DCH3yW9qRPXHYkz43ANEukiAo+Xghgi7
         YZrO9vmA1sOoaz4lmkqMW7rzjGzod2Ccd0adYHpa8niBExWNIcuJqjCitTH0CNop6XkN
         voJkg61y5DS900h4sbDtEgaaaRAKbvtxtGpTnjRIPfdoaijD3AyQUFQiaEEKMrjRr6qX
         8QUA==
X-Forwarded-Encrypted: i=1; AJvYcCX2jEupnVqHViXtV/+BMkrdL5z63j9idDAatqGvinTBPf7EvID+BYc+LVjNkl6JImFIvv489jN0fuNf@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhDpYpAMmRRUi1QwbIZR1av2Dt+K9zAMkckk0n/JXw7p2iVr3
	0AAxvUdZUUNS+x8Gt29CM3daAarLSBHH1B/wgTOBVzNpGabXSFkykGzVJ6UdZNcYOQ==
X-Gm-Gg: ASbGnctckTh16sRWcRP64SDNlbWlq90FKe3MFYWXpyX0JQwENC8Acbt8gFZX/ju0sTL
	kObXjJKRecdwCP6DOoOuSazsKO/udrzgkaJKl9O0wpprkDsFZsoiVd7dkYgZvXq4KBr6rhnfIgQ
	pFcfg0X2F5vEUblpLuazyN7BhtsyiohGtB/uEJfkGw8f4fgv+DgPWkPIdZ1ZIg5pqavbuq1zLqW
	ZQwfTThh05liF/mYzqlUSpmZrn0lBAS8CITdlntiAUwKqy1eReoRgVuUnoJkqhdZFC05mA9hABz
	exLMNoKILXPZYrFaFKIogf37021fh3f5EyvIl22VAK7wtdq08+6OOE4hq4PkfcJBjtqct+WtXJZ
	ItVpnQYeBtAnLYbPdk1aEznfs7K/Sd+48EbOpeoq7DpLZhdute5BH13EZnaXuV09J39PD2Gtxm4
	C4ng==
X-Google-Smtp-Source: AGHT+IFzEZudqyc1gvkTsADJ1J0J6zl9peQTdQgm9si/Z20OV6QzPGlTr3dUVncj75ikKEgrskz53A==
X-Received: by 2002:a05:651c:2149:b0:32b:2fba:8b90 with SMTP id 38308e7fff4ca-3308e37166fmr22654361fa.14.1752852555208;
        Fri, 18 Jul 2025 08:29:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9d6dsm2268601fa.83.2025.07.18.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:29:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 18 Jul 2025 15:29:14 +0000
Subject: [PATCH v5 5/5] media: uvcvideo: Remove UVC_EXT_GPIO entity
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-uvc-subdev-v5-5-a5869b071b0d@chromium.org>
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

The only implementation of this entity was the external privacy gpio,
which now does not require to emulate an entity.
Remove all the dead code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ----
 drivers/media/usb/uvc/uvc_entity.c |  1 -
 drivers/media/usb/uvc/uvcvideo.h   | 20 +++++++-------------
 include/linux/usb/uvc.h            |  3 ---
 4 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b79d276732bc80ef175ffdbaa73b6395585ff07b..d19b5a200971654161267dc755aec2a06b5fdc9e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -789,7 +789,6 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 }
 
 static const u8 uvc_camera_guid[16] = UVC_GUID_UVC_CAMERA;
-static const u8 uvc_gpio_guid[16] = UVC_GUID_EXT_GPIO_CONTROLLER;
 static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
@@ -821,9 +820,6 @@ struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
 	 * is initialized by the caller.
 	 */
 	switch (type) {
-	case UVC_EXT_GPIO_UNIT:
-		memcpy(entity->guid, uvc_gpio_guid, 16);
-		break;
 	case UVC_ITT_CAMERA:
 		memcpy(entity->guid, uvc_camera_guid, 16);
 		break;
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42dce5b2846ca52a8dfa499c8aed96..94e0119746e4689a45960955a35be93a25bc16c4 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -105,7 +105,6 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 		case UVC_OTT_DISPLAY:
 		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		case UVC_EXTERNAL_VENDOR_SPECIFIC:
-		case UVC_EXT_GPIO_UNIT:
 		default:
 			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
 			break;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c098f30b07797281576d7ff533cde25309be8b61..b4eaca187d61b2e9f8a4af6ac6ac071145b48df2 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -39,9 +39,6 @@
 	(UVC_ENTITY_IS_TERM(entity) && \
 	((entity)->type & 0x8000) == UVC_TERM_OUTPUT)
 
-#define UVC_EXT_GPIO_UNIT		0x7ffe
-#define UVC_EXT_GPIO_UNIT_ID		0x100
-
 /* ------------------------------------------------------------------------
  * Driver specific constants.
  */
@@ -189,8 +186,7 @@ struct uvc_entity {
 
 	/*
 	 * Entities exposed by the UVC device use IDs 0-255, extra entities
-	 * implemented by the driver (such as the GPIO entity) use IDs 256 and
-	 * up.
+	 * implemented by the driver use IDs 256 and up.
 	 */
 	u16 id;
 	u16 type;
@@ -239,13 +235,6 @@ struct uvc_entity {
 			u8  *bmControls;
 			u8  *bmControlsType;
 		} extension;
-
-		struct uvc_gpio {
-			int irq;
-			bool initialized;
-			bool gpio_ready;
-			struct gpio_desc *gpio_privacy;
-		} gpio;
 	};
 
 	u8 bNrInPins;
@@ -628,7 +617,12 @@ struct uvc_device {
 		const void *data;
 	} async_ctrl;
 
-	struct uvc_gpio gpio_unit;
+	struct uvc_gpio {
+		int irq;
+		bool initialized;
+		bool gpio_ready;
+		struct gpio_desc *gpio_privacy;
+	} gpio_unit;
 };
 
 struct uvc_fh {
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index ee19e9f915b8370c333c426dc1ee4202c7b75c5b..6858675ce70dc0a872edd47531682bc415f83bd9 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -26,9 +26,6 @@
 #define UVC_GUID_UVC_SELECTOR \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
 	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
-#define UVC_GUID_EXT_GPIO_CONTROLLER \
-	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
-	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
 #define UVC_GUID_MSXU_1_5 \
 	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
 	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}

-- 
2.50.0.727.gbf7dc18ff4-goog


