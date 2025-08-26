Return-Path: <linux-gpio+bounces-24976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B6B3598E
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D40E7B1E06
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DC52FAC02;
	Tue, 26 Aug 2025 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hgA34U9+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCB31986F
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202086; cv=none; b=U9wrwH7b8N3/mLb1xY9l9X1L7DStd9k6JLLB7bPyG0gDXxDb2OVs4e/wy6yO/bKJ5xtcwhVxGxcymF3iFhJEXdcgjVHjuLZKYxBg9X8CSoGIXjWvqYioWRSojTotLOLd/xJ97lup80plrJI/clgyr64bmQeWn0wAkuYfV52XVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202086; c=relaxed/simple;
	bh=Gn/lKg9DW9+7A7NG/Xm8HI1PObyZ8u17xB6xLp+6Zns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MfFGKn1NN404TgJ4l4qCyFJAYO5AXBzNt/Pc/jW12/RYfiI/6otznQdHgujj+EWPI9LmqhHNSb72tAkmhKZ+Kz9NnENE0ybb303Ky/nd/qeuptqOFA87j8Gv0BV9nz8b/ZXAwW2aBBXlzaT/Ek2HnYfat3U1ia9p7OcjFcchpUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hgA34U9+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so33627585e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202083; x=1756806883; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKCpxqsXSBWd5rXXvtS9KbFsw7XYgbeW+Y6mgnOOsQs=;
        b=hgA34U9+ksdIXjCRBYDVP5Y5ZyODSOnQUcR2PEmukWY0SDe1XslOC4GDN9us64JiZP
         Ee6KTHzB0BgqNedlrZ5gHImRDgISqNkcczLkoRJnJ4V4OComER2SvpsFw7HbZuHNcu3P
         +6FMCscHbMTUGmAIUm1tAlQCxqJfcS/fge0B4s3x4h5VdQwJ0zWEZ3ClWOJLFmbFtJ/j
         Q3aeYhO0vJSHjsTuCVg8ewfezhkwkqF2Q2Dj5gMGDONT60RmEZ6zGGQYVAG9npqPki0j
         KF9sw28cg8h8uWHLkGKN7WhPYPRSmmiPLZAHQkUbh/Bn+5EqrxlijYbOdZYvV6Apn2hh
         q/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202083; x=1756806883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKCpxqsXSBWd5rXXvtS9KbFsw7XYgbeW+Y6mgnOOsQs=;
        b=s1wsy70lYBYkfmu1qCaTn7ukYJQwQsU1jf8WF95wHWE9cCympC0g9FBg7z/lmyO/wl
         ZjUytq9+EIqASX1QJNMW68LDfr2BTWYKbFerW2yd4G2DbSC+/OrXzR1SGMlaCFnLHpxg
         iZTCAoWP81wDcPZFekEi/Ee/vY7XWfwwlmhf/K6tQjg7dD8QYWB4XE7QQSRiaSO2AE+5
         ma/bI8lP2I0JPMDgrr0r5WvdV+xfhJ2GofaPnmrPYUAgl4pqO5EvmUM0k2zZNFHFAWYk
         aSwzOhv1HMlWstACYT5OsBi0KDc/Emb1ZS9U52zyv6HqOdjyCC1lTY5m0OsKKlecetql
         EVoQ==
X-Gm-Message-State: AOJu0YxIcn6KQhnPWkJ6YJt+Oiy2goLMi3g1XIvfZX+lSSO5f33KrrsR
	wphiUTb88+Dp9qXnSnea6tmXi14qovmzMQZDDZHcvCtHGR/ZGOhxmRt4I7NToONagvA=
X-Gm-Gg: ASbGncs3FSlmhFZgp9z4aIymBOSywRGe4DVMbKa7UyzSeslEHT2WMyzBPhQiYR7McSH
	3k4vvcE1bzGbLlXPnnpIIW5Vck+a1NjuQRRuMgCRAS1pxJsPPAprETFrGnyqEoMqLOMySl45Qgw
	bcFiLsiDpimDb73k8BPB3Ib3YuWPCya+CvtdSuctAL3CJhY5Gr8b3yqL8t8jWvvGcB6pyK6pjYp
	1Qx/uLOTFVmQXIfjLrpTatRbCmIDtidjDTb+jISSqmOUmaQpUDsP2/g33QhUvsImqgzbApFj8jm
	tdG/EkMsSxb7YP//AAS8glLxthfZc8RGi+s/Ua0G56xAYTUYaZNZQHIRwiW9sHpmWzP7IsB/AEW
	v3IfoIyKOUwOd6LQcVBhvVvP5vacH
