Return-Path: <linux-gpio+bounces-11353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640E99E4C1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 12:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D07C7B23B9E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9ED1E378C;
	Tue, 15 Oct 2024 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pnK6HnFv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2A1E6DCD
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989796; cv=none; b=BCS03+g2YU8h2zFuEqyaNQwwmWdPUoYbpJvn8Ah3c/BkH4EBt+1WCbnHxgjFgDFT/bEXz7Smr2G5tWvUu14Ro9V2kvefu9IsILB/YITguEI/Pw9Ekvm6GSFw9CGTf80Cm7IMx5aWFLvKCuWfim8rYSZmLjCs8n7ihcMbMRmsihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989796; c=relaxed/simple;
	bh=4Bsvwmqq0WjjdqNzlBEgAYEHSuoKEz5gm23FepVkvmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHrB3Rz2/rDc0qZE8YTHlXOMt/nN9XBATdTEtd8SWkxi2Xkrd8JP3z3uiCjNXEkOAOeBhg143uwGdXgFyIry5/8Yy9Quwjura4/DoWfvsdOuxv4a5IyEel5l0oy/GEFWjIH1Gb1nC2ddpUVVEXIGPC8TKbpKYGGNMOIUpgy9rkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pnK6HnFv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso3633748f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728989792; x=1729594592; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ec2bUapoj79RNmiOev4bGC58j52LzkNK84ZlsQIKGC8=;
        b=pnK6HnFvUE9YayQVSPJgdpvTbY4O6bC/zCNIIbdpxJNA0Tp9wi20jlx11w+/0S2OpV
         DJKReaReAe6V5+dL8WTO5J45Yt6vRbPKr4QrYW2J3KqZbgAFMd0udtAB8ZZs3SfWCl5s
         NNI032++T4lRoTA9Y3xmPeP38jRk5nvFfduD2rCNYZcoMkansTpZbEZjnjPQSIs41mJd
         aLy8o41JncvE1yerYEOYcKRgBeRaD69WliCK0vzLcTzlWzUzqlk/ypCm+m0Hmh6RxIFQ
         Jsy/cOlTqE/PYywIwNWWs0dRtklXHap+IwnN0c8NDFhnjlK6rsu2Ul/6glDlOhbse8l0
         xmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728989792; x=1729594592;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ec2bUapoj79RNmiOev4bGC58j52LzkNK84ZlsQIKGC8=;
        b=tz1kU5OcrTuapTVOTCAztKj5tcBrYh/cN2YQMETaskRRKv/xXOhzUD4Cb9g58B/Eea
         kbSLXCWSsyXpqI2eMnxFMStfGcF3D+I7PbXNSRoKRjOqaglMbDO+shiWl1YsBK9/+a/9
         t7TuFVjSoT0oFLYsYILbkDSsOHZT9Zi8E9Z8rcGp78o/t7RHqgulwIqnW951q13Ech4K
         fuNU6T4m5giyqFzY0wmRxFVFWagOQJdwK2qcAH8ZCA5iph+gS9Mlx98mTQfaxJJfrPZ2
         bzc+Gc/8j56M7h6r4vrSBppgvMj2bE1XClTqQXEJXjI+zLEcrEwM8DC/mzTP7AeZlY9G
         BqkA==
X-Gm-Message-State: AOJu0Yywkd7hJ3jwxmyulsfMGAVQMJ65MFBRYzG9n3aOo11QdKXv8+1T
	pbD1LCHt8Qh7XUju0wm6R1pJDJ4RI0PU8dZI+EoNwaJdZAgtoXbDVKSOFoDeQ6o=
X-Google-Smtp-Source: AGHT+IHlk3tBk+7IzFn3w5fq6X6HsWlt+Z0Dspng2cX9oA7IUBFQ8qOQiO+q6FaHycqaan9/bqzRyg==
X-Received: by 2002:adf:ea45:0:b0:37d:4cef:538e with SMTP id ffacd0b85a97d-37d552d29edmr9617409f8f.55.1728989792164;
        Tue, 15 Oct 2024 03:56:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d382:b11b:c441:d747])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc403d3sm1254115f8f.101.2024.10.15.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:56:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/6] gpio: notify user-space about config changes in the
 kernel
Date: Tue, 15 Oct 2024 12:56:12 +0200
Message-Id: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAExKDmcC/4XNQQ6CMBCF4auYrh3TKSDgynsYF1imMJG0pCWNh
 HB3Cytdsfzf4nuLCOSZgridFuEpcmBnU2Tnk9B9YzsCblMLJVUua5VDN7ID6yY2M7CFN3lLA1A
 kOwWQpW5rVFhkVIlEjJ4Mf3b+8Uzdc5icn/e3iNu6wyjlARwRJFSNVjVha3JD94Ft493F+U5sc
 lQ/GsoDTSXtVVxljmhKXdR/2rquX7UEeQ0XAQAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4Bsvwmqq0WjjdqNzlBEgAYEHSuoKEz5gm23FepVkvmw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnDkpWzA8DC/BFJbdFDnVI8cDlEyYxjkt3Y6PW3
 TNeREBn6Y+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZw5KVgAKCRARpy6gFHHX
 ctyGD/sH2AFbqZkz1SQLkohCW1h6tpAZwkpixjEnXKJrRruz2td5kBTfwILwC3ubmQqcsdR/rEG
 ulRMBxIRPdqb7YJkf34dgvwPG0Oo80S9t4dAfx50xWkkcETloKiEyIgAL96Dua/0ejOhjfUN7xO
 Z8aaB7zo2X3MAHbwlfF20fzCnPLWWRQ/fkYikb0zOwvCkJK2LR8T9zIW/fwyOJRMdAXbt3rhnv8
 Ey1j2+lWiQ3eMBph/eZNpXGlJBwI2PVY2eMyRXxq83wFxUWe6ExYbsWyhQcugJ9JKg3xYg5eF+z
 fnW14WghIBF2E8C4YS87Npym6dd4et3qCrnLBQJYW7g48JMTEXGSrVUsSK03sZDhNb60nnoPAxK
 mzWGnOk2SaCEx1q38NpfchtsB3sogT+W4e2Df8cYZk/m3Mw7EuIejnAdvMD90owWKfOjquiebxH
 NvvnuHMYEfa9tYJuDlkPesLzhRds+2nkJXpNzT1eIfw/hixQqnemRTchd7K48Ejzoy+dTlvdDll
 RtoCW1pZYWFH4rYcBSA490QelZQ0Jgp+m07JrNadVKJqtlVgVWf888QdYJY5/u6qBQ4aHDIKvJR
 PR5Kocp88XflFQCA9D2yTM7ueppYwsXZvuhVByJzUnzyhW5h+6nCkp0uu1ENPNHOcTES9RC3L7R
 y7qIi1mm0K/nWTA==
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
Bartosz Golaszewski (6):
      gpiolib: notify user-space when a driver requests its own desc
      gpio: cdev: prepare gpio_desc_to_lineinfo() for being called from atomic
      gpiolib: add a per-gpio_device line state notification workqueue
      gpio: cdev: put emitting the line state events on a workqueue
      gpiolib: switch the line state notifier to atomic
      gpiolib: notify user-space about in-kernel line state changes

 drivers/gpio/gpiolib-cdev.c | 127 +++++++++++++++++++++++++++++++++-----------
 drivers/gpio/gpiolib.c      |  79 +++++++++++++++++++++++----
 drivers/gpio/gpiolib.h      |   8 ++-
 3 files changed, 172 insertions(+), 42 deletions(-)
---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20240924-gpio-notify-in-kernel-events-07cd912153e8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


