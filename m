Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CA54561E6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 18:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhKRSAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 13:00:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:9354 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229648AbhKRSAu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Nov 2021 13:00:50 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="214280629"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="214280629"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 09:57:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="568555458"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 18 Nov 2021 09:57:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A235F445; Thu, 18 Nov 2021 19:57:51 +0200 (EET)
Date:   Thu, 18 Nov 2021 19:57:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.17-1
Message-ID: <YZaUHy//vkja2la6@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

The kasprintf_strarray() series as PR for both Pin Control and GPIO subsystems.
All tags have been applied.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.17-1

for you to fetch changes up to c25441ca551164c56b34885df3d657e2ea4d623f:

  gpio: mockup: Switch to use kasprintf_strarray() (2021-11-18 18:40:10 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.17-1

* Introduce new generic kasprintf_strarray() API
* Clean up and convert existing drivers to use the above

The API will be needed in the future for new comers, including Intel ones.

The following is an automated git shortlog grouped by driver:

armada-37xx:
 -  Switch to use devm_kasprintf_strarray()
 -  Convert to use dev_err_probe()
 -  Make use of the devm_platform_ioremap_resource()
 -  Use temporary variable for struct device
 -  Fix function name in the kernel doc

gpio:
 -  mockup: Switch to use kasprintf_strarray()

lib/string_helpers:
 -  Introduce managed variant of kasprintf_strarray()
 -  Introduce kasprintf_strarray()

pinctrl/rockchip:
 -  Switch to use devm_kasprintf_strarray()
 -  Convert to use dev_err_probe()
 -  Make use of the devm_platform_get_and_ioremap_resource()
 -  Use temporary variable for struct device
 -  Drop wrong kernel doc annotation

st:
 -  Switch to use devm_kasprintf_strarray()
 -  Convert to use dev_err_probe()
 -  Make use of the devm_platform_ioremap_resource_byname()
 -  Use temporary variable for struct device
 -  Drop wrong kernel doc annotations

zynqmp:
 -  Unify pin naming

----------------------------------------------------------------
Andy Shevchenko (19):
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

 drivers/gpio/gpio-mockup.c                  |  23 +---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  85 ++++++---------
 drivers/pinctrl/pinctrl-rockchip.c          | 159 +++++++++++++---------------
 drivers/pinctrl/pinctrl-st.c                | 116 +++++++++-----------
 drivers/pinctrl/pinctrl-zynqmp.c            |  10 +-
 include/linux/string_helpers.h              |   4 +
 lib/string_helpers.c                        |  64 +++++++++++
 7 files changed, 233 insertions(+), 228 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


