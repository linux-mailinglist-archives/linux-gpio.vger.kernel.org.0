Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75810A69BB
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2019 15:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbfICNZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 09:25:22 -0400
Received: from mga11.intel.com ([192.55.52.93]:44544 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729443AbfICNZV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Sep 2019 09:25:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Sep 2019 06:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; 
   d="scan'208";a="198769574"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 03 Sep 2019 06:25:18 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 03 Sep 2019 16:25:17 +0300
Date:   Tue, 3 Sep 2019 16:25:17 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for v5.4
Message-ID: <20190903132517.GF2691@lahna.fi.intel.com>
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

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.4

for you to fetch changes up to 6cb0880f08229360c6c57416de075aa96930be78:

  pinctrl: intel: remap the pin number to gpio offset for irq enabled pin (2019-08-19 12:41:44 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.4

A collection of improvements and fixes for Intel pinctrl drivers
including:

  - Converting drivers to use new devm_platform_ioremap_resource()
    helper function.

  - Make Interrupt Status (IS) register configurable.

  - Allow locked pins to be requested and used as long as they are not
    modified.

  - Fix intel_pinctrl_should_save() to translate pin number to GPIO
    number where needed. This fixes Asus X571GT touchpad
    unresponsiveness issue after suspend/resume cycle.

----------------------------------------------------------------
Andy Shevchenko (18):
      pinctrl: baytrail: Use devm_platform_ioremap_resource()
      pinctrl: cherryview: Use devm_platform_ioremap_resource()
      pinctrl: intel: Use devm_platform_ioremap_resource()
      pinctrl: merrifield: Use devm_platform_ioremap_resource()
      pinctrl: intel: Drop double check for data in intel_pinctrl_probe_by_uid()
      pinctrl: intel: Simplify offset validation in intel_get_padcfg()
      pinctrl: broxton: Provide Interrupt Status register offset
      pinctrl: cannonlake: Provide Interrupt Status register offset
      pinctrl: geminilake: Provide Interrupt Status register offset
      pinctrl: icelake: Provide Interrupt Status register offset
      pinctrl: sunrisepoint: Provide Interrupt Status register offset
      pinctrl: denverton: Provide Interrupt Status register offset
      pinctrl: lewisburg: Provide Interrupt Status register offset
      pinctrl: intel: Remove default Interrupt Status offset
      pinctrl: baytrail: Re-use data structures from pinctrl-intel.h (part 2)
      pinctrl: intel: Use NSEC_PER_USEC for debounce calculus
      pinctrl: denverton: Update pin names according to v1.08
      pinctrl: intel: Allow to request locked pads

Chris Chiu (1):
      pinctrl: intel: remap the pin number to gpio offset for irq enabled pin

Stephen Boyd (2):
      pinctrl: intel: Remove dev_err() usage after platform_get_irq()
      pinctrl: cherryview: Remove dev_err() usage after platform_get_irq()

 drivers/pinctrl/intel/pinctrl-baytrail.c     |  67 +++++----------
 drivers/pinctrl/intel/pinctrl-broxton.c      |   4 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c   |   2 +
 drivers/pinctrl/intel/pinctrl-cherryview.c   |   8 +-
 drivers/pinctrl/intel/pinctrl-denverton.c    |  53 ++++++------
 drivers/pinctrl/intel/pinctrl-geminilake.c   |   2 +
 drivers/pinctrl/intel/pinctrl-icelake.c      |   2 +
 drivers/pinctrl/intel/pinctrl-intel.c        | 120 +++++++++++++++++++--------
 drivers/pinctrl/intel/pinctrl-intel.h        |   9 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c    |   2 +
 drivers/pinctrl/intel/pinctrl-merrifield.c   |   4 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c |   2 +
 12 files changed, 156 insertions(+), 119 deletions(-)
