Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 335C3AFEFD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 16:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfIKOmT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 10:42:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:18513 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbfIKOmT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Sep 2019 10:42:19 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Sep 2019 07:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,493,1559545200"; 
   d="scan'208";a="200532500"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 11 Sep 2019 07:42:16 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Sep 2019 17:42:15 +0300
Date:   Wed, 11 Sep 2019 17:42:15 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: intel-pinctrl for v5.4 part 2
Message-ID: <20190911144215.GJ2608@lahna.fi.intel.com>
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

The following changes since commit 6cb0880f08229360c6c57416de075aa96930be78:

  pinctrl: intel: remap the pin number to gpio offset for irq enabled pin (2019-08-19 12:41:44 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.4-2

for you to fetch changes up to 55dac43747be98516a337285428806d177afaa3a:

  pinctrl: intel: mark intel_pin_to_gpio __maybe_unused (2019-09-09 13:11:42 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.4 part 2

Just a single fix for build warning introduced in the previous pull.

----------------------------------------------------------------
Arnd Bergmann (1):
      pinctrl: intel: mark intel_pin_to_gpio __maybe_unused

 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
