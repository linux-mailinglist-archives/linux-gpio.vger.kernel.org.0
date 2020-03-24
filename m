Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 806FE190784
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 09:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgCXI3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 04:29:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36155 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgCXI3I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 04:29:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so14257407wrs.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ywh4ivqMK/iW0WyzNjKrsj8bQC0BOYEMqFRny6BBkTQ=;
        b=0APAVmM26P3AoPVf7OrjCMzm2OuUjJ3BbPff50c1xw6PBSuR0Cj6SXfG04h3/mwUM1
         6Zjy8EBVB0+lKp7v8oCp7RsFS3E8Zx041eocYc9VF5uEesoyPncNj2x8QiIMlc0bxHy0
         snEjldfy0H0QT/2EtQGC44ExmoRJecYtw1yKKWzOS0T6jb7QWRU0ouc3E+VAsOjf54au
         rGYaSTEsbk98S4DB6RR/tQS9UxDGqNCG2v5B4PSrWOOR/4jQlJKAwtHyP6GSzcG/AX/B
         3twtJWKwxWnSMCmdmDLDYZVHwSw1IFDUd/UCUKTe82h5ey7qQUYhRq+jABN9nNZAdCRf
         BBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ywh4ivqMK/iW0WyzNjKrsj8bQC0BOYEMqFRny6BBkTQ=;
        b=GwE3PRyMAPnYW1X75LjIwinFm2SslFh2bw/gBqydq+uuN8TiIlVeSlpqj0dFQGVEP8
         K3GJ3dNHbfIby6B0FUEjHo+6cOC6bhi5tkFEtl5XOJk2Tu7tcHnK+tojuXwpA4EMoO1V
         oKCsOoU0BNvyGiawqCLbxWjrjtC0okE7efz1KJIERBaUvoZYah+xK0N2ijI2x1FLvodd
         OlDrBc2xnu0mzZe879aIMT7H+byaTZm0EW7kyPCkQt1uPifIkCr4uGMLd9gBp3Cm5EcL
         UJrJ3yCL4T7q6ytX//vryLAT7b3y5cPrpT2NLqar0o3edgILm/H1gHsZoWR4iqVvz9qk
         JFRA==
X-Gm-Message-State: ANhLgQ1UhePCi8nWO2Qat98wWu+KOe6AkWGxrgFgY+WqjgIc9vgPWwfA
        K6Awsh9OKjw4GHx99JCbA7lDNw==
X-Google-Smtp-Source: ADFU+vu1rdS2xfFiVmGZ6WDFuJFiQW0vj/HCONDuf3FQUS85afYuPBPFY+ZURttgn+Iqb943oaA6kA==
X-Received: by 2002:adf:8165:: with SMTP id 92mr36873984wrm.217.1585038545993;
        Tue, 24 Mar 2020 01:29:05 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id e5sm27582095wru.92.2020.03.24.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 01:29:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.7 part 3
Date:   Tue, 24 Mar 2020 09:29:03 +0100
Message-Id: <20200324082903.19366-1-brgl@bgdev.pl>
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

this is the third and probably last batch of changes for v5.7 I picked up
into my tree. Details are in the signed tag. Please pull.

Bartosz

The following changes since commit 9cd0c5e02ee4fcf8d0905def9b096b4222e179c2:

  Merge branch 'devel' into for-next (2020-03-03 15:02:01 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.7-part3

for you to fetch changes up to 8afb2c17f8309c99df1cb6a97918663978128e2c:

  tools: gpio: Fix typo in gpio-utils (2020-03-23 10:39:15 +0100)

----------------------------------------------------------------
gpio updates for v5.7 part 3

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
