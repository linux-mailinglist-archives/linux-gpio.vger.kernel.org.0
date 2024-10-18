Return-Path: <linux-gpio+bounces-11606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE49A397E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C92281ADF
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13922190054;
	Fri, 18 Oct 2024 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JsMahc8b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A718C92E
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242624; cv=none; b=IJCJC00GS/+PxQjANd3vdgGJPFgIvcjgruplmFXxkIBvJ6/AstOdPr7WDQ1bw+0Zx08qm7XuHNfEHEVTyZoyIfPu2zZPZljMoRd/GI2Z3+G0i/TrFFYOaRs0v5t31D3RjK0T510RfeKihUmv6K6JZ7FoR5y4aSgLIkMl39Vk6Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242624; c=relaxed/simple;
	bh=AcXDK52JnPC5xJMOFzpq0d2Won7phBSA6JlzjNtC1Xs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AXdBPVO4asFNzh8iH7IpyOatdzyLXmFKM9X04s2N2LbIot8tqOa8pbkJYGkHteMCqd/RjwmlZECHzd3UcONkx2tiJmXtVDnhku9tcMhNCBTXUm8PC3p1YktRUYKbE5pbZXaX2C6WV35WKh9R+9R1tHHgguGSnuHibqarHHgdG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JsMahc8b; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb58980711so22507621fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729242621; x=1729847421; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZeEZUKq+qIqtQz6nd6VZ+0h6dSKzhfxG56gJP1EyuU=;
        b=JsMahc8b8spI/ehkEElRrAM4plyb5ux02mzCGFnOkCDFNWkr5o9beOCcqf0ncxnn8u
         AluDanK/4biVM+UkA5QV70dihibWAeNA58tnblMzDxiv/K0y+sD8nWuBdTXBXLmTSoUO
         Bs8TBm6XlumhGWPAjlY0lOHoAiwq0+nnsHBp4mayhIVxfxXt7gg8nYQ5sgHrLWi4Wo7S
         kPkXcZ89aTFWX4Z7dkQtjalC5SKCfyXv+5s3AxhjGwzl1FAv0w244OiuLqaP7X2t29AA
         rC3m/pV+9yl/UCJcVlY69f1JIGR8VonIgcwzXWRgiMJ7Av81QnajJ3Q9rZMYp6aFAceV
         R4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242621; x=1729847421;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZeEZUKq+qIqtQz6nd6VZ+0h6dSKzhfxG56gJP1EyuU=;
        b=n+fAv0+cp+iYUltrp5xaAbOj5Rf+ecjBtMzm0cgbeYZdbn9hF+fQtAEwnPdbKORwEe
         dmjJvEodczennFh7XDfBsSH3wdbHdaIOcSs6RsfAkYau+glJ9ZqHxEJljBMrh0xfoRN5
         5zQh+3Cwaj9V4CR9uasppwD9gO46rH4T5oKUJKLsYyVfL6lOnEbzjKAUMZUPvlXLGOkq
         Q+LmOtBXEu5KT1h6UpZc5lR8H95HR4WJgzozVaVhspSXetxYiarGUIb6DsEgoBjAsBzL
         gxIm53pHrF76t0kbpy72CJSQZV3Sw4YpUofbQYthhnlseB439mtSKMQS2wvdPt7XG7CQ
         pYrg==
X-Gm-Message-State: AOJu0YxvmkaeMioEslpMH56W0YMVju6L9jCRi0bj/gwa+urBTapOjiDA
	AIA6vtK1o5Df8IlGcweH6TbKcKyrLLyqX+aIgIaqAn12wCNv1jClcd6ZLEsucvyaTRrqBfIlYEH
	V
X-Google-Smtp-Source: AGHT+IH77jdEGYdT8xGK1gUaD7Az0JyK5YSSPJ3wEUYFWxfqF3HRb+Yz7f/UzrxhVAir553ksubjGA==
X-Received: by 2002:a05:6512:3b8c:b0:539:fd1b:baf5 with SMTP id 2adb3069b0e04-53a15445006mr1252092e87.16.1729242620463;
        Fri, 18 Oct 2024 02:10:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:45a3:93e:5196:d8ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dbe76bsm18700455e9.10.2024.10.18.02.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:10:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 0/8] gpio: notify user-space about config changes in the
 kernel
