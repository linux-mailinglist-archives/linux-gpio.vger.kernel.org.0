Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2149A1CDD56
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 16:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbgEKOfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 10:35:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:61214 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728403AbgEKOfP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 May 2020 10:35:15 -0400
IronPort-SDR: 7n7+fOViIPQpcyappv4nbrF6mqMryy1C30+kxtYe+v0+ODwQhCBMdoSA9xcycttV981gPt8+ip
 fTdSa7gNM4hg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 07:35:14 -0700
IronPort-SDR: EVhJ6vA0IivxCEOR0jC2SZTMUCO8Rgle/oqzDZFgLRkAymcsWzc/5qkvaxjo6aDIaxtYjIItiG
 MaKE3ez75PcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; 
   d="scan'208";a="286293934"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2020 07:35:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DA089101; Mon, 11 May 2020 17:35:12 +0300 (EEST)
Date:   Mon, 11 May 2020 17:35:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-gpio for 5.8-1
Message-ID: <20200511143512.GA11655@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux GPIO  maintainers,

Intel GPIO fixes and cleanups so far for v5.8-rc1. I don't expect something
coming soon into that cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.8-1

for you to fetch changes up to 7e73aa90a38c8815acea7af71e285658bf5ab879:

  gpio: merrifield: Better show how GPIO and IRQ bases are derived from hardware (2020-04-16 20:41:06 +0300)

----------------------------------------------------------------
intel-gpio for v5.8-1

* MSI support for Intel Merrifield
* Refactor gpio-pch to be up-to-date with recent kernel APIs
* Miscellaneous cleanups here and there

The following is an automated git shortlog grouped by driver:

ich:
 -  fix a typo

merrifield:
 -  Better show how GPIO and IRQ bases are derived from hardware
 -  Switch over to MSI interrupts

pch:
 -  Use in pch_irq_type() macros provided by IRQ core
 -  Refactor pch_irq_type() to avoid unnecessary locking
 -  Get rid of unneeded variable in IRQ handler
 -  Use BIT() and GENMASK() where it's appropriate

----------------------------------------------------------------
Andy Shevchenko (6):
      gpio: pch: Use BIT() and GENMASK() where it's appropriate
      gpio: pch: Get rid of unneeded variable in IRQ handler
      gpio: pch: Refactor pch_irq_type() to avoid unnecessary locking
      gpio: pch: Use in pch_irq_type() macros provided by IRQ core
      gpio: merrifield: Switch over to MSI interrupts
      gpio: merrifield: Better show how GPIO and IRQ bases are derived from hardware

sachin agarwal (1):
      gpio: ich: fix a typo

 drivers/gpio/gpio-ich.c        |  2 +-
 drivers/gpio/gpio-merrifield.c | 10 ++++--
 drivers/gpio/gpio-pch.c        | 73 +++++++++++++++++++++---------------------
 3 files changed, 45 insertions(+), 40 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


