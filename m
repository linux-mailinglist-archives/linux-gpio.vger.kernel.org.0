Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B25E35DD8E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 13:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237443AbhDMLOi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 07:14:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:27252 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237361AbhDMLOg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Apr 2021 07:14:36 -0400
IronPort-SDR: RscC7hm72fSnttjZ91pATTQPB/sCvl7rfppdAbAhbWvAAKXGcbE3385HVDTw/fx1KVDAqJ1fOj
 8mWAXyElKGtg==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="191202498"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="191202498"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 04:14:13 -0700
IronPort-SDR: ylyBCYWElf4bSo5pFI0VfaEkrRF0RP86V1pGfMdAfAha23R7cX4tWrHsF7HIfbsYLBYLis+ZAw
 3j8uZvgL/swQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="420763209"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 13 Apr 2021 04:14:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AF2DC17E; Tue, 13 Apr 2021 14:14:28 +0300 (EEST)
Date:   Tue, 13 Apr 2021 14:14:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.12-4
Message-ID: <YHV9FBeAosyf1Efj@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linux pin control  maintainers,

One patch for v5.12 cycle.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit 39c1f1bd8adf29840ef52225ce95f390e3d7b2cf:

  pinctrl: intel: check REVID register value for device presence (2021-03-25 15:07:10 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.12-4

for you to fetch changes up to 196d941753297d0ca73c563ccd7d00be049ec226:

  pinctrl: lewisburg: Update number of pins in community (2021-04-13 14:09:48 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.12-4

* Fix pin numbering per community in Intel Lewisburg driver

The following is an automated git shortlog grouped by driver:

lewisburg:
 -  Update number of pins in community

----------------------------------------------------------------
Yuanyuan Zhong (1):
      pinctrl: lewisburg: Update number of pins in community

 drivers/pinctrl/intel/pinctrl-lewisburg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


