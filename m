Return-Path: <linux-gpio+bounces-11131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AF9981B6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21547B296BD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503301A264C;
	Thu, 10 Oct 2024 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SSvtHdQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24191A0B0D
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551437; cv=none; b=D1++K6pSS9GlMYnUYIUxHv+QCh7i3QCNRgF5ow5EiZRmCr1D7mIoYr0Cqefiqmkq5roZrg5xUVeB5qNzbJDLZl2aeHwo0gRXxhXH0ISP8gI4jwFM+di8qHYKFt8rr40uZ4Y9l9gSwkzYQK9SRWIe4b63TDQeg8soHVj4GIddh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551437; c=relaxed/simple;
	bh=udk9y/O8V02u/vCjHKVVxLkTtQRErg2Z8TgeAW54YtE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WA7q5X8Zf0DW+MN7lJYOBkgIMMWorZugqTBrFafmMar+5C794LN1G4g/XRFkNbwHJfq5IFrAaclDeYjgkDf9eThW8Gbz0Sw/C5GnK766dVX+xvL4XQFe7C9v7ekoLmAZ07NWvW3zS37A3bda87mWJmnsfPBnml5cVPPNFnf+5eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SSvtHdQT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43117ed8adbso4297585e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728551432; x=1729156232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTZy4wu7THoYqheJxll/SRxwuoHsbsskuawnum59xEs=;
        b=SSvtHdQTLAai2H1vUvjooxXvKPhLLC1eiGqjNsj8DO+i39R/tTxROdU5LSYUflUD6i
         iE7x6gGiqp73uCv7dcih3c7M0udcs1Ko26cAxDWqOsLh/GtsvFdt3PgCK3vWviKQ9Vcl
         P68uSDKt6Zl8JnHKmIbHtMisbr82YDZf6NjWdh7J0cuiMdUZ0MsL6zXTXpMl7HGpkV7J
         FSigWMXUtSspti3ZvCUf7oO2JkGJHEISWFXv4EVffmbnV96FjZvcHvcM9lGm5BJuYTv9
         n5pyMyhPHffbL3k5weagBnMHpCY4WbOWsixdpGGNKJ2Tsq1HQyXS/Pjj4FppYsQdK0qw
         0wiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728551432; x=1729156232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTZy4wu7THoYqheJxll/SRxwuoHsbsskuawnum59xEs=;
        b=rjjo5KqZCKmUGrAGh4OhjwQkavu9BHooeqJ1yRxpBJ4iNBd6Iev5Wg5nX8xO+rP7ZE
         t+36EmLX3hAeCtilrcQoqPkDHf2fhaehJm2d4psqQ+xBZNlf88fzSm0RqRUcWNIIFVZp
         UcgoOczBGMqwIKmf49/n0V71FdaZqauHHadKKKeVh5XJA4c6oIKznV6KYz4hRgluQ1eE
         8ZWSytiCgJ+uZJJ0GS6ugX7AFSBg3iQm2ffHhvTPPR5wPgpg1rmIqsS53DPoRKLx101p
         JrKXkpWoN1Ec/YasXbaIFDXcMJsKPVmeO285azSdykhnULkvTPIwHVkDWTLskwzL7UM9
         Wwlw==
X-Gm-Message-State: AOJu0YxelMl17/vQaetyknHQdpy1Dcq1YszDI9Pczf3lC39rek2Mqn+i
	ntJa+SbFta/jWINoJ4gS5wgaEqRpugbJK9kC1ePWwkhzLOuTLHxC5WodbsduUVtGXVMQ2wVPlH4
	F
X-Google-Smtp-Source: AGHT+IGYR1TmjfARCuic2apkZ85FkFzCbDKq6kY5yiqHSOUJwSw7Pfvnk1rj4Pks14M1aEdpnlmkIA==
X-Received: by 2002:a05:600c:3b0d:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-430d748c6fdmr59762215e9.29.1728551432638;
        Thu, 10 Oct 2024 02:10:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5e5d:bfca:20cc:60ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff785sm9913305e9.13.2024.10.10.02.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:10:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/6] gpio: notify user-space about config changes in the
 kernel
