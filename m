Return-Path: <linux-gpio+bounces-15645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB6A2E9FE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 11:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 240251884B36
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 10:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7747A1CEEBE;
	Mon, 10 Feb 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kMvbcLL8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D4F1C9B97
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184728; cv=none; b=d6vUDOGupbvJiavPj6ZK1jwJeXISqZvCYvo6fWg3OtYGw7bCs5gH23Rad8nGgcjv1Gsskh7TnddEBFG60FYzzNXaCVYvjsiNTYKrhkuDHLquGY5USHeOnKIlJ/r/H5B4yOs+oddXnRfvmSmtb3ALM1Y2REr+6Pr+yGVxGe7FyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184728; c=relaxed/simple;
	bh=BRWGzZuvtmwXMmkURqAYnIS2QtQklPosFB7K+YfF4t0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k9MQD6ElB5zxwlbcBrV3NmPVu5a1z0HAWz61UJGLJbnWjQetkhHrI+nzEul4gZ2zcHae8wUzX5CEqDgjoo73gqE1LvmgtD9//EcpaNIcZR0dGz/QKibyPWCzbPGIxn9xjVvfaZQN/2TUpUVXA+cnDK8Y8DrYXUtiqEzbA7ZgZ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kMvbcLL8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436345cc17bso28356135e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 02:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184725; x=1739789525; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=taqCovvHhkJXcdGrGiJbuI0yrUJJAsTV1+7Sh8JSxKI=;
        b=kMvbcLL8oiwm5xnbKragiaGZYowqI7xmVSyVc+/TZ8bjSVYGa6p9mFTku5Ao14gqis
         c4T+DNGeEL7mKlbKEfXXUkqU2pgnHCpaRNWbC053UUtygvNLr2MhHL0suy4zL3cG5JYW
         CTI61ezYP3xerGcoKecXZllYqLDmHQRENqvJScd/dQHV9rznD95TarMvDMMcnHLCJUtF
         Bk4Cx1lqXSk8uCJo9euFx9szsSnRhyPsVVwe6upWCMt5sbpZNCf90u1oB40KFAtZpDXI
         upuhqtIriEeEN6awiclIgiy0uIrhwEe43gTky/HsueUcWUByhcHfKpkf2n8AvDELDvfP
         Krbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184725; x=1739789525;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taqCovvHhkJXcdGrGiJbuI0yrUJJAsTV1+7Sh8JSxKI=;
        b=NtpG+L9ltY7aLisM+jRqLfF9P+oygCZLj6vI9kg7El7K8BaqjOX7j6xnFaiq8dEN7R
         pLaNQgTlugdIc5NIC7x/Z/DDXlgufxgXjcIUd5xORnzlpqkmT7owhM7v66OAS3KTJF4g
         Ra+mWA7bf46Q/NcU115kIPzuRqW8KciSoEpM31d+AUhCEJT763+yNURiOTZSb1sB8q9N
         Mletwa/Rtg1yf95QQKHvb+VcUq4t83s/4FgEMqjL1tIIFGf+KhhgfPdag8c/TwR9P7iJ
         TwBtXO+VZsAAc8uSc8az9QyWgeQqvA3s4hJrIoO6PeF7E6FxpUD38AtM9wIWTj8G4ALT
         TIhw==
X-Gm-Message-State: AOJu0YxN5QuZ9hvB1Z2MqpYkYpySM/HZ2EfO2Bx1zcVsshC/j3RCiJko
	N1wasuUY+gBFQOs/ZvXwcdFLTCHm2B3FP9yOvLIW2YgXuiEHM2TU8035jRQ127w=
X-Gm-Gg: ASbGncv5rF0SM2MHsJjuKlBHWteDlXVOIfB0TYNB8OLl+xC3nMSjp7lvjS4KzDO4n/0
	oqflXKPG+QRaWkb+075kNvX5AfHPkCrcNsttyOzvuIzzflaX1D7enKV3eajLRRm5K6ANCdtRbkN
	RMMnag4zmfeUW1hopDgy3wn+a2xUHh6waxmICKq3XT7k3C5X7PzhFMSEGUNQa2eC5LTmiNb5pGa
	l5Gj5/yem/3fPZA8QNN1IqAGaGSI3OJyWGvDBPPG/C0a6S9zaGmdo4edjTvtO36mjbo+MsiVte8
	27miQ8X4
