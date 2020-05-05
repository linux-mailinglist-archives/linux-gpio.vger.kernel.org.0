Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49001C5DCE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 18:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgEEQqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 12:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729541AbgEEQqF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2020 12:46:05 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F11C061A0F
        for <linux-gpio@vger.kernel.org>; Tue,  5 May 2020 09:46:04 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y4so3324509wrm.11
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2020 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S646eQTnniB9I7JJikIvYbw6i9E5ngc4i9xmsf7XoRY=;
        b=W8vNFLwbprfqHEUSOVvtgjdtyhR4KYrUNqF/nENqnyRqkP/S/Shi+5QCiq1G5fxEyw
         5eLevq2jHqeUfObrbzSDfb8Y34qtJcmgyiwkvbbzR3FqN2/TxdIM9S9EfRPbjVZ0Kocv
         7hL/kV3Jv4aW8ZPO5W+SYeiisDP0vVsZqfJEz8oZbAoDU5eK4KVt0ptYRnorqvii4kIj
         uUtiyXA3CK5sawTrWh0Z3fhNYnTyjiTmKtgmH0qosLEwSxqcuCMWZo9Qele5/UtqM54m
         g7hyMk/oK8TcZs5vR71D1SEFFCZdNkgaYuwA1RzV2vuaZbfmAkdYV6iFkOj8VKbsB51f
         cgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S646eQTnniB9I7JJikIvYbw6i9E5ngc4i9xmsf7XoRY=;
        b=EMPTTHzc7aiQ9nflSe03tpEs3KAfZksc7HDMD8LazgPSdclqnuxrkUyraGDWAvmmS/
         RsM51XtNt/1YZK1mPrOmsHRH01hGvyVKzB+cro2FLl9ZvXE0dlIZo0bYEkNSWgLFinqj
         GmatQQLcTXilxZr81ir9zzcut7UOOOZY01QTWAWe/0Xwp6T67Un6jDYpAyyrNhXB58gT
         voYdflqsHfRLa2nPH6yuv6fNbHwsSb4cdawv8DBzdv6PeiStUS+tgypOnYJmVqa460+4
         /4qsP3WoIxbkYCMTSYjqJIrxvpEw0xl+YQ3xDYOQYQioNl2/0C5priMOZSEceISy0gXc
         i+ZQ==
X-Gm-Message-State: AGi0PuYxyqeQI5EF/rNw9/zNAF1EVhgnSDf/axh8OAmYP54wSjfmD7yc
        FieI2++hEGwfg9XDeJFruWsFwg==
X-Google-Smtp-Source: APiQypLxllf5NKyXsh+lHjZgzUz1uJ2QWlBaJ4x1ugzzwR64dKWPmeQvM549+tc1oeDyE2zGRi7tMg==
X-Received: by 2002:adf:8401:: with SMTP id 1mr4842785wrf.241.1588697162771;
        Tue, 05 May 2020 09:46:02 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 19sm4589890wmo.3.2020.05.05.09.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 09:46:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.8-rc1 (part 1)
Date:   Tue,  5 May 2020 18:45:59 +0200
Message-Id: <20200505164559.2143-1-brgl@bgdev.pl>
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

please pull the following batch of updates for v5.8 I picked up into
my tree.

Bart

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v5.8-part1

for you to fetch changes up to 3831c051dfbf58595085e432acc00ad4efcf54cc:

  tools: gpio: add bias flags to lsgpio (2020-05-05 18:27:09 +0200)

----------------------------------------------------------------
gpio updates for v5.8-rc1 - part1

- correct the IRQ type used in to_irq() in gpio-xgene-sb
- add new item to the TODO list
- support building gpio-pl061 as module
- improve pull-up/down support on GPIO expanders in device-tree
- several improvements in gpio-pca953x
- emit a warning for too long GPIO line names
- add MODULE_DEVICE_TABLE to gpio-tegra186
- add support for new variant to gpio-f7188x
- lsgpio can now display bias flags

----------------------------------------------------------------
Adam Ford (1):
      gpiolib: of: improve gpiolib-of support of pull up/down on expanders

Andy Shevchenko (2):
      gpio: Extend TODO to cover code duplication avoidance
      gpio: pca953x: Rewrite ->get_multiple() function

Bartosz Golaszewski (1):
      gpio: pca953x: disable regmap locking

Brian Masney (1):
      gpio: xgene-sb: set valid IRQ type in to_irq()

Kent Gibson (1):
      tools: gpio: add bias flags to lsgpio

Mian Yousaf Kaukab (1):
      gpio: tegra186: export MODULE_DEVICE_TABLE

Paul Thomas (1):
      gpio: gpio-pca953x, Add get_multiple function

Petteri Jokinen (1):
      gpio-f7188x: Add GPIO support for F81865

Rob Herring (1):
      gpio: pl061: Support building as module

Stephen Boyd (1):
      gpiolib: devprop: Warn if gpio-line-names is too long

Uwe Kleine-König (2):
      gpio: pca953x: fix handling of automatic address incrementing
      gpio: pca953x: drop unused parameters of pca953x_recalc_addr()

 drivers/gpio/Kconfig           |  2 +-
 drivers/gpio/TODO              |  4 ++
 drivers/gpio/gpio-f7188x.c     | 33 +++++++++++++--
 drivers/gpio/gpio-pca953x.c    | 94 ++++++++++++++++++++++++++----------------
 drivers/gpio/gpio-pl061.c      |  9 ++--
 drivers/gpio/gpio-tegra186.c   |  1 +
 drivers/gpio/gpio-xgene-sb.c   |  2 +-
 drivers/gpio/gpiolib-devprop.c |  5 ++-
 drivers/gpio/gpiolib-of.c      | 10 +++++
 tools/gpio/lsgpio.c            | 12 ++++++
 10 files changed, 125 insertions(+), 47 deletions(-)
