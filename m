Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438BF34D31E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 17:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhC2PBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 11:01:05 -0400
Received: from mga03.intel.com ([134.134.136.65]:51823 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230359AbhC2PAj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 11:00:39 -0400
IronPort-SDR: jZDuRJ4JGtALWZbAp4jN0WxSpYkcJDaKz4FCanzclmLYv+Pu8rd3Zf5/qrxxELp+DrplRtjZ2z
 VFtTkzDFSBkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191593390"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="191593390"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 08:00:38 -0700
IronPort-SDR: 2udv7HzcdXKsx352JqvWgF/YXwiio1aY50EP5IjP3Q0/VsKahhQH7iYswo59Q/YzQnmKXlFWDI
 YqiUgUzMsGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="609750449"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2021 08:00:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 14D9CFC; Mon, 29 Mar 2021 18:00:50 +0300 (EEST)
Date:   Mon, 29 Mar 2021 18:00:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.13-1
Message-ID: <YGHrop0zkyZMLMdd@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

One little change so far for v5.13 cycle. The other one in your fixes branch
and shouldn't affect the merge (will be excluded automatically).

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.13-1

for you to fetch changes up to 5b613df3f499e305f3aecd58090a71ec0d92930d:

  pinctrl: intel: No need to disable IRQs in the handler (2021-03-25 14:52:41 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.13-1

* Don't disable disabled IRQs in the handler
* Fix the base calculation for groups defined by size

The following is an automated git shortlog grouped by driver:

intel:
 -  No need to disable IRQs in the handler
 -  Show the GPIO base calculation explicitly

----------------------------------------------------------------
Andy Shevchenko (2):
      pinctrl: intel: Show the GPIO base calculation explicitly
      pinctrl: intel: No need to disable IRQs in the handler

 drivers/pinctrl/intel/pinctrl-intel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


