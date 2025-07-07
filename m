Return-Path: <linux-gpio+bounces-22845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B262AFAD93
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC23189DBBD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC7228750E;
	Mon,  7 Jul 2025 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U8fbKBiL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72221FF30
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874624; cv=none; b=j3j9bs5C1tZa29prEkMNokgYzV46lD+jas/8lXhKQFpMUUFEkR+CW8mVt4hnehAALbkoety/M1aWLM29WLi3EoVtXc0hwQEKqj6P3dNVokb5iIlemYzI6JJOUzGY31tHFVCDMzDvT+vCubstMmFN1S7FSivSWUNJCc5lmoRRsy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874624; c=relaxed/simple;
	bh=N5jkOm+E42/3325sIdUmS+wpBK7ER15rMc5rHE+VhBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kIpr0jKMutXVUV9CKBpVo53lDc4dofXzQ3fYAXGFcK7oYdLd0XDemNHP0QVX6G6+O6rUED+/ZSWtCT19bmLNOQ0Y1V90tdj8ip5/rHuDlkF4VeNX2zhMV5cc8Cihg7ovebPcIIWCZuywfTwLhNRfzcyH8dyj4Hl7O/dQOb2j9YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U8fbKBiL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453634d8609so18742555e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874622; x=1752479422; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrJ6zrF6vaCOu99tOK97ZMO7NSzykhtEKi8+veNvYb0=;
        b=U8fbKBiLF+l6qOXXQF3pOs6u4f2Rsvy6O/71A73iHmGilelri8toCMBZ46G1Zv7jo+
         YPxbDmxIC2lwqCg3D6VzUpdtb5eRq7iYQzFhdaIypHjfdWP7hyXvagtx1h1fdkcH85HQ
         5A3Ivw4WpPY6FWyVfevZAZhAaJK7ZZW2ZmXOQE8coqVEOd6HGbAu5ASoep9g3Pf/GHuJ
         3mZJtcwFxi1mbwC0WqRWhRHpoF+CnjfWqZqxqJ3YOYxvJewVqwZct84f1JbGnoO1DxhD
         HgQLydO+80XzLemKTY6zf+OZi8RzCrdskgsry96j+a672W6lW8KyPRTQAie6Rhex5DkG
         LxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874622; x=1752479422;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrJ6zrF6vaCOu99tOK97ZMO7NSzykhtEKi8+veNvYb0=;
        b=d0bNjj8Gw6Zk0N1g3r9A3oMy1s2o+wk9B8dMD4rkLUspw9V5FKZVucgPjbYKmtNdRR
         5BUH/NDLdbRdhVoYkSBehOWH/d1tKlou/kln5WPDVCxIZZBpHxMfp2hxlSHLbtfIPA2S
         6Zcxl5R3q7o/bOBwtJgqxUD7iXO/vMrBU2mFYtEfZv13i8O8lv170Yyx4/IVT17tyOnJ
         W1A7aiwh1EWe6C7C1KGgSTE2SsxOqAA600WoFwypMlBy5JGFWf0w5rLQ/KNsbiYo9vQh
         vh2zSWpGOldAjvGyo4OWmt0di55rSVgrklL8Y/ZB3DDXepzzmJ67M3A6V6wnHMd3BKfy
         vP+Q==
X-Gm-Message-State: AOJu0YyJWTZ6jXs8ogLgKhido/+BtAf7rb/Cn2Alx6r5AGhsp+QLZscn
	APJoOlyXWhpUAbo6ASllZhB150aZniaHAT+lxKKTGxCiNguPfT/wA1rENgMDcMooHr8=
X-Gm-Gg: ASbGncsyHOE7v9sMjqARpTBwvYyX6SmsAE+pOLBGA3u7bNY3ePd5YJeEiTUf1zPFtPn
	sy90hvTeCMPa9LgFFGYKFZt7CWwviFYEd4CCLghavPOsOUUu/OntHKlLGdQcz5jGPbPcQREFgIT
	oddah8HPjT3wCjVVSmVhT9bQhrgImZG7vVFfDiLBvBRCgXLWcohBie+mtkicbrFvwyrxDTGIWik
	BuN5NejYjb9dzuTufeBK9Eu6yIK5bT5O7p9m8TrlqZUJTeMpG50J/ka06jFDdpQHiGCC7WmGzJJ
	I+Zuk/xYUKyZW60d/eArI1uYf3aNBLm9nB++0cyxWpS7VGErlxoOLsEl
