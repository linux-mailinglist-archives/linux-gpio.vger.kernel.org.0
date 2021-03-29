Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE25B34D23F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 16:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhC2OQb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 10:16:31 -0400
Received: from mga07.intel.com ([134.134.136.100]:42966 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230220AbhC2OQS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 10:16:18 -0400
IronPort-SDR: zPWG9NwH07hdw/ovDMOqHZaocWW0+X30qC3PIzF6GsDc2PLMKkb2aZdck1SccoO6OB2tUvwCvR
 YYh2enff87Dw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="255553684"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="255553684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 07:16:17 -0700
IronPort-SDR: 7is4lmsP7vAQMXbwtDcpYUKd0j8dSLF7KG8reIVPpv3YHlrQ2c37HbdF4Pav961t4Lb+GUUVHF
 9SC3nOUOS2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="516035321"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 07:16:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 521DEF2; Mon, 29 Mar 2021 17:16:30 +0300 (EEST)
Date:   Mon, 29 Mar 2021 17:16:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.13-1
Message-ID: <YGHhPlK5Ej4QywNH@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

So far collected stuff for Intel GPIO drivers (including aggregator clean up).
No conflicts are expected.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b41ba2ec54a70908067034f139aa23d0dd2985ce:

  gpiolib: Read "gpio-line-names" from a firmware node (2021-03-08 11:59:17 +0100)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.13-1

for you to fetch changes up to 6c46215d6b626cb0981f8332da506b69b98c4b49:

  gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events (2021-03-27 23:48:55 +0200)

----------------------------------------------------------------
intel-gpio for v5.13-1

* Implement event support (GPE) in Intel SCH GPIO driver
* Clean up GPIO aggregator driver to use more of the generic code

The following is an automated git shortlog grouped by driver:

aggregator:
 -  Replace custom get_arg() with a generic next_arg()

lib/cmdline:
 -  Export next_arg() for being used in modules

sch:
 -  Hook into ACPI GPE handler to catch GPIO edge events
 -  Add edge event support

----------------------------------------------------------------
Andy Shevchenko (3):
      lib/cmdline: Export next_arg() for being used in modules
      gpio: aggregator: Replace custom get_arg() with a generic next_arg()
      gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events

Jan Kiszka (1):
      gpio: sch: Add edge event support

 drivers/gpio/Kconfig           |   3 +-
 drivers/gpio/gpio-aggregator.c |  39 ++------
 drivers/gpio/gpio-sch.c        | 198 +++++++++++++++++++++++++++++++++++++++--
 lib/cmdline.c                  |   1 +
 4 files changed, 198 insertions(+), 43 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


