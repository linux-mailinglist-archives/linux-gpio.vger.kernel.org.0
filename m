Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632F335528B
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 13:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239014AbhDFLnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 07:43:24 -0400
Received: from mga03.intel.com ([134.134.136.65]:39974 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239082AbhDFLnY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Apr 2021 07:43:24 -0400
IronPort-SDR: bAV9cxAMb8zJIt7rQv2uARib2f7c9d0x8sMeHRrnVg4J4HT9htlYY0lZfacWulEenMzZzZpU03
 /7Xow4nVfbyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="193086709"
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; 
   d="scan'208";a="193086709"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 04:43:15 -0700
IronPort-SDR: +niDUAocI2lTqQwKZYQit/UA5C5Ac9sZmrxjgsZAuFFEGx8Rpr6WUJI1+RmTCRnYwc495KFtWp
 vG0jTboSahJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,309,1610438400"; 
   d="scan'208";a="597917022"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 06 Apr 2021 04:43:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F29FE29D; Tue,  6 Apr 2021 14:43:28 +0300 (EEST)
Date:   Tue, 6 Apr 2021 14:43:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.13-2
Message-ID: <YGxJYL70rkzrZQ0t@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

More stuff for v5.13 cycle. PR has been done against gpio/for-next branch
of Bart's tree.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit b41ba2ec54a70908067034f139aa23d0dd2985ce:

  gpiolib: Read "gpio-line-names" from a firmware node (2021-03-08 11:59:17 +0100)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.13-2

for you to fetch changes up to 058459043e71b5c1703194ea71aab576c0ff4f4d:

  gpio: ich: Switch to be dependent on LPC_ICH (2021-04-02 21:44:56 +0300)

----------------------------------------------------------------
intel-gpio for v5.13-2

* ACPI quirk to ignore EC events on Dell Venue 10 Pro 5055
* Kconfig fixes for GPIO ICH and SCH drivers

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055

ich:
 -  Switch to be dependent on LPC_ICH

sch:
 -  Drop MFD_CORE selection
 -  depends on LPC_SCH

----------------------------------------------------------------
Andy Shevchenko (5):
      lib/cmdline: Export next_arg() for being used in modules
      gpio: aggregator: Replace custom get_arg() with a generic next_arg()
      gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
      gpio: sch: Drop MFD_CORE selection
      gpio: ich: Switch to be dependent on LPC_ICH

Hans de Goede (1):
      gpiolib: acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055

Jan Kiszka (1):
      gpio: sch: Add edge event support

Randy Dunlap (1):
      gpio: sch: depends on LPC_SCH

 drivers/gpio/Kconfig           |  11 ++-
 drivers/gpio/gpio-aggregator.c |  39 ++------
 drivers/gpio/gpio-ich.c        |   2 -
 drivers/gpio/gpio-sch.c        | 198 +++++++++++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib-acpi.c    |  14 +++
 lib/cmdline.c                  |   1 +
 6 files changed, 215 insertions(+), 50 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


