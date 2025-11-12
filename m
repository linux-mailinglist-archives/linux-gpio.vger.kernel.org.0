Return-Path: <linux-gpio+bounces-28392-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A0C529E0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 15:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52719427115
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 13:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C8726A0DB;
	Wed, 12 Nov 2025 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WE6btBxV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BB24E4A1
	for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955745; cv=none; b=pyPhOYphUhZvUHG4dR3fc8M5IpO8gtmRh90H+NQdKEVyfqa75Ebv3icI6dS5lA9zl/Y5LQ4BDtPpt3cBrz5jARCEnYuUspMSgQTI+sxysPv8gEmsD2626qqMTG4iFJ4IQUVRUYRkCfOXFU18Gmw/nMRpPM+3VcMxNlsloHjsz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955745; c=relaxed/simple;
	bh=KN033bDXd68p0ygzAwO9lMJaY9FplVJ3RsK58yXEA24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnBMNq1/FikNPTJgRW4WaHaBblU8RqFMcvQXbUGbhXrvOMvACayQb9b40AJFvIKLSaoIfzC5PXbx+Ulv8/fyisfmY/MFdx0lhIXITdfvA9cwgAsx7uIfRPcABWfK0Au8sfmS9YSyuM2w63n3bkDVHCSbZjDEDe8SC8P1cIOrKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WE6btBxV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47778b23f64so6237235e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Nov 2025 05:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955742; x=1763560542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hgFs5jtdGYJBZ1LEdVbgHUHnMs4CKKuQJyrqRFEph4=;
        b=WE6btBxVDTXx8n/dyWjbAKye7yMioyNQIy2em+DowK6RvO/+CgSaF3xiOwEpadP6J5
         Yu8dO/6INKWUvsFR0NkfG3bXVYJKlP65eX8EbUhw838I+0Y5SpEzJVqlNOJFsoQ90+8K
         g6H5v0ru/aiWVUtw53AV2066R+F8u5cLQSvrnFErvWu1tZye2n2zzZkCg09nwtaLa1l5
         jXdMSzePO+XkhnI6u89UMZC52jNS8BGZqqerC/jyGIO5VLzWf4NhHu+Xyj6iBw1ZA5fE
         2JClMCr1oPzngthmuIaW6WJjGBkx3dYFE11YvCjpQoRLvXin6W4bycFfslfmQGv0/REk
         igig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955742; x=1763560542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hgFs5jtdGYJBZ1LEdVbgHUHnMs4CKKuQJyrqRFEph4=;
        b=lm2UoMjGuSKWcdQK9w8WxejtH9lToU4vVqMzF9mDZF6OGh4u3KZzvkK+Gdg1MDfY4F
         WcIlc0nkDD66HX6uXmRB0b3pkZm4e+8yOvKOw9ntsLwKtIHkr6OeUJPtT7R1o1rOmLCp
         3T1jRBsIxouJLG0BWXXF9M/8iOWCFPI3OUsixl4vjefu4wvGLxXc8ckDfX+/Q5t0isac
         pZOHEed0sS38STViyc7jFA+09el/VzVY+B+2iLl0ZmgBMftjzEz7z0j4xUToAidPSQoI
         uOWf7shsFlQAhIBPlGA03BQab6WNCa+TuVoScYyEdW8+qLyN1FJKyp5+K+quYPa8Lumd
         fBUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUcXqMhSHT+refDC90Mv6eTFjr8YkKvNOhPVP6c9hO/rmW0YLyEcPBH6CpOmkM41+u/nL4n1RdenBX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Spwx/4M7vFqLcD863tXIAtsi8gGGMgjCJiqYIqYXh7gy75Y8
	SA252XndoDA5hJ720YTdjGgoRCPZjBbYiswAb80WW/I/cmgBh6kRQ/nj+DBiR3Kt+4Y=
