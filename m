Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A64E6063A7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 16:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiJTO6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 10:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJTO6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 10:58:20 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C37513FDF4
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666277900; x=1697813900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/oChVE9TPQJS0jbpQYJTQ9xAtlrsyQqYf50R8rk5XU=;
  b=lqPEakJQIspWlbW+V0CNvC2jpLuxDwtXn6y+X6MXZCu1nOmnIDmI2tr3
   1Uy1FL7oTc1c6iO2V7LKb6W8amfoxFJjiJe65Pp8/NNv0ly01hFi4EDUa
   2AJo0NY0ABhM+TvokQLsCWV60rMvwBIbb8/mWlC4LXsVFlO7FoBtC6XLO
   x5vHssfK9rDOQ8Bm6shEIGWFwUP3nWdm6+jri7UeFwxs4UZ+b0cDPtQCR
   tiO50e+4Ccq9YOE5QHj4kGBaAWnalimat3yziweOilkxOoKIu81qoPb0Z
   4o5vnkOqnSL6i73EBNAJfVzOlnLLITiT5ghax1iFipWmNUgqagiH6owRm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="368777694"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="368777694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 07:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="580944709"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="580944709"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2022 07:49:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 62066107; Thu, 20 Oct 2022 17:49:36 +0300 (EEST)
Date:   Thu, 20 Oct 2022 17:49:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.1-1
Message-ID: <Y1FgAAHJu/cVNAIC@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

A bunch of cleanups of the pin control and GPIO headers. It has been a couple
of days in Linux Next without any major issue reported, a few fixes are already
incorporated in the respective patches. The idea is that pin control and GPIO
subsystems take it now and we will continue from this for all new code.

Linus, Bart, please pull to your trees.
The tag is signed and can be considered as immutable.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.1-1

