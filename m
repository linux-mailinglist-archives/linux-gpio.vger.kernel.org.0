Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56BE20C38E
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 20:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgF0SqQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 14:46:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:2520 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgF0SqP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Jun 2020 14:46:15 -0400
IronPort-SDR: RFOwvibjF2XUV3eU7FElYAr8qn0rhlSZ1bojsu79JyPjPpDhxA0i1mB6oOGmq/cCbYoPooNRCz
 p+g9lSWj8Z/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9665"; a="163733445"
X-IronPort-AV: E=Sophos;i="5.75,288,1589266800"; 
   d="scan'208";a="163733445"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2020 11:46:14 -0700
IronPort-SDR: anjlSBCbhSt0Np9GaxpZPzMF+/0OHw08MDjnE2yW5TIi7EN8hQIiq1eZvmE6PtuhwGNVJencEa
 ZZ/hotOq893w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,288,1589266800"; 
   d="scan'208";a="386039730"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2020 11:46:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 56B28146; Sat, 27 Jun 2020 21:46:12 +0300 (EEST)
Date:   Sat, 27 Jun 2020 21:46:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.8-2
Message-ID: <20200627184612.GA26954@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

One fix for Baytrail for v5.8 cycle. Shouldn't be any conflicts.


Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.8-2

for you to fetch changes up to 45c11a927606c612e4898a9484867b71318699f6:

  pinctrl: baytrail: Fix pin being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH) (2020-06-26 14:20:00 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.8-2

* Fix output pin value handling on Intel Baytrail

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Fix pin being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH)

----------------------------------------------------------------
Hans de Goede (1):
      pinctrl: baytrail: Fix pin being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH)

 drivers/pinctrl/intel/pinctrl-baytrail.c | 67 +++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 14 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


