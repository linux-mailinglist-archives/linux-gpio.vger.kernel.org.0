Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28BF3224E1B
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 23:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgGRV0N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 17:26:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:27081 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728043AbgGRV0M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Jul 2020 17:26:12 -0400
IronPort-SDR: deNim4eI9y8G1UyocYEWJteg31hTWI60G/U/Ts8e+8V91wtuNVS+myiERXAJKBfBh1450EUtza
 bZDcg0EGXS6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9686"; a="129339394"
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="scan'208";a="129339394"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2020 14:26:12 -0700
IronPort-SDR: DGjhCHZAtDN1Kb+VE/HyUouJmuIygw8ibfY8pzSajKNVWJEJWFIJVqkHjTX80TGM/e81R6h8gK
 5pUIZZL9Elnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="scan'208";a="287154880"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2020 14:26:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 84CDF109; Sun, 19 Jul 2020 00:26:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/3] gpio: aggregator: Further improvements
Date:   Sun, 19 Jul 2020 00:26:05 +0300
Message-Id: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch 1 makes sparse happy about locking and, in my opinion, improves
readability, though increases LOC count.
Patch 2 simplifies parser by using existing helpers.
Patch 3 refactors loop in parser for better readability in my opinion.

It might be you have different opinions about patches 1 and 3, we may discuss.

Compile tested only.

Andy Shevchenko (3):
  gpio: aggregator: Refactor ->{get,set}_multiple() to make Sparse happy
  gpio: aggregator: Simplify isrange() by  using get_option()
  gpio: aggregator: Assign name and offsets only once in a loop

 drivers/gpio/gpio-aggregator.c | 110 +++++++++++++++++----------------
 1 file changed, 57 insertions(+), 53 deletions(-)

-- 
2.27.0