for you to fetch changes up to 1053f6a58766ac8eadcb72630262a5a454048479:

  pinctrl: Clean up headers (2022-10-19 18:08:45 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.1-1

* Add missing and remove unused headers in pin control and GPIO drivers
* Revise the pin control and GPIO headers

----------------------------------------------------------------
Andy Shevchenko (50):
      gpio: aspeed: Add missing header(s)
      gpio: arizona: Remove unused header(s)
      gpio: da9052: Remove unused header(s)
      gpio: mockup: Add missing header(s)
      gpio: pca953x: Add missing header(s)
      gpio: pl061: Add missing header(s)
      gpio: reg: Add missing header(s)
      gpio: wm8350: Remove unused header(s)
      gpio: tegra186: Add missing header(s)
      gpiolib: cdev: Add missing header(s)
      gpiolib: Clean up headers
      media: c8sectpfe: Add missing header(s)
      pinctrl: actions: Add missing header(s)
      pinctrl: aspeed: Add missing header(s)
      pinctrl: at91: Add missing header(s)
      pinctrl: axp209: Add missing header(s)
      pinctrl: bcm: Add missing header(s)
      pinctrl: bm1880: Add missing header(s)
      pinctrl: cygnus-mux: Add missing header(s)
      pinctrl: gemini: Add missing header(s)
      pinctrl: imx: Add missing header(s)
      pinctrl: ingenic: Add missing header(s)
      pinctrl: k210: Add missing header(s)
      pinctrl: lochnagar: Add missing header(s)
      pinctrl: lpc18xx: Add missing header(s)
      pinctrl: mediatek: Add missing header(s)
      pinctrl: microchip-sgpio: Add missing header(s)
      pinctrl: mvebu: Add missing header(s)
      pinctrl: npcm7xx: Add missing header(s)
      pinctrl: ocelot: Add missing header(s)
      pinctrl: qcom: Add missing header(s)
      pinctrl: renesas: Add missing header(s)
      pinctrl: samsung: Add missing header(s)
      pinctrl: single: Add missing header(s)
      pinctrl: spear: Add missing header(s)
      pinctrl: sprd: Add missing header(s)
      pinctrl: st: Add missing header(s)
      pinctrl: starfive: Add missing header(s)
      pinctrl: stm32: Add missing header(s)
      pinctrl: stmfx: Add missing header(s)
      pinctrl: sunxi: Add missing header(s)
      pinctrl: tegra: Add missing header(s)
      pinctrl: ti-iodelay: Add missing header(s)
      pinctrl: uniphier: Add missing header(s)
      pinctrl: zynqmp: Add missing header(s)
      pinctrl: cherryview: Add missing header(s)
      pinctrl: lynxpoint: Add missing header(s)
      pinctrl: merrifield: Add missing header(s)
      pinctrl: intel: Add missing header(s)
      pinctrl: Clean up headers

 drivers/gpio/gpio-arizona.c                        |  5 ++--
 drivers/gpio/gpio-aspeed.c                         |  5 ++--
 drivers/gpio/gpio-da9052.c                         |  9 +++----
 drivers/gpio/gpio-mockup.c                         |  1 +
 drivers/gpio/gpio-pca953x.c                        |  3 ++-
 drivers/gpio/gpio-pl061.c                          | 15 ++++++-----
 drivers/gpio/gpio-tegra186.c                       |  3 ++-
 drivers/gpio/gpio-wm8350.c                         |  7 +++--
 drivers/gpio/gpiolib-acpi.h                        | 12 +++++++++
 drivers/gpio/gpiolib-cdev.c                        |  4 ++-
 drivers/gpio/gpiolib-of.h                          | 11 +++++++-
 drivers/gpio/gpiolib-sysfs.h                       |  2 ++
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |  8 +++---
 drivers/pinctrl/actions/pinctrl-owl.c              | 10 ++++---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 13 +++++----
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |  9 ++++---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           | 12 +++++----
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |  8 +++---
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |  8 +++---
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c         |  6 +++--
 drivers/pinctrl/core.c                             | 19 ++++++-------
 drivers/pinctrl/core.h                             | 12 ++++++++-
 drivers/pinctrl/devicetree.h                       |  6 +++++
 drivers/pinctrl/freescale/pinctrl-imx.c            |  8 +++---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |  4 ++-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  6 +++--
 drivers/pinctrl/intel/pinctrl-intel.c              |  6 +++--
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |  6 +++--
 drivers/pinctrl/intel/pinctrl-merrifield.c         |  4 ++-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |  3 +++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |  5 ++++
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              | 14 +++++-----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 11 +++++---
 drivers/pinctrl/pinconf.h                          | 10 +++++++
 drivers/pinctrl/pinctrl-at91-pio4.c                | 10 ++++---
 drivers/pinctrl/pinctrl-at91.c                     | 16 ++++++-----
 drivers/pinctrl/pinctrl-axp209.c                   |  8 +++---
 drivers/pinctrl/pinctrl-bm1880.c                   |  6 +++--
 drivers/pinctrl/pinctrl-gemini.c                   | 12 +++++----
 drivers/pinctrl/pinctrl-ingenic.c                  | 10 ++++---
 drivers/pinctrl/pinctrl-k210.c                     | 12 +++++----
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  6 +++--
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |  4 ++-
 drivers/pinctrl/pinctrl-ocelot.c                   | 10 ++++---
 drivers/pinctrl/pinctrl-single.c                   |  6 ++---
 drivers/pinctrl/pinctrl-st.c                       | 21 +++++++++------
 drivers/pinctrl/pinctrl-stmfx.c                    |  2 ++
 drivers/pinctrl/pinctrl-utils.h                    |  5 ++++
 drivers/pinctrl/pinctrl-zynqmp.c                   |  5 +++-
 drivers/pinctrl/pinmux.c                           | 17 +++++++-----
 drivers/pinctrl/pinmux.h                           | 11 ++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  8 +++---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |  8 +++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  7 +++--
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  8 ++++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |  4 ++-
 drivers/pinctrl/renesas/pinctrl.c                  |  8 +++---
 drivers/pinctrl/samsung/pinctrl-samsung.c          | 11 ++++----
 drivers/pinctrl/spear/pinctrl-spear.c              |  6 +++--
 drivers/pinctrl/sprd/pinctrl-sprd.c                |  6 +++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  3 +++
 drivers/pinctrl/stm32/pinctrl-stm32.c              | 16 ++++++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              | 18 +++++++------
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  6 +++--
 drivers/pinctrl/tegra/pinctrl-tegra.c              |  6 +++--
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |  8 +++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |  8 +++---
 include/linux/gpio.h                               |  2 +-
 include/linux/gpio/aspeed.h                        |  4 +++
 include/linux/gpio/driver.h                        |  2 +-
 include/linux/gpio/gpio-reg.h                      |  4 +++
 include/linux/gpio/machine.h                       |  1 -
 include/linux/pinctrl/consumer.h                   | 31 ++++++++++------------
 include/linux/pinctrl/devinfo.h                    |  6 +++--
 include/linux/pinctrl/machine.h                    |  8 +++---
 include/linux/pinctrl/pinconf-generic.h            | 23 +++++++++-------
 include/linux/pinctrl/pinctrl.h                    | 18 ++++++-------
 include/linux/pinctrl/pinmux.h                     |  5 ++--
 79 files changed, 428 insertions(+), 234 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


