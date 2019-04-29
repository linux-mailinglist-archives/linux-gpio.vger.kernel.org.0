Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC243DFF6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 12:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfD2KAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 06:00:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:46330 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727217AbfD2KAL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Apr 2019 06:00:11 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Apr 2019 03:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; 
   d="scan'208";a="227682191"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 29 Apr 2019 03:00:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2E213213; Mon, 29 Apr 2019 13:00:08 +0300 (EEST)
Date:   Mon, 29 Apr 2019 13:00:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.2-1
Message-ID: <20190429100007.GA69386@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

There will be a conflict due to a patch for Intel pin control landed in the
devel pin control queue. Though, it applies cleanly on top of for-next.

I would recommend to drop Intel specific patches from devel queue.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.2-1

for you to fetch changes up to 5f61d9517f17069dbedb94aa71034f0a22e014ef:

  pinctrl: intel: Increase readability of intel_gpio_update_pad_mode() (2019-04-28 20:19:06 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.2-1

Non-critical fixes for Intel Baytrail and Intel Cedarfork.
Couple of fixes for all pinctrl-intel based drivers with regard to
IRQ handling, i.e. moving PM calls to noirq level to avoid IRQ lose
and restore ownership of pins to prevent IRQ masking side effect.

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Fix potential NULL pointer dereference

cedarfork:
 -  Update pin names according to v1.13c

intel:
 -  Increase readability of intel_gpio_update_pad_mode()
 -  Retain HOSTSW_OWN for requested gpio pin
 -  move gpio suspend/resume to noirq phase

----------------------------------------------------------------
Aditya Pakki (1):
      pinctrl: baytrail: Fix potential NULL pointer dereference

Andy Shevchenko (2):
      pinctrl: cedarfork: Update pin names according to v1.13c
      pinctrl: intel: Increase readability of intel_gpio_update_pad_mode()

Binbin Wu (1):
      pinctrl: pinctrl-intel: move gpio suspend/resume to noirq phase

Chris Chiu (1):
      pinctrl: intel: Retain HOSTSW_OWN for requested gpio pin

 drivers/pinctrl/intel/pinctrl-baytrail.c  |  2 +
 drivers/pinctrl/intel/pinctrl-cedarfork.c | 18 ++++-----
 drivers/pinctrl/intel/pinctrl-intel.c     | 66 ++++++++++++++++++++++++++++---
 drivers/pinctrl/intel/pinctrl-intel.h     | 11 +++---
 4 files changed, 78 insertions(+), 19 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


