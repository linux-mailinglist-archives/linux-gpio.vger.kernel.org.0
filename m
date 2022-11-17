Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8004362D947
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbiKQLUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239359AbiKQLUJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:20:09 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1719F2B1BA
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668684008; x=1700220008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XhnF+axqA1zHWqpzx9+jUGbGFanMBd7y0Idct9XsTNo=;
  b=YkzkJD/Hx2r9pKsCOT4JpKwFkEHqcP7J15Nvw7XOug2Dtbtn/fXlV8o2
   YuWTF38xOYgKBDvTeS6TJjkfbAgyv+ijna3Q+GblcXwW1YSlO/Q/4r2CM
   asFmkL9RlCQjhGrM418FT2R7joY0MaNNrAp5Z9TgKjewTIDe7EXbERbED
   cgpikFISqaoaOoGtURO8d1MGKQdPboRNA6jNOF0zF2i2e57guAZHjYaoY
   N2IaKKE3U/AatT3L46Oe3AbnNANGIRnUJTsu4OFX6wDOoGCbdvWtNxJM0
   owdx3t0RRsvhsGP0Rx48lCVvvHjIUtOLEHee1EuIauLQy421T1y+xWENd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="310455120"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="310455120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 03:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="639767564"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="639767564"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2022 03:20:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 04D8F2B7; Thu, 17 Nov 2022 13:20:30 +0200 (EET)
Date:   Thu, 17 Nov 2022 13:20:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.2-1
Message-ID: <Y3YY/m0F/Rh0jUc7@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

After headers cleanup, this is more focused on the Intel pin control drivers,
and has been in the Linux Next for a couple of weeks without any problem
reported. Please pull for v6.2 cycle!

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.2-1

for you to fetch changes up to b14ef61314b37a4a720a1f5686627d5061387480:

  pinctrl: intel: Add Intel Moorefield pin controller support (2022-11-08 16:28:17 +0200)

----------------------------------------------------------------
intel-pinctrl for v6.2-1

* Add Intel Moorefield pin control driver
* Deduplicate COMMUNITY() macro in the Intel pin control drivers
* Switch Freescale GPIO driver to use fwnode instead of of_node
* Miscellaneous clenups here and there

The following is an automated git shortlog grouped by driver:

alderlake:
 -  Deduplicate COMMUNITY macro code

cannonlake:
 -  Deduplicate COMMUNITY macro code

device property:
 -  Introduce fwnode_device_is_compatible() helper

icelake:
 -  Deduplicate COMMUNITY macro code

intel:
 -  Add Intel Moorefield pin controller support
 -  Use temporary variable for struct device
 -  Use str_enable_disable() helper

merrifield:
 -  Use temporary variable for struct device

qcom:
 -  lpass-lpi: Add missed bitfield.h

soc:
 -  fsl: qe: Switch to use fwnode instead of of_node

sunrisepoint:
 -  Deduplicate COMMUNITY macro code

tigerlake:
 -  Deduplicate COMMUNITY macro code

