Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13038F43A3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 10:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbfKHJmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 04:42:31 -0500
Received: from mga09.intel.com ([134.134.136.24]:44316 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728513AbfKHJmb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Nov 2019 04:42:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 01:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; 
   d="scan'208";a="213213601"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by fmsmga001.fm.intel.com with ESMTP; 08 Nov 2019 01:42:27 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v5 0/2] pinctrl: Add new pinctrl/GPIO driver
Date:   Fri,  8 Nov 2019 17:42:21 +0800
Message-Id: <cover.1573196057.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series is to add pinctrl & GPIO controller driver for a new SoC.
Patch 1 adds pinmux & GPIO controller driver.
Patch 2 adds the corresponding dt bindings YAML document.

Patches are against Linux 5.4-rc1 at below Git tree:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git

v5:
- Fix code style/readability related review concerns.
- Change data type of groups property to uint32-array in dt bindings.

v4:
- Correct data types for some pin config properties in dt bindings.
- Improve pattern regex as per review feedback in dt bindings.
- Remove eqbr_set_val() & set_drv_cur() reg update routines & instead
  do reg updates in eqbr_pinconf_set() routine itself.
- Add locking in few ops where it was missing.
- Rename eqbr_gpio_desc struct to eqbr_gpio_ctrl and avoid using desc
  in variable namings so as not to confuse with GPIO descriptors.
- Address code quality/convention/style related review concerns.

v3:
- Add locking for GPIO IRQ ops.
- Fix property naming mistake in dt bindings document.
- Address other code quality related review concerns.
- Fix a build error reported by kbuild test robot.
- Remove deleted structure fields from comments.

v2:
- Enable GENERIC_PINMUX_FUNCTIONS & GENERIC_PINCTRL_GROUPS and use core
  provided code for pinmux_ops & pinctrl_ops. Remove related code from
  the driver.
- Enable GENERIC_PINCONF & use core provided pinconf code. Remove related
  code from the driver.
- Use GPIOLIB_IRQCHIP framework core code instead of implementing separtely
  in the driver.
- Enable GPIO_GENERIC and switch to core provided memory mapped GPIO banks
  design. 
- Use standard pinctrl DT properties instead of custom made properties.
- Address review concerns for dt bindings document.
- Address code quality related review concerns.

v1:
- Initial version.

Rahul Tanwar (2):
  pinctrl: Add pinmux & GPIO controller driver for a new SoC
  dt-bindings: pinctrl: intel: Add for new SoC

 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 104 +++
 drivers/pinctrl/Kconfig                            |  18 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-equilibrium.c              | 962 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-equilibrium.h              | 144 +++
 5 files changed, 1229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.h

-- 
2.11.0

