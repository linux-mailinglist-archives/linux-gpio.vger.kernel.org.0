Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F31B2B49D3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 16:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbgKPPrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 10:47:52 -0500
Received: from mga18.intel.com ([134.134.136.126]:29331 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729057AbgKPPrw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 10:47:52 -0500
IronPort-SDR: R2OlNHbXdeKlxDAs5ScNSPUPObcOlNtdUp5YtQPbbT2kDcxhGjB108819p/kLc1icLXx46f01a
 L3bt+NPwj/zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="158540505"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="158540505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 07:47:51 -0800
IronPort-SDR: Ya0dtIgegTfSiO2+RkIRMB1vL9B/N/d01gJDdRm64n5scfhaFxU/RCsPNwD8phyyow3da5vjS/
 54j9xqXPdrvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="362147140"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 16 Nov 2020 07:47:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DC92C1F7; Mon, 16 Nov 2020 17:47:48 +0200 (EET)
Date:   Mon, 16 Nov 2020 17:47:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.10-3
Message-ID: <20201116154748.GA73963@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Couple of fixes for Jasper Lake looks big, but actually they are not and one
small change induced renumbering of pins that's why it rather dozens of LOCs
being changed. Otherwise it's simple set of fixes.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit f3c75e7a9349d1d33eb53ddc1b31640994969f73:

  pinctrl: intel: Set default bias in case no particular value given (2020-10-26 13:26:50 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.10-3

for you to fetch changes up to 5f714771d01e0e0d410f06d4d192fb27b1ca0edd:

  pinctrl: baytrail: Avoid clearing debounce value when turning it off (2020-11-16 12:07:57 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.10-3

* Fix HOSTSW_OWN offset and unhide SPI group of pins on Jasper Lake
* Fix debounce configuration on Baytrail when it's turned off
* Fix default bias setting on Merrifield

The following is an automated git shortlog grouped by driver:

baytrail:
 -  Avoid clearing debounce value when turning it off

jasperlake:
 -  Fix HOSTSW_OWN offset
 -  Unhide SPI group of pins

merrifield:
 -  Set default bias in case no particular value given

----------------------------------------------------------------
Andy Shevchenko (3):
      pinctrl: jasperlake: Unhide SPI group of pins
      pinctrl: merrifield: Set default bias in case no particular value given
      pinctrl: baytrail: Avoid clearing debounce value when turning it off

Evan Green (1):
      pinctrl: jasperlake: Fix HOSTSW_OWN offset

 drivers/pinctrl/intel/pinctrl-baytrail.c   |   8 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c | 452 +++++++++++++++--------------
 drivers/pinctrl/intel/pinctrl-merrifield.c |   8 +
 3 files changed, 246 insertions(+), 222 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