----------------------------------------------------------------
Andy Shevchenko (65):
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
      pinctrl: apple-gpio: Add missing header(s)
      pinctrl: aspeed: Add missing header(s)
      pinctrl: at91: Add missing header(s)
      pinctrl: axp209: Add missing header(s)
      pinctrl: bcm: Add missing header(s)
      pinctrl: bm1880: Add missing header(s)
      pinctrl: cirrus: Add missing header(s)
      pinctrl: cy8c95x0: Add missing header(s)
      pinctrl: gemini: Add missing header(s)
      pinctrl: imx: Add missing header(s)
      pinctrl: ingenic: Add missing header(s)
      pinctrl: k210: Add missing header(s)
      pinctrl: lantiq: Add missing header(s)
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
      pinctrl: alderlake: Deduplicate COMMUNITY macro code
      pinctrl: cannonlake: Deduplicate COMMUNITY macro code
      pinctrl: icelake: Deduplicate COMMUNITY macro code
      pinctrl: sunrisepoint: Deduplicate COMMUNITY macro code
      pinctrl: tigerlake: Deduplicate COMMUNITY macro code
      pinctrl: intel: Use str_enable_disable() helper
      pinctrl: qcom: lpass-lpi: Add missed bitfield.h
      device property: Introduce fwnode_device_is_compatible() helper
      soc: fsl: qe: Switch to use fwnode instead of of_node
      pinctrl: intel: Use temporary variable for struct device
      pinctrl: merrifield: Use temporary variable for struct device
      pinctrl: intel: Add Intel Moorefield pin controller support

 drivers/gpio/gpio-arizona.c                        |   5 +-
 drivers/gpio/gpio-aspeed.c                         |   5 +-
 drivers/gpio/gpio-da9052.c                         |   9 +-
 drivers/gpio/gpio-mockup.c                         |   1 +
 drivers/gpio/gpio-pca953x.c                        |   3 +-
 drivers/gpio/gpio-pl061.c                          |  15 +-
 drivers/gpio/gpio-tegra186.c                       |   3 +-
 drivers/gpio/gpio-wm8350.c                         |   7 +-
 drivers/gpio/gpiolib-acpi.h                        |  12 +
 drivers/gpio/gpiolib-cdev.c                        |   4 +-
 drivers/gpio/gpiolib-of.h                          |  11 +-
 drivers/gpio/gpiolib-sysfs.h                       |   2 +
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |   8 +-
 drivers/pinctrl/actions/pinctrl-owl.c              |  10 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             |  13 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |   9 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |  12 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |   8 +-
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |   8 +-
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c         |   6 +-
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |   5 +-
 drivers/pinctrl/core.c                             |  19 +-
 drivers/pinctrl/core.h                             |  12 +-
 drivers/pinctrl/devicetree.h                       |   6 +
 drivers/pinctrl/freescale/pinctrl-imx.c            |   8 +-
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |   4 +-
 drivers/pinctrl/freescale/pinctrl-mxs.c            |   7 +-
 drivers/pinctrl/intel/Kconfig                      |  11 +
 drivers/pinctrl/intel/Makefile                     |   1 +
 drivers/pinctrl/intel/pinctrl-alderlake.c          |  40 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |   8 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |   6 +-
 drivers/pinctrl/intel/pinctrl-icelake.c            |   8 +-
 drivers/pinctrl/intel/pinctrl-intel.c              |  32 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |   6 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |  19 +-
 drivers/pinctrl/intel/pinctrl-moorefield.c         | 916 +++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |  32 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |  28 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   3 +
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   5 +
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              |  14 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |  11 +-
 drivers/pinctrl/pinconf.h                          |  10 +
 drivers/pinctrl/pinctrl-apple-gpio.c               |   7 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |  10 +-
 drivers/pinctrl/pinctrl-at91.c                     |  16 +-
 drivers/pinctrl/pinctrl-axp209.c                   |   8 +-
 drivers/pinctrl/pinctrl-bm1880.c                   |   6 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |   1 +
 drivers/pinctrl/pinctrl-falcon.c                   |   9 +-
 drivers/pinctrl/pinctrl-gemini.c                   |  12 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |  10 +-
 drivers/pinctrl/pinctrl-k210.c                     |  12 +-
 drivers/pinctrl/pinctrl-lantiq.c                   |   5 +-
 drivers/pinctrl/pinctrl-lantiq.h                   |   7 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |   6 +-
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |   4 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |  10 +-
 drivers/pinctrl/pinctrl-single.c                   |   6 +-
 drivers/pinctrl/pinctrl-st.c                       |  21 +-
 drivers/pinctrl/pinctrl-stmfx.c                    |   2 +
 drivers/pinctrl/pinctrl-utils.h                    |   5 +
 drivers/pinctrl/pinctrl-zynqmp.c                   |   5 +-
 drivers/pinctrl/pinmux.c                           |  17 +-
 drivers/pinctrl/pinmux.h                           |  11 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |   5 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |   9 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  25 +-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |   5 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |   8 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |   8 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |  18 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |  18 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |   7 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |   8 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |   4 +-
 drivers/pinctrl/renesas/pinctrl.c                  |   8 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  11 +-
 drivers/pinctrl/spear/pinctrl-spear.c              |   6 +-
 drivers/pinctrl/sprd/pinctrl-sprd.c                |   7 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |   3 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |  16 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |  18 +-
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |   7 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c              |   6 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c            |   8 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c   |   8 +-
 drivers/soc/fsl/qe/gpio.c                          |   4 +-
 include/linux/gpio.h                               |   2 +-
 include/linux/gpio/aspeed.h                        |   4 +
 include/linux/gpio/driver.h                        |   2 +-
 include/linux/gpio/gpio-reg.h                      |   4 +
 include/linux/gpio/machine.h                       |   1 -
 include/linux/pinctrl/consumer.h                   |  31 +-
 include/linux/pinctrl/devinfo.h                    |   6 +-
 include/linux/pinctrl/machine.h                    |   8 +-
 include/linux/pinctrl/pinconf-generic.h            |  23 +-
 include/linux/pinctrl/pinctrl.h                    |  18 +-
 include/linux/pinctrl/pinmux.h                     |   5 +-
 include/linux/property.h                           |  10 +-
 102 files changed, 1522 insertions(+), 362 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-moorefield.c

-- 
With Best Regards,
Andy Shevchenko


