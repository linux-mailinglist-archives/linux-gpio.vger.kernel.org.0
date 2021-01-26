Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90A9303D1F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 13:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391392AbhAZMjQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 07:39:16 -0500
Received: from mga03.intel.com ([134.134.136.65]:47772 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728794AbhAZMjK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 07:39:10 -0500
IronPort-SDR: 9X/Ujf1+/mzqowE9kLrSbGllICZ+bsFK+UmSudcujWdy65SYiJ58dYBWdpxhS+6bN3/EV7Lu4Y
 HUOjJ3rU1nVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="179973781"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="179973781"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 04:37:14 -0800
IronPort-SDR: xtjAOkynaLHfXe5zpBV18SvsRxeKacFBYCOy6xM8lMumXM5JOU1r74QRBgpcyA2Zh5et8mJjjw
 QBmmY7umAlQw==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="406691221"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 04:37:10 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l4Nbo-00EOdg-F6; Tue, 26 Jan 2021 14:38:12 +0200
Date:   Tue, 26 Jan 2021 14:38:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
Message-ID: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi guys,

This is first part of Intel MID outdated platforms removal. It's collected into
immutable branch with a given tag, please pull to yours subsystems.

(All changes are tagged by the respective maintainers)

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.infradead.org/linux-platform-drivers-x86.git tags/ib-drm-gpio-pdx86-rtc-wdt-v5.12-1

for you to fetch changes up to a507e5d90f3d6846a02d9c2c79e6f6395982db92:

  platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison (2021-01-25 20:05:32 +0200)

----------------------------------------------------------------
ib-drm-gpio-pdx86-rtc-wdt for v5.12-1

First part of Intel MID outdated platforms removal.

The following is an automated git shortlog grouped by driver:

drm/gma500:
 -  Get rid of duplicate NULL checks
 -  Convert to use new SCU IPC API

gpio:
 -  msic: Remove driver for deprecated platform
 -  intel-mid: Remove driver for deprecated platform

intel_mid_powerbtn:
 -  Remove driver for deprecated platform

intel_mid_thermal:
 -  Remove driver for deprecated platform

intel_scu_wdt:
 -  Get rid of custom x86 model comparison
 -  Drop SCU notification
 -  Move driver from arch/x86

rtc:
 -  mrst: Remove driver for deprecated platform

watchdog:
 -  intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
 -  intel_scu_watchdog: Remove driver for deprecated platform

----------------------------------------------------------------
Andy Shevchenko (12):
      drm/gma500: Convert to use new SCU IPC API
      drm/gma500: Get rid of duplicate NULL checks
      gpio: intel-mid: Remove driver for deprecated platform
      gpio: msic: Remove driver for deprecated platform
      platform/x86: intel_mid_thermal: Remove driver for deprecated platform
      platform/x86: intel_mid_powerbtn: Remove driver for deprecated platform
      rtc: mrst: Remove driver for deprecated platform
      watchdog: intel_scu_watchdog: Remove driver for deprecated platform
      watchdog: intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
      platform/x86: intel_scu_wdt: Move driver from arch/x86
      platform/x86: intel_scu_wdt: Drop SCU notification
      platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison

 MAINTAINERS                                        |   2 -
 arch/x86/platform/intel-mid/device_libs/Makefile   |   1 -
 drivers/gpio/Kconfig                               |  14 -
 drivers/gpio/Makefile                              |   1 -
 drivers/gpio/TODO                                  |   2 +-
 drivers/gpio/gpio-intel-mid.c                      | 414 ---------------
 drivers/gpio/gpio-msic.c                           | 314 ------------
 drivers/gpu/drm/gma500/Kconfig                     |   1 +
 drivers/gpu/drm/gma500/mdfld_device.c              |   2 -
 drivers/gpu/drm/gma500/mdfld_dsi_output.c          |   2 -
 drivers/gpu/drm/gma500/mdfld_output.c              |   8 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |   3 -
 drivers/gpu/drm/gma500/psb_drv.h                   |   3 +
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c         |  30 +-
 drivers/platform/x86/Kconfig                       |  23 +-
 drivers/platform/x86/Makefile                      |   3 +-
 drivers/platform/x86/intel_mid_powerbtn.c          | 233 ---------
 drivers/platform/x86/intel_mid_thermal.c           | 560 ---------------------
 .../platform/x86/intel_scu_wdt.c                   |  41 +-
 drivers/rtc/Kconfig                                |  12 -
 drivers/rtc/Makefile                               |   1 -
 drivers/rtc/rtc-mrst.c                             | 521 -------------------
 drivers/watchdog/Kconfig                           |   9 -
 drivers/watchdog/Makefile                          |   1 -
 drivers/watchdog/intel-mid_wdt.c                   |   8 +-
 drivers/watchdog/intel_scu_watchdog.c              | 533 --------------------
 drivers/watchdog/intel_scu_watchdog.h              |  50 --
 27 files changed, 54 insertions(+), 2738 deletions(-)
 delete mode 100644 drivers/gpio/gpio-intel-mid.c
 delete mode 100644 drivers/gpio/gpio-msic.c
 delete mode 100644 drivers/platform/x86/intel_mid_powerbtn.c
 delete mode 100644 drivers/platform/x86/intel_mid_thermal.c
 rename arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c => drivers/platform/x86/intel_scu_wdt.c (69%)
 delete mode 100644 drivers/rtc/rtc-mrst.c
 delete mode 100644 drivers/watchdog/intel_scu_watchdog.c
 delete mode 100644 drivers/watchdog/intel_scu_watchdog.h

-- 
With Best Regards,
Andy Shevchenko


