Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB874EF5B2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 07:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387561AbfKEGtu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 01:49:50 -0500
Received: from mga02.intel.com ([134.134.136.20]:10735 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbfKEGtt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 01:49:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 22:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; 
   d="scan'208";a="204878425"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga003.jf.intel.com with ESMTP; 04 Nov 2019 22:49:45 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v3 0/2] pinctrl: Add new pinctrl/GPIO driver
Date:   Tue,  5 Nov 2019 14:49:41 +0800
Message-Id: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
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

 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 114 +++
 drivers/pinctrl/Kconfig                            |  18 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-equilibrium.c              | 964 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-equilibrium.h              | 141 +++
 5 files changed, 1238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.h

-- 
2.11.0

