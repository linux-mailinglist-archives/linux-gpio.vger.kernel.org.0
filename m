Return-Path: <linux-gpio+bounces-11503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E59A1CCB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 10:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458A61C27229
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 08:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C7A1D4166;
	Thu, 17 Oct 2024 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G8g1w61d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3DF1D278C
	for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152870; cv=none; b=CG6/wAoEkCnsXRn2xQsdUtTfBrO9uzBtQ5845uD5v+BzEPLa42fmolIkgJa37bpBgj2tnfJyHfGPiU+mJbh399bq2vuwjZpTMb1OILXcoGWmNzRoUeVQ2dnuT2t9fTakwsK4Ixbc7OKb+vPRe2nSmPhzgbsn4N1xwI3YZo00Pq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152870; c=relaxed/simple;
	bh=tm4QHzysL2TiIfs4oeig99xu1ZT1qQC/ko8S30aT6Ec=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ePIUOoUkOrmipfUUKeXpBo0YY8B/Om5NbT0L3O6k6ExB1ptErUBrhjtUXG6+bAEyTxeNVEsTt7xISfFCW2MMHp7MBZ24rmHEZeGwLNYcEOQFq/R7zR4WvQsSg8Y9iyLEYSzCboPjGCY1DNXBOq73enVK2TvEag85EZ4gfhuWRsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G8g1w61d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314b316495so6665755e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2024 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729152864; x=1729757664; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cj48koZlMSApJIGSYZcEfmwOCNnY3YOu/mDJqzsshJk=;
        b=G8g1w61drCMlyZPXOO0NgU2eU66ziv21GYEg5AjJ2pUUsmdsOeL+sjqZAeCpERdsau
         4tnBrZU7f9cNSJfLjdNTabwJfRGxllhGPOBjXcKcy1E2RzEopp8PilI5h1CKN7INmiS/
         D2zTgD6z7z+Jbyd8WlfUe5nas+szFFraNmhSbLqB487UWEwwDXCeQ6QhGq0VnPSC9Pzd
         tSrXEelAdR8FGC5+c6qAGQ28ZuxkaaQocL7c9OgDlilYuNVwLYRcupTJu6p2jmpj4OPv
         aMvfUH4/s+CjLw2Ql8kEKcnaOEJV+PmTX1bhdf90Srfsg2NBW8WBJDJ2NsfTnOAMR9CW
         /5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152864; x=1729757664;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cj48koZlMSApJIGSYZcEfmwOCNnY3YOu/mDJqzsshJk=;
        b=hbXmn/kycLAxxEfvVPZkCIHB6vHEiyueR6RTSlu7+qKVAyGvmkEtUVTkmdRBmTGglY
         nPaYftg7Y4eVtS33zIo/kHuuU14lGB0df0CpYKbfPLvv78AvTWvkrcPCLl3sZyaAzwd/
         pdpzWYNl97mk9XgxL1DeHt2LKHtZY+oQ+tZD7lDpfjsiBpEuKIgm2bI8ScjX8XYM/R/r
         F4A93PwmYAVc/+NC5ValaBOmiws8JKNbrYq8juqCEAV8zo1PCjqXcv0LGwShCg7gDdu3
         hUdcv0+DyFsobwCWsxjvjt+woMSWwE4rZwjQYtZBKim3yukDEy4KppEL+3XQXtP/nBKh
         L0+A==
X-Gm-Message-State: AOJu0YwfA1MZSa+koB728L3varPbd0qd4x3AzCj167gu1h8rmgIi69cY
	uYLjPm7lbxrXwDDTRWzYBrsxLJOLWcPn7gSdMgl+pBZkkKKqmkHjzUc5WUSDTv8=
X-Google-Smtp-Source: AGHT+IGW2SfRbHlFWfxGBvd2lcyYKnZ3Qg0lT19KdZUXPefUiJYsw4/hFET2as2BS5SZx0CutyiRzQ==
X-Received: by 2002:a05:600c:3b05:b0:42c:bc03:e765 with SMTP id 5b1f17b1804b1-4311defac9fmr200076665e9.16.1729152863668;
        Thu, 17 Oct 2024 01:14:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3831:fc61:16eb:d0df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61ae2sm17855695e9.46.2024.10.17.01.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:14:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 0/8] gpio: notify user-space about config changes in the
 kernel
Date: Thu, 17 Oct 2024 10:14:08 +0200
Message-Id: <20241017-gpio-notify-in-kernel-events-v4-0-64bc05f3be0c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHHEGcC/4XNMY7CMBCF4asg1ztoxrE3MRX3QBTZZBxGi2xkR
 xYI5e5rUoG2SPm/4ntPlTkJZ3XYPVXiIlliqGG+dmq49GFikLG20qgNOm1gukmEEGfxD5AAv5w
 CX4ELhzkDtsPoSJNtuFOVuCX2cl/507n2RfIc02N9K/RaV5gQN+BCgND1g3ZMozeej1cJfYr7m
 Cb1kot+0wg3NF21H/uNhsi3g3X/tOZdsxtaUzXHo0fbodYtfWjLsvwBDYZAKGUBAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3112;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=tm4QHzysL2TiIfs4oeig99xu1ZT1qQC/ko8S30aT6Ec=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnEMdXC65WCzeOKB6Cn1M8a/1zwIVVzn9jY6d7Z
 FUlxyQwbx2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxDHVwAKCRARpy6gFHHX
 ctamD/4mF/ka7n492nEj0P8wHZnhRRPgGcQ30hdQA46Sc7IE2N0NgS3HA/tmV8c8a/b+0IgLClG
 xAa2Hcq3gwkhBMVQU63RSq3tkhKrYiFXGNXvfPjgZEqRUG3Fg1XXAmDHoz+vN+OPZHrkUGjXUtG
 XFUr3sA6xnj8kfAQpiJM5DT1SHLcTa2WoWeSptHxDXIVOGj1H/fadvRBKWnAz9PtRC6Vk9cBHyZ
 da5cuD3fi67gI5Brtd6bBzFVAT9s3O7yfmiHYtg/TU/6B7tfoVf/HHc1q38K0LtCjKeWVjDmnef
 /Rk64q5t8wFE8qaTVE5K2nr9z2dT3jjB3/UnNict+C6HjpJSjOLqgYOgb35cayWod+9CEEk3WvV
 Lz97XL2qo+OErlhw1J/f47hkzhObZ9GC4b1XwcKNT0W9nRMUO12zgRJbJvnGT7kT4eJdzIysR4s
 KS0XLbCQUfFqOZH1BdTXqo0DSCDRyZM08sJKIsYlgygGCp8EYJZI8sQD36XsK7WQClapEavz4Hy
 96D9OiKW+3nfdRJFA+bwMFjXsFAD8Vv41mtKVJq8RA+QlEJPcGS5fDbPB/aZrsbi+OFiYXFKj9R
 Ka2EoNXvfsNBQzpXw+wxzlFETS62RuP1YuGX+8+at7EIymk23ilpZiieN0B3sKIyOyTEbgxMHfr
 MBEUklMngI+KSwQ==
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

 drivers/gpio/gpiolib-cdev.c | 297 ++++++++++++++++++--------------------------
 drivers/gpio/gpiolib.c      | 130 ++++++++++++++-----
 drivers/gpio/gpiolib.h      |  14 ++-
 3 files changed, 239 insertions(+), 202 deletions(-)
---
base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
change-id: 20240924-gpio-notify-in-kernel-events-07cd912153e8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


