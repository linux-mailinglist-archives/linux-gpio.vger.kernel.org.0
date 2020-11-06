Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE8C82A979B
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 15:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgKFO2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 09:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgKFO2s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 09:28:48 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7FFC0613CF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 06:28:46 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e6so1541560wro.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMg4wfg55kHxvg63ZC3OOdJuQaIKtdTNOJPE3qI5tSE=;
        b=q2QFPHxqiVtYgVYysBTbspcLCMWCpvCMCQBUrM8B0t2e1nMvsdoAdDZfzcsEhNVNBV
         1nDmcriReO4nZfKgFLElsMek/c0kg5WZQQV9DwIgPkeb/VXtOIXUqsIIRinuCqYhiOSA
         gYRto11i3o3JyecafrI6zeKVGXZWBhEyPS/TSsoL2yBDiQP3eXtF+v1WEsafxyXg6WvB
         xXxQF/eazmd/Rh5EcFAL/mHpAz808/d0DGum6eJTW+zcgt/6/ZJBOSYJmAobCko3ALlp
         U0GW7ZI+1V7DuGHe1KG+x/ol8QYS4OImoYKPntX3iWD5mwG74oOSZXXHmHidtAIos67Y
         2Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMg4wfg55kHxvg63ZC3OOdJuQaIKtdTNOJPE3qI5tSE=;
        b=rlxg4QY162ftg54QU7aW49Qs7rmGPtC2YXAjBdqvDXdat26mkcHq9BWh1Ou2fiYc1o
         61qQvQotBkzD2La146//fg+1KctXLjvKIc/15+inhgKpPNZnyZNdssyA1W1/8cHpiZAJ
         J4octl+zmfQ1wG0H4lr5V5DPvQXjHS1HoDFjMR1FfTcGSIuw/MguQEj0JycxiYT64XiC
         ygzv4jfWxEQZ+t0JHB5hhQAg7jeoHvfxR5xMZRhgVBO/LuLWMDEqbBjumdjFe5T5YbaZ
         1Ccw6s4PL6Pd6kSQWrrU5Lp/xBlUXNUXflAuHinS2rpg4UcMBR8KmZE/IlSIjEMuqPwY
         MBTQ==
X-Gm-Message-State: AOAM531RJUylsF1mUggnTNDdUCvaJ+3TQ/SndKlvAE+HfFo0yen6OmHX
        UwkEBkzanXvRiXRqkAD2d38dkA==
X-Google-Smtp-Source: ABdhPJzqP0gfzfrQb3IB7bnm/Dbci2x+ijz3cvMSkpwi7mvAMQmAyOm33RBYK85nBMknDdSJx+vsIw==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr3050420wrr.324.1604672925560;
        Fri, 06 Nov 2020 06:28:45 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id x81sm2713390wmg.5.2020.11.06.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:28:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.10-rc3
Date:   Fri,  6 Nov 2020 15:28:40 +0100
Message-Id: <20201106142840.29730-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

Please pull the first batch of fixes for this release cycle.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v5.10-rc3

for you to fetch changes up to 10a2f11d3c9e48363c729419e0f0530dea76e4fe:

  gpio: pcie-idio-24: Enable PEX8311 interrupts (2020-11-06 15:19:44 +0100)

----------------------------------------------------------------
gpio fixes for v5.10-rc3

- fix missing conversion to gpiolib irqchip in gpio-dwapb
- fix bank properties for ast2600 variant in gpio-aspeed
- make sysfs work again when the character device is disabled
- fix interrupt handling in gpio-pcie-idio-24

----------------------------------------------------------------
Arnaud de Turckheim (3):
      gpio: pcie-idio-24: Fix irq mask when masking
      gpio: pcie-idio-24: Fix IRQ Enable Register value
      gpio: pcie-idio-24: Enable PEX8311 interrupts

Billy Tsai (1):
      gpio: aspeed: fix ast2600 bank properties

Jia He (1):
      gpio: dwapb: Fix missing conversion to GPIO-lib-based IRQ-chip

Kent Gibson (1):
      gpiolib: fix sysfs when cdev is not selected

 drivers/gpio/gpio-aspeed.c       |  1 +
 drivers/gpio/gpio-dwapb.c        |  4 +--
 drivers/gpio/gpio-pcie-idio-24.c | 62 ++++++++++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-cdev.h      | 15 ----------
 drivers/gpio/gpiolib.c           | 18 ++++++++++--
 5 files changed, 74 insertions(+), 26 deletions(-)
