Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E38F2C29B5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 15:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbgKXObg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 09:31:36 -0500
Received: from mga12.intel.com ([192.55.52.136]:49308 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389017AbgKXObf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 09:31:35 -0500
IronPort-SDR: nKVa4fvlIbTFU/Q6RsguDn1AJ14pMKMDSKzXMk6K/osBfxa82N3UdhqYp71nONUtjuf9GjASIz
 LYePUI+G9ppw==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="151211012"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="151211012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 06:31:35 -0800
IronPort-SDR: N9/i1r0fgsnMPcDuGeRQTRwWz7VXXYXBRx0CZc+R3VE4VZCJ/FyPX/xnLHCuUMdSznOckHfzxT
 3pUigIl4cM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="313268600"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 24 Nov 2020 06:31:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 04CFE133; Tue, 24 Nov 2020 16:31:32 +0200 (EET)
Date:   Tue, 24 Nov 2020 16:31:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.11-1
Message-ID: <20201124143132.GA9090@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Bunch of new Intel drivers and few duplicates commits in the PR list below
since they are already in upstream. This is material for v5.11.

It smoothly merges into devel or for-next branches (whatever your flow assumes).
The bundle has been in Linux next for at least couple of weeks.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit f3c75e7a9349d1d33eb53ddc1b31640994969f73:

  pinctrl: intel: Set default bias in case no particular value given (2020-10-26 13:26:50 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.11-1

for you to fetch changes up to 0b74e40a4e41f3cbad76dff4c50850d47b525b26:

  pinctrl: baytrail: Avoid clearing debounce value when turning it off (2020-11-16 12:04:03 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.11-1

 * Add Intel Alder Lake-S pin controller support
 * Add Intel Elkhart Lake pin controller support
 * Add Intel Lakefield driver pin controller support
 * Miscellaneous fixes for Intel Lynxpoint driver

The following is an automated git shortlog grouped by driver:

intel:
 -  Add Intel Alder Lake-S pin controller support
 -  Add Intel Elkhart Lake pin controller support
 -  Add blank line before endif in Kconfig
 -  Add Intel Lakefield pin controller support

lynxpoint:
 -  Enable pin configuration setting for GPIO chip
 -  Use defined constant for disabled bias explicitly
 -  Unify initcall location in the code

----------------------------------------------------------------
Andy Shevchenko (10):
      pinctrl: intel: Add Intel Lakefield pin controller support
      pinctrl: intel: Add blank line before endif in Kconfig
      pinctrl: intel: Add Intel Elkhart Lake pin controller support
      pinctrl: intel: Add Intel Alder Lake-S pin controller support
      pinctrl: lynxpoint: Unify initcall location in the code
      pinctrl: lynxpoint: Use defined constant for disabled bias explicitly
      pinctrl: lynxpoint: Enable pin configuration setting for GPIO chip
      pinctrl: jasperlake: Unhide SPI group of pins
      pinctrl: merrifield: Set default bias in case no particular value given
      pinctrl: baytrail: Avoid clearing debounce value when turning it off

Evan Green (1):
      pinctrl: jasperlake: Fix HOSTSW_OWN offset

 drivers/pinctrl/intel/Kconfig               |  25 ++
 drivers/pinctrl/intel/Makefile              |   3 +
 drivers/pinctrl/intel/pinctrl-alderlake.c   | 437 ++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-baytrail.c    |   8 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c | 513 ++++++++++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-jasperlake.c  | 452 ++++++++++++------------
 drivers/pinctrl/intel/pinctrl-lakefield.c   | 375 ++++++++++++++++++++
 drivers/pinctrl/intel/pinctrl-lynxpoint.c   |  10 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c  |   8 +
 9 files changed, 1605 insertions(+), 226 deletions(-)
 create mode 100644 drivers/pinctrl/intel/pinctrl-alderlake.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-elkhartlake.c
 create mode 100644 drivers/pinctrl/intel/pinctrl-lakefield.c

-- 
With Best Regards,
Andy Shevchenko


