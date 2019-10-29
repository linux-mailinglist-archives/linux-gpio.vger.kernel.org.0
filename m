Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34621E8F0F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 19:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730435AbfJ2SMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 14:12:00 -0400
Received: from mga11.intel.com ([192.55.52.93]:47915 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730417AbfJ2SMA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Oct 2019 14:12:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 11:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; 
   d="scan'208";a="211152884"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 29 Oct 2019 11:11:57 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 29 Oct 2019 20:11:56 +0200
Date:   Tue, 29 Oct 2019 20:11:56 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>
Subject: [GIT PULL] intel-pinctrl fixes for v5.4 part 2
Message-ID: <20191029181156.GP2593@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

The following changes since commit 260996c30f4f3a732f45045e3e0efe27017615e4:

  pinctrl: cherryview: restore Strago DMI workaround for all versions (2019-10-01 17:36:40 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-fixes-v5.4-2

for you to fetch changes up to 67d33aecd030226f0a577eb683aaa6853ecf8f91:

  pinctrl: cherryview: Allocate IRQ chip dynamic (2019-10-25 12:54:10 +0300)

----------------------------------------------------------------
intel-pinctrl fixes for v5.4 part 2

A couple more fixes for Intel pinctrl drivers:

  - Try to avoid glitches when pin is in GPIO mode
  - Fix cherryview irq_valid_mask calculation
  - Allocate cherryview IRQ chip dynamically to avoid triggering warning
    from GPIO core

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
      pinctrl: cherryview: Allocate IRQ chip dynamic

Hans de Goede (1):
      pinctrl: cherryview: Fix irq_valid_mask calculation

 drivers/pinctrl/intel/pinctrl-cherryview.c | 26 +++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-intel.c      | 21 ++++++++++++++++++++-
 2 files changed, 33 insertions(+), 14 deletions(-)
