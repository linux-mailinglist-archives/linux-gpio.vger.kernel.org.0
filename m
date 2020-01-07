Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A7113259D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgAGMF7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:05:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42574 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgAGMF7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:05:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id q6so53556525wro.9
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Cro4ZDjBD8H+WHPtoH8ETCNRtOFdSsnKTEfobWU8Xo=;
        b=MxHamiG04KhgaDz3InjmzH/wNFdW5gP8/wFqwdPxmVBiZuH2Ani0KHSzOi3H26IFaf
         g4j0yvggUXp+YHRdoCOdi+SWXsI4Ua15jKhklfYtQ+nXRMNtIUhG3S5+z4VX3YpQq5a9
         q7KT5WdplmhAfYJ5ODv6rw+iyMCSDzmRF6E/1KvKOwMCuBBjqCQTGcXnoSXT7CLivIik
         dqMdkXTF9I8G95ZR9H8gk2T/uJ9NF8eq0Bshn8hfBBi3kWHiDgrG4IXGqr56B3XLmiZ4
         EYpXyv0ouZZ+7KbGbRKhe/F9FEUnzLDnZluNDY+JpMJhDbTvmeaHyBwM/5efRyCSiRcK
         K+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Cro4ZDjBD8H+WHPtoH8ETCNRtOFdSsnKTEfobWU8Xo=;
        b=qtaA533U7S5KPQ4pLxRlbFsOEPZPxIlS17eQRzNWOghGC/XThrfoKvFroWlIaPrSg2
         vJL0Wo0PXNqt5lJyzKwYLShWlmMBY3HtdS+LQ6pcchEPK2mPDldAvblW4m9+U34UtJcW
         EL1relxsFLW21NIT1QN3VPUH8wSEdCr+FUbWeLsYe4yLHU3rG9/BzJlt995xJp4jBmFS
         FC5jzn7dxf6uI/XabGeZm7bzwHzLMRMg2FAy96lh/+Uq1yRSWSXYPerBMXSNtupwP6XI
         bYhbJRXzk6rxYYqv1x8Q4K8HAqU6DyP/E7wkVhOwjhYYZ7YQTAMGrIC/Hy+BS8BGvUdz
         5Aww==
X-Gm-Message-State: APjAAAW2aOQBmr4JSncLZ6honRolFLhyN+ADsC/mZv2xE2Ym5kzG9VlZ
        KodTwhFZl2uSW75K/PFysHxMJQ==
X-Google-Smtp-Source: APXvYqw28gKLlI6fIGv3i/DEJyHBGqiP460MS9ORgsVO/C+l4ON//Xi+wDTRvQOGDvLGdu1SH1MUDg==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr111185812wrw.193.1578398756916;
        Tue, 07 Jan 2020 04:05:56 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id x16sm26162042wmk.35.2020.01.07.04.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 04:05:56 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.6
Date:   Tue,  7 Jan 2020 13:05:53 +0100
Message-Id: <20200107120553.5620-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

as discussed: this is the PR that contains the cleanup patches submitted
as part of my series adding support for watching GPIO line status. Several
other patches picked up into my tree since the merge window are in here as
well.

Details are in the signed tag. Please pull.

Best regards,
Bartosz Golaszewski

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.6-part1

for you to fetch changes up to 2a2cabd8bc1715ceceb9d9566055f4a0a8ff749a:

  gpiolib: use gpiochip_get_desc() in gpio_ioctl() (2020-01-07 12:03:28 +0100)

----------------------------------------------------------------
gpio updates for v5.6

- improvements in the gpio-pca953x driver
- use platform_irq_count() in gpio-mvebu and gpio-bcm-kona
- remove unneeded MODULE_VERSION() usage in the gpio directory
- irq-related improvements in gpio-tegra driver
- several improvements for the core subsystem code: fix confusing indentation,
  fix int type casting, unduplicate code in several places

----------------------------------------------------------------
Andy Shevchenko (1):
      gpio: pca953x: Remove redundant forward declaration

Bartosz Golaszewski (6):
      gpiolib: use 'unsigned int' instead of 'unsigned' in gpio_set_config()
      gpiolib: have a single place of calling set_config()
      gpiolib: convert the type of hwnum to unsigned int in gpiochip_get_desc()
      gpiolib: use gpiochip_get_desc() in linehandle_create()
      gpiolib: use gpiochip_get_desc() in lineevent_create()
      gpiolib: use gpiochip_get_desc() in gpio_ioctl()

Dmitry Osipenko (3):
      gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
      gpio: tegra: Properly handle irq_set_irq_wake() error
      gpio: tegra: Use NOIRQ phase for suspend/resume

Enrico Weigelt, metux IT consult (2):
      gpio: remove unneeded MODULE_VERSION() usage
      gpio: gpiolib: fix confusing indention

Peng Fan (2):
      gpio: mvebu: use platform_irq_count
      gpio: bcm-kona: use platform_irq_count

Vignesh Raghavendra (1):
      gpio: pca953x: Don't hardcode irq trigger type

 drivers/gpio/gpio-bcm-kona.c      | 12 +++++++---
 drivers/gpio/gpio-mvebu.c         |  7 ++++--
 drivers/gpio/gpio-pca953x.c       |  5 +---
 drivers/gpio/gpio-sama5d2-piobu.c |  1 -
 drivers/gpio/gpio-tb10x.c         |  1 -
 drivers/gpio/gpio-tegra.c         | 21 ++++++++--------
 drivers/gpio/gpiolib.c            | 50 +++++++++++++++++++++------------------
 drivers/gpio/gpiolib.h            |  3 ++-
 include/linux/gpio/driver.h       |  3 ++-
 9 files changed, 56 insertions(+), 47 deletions(-)
