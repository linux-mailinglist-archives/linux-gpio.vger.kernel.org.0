Return-Path: <linux-gpio+bounces-21056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F509ACF5BA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 19:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58DDC17236A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 17:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD2227A47F;
	Thu,  5 Jun 2025 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZVkCRHEm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745D27817C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145987; cv=none; b=ok/0jFlfJBanM8kyVCbuM5/HgNQXVLykQ18rQHV/Xe0LqrJmzG2ZxpGqi6Iq4Dm6+FW1touP0zE9ukqjTTsB3TcgQ49fftW5BTWPTd4HhRRgR1Maxp2SJQJHzfoVl/HJ7MkMqft1tKxY7zUJP9HpFmosEWw6pQSRiipwqvDxlBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145987; c=relaxed/simple;
	bh=tewb45+dzAe3tLBQsQaB+O4zKZphuKqtE9IM4Y6OX9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukBX1//XAVUy3Y6fgUdHtAyJ2HCYtgAd/mgpvXhvCiAvzU9ijfYr92E1A/jJ3NIfK0sujwcpnPCO45u8dtIrOPtXPLD5O4BpcYZsNg4g0ehhKLTLCJ0xiBBkc9KZqTMDjoCGq7rbYv74dn8cXiPdYaswBiR7Vrp4SuWUf6JTxu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZVkCRHEm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1429379e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145983; x=1749750783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2bzjHeaOe4XJQH7wCz0q9lsz5fFHI+NR6J/UEFEZdQ=;
        b=ZVkCRHEmBSMwAVs2r4H6mCqw7kB5h/HMviCkeWJwBrW4ZC8SnUK2Ug2FJB9zOV/PRa
         3yprm3m92Yf3jKNQHX2hv+vxVW36LQN/Qx2gkIo6Xf8evy9FIF6EVPgBXSp+IZObtOSz
         OWYhDVEBzWScLF1rid461YU5MTRNttPiSBucI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145983; x=1749750783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2bzjHeaOe4XJQH7wCz0q9lsz5fFHI+NR6J/UEFEZdQ=;
        b=HUwvgetI74OWFtPoAJITfSVwptyhm4sVF9jOeCaFl+9mV5AjJjVorhMQ8/SciXezc0
         Q8sJBvRCdqCEsqI5VVejZWtvFBK/+xbOTWIXadpGo6ZUragso7qDgjURixolr9SyWMwV
         0ZhxxtzU7wb9J8+0t6xcztkJhFjd9fUsCci0tmNQeb8q4rQjGjuTLFUy30CbeaPZqh5h
         4ZOn5OB9dtvyKpcNJ9TSLAJrmGnAUaBBfE7AKoIXsDKc5RgqZW3FggWdtL3tyDdknlgH
         7AlUsgyS1bG549PKiSHkDyP1MjPzSvmECWKEBtYZCRx/Ge+7XfQVxXh4B6zdKpOgzSRo
         o29g==
X-Forwarded-Encrypted: i=1; AJvYcCWpklkmPWX/sYEw6UDUAItuwpQS8Tky/mzCLfB2SYSZe24zFSwLPm77rg8+SQtm2/pWaEjekLFaDBvm@vger.kernel.org
X-Gm-Message-State: AOJu0YzSAAth8H3gTwv8rtfYG49rndRGK/EEb/kpjRHlHftCUQQcX/Eb
	GQPX5i5BvKPZpPnNw6TQ5c8BlQnuhvWghN4p+TX1yapXFmcvW/t8T9q62rqIta5NOw==
X-Gm-Gg: ASbGncsR12GhJwZBMWloxDZTb05XK2ZzDdWOLnbppzIGFROaomTVv9o/33TJJO+JYGI
	1p4jGXyjezn8Hbv8nfVB4ncfi4rn9I+gur8MODOjziZt/ywfPUFrrkPqZQH3WgKFtxKbzEYRBv0
	oEi7UYShIk13YQuaNNA4CLc0GOOg9AbenXKcEv+3wWWALvFgE+5MKOXpUjwxTOh8zd9FmCYuU1o
	nEe4j4eIUCrtpeppybbBOLPnKfNA60bpQe9DRFMmBCaamLcAF+eBYbwaxrXc1vMksLGGIDA5ElL
	gQxZRwq8+9vU4YRXsQw40sl+4YGsYQKmLMNkQKIVrgq3F3DDbZZv118MP9xeRnHgDZMGw9HWBf5
	C/w0rZlh8R7+kbTWtabVSFcTUcg==
X-Google-Smtp-Source: AGHT+IGl548xQa/vsHY27xBCLqMA/WtFSSEsFfeQt2Dzb0VNl43ck1yHu+ccC0nfMKcjxfgnvusB5Q==
X-Received: by 2002:a05:6512:1248:b0:553:2cc1:2bb4 with SMTP id 2adb3069b0e04-55366bd49dcmr18752e87.12.1749145983043;
        Thu, 05 Jun 2025 10:53:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:54 +0000
Subject: [PATCH v2 01/12] media: uvcvideo: Always set default_value
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-1-5710f9d030aa@chromium.org>
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

If the control does not support GET_DEF, the field default_value will be
left uninitialized during queryctrl.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..47e8ccc39234d1769384b55539a21df07f3d57c7 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1497,6 +1497,8 @@ static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
 		v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
 				UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+	} else {
+		v4l2_ctrl->default_value = 0;
 	}
 
 	switch (mapping->v4l2_type) {

-- 
2.50.0.rc0.642.g800a2b2222-goog


