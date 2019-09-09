Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E32AD921
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 14:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbfIIMg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 08:36:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:25635 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727868AbfIIMg5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Sep 2019 08:36:57 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 05:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; 
   d="scan'208";a="383961916"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2019 05:36:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1564E2BD; Mon,  9 Sep 2019 15:36:54 +0300 (EEST)
Date:   Mon, 9 Sep 2019 15:36:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.4-1
Message-ID: <20190909123653.GA4122@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Small bunch of Intel GPIO driver clean ups.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.4-1

for you to fetch changes up to 85af79659f455ddbdc5b6b6e2a888a430cb58948:

  MAINTAINERS: Remove stale record for gpio-intel-mid.c (2019-08-26 15:05:23 +0300)

----------------------------------------------------------------
intel-gpio for v5.4-1

The clean up of IRQ chip initialization has been done in few drivers.
Stale record in MAINTAINERS database is removed.

The following is an automated git shortlog grouped by driver:

intel-mid:
 -  Pass irqchip when adding gpiochip
 -  MAINTAINERS: Remove stale record for gpio-intel-mid.c

lynxpoint:
 -  Pass irqchip when adding gpiochip

merrifield:
 -  Pass irqchip when adding gpiochip

pch:
 -  Use dev_get_drvdata

----------------------------------------------------------------
Andy Shevchenko (1):
      MAINTAINERS: Remove stale record for gpio-intel-mid.c

Chuhong Yuan (1):
      gpio: pch: Use dev_get_drvdata

Linus Walleij (3):
      gpio: intel-mid: Pass irqchip when adding gpiochip
      gpio: lynxpoint: Pass irqchip when adding gpiochip
      gpio: merrifield: Pass irqchip when adding gpiochip

 MAINTAINERS                    |  6 ------
 drivers/gpio/gpio-intel-mid.c  | 35 +++++++++++++++++------------------
 drivers/gpio/gpio-lynxpoint.c  | 35 ++++++++++++++++++++---------------
 drivers/gpio/gpio-merrifield.c | 28 ++++++++++++++++------------
 drivers/gpio/gpio-pch.c        |  6 ++----
 5 files changed, 55 insertions(+), 55 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


