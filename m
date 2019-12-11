Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB1211A187
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 03:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfLKClO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 21:41:14 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:27735 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbfLKCk6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Dec 2019 21:40:58 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Xh4k56Xjz5F;
        Wed, 11 Dec 2019 03:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576032055; bh=x3MUuU0TTk4NVDu60Q9m0xNK1f0k/ifJulmoJP3sWMQ=;
        h=Date:From:Subject:To:Cc:From;
        b=pWnAxCl4umvjSVlm81F+0heStwLn1rgt4s7hjrkw33x79NdEpZiSVMev0rTJOwqoo
         mOr8XYVUpQ9fl+N1hcH2uJbPJ5+aOZZydgtsPXYseKwKu5yPzayQUcfA4Ch/c6wUHi
         s/ce5vRvKrMqG1B9xA8Xv5BZ7ItXb05sk1KBQ0Cot9p1j/Pronk+0EqkJM8zUBc938
         0f8fB7+VCL/LFale0QzJrcLu4rFIkPXS+Qs4FJKff+yWvG64ZeiJM2AWyER66is6Lk
         Za5cdVnw0QMeiEoie+Nxm42w6kLaEbpJlz8Y4mB4bbXDvNDH1CiTs/d7euJDKE1iwP
         IEkAJCpKjtXkA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 03:40:54 +0100
Message-Id: <cover.1576031636.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 0/4] mmc: simplify WP/CD GPIO handling
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-mmc@vger.kernel.org
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series removes convoluted handling of inverted CD and WP lines in
SD/MMC host drivers when using GPIOs.

First patch adds an API: gpiod_toggle_active_low() that switches line
inversion flag in the gpiod structure. Next two patches modify MMC
host's WP and CD initialization to apply all the inversions onto
gpiod's active-low flag. Final patch removes now-unused argument from
init functions.

x86 allyesconfig build-tested. 

v2: move argument removal in sdhci-esdhc-imx.c to last patch

Michał Mirosław (4):
  gpio: add gpiod_toggle_active_low()
  mmc: rework wp-gpio handling
  mmc: rework cd-gpio handling
  mmc: remove mmc_gpiod_request_*(invert_gpio)

 drivers/gpio/gpiolib-of.c          | 21 -------------------
 drivers/gpio/gpiolib.c             | 11 ++++++++++
 drivers/mmc/core/host.c            | 33 ++++++++----------------------
 drivers/mmc/core/slot-gpio.c       | 31 ++++++++++------------------
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
 17 files changed, 67 insertions(+), 96 deletions(-)

-- 
2.20.1