X-Google-Smtp-Source: AGHT+IH4gLV5Mgn3MdroclkxvUxTKeVkvmHDseW8EX75VnEa6h1K/vjvfvOwjdwNRHlp/4uzbFHh5w==
X-Received: by 2002:a05:600c:3ba5:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-454bda7bdccmr48978165e9.21.1751874621306;
        Mon, 07 Jul 2025 00:50:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Mon, 07 Jul 2025 09:50:13 +0200
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADV8a2gC/x3MOwqAMAwA0KtIZgP1UxWvIg7appqlLamKIN7d4
 viW90AiYUowFg8IXZw4+IyqLMDsi98I2WZDrWqtetXgFjmYnSMmOlCu3yjh9LZFalbdDc4uemg
 hD1HI8f3v0/y+H+Fd+LttAAAA
X-Change-ID: 20250703-gpiochip-set-rv-gpio-round4-e3b568fda584
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N5jkOm+E42/3325sIdUmS+wpBK7ER15rMc5rHE+VhBg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w5tKVICFJEhXCxLZ7KQX21D4C2OCbBqjj7g
 LfSHShz25+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OQAKCRARpy6gFHHX
 cph4D/9XkrbmY6i6HDt0Q6nX+na/hkp23/znnKQcMJJi5zuQ/t0WnggIIqdXKmBwqf6H0GAav2w
 irFg4zybDpxT38A5klx8m+9f1RQ5RxP0J+mWyeXv6DpzPsR1ibP5S8QEJiqilS47WrkKm4vufW0
 +20euvBZ2i4yvFrSPGAoaQ66oCatMYAzN/Bg8Xcn9bO/KKXgFo2yn/ukjlDlib61WqBqTxp77Ds
 G3wPgAYY6Ae+7/uBSFJh/jGJctTJypXFX/NUS8waHsqZps7fGN6JHHlNUCOXpzQXj+zYPjkNn9x
 6A2vcYBY22Qy8H7v8FAfDPnvkb+1NvN7eLkbtOnsLKUZ5z+LdF2o1xeyJCjshxnxex3ndPUIc8j
 6S+cpIaP/p64S2fj2MqnMKNQS6VzfeJ0qNn0GcYvIfH9UG+ZC4KIlGUgRZ37WTGJrf9uN7Eb44a
 zz+zagYRrWB3Dbr5cZtJBZsUtJnoTdznhgfL20NiK29AIlL3okae268KjdXnx54v5DREc2Om5bu
 lcgT7VJvcpH9Lqw5EhYAQbvTfhEH3gnwhJRF5bY1dRu2N6QBcljYZKBBYoDnlLuyvpKAHpABdB5
 EjN+HpurtDmAMYFVlEYV5no1rLlIHLnQMB27gi4qr+zaammaLIiFVO5NQA+j7K5/zZSyANkYvs+
 ddLuVD9NJscVD8A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

To: 

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: tps65910: use new GPIO line value setter callbacks
      gpio: tps65912: check the return value of regmap_update_bits()
      gpio: tps65912: use new GPIO line value setter callbacks
      gpio: tps68470: use new GPIO line value setter callbacks
      gpio: tqmx86: use new GPIO line value setter callbacks
      gpio: ts4900: use new GPIO line value setter callbacks
      gpio: twl4030: use new GPIO line value setter callbacks
      gpio: twl6040: use new GPIO line value setter callbacks
      gpio: twl6040: set line value in .direction_out()
      gpio: uniphier: use new GPIO line value setter callbacks
      gpio: viperboard: use new GPIO line value setter callbacks
      gpio: virtio: use new GPIO line value setter callbacks

 drivers/gpio/gpio-tps65910.c   |  21 ++++----
 drivers/gpio/gpio-tps65912.c   |  17 +++---
 drivers/gpio/gpio-tps68470.c   |  14 +++--
 drivers/gpio/gpio-tqmx86.c     |   8 +--
 drivers/gpio/gpio-ts4900.c     |  14 ++---
 drivers/gpio/gpio-twl4030.c    |  23 ++++----
 drivers/gpio/gpio-twl6040.c    |  23 ++++----
 drivers/gpio/gpio-uniphier.c   |  16 +++---
 drivers/gpio/gpio-viperboard.c | 116 ++++++++++++++++++++++-------------------
 drivers/gpio/gpio-virtio.c     |   7 +--
 10 files changed, 144 insertions(+), 115 deletions(-)
---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250703-gpiochip-set-rv-gpio-round4-e3b568fda584

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


