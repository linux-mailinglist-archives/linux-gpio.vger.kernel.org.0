Return-Path: <linux-gpio+bounces-18216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B5A7AE4E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 22:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859201899D60
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 20:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AFA202C20;
	Thu,  3 Apr 2025 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DWgwO9MS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F7200106
	for <linux-gpio@vger.kernel.org>; Thu,  3 Apr 2025 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707790; cv=none; b=eEDJSSDuGN52fkuaJAk+kym1P064n57A/oBSET5caHWWUUuIjGxRv81iHpEWjLwy/U4puqPpyyVJXo8Tyypc989OdiO+URTzPmtrFdJFxz/EYcntxc7YrahqYlkoxeATBkPv87i9HMTC8lbOGnjiOGGhdwq6HWj1JMfONfANano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707790; c=relaxed/simple;
	bh=Wk0eWcuzWua/Qg5JYIHzxP7iyJmxxh8gGdGpfJV3+s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUN+GfgL9NLE02uSpW/wJXxnvVj6w6tbaYrP56lYw54H3Fu9T6uyirVQHPlcVVRlsfpwoNHPBq/YWeEFpb5qQau8na1lmrRDQrvTm4PGPK65BqPj9HqIXT8zw8EEexYqlvpBhyY/Gs2kpXnkbZs/CszfMniAUogSLWMyJK3NXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DWgwO9MS; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54996d30bfbso1168047e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Apr 2025 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707785; x=1744312585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYoADrO9YZr1hNVt8FHHeiiSHUxZ6kaNBXaVFMruk+4=;
        b=DWgwO9MSWkKsNzZMC1zNRqXdDRAAWPff8lY2AmYm3PblwLKcMXt/NkDHDtHVm4x83n
         2A8V8L1ZBAsC4gzccm/aotFQlP7sJJmD5BKMNUz60qx08wz8QJRy62Y/gKgNbjzN7yQ/
         vmv10DmO5RqtS4diElpgm3KGnqAL2qIoFbVDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707785; x=1744312585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYoADrO9YZr1hNVt8FHHeiiSHUxZ6kaNBXaVFMruk+4=;
        b=UlscU1tM1VOjBqydEfmAoErZNqBsaZjkUwSom2U7moDcXDrdqg6dt9Ebc7K3kvyXZ0
         vTN6HGBbIJ2WvI9SV2Rbyg7bS0x5KlXludmoW6NHyfscUE8BqU1WSZN7dYUQlzo/lGfo
         /fKJmTU5jF+4n7mus1MPVmKYcwN9UR11ZI2rldJfqHaAz/jCUY1JyFOE0Y/fiatSOQxm
         2x/Pa9KfVQ/WYiIbfrJGqJLcfetm+DtBw4tFi+oQWmwQh0amVhG0rBiCQY0pKolMKueZ
         nDuwg/6+MQi4cnTjRFYzA591rpB6ELYdH+devgGjK074D9vdXN1Kfl7Yf+OC4ard+G0P
         PVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5l0AiPQUWBrp4DD3Wn32AZ+43Bp5ceU48XKC9hKqYxvy4azxbV6ShzaiFcuiePeNnjvZony21RMPA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw06isGsq9QN3Cv3gCmWpIQFmM+b2m52o0KewR8i7apMpmmXard
	3hYRm8qYSIuw5EOdSorMaAilRMuAOENbxkPJBsVQrWOUed38Q9H4rPlegZO34UA+hkj4J4VD+VY
	=
X-Gm-Gg: ASbGncuRlpAQWRyXVo09feWvTYTf9q/q14g09a6+7fG9tP/PNlXePa0zW5EQQo5EOf5
	dwEe1JAcDSSmRjMSAjddWkhyIR3TbulsBV6B1p0Ntt8oiOpQrbMAkxolPKi3kWmYHN8d2csLCb1
	28GprRnO19fwJVJR/tbG1G42QZVdaO46woZtbNd2jimgV2l4WZ0+awYjDSirIK9V9DZ9NdOrEcm
	ygTZMXtvnkbYuRadH20Qt4CQzEmQ8fx/vGhLlUE7aaectdq73DjPMSQDGpfWV0STjFS2UdQ8xRN
	KwFuOY35FMPykWsky3sn9j6Y5UsaJdnlmGzcYE4LuMYV1pLa/opSpnUPsr+6MFLs42fobVRDSXj
	vDjN2y4ffhOiygsa9hd6FysVZxBJLc5jpGfM=
X-Google-Smtp-Source: AGHT+IEGoLkshPtfD44DKnSZEUYb7gfzSjncS4T82uGZM/B3/E2lVpGdvLMrx6Bl5sLRu/jazB7Lrg==
X-Received: by 2002:a05:6512:3048:b0:542:213f:78fd with SMTP id 2adb3069b0e04-54c227f589amr79715e87.40.1743707785277;
        Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:13 +0000
Subject: [PATCH 2/8] media: uvcvideo: Use dev_err_probe for
 devm_gpiod_get_optional
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-2-1a0cc595a62d@chromium.org>
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
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

Use the dev_err_probe() helper for devm_gpiod_get_optional(), like we do
with gpiod_to_irq()

That eventually calls device_set_deferred_probe_reason() which can be
helpful for tracking down problems.

Now that all the error paths in uvc_gpio_parse have dev_err_probe, we
can remove the error message in uvc_probe.

Suggested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 25e9aea81196e0eddba6de74951a46a97ae0bdb8..da24a655ab68cc0957762f2b67387677c22224d1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1299,8 +1299,13 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 
 	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
 					       GPIOD_IN);
-	if (IS_ERR_OR_NULL(gpio_privacy))
-		return PTR_ERR_OR_ZERO(gpio_privacy);
+	if (!gpio_privacy)
+		return 0;
+
+	if (IS_ERR(gpio_privacy))
+		return dev_err_probe(&dev->intf->dev,
+				     PTR_ERR(gpio_privacy),
+				     "Can't get privacy GPIO\n");
 
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0)
@@ -2241,10 +2246,8 @@ static int uvc_probe(struct usb_interface *intf,
 
 	/* Parse the associated GPIOs. */
 	ret = uvc_gpio_parse(dev);
-	if (ret < 0) {
-		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
+	if (ret < 0)
 		goto error;
-	}
 
 	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,

-- 
2.49.0.504.g3bcea36a83-goog


