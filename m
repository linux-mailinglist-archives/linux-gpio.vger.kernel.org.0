Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADDF148CE8
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 18:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389765AbgAXR1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 12:27:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44944 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389720AbgAXR1S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 12:27:18 -0500
Received: by mail-wr1-f67.google.com with SMTP id q10so2928562wrm.11
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jan 2020 09:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vbia6IDYlH56gJUFZ5L/cJKg2RLQ/ATShKmM2t7DzWY=;
        b=dEaY3fuzTabPsONlANzp1GSPYi/5/LjgDjk0AKSQS8FuLbbLrJW9ZdUQYklgP+NAvT
         Pn46jOV81MMMja0Z56zBAa3VgM+5mCpaZvNxiyLdmmrNbCcBpJ7qOkYbjwrRrqYSnF+C
         ctx921q0CS+MItQqe5ISOn+r8eOosIWIsEaUn/g+6yATNE3C6T/hk3bLQ2AbO7NdVsvh
         nV4xrssPrgj0Vxcaz+kvS1N3oEPh3rEr+2J2HqnTSTLxqkzaL5lthW2+IC4Dzo7jj2EG
         HXToiUXvcohZUCd7+mblCtoWtkUX1xTEjKoZb1ql18oWuROhyslphHPxjnxMX5DNzQjs
         tNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vbia6IDYlH56gJUFZ5L/cJKg2RLQ/ATShKmM2t7DzWY=;
        b=Uh9+mqXvD7ufZjXG6vCvpL31Egxfr1u/ptxKkaYGr9F99DX9ehuV4uIApSz0Vo0+fm
         mrl9BqtrPEnJTx01O/iUWaqHAqwyNWS8Semg9nZDA+d/nS2bSgp9eYGgy9vzA+xQpuia
         CzU+yeCaeyN+uAt8QrQGqsEMy3vAi7w74AjW3EDe7cv6hR/lL1nrbQD/5hnh4qpTAXsg
         7wyQlS3wa0zKAopRz336CLtcqCSI1yvj//MDaPPfmqRnR4WnQz1UQdrGt8gRfyY7ZA3J
         MneeoIP3vHPoRk7aD3U6Kyxgp/611LvEdUZ69qaCA5/ewmnzVz0rsZv7BXomDjDokkN6
         u8Hw==
X-Gm-Message-State: APjAAAXHAQ2Oic2ImZCdvl17z/eGQ9cjOVafz+4AxDEA4A1h7G08FOu1
        zouRKIF87nwNgJhkAotkaaOWHA==
X-Google-Smtp-Source: APXvYqxlK2FjSrFQUrgEAxbvtDmP5WCiYjgLtSMjI/AJ/6pZlt90Qwrg/dn9KroO+X2QPYT1QKgW8A==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr5492587wrr.266.1579886836214;
        Fri, 24 Jan 2020 09:27:16 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id t8sm8358585wrp.69.2020.01.24.09.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 09:27:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 0/7] gpiolib: add an ioctl() for monitoring line status changes
Date:   Fri, 24 Jan 2020 18:27:03 +0100
Message-Id: <20200124172710.20776-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I was about to queue those when I realised I'm using the wrong function
for the timestamp value - we should be using monotonic time provided by
ktime_get_ns(). I fixed this in this version.

===

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

First two patches add new helpers to kfifo, that are used in the later
parts of the series.

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

v4 -> v5:
- dropped patches already merged upstream
- collected review tags

v5 -> v6:
- coding style tweak as pointed out by Andy
- fixed a wrong comment in the uapi header
- switch to using ktime_get_ns() for the GPIO line change timestamps
  as discussed with Arnd[1]

[1] https://lore.kernel.org/linux-gpio/CAK8P3a1t3MquLPuZqgds4osrTNTOG494s4fk_nhdn+N=B3qdhg@mail.gmail.com/

Bartosz Golaszewski (7):
  kfifo: provide noirqsave variants of spinlocked in and out helpers
  kfifo: provide kfifo_is_empty_spinlocked()
  gpiolib: rework the locking mechanism for lineevent kfifo
  gpiolib: emit a debug message when adding events to a full kfifo
  gpiolib: provide a dedicated function for setting lineinfo
  gpiolib: add new ioctl() for monitoring changes in line info
  tools: gpio: implement gpio-watch

 drivers/gpio/gpiolib.c    | 350 +++++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.h    |   1 +
 include/linux/kfifo.h     |  73 ++++++++
 include/uapi/linux/gpio.h |  30 ++++
 tools/gpio/.gitignore     |   1 +
 tools/gpio/Build          |   1 +
 tools/gpio/Makefile       |  11 +-
 tools/gpio/gpio-watch.c   |  99 +++++++++++
 8 files changed, 485 insertions(+), 81 deletions(-)
 create mode 100644 tools/gpio/gpio-watch.c

-- 
2.23.0

