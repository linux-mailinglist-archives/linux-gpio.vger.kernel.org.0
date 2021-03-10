Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B47333F87
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 14:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbhCJNqF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 08:46:05 -0500
Received: from mga03.intel.com ([134.134.136.65]:19874 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232733AbhCJNp5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 08:45:57 -0500
IronPort-SDR: IKOOnvVmUlPSuRNpMHXnYXbNeX5Hui0kwP5I5c1PmtMb8oNgBq+L7sVxAB5u8PZia0U8enESKZ
 ouAH7hMKjwMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188504655"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="188504655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 05:45:12 -0800
IronPort-SDR: KI7RX4mZPreIMw9YRoyX6chlsvi9krd/0gKT1Fl2s2eYrVLo2t0aEsOEINsGn2t6ZEfZvXMvl0
 vvwBwr3D3HCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="409086131"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 10 Mar 2021 05:45:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 706B7F4; Wed, 10 Mar 2021 15:45:22 +0200 (EET)
Date:   Wed, 10 Mar 2021 15:45:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.12-2
Message-ID: <YEjNcinYomwjyBdE@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

One fix so far. I based my branch on v5.12-rc2 as Linus T. suggested.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.12-2

for you to fetch changes up to 77e141266c8e72e4a586fe42eaab1b4b047655ed:

  pinctrl: intel: Show the GPIO base calculation explicitly (2021-03-08 19:07:48 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.12-2

* Fix regression in GPIO numbering in size based Intel pin control drivers

The following is an automated git shortlog grouped by driver:

intel:
 -  Show the GPIO base calculation explicitly

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: intel: Show the GPIO base calculation explicitly

 drivers/pinctrl/intel/pinctrl-intel.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
With Best Regards,
Andy Shevchenko


