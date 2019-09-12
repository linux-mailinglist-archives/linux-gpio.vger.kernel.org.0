Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE3A5B09C8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 09:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbfILH7T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 03:59:19 -0400
Received: from mga01.intel.com ([192.55.52.88]:35408 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbfILH7T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Sep 2019 03:59:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 00:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="179287310"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2019 00:59:13 -0700
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
Date:   Thu, 12 Sep 2019 15:59:09 +0800
Message-Id: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This series is to add pinctrl & GPIO controller driver for a new SoC.
Patch 1 adds pinmux & GPIO controller driver.
Patch 2 adds the dt bindings document & include file.

Patches are against Linux 5.3-rc5 at below Git tree:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git


Rahul Tanwar (2):
  pinctrl: Add pinmux & GPIO controller driver for new SoC
  dt-bindings: pinctrl: intel: Add for new SoC

 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        |  131 ++
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-equilibrium.c              | 1377 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-equilibrium.h              |  194 +++
 include/dt-bindings/pinctrl/intel,equilibrium.h    |   23 +
 6 files changed, 1739 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.h
 create mode 100644 include/dt-bindings/pinctrl/intel,equilibrium.h

-- 
2.11.0

