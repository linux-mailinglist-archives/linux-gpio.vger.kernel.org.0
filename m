Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9122FF1911
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 15:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731652AbfKFOsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 09:48:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:46609 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728712AbfKFOsd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 09:48:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 06:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="353498316"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 06 Nov 2019 06:48:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EDCD3FC; Wed,  6 Nov 2019 16:48:29 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/8] pinctrl: intel: Move Lynxpoint to pin control umbrella
Date:   Wed,  6 Nov 2019 16:48:21 +0200
Message-Id: <20191106144829.32275-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Intel Lynxpoint GPIO is actually half way to the Chassis specification that has
been established starting from Intel Skylake. It has some pin control
properties we may utilize. To achieve this, move the driver under pin control
umbrella and do a bunch of clean ups.

This is the first step. Next step will be to convert it to the actual pin
control driver.

The series has been tested on Harrisbeach Ultrabook where Lynxpoint GPIO is
exposed to the OS.

Andy Shevchenko (8):
  pinctrl: lynxpoint: Move GPIO driver to pin controller folder
  pinctrl: lynxpoint: Use raw_spinlock for locking
  pinctrl: lynxpoint: Correct amount of pins
  pinctrl: lynxpoint: Keep pointer to struct device instead of its
    container
  pinctrl: lynxpoint: Use %pR to print IO resource
  pinctrl: lynxpoint: Switch to memory mapped IO accessors
  pinctrl: lynxpoint: Convert unsigned to unsigned int
  pinctrl: lynxpoint: Move ->remove closer to ->probe()

 MAINTAINERS                                   |   1 -
 drivers/gpio/Kconfig                          |   8 -
 drivers/gpio/Makefile                         |   1 -
 drivers/pinctrl/intel/Kconfig                 |  10 ++
 drivers/pinctrl/intel/Makefile                |   1 +
 .../intel/pinctrl-lynxpoint.c}                | 168 +++++++++---------
 6 files changed, 93 insertions(+), 96 deletions(-)
 rename drivers/{gpio/gpio-lynxpoint.c => pinctrl/intel/pinctrl-lynxpoint.c} (72%)

-- 
2.24.0.rc1

