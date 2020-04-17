Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C424A1ADE10
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 15:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729949AbgDQNO6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 09:14:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:10510 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729799AbgDQNO6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 09:14:58 -0400
IronPort-SDR: n1uyqSjcc8B1kLrDaTktvESAOQ7Snyzary4MySGuYwbQUPqk+byyG+2nvKt977WCo/c8YMk0TH
 nv1M2mom3sDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 06:14:57 -0700
IronPort-SDR: lB2wK+765+bnT+VZY0bpyATVuroy/+ghX9FanK5ynCLS9ZOY2k3LFS7E+A96n1P9rhcaKT+NDD
 sCHbp9OZwApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; 
   d="scan'208";a="244707228"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 17 Apr 2020 06:14:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9D663327; Fri, 17 Apr 2020 16:14:55 +0300 (EEST)
Date:   Fri, 17 Apr 2020 16:14:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.7-2
Message-ID: <20200417131455.GA7456@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Fixes for v5.7-rc2 of Intel pin control drivers.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.7-2

for you to fetch changes up to 69388e15f5078c961b9e5319e22baea4c57deff1:

  pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler (2020-04-17 14:37:40 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.7-2

* Enable pin configuration setting for Baytrail
* Fix interrupt handling due to hardware sighting for Cherryview
* Fix PAD lock offset for Sunrisepoint-H

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Enable pin configuration setting for GPIO chip

cherryview:
 -  Add missing spinlock usage in chv_gpio_irq_handler

sunrisepoint:
 -  Fix PAD lock register offset for SPT-H

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: sunrisepoint: Fix PAD lock register offset for SPT-H
      pinctrl: baytrail: Enable pin configuration setting for GPIO chip

Grace Kao (1):
      pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler

 drivers/pinctrl/intel/pinctrl-baytrail.c     |  1 +
 drivers/pinctrl/intel/pinctrl-cherryview.c   |  4 ++++
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 15 ++++++++-------
 3 files changed, 13 insertions(+), 7 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


