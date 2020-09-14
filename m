Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B952690D0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgINP5Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:57:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:59598 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbgINP5T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Sep 2020 11:57:19 -0400
IronPort-SDR: j2WdIWojU/H1dF1vFwuxb0eIvcuKEXyjsVsB4NZNSXUH2hJGb6PyU1n1s50tTOCG+eBchnvvda
 Ot0DNvTvXkOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="243931011"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="243931011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 08:57:17 -0700
IronPort-SDR: 8JSxqk2Kx1jVKXMHt7isDuXw7CkrHEo+jHFUTX/L9RpQJHL8p1YmxRt3bq2qRjiFB8xKLvXc4b
 FZ3K53BFz55w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="507188495"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2020 08:57:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EB534DE; Mon, 14 Sep 2020 18:57:14 +0300 (EEST)
Date:   Mon, 14 Sep 2020 18:57:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl for 5.9-2
Message-ID: <20200914155714.GA43910@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

One fix for v5.9 cycle from Hans.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.9-2

for you to fetch changes up to 3488737093e7f60c7764b9a3cc66648adcbddca4:

  pinctrl: cherryview: Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs (2020-09-07 11:56:43 +0300)

----------------------------------------------------------------
intel-pinctrl for v5.9-2

* Preserve Tx buffer inversion on Cherriview GPIOs

The following is an automated git shortlog grouped by driver:

cherryview:
 -  Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs

----------------------------------------------------------------
Hans de Goede (1):
      pinctrl: cherryview: Preserve CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs

 drivers/pinctrl/intel/pinctrl-cherryview.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko


