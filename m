Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE08303F47
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 14:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405360AbhAZNt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 08:49:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:50000 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405323AbhAZNtz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 08:49:55 -0500
IronPort-SDR: j5T3mCqvbdVcWMQQdfB1pzgRsFch4h6O28M14kETp+wZPhQBTBFZgMGss/H3MxL8Klu+TkjyfL
 l3TcGUlNoUWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="241431449"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="241431449"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 05:49:14 -0800
IronPort-SDR: mJk/x5Gy53qxCI3lJwuYwwGt6fSLVDyZZu9h2+JXkxQwV3SDEWKn1oRXPkKM3EG+jvrcyKsrre
 RmiGC3u8zbrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="429715819"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 26 Jan 2021 05:49:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5A813173; Tue, 26 Jan 2021 15:49:12 +0200 (EET)
Date:   Tue, 26 Jan 2021 15:49:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.12-1
Message-ID: <YBAd2HT9LFIugxEo@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Rather quite cycle from Intel pin control perspective. Please pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.12-1

for you to fetch changes up to 0e793a4e283487378e9a5b7db37bc1781bc72fd7:

  pinctrl: tigerlake: Add Alder Lake-P ACPI ID (2021-01-08 16:04:50 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.12-1

* Enable pin control on Intel Alder Lake-P
* Traverse through capabilities, convert them to features for the future use

The following is an automated git shortlog grouped by driver:

intel:
 -  Convert capability list to features
 -  Drop unnecessary check for predefined features
 -  Split intel_pinctrl_add_padgroups() for better maintenance

tigerlake:
 -  Add Alder Lake-P ACPI ID

----------------------------------------------------------------
Andy Shevchenko (4):
      pinctrl: intel: Split intel_pinctrl_add_padgroups() for better maintenance
      pinctrl: intel: Drop unnecessary check for predefined features
      pinctrl: intel: Convert capability list to features
      pinctrl: tigerlake: Add Alder Lake-P ACPI ID

 drivers/pinctrl/intel/pinctrl-intel.c     | 117 +++++++++++++++++++++---------
 drivers/pinctrl/intel/pinctrl-intel.h     |   4 +
 drivers/pinctrl/intel/pinctrl-tigerlake.c |   1 +
 3 files changed, 88 insertions(+), 34 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


