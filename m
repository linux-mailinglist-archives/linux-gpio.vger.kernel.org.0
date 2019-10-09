Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 680A4D1490
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731417AbfJIQvT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:51:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:51308 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731192AbfJIQvS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Oct 2019 12:51:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; 
   d="scan'208";a="345414479"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 09 Oct 2019 09:51:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DCBEB16A; Wed,  9 Oct 2019 19:51:15 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.4-2
Date:   Wed,  9 Oct 2019 19:50:51 +0300
Message-Id: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Small set of urgent fixes against Intel GPIO drivers that have been recently
converted to use GPIO core for instantiation of IRQ chip. No conflicts observed
with fixes branch of GPIO tree as of today.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.4-2

for you to fetch changes up to 6ed26a5326f6da6e1950b8476173df51a92a96be:

  gpio: lynxpoint: set default handler to be handle_bad_irq() (2019-10-09 19:00:13 +0300)

----------------------------------------------------------------
intel-gpio for v5.4-2

The conversion to use of GPIO core to instantiate IRQ chip produced
several issues among the drivers. Here is the set of fixes to:
 * initialize hardware before IRQ chip will be added
 * initialize hardware without NULL pointer dereference
 * assign IRQ base

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  Initialize the hardware with a callback

intel-mid:
 -  Move hardware initialization to callback

lynxpoint:
 -  set default handler to be handle_bad_irq()
 -  Move hardware initialization to callback

merrifield:
 -  Move hardware initialization to callback
 -  Restore use of irq_base

----------------------------------------------------------------
Andy Shevchenko (6):
      gpio: merrifield: Restore use of irq_base
      gpiolib: Initialize the hardware with a callback
      gpio: intel-mid: Move hardware initialization to callback
      gpio: lynxpoint: Move hardware initialization to callback
      gpio: merrifield: Move hardware initialization to callback
      gpio: lynxpoint: set default handler to be handle_bad_irq()

 drivers/gpio/gpio-intel-mid.c  |  9 ++++++---
 drivers/gpio/gpio-lynxpoint.c  | 10 ++++++----
 drivers/gpio/gpio-merrifield.c |  9 ++++++---
 drivers/gpio/gpiolib.c         | 22 +++++++++++++++++++++-
 include/linux/gpio/driver.h    |  8 ++++++++
 5 files changed, 47 insertions(+), 11 deletions(-)