X-Gm-Gg: ASbGncvm4XJsChUDeDKVs80xgoxaVueKSLgh5h1oOgcjDsVRKfyXapBMz6NwC0QULHK
	EJe1bdJqeO70YrMXDAxjkhsZrsJM3tzjTigTy4OOLl3ycZ+ezR6R6FSFnSep98fm0eIx/+95f+S
	M8Yp2u9wctKOWAA+uktOrTCjFFMJ30Q+J07OwyIP+/Bf9SThHcP5TPzSJm/f/ySwx7/fG6NHo58
	tCPoKQMv/lMjdkwd5P24jupQHAAtRXECK6d0w/hHDExUL9g50HznF8z0ucH789W6swngsP1ddTv
	J5CJr09ykBxYV9hQiuFG4O79oda8ydAEpRQSMXmOSYJyE+gDwljcXJgl70ZITC7MK0mk5Ga2isJ
	09XW7x5nHLGGBVGlDaVHX5bAvYEDen5hczDjP1H0I96GKmcJtfzKin1padik57tuWFQA=
X-Google-Smtp-Source: AGHT+IGpKMpu73nkeB94rPHaIZutixTAdFFPa6qysCajDttSQ0OQGd/OBq10tj2PVKg3TstrN7uRIQ==
X-Received: by 2002:a05:600c:4f91:b0:46e:4704:b01e with SMTP id 5b1f17b1804b1-477870708e1mr27099245e9.8.1762955742150;
        Wed, 12 Nov 2025 05:55:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:31 +0100
Subject: [PATCH v4 02/10] gpiolib: define GPIOD_FLAG_SHARED
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-2-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fe01g4C6qCSbAEu6zmke8JCgZ5Eo9dDIwKAhmTSay1w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHVBTDDrvJHZ80xPG9a4F7QqcyJzJgbcSXHa
 oo9SZzZ15CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1QAKCRAFnS7L/zaE
 w91FEACnpe+vPiO9uBC+BsokWIYfbDME+aBKEozY7SwP0GRthdoEWwpZO7sgtgsDqvbBiW27PQj
 u3dNIE3sC+Xq4qVOYGD1CwpgZRYk+nWkm0G/rdY9Cdt3WkjzDjmRKQ6nfYxQ8QCUe3oWOHRD2aD
 FIGPCTly2E8ANXYEWTCdTDIlSifKrLDkfDYoiYC4zvzVFh7yfTrfN3OorFzIpqoBDiFUdOF5v4R
 kZXRmcAik8hp+cSw2IqltJYa0IpkM3fi35svUUVAiaLFemUnTXLwinqOdZXoAR3NUUIkg+yfyGT
 Ng+kpi792Y0jFdeMbPRqb7Brix32Pi7kA6zS6AWsT36I9rQzC1uWHWh10ar6IO4g/0eihjuFPkq
 lIUPxsIpKrOIaKFX5oLZFonmQNcTu/QgsBF3WvKDnb+soIUb4YRd94DdPk93QpQ+YX0A+xvfNvf
 WxDOUFlr8mhOjvU+AbCZTnisyN6TBs1WfXYv2BMxjlOki2kzA6/hsumjEZ41oXWs/fNBeAOSZiV
 uAFemOSTTwgXTlYdblMtR4YBxsA+hUnf62j8isuIFTVeDl04b/T9Q6CDK87kqWqQNOrJgJL27OE
 djN1+y17ilgzoN87pxNZICYpjc2tighS0XY2870Hyn8BpJTZ2mwyf627na0bY0v18oddUykWYfU
 xrHzssrVMLnGRhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Define a new GPIO descriptor flag for marking pins that are shared by
multiple consumer. This flag will be used in several places so we need
to do it in advance and separately from other changes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 14e6a9807a89da6d7c6594a0a2de5f5032c49e0d..c9de4bb10584206f4888c0f28468762a3680aae6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -204,6 +204,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

-- 
2.51.0


