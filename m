Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB08475C2A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 16:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244134AbhLOPsA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 10:48:00 -0500
Received: from mga07.intel.com ([134.134.136.100]:33442 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244110AbhLOPr7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Dec 2021 10:47:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="302628329"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="302628329"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 07:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="464311753"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2021 07:47:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EE18CD4; Wed, 15 Dec 2021 17:48:04 +0200 (EET)
Date:   Wed, 15 Dec 2021 17:48:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.17-3
Message-ID: <YboONMsLk8eUlvYD@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Second part of the Intel pin control drivers PR for v5.17. It has been a while
in the Linux Next without any errors reported.

Note, the List of changes done against upstream that's why it has all changes
listed, including the pulled ones. Nevertheless, tag describes the latest delta.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.17-3

for you to fetch changes up to db1b2a8caf5b4954aa62ead5b0580948656eac43:

  pinctrl: cherryview: Use temporary variable for struct device (2021-11-26 22:37:41 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.17-3

* Intel Baytrail and Cherryview IRQ related fixes

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Set IRQCHIP_SET_TYPE_MASKED flag on the irqchip

cherryview:
 -  Use temporary variable for struct device
 -  Do not allow the same interrupt line to be used by 2 pins
 -  Don't use selection 0 to mark an interrupt line as unused

----------------------------------------------------------------
Andy Shevchenko (20):
      lib/string_helpers: Introduce kasprintf_strarray()
      lib/string_helpers: Introduce managed variant of kasprintf_strarray()
      pinctrl/rockchip: Drop wrong kernel doc annotation
      pinctrl/rockchip: Use temporary variable for struct device
      pinctrl/rockchip: Make use of the devm_platform_get_and_ioremap_resource()
      pinctrl/rockchip: Convert to use dev_err_probe()
      pinctrl/rockchip: Switch to use devm_kasprintf_strarray()
      pinctrl: armada-37xx: Fix function name in the kernel doc
      pinctrl: armada-37xx: Use temporary variable for struct device
      pinctrl: armada-37xx: Make use of the devm_platform_ioremap_resource()
      pinctrl: armada-37xx: Convert to use dev_err_probe()
      pinctrl: armada-37xx: Switch to use devm_kasprintf_strarray()
      pinctrl: st: Drop wrong kernel doc annotations
      pinctrl: st: Use temporary variable for struct device
      pinctrl: st: Make use of the devm_platform_ioremap_resource_byname()
      pinctrl: st: Convert to use dev_err_probe()
      pinctrl: st: Switch to use devm_kasprintf_strarray()
      pinctrl: zynqmp: Unify pin naming
      gpio: mockup: Switch to use kasprintf_strarray()
      pinctrl: cherryview: Use temporary variable for struct device

Hans de Goede (3):
      pinctrl: baytrail: Set IRQCHIP_SET_TYPE_MASKED flag on the irqchip
      pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused
      pinctrl: cherryview: Do not allow the same interrupt line to be used by 2 pins

 drivers/gpio/gpio-mockup.c                  |  23 +---
 drivers/pinctrl/intel/pinctrl-baytrail.c    |   2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c  | 130 +++++++++++++++++------
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  85 ++++++---------
 drivers/pinctrl/pinctrl-rockchip.c          | 159 +++++++++++++---------------
 drivers/pinctrl/pinctrl-st.c                | 116 +++++++++-----------
 drivers/pinctrl/pinctrl-zynqmp.c            |  10 +-
 include/linux/string_helpers.h              |   4 +
 lib/string_helpers.c                        |  64 +++++++++++
 9 files changed, 333 insertions(+), 260 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


