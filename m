Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4D4117806
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 22:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfLIVJi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 16:09:38 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:20946 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbfLIVJi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 16:09:38 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Wwjy6cZpzCS;
        Mon,  9 Dec 2019 22:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575925623; bh=Qc4cMiFfqRcpK1/wEakCiApC7wh9tCxkWxOw2MmHKU0=;
        h=Date:From:Subject:To:Cc:From;
        b=aFdT+b/auaLo+CrXXgBNInWjo2FntKJNOsY7H/vwhIqJiN5dtFsEjGUHWH5i092F2
         o9XEt4YLMpJ5XgvJQQh3ZgoTJLbQ/uFNjdPm8H+YCtBGELbs4r89+N227sg11EAtPL
         v5zeVpOlmV2MeY8niGFydO9uyUKoLZGA2O8ii+H+ylrgJbQET14gGxW+6BTiG3ahtV
         IYPwNwPfkM6eZfim0g8tOCBRzT0OdvVVGrW1Cb1FPbDh68C6D/J9b2PFbQTxNp58NE
         dglh3O6LPrfy+OwAWSvYcKhMMgeG0cIRg5E5eVefT2XNZD+NmIuu4P1AYQ2jpGWwNE
         /SqHYEuIr9g9g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 09 Dec 2019 22:09:35 +0100
Message-Id: <cover.1575925023.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 0/4] mmc: simplify WP/CD GPIO handling
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, linux-kernel@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series removes convoluted handling of inverted CD and WP lines in
SD/MMC host drivers when using GPIOs.

First patch, sent separately earlier, adds gpiod_toggle_active_low() to
switch line inversion flag in the gpiod structure. Next two patches
modify WP and CD initialization to apply all the inversions onto gpiod's
active-low flag. Final patch removes now-unused argument from init functions.

x86 allyesconfig build-tested.

Michał Mirosław (4):
  gpio: add gpiod_toggle_active_low()
  mmc: rework wp-gpio handling
  mmc: rework cd-gpio handling
  mmc: remove mmc_gpiod_request_*(invert_gpio)

 drivers/gpio/gpiolib-of.c          | 21 -------------------
 drivers/gpio/gpiolib.c             | 11 ++++++++++
 drivers/mmc/core/host.c            | 33 ++++++++----------------------
 drivers/mmc/core/slot-gpio.c       | 30 ++++++++++-----------------
 drivers/mmc/host/davinci_mmc.c     |  4 ++--
 drivers/mmc/host/mmc_spi.c         |  4 ++--
 drivers/mmc/host/mmci.c            |  4 ++--
 drivers/mmc/host/pxamci.c          | 12 +++++------
 drivers/mmc/host/s3cmci.c          |  4 ++--
 drivers/mmc/host/sdhci-acpi.c      |  2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c | 15 +++++++-------
 drivers/mmc/host/sdhci-pci-core.c  |  4 ++--
 drivers/mmc/host/sdhci-sirf.c      |  2 +-
 drivers/mmc/host/sdhci-spear.c     |  2 +-
 drivers/mmc/host/tmio_mmc_core.c   |  2 +-
 include/linux/gpio/consumer.h      |  7 +++++++
 include/linux/mmc/slot-gpio.h      |  5 ++---
 17 files changed, 67 insertions(+), 95 deletions(-)

-- 
2.20.1

