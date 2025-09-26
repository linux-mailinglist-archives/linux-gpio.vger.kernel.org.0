Return-Path: <linux-gpio+bounces-26613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A22BA3C69
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 15:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B49316D61E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 13:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EEC2F83B2;
	Fri, 26 Sep 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fbfy3VJj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C632F5A37
	for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892294; cv=none; b=mJWIuZh+X62ystPP3LO/9FiXE3TvXTA4xooGKaAYFe4k5b/mqBqdJgC56hSsraVHeW8B3DxqfjEhIYkWAmI9vm+gWFLIpbJE9JlTOrEyE/g/mt3Uw6hLANd7NE2LiQsY/4Ytl9ZU6uxSACTESE/MeiUDn6cwVDJKs4FRTcbNzec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892294; c=relaxed/simple;
	bh=fN1yQSZa9dGNYApiBN9DJ0yzGqYY3io2zaEeifTv+AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oo20ruUDHxWr6IurYgbwXk4cs5yW+d49v6AVsEgx8h+OMv2A4wMqT8WJgDP90wXiJT73L3M0n585VkX0WEiqSnRhmRprhOg0kcIhb48lDWuyRbJnGPjMnCD8tsa8cspxQgRrSlefW3yy67ZeSbZPuyEY/A6fydS6N7daCvE7K60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fbfy3VJj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5821dec0408so3097986e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2025 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892290; x=1759497090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuHd6eGYommvO3UskpqEqtJdP8+N3udV7UPBSp5lsjc=;
        b=fbfy3VJjC1yaYytPKZzTYRVoy+OCnUkOEtEIUZ3x3cYqigUyyXha5Va4UzDiOILmAI
         z/9bf24ITk1PxUsoK1WCTsDg7wY0GXAeUPCKIViGPcEP9BCiaDJ+LwEYvb6cDV8LIwkb
         D5w2rHp5jiXapkSCe1hEBuefH3fRV5/UiEHiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892290; x=1759497090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuHd6eGYommvO3UskpqEqtJdP8+N3udV7UPBSp5lsjc=;
        b=RyGBaXYJy+1ehm+bLKp/jKuE+4+i8AM4BHnP6eGqDZe3F+/ARpvdI769xDy5RR/0ro
         AAQXUNyUy9eqIy5T7V7OUaWWWh6uRzAJnmOxPkKbmW7gWkW82yogVDV2MNR96whKF14a
         sJO6p8TioCeGSDzFg5iDjaesSXSvHi0kDkkyAXEeoZOjqEqjW6PbK9Fd6or5YxDPwmSZ
         QA2zxhxx9rav9WVLZ+E6bfZ8e1xo1JCzKZoE/3TbYaPdE7UlgtLiAw+OOsiMxZDLW7Jc
         tpm5jHrSZJq4pQ5FTpBDKO1FA9kGnBDSE+/NuZIvZRZRWxjH8dGg+/d1mqpwX49MlYya
         dZkg==
X-Forwarded-Encrypted: i=1; AJvYcCXqnGPQTBUAFgZbvNaAIB1RIf0c/cYewzhgvjnWFIqFzv1X8SaSxc36YvY526burGuScWNitzqRC2Bb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+ZmpI/8L1PpgdXa2DhitbcHbdnCsMoy1Xj/Z2LizMp7VVD+Z
	CfND8QN5+3ivC3GePv4Kgium7xTz41LnQ2o5uBvMt5FwLpeJzrLr9C9YR4VlSGLXQw==
X-Gm-Gg: ASbGncuTXjn+s6Z6xedrzywkiZ5JIX+aaY5XoDl1KzkLzhP9QQjCzwg98S+QmX2MGxB
	eieKJLFo1b6ZbJbdzHNdtHFl4PQH5wAVcfwfwjv2vod/SQt1pqoGk99J7mevH3ZVrVEnwTgeJHZ
	4h7uu1y07CDVj8z3UoIILi+PSXrInndV1SmExAmD/cErDTPg0tqu4FG1SPiat6sSdFJsMhLPjWK
	YopzzcDQuxXNkxWr4FPCd69RW+tgXUwJVitlLnienMQ4dUwRHuBmg41LuRENY2pdAT+1tA611FH
	B5bEKjX3dQ4paDelglkfdaQFBYsFF8J4XCB06ufR7wG2rmCZYyVqWilOMYpIcIWoeHu7WzYnM4g
	y0DLL4za0LmCuxZwJ2GjzdsiDqpkUIJs9sql/AvZ8I9lae3fyFq8J91b5ZCG/hoDxhSRnJ0Xy2m
	34dynMwQA5bvL533LOhgs/3eE=
X-Google-Smtp-Source: AGHT+IGBibbMbWnp4wsYYpcAZc4iOvKmHvOhd0/KxBOtu8sk83ypjF+oQ0w3P1LE9KQVYZ/8hnbPDg==
X-Received: by 2002:a05:6512:61b1:b0:57c:2474:3743 with SMTP id 2adb3069b0e04-582d2f24dbfmr2344139e87.32.1758892290146;
        Fri, 26 Sep 2025 06:11:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:25 +0000
Subject: [PATCH v3 01/12] media: uvcvideo: Always set default_value
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-1-6dc2fa5b4220@chromium.org>
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
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

If the control does not support GET_DEF, the field default_value will be
left uninitialized during queryctrl.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 2905505c240c060e5034ea12d33b59d5702f2e1f..a869257e9b7c07eaa7d725d107bd1cb57d3c7377 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1542,10 +1542,11 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 			return ret;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF)
 		v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
 				UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
-	}
+	else
+		v4l2_ctrl->default_value = 0;
 
 	switch (mapping->v4l2_type) {
 	case V4L2_CTRL_TYPE_MENU:

-- 
2.51.0.536.g15c5d4f767-goog


