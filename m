Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585CD786C5B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 11:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjHXJz0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 05:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbjHXJy5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 05:54:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2AE1980
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2023 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692870894; x=1724406894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iu9gQ6xyUsu3v8pn/ibwr71wiCxQLCMlIDiQhEtawKU=;
  b=HeqZ1u6efmxGfyAtyUN1G8LbYf7DJyoR4BvkFg2ahtC1wRcvS0+RLf5q
   XRccXEotXluxYgIbn3s+iIH6qQ+VgBHBdaTBWFShflv70+ZwHLCTtYgEz
   K8MTjjFMP1u/+vT1UU3KvlikvzTCm8N65cJB/d14/+IWbcJaJh/ICrrGb
   +A8hNMk96PPcs3r/rM67L73rSZLdxYrK7ArloeJKMD0mQM1Bif0NMI2bX
   dmoHqOWlVHG8JN5FtoJ5eu4O4fmpROGKDT/Zs7MxzhC0cYRmyyZHCPC0r
   zwy22AyFw/TMdinwCzZvu/S8xFxb6comn5+Tw7FwFuzy0/8HOwe1clA79
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438330424"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438330424"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766479177"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="766479177"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 02:54:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 18123379; Thu, 24 Aug 2023 12:54:50 +0300 (EEST)
Date:   Thu, 24 Aug 2023 12:54:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.6-1
Message-ID: <ZOco6n9jbDTOWWdy@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

A bit late batch of Intel pin control updates along with some other
drivers to be involved. The main parts of the batch were at least
10 days in Linux Next without any problems reported. Please pull
for v6.6 cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.6-1

for you to fetch changes up to d5301c90716a8e20bc961a348182daca00c8e8f0:

  pinctrl: cherryview: fix address_space_handler() argument (2023-08-22 14:51:10 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.6-1

* New library driver for Intel MID to deduplicate code (Raag Jadav)
* Reuse common functions from pinctrl-intel to reduce the code (Raag Jadav)
* Move most of the exported functions to the PINCTRL_INTEL namespace
* Make use of pm_ptr() in Bay Trail and Lynxpoint drivers
* Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper and use it in a few drivers
* Consolidata ACPI dependency in Kconfig (Raag Jadav)
* Fix address_space_handler() argument in Cherryview driver (Raag Jadav)
* Optinmize byt_pin_config_set() to avoid IO in error cases (Raag Jadav)

The following is an automated git shortlog grouped by driver:

at91:
 -  Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper

baytrail:
 -  Make use of pm_ptr()
 -  reuse common functions from pinctrl-intel
 -  consolidate common mask operation

cherryview:
 -  fix address_space_handler() argument
 -  Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
 -  reuse common functions from pinctrl-intel

intel:
 -  consolidate ACPI dependency
 -  Switch to use exported namespace
 -  export common pinctrl functions

lynxpoint:
 -  Make use of pm_ptr()
 -  reuse common functions from pinctrl-intel

Merge patch series:
 - Merge patch series "Introduce Intel Tangier pinctrl driver"
 - Merge patch series "Reuse common functions from pinctrl-intel"

merrifield:
 -  Adapt to Intel Tangier driver

moorefield:
 -  Adapt to Intel Tangier driver

mvebu:
 -  Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper

pm:
 -  Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper

renesas:
 -  Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper

tangier:
 -  Introduce Intel Tangier driver

tegra:
 -  Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper

----------------------------------------------------------------
Andy Shevchenko (11):
      Merge patch series "Introduce Intel Tangier pinctrl driver"
      Merge patch series "Reuse common functions from pinctrl-intel"
      pinctrl: intel: Switch to use exported namespace
      pinctrl: baytrail: Make use of pm_ptr()
      pinctrl: lynxpoint: Make use of pm_ptr()
      pm: Introduce DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: cherryview: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: at91: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: mvebu: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: renesas: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper
      pinctrl: tegra: Switch to use DEFINE_NOIRQ_DEV_PM_OPS() helper

Raag Jadav (10):
      pinctrl: baytrail: consolidate common mask operation
      pinctrl: tangier: Introduce Intel Tangier driver
      pinctrl: merrifield: Adapt to Intel Tangier driver
      pinctrl: moorefield: Adapt to Intel Tangier driver
      pinctrl: intel: export common pinctrl functions
      pinctrl: baytrail: reuse common functions from pinctrl-intel
      pinctrl: cherryview: reuse common functions from pinctrl-intel
      pinctrl: lynxpoint: reuse common functions from pinctrl-intel
      pinctrl: intel: consolidate ACPI dependency
      pinctrl: cherryview: fix address_space_handler() argument

 drivers/pinctrl/intel/Kconfig                |  49 +-
 drivers/pinctrl/intel/Kconfig.tng            |  33 ++
 drivers/pinctrl/intel/Makefile               |   1 +
 drivers/pinctrl/intel/pinctrl-alderlake.c    |   1 +
 drivers/pinctrl/intel/pinctrl-baytrail.c     | 135 ++----
 drivers/pinctrl/intel/pinctrl-broxton.c      |   1 +
 drivers/pinctrl/intel/pinctrl-cannonlake.c   |   2 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c    |   1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c   |  84 +---
 drivers/pinctrl/intel/pinctrl-denverton.c    |   1 +
 drivers/pinctrl/intel/pinctrl-elkhartlake.c  |   2 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c   |   2 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c   |   1 +
 drivers/pinctrl/intel/pinctrl-icelake.c      |   2 +-
 drivers/pinctrl/intel/pinctrl-intel.c        |  36 +-
 drivers/pinctrl/intel/pinctrl-intel.h        |  12 +
 drivers/pinctrl/intel/pinctrl-jasperlake.c   |   1 +
 drivers/pinctrl/intel/pinctrl-lakefield.c    |   1 +
 drivers/pinctrl/intel/pinctrl-lewisburg.c    |   2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    |  93 +---
 drivers/pinctrl/intel/pinctrl-merrifield.c   | 677 ++-------------------------
 drivers/pinctrl/intel/pinctrl-meteorlake.c   |   1 +
 drivers/pinctrl/intel/pinctrl-moorefield.c   | 640 ++-----------------------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |   1 +
 drivers/pinctrl/intel/pinctrl-tangier.c      | 589 +++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-tangier.h      |  92 ++++
 drivers/pinctrl/intel/pinctrl-tigerlake.c    |   2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c  |  14 +-
 drivers/pinctrl/pinctrl-at91.c               |  10 +-
 drivers/pinctrl/renesas/core.c               |  16 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c        |   5 +-
 drivers/pinctrl/tegra/pinctrl-tegra210.c     |   2 +-
 include/linux/pm.h                           |   9 +
 33 files changed, 905 insertions(+), 1613 deletions(-)
 create mode 100644 drivers/pinctrl/intel/Kconfig.tng
 create mode 100644 drivers/pinctrl/intel/pinctrl-tangier.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-tangier.h

-- 
With Best Regards,
Andy Shevchenko


