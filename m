Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93FD652EF78
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 17:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245043AbiETPmp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 11:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350950AbiETPmo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 11:42:44 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E12D57100
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653061363; x=1684597363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3VGdAm8SG+MFsaMrCrkmaRsnt3mUg9uwrchBz9VawE=;
  b=JSN/hLgXjThodiLoYuYrSbGGaNl0qRY9epAGIpIWykYQJCdVBCCCHs4I
   tfsBGVEbefjAWMyDna6vwdrALAiVH2Rv6QD/gCO9NBtDYm8hpgkrprLxN
   S99sR5O17krs4yzEeIhjiRrz5/BsOyFlbWW78X3Vz2290O7sY6OCC4Ypb
   IgRpc0l/WFjPNmlyIeADsJNw6auCO08fhv/Zg89CpC9MVerf80YS4ZEQp
   PoOoIMQtq1XfP0sXKgOqn5lYQPpcrg2E71x7oG5xYGb3j27rxpUjyJUhY
   CrnPKcbebOXZ1TGQW/5oPksCfDxBM7EdikSKhuDsU/B/TuvoQvhLNSdGg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="333266922"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="333266922"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 08:42:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="557501103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 08:42:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ns4lx-000HEV-QO;
        Fri, 20 May 2022 18:42:37 +0300
Date:   Fri, 20 May 2022 18:42:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.19-2
Message-ID: <Yoe27fT4S5Z3Xvka@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Last minute fixes to avoid a warning message to fix IRQ chips.
Please pull for v5.19-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 0be0b70df6611205ac392d0e21f7e077f3230ee6:

  pinctrl: alderlake: Fix register offsets for ADL-N variant (2022-04-06 12:54:43 +0300)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.19-2

for you to fetch changes up to 7b923e67a4a76b8e0d7f5eb7688e4546fd9954bc:

  pinctrl: intel: Fix kernel doc format, i.e. add return sections (2022-05-20 17:02:21 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.19-2

* Fix immutable IRQ chip examples in the GPIO documentation
* Make use of immutable IRQ chip in Intel pin control drivers
* Add module alias for Intel Apollo Lake

The following is an automated git shortlog grouped by driver:

baytrail:
 -  make irq_chip immutable

broxton:
 -  Add module alias for Intel Apollo Lake

cherryview:
 -  Use GPIO chip pointer in chv_gpio_irq_mask_unmask()
 -  make irq_chip immutable

Documentation:
 -  gpio: Advertise irqd_to_hwirq() helper in the examples
 -  gpio: Fix IRQ mask and unmask examples

intel:
 -  Fix kernel doc format, i.e. add return sections
 -  Drop unused irqchip member in struct intel_pinctrl
 -  make irq_chip immutable

lynxpoint:
 -  make irq_chip immutable

----------------------------------------------------------------
Andy Shevchenko (11):
      Merge branch 'irq/gpio-immutable' of git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms into intel/pinctrl
      pinctrl: broxton: Add module alias for Intel Apollo Lake
      Documentation: gpio: Fix IRQ mask and unmask examples
      Documentation: gpio: Advertise irqd_to_hwirq() helper in the examples
      pinctrl: baytrail: make irq_chip immutable
      pinctrl: cherryview: make irq_chip immutable
      pinctrl: lynxpoint: make irq_chip immutable
      pinctrl: cherryview: Use GPIO chip pointer in chv_gpio_irq_mask_unmask()
      pinctrl: intel: make irq_chip immutable
      pinctrl: intel: Drop unused irqchip member in struct intel_pinctrl
      pinctrl: intel: Fix kernel doc format, i.e. add return sections

Marc Zyngier (10):
      gpio: Don't fiddle with irqchips marked as immutable
      gpio: Expose the gpiochip_irq_re[ql]res helpers
      gpio: Add helpers to ease the transition towards immutable irq_chip
      gpio: tegra186: Make the irqchip immutable
      gpio: pl061: Make the irqchip immutable
      pinctrl: apple-gpio: Make the irqchip immutable
      pinctrl: msmgpio: Make the irqchip immutable
      pinctrl: amd: Make the irqchip immutable
      gpio: Update TODO to mention immutable irq_chip structures
      Documentation: Update the recommended pattern for GPIO irqchips

 Documentation/driver-api/gpio/driver.rst   | 181 +++++++++++++++++++++++------
 drivers/gpio/TODO                          |  19 +++
 drivers/gpio/gpio-pl061.c                  |  32 +++--
 drivers/gpio/gpio-tegra186.c               |  32 +++--
 drivers/gpio/gpiolib.c                     |  13 ++-
 drivers/pinctrl/intel/pinctrl-baytrail.c   |  42 ++++---
 drivers/pinctrl/intel/pinctrl-broxton.c    |   1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c |  66 ++++++-----
 drivers/pinctrl/intel/pinctrl-intel.c      |  45 ++++---
 drivers/pinctrl/intel/pinctrl-intel.h      |   2 -
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |  26 +++--
 drivers/pinctrl/pinctrl-amd.c              |  11 +-
 drivers/pinctrl/pinctrl-apple-gpio.c       |  29 ++---
 drivers/pinctrl/qcom/pinctrl-msm.c         |  53 +++++----
 include/linux/gpio/driver.h                |  16 +++
 include/linux/irq.h                        |   2 +
 kernel/irq/debugfs.c                       |   1 +
 17 files changed, 409 insertions(+), 162 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


