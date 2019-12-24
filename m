Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C01312A104
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfLXMHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:19 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33564 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfLXMHT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:19 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so19700553wrq.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Abw3Db9iMH8wWhh+IDkbLs69tg1ME9SDU22oNHYrzR8=;
        b=Qz/h66IrLIF4Fcmb3e1ODN/0yYQzwSQH++GHM9fEx84pbRAAkPKg4xKocbT3ujlTLY
         naDpqvGbZGj3rQLy0I2I9D2HK36T/PYPuWCs15fkIhUohM2V/L3CNlLnxM0QgjQ74KIs
         lo48jThm4y1Vrlr+KznVyh6YhvV2a1tR15v90voBwKfI4Yq992aH5fvzQTij5GxdVVoB
         lR3ckRCSK8yUylM7gUREp6y6lO8MMU/tB2RUz/b8hMZbK0rjRdlm7IIkLwrBDxs3t+Qo
         SnUnuibRTtO71RDkrq4q7igz215l0XNhGIrP7NsVy4DqKp9kEYRtP4OqrB4c8Loes1hC
         xukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Abw3Db9iMH8wWhh+IDkbLs69tg1ME9SDU22oNHYrzR8=;
        b=HmAGLbPYTSz8Gjqm4yBpxErJaiMMK/c/6/GpG/2juP5rvxzSReuaBkdrBbJZKv52UP
         E5qGM4d/ImXis/CxrZUp1j7PylxGNJxfabso8q++1jHHwzi4xX2A1W/0KnVLrm24tqlQ
         oAGqUQvrA4guyBHWc6LkavCPDsZOnmuBAzq/poh1Up0qwnMlD3oM70RiXl7ZmZM/TLE9
         sNcCmNGGTVg6MfgeqFKnVzqtAE94S+op0S5O2Sf6nznS8PS9UugAs83sJudReFyBtMtz
         OpKVa3oGh7fSoWsYg0M2tY9HFv/hJzXFK4l7ijfHBSImZBzZLDibCae0NfX86or8KKA+
         fTxw==
X-Gm-Message-State: APjAAAXvvZMj4FP5OLo4YABW1WPfK+6ZGsoH2Iwn9ZyDGioinEu7JJYZ
        jKqo7xh97IxXc7FJEYtMK0/eGw==
X-Google-Smtp-Source: APXvYqwkFPfJnprWc1Wds4pqUWoD8acoWyG6lTAat+TgSv1F582jJnbbnZs0wAh1s1krF5zNe+sUrw==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr34448875wrp.292.1577189236920;
        Tue, 24 Dec 2019 04:07:16 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 00/13] gpiolib: add an ioctl() for monitoring line status changes
Date:   Tue, 24 Dec 2019 13:06:56 +0100
Message-Id: <20191224120709.18247-1-brgl@bgdev.pl>
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

This series also includes a variety of minor tweaks & fixes for problems
discovered during development. For instance it addresses a race-condition
in current line event fifo.

v1: https://lkml.org/lkml/2019/11/27/327

v1 -> v2:
- rework the main patch of the series: re-use the existing file-descriptor
  associated with an open character device
- add a patch adding a debug message when the line event kfifo is full and
  we're discarding another event
- rework the locking mechanism for lineevent kfifo: reuse the spinlock
  from the waitqueue structure
- other minor changes

v2 -> v3:
- added patches providing new implementation for some kfifo macros
- fixed a regression in the patch reworking the line event fifo: reading
  multiple events is now still possible
- reworked the structure for new ioctl: it's now padded such that there
  be no alignment issues if running a 64-bit kernel on 32-bit userspace
- fixed a bug where one process could disable the status watch of another
- use kstrtoul() instead of atoi() in gpio-watch for string validation

v3 -> v4:
- removed a binary file checked in by mistake
- drop __func__ from debug messages
- restructure the code in the notifier call
- add comments about the alignment of the new uAPI structure
- remove a stray new line that doesn't belong in this series
- tested the series on 32-bit user-space with 64-bit kernel

Bartosz Golaszewski (13):
  gpiolib: use 'unsigned int' instead of 'unsigned' in gpio_set_config()
  gpiolib: have a single place of calling set_config()
  gpiolib: convert the type of hwnum to unsigned int in
    gpiochip_get_desc()
  gpiolib: use gpiochip_get_desc() in linehandle_create()
  gpiolib: use gpiochip_get_desc() in lineevent_create()
  gpiolib: use gpiochip_get_desc() in gpio_ioctl()
  kfifo: provide noirqsave variants of spinlocked in and out helpers
  kfifo: provide kfifo_is_empty_spinlocked()
  gpiolib: rework the locking mechanism for lineevent kfifo
  gpiolib: emit a debug message when adding events to a full kfifo
  gpiolib: provide a dedicated function for setting lineinfo
  gpiolib: add new ioctl() for monitoring changes in line info
  tools: gpio: implement gpio-watch

 drivers/gpio/gpiolib.c      | 397 +++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.h      |   4 +-
 include/linux/gpio/driver.h |   3 +-
 include/linux/kfifo.h       |  73 +++++++
 include/uapi/linux/gpio.h   |  30 +++
 tools/gpio/.gitignore       |   1 +
 tools/gpio/Build            |   1 +
 tools/gpio/Makefile         |  11 +-
 tools/gpio/gpio-watch.c     |  99 +++++++++
 9 files changed, 515 insertions(+), 104 deletions(-)
 create mode 100644 tools/gpio/gpio-watch.c

-- 
2.23.0

