Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97060FB220
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 15:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfKMOGl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 09:06:41 -0500
Received: from mga09.intel.com ([134.134.136.24]:2050 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726190AbfKMOGl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 09:06:41 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 06:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
   d="scan'208";a="198449798"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 13 Nov 2019 06:06:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8C329FD; Wed, 13 Nov 2019 16:06:38 +0200 (EET)
Date:   Wed, 13 Nov 2019 16:06:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.5-1
Message-ID: <20191113140638.GA78145@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Intel pin control fixes for v5.5. Note, some of the commits are duplicated
due to previously sent fixes:
- 4973ddc84264 pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
- 3739898576a1 pinctrl: cherryview: Fix irq_valid_mask calculation
- e58e177392b9 pinctrl: cherryview: Allocate IRQ chip dynamic

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit d6d5df1db6e9d7f8f76d2911707f7d5877251b02:

  Linux 5.4-rc5 (2019-10-27 13:19:19 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.5-1

for you to fetch changes up to 8ae93b5ed9bec003b77c1ffaca852388b8ca490e:

  pinctrl: cherryview: Missed type change to unsigned int (2019-11-07 11:12:10 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.5-1

* Intel Tigerlake pin controller support has been added.
* Miscellaneous fixes to the main and Cherryview drivers.
* Refactoring of the context restoring in the main driver.

The following is an automated git shortlog grouped by driver:

cherryview:
 -  Missed type change to unsigned int
 -  Allocate IRQ chip dynamic
 -  Fix spelling mistake in the comment
 -  Fix irq_valid_mask calculation

intel:
 -  Missed type change to unsigned int
 -  Add Intel Tiger Lake pin controller support
 -  Use helper to restore register values on ->resume()
 -  Drop level from warning to debug in intel_restore_hostown()
 -  Introduce intel_restore_intmask() helper
 -  Introduce intel_restore_hostown() helper
 -  Introduce intel_restore_padcfg() helper
 -  Avoid potential glitches if pin is in GPIO mode

----------------------------------------------------------------
Andy Shevchenko (11):
      pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
      pinctrl: cherryview: Fix spelling mistake in the comment
      pinctrl: cherryview: Allocate IRQ chip dynamic
      pinctrl: intel: Introduce intel_restore_padcfg() helper
      pinctrl: intel: Introduce intel_restore_hostown() helper
      pinctrl: intel: Introduce intel_restore_intmask() helper
      pinctrl: intel: Drop level from warning to debug in intel_restore_hostown()
      pinctrl: intel: Use helper to restore register values on ->resume()
      pinctrl: intel: Add Intel Tiger Lake pin controller support
      pinctrl: intel: Missed type change to unsigned int
      pinctrl: cherryview: Missed type change to unsigned int

Hans de Goede (1):
      pinctrl: cherryview: Fix irq_valid_mask calculation

 drivers/pinctrl/intel/Kconfig              |   7 +
 drivers/pinctrl/intel/Makefile             |   1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c |  32 +-
 drivers/pinctrl/intel/pinctrl-intel.c      | 140 +++++----
 drivers/pinctrl/intel/pinctrl-tigerlake.c  | 454 +++++++++++++++++++++++++++++
 5 files changed, 561 insertions(+), 73 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-tigerlake.c

-- 
With Best Regards,
Andy Shevchenko


