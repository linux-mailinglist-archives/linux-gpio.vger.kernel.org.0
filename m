Return-Path: <linux-gpio+bounces-13462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 379129E2929
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 18:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAB542842D0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 17:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3B21FBC94;
	Tue,  3 Dec 2024 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OJYwIQ2b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FDA1FA844
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246803; cv=none; b=uRibnRW1f2Z7jp4Rusem70dPKu8iBNpPhdi6JYMamFEk7RvwVHfHulU9UxZGBX3kRBXcdc+cQAkuIg18UJOgmSiaVL3KLhOjmbZWtDPfykYSskkqLtSOE1Cz7zBxIIWsQr2ebqE4qgoJIVFKZyU0hRujERNbwCxnE3onF3cfL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246803; c=relaxed/simple;
	bh=oldT72jc/kzM05oU63xteGUohuTDDA1o8W6um1P1wqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iWVcHEer0Om8SnSE505dRtEhxQH8/XwFHTKiXgafLyUJj2XnTqYWG/yjjOTFm8hzsfCBozqnvMI1pCXaaOonpH2AWTK/5/4c+YbBb8MYhOhwXmdqdJlggIvHvUFoj+QuGq2fEQM32Q/7rumMruOIp08P9TNCgFw74Beyf3JtP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OJYwIQ2b; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e3621518so2881273f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 09:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733246799; x=1733851599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gKlkttErvmdcj2CmT0DQxhvL8ItHZ03o/rLzwv1+rNk=;
        b=OJYwIQ2bNwhFHtGLbbIfznXHfVG1jUlVZjz6Y1AxFmeUG/5nBY2gn9Bme1wzR+LlwQ
         Zu09MQPnPp6kpmy6g+v9N1odK38YO4SyCDtSkqvlwSq4Ypt0P0Q6s5nZA2tO/AAwZaFx
         WIV322sgTIweHpUBFIcU8k938+2PEzye78YtI7sRexYYYXeSafBVPDf8gt9QF6HFHebU
         O+oSvE1VaN/OwmDXicD5y6Pijsd6i0AB39awu8WMPpczM9A4UD4fiAq2FmxcXDk3zihg
         sJ8nNhArSFkQue7X5puJ9YjKuI1KTZKhHlEGtRaiQmTL11riU5CCmSZvhGYOmMXE5wWH
         /aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246799; x=1733851599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKlkttErvmdcj2CmT0DQxhvL8ItHZ03o/rLzwv1+rNk=;
        b=ho+T4nY8VylK/Kxy6cKZOgjlHEmvHpuzrfYOvrRkShoewK3QxDX+og8YcdLieyMuEJ
         2NV3xMYmTFF9X5I0unXAp0VocQW9wJCAu+L+Zfae2EQHUAWyxIQCgPCEs/9seJUT5lFi
         iH5D35H6T2xbwD289Xx9n8yJS/BSIqE7IId50KN7cSyavuHj6+p8m4jeD/zbwPxqprdO
         fq0cBIpBGCQKdO/dRcHPNbw9fTtVGA+ZfbNTQRWoP6V1SFvsiTnqbkD+092hUogASiZQ
         CdpJwPYHnoE/vPkRdei3Y/gGFKUbh8dnwguc02nzfY+es3VE/si02qALHGbOXGTfOwgk
         qRjA==
X-Gm-Message-State: AOJu0YxNEv0H1xHXCPKwOWfxtWl0FE6PK4/wHK8YGh6snltk2Pf+omkt
	dMUC6b0nQ7H2981KV9gQymm8ouSjx4GObMjGJUrpebnROusbHApSl9nXUZkumOBne7K1WQU1VJI
	aaNc=
X-Gm-Gg: ASbGncvZiYmFQxSdVxLzOgPnGpSaxCm9vVH03p+IFHbTXyHphxmulR9NZPLPWF8iHSW
	7nUC8WwJOOGlSKK4t8bOcPp/r6lXwDC2+6tYd93g5fNq9IgVd9kaZSHQ4yyE37XjQWXf5jQz3py
	n+dHYUq4KUPvDw+zQcsUHblej7mVYNJLIhuWSKL6of99B02Wgow928H1oFOlhkUHHfaFC3g2iEb
	S4bn4ZGTYFS3FOHP6cyO1lE1+LrRocF7P+K1DtHPS4mnE4FLrms5XADZwi278QMMQGD9YuqVZws
	dWtQ
X-Google-Smtp-Source: AGHT+IHYU9yw9YzLOs8j5cO89VoWnSoBWOWoh8EIraRsdNHh79obJnH7UND7+18QWnVzJqco3doamg==
X-Received: by 2002:a5d:64a9:0:b0:381:f443:21d3 with SMTP id ffacd0b85a97d-385fd550480mr2753273f8f.57.1733246798693;
        Tue, 03 Dec 2024 09:26:38 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm12665080f8f.60.2024.12.03.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:26:38 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: idio-16: Actually make use of the GPIO_IDIO_16 symbol namespace
Date: Tue,  3 Dec 2024 18:26:30 +0100
Message-ID: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=oldT72jc/kzM05oU63xteGUohuTDDA1o8W6um1P1wqU=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGdPP0eiX0Q6LeQ0d89CTqaFdX6c0OxM9Za5jfur8fbtn3F18 YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJnTz9HAAoJEI+A+1h9Ev5ODS4IAJgB FvfLpw7OQcXBwXEa6hy1voY/NTIQhHPE1wu2Ull5rUkTKdbliXZr3jOJytsah1kgflVZHa4P8SS C7GfX7uH7FfqOBj9d27WwO/ZTjD5LRG1pPxNV/THaouFJQUvGkAISead4LdbbWE1t649Yk1h1vS yyIvXynOPYYqjLjp7YEyncXIGSbiCKS4NFbX2s8HuYi97aluPbvNragN+eTYlREHy+7WkCvoOyu WVyhpMUL+IYXibLmFTLHFvpUPSLqcc7JxChKHkvsLI48ehZmKZWBMYu1tMPa2QjNHf6YnKFeVud Obdl3FCoCgsBCi6mU+HcdECgV/lpgJUinr7tlcM=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
is included. So move the define above the include block.

Fixes: b9b1fc1ae119 ("gpio: idio-16: Introduce the ACCES IDIO-16 GPIO library module")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on current Linus Torvalds's master branch and depends on
the topmost commit there.

Best regards
Uwe

 drivers/gpio/gpio-idio-16.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-idio-16.c b/drivers/gpio/gpio-idio-16.c
index 2c9512589297..0103be977c66 100644
--- a/drivers/gpio/gpio-idio-16.c
+++ b/drivers/gpio/gpio-idio-16.c
@@ -3,6 +3,9 @@
  * GPIO library for the ACCES IDIO-16 family
  * Copyright (C) 2022 William Breathitt Gray
  */
+
+#define DEFAULT_SYMBOL_NAMESPACE "GPIO_IDIO_16"
+
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -14,8 +17,6 @@
 
 #include "gpio-idio-16.h"
 
-#define DEFAULT_SYMBOL_NAMESPACE "GPIO_IDIO_16"
-
 #define IDIO_16_DAT_BASE 0x0
 #define IDIO_16_OUT_BASE IDIO_16_DAT_BASE
 #define IDIO_16_IN_BASE (IDIO_16_DAT_BASE + 1)

base-commit: ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1
-- 
2.45.2


