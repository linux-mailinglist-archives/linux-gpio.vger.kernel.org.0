Return-Path: <linux-gpio+bounces-18222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDFCA7AE7A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 22:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5CFE17CEFB
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 20:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C88B205E32;
	Thu,  3 Apr 2025 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KzcRrt6T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD32045B1
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707796; cv=none; b=FmYXKa9A+sN7TTYvgwyeWD2sJZg/yn5yXTEwMzBlOEfSYLgVJyX8dgroIBmOzderbkYtLxQgb/7aXLmI0l1G4/IJMVEPUanIgIw98JWnR0wlqiqgAvXJuejX0tMs2ny9SYBO/QNYSqpy1YSPzVyLNDtuU4gHZE6YD/BGowzH5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707796; c=relaxed/simple;
	bh=oIe/uWD/FQDzr1edh1CzgOk8NT19Av3Ax0Mu4QeYt0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+Iys5PbHmfR3cJbK0Lo9uS73IPZOxy81IOEEt4GV0gPmuq6HGWqda/v1kB2VKj7bcv1+p3N/idVrXQV5hqAk+mzI67GJbRmRgkTvqKEXnwobLaFt2ivHA4SsAQqqcGnLRqWb3caalcUYKrzcDH/dY65Mzo1Y1WGVCy2rM6z2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KzcRrt6T; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1510579e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707791; x=1744312591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dorrjSo0orF//5lS6H31AEnatOUG0VehlrElNg21OPo=;
        b=KzcRrt6Tn4J4roTiElDsx6nBuxoqkw131eiq8KEj5G9YyO2hMWnVUXimaETLD+go38
         8zmQjuyZ12i+Tow/1AKE/p/tPZLMpoTgwhacOV4EVTpyXKUGH/TLmrKD1uP866iZ9/xn
         nH+JVdVFOpZ849qslDl0pHcfyaASPW8VTQ7+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707791; x=1744312591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dorrjSo0orF//5lS6H31AEnatOUG0VehlrElNg21OPo=;
        b=l+o+EtdZ6RubMQtNAoEAy/e1M3o8/mXMeYSnpcl/VOiFoWsPUwQdQIVS58wTV4nw9Y
         MSOe2D8k+XVm0kQtyeEkOL3Tx27r7TgAak2pCkGK7vGtvpDbTsQ+h37q9jiSxAK4mraq
         uTjmsvldTUFeG0imi9zFGInvbYolprg8lPZqSLpt5LrLw1fJ8KMEGpInNTRlLhJbC2iT
         doOFU6z2u8lJNs5JjiGWlbf+Uzol1uJhdTCFMEvZ2ydh7mLjB99KHR+SvXRFZaxckDn7
         +UTZe1nWW3YwqjxX01y+dz6ltc3JIY1PpjmXdlMYzvRR9css0bSsNKD+1X4EgCP0EPen
         mpYw==
X-Forwarded-Encrypted: i=1; AJvYcCVnGqm+szXgm1exVv+xiJmkkrPzHEeB6SEZubw1PqJTVoO2TGqomex3bp8PtUL3P/IrE6ywnau5GK2J@vger.kernel.org
X-Gm-Message-State: AOJu0YzrALjSUaS4IfJy24aX7H2p3+qyapb7V1GZJTTGqe6uXRJ25B9K
	JRh0quEMyoOp/7DB+TNtN57sa/HyCvhjCAbqhYzhMUIEi4VGHtg/o4mlww7qclP1H0FjrjtMQZo
	=
X-Gm-Gg: ASbGncvAuQEU+vtOiiFmBBijmpikopqsi8MSG5ViaoI+hzq7z7M4iDQjKsV6gQZQQ0x
	F045RGKdm7jnV2/t1Bor47ysikISdALgZhbYYgRAr2ZwTPMIdrKeVXj4ptVqz9t5w8Vgu8oHFXB
	kuSBJmSHsvqy4LzYHSEkbL9yl/PjjCIXdGdDgdPOymuAUXreBOnCSLXjINFY8I+oOwQaTEMemQU
	svh54P+/afktNZRGpDWKYJalg0yXVODtz4OHsGlg2BMh8rtMGdQuEPVPDxTUw3oaccJQgzrnY10
	1ZJ7cFvyrHQRWySQBglZEZwIA06N7iV4CAgrZvfRcFsGN5iQ8RWup8R6SNUJJ0GmVxOhlJ+GL9A
	MNLqqZGLev9l6Zj9KOmFPvUJm
X-Google-Smtp-Source: AGHT+IGVY3EFg5KnHKmHO2hTamBaTkRj2xwhuyk+NEFXhuefJ9O4PY6IbapG0I2fVQxVv80RmqRT3w==
X-Received: by 2002:a05:6512:a91:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-54c2276e9b2mr115584e87.12.1743707790862;
        Thu, 03 Apr 2025 12:16:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:19 +0000
Subject: [PATCH 8/8] media: uvcvideo: Do not create MC entities for virtual
 entities
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-8-1a0cc595a62d@chromium.org>
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

Neither the GPIO nor the FWNODE entities form part of the device
pipeline. We just create them to hold emulated uvc controls.

When the device initializes, a warning is thrown by the v4l2 core:
uvcvideo 1-1:1.0: Entity type for entity FWNODE was not initialized!

There are no entity function that matches what we are doing here, and
it does not make to much sense to create a function for entities that
do not really exist.

Do not create MC entities for them and pretend nothing happened here.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index 01eeba2f049e9ebb25e091340a133656acbf28ca..4a0a083b4f58f041023710207a73e8fede8526e0 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -72,6 +72,16 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 {
 	int ret;
 
+	/*
+	 * Do not initialize virtual entities, they do not really exist
+	 * and are not connected to any other entities.
+	 */
+	switch (UVC_ENTITY_TYPE(entity)) {
+	case UVC_EXT_GPIO_UNIT:
+	case UVC_FWNODE_UNIT:
+		return 0;
+	}
+
 	if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
 		u32 function;
 

-- 
2.49.0.504.g3bcea36a83-goog


