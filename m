Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39F82A9BC5
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 19:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgKFSTp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 13:19:45 -0500
Received: from mga17.intel.com ([192.55.52.151]:24327 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727899AbgKFSTo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Nov 2020 13:19:44 -0500
IronPort-SDR: DI/JVwwXqy2fSmTEcWXL8hOsVIGJGHkfeBG7pQeV03iRe6VXd33WHdop+VTA/3wJBYW2Q9Rtzo
 d1SZGpvwRelA==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="149432883"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="149432883"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 10:19:41 -0800
IronPort-SDR: WcnbJaD3JAln2NCKyiDlb+rVXztaxtTALNwHUZ1o+eoIvTnjUaUjjCRzYpGZahMORV3TK85Uoq
 TE0uRdDZK4TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="326498846"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 06 Nov 2020 10:19:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F08DAA7; Fri,  6 Nov 2020 20:19:38 +0200 (EET)
Date:   Fri, 6 Nov 2020 20:19:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.10-2
Message-ID: <20201106181938.GA41213@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Bias configuration fixes. This PR is crucial for another GPIO ACPI related
patch series, which I want to have in v5.11. I.o.w. this should go into v5.10
to make everyone's life easier.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.10-2

for you to fetch changes up to f3c75e7a9349d1d33eb53ddc1b31640994969f73:

  pinctrl: intel: Set default bias in case no particular value given (2020-10-26 13:26:50 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.10-2

* Respect bias setting when comes from ACPI

The following is an automated git shortlog grouped by driver:

intel:
 -  Set default bias in case no particular value given
 -  Fix 2 kOhm bias which is 833 Ohm

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: intel: Fix 2 kOhm bias which is 833 Ohm
      pinctrl: intel: Set default bias in case no particular value given

 drivers/pinctrl/intel/pinctrl-intel.c | 40 ++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


