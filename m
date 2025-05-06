Return-Path: <linux-gpio+bounces-19661-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9051AABE15
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 254081C243ED
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6465264A76;
	Tue,  6 May 2025 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RGd0UEv/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7EB19F115
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522116; cv=none; b=YbGZd19gUF0Yq+9F8tQ1hxfYGh+r4v3AqI3fLG8g7t79nfcr9Ub4OYMvYw93VlsMmqUiEWbVwmy1gHCJLgz7m5/I+3RNrqxUw5hQZlWvY/5vnHtB19pK00rzPfna70cuzHjNcq1ltC4ek1oiY0V4ReD2gtTI8rBdDgACoScZBAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522116; c=relaxed/simple;
	bh=zzyfhEwAK0od7u7qQvaEU1irR1bKl9oLt0gopkvJps8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bv37ASoJHNfxPRQrI3keP0JOa12SomLQDwCiUqJLvmBGjuie5KYGMfZEOHlCv2EYNE1zV2ESbWp+YkJGTC3KUM0+4ucGCzbr9YG+FFYw95+uqb6UXdusloEuGIASf0Jig5rttxoymOQiX/0UbF0ekuRRch4LchUPUZGGKVmLgQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RGd0UEv/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so44931175e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522113; x=1747126913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkSckdGbet2iMO3lK9JiFkiMA12riXIjt+egFZP9xhw=;
        b=RGd0UEv/a/LG4BHUNtxIVCW5vNPWSKUb4rpdeHjRUJEWAmcRkF0DKmBK/3xQI87k99
         HvQgd/l/KSp6nL6y8sq9b4ELzSFbqjoOk+DJJx6MXKXYFvdBwtOzyEBr6Gt+SABDM7hl
         NeoG6guYMXm1hOXujFXkTN35LsxzTs8uoFYQj5f2IY0cK6j0PL3VeXqVIJH06agyOtqx
         AlGvkjHAE0xkY6AGgqf7Vgbgol5yW0XUhvRfCYwHGTsjOmaK5jeHAVJy2+YBrix0lFgQ
         /zdhPCFpYZ8jvrDASYnORawJ1j6EzipETxYC4H7R5vW/qeaVMzHBRRwtkMzFPH9HRGmr
         CScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522113; x=1747126913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkSckdGbet2iMO3lK9JiFkiMA12riXIjt+egFZP9xhw=;
        b=gYrC9RGwtabav61J84+Fr7vH3XqoCJFMsDGIvczJ1u3uLBxiSIe493coLvCYGlbgRv
         ePJQZalVvkFQWPbnuFE3KYMZvV+bgkF/bJaeyOUjEZG1+ovwabnIb9nX1oqflUqtMadq
         TVwGzmDhko+Cwnv7+xceg12nvN4y6llIOrdR7sTwSkcMGAETl43pqAWR/W/h9LFZMF0y
         2qw4hpOTBqYZoVZssExu4uVpYUUm/ddk/V51fDVTFCArU6LywRNxK3a2PlMBl+pJRyuC
         ouiUieDLInup0oB9qewHfqzgowdWorqFkEEtr8Y5gHmmgec6QY2dgN3OLTl15S+PWUjx
         6GuA==
X-Gm-Message-State: AOJu0Yw8N+T1KPeS6jz6hEY2hDOo79NthgcUwBShc7eGlZh/rfMptGLW
	/luon9tNWyx1ST8VF5syW42faXbe2qP7L/jb6CmN0i1Hmxe6mnQ8p/KiQuLJW1M=
X-Gm-Gg: ASbGnctBu4dfi1yGVV70pfebTSRMc2ueVPbyIgmTpho36NtexEywcN6spC+b90cPzx8
	IoXOECVDbGYbwklun6ND3FYE/wjvTiOs30+ixWUv3a008j0JkcUV/udYAOQIg/TCz0MGoEQM+Cu
	MyyEF0XacxJnii2slAsbolPXTOe4faWvcw6gR1WyHrBevftdGzT5Ad2cW6wtOBGp1NfkN3PqJTe
	0gl1tBCJlrGlwJl7OYmUEkM0gPGHMDJzxBrsrdRo+OJFeLnYwFqVLQL22vG7evIFLpH2TpiUB5P
	1eBHBI48xi/OziV8DOj/C/XHF2L5+tR4yGF5zCjGDfwvdw==
