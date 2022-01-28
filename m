Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE2549FE42
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 17:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239696AbiA1QoK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 11:44:10 -0500
Received: from mga18.intel.com ([134.134.136.126]:48002 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239249AbiA1QoK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Jan 2022 11:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643388250; x=1674924250;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TTVAu1eU8Jx+Ggxko+9ltTDY/expKG3KCqEJi5tZ7kA=;
  b=DGfY0rXX68w2kl6LxSgBbcczXGXC4rgi/X17GsHD7C8OczaYdziPaoDY
   XO2Jhcgxdoy76A731felPAAOKfXhjLJlz9uN0aK11PlrUDERpzOZ7rCtX
   IysMQFn5ljTD63DfvgJkljXFgpBtVonGxEERVLBh/lGTFQsuYqz3zOW56
   B+95lE7rtacc1xpto2nMcEAmafDFaRg8Gf4Cf2PJ2nONGpF9Na5llyAtF
   qvDyF9+nRBH9vvVKAHLPItWoZbZm6XTC0jtMfoniy8MMDpaP8Xl4/bEzI
   gMZy7F8evPeU2z/eRMViOptjYZCWnLRsyNaJYwJJD463mwuR1ARXB2nky
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="230730745"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="230730745"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 08:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="675141184"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2022 08:44:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D609A167; Fri, 28 Jan 2022 18:44:21 +0200 (EET)
Date:   Fri, 28 Jan 2022 18:44:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.17-4
Message-ID: <YfQdZTCvhjqjFUjm@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

Not many but still important fixes for Intel, ZynqMQ and pin control subsystem.
Please, consider to pull for v5.17-rc2 (or nearest one).

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.17-4

for you to fetch changes up to 500c77eed0feabddd5b3afb48e32c204614a8eab:

  pinctrl: zynqmp: Revert "Unify pin naming" (2022-01-28 16:52:04 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.17-4

* Couple of fixes on how Intel driver handles an interrupt
* Revert pin renaming change in ZynqMQ as it appears to be part of
  the Device Tree bindings
* Fix ordering of the files in the Makefile

The following is an automated git shortlog grouped by driver:

intel:
 -  Fix a glitch when updating IRQ flags on a preconfigured line
 -  fix unexpected interrupt

Place correctly CONFIG_PINCTRL_ST in the Makefile:
 - Place correctly CONFIG_PINCTRL_ST in the Makefile

zynqmp:
 -  Revert "Unify pin naming"

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: Place correctly CONFIG_PINCTRL_ST in the Makefile
      pinctrl: intel: Fix a glitch when updating IRQ flags on a preconfigured line

Gerhard Engleder (1):
      pinctrl: zynqmp: Revert "Unify pin naming"

Łukasz Bartosik (1):
      pinctrl: intel: fix unexpected interrupt

 drivers/pinctrl/Makefile              |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c | 64 ++++++++++++++++++++---------------
 drivers/pinctrl/pinctrl-zynqmp.c      | 10 +++---
 3 files changed, 41 insertions(+), 35 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


