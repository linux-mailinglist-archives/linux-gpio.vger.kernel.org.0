Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB03034D2FD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhC2O72 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 10:59:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:32453 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230446AbhC2O7Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 10:59:25 -0400
IronPort-SDR: gZEWXCFFzwM8lIWMQhqGtSn0tUjOdovfZTtMs4U4ReY9yR2Sn4fmKy/CHbuWmimuv89FALreQj
 jHFA7DdqAfxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="170964745"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="170964745"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 07:59:21 -0700
IronPort-SDR: 5NJbztmOqljocnhEH1Z/nYChZKGF2NO9TJEu8CKCBvVZ4SSesD9ykvAr58G+pKJhI7PtJCOmzD
 DLS7cBoVLRXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="437920929"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2021 07:59:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BB7CAFC; Mon, 29 Mar 2021 17:59:34 +0300 (EEST)
Date:   Mon, 29 Mar 2021 17:59:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.12-3
Message-ID: <YGHrVgivsEWEiI1X@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

This is material for current, v5.12, cycle. Only one fix for Xen to avoid
crashes. The other fix already in the fixes branch, so it won't be duplicated
during the merge.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.12-3

for you to fetch changes up to 39c1f1bd8adf29840ef52225ce95f390e3d7b2cf:

  pinctrl: intel: check REVID register value for device presence (2021-03-25 15:07:10 +0200)

----------------------------------------------------------------
intel-pinctrl for v5.12-3

* Check if device is present, which is not the case in Xen

The following is an automated git shortlog grouped by driver:

intel:
 -  check REVID register value for device presence

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: intel: Show the GPIO base calculation explicitly

Roger Pau Monne (1):
      pinctrl: intel: check REVID register value for device presence

 drivers/pinctrl/intel/pinctrl-intel.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko


