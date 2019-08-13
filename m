Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 121538BAC0
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 15:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbfHMNu4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 09:50:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:6249 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728346AbfHMNu4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Aug 2019 09:50:56 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 06:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="375603915"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 13 Aug 2019 06:50:54 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxXCP-0006rk-3f; Tue, 13 Aug 2019 16:50:53 +0300
Date:   Tue, 13 Aug 2019 16:50:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Intel GPIO / pin control repositories for next
Message-ID: <20190813135053.GA30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Stephen!

Can you, please, include the following repositories for your linux-next bunch
for getting better coverage?

gpio-intel-fixes git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git#fixes
gpio-intel git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git#for-next

pinctrl-intel-fixes git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git#fixes
pinctrl-intel git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git#for-next

-- 
With Best Regards,
Andy Shevchenko


