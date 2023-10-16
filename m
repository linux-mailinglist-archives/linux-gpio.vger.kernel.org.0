Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C32F7CAA58
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Oct 2023 15:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbjJPNsk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Oct 2023 09:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbjJPNsM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2023 09:48:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114A61B2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2023 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697464073; x=1729000073;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a0E5sdVGcy7M/dWG1h+jopY694zeOw/IaGh7DTr6DeY=;
  b=lpjZf8YIM/BNSqv0EMtUbAECuNP3R9tTtcrw8yF716fxvyxbUGXNHzRd
   Sh8IZDQzu7w3VF5JdmEKMurLQxLo4oE/lBYhdP2kFjqCmiQTRh/WBgz/u
   ZL/d1qeioPHZHVgcOKNG7Ssf6UnBJwIwStBqsiN+ZrCp4cPhuJfzBmTJB
   xPzFVrJ7arCT+uF6sIaX+jpeXEHJx3M9uI/UV/1B3U61nXQA3z7PLnvMU
   QWUthi3zHsfxBZ761RG61BvAyOcog14LT5IdVNRV1L1wqHTRzl+ZgIQQm
   4wMBdK45oPcs4tDU5QFcytxVlY7u8SANSik9439qSADqCfUROMHC/LZcr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4140200"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4140200"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 06:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002938899"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="1002938899"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 16 Oct 2023 06:47:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CD50A11D; Mon, 16 Oct 2023 16:47:49 +0300 (EEST)
Date:   Mon, 16 Oct 2023 16:47:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.7-1
Message-ID: <ZS0_BUDLXtFRT29X@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Medium sized update for Intel pin control drivers. Was at least a week
in the Linux Next without any reported problems, please pull for v6.7-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.7-1

for you to fetch changes up to 8d751da9f1d790f1d5e4b109eb0ad4a366d5efc8:

  pinctrl: intel: fetch community only when we need it (2023-10-11 23:40:56 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.7-1

* Merge "Drop runtime PM support for Baytrail and Lynxpoint pinctrl" (Raag)
* Small improvements here and there in the Intel pin control drivers (Raag)
* Switch to RAII for locking in the Intel core and Cherry View drivers
* Enable non-ACPI enumeration in the Intel Denverton driver
* Use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS() in a couple of drivers
* Introduce array_size.h and use in in the Intel pin control drivers

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Replace kernel.h by what is actually being used
 -  drop runtime PM support
 -  fix debounce disable case

broxton:
 -  Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()

cherryview:
 -  reduce scope of PIN_CONFIG_BIAS_HIGH_IMPEDANCE case
 -  Convert to platform remove callback returning void
 -  Simplify code with cleanup helpers
 -  Avoid duplicated I/O
 -  Replace kernel.h by what is actually being used

denverton:
 -  Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
 -  Enable platform device in the absence of ACPI enumeration

intel:
 -  fetch community only when we need it
 -  refine intel_config_set_pull() function
 -  Replace kernel.h by what is actually being used
 -  Simplify code with cleanup helpers

lynxpoint:
 -  Replace kernel.h by what is actually being used
 -  drop runtime PM support

merrifield:
 -  Replace kernel.h by what is actually being used

moorefield:
 -  Replace kernel.h by what is actually being used

----------------------------------------------------------------
Alejandro Colomar (1):
      kernel.h: Move ARRAY_SIZE() to a separate header

Andy Shevchenko (14):
      pinctrl: intel: Simplify code with cleanup helpers
      pinctrl: denverton: Enable platform device in the absence of ACPI enumeration
      pinctrl: Replace kernel.h by what is actually being used
      pinctrl: intel: Replace kernel.h by what is actually being used
      Merge patch series "Drop runtime PM support for Baytrail and Lynxpoint pinctrl"
      pinctrl: baytrail: Replace kernel.h by what is actually being used
      pinctrl: cherryview: Replace kernel.h by what is actually being used
      pinctrl: lynxpoint: Replace kernel.h by what is actually being used
      pinctrl: merrifield: Replace kernel.h by what is actually being used
      pinctrl: moorefield: Replace kernel.h by what is actually being used
      pinctrl: broxton: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      pinctrl: denverton: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
      pinctrl: cherryview: Avoid duplicated I/O
      pinctrl: cherryview: Simplify code with cleanup helpers

Raag Jadav (6):
      pinctrl: baytrail: fix debounce disable case
      pinctrl: baytrail: drop runtime PM support
      pinctrl: lynxpoint: drop runtime PM support
      pinctrl: intel: refine intel_config_set_pull() function
      pinctrl: cherryview: reduce scope of PIN_CONFIG_BIAS_HIGH_IMPEDANCE case
      pinctrl: intel: fetch community only when we need it

Uwe Kleine-König (1):
      pinctrl: cherryview: Convert to platform remove callback returning void

 drivers/pinctrl/core.c                     |   2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c   |  32 ++---
 drivers/pinctrl/intel/pinctrl-broxton.c    |   3 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c | 157 +++++++++--------------
 drivers/pinctrl/intel/pinctrl-denverton.c  |   7 ++
 drivers/pinctrl/intel/pinctrl-intel.c      | 194 ++++++++++++-----------------
 drivers/pinctrl/intel/pinctrl-intel.h      |   2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  |  34 +----
 drivers/pinctrl/intel/pinctrl-merrifield.c |   2 +-
 drivers/pinctrl/intel/pinctrl-moorefield.c |   2 +-
 drivers/pinctrl/pinconf-generic.c          |  16 +--
 drivers/pinctrl/pinconf.c                  |  14 ++-
 drivers/pinctrl/pinctrl-utils.c            |   6 +-
 drivers/pinctrl/pinmux.c                   |   2 +-
 include/linux/array_size.h                 |  13 ++
 include/linux/kernel.h                     |   7 +-
 include/linux/pinctrl/machine.h            |   2 +-
 include/linux/string.h                     |   1 +
 18 files changed, 204 insertions(+), 292 deletions(-)
 create mode 100644 include/linux/array_size.h

-- 
With Best Regards,
Andy Shevchenko


