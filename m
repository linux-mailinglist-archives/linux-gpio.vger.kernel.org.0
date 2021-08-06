Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B713E2722
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 11:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244214AbhHFJUt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 05:20:49 -0400
Received: from mga02.intel.com ([134.134.136.20]:18440 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243821AbhHFJUs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Aug 2021 05:20:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="201510901"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="201510901"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 02:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="420677272"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 06 Aug 2021 02:20:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 032B815E; Fri,  6 Aug 2021 12:13:57 +0300 (EEST)
Date:   Fri, 6 Aug 2021 12:13:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.14-2
Message-ID: <YQz9VXAHPcvQOSi2@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

One fix for number of bug reports. Should go as soon as possible to v5.14.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.14-2

for you to fetch changes up to 2f658f7a3953f6d70bab90e117aff8d0ad44e200:

  pinctrl: tigerlake: Fix GPIO mapping for newer version of software (2021-08-04 18:47:50 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.14-2

* Fix the software mapping of GPIOs on Intel Tiger Lake-H

The following is an automated git shortlog grouped by driver:

tigerlake:
 -  Fix GPIO mapping for newer version of software

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: tigerlake: Fix GPIO mapping for newer version of software

 drivers/pinctrl/intel/pinctrl-tigerlake.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


