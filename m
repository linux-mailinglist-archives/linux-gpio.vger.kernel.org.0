Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0599C1F9B70
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbgFOPF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:05:57 -0400
Received: from mga11.intel.com ([192.55.52.93]:44017 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730944AbgFOPFy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:05:54 -0400
IronPort-SDR: F+ISaKUORxnF1It9ELvG6eh8FwLb+TtbsE07nFJhwhhp7KLwFte1A/PSUB9sFl5j0BqzdKywOe
 +bLtSPAKo/bQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:05:51 -0700
IronPort-SDR: DSDuAtU6HMM0bt6HH7auTXG1JIuhJou0e+d3FEyBDBDifbrtK5uHoQ/mrep1D4i7C5R+rCAwbx
 XtSpRfc8SwJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="276588004"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2020 08:05:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D557D217; Mon, 15 Jun 2020 18:05:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/5] gpio, pinctrl, introduce for_each_requested_gpio() helper
Date:   Mon, 15 Jun 2020 18:05:40 +0300
Message-Id: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While cleaning up Intel pin control drivers I have noticed that one helper
macro can be used widely in GPIO and pin control subsystems. Here we are.

Intel stuff is deliberately excluded, so, this can be applied to the GPIO
subsystem into immutable branch that will be propagated to pin control
subsystem and TWIMC parties, such as Intel pin control drivers.

Andy Shevchenko (5):
  gpiolib: Introduce for_each_requested_gpio_in_range() macro
  ARM/orion/gpio: Make use of for_each_requested_gpio()
  gpio: mvebu: Make use of for_each_requested_gpio()
  gpio: xra1403: Make use of for_each_requested_gpio()
  pinctrl: at91: Make use of for_each_requested_gpio()

 arch/arm/plat-orion/gpio.c     |  8 ++------
 drivers/gpio/gpio-mvebu.c      |  8 ++------
 drivers/gpio/gpio-xra1403.c    |  8 ++------
 drivers/pinctrl/pinctrl-at91.c |  7 ++-----
 include/linux/gpio/driver.h    | 16 ++++++++++++++++
 5 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.27.0.rc2

