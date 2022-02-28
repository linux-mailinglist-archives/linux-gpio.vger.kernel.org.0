Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEAA24C6CCA
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Feb 2022 13:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbiB1Mlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Feb 2022 07:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbiB1Mlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Feb 2022 07:41:42 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A3C4C7A1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Feb 2022 04:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646052063; x=1677588063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RJn9xSnEMf1l71WmeK4be6KeFBBYdNI9H9Kl9Qt0yzE=;
  b=fVCp1odMbIf7oybjz8/x55EcEd0d5gwCLDJHIVJTvYJYkBScKhkEsenA
   9Ck77Imxbhx9Udw5hmB5VPXKBLlhILSLp4VPuVdiNFu9JLSt/1+5/c4ZT
   4IQOXFC5kPmA6C4cPdb6Grn1BtoC3BF1BxICegZiRFdY6f3sTzLBJPR98
   IsN2fd7SS3xXbQ8JVUin0LmgNH81SUiu84r1+pwHA9XuCm6j84m2eUa+Z
   YFHtdHZ8JObuh8Zb+kZ0RkoH9o6Lhs5knZm1+4KUeRiF+ybX5/y25RQSm
   VvFgQl40i90m5ufqEMHFIMG2EKYRby9DX0im0gEfuyQl+3CiDdBbBb7aC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="277529340"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="277529340"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 04:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="507406908"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 28 Feb 2022 04:41:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 10360142; Mon, 28 Feb 2022 14:41:18 +0200 (EET)
Date:   Mon, 28 Feb 2022 14:41:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.18-1
Message-ID: <YhzC7nLsupHmXOo5@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

New Intel pin control drivers for v5.18-rc1. Cooked a few weeks in Linux Next,
no merge conflicts observed.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit e12963c453263d5321a2c610e98cbc731233b685:

  pinctrl: intel: Fix a glitch when updating IRQ flags on a preconfigured line (2022-01-24 16:30:13 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.18-1

for you to fetch changes up to d25478e1d8f9bf9344cf61a9c02fae88d9930f55:

  pinctrl: icelake: Add Ice Lake-N PCH pin controller support (2022-02-23 17:15:11 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.18-1

* Introduce support for Alder Lake-N (required to revert misplaced ID)
* Add support for Raptor Lake-S
* Add support for Ice Lake-N (MacBookPro16,2)
* Miscellaneous fixes

The following is an automated git shortlog grouped by driver:

alderlake:
 -  Add Intel Alder Lake-N pin controller support
 -  Add Raptor Lake-S ACPI ID

baytrail:
 -  Clear direct_irq_en flag on broken configs

icelake:
 -  Add Ice Lake-N PCH pin controller support

intel:
 -  Fix a glitch when updating IRQ flags on a preconfigured line
 -  fix unexpected interrupt

Place correctly CONFIG_PINCTRL_ST in the Makefile:
 - Place correctly CONFIG_PINCTRL_ST in the Makefile

tigerlake:
 -  Revert "Add Alder Lake-M ACPI ID"

----------------------------------------------------------------
Andy Shevchenko (4):
      pinctrl: tigerlake: Revert "Add Alder Lake-M ACPI ID"
      pinctrl: alderlake: Add Raptor Lake-S ACPI ID
      pinctrl: alderlake: Add Intel Alder Lake-N pin controller support
      pinctrl: icelake: Add Ice Lake-N PCH pin controller support

Hans de Goede (1):
      pinctrl: baytrail: Clear direct_irq_en flag on broken configs

 drivers/pinctrl/intel/pinctrl-alderlake.c | 317 +++++++++++++++++++++++++++++-
 drivers/pinctrl/intel/pinctrl-baytrail.c  |  55 +++++-
 drivers/pinctrl/intel/pinctrl-icelake.c   | 291 ++++++++++++++++++++++++++-
 drivers/pinctrl/intel/pinctrl-tigerlake.c |   1 -
 4 files changed, 652 insertions(+), 12 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


