Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F36DEFB16B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 14:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKMNgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 08:36:17 -0500
Received: from mga04.intel.com ([192.55.52.120]:45349 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfKMNgR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 08:36:17 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 05:36:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; 
   d="scan'208";a="214321503"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2019 05:36:15 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6467D214; Wed, 13 Nov 2019 15:36:14 +0200 (EET)
Date:   Wed, 13 Nov 2019 15:36:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.5-1
Message-ID: <20191113133614.GA18356@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

This PR is done against gpio/for-next due to dependencies.
It's for v5.5 cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 6b240aeb121ec14a528a58413baa9a74f8749604:

  Merge branch 'devel' into for-next (2019-11-08 14:10:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.5-1

for you to fetch changes up to 4a5e0f9e73511595c68f907a15772e5d1ba4aac6:

  gpio: merrifield: Pass irqchip when adding gpiochip (2019-11-13 15:30:53 +0200)

----------------------------------------------------------------
intel-gpio for v5.5-1

* Prerequisite patch against GPIO library to register pin ranges in time.
* Second attempt to fix Intel Merrifield GPIO driver to utilize irqchip.

The following is an automated git shortlog grouped by driver:

gpiolib:
 -  Introduce ->add_pin_ranges() callback

merrifield:
 -  Pass irqchip when adding gpiochip
 -  Add GPIO <-> pin mapping ranges via callback

----------------------------------------------------------------
Andy Shevchenko (3):
      gpiolib: Introduce ->add_pin_ranges() callback
      gpio: merrifield: Add GPIO <-> pin mapping ranges via callback
      gpio: merrifield: Pass irqchip when adding gpiochip

 drivers/gpio/gpio-merrifield.c | 74 +++++++++++++++++++++++++-----------------
 drivers/gpio/gpiolib.c         | 12 +++++++
 include/linux/gpio/driver.h    |  5 +++
 3 files changed, 61 insertions(+), 30 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


