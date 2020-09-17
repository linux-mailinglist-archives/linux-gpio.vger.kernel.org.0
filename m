Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2751026DA76
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 13:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgIQLjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 07:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgIQLj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 07:39:29 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEB9C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 04:39:27 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e11so4259426wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fke3ilklxVnPHqdZq/AEGfLI8ekrEnWB0AEI14mgjdc=;
        b=Xqfwg+imho7taCl9/G4F+yyCDfU+YXn60+ri7kuQVx37UJDeje3u/v8fXbtYFmV3AV
         UxOy7ROjbzj3umuhbZgeEgCRLTamsnEx7YydDf51UmxvCKb0O43Oy+oFfrU4oe8/dFd6
         z0KIdFg6GshlBS/XXVZWLuNd57AfrqRwyoPQMSg7sDNAXfx9qA8wN8KQOfa7s1WS1k/c
         4XpECpkjVaK3BMlFzaYGg0jIHkFTeJ4IXg3Pwq5pYxROWd8BPn9DalU3WjjYeSAWZs8G
         mBr95McLMOiSJSeyYIdUJ3SLT+D/1Yzhx5rOlnw+MJqK0DmMqhTYMxr0LW+NWd/yg5MS
         Ccug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fke3ilklxVnPHqdZq/AEGfLI8ekrEnWB0AEI14mgjdc=;
        b=oi2t5Im4MuYPr76XZ6uK07o469eDFt71D8jWQsHTEshjBG9DT+kGZb7CGIWEta8Jvz
         PV0s3llq2UJBlFdsMmeojyGXxpizLUd2wAGvi44Wi/qqGnBCixxdHrGwHT76CKbWcK99
         se5lWANxXvVNJgsYHyXj1fHlJTphjlHkO4/3lb4jw9X4dy03r52vmiscIf6JuLmJRwLr
         2n32+CZhW9JSfER3TCAL9/aiyCK39L6MUze6MMTtwWU4/PcYPifaQ08uOJN/+Gbv88vm
         t3Mdm5AVx58ueMEWfxcMigu1lpXUQ3NFcQUvEcAJQiJ16PixqOwTG/2MmCW/fVX8MUrX
         Hqzg==
X-Gm-Message-State: AOAM531RNWCgKVyN9id13fEHzw47C4L+TprwWz/NJalA6zcAFF5a82X2
        0avVcVc2izDgG3vCfDAKIzHU8w3atXAmqA==
X-Google-Smtp-Source: ABdhPJwUP5C4gl1PxOI4Dtq06J19+rvgPw8b8crHonoFyblHZSAeL9LSHWYJaBBuP6fsiLBwgFYsWA==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr9481802wmi.30.1600342766551;
        Thu, 17 Sep 2020 04:39:26 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id g12sm37121762wro.89.2020.09.17.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:39:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.10
Date:   Thu, 17 Sep 2020 13:39:24 +0200
Message-Id: <20200917113924.13677-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

Please pull the following batch of updates for the v5.10 release cycle. Details
are in the signed tag.

Bartosz

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.10-part1

for you to fetch changes up to 587823d39f85ff9777a862019eca720b97a16a52:

  gpiolib: check for parent device in devprop_gpiochip_set_names() (2020-09-17 12:07:02 +0200)

----------------------------------------------------------------
gpio updates for v5.10 - part 1

- automatically drive GPHY leds in gpio-stp-xway
- refactor ->{get, set}_multiple() in gpio-aggregator
- add support for a new model in rcar-gpio DT bindings
- simplify several GPIO drivers with dev_err_probe()
- disable Direct KBD interrupts in gpio-tc35894
- use DEFINE_SEQ_ATTRIBUTE() in GPIO chardev to shrink code
- switch to using a simpler IDA API in gpiolib
- make devprop_gpiochip_set_names() more generic by using device properties
  instead of using fwnode helpers

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      gpio: stp-xway: automatically drive GPHY leds on ar10 and grx390

Andy Shevchenko (2):
      gpio: aggregator: Refactor ->{get, set}_multiple() to make Sparse happy
      gpiolib: convert to use DEFINE_SEQ_ATTRIBUTE macro

Bartosz Golaszewski (5):
      gpiolib: switch to simpler IDA interface
      device: property: add helpers to count items in string arrays
      gpiolib: generalize devprop_gpiochip_set_names() for device properties
      gpiolib: unexport devprop_gpiochip_set_names()
      gpiolib: check for parent device in devprop_gpiochip_set_names()

Krzysztof Kozlowski (6):
      gpio: bcm-kona: Simplify with dev_err_probe()
      gpio: davinci: Simplify with dev_err_probe()
      gpio: omap: Simplify with dev_err_probe()
      gpio: pca953x: Simplify with dev_err_probe()
      gpio: pisosr: Simplify with dev_err_probe()
      gpio: zynq: Simplify with dev_err_probe()

Lad Prabhakar (1):
      dt-bindings: gpio: renesas, rcar-gpio: Add r8a774e1 support

dillon min (1):
      gpio: tc35894: Disable Direct KBD interrupts to enable gpio irq

 .../bindings/gpio/renesas,rcar-gpio.yaml           |  1 +
 drivers/gpio/Makefile                              |  1 -
 drivers/gpio/gpio-aggregator.c                     | 70 +++++++++++-------
 drivers/gpio/gpio-bcm-kona.c                       |  5 +-
 drivers/gpio/gpio-davinci.c                        |  8 +--
 drivers/gpio/gpio-omap.c                           |  5 +-
 drivers/gpio/gpio-pca953x.c                        |  9 +--
 drivers/gpio/gpio-pisosr.c                         |  9 +--
 drivers/gpio/gpio-stp-xway.c                       | 54 ++++++++++++--
 drivers/gpio/gpio-tc3589x.c                        | 18 ++++-
 drivers/gpio/gpio-zynq.c                           |  8 +--
 drivers/gpio/gpiolib-acpi.c                        |  3 -
 drivers/gpio/gpiolib-devprop.c                     | 63 ----------------
 drivers/gpio/gpiolib-of.c                          |  5 --
 drivers/gpio/gpiolib.c                             | 84 ++++++++++++++++------
 include/linux/gpio/driver.h                        |  3 -
 include/linux/mfd/tc3589x.h                        |  6 ++
 include/linux/property.h                           | 13 ++++
 18 files changed, 201 insertions(+), 164 deletions(-)
 delete mode 100644 drivers/gpio/gpiolib-devprop.c