X-Google-Smtp-Source: AGHT+IG+25ORqjof2ATwzWOqh5zMg6Fps3s9la097lt+3O2I/uIH0JvNAAkPT5A+WwcwcTlymgdPXQ==
X-Received: by 2002:a05:600c:45cd:b0:458:c045:ee99 with SMTP id 5b1f17b1804b1-45b517d4562mr118379285e9.28.1756202082873;
        Tue, 26 Aug 2025 02:54:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] gpio: remove references to gpio_chip::base from
 debugfs callbacks
Date: Tue, 26 Aug 2025 11:54:34 +0200
Message-Id: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqErWgC/x3MQQqAIBBA0avErBvQQsquEi20JptNigMVSHdPW
 r7F/wWEMpPA1BTIdLFwPCt028B6uDMQ8lYNneqMGrXBkDji5gPKEW/0Tgjd0PvRKL1bZ6GGKdP
 Ozz+dl/f9ALZCNeNkAAAA
X-Change-ID: 20250815-gpio-dbg-show-base-a73b8501f9a9
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Gn/lKg9DW9+7A7NG/Xm8HI1PObyZ8u17xB6xLp+6Zns=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRdOrntH6xLuqY0RG6LOlTXHAItfAvEs25aM
 ASHA1ZZdbOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EXQAKCRARpy6gFHHX
 cmEtD/9Kspk5oVvRCV8qA4ZGfkv7SpRDLcPGj8xu9wBbaIAEc3SFVsuf56Fk5ofc3w3SsJTnhYr
 mXtMgsAOjRgswZA0xPsP1/YIRGwVdmHNBywk+6bhKaUz8+sTSyL3+vQ+IBPQ8NN11dV1IdkgrLu
 7ch/JoZCDM5HVPLziqdmKKyg2P4IOD1McVr1lXvvjQsKp8yBkyB3LDCOqb5TSb/D6jVQEsQ8X2B
 PqQGvNnB1Mi7f4vwP8MrjNyzfwQsk0g24n1Hp2RLCzM4ovP5DO2jmHKWP3GIi9bJgmG3ADgZeo9
 aYZaf0S59RIUz49NIZSjizww7qHTJtVtvWuNsIQVxkUn+6B25mzkZ+lRo+SrPjwKOIdjy/ocfuz
 0iHNyDod57+ptCo48ED1p2U4pNrMnkf/oSZKWFjGyt5BUniAqdss1bcCDOB12acGAd3Y7fnf753
 2WJjitNAWknKwpilmOMpnqK+RLI1FEffx/OITVlWPCOrSkBdYDGYyWBuMxyouSP8O3wqA/JlrXC
 6SuzAVXLdAzBMTP9jYXOjq7ZLUntsdCjCIFtG5C9lILvgvK5UgXEN8t+YrqX0sPkkkshhT2hUhh
 N5+rsep5nGITtAFlSSOOFWcmJW1x9smqqTHgh0wpaYusTUyCDuJ6CFpj1ZCHWmxmNsjBWvwnvda
 JoUY+IbaNQ/gW0Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

We've stopped displaying the global GPIO numbers from core GPIOLIB
debugfs callbacks. Start dropping it from drivers too.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      gpio: stmpe: don't print out global GPIO numbers in debugfs callbacks
      gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm831x: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm8994: don't print out global GPIO numbers in debugfs callbacks
      gpio: mvebu: don't print out global GPIO numbers in debugfs callbacks
      gpio: xra1403: don't print out global GPIO numbers in debugfs callbacks

 drivers/gpio/gpio-mvebu.c                 |  2 +-
 drivers/gpio/gpio-nomadik.c               | 25 ++++++++++++-------------
 drivers/gpio/gpio-stmpe.c                 | 14 ++++++--------
 drivers/gpio/gpio-wm831x.c                |  5 ++---
 drivers/gpio/gpio-wm8994.c                |  6 ++----
 drivers/gpio/gpio-xra1403.c               |  3 +--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |  2 +-
 include/linux/gpio/gpio-nomadik.h         |  3 +--
 8 files changed, 26 insertions(+), 34 deletions(-)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250815-gpio-dbg-show-base-a73b8501f9a9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


