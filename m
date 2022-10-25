Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B60060CD95
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 15:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbiJYNeP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 09:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiJYNeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 09:34:14 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756071905C7
        for <linux-gpio@vger.kernel.org>; Tue, 25 Oct 2022 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666704853; x=1698240853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cpi/qJWZoqCSdwWWbu4kWtfSDbNVmgMytX45itX3Q+k=;
  b=oC2Cn7gDi9H+gD3s+1wn017sEWun9U+E3xglI8I8j0CDoJME2jwUW27R
   L3vd3RsrTjfVo6wbqnqHGpZ66GvNiOIJ1en9Im5KDD24GVRJzvWIXQ62T
   GIRGjifW5p1EC8ozdNSCz21UV9YL0K/X5gE5RJLbszy/q5zNAoacF+o8q
   kBNyxTHtkwYwJlMMcxlhvVjfwKOeswWPkpRCrnEKpY9EmxpwYgMl/izpa
   Oi5zFPbWkisRKCq18hT8sBDbKgINwht2/oGAjKgreDy8fLVs3b+9GwJ4d
   qKnV3Wt2ywTSMVgsHY/nIWUHK5czjpN5Tng4oyuZ94bLaYBI9Ly4ZMBH8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287392505"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="287392505"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 06:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="631629733"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="631629733"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 25 Oct 2022 06:34:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AFE533F9; Tue, 25 Oct 2022 16:34:33 +0300 (EEST)
Date:   Tue, 25 Oct 2022 16:34:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.1-2
Message-ID: <Y1fl6ZaTNa7L6QfQ@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control and GPIO maintainers,

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

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.1-2

for you to fetch changes up to e5530adc17a79f2a93e8b35e0ce673fc33f5f663:

  pinctrl: Clean up headers (2022-10-24 17:06:48 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.1-2

* Add missing and remove unused headers in the pin control and GPIO drivers
* Revise the pin control and GPIO headers

----------------------------------------------------------------
Andy Shevchenko (53):
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
 drivers/pinctrl/cirrus/pinctrl-madera-core.c       |  5 ++--
 drivers/pinctrl/core.c                             | 19 ++++++-------
 drivers/pinctrl/core.h                             | 12 ++++++++-
 drivers/pinctrl/devicetree.h                       |  6 +++++
 drivers/pinctrl/freescale/pinctrl-imx.c            |  8 +++---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c      |  4 ++-
 drivers/pinctrl/freescale/pinctrl-mxs.c            |  7 +++--
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  6 +++--
 drivers/pinctrl/intel/pinctrl-intel.c              |  6 +++--
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |  6 +++--
 drivers/pinctrl/intel/pinctrl-merrifield.c         |  4 ++-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |  3 +++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |  5 ++++
 drivers/pinctrl/mvebu/pinctrl-mvebu.c              | 14 +++++-----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          | 11 +++++---
 drivers/pinctrl/pinconf.h                          | 10 +++++++
 drivers/pinctrl/pinctrl-apple-gpio.c               |  7 +++--
 drivers/pinctrl/pinctrl-at91-pio4.c                | 10 ++++---
 drivers/pinctrl/pinctrl-at91.c                     | 16 ++++++-----
 drivers/pinctrl/pinctrl-axp209.c                   |  8 +++---
 drivers/pinctrl/pinctrl-bm1880.c                   |  6 +++--
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |  1 +
 drivers/pinctrl/pinctrl-falcon.c                   |  9 ++++---
 drivers/pinctrl/pinctrl-gemini.c                   | 12 +++++----
 drivers/pinctrl/pinctrl-ingenic.c                  | 10 ++++---
 drivers/pinctrl/pinctrl-k210.c                     | 12 +++++----
 drivers/pinctrl/pinctrl-lantiq.c                   |  5 ++--
 drivers/pinctrl/pinctrl-lantiq.h                   |  7 ++---
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
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |  4 +++
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h           |  9 +++++--
 drivers/pinctrl/qcom/pinctrl-msm.c                 | 25 +++++++++--------
 drivers/pinctrl/qcom/pinctrl-msm.h                 |  5 ++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  8 +++---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |  8 +++---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           | 18 +++++++------
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            | 18 +++++++------
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  7 +++--
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  8 ++++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c            |  4 ++-
 drivers/pinctrl/renesas/pinctrl.c                  |  8 +++---
 drivers/pinctrl/samsung/pinctrl-samsung.c          | 11 ++++----
 drivers/pinctrl/spear/pinctrl-spear.c              |  6 +++--
 drivers/pinctrl/sprd/pinctrl-sprd.c                |  7 +++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  3 +++
 drivers/pinctrl/stm32/pinctrl-stm32.c              | 16 ++++++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              | 18 +++++++------
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  7 +++--
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
 92 files changed, 506 insertions(+), 278 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


