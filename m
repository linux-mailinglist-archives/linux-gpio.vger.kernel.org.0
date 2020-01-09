Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0313135864
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 12:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbgAILuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 06:50:17 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40078 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728926AbgAILuQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 06:50:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so2485119wmi.5
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 03:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T6PnzdI9idiu6EFezuzKl56feV8FHs3zBjQKARno6vk=;
        b=iXCmz/GD6icV6BUwR+s8NejDWtJHyipKyfpsBNVv3tbhIX6h902CLFDjMgx/gAXdvm
         um4I8Llh/994qVWQB2Gn5270SBrX9/e3lAYxdBNfghKBf98YnWC+hq8F6wXSTBP9LNlR
         lEv982AYR+8gBXC5z6oEori2KQiGR8Top14rUUf34l8FEMeZuJEBbfLSDlGvF+dOHceG
         Q283N4yfmm/3HQNtbML4qaQBiRb1/9VInnEkKP4uFPQFFxupYzAf0lhQ4uy5yM+Xc8YN
         /gRlUWJ7R1Htpv8+KhC+76pFkUAHItrvqq6nzrXp34WoHorKhwvJgfGtgJCqV02MoToh
         Wk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T6PnzdI9idiu6EFezuzKl56feV8FHs3zBjQKARno6vk=;
        b=A3x0O+D/V14/Bzqo+jBU1ox9WP3qW8f3kN87xdS0Y0oRXrgj9dzftGbPniqWa8F2Cs
         29sNmZEQSP3d25wpCJhgftn0hXUDKbzO3zU2m4kR2Qkc0BR2jnlEaD+/moTh8sJFNYKN
         9XA3Kq1H/Ewn1BkqN+C7vn2b0acLg8HFjOC6pLZfi0U7BLFluzWBeWpDAZ17fp0kqbrz
         Y0BkM2k8ZUsJd8TkPNzT2+O5wBfvVRAdKAPab/8BuHTMi/4C1TpQYdXALBBMxp+ujpJN
         L/QVmUtUFcmnPJw9qXe9juENLn/LSdJqDRBAyonS23R+nAWhtXQ71AFXAdy4AP/DWPT2
         nSTQ==
X-Gm-Message-State: APjAAAWR1NXhvorYGEpg6NA9uUxuOeumAjTaqNufi78jiGQ84Gk9jYPd
        o4G8Yizc+FfkIM0KpDuNR3q+EA==
X-Google-Smtp-Source: APXvYqyiNTMVFMIidZLuqR91uJGVJNBraA/eWD7B18OGosvc/XDhPkAAP6W2HFvjlD02EkkOB8M0aQ==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr4516162wmf.100.1578570615400;
        Thu, 09 Jan 2020 03:50:15 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u16sm2574979wmj.41.2020.01.09.03.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 03:50:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/7] gpiolib: add an ioctl() for monitoring line status changes
Date:   Thu,  9 Jan 2020 12:50:03 +0100
Message-Id: <20200109115010.27814-1-brgl@bgdev.pl>
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

Bartosz Golaszewski (7):
  kfifo: provide noirqsave variants of spinlocked in and out helpers
  kfifo: provide kfifo_is_empty_spinlocked()
  gpiolib: rework the locking mechanism for lineevent kfifo
  gpiolib: emit a debug message when adding events to a full kfifo
  gpiolib: provide a dedicated function for setting lineinfo
  gpiolib: add new ioctl() for monitoring changes in line info
  tools: gpio: implement gpio-watch

 drivers/gpio/gpiolib.c    | 351 +++++++++++++++++++++++++++++---------
 drivers/gpio/gpiolib.h    |   1 +
 include/linux/kfifo.h     |  73 ++++++++
 include/uapi/linux/gpio.h |  30 ++++
 tools/gpio/.gitignore     |   1 +
 tools/gpio/Build          |   1 +
 tools/gpio/Makefile       |  11 +-
 tools/gpio/gpio-watch.c   |  99 +++++++++++
 8 files changed, 486 insertions(+), 81 deletions(-)
 create mode 100644 tools/gpio/gpio-watch.c

-- 
2.23.0

