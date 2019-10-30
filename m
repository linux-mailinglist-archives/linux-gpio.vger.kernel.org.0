Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 099B9E95B9
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 05:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfJ3EYG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 00:24:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:25917 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbfJ3EYG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 00:24:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 21:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; 
   d="scan'208";a="203071467"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga003.jf.intel.com with ESMTP; 29 Oct 2019 21:24:02 -0700
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v2 0/2] pinctrl: Add new pinctrl/GPIO driver
Date:   Wed, 30 Oct 2019 12:23:58 +0800
Message-Id: <cover.1572409172.git.rahul.tanwar@linux.intel.com>
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
- Address code quality related review concerns.

v1:
- Initial version.

Rahul Tanwar (2):
  pinctrl: Add pinmux & GPIO controller driver for a new SoC
  dt-bindings: pinctrl: intel: Add for new SoC

 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 114 +++
 drivers/pinctrl/Kconfig                            |  18 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-equilibrium.c              | 957 +++++++++++++++++++++
 drivers/pinctrl/pinctrl-equilibrium.h              | 150 ++++
 5 files changed, 1240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.h

-- 
2.11.0

