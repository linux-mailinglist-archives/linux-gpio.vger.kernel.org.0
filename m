Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 757C1E0A97
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731982AbfJVR31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:29:27 -0400
Received: from mga04.intel.com ([192.55.52.120]:17268 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730141AbfJVR31 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="201748566"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2019 10:29:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C71391C5; Tue, 22 Oct 2019 20:29:23 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 00/11] gpio: pca953x: Convert to bitmap (extended) API
Date:   Tue, 22 Oct 2019 20:29:11 +0300
Message-Id: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While converting gpio-pca953x driver to bitmap API, I noticed that we have
no function to replace bits.

So, that's how patch 7 appears.

First 6 patches are preparatory of the test suite (including some warning
fixes, etc).

Patches 8-9 are preparatory for the GPIO driver to be easier converted
to bitmap API, conversion to which happens in patch 10.

Patch 11 simple indentation fixes.

Since the series depends to the commit e51819d749db ("bitops: introduce the
for_each_set_clump8 macro") in Andrew's set and taking into consideration
a lot of bitmap related patches here, it would make sense to route these thru
Andrew as well.

In v2:
- address wrong logic in pca953x_gpio_set_multiple() (William)
- 10 more patches as described above

Andy Shevchenko (11):
  lib/test_bitmap: Force argument of bitmap_parselist_user() to proper
    address space
  lib/test_bitmap: Undefine macros after use
  lib/test_bitmap: Name EXP_BYTES properly
  lib/test_bitmap: Rename exp to exp1 to avoid ambiguous name
  lib/test_bitmap: Move exp1 and exp2 upper for others to use
  lib/test_bitmap: Fix comment about this file
  bitmap: Introduce bitmap_replace() helper
  gpio: pca953x: Remove redundant variable and check in IRQ handler
  gpio: pca953x: Use input from regs structure in pca953x_irq_pending()
  gpio: pca953x: Convert to use bitmap API
  gpio: pca953x: Tight up indentation

 drivers/gpio/gpio-pca953x.c | 196 ++++++++++++++++--------------------
 include/linux/bitmap.h      |  16 +++
 lib/bitmap.c                |  12 +++
 lib/test_bitmap.c           | 137 ++++++++++++++++---------
 4 files changed, 203 insertions(+), 158 deletions(-)

-- 
2.23.0

