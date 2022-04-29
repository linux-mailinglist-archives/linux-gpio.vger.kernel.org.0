Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E043B5153A7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Apr 2022 20:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380008AbiD2SbW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Apr 2022 14:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380006AbiD2SbS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2022 14:31:18 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E32C74BA
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2022 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651256880; x=1682792880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOkV3YS/buKPuPfn55bt3DbvEnRUPHE2E+/UPIXyK/Q=;
  b=OgzWkKMyXcgmZY1RfJY9hOyPRQg8aUF6JDCLnELq8Uner7g9u5VTw2Zt
   xURbPBYcGZX+AmflkDJ5s07Wm/jt+c5XkButf3glBmkYsSSsTyakUz3nc
   tm5GxBUnr/OWfhUsmGPbh8LAvh1mjh4VDcnky5PEBzhj5y29sc4n/+LjH
   WWUn+J66KKp8IsGV2hseRwLFpC5aymiJ9m01Q0JHN/Uc3+RIXK7Fs/mFA
   tchFcG53jENoUQuGXwERNT1U1QjH2R85ytaPDm7CQ0zbAsNEy8uZWeBc9
   eZHlv1elObxU67xhtbMEop7xfz7+AEWD42pPFF0tm002VL/7Ou2F90J69
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="254124782"
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; 
   d="scan'208";a="254124782"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 11:27:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,186,1647327600"; 
   d="scan'208";a="560490462"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 11:27:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nkVLP-009wZs-JK;
        Fri, 29 Apr 2022 21:27:55 +0300
Date:   Fri, 29 Apr 2022 21:27:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.19-1
Message-ID: <YmwuK60FMGR2Kn0R@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Supposed to be an immutable tag to be included in GPIO and pin control subsystems.
Have been in Linux Next for a while w.o. any issues reported. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 0c2cae09a765b1c1d842eb9328982976ec735926:

  gpiolib: acpi: Convert type for pin to be unsigned (2022-04-08 15:13:22 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.19-1

for you to fetch changes up to edc5601db66411a8c9c6b08b3aacf7e154a34c6d:

  pinctrl: meson: Replace custom code by gpiochip_node_count() call (2022-04-18 16:18:52 +0300)

----------------------------------------------------------------
intel-gpio for v5.19-1

* Introduce helpers to iterate over GPIO chip nodes and covert some drivers

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  Introduce a helper to get first GPIO controller node
 -  Introduce gpiochip_node_count() helper
 -  Introduce for_each_gpiochip_node() loop helper

pinctrl:
 -  meson: Replace custom code by gpiochip_node_count() call
 -  meson: Enable COMPILE_TEST
 -  meson: Rename REG_* to MESON_REG_*
 -  armada-37xx: Reuse GPIO fwnode in armada_37xx_irqchip_register()
 -  armada-37xx: Switch to use fwnode instead of of_node
 -  samsung: Switch to use for_each_gpiochip_node() helper
 -  samsung: Drop redundant node parameter in samsung_banks_of_node_get()
 -  npcm7xx: Switch to use for_each_gpiochip_node() helper
 -  renesas: rza1: Switch to use for_each_gpiochip_node() helper
 -  renesas: rza1: Replace custom code by gpiochip_node_count() call
 -  stm32: Switch to use for_each_gpiochip_node() helper
 -  stm32: Replace custom code by gpiochip_node_count() call

----------------------------------------------------------------
Andy Shevchenko (15):
      gpiolib: Introduce for_each_gpiochip_node() loop helper
      gpiolib: Introduce gpiochip_node_count() helper
      pinctrl: stm32: Replace custom code by gpiochip_node_count() call
      pinctrl: stm32: Switch to use for_each_gpiochip_node() helper
      pinctrl: renesas: rza1: Replace custom code by gpiochip_node_count() call
      pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper
      pinctrl: npcm7xx: Switch to use for_each_gpiochip_node() helper
      pinctrl: samsung: Drop redundant node parameter in samsung_banks_of_node_get()
      pinctrl: samsung: Switch to use for_each_gpiochip_node() helper
      gpiolib: Introduce a helper to get first GPIO controller node
      pinctrl: armada-37xx: Switch to use fwnode instead of of_node
      pinctrl: armada-37xx: Reuse GPIO fwnode in armada_37xx_irqchip_register()
      pinctrl: meson: Rename REG_* to MESON_REG_*
      pinctrl: meson: Enable COMPILE_TEST
      pinctrl: meson: Replace custom code by gpiochip_node_count() call

 drivers/pinctrl/meson/Kconfig               |   2 +-
 drivers/pinctrl/meson/pinctrl-meson.c       |  52 +++++-----
 drivers/pinctrl/meson/pinctrl-meson.h       |  28 +++---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  34 ++-----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c   | 142 ++++++++++++----------------
 drivers/pinctrl/renesas/pinctrl-rza1.c      |  47 +++------
 drivers/pinctrl/samsung/pinctrl-exynos.c    |   8 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c   |   2 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c   |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c   |  30 +++---
 drivers/pinctrl/samsung/pinctrl-samsung.h   |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c       |  80 +++++++---------
 include/linux/gpio/driver.h                 |  28 +++++-
 13 files changed, 210 insertions(+), 249 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


