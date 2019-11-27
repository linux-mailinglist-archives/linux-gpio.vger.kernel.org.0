Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A8910B054
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 14:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfK0NfX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 08:35:23 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35474 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK0NfX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 08:35:23 -0500
Received: by mail-wm1-f66.google.com with SMTP id n5so7526101wmc.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 05:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ycif2CI2BztFtL8UjZ1dZuqTWMkeyaIvGznAKKh93ok=;
        b=JBqmckjBRNdk5FeGal9TmbFsNCpz0NQ07G92pUX8JiEGLCSEy9SUBoCFcLagnyNaGz
         ejT2+uTlCAzCSwAS6f9Ue/oo9luJhEGTSQcBDD0cRztEOymhK9w2rmtlW11M0LQ9Tg60
         sBPxMu0ELDbhLcWEnxJ9R4GphjlfUwDNoAcVggdcRLneL32yQMp86XQPuJCO/0doD+K0
         iFZY+VuZ+VUR5yuIxyJ3sV6Jp0I1kdAKl+umtQWOgmv9ZGFwfzjn1vYbBupjVBPvGusx
         npweITC1Coe8/o3vegVcHXs4JC9z77WtGpqUvGYqN4drI5J2aBVKrBXg4lYAluz3Kiux
         5WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ycif2CI2BztFtL8UjZ1dZuqTWMkeyaIvGznAKKh93ok=;
        b=aMqci4FjZUXcwZd7OQPpOdreKbMklNRJZxEFV7f93Kq4w8iKgovQBQgU/bq5gIcHal
         2IFfepeky5ztErZS8pS1ZDkdsGYfpwO314kRPLytd/mFL0/5vobVx8gJdQTu2zq2UDXJ
         iazO3wjB1qMg9+VF5sk//iELYSeyA66pGdp0au3goGhWfnREzrz7KPm8UEKNEbEv5pth
         rPkT/1OxcUZ995qPNqqp3vjOOY42aKRbRVMqzkxe9RmJgGdNE8gxyrCWS8kq9Vd/04p2
         3VztWD+nlWvB5NvfqpkxUGDUJY+Ray8paw0FaEzi+2MsF8xfsi4GlVE2kEZnnGjQyx27
         4wTw==
X-Gm-Message-State: APjAAAX7TIgs0+CX/VeAMVFMt1ribSh/VYa+fAiJj3OCowWaS7Fgq9RT
        2qkk6HYTZc5pdKA8Gc9W5t7bOw==
X-Google-Smtp-Source: APXvYqwixrHU5vJWZ49Nf+cjthWYO6mEubiUz2VlE2tDjz1h9vw98C3OFD9qZlH8Ue/mo+S6xA6iKA==
X-Received: by 2002:a1c:39c2:: with SMTP id g185mr4345040wma.88.1574861720171;
        Wed, 27 Nov 2019 05:35:20 -0800 (PST)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id k18sm19663687wrm.82.2019.11.27.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 05:35:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/8] gpiolib: add an ioctl() for monitoring line status changes
Date:   Wed, 27 Nov 2019 14:35:02 +0100
Message-Id: <20191127133510.10614-1-brgl@bgdev.pl>
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

This series adds a new ioctl() that allows user-space to retrieve a
file-descriptor which can then be polled for events emitted by the kernel
when the line is requested, released or its status changed. This of course
doesn't require the line to be requested. Multiple user-space processes
can watch the same lines.

The first couple patches just fix some issues I noticed when implementing
the new interface. Patch 7/8 provides the actual ioctl() implementation
while patch 8/8 adds a simple user-space program to tools that can be used
to watch the line info changes.

Bartosz Golaszewski (8):
  gpiolib: use 'unsigned int' instead of 'unsigned' in gpio_set_config()
  gpiolib: have a single place of calling set_config()
  gpiolib: convert the type of hwnum to unsigned int in
    gpiochip_get_desc()
  gpiolib: use gpiochip_get_desc() in linehandle_create()
  gpiolib: use gpiochip_get_desc() in lineevent_create()
  gpiolib: actually protect the line event kfifo with mutex
  gpiolib: add new ioctl() for monitoring changes in line info
  tools: gpio: implement gpio-watch

 drivers/gpio/gpiolib.c      | 267 +++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h      |   4 +-
 include/linux/gpio/driver.h |   3 +-
 include/uapi/linux/gpio.h   |  36 +++++
 tools/gpio/.gitignore       |   1 +
 tools/gpio/Build            |   1 +
 tools/gpio/Makefile         |  11 +-
 tools/gpio/gpio-watch.c     | 114 +++++++++++++++
 8 files changed, 415 insertions(+), 22 deletions(-)
 create mode 100644 tools/gpio/gpio-watch.c

-- 
2.23.0

