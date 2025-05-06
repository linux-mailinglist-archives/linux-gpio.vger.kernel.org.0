Return-Path: <linux-gpio+bounces-19669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 700C5AABE25
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE0AB1C25119
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065D9272E7F;
	Tue,  6 May 2025 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XHbTKbQZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689CA269B02
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522125; cv=none; b=fDTsrHDBsMr/oKNYAWMst8IminPwQ7ndjRAPgC5kpbHguZUthbXQ4kFIWIARMbvHG1/W9BFZg4GOA1/7dq0YcK3WX6QMaZsYACi9kDQ5YrmknT2CR/NRaobh4bHXBUhRTAhoj6mQfgoLo26lYE+Y+llz70rqBc4INmUniIFd3dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522125; c=relaxed/simple;
	bh=XH/0XVuO7qOBuaRm9fMchaz5m5bawJAXac5HMn3Z4GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+BBqGPiIO20t/3bk/VVxONw76HaUDDRWbU6F7lRe5nvFlzlM86y5swGse5y0BK3sNCbu64Dcoz5k2z3guHfG/SA0xdSPuXPcu1X7HNGlN8+VCn8k4Tq3vHq7DQ3yR/QpWDthx7M9Sq8sl4dCss2H5q5a+QL9Zo8y8N07wQ/Q74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XHbTKbQZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3549861f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522121; x=1747126921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO0TStYciJkxVrEVhFTekbwNrwQKqZ04D9RRPnQx4NI=;
        b=XHbTKbQZj8k89p++tV5ogn8czxk10OCH4nJ+ZLSdK3PZMdirktdcuNAOZizMheyWdZ
         kUDPbuNiEJQvT/Ia3xMDCPPHutUXHikdp8YILDVK0kXMwX+YTqvmTCgex0nAJ7VIsL4i
         PowY8NYHBcV368CDi+d6xUF8PjovrBy6aYkhj2svDHE/Yu+KdpmRHO2K87ECI0+pvzRo
         mj27xXq2dedUswOaLrJLfDrwtolKgkHO1iUiH0QDhlCzPZPRHYYCXlccxsdiCSH7VLg5
         8uvnCud3fH6LwSXOBuDwM54UlFJ/2QxknbS443rE7hk3tAUNzxK9/7N9KKGujSreFOYb
         918g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522121; x=1747126921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO0TStYciJkxVrEVhFTekbwNrwQKqZ04D9RRPnQx4NI=;
        b=qP9uNTOWxAtAEZmQZNi07cY+e2C7DDi6g/rfjD10AsfMObJ/0pJHHueQscc8sL11UC
         LFu386E2He22NOnpiL74cGEJoGK5XnuqF6yRQG1StE0W9sM/AlO0r38QiNvfcrs0dyHA
         FzRPvPmaa5xrm+Jy8xOJr9AnirpV9/nofUkywCUbhKykZWneA6XEugraVrUt9MWHLiVP
         RIsuZPBYx5pAl1W8xxeMBV2EGrL7zReuyTc6EyQdoHa1x4nPsinZ9+GS7mpsIYopC3OC
         UxlIylaHT/PLMU6VLKMIKKiupCk3GrmP/odmRQG2yvEGmjnJQ2Go225mBzbJEvfXLOxd
         5uRg==
X-Gm-Message-State: AOJu0Yww7fyucKuMbowUYCcJ39fbCJaaitqeigT/sYxtEUXiXHeC4r0Z
	uWnI1A2vGOpwDEIcxWz5CdXRy/Qq/ep+8YXQqyXFYDckHRJ+LaV1iGSxH79iRnPjsfceLI2tsN6
	B
X-Gm-Gg: ASbGnctXpop9EmIeizZ55CK4yGl23716qDKIW6gR1gQqM2qVw/fM96ntCLVDwgSFSs4
	KesAGgCukhQ9ZeI91l4wlw1Xw22Dp8b7V7xEMwP8G0RcvS9dFOsuydbzoQlKZNeEsClCVf7jzVR
	3LQJgLHLagH1rJvcHiMwTe/zT0HHge9VilvIltv/UGOg6lTF2osojVXbu3n5H5ltX3lH28TIjk5
	r9XvuWikSZyqRqPziMx1iSF0c5AvX6y93/oBeqqda+HysLPso3JtNtMXLYqwfq2e8/a+f0h/MP4
	2UN2Tcko17TrM/5WWBl94tswRpuMywAFpNI=