X-Google-Smtp-Source: AGHT+IFj7sycuby5+Xisi67I6ctjifRj/oOl9WSXmMnv0sxBewhRFv1zbclSFWHzUaj8JwTL8LEU3A==
X-Received: by 2002:a05:600c:4f54:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441c48b3c97mr66535245e9.8.1746522113070;
        Tue, 06 May 2025 02:01:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 3 for v6.16
Date: Tue, 06 May 2025 11:01:43 +0200
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfPGWgC/x3MQQqAIBAAwK/Inlswrai+Eh3C1tqLyioRRH9PO
 s5lHsgkTBlm9YDQxZljqGgbBe7cwkHIezUYbXrd6wGPxNGdnDBTQbl+Y9qkWJz8aIbOWWeshxo
 kIc/3ny/r+364QdFSbAAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zzyfhEwAK0od7u7qQvaEU1irR1bKl9oLt0gopkvJps8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/5slEzhsD4QV82YbNGPsWnFf/VHMCf8ipQG
 d21roh9ByyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP+QAKCRARpy6gFHHX
 csZxD/4p08GnOddD9OWGTSyOB4+3HZn3pFgEl5zIiWCeDBSBuwfSNxTEfLgdhQhMV4SWPcuMgz7
 zztx5NWLVVaBwFAhh45V+ILUKvXpMTIsNgCEXmDYu7/opEgQuH6qEKzTIRBbTiFQmov7SdGC8bD
 4l2vyF69wBGWNC5gL+5ZsIm36sgpJsAFAJN4GOV/Y+QLZ6tC5z2RTD5bEX9gz5q+peiAEEKgm/9
 3xsK7obO2K9DiFYUjMDcsKCEVPyNV53I67w9YcZYBjCDBgvbPPt0keoMJpHfeXPxDKeD4auTRJl
 sLHwIRGdoX8cOmOQTm1sYsD5ISGRd6IYV0RdZ82D4gKBKft+gSgA9+rzZ2+Vz5Df73nTGCnrlA3
 zaYVp8j3EcNKsUfT9fjdAe/zE2zn5OEcroiZo1iBJDTOzR9gleq6RBTf8Vnht+IoUhWwt5Dy5ee
 W0QZQ5x6shgBpFdgGbdNXHfSfNcmON/yayuAzZoKud3EQ/Pdo0qaJW0hbE+ljm5KPBA0NemlL7/
 m5mcq9EaHsXMtcLGVmaHTwCQA9LMiw4YIKOS2CRlI5wOljOBcoDPGnyRWWx8hBLBzaK+Wt/w2Hf
 63/qwQuNNoogtfd6p4JxCxYiqaroOH3mBmEhlIqJsPBK5NW5SEPu4bc0c9WiACtIiJhLM7RCJok
 1eVp+i8HvwPoY0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: lp873x: use new GPIO line value setter callbacks
      gpio: lp87565: use new GPIO line value setter callbacks
      gpio: lpc18xx: use new GPIO line value setter callbacks
      gpio: lpc32xx: use new GPIO line value setter callbacks
      gpio: madera: use new GPIO line value setter callbacks
      gpio: max3191x: remove unused callbacks
      gpio: max730x: use new GPIO line value setter callbacks
      gpio: max732x: use new GPIO line value setter callbacks
      gpio: max77620: use new GPIO line value setter callbacks
      gpio: mb86s7x: use new GPIO line value setter callbacks
      gpio: mc33880: use new GPIO line value setter callbacks
      gpio: ml-ioh: use new GPIO line value setter callbacks

 drivers/gpio/gpio-lp873x.c   | 12 ++++++------
 drivers/gpio/gpio-lp87565.c  | 15 +++++++++------
 drivers/gpio/gpio-lpc18xx.c  |  8 ++++++--
 drivers/gpio/gpio-lpc32xx.c  | 28 +++++++++++++++++-----------
 drivers/gpio/gpio-madera.c   | 18 ++++++------------
 drivers/gpio/gpio-max3191x.c | 16 ----------------
 drivers/gpio/gpio-max730x.c  |  9 ++++++---
 drivers/gpio/gpio-max732x.c  | 15 ++++++++++-----
 drivers/gpio/gpio-max77620.c | 13 +++++--------
 drivers/gpio/gpio-mb86s7x.c  |  6 ++++--
 drivers/gpio/gpio-mc33880.c  |  9 ++++++---
 drivers/gpio/gpio-ml-ioh.c   |  6 ++++--
 12 files changed, 79 insertions(+), 76 deletions(-)
---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250506-gpiochip-set-rv-gpio-part3-9f8264c3c23f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