X-Google-Smtp-Source: AGHT+IEObKpEn2IXGE5elfd1IjkU00GQGmFnrEcMXX4gngYVYTAaxTnLD0yHXcRDG4uysFv7rkTH1Q==
X-Received: by 2002:a05:6000:2cf:b0:38d:dcc4:1dcb with SMTP id ffacd0b85a97d-38ddcc41f13mr3724665f8f.2.1739184724887;
        Mon, 10 Feb 2025 02:52:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/8] gpiolib: sanitize return values of callbacks
Date: Mon, 10 Feb 2025 11:51:54 +0100
Message-Id: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEraqWcC/x3MQQqAIBBA0avErBtIyYKuEi0kRxsIFSciiu6et
 HyL/x8QKkwCU/NAoZOFU6xQbQPrZmMgZFcNutO90kpjyJxQbOSDb8JCx2l3QW98T50bvBkd1DY
 X8nz933l53w8f7BbNZwAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BRWGzZuvtmwXMmkURqAYnIS2QtQklPosFB7K+YfF4t0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpSztjr3HpEnbCi39CQSGhQ1X8sw0XA8NyPo
 gMP67Cl5q+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUgAKCRARpy6gFHHX
 cqFHEAC+U/HsgiKk06+qg43gmHNzU3lYq0XOFpDxCwsFvKNhi6QP3wHzV746Tq/Fg2zRCy+yQ8i
 fiHgJtd+E9ftUH8EbQ/CGUhP1NkYIUFcYWvmru5oqORunt/4A2dqZGRzjPQYb2psa+e0SQ+tiJj
 Qzmh/GAcK6NA0Drk+KmByaOb9kLPvS4NaQaKxRssW+6LhOf5SW/5Zd8LNfhMzVeq4s4/2jppEhg
 mG559jXOeoA2Au/mlSfm1gmXGLxlDh55eFmnKLGiIHBSo5D4WKzCiT06Qix4kXxSY60LPzG1DMX
 NhkBFmk35VYgGjNE6LxnpyZ14ETLFu+KpCgU5EOHt4N5F0WOL2JV3LMmyTKCRvsQlJQIJm6j4bf
 3aXpy6V1sIffmZrKuutdToomjBBCmOZQo3UIk6jgxriyv10uIFYhlPmA7bM2YC6D+nlQm0tUP6m
 6tirZtGWkppsav5yYdQvtZirbDrMulj84xwxBJ5GWjaph7/fOP6ojk+gwIySG1V6AJr6MudWi1O
 XSjN5p0sucTbZLVwsfmvmYhgi1XGO1VLKC44UNOz8xqH+CdiBPf0PUHZKyTkiVyus7Dd36Caqmc
 N2S7InL1ae3aD4DUgnw4FUV729Kyn7YMbFR8NWgkHHaI6qpE39xF0rMJdSiYoK8/Q6cyUJyE4vl
 3G94wfYUyeE5cdQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

We've had instances of drivers returning invalid values from gpio_chip
calbacks. In several cases these return values would be propagated to
user-space and confuse programs that only expect 0 or negative errnos
from ioctl()s. Let's sanitize the return values of callbacks and make
sure we don't allow anyone see invalid ones.

The first patch checks the return values of get_direction() in kernel
where needed and is a backportable fix.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (8):
      gpiolib: check the return value of gpio_chip::get_direction()
      gpiolib: sanitize the return value of gpio_chip::request()
      gpiolib: sanitize the return value of gpio_chip::set_config()
      gpiolib: sanitize the return value of gpio_chip::get()
      gpiolib: sanitize the return value of gpio_chip::get_multiple()
      gpiolib: sanitize the return value of gpio_chip::direction_output()
      gpiolib: sanitize the return value of gpio_chip::direction_input()
      gpiolib: sanitize the return value of gpio_chip::get_direction()

 drivers/gpio/gpiolib.c      | 144 +++++++++++++++++++++++++++++++++++---------
 include/linux/gpio/driver.h |   6 +-
 2 files changed, 120 insertions(+), 30 deletions(-)
---
base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
change-id: 20241212-gpio-sanitize-retvals-f5f4e0d6f57d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