X-Google-Smtp-Source: AGHT+IElhv2wXvdZWe2BSaVQF6FOWYHmUMWsGXgp9L0VyKZ+PRC8C1pEa8f8v6TOsPJ2duwzmaV3Gg==
X-Received: by 2002:a5d:47c7:0:b0:39d:724f:a8ae with SMTP id ffacd0b85a97d-3a09fd9a77cmr8078099f8f.33.1746522120559;
        Tue, 06 May 2025 02:02:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:50 +0200
Subject: [PATCH 07/12] gpio: max730x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-7-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=C5mTxUoTZPoD+BYVxin9KA6rS3qrIxYM91GYOHN0blw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/+9uVpoftEKtklCkxpA9QpLMSMlQ3zO+VCP
 JvYVtcusGyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/gAKCRARpy6gFHHX
 crEqEACZiG048DnwbwoC7fKykT2HjmLlxGLUX+fOdkrVU4deU6eW5TBlgxOQkJPjFJiyoH62ZmB
 C/K/BY0xA2mtQYv0bhFzB+feuOq987JHl/stxocmaMoovOFz/uHyGOcAa2SfN5Lpfyw1XGIiFsB
 Io9NBYkF1Mv24CWFZlJcmu+Sf+GxeocPLW8Uab+Y1zQ8gqs8RuhnT2r+MzDpEEqX5cui+zkHFIf
 MiaMheSndz0bOIZJAgqzwVZADh3BBUG19tkWHT8S024LjDJ0mFn+ozP7n/f+N6d5soMTwhbbg+A
 QSW3JGZUtwrOnoT48SHITN6E+4QTNPWoG9bVpgpI9OrwQ6H56XnzswAsrpxdsElw9FNoiwpo56+
 IW7Iannd1gMlFBAmcDb9maEt2zD8MDdhv7IHV6g0BtJ+UvGgYrVETOjMYJpVJfqepWEwXWB1hvb
 jqtDvVu11/h44dejZHJKC7wouv3+oPEimede/G9wLY1CLX9UwMj24m6gAKpNbQ7/y/2Yi+UmiqY
 3pQFKze/tDjxRP3DycPAFPAv5ndpCC0t+oESotdZ2V7lMKGbFFdFg12/FQwGSBQJClCMa4IiTHA
 hiGrXFn5gFnbgXm5UJRga7lUvJscYCjwKSyRhuQidCfq+Uf9vnR8KpSELqboZrtwKj9ax0nWL10
 f4/nsoY5wR+SYgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-max730x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index e688c13c8cc32..75d414d8c992a 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -143,18 +143,21 @@ static int max7301_get(struct gpio_chip *chip, unsigned offset)
 	return level;
 }
 
-static void max7301_set(struct gpio_chip *chip, unsigned offset, int value)
+static int max7301_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct max7301 *ts = gpiochip_get_data(chip);
+	int ret;
 
 	/* First 4 pins are unused in the controller */
 	offset += 4;
 
 	mutex_lock(&ts->lock);
 
-	__max7301_set(ts, offset, value);
+	ret = __max7301_set(ts, offset, value);
 
 	mutex_unlock(&ts->lock);
+
+	return ret;
 }
 
 int __max730x_probe(struct max7301 *ts)
@@ -185,7 +188,7 @@ int __max730x_probe(struct max7301 *ts)
 	ts->chip.direction_input = max7301_direction_input;
 	ts->chip.get = max7301_get;
 	ts->chip.direction_output = max7301_direction_output;
-	ts->chip.set = max7301_set;
+	ts->chip.set_rv = max7301_set;
 
 	ts->chip.ngpio = PIN_NUMBER;
 	ts->chip.can_sleep = true;

-- 
2.45.2


