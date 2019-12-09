Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560A2116D0A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 13:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfLIMWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Dec 2019 07:22:50 -0500
Received: from mga05.intel.com ([192.55.52.43]:58969 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727412AbfLIMWu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Dec 2019 07:22:50 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 04:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="244429061"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2019 04:22:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D3F5A141; Mon,  9 Dec 2019 14:22:47 +0200 (EET)
Date:   Mon, 9 Dec 2019 14:22:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.5-2
Message-ID: <20191209122247.GA85209@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

This is material for v5.5-rc2.

There are two fixes for BayTrail and the rest of conversion to pass IRQ chip
along with GPIO one. The latter is a part 2 of the merge which has been delayed
to -rc1 for dependency reasons. It has been hanging for few weeks in Linux next.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.5-2

for you to fetch changes up to b9a19bdbc843abd659e8ec6b1b3c32ae3a2455eb:

  pinctrl: cherryview: Pass irqchip when adding gpiochip (2019-12-09 12:55:53 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.5-2

* Fix Baytrail silicon issue by using a global lock
* Fix North community pin names that user will assume their functions
* Convert Cherryview and Baytrail to pass IRQ chip along with GPIO one

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Pass irqchip when adding gpiochip
 -  Add GPIO <-> pin mapping ranges via callback
 -  Update North Community pin list
 -  Really serialize all register accesses

cherryview:
 -  Pass irqchip when adding gpiochip
 -  Add GPIO <-> pin mapping ranges via callback
 -  Split out irq hw-init into a separate helper function

----------------------------------------------------------------
Andy Shevchenko (3):
      pinctrl: baytrail: Update North Community pin list
      pinctrl: baytrail: Add GPIO <-> pin mapping ranges via callback
      pinctrl: baytrail: Pass irqchip when adding gpiochip

Hans de Goede (4):
      pinctrl: baytrail: Really serialize all register accesses
      pinctrl: cherryview: Split out irq hw-init into a separate helper function
      pinctrl: cherryview: Add GPIO <-> pin mapping ranges via callback
      pinctrl: cherryview: Pass irqchip when adding gpiochip

 drivers/pinctrl/intel/pinctrl-baytrail.c   | 200 ++++++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-cherryview.c | 107 ++++++++-------
 2 files changed, 173 insertions(+), 134 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


