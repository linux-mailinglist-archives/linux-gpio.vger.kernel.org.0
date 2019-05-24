Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C995129B62
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 17:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389591AbfEXPo2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 11:44:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:37486 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389206AbfEXPo1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 May 2019 11:44:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 May 2019 08:44:27 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 24 May 2019 08:44:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C93C7217; Fri, 24 May 2019 18:44:24 +0300 (EEST)
Date:   Fri, 24 May 2019 18:44:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.2-2
Message-ID: <20190524154424.GA68376@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Bugfix for v5.2-rc2. I send it separately due to last minute arrival during
merge window.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.2-2

for you to fetch changes up to 670784fb4ebe54434e263837390e358405031d9e:

  pinctrl: intel: Clear interrupt status in mask/unmask callback (2019-05-20 15:04:25 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.2-2

Fix a laggish ELAN touchpad responsiveness due to an odd interrupt masking.

The following is an automated git shortlog grouped by driver:

intel:
 -  Clear interrupt status in mask/unmask callback
 -  Use GENMASK() consistently

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: intel: Use GENMASK() consistently

Kai-Heng Feng (1):
      pinctrl: intel: Clear interrupt status in mask/unmask callback

 drivers/pinctrl/intel/pinctrl-intel.c | 45 ++++++++---------------------------
 1 file changed, 10 insertions(+), 35 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


