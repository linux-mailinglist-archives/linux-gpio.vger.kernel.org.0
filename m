Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BF31F9BA7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730777AbgFOPOA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:14:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:34150 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730788AbgFOPN7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:13:59 -0400
IronPort-SDR: kyFdwIjaQULowKVED7rSiU60q1lqXPhCGseqmoLnpHwJOGwA8HzFg1+mSwVSbpHEUd44Xf5HIc
 m3xPU4pY8OQg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:13:58 -0700
IronPort-SDR: 0esV9ToOCDk3BHf+WogXVvbeDhi1+GLKw41p0So7D1N089Z5y5n4/cUicWtAOqf0MGRlhylSFH
 Q9oYUcPbzeig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="476066796"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2020 08:13:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EBF57217; Mon, 15 Jun 2020 18:13:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/3] pinctrl: intel: Reuse for_each_requested_gpio*() macros
Date:   Mon, 15 Jun 2020 18:13:50 +0300
Message-Id: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is part of previously sent clean up / fixes series against Intel pin
control drivers. This piece replaces home grown alternatives to generic (*)
for_each_requested_gpio*() helpers.

(*) Mika suggested to document for_each_requested_gpio*() helper, and I decided
that it may be useful to GPIO and pin control subsystems in general, so, thus it
has dependency to [1] submitted recently.

[1]: https://lore.kernel.org/linux-gpio/20200615150545.87964-1-andriy.shevchenko@linux.intel.com/T/#t

Andy Shevchenko (3):
  pinctrl: intel: Make use of for_each_requested_gpio_in_range()
  pinctrl: lynxpoint: Make use of for_each_requested_gpio()
  pinctrl: lynxpoint: Introduce helpers to enable or disable input

 drivers/pinctrl/intel/pinctrl-intel.c     | 21 ++++++------------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 26 +++++++++++++++--------
 2 files changed, 23 insertions(+), 24 deletions(-)

-- 
2.27.0.rc2

