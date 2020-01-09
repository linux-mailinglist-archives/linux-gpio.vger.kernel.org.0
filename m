Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4901357C4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 12:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbgAILTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 06:19:06 -0500
Received: from mga07.intel.com ([134.134.136.100]:52131 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728918AbgAILTG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Jan 2020 06:19:06 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 03:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; 
   d="scan'208";a="227113705"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2020 03:19:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 368A614B; Thu,  9 Jan 2020 13:19:02 +0200 (EET)
Date:   Thu, 9 Jan 2020 13:19:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.5-3
Message-ID: <20200109111902.GA47863@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

One patch for current (v5.5!) cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.5-3

for you to fetch changes up to 9608ea6c6613ced75b2c41703d99f44e6f8849f1:

  pinctrl: sunrisepoint: Add missing Interrupt Status register offset (2020-01-09 13:15:35 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.5-3

* Fix Interrupt Status register offset for Intel Sunrisepoint PCH-H.

The following is an automated git shortlog grouped by driver:

sunrisepoint:
 -  Add missing Interrupt Status register offset

----------------------------------------------------------------
Boyan Ding (1):
      pinctrl: sunrisepoint: Add missing Interrupt Status register offset

 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 1 +
 1 file changed, 1 insertion(+)

-- 
With Best Regards,
Andy Shevchenko