Date: Thu, 10 Oct 2024 11:10:21 +0200
Message-Id: <20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6ZB2cC/4XNQQ6CMBCF4auQWTumrRjBFfcwLAhMYSKZkilpJ
 IS7W7mAy/8tvrdDJGWK8Cx2UEocOUgOdymgnzoZCXnIDc640tSuxHHhgBJW9huy4JtUaEZKJGt
 E8+iH2jp7v1EFmViUPH9O/tXmnjiuQbfzLdnfesLWmD9wsmiw6npXkx186amZWToN16AjtMdxf
 AGMItrgyQAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=udk9y/O8V02u/vCjHKVVxLkTtQRErg2Z8TgeAW54YtE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnB5oCANeial/2/ppQ8Kb2nEGg+TV5wnsxl4y7C
 qKlPpOUtSOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZweaAgAKCRARpy6gFHHX
 cgmCEAC2P0vpQUdaQ4dvkd2DAbxRNH3qEx1gA14cd099PIziYBMX36S6nt5EGeAIVfeU+Z2Fl/i
 PJeYXtd4NDNBkOm2xe1muBzm2Yag6jZA4zpHB0P/7Tgnjv7I4rquuYtnlgJfJJ+6MarN3jqUuhG
 5F2fUCmzUmLYTFYK3bRFxaGZyNR2cTQByvcre+q+JHkVOxk0vA+Y6aYs2NTqdud54TmdS8Mpkkh
 WkCwKwi2REng5PyDnnGqCnehXOiAYFzPrCIfpFeZQiLEue2IvmWoURiwi7CrQqMRNFyPI/IyLNq
 AIvrfI36z9ZaJPbpIPkF9N+2tAES+S2YXHjjlKhedzP9gyrhQJr2PvvWqWuBLL/34omusM2oDsP
 0hf+CqMNeEznaNcu0pzsw7aI6G3jBFUW4wy91RzNTLlahxFYRaZInuOG7EEN861i4sDKLhfhlZW
 6NOs8oj4fwA+j7UeJ6nq7Zbon+mT9hxEEHA5FjglhymYMNIjNdNvholFlEhQx6Lt5lPEff4Fovs
 sfiZUIcoAAhSH5NzwlPI/6EzzFl1UT/ou62NNRP7BssRq/3IpHGhOu5x/Y4cGDe5KzZYHKVBW2C
 i6n3aPJWdyV5HuN+M7zDj5EhJrVMKhhGMG9w5YMYdtt2uh7Q815nzOriMISOSSiOrs3EyXEMUZY
 UsVw446c26plpmA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

We currently only emit events on changed line config to user-space on
changes made from user-space. Users have no way of getting notified
about in-kernel changes. This series improves the situation and also
contains a couple other related improvements.

This is a reworked approach which gets and stores as much info (all of
it actually, except for the pinctrl state) the moment the event occurrs
but moves the actual queueing of the event on the kfifo to a dedicated
high-priority, ordered workqueue.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- put all line-info events emitting on a workqueue to allow queueing
  them from atomic context
- switch the notifier type used for emitting info events to atomic
- add a patch notifying user-space about drivers requesting their own
  descs
- drop patches that were picked up
- Link to v1: https://lore.kernel.org/r/20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org

---
Bartosz Golaszewski (6):
      gpiolib: notify user-space when a driver requests its own desc
      gpio: cdev: prepare gpio_desc_to_lineinfo() for being called from atomic
      gpiolib: add a per-gpio_device line state notification workqueue
      gpio: cdev: put emitting the line state events on a workqueue
      gpiolib: switch the line state notifier to atomic
      gpiolib: notify user-space about in-kernel line state changes

 drivers/gpio/gpiolib-cdev.c | 126 +++++++++++++++++++++++++++++++++-----------
 drivers/gpio/gpiolib.c      |  79 +++++++++++++++++++++++----
 drivers/gpio/gpiolib.h      |   8 ++-
 3 files changed, 171 insertions(+), 42 deletions(-)
---
base-commit: b7adfb6076ff0c1ebbde56d1903daa3d07db92c5
change-id: 20240924-gpio-notify-in-kernel-events-07cd912153e8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


