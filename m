Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 787F8112F1A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 16:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbfLDP7S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 10:59:18 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39097 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfLDP7S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:18 -0500
Received: by mail-wm1-f68.google.com with SMTP id s14so274504wmh.4
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gcnVUdR29UxwFfF+4peEvbJCZXVfquVpbSzjGOYyB/k=;
        b=UAi+kAvzNZUpXADzXjfUk7rcpjuV/aD1lCp03zOGH9LgLUmZ7/LbHlRp/6d9czpLmJ
         Kv3cPU87viUWR2hpwwi8eYPFTl3PKXjBZ1v3J81LFege/Gf4MtqHLa14KTf3qOEBAKVi
         g3f6RYLR5UOuFxYbLWtYCgsccZsXwUOvKd/V7ByX+jHEnw5/HOWklHiWKeiuIk+4PFXg
         VeYZamORZOtN0iOq8Eu7ubLrhPxqjMWgYOocEe8gtCnco1vBlhmDbpO9oBhRlKTYD8PD
         pwXCY3bNvAkwtM/9ETOdsWdEB83FzEV+a/EXND4XtOVc4Bryvr4rj6085cwrVYshnCzi
         jRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gcnVUdR29UxwFfF+4peEvbJCZXVfquVpbSzjGOYyB/k=;
        b=I9hNFmNelmi1UBwIUqdCDyLoHd6GdVWJQVuwQhylMgeY/p2QcYj/JKyB6bxheKGofQ
         PWsWJSXe/qYP7EJTRkrgpyt22qqU9ZdOD28QZdxKfRFKob9O8UkNeQTZkfY42KMUoxb6
         rwHBhqLX4Gg2ytE82TMFbNtkqntvssjGnw/TtonPa5jUm864E81y1rDxwgLj4MsFGKQN
         CYGPozlmpKYJy6oq7dN2biq2vVhR3oaXsKE+CZndNpLaM/co7ClbiToTCNuSQkv2JpTH
         rmjBS5K/f93H0ykQHA7fSl+ZVd1jNJF/+6kKFCqViYA7CbZnqUywJ4LlsHXOq+z9GrG3
         Y7xg==
X-Gm-Message-State: APjAAAVa8WhGt8Ud6DOxfcE5NnO6I9mLC7rxyE7F1uYAM5K872Ybmh/g
        tJU6VBwwRtuEzJlwwKfy7KX1FQ==
X-Google-Smtp-Source: APXvYqzzsN13FsCBZ3Ye6wWBQjJCUsWc1ne2GPnkOQarVzbskWk3iFCXxPFVYGB07mj+tp3tYNmL8Q==
X-Received: by 2002:a1c:4d03:: with SMTP id o3mr201872wmh.164.1575475156340;
        Wed, 04 Dec 2019 07:59:16 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 00/11] gpiolib: add an ioctl() for monitoring line status changes
Date:   Wed,  4 Dec 2019 16:59:03 +0100
Message-Id: <20191204155912.17590-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

When discussing the recent user-space changes with Kent and while working
on dbus API for libgpiod I noticed that we really don't have any way of
keeping the line info synchronized between the kernel and user-space
processes. We can of course periodically re-read the line information or
even do it every time we want to read a property but this isn't optimal.

This series adds a new ioctl() that allows user-space to set up a watch on
the GPIO chardev file-descriptor which can then be polled for events
emitted by the kernel when the line is requested, released or its status
changed. This of course doesn't require the line to be requested. Multiple
user-space processes can watch the same lines.

The first couple patches just fix some issues I noticed when implementing
the new interface. Patch 10/11 provides the actual ioctl() implementation
while patch 11/11 adds a simple user-space program to tools that can be
used to watch the line info changes.

v1: https://lkml.org/lkml/2019/11/27/327

v1 -> v2:
- rework the main patch of the series: re-use the existing file-descriptor
  associated with an open character device
- add a patch adding a debug message when the line event kfifo is full and
  we're discarding another event
- rework the locking mechanism for lineevent kfifo: reuse the spinlock
  from the waitqueue structure
- other minor changes

Bartosz Golaszewski (11):
  gpiolib: use 'unsigned int' instead of 'unsigned' in gpio_set_config()
  gpiolib: have a single place of calling set_config()
  gpiolib: convert the type of hwnum to unsigned int in
    gpiochip_get_desc()
  gpiolib: use gpiochip_get_desc() in linehandle_create()
  gpiolib: use gpiochip_get_desc() in lineevent_create()
  gpiolib: use gpiochip_get_desc() in gpio_ioctl()
  gpiolib: rework the locking mechanism for lineevent kfifo
  gpiolib: emit a debug message when adding events to a full kfifo
  gpiolib: provide a dedicated function for setting lineinfo
  gpiolib: add new ioctl() for monitoring changes in line info
  tools: gpio: implement gpio-watch

 drivers/gpio/gpiolib.c      | 378 ++++++++++++++++++++++++++----------
 drivers/gpio/gpiolib.h      |   5 +-
 include/linux/gpio/driver.h |   3 +-
 include/uapi/linux/gpio.h   |  24 +++
 tools/gpio/.gitignore       |   1 +
 tools/gpio/Build            |   1 +
 tools/gpio/Makefile         |  11 +-
 tools/gpio/gpio-watch.c     | 112 +++++++++++
 8 files changed, 434 insertions(+), 101 deletions(-)
 create mode 100644 tools/gpio/gpio-watch.c

-- 
2.23.0

