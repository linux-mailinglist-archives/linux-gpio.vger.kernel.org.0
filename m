Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 663CD19239E
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 10:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgCYJFI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 05:05:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46074 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgCYJFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 05:05:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id t7so1814426wrw.12
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRC19ri5zv/m8eCXDAwCzvxR7RgyVBjX8IIapbEs6Jc=;
        b=c3XX8ChiBVhPikDSeIfTaq2/TabEc9tINC16lzoF091t8kOsG2/jsJyA6Bky0N5aL0
         gFF+wgT1AL1oU8XeQb7r9WmYSxLE1KEqJMxTZAw7/kKZ4nWcaa6joKs8f4V6uUJ9bl+R
         2Y84RQdflQAsLw+4Z0xdsW057ieELr2Mu7A1UgoRFfWOn9Qa3IYgxczAL8DhqJRG3isZ
         psoFIavUUdaKpA/Rcq2VuU/bt0dbyceO0fJuAcAyiLysWEw1Ojwoi/CXzh7stvJCNTEO
         Xu9kK7A8JNfbN8TZA5N5U/T+S0FL4LnN9sAsgdY9uaJjGifFW3zdPfiDSsHmYZaiVXys
         1ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRC19ri5zv/m8eCXDAwCzvxR7RgyVBjX8IIapbEs6Jc=;
        b=GQqmsz2wUOqqJNEQKgRJZCF2xFSzaW4U1TVA/S6RnJXMjgjDU/QE/mFvXmeY1a+G81
         wDfTi1YqIhkE/KPr58x2ZwkmNnO5ulQR8CE/KTZyxeNQ3nCqTP7A0SplTVBpnfcNxP1Z
         z8IrOIxwOXx+k7r1XN+J90b7i6gQXaySlb4MwrrP5zCJDdi8Bl0BxzKlXL4iZ+O7EVO8
         OG9XgJW1pqCFMsh04HPddJEjnwQXjfOEA+xPKTnqlFrYw3s54+zCFu+eHr2HgEhYwoLe
         tDCQaIEpBx4RUhlvoKVQp4mC94udufs9QhUxT23cXIZ9xXxExPyegF6KQ22jIBvZRmyD
         m1lQ==
X-Gm-Message-State: ANhLgQ344pgasjiPBs2PJ3QR16Ba/fV+gWQZyFL5USlGW0ERYAerAn/6
        zmPfPgLpeDB7UvRvyaUGCfw+Sw==
X-Google-Smtp-Source: ADFU+vt9kFnsbg1G4x1nTB25s9Fotv20OcSrNQyqDIrn/Phvwtq5Dl1TI41HEJKnTKtfvuipdbqYFA==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr2247425wrp.420.1585127106315;
        Wed, 25 Mar 2020 02:05:06 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 98sm32952129wrk.52.2020.03.25.02.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 02:05:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.7 part4
Date:   Wed, 25 Mar 2020 10:05:03 +0100
Message-Id: <20200325090503.1468-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

as discussed - this PR contains the same commits as part3 but rebased
on top of your devel branch.

Bartosz

The following changes since commit a28e1c0505a09c3a2d81fed1c8453ac2d8d02b3a:

  gpio: Move devres calls to devres file (2020-03-20 10:23:06 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v5.7-part4

for you to fetch changes up to 97551625025320e9d635531625316e43c8ed62b0:

  tools: gpio: Fix typo in gpio-utils (2020-03-25 09:50:46 +0100)

----------------------------------------------------------------
gpio updates for v5.7 part 4

- improve comments in the uapi header
- fix documentation issues
- add a warning to gpio-pl061 when the IRQ line is not configured
- allow building gpio-mxc and gpio-mxs with COMPILE_TEST enabled
- don't print an error message when an optional IRQ is missing in gpio-mvebu
- fix a potential segfault in gpio-hammer
- fix a couple typos and coding style issues in gpio tools
- provide a new flag in gpio-mmio and use it in mt7621 to fix an issue with
  the controller ignoring value setting when a GPIO is in input mode
- slightly refactor gpio_name_to_desc()

----------------------------------------------------------------
Alexander Sverdlin (1):
      gpio: pl061: Warn when IRQ line has not been configured

Anson Huang (2):
      gpio: mxc: Add COMPILE_TEST support for GPIO_MXC
      gpio: mxs: add COMPILE_TEST support for GPIO_MXS

Chris Packham (1):
      gpio: mvebu: avoid error message for optional IRQ

Chuanhong Guo (2):
      gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
      gpio: mt7621: add BGPIOF_NO_SET_ON_INPUT flag

Colin Ian King (1):
      tools: gpio-hammer: fix spelling mistake: "occurences" -> "occurrences"

Gabriel Ravier (2):
      tools: gpio-hammer: Avoid potential overflow in main
      tools: gpio-hammer: Apply scripts/Lindent and retain good changes

Jonathan Neuschäfer (1):
      gpio: uapi: Improve phrasing around arrays representing empty strings

Mauro Carvalho Chehab (1):
      docs: gpio: driver.rst: don't mark literal blocks twice

Michał Mirosław (1):
      gpiolib: gpio_name_to_desc: factor out !name check

Mykyta Poturai (1):
      tools: gpio: Fix typo in gpio-utils

 Documentation/driver-api/gpio/driver.rst |  4 ++--
 drivers/gpio/Kconfig                     |  4 ++--
 drivers/gpio/gpio-mmio.c                 | 23 +++++++++++++++++++----
 drivers/gpio/gpio-mt7621.c               |  4 ++--
 drivers/gpio/gpio-mvebu.c                |  2 +-
 drivers/gpio/gpio-pl061.c                |  6 ++----
 drivers/gpio/gpiolib.c                   |  5 ++++-
 include/linux/gpio/driver.h              |  1 +
 include/uapi/linux/gpio.h                |  8 ++++----
 tools/gpio/gpio-hammer.c                 | 19 +++++++++++++++++--
 tools/gpio/gpio-utils.c                  |  6 +++---
 11 files changed, 57 insertions(+), 25 deletions(-)
