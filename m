Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A8D736DA6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jun 2023 15:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbjFTNqH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Jun 2023 09:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjFTNqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2023 09:46:06 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EEBFC
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jun 2023 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687268765; x=1718804765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSTdMqRnqNTwFcR1kjO/MNdt/BxQObahksaFP1lJce8=;
  b=GJWk2B19hbacrZ59U4Ba0YsCdrchyWHMHYlD8fYxfFSpCxnQQcq6zSGX
   YTWDMd2e5dE/upfPUnoom0mIYxQyiNxhu28XktpIw8PmXjx86hUVYH7kI
   RFw9Uq0jd3AwZw60ssrlZBbv0Kzq0xx9JMgqeKBy1zugaI9kOah7Y54IN
   mkTNoBMkiRHNpXph/kHq544pJQVyrV5tMHhKp87ampf61sMN/pKdIVwxJ
   o1mx2tjZgPzDkChcNa6rIH8VZ6w1Yvcf9z6W5Ma0e/r6ITmuuRLkfmjRQ
   prP86jSMsrU8fVeJmFkZhcwEF+FsCIxiN+I+pM+3tcl1wUzY0OLTV3E+z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="363282807"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="363282807"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:46:04 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="748110148"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="748110148"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2023 06:46:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 76F3C76C; Tue, 20 Jun 2023 16:46:13 +0300 (EEST)
Date:   Tue, 20 Jun 2023 16:46:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 6.5-1
Message-ID: <ZJGtpU3049d0bnfU@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Traditional PR for Intel pin control drivers for v6.5-rc1. This time not so
big with the most important part that fixes use of OPEN DRAIN pin mode in
a few drivers. That was in Linux Next for several weeks. Please pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v6.5-1

for you to fetch changes up to 9314d0530276aba19fd7b1c62b04eccb8e5327bc:

  pinctrl: cherryview: Drop goto label (2023-06-19 17:03:52 +0300)

----------------------------------------------------------------
intel-pinctrl for v6.5-1

* Fix of OPEN DRAIN pin mode setting in a few drivers
* Reduce a scope of spin lock in the Bay Trail driver
* Decrease a code footprint by refactoring in a few drivers
* Expand string choices and reuse that in the Bay Trail driver

The following is an automated git shortlog grouped by driver:

baytrail:
 -  invert if condition
 -  add warning for BYT_VAL_REG retrieval failure
 -  reduce scope of spinlock in ->dbg_show() hook
 -  Use str_hi_lo() helper
 -  Use BIT() in BYT_PULL_ASSIGN_* definitions
 -  Unify style of error and debug messages

cherryview:
 -  Drop goto label
 -  Return correct value if pin in push-pull mode
 -  Don't use IRQ core constanst for invalid IRQ

intel:
 -  refine ->irq_set_type() hook
 -  refine ->set_mux() hook
 -  Add Intel Meteor Lake-S pin controller support

lib/string_helpers:
 -  Add str_high_low() helper
 -  Split out string_choices.h
 -  Add missing header files to MAINTAINERS database

merrifield:
 -  Use BUFCFG_PINMODE_GPIO in ->pin_dbg_show()
 -  Fix open-drain pin mode configuration

moorefield:
 -  Use BUFCFG_PINMODE_GPIO in ->pin_dbg_show()
 -  Fix open-drain pin mode configuration

----------------------------------------------------------------
Andy Shevchenko (14):
      pinctrl: baytrail: Unify style of error and debug messages
      pinctrl: baytrail: Use BIT() in BYT_PULL_ASSIGN_* definitions
      pinctrl: cherryview: Don't use IRQ core constanst for invalid IRQ
      pinctrl: cherryview: Return correct value if pin in push-pull mode
      pinctrl: merrifield: Fix open-drain pin mode configuration
      pinctrl: merrifield: Use BUFCFG_PINMODE_GPIO in ->pin_dbg_show()
      pinctrl: moorefield: Fix open-drain pin mode configuration
      pinctrl: moorefield: Use BUFCFG_PINMODE_GPIO in ->pin_dbg_show()
      pinctrl: intel: Add Intel Meteor Lake-S pin controller support
      lib/string_helpers: Add missing header files to MAINTAINERS database
      lib/string_helpers: Split out string_choices.h
      lib/string_choices: Add str_high_low() helper
      pinctrl: baytrail: Use str_hi_lo() helper
      pinctrl: cherryview: Drop goto label

Raag Jadav (5):
      pinctrl: intel: refine ->set_mux() hook
      pinctrl: intel: refine ->irq_set_type() hook
      pinctrl: baytrail: reduce scope of spinlock in ->dbg_show() hook
      pinctrl: baytrail: add warning for BYT_VAL_REG retrieval failure
      pinctrl: baytrail: invert if condition

 MAINTAINERS                                |   3 +
 drivers/pinctrl/intel/pinctrl-baytrail.c   | 104 +++++++-------
 drivers/pinctrl/intel/pinctrl-cherryview.c |  26 ++--
 drivers/pinctrl/intel/pinctrl-intel.c      |  54 ++++----
 drivers/pinctrl/intel/pinctrl-merrifield.c |  16 ++-
 drivers/pinctrl/intel/pinctrl-meteorlake.c | 212 ++++++++++++++++++++++++++++-
 drivers/pinctrl/intel/pinctrl-moorefield.c |  16 ++-
 include/linux/string_choices.h             |  44 ++++++
 include/linux/string_helpers.h             |  26 +---
 9 files changed, 371 insertions(+), 130 deletions(-)
 create mode 100644 include/linux/string_choices.h

-- 
With Best Regards,
Andy Shevchenko