Date: Fri, 18 Oct 2024 11:10:08 +0200
Message-Id: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPElEmcC/4XNQW7DIBCF4atErEs1gyE2WeUeVRc2HpxRI7DAQ
 o0i373EK1dZePm/xfeeIlNiyuJyeopEhTPHUMN8nIS79WEiyWNtoUBpsErLaeYoQ1zYPyQH+UM
 p0F1SobBkCa0bLSo0DXWiEnMiz78b//Vd+8Z5iemxvRV8rRuMAAdwQQmy652yhKPXnq53Dn2Kn
 zFN4iUXtdMQDjRVtcGcQSP61hn7pjV7zRxoTdUsjR5MB0q1+KbpvdYeaLpqZz04ML4ZCNw/bV3
 XP29FKjmzAQAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AcXDK52JnPC5xJMOFzpq0d2Won7phBSA6JlzjNtC1Xs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEiX2rx6PRojg2II1TJJ+ucySZL3StNWoUKew8
 LFaDG55TXWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxIl9gAKCRARpy6gFHHX
 cg5CEAC1EBPJl2jbK5+WHFKfHNL/l+n6U6LicFkK3JooheWS/34o/Rlrv/jlWR8T9cJADgpQUc/
 8l4j3KbrWuMBrZLV++TgS25jqILopdr43NRSaojaguht/F2E7QgT7oCyi663c5VpFsZRArFWKX1
 6nbYkcvGofr+6eoc9mZKBq1dvBaF+kZcmamXoX+uN3TBH+CNmjq/KhlNGIwGR9Ol8bOj1MWOQVn
 obOAGdsUBvD24qqMLofMSGwoLoooRW1RTagGdSOIb3OBqTICE55oWbgPikD+U5ZpX8omFjr11Bm
 Lmwqcq6VPYs5SXegISAzfLs8dTiIAGfR2VGI7Rmb9w4xc7nZGLvngGKvTLtQc97hRzbf/O4+EFg
 DUG7eVsnPTZ01Nd2MtfcE3s8xqfQcTgNpv3QwIxIprTZTfX1kkbb1Q1dzYMSxvl6ZtSfSacjoFt
 xt8/4xU4oNLWQjHQnADI8fKNuvrtjKgO6cyTs/uHTsYUJWF8/7ulcJs9R2CvmnDjz8nsdysX1iz
 DhYpaiLv1I5mrX0Xj7bltLmqxZw0M/yN9JR9612HVpTtrPMPnHJy8Man+xX5B8dRRsp0ffcc4el
 gcF92UFyL4h2pXg95JevQw+1d5SgBT5XaP1ENFbqbndofz2nZxQAsgeOAPrwn/d/7PVljAaj11y
 9PKGw6e5X2ylBoQ==
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
Changes in v5:
- only notify user-space about changed config AFTER the edge detector
  was updated (to that end keep the explicit notification and use the
  nonotify variants of direction setters)
- for consistency do the same for v1
- Link to v4: https://lore.kernel.org/r/20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org

Changes in v4:
- don't emit additional events when emulating open-source or open-drain
  from gpiod_direction_output(), to that end use the nonotify variants
  of gpiod_direction_input()
- store current debounce period in the GPIO line descriptor and remove
  the entire supinfo infrastructure from gpiolib-cdev.c
- fix all (hopefully) corner-cases where two reconfigure or
  requested/reconfigured events could be emitted for a single logical
  event
- emit the reconfigure event from gpio_set_debounce_timeout()
- add a patch refactoring gpio_do_set_config()
- Link to v3: https://lore.kernel.org/r/20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org

Changes in v3:
- don't reach into pinctrl if the USED flag is already set
- reword the comment from patch 5 and move it one patch back
- don't abandon emitting the event if the GPIO chip is gone by the time
  the work is executed, just don't reach into pinctrl and return
  whatever data we already had
- Link to v2: https://lore.kernel.org/r/20241010-gpio-notify-in-kernel-events-v2-0-b560411f7c59@linaro.org

Changes in v2:
- put all line-info events emitting on a workqueue to allow queueing
  them from atomic context
- switch the notifier type used for emitting info events to atomic
- add a patch notifying user-space about drivers requesting their own
  descs
- drop patches that were picked up
- Link to v1: https://lore.kernel.org/r/20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org

---
Bartosz Golaszewski (8):
      gpiolib: notify user-space when a driver requests its own desc
      gpiolib: unduplicate chip guard in set_config path
      gpio: cdev: go back to storing debounce period in the GPIO descriptor
      gpio: cdev: prepare gpio_desc_to_lineinfo() for being called from atomic
      gpiolib: add a per-gpio_device line state notification workqueue
      gpio: cdev: put emitting the line state events on a workqueue
      gpiolib: switch the line state notifier to atomic
      gpiolib: notify user-space about in-kernel line state changes

 drivers/gpio/gpiolib-cdev.c | 301 +++++++++++++++++++-------------------------
 drivers/gpio/gpiolib.c      | 130 ++++++++++++++-----
 drivers/gpio/gpiolib.h      |  14 ++-
 3 files changed, 243 insertions(+), 202 deletions(-)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20240924-gpio-notify-in-kernel-events-07cd912153e8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


