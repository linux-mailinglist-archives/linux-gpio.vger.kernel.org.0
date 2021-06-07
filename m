Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9EE39DEFF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 16:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFGOou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 10:44:50 -0400
Received: from mga07.intel.com ([134.134.136.100]:3337 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230264AbhFGOot (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Jun 2021 10:44:49 -0400
IronPort-SDR: x46yhmKhjPJNV8W3GvscfExnc4Djqh1p511eNc5tlCXMZUXJOsNfIZa3o00Pydwszx3SB1K1Tu
 fBcn57WC2+Xw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268489456"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="268489456"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 07:42:58 -0700
IronPort-SDR: pLkR0P+7cV2ljSvPj3LNUnUJpT1kTD6A2tV3zrh42xjyuxq/q7DMZ1LRi0jFgWpZqU9Py5zawh
 uQ4/BCyQah1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="469108010"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2021 07:42:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 43E54C5; Mon,  7 Jun 2021 17:43:18 +0300 (EEST)
Date:   Mon, 7 Jun 2021 17:43:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.14-1
Message-ID: <YL4whsUj4M3av46e@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Really quiet cycle this time. While it's for v5.14, feel free to apply for
current since it's only ID patch.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.14-1

for you to fetch changes up to 258435a1c8187f559549e515d2f77fa0b57bcd27:

  pinctrl: tigerlake: Add Alder Lake-M ACPI ID (2021-05-25 16:26:38 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.14-1

* Enabling pin controller on Intel Alder Lake-M

The following is an automated git shortlog grouped by driver:

tigerlake:
 -  Add Alder Lake-M ACPI ID

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: tigerlake: Add Alder Lake-M ACPI ID

 drivers/pinctrl/intel/pinctrl-tigerlake.c | 1 +
 1 file changed, 1 insertion(+)

-- 
With Best Regards,
Andy Shevchenko


