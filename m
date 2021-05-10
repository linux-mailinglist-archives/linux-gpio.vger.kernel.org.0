Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A283797DC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhEJTra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:47:30 -0400
Received: from mga12.intel.com ([192.55.52.136]:41651 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231362AbhEJTr3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:47:29 -0400
IronPort-SDR: dfb1dvCi2p+bU0WKXRqMl0atI9ymrHZYEUz+GJCeBL25g+b+lD9Z+J5JfKPMljG1XVlNoG3s6S
 Yjxo+JHYCXag==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="178862700"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="178862700"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:46:23 -0700
IronPort-SDR: rQOmPbBk1u0U42ydnosK78/S6fYmI0rCOa0X+CDxowOjiy84uoMZlp2YGbn4WYPaGDahJEAElW
 ZfRBh855v4wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="433955808"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2021 12:46:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BCDB2D7; Mon, 10 May 2021 22:46:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 0/5] gpio: xilinx: convert to use bitmap API
Date:   Mon, 10 May 2021 22:46:28 +0300
Message-Id: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The change in the series has been inspired by [1], which, I think,
can be improved. Here I present the view how it may be done.

[1]: cover.1617380819.git.syednwaris@gmail.com

In v2:
- folding followup fix into patch 4
- added Tested-by (Srinivas)
- added Ack (Yuri)
- added Rb (Michal)
- rebased on top of v5.13-rc1

Andy Shevchenko (5):
  bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
  gpio: xilinx: Correct kernel doc for xgpio_probe()
  gpio: xilinx: Introduce xgpio_read_chan() / xgpio_write_chan()
  gpio: xilinx: Switch to use bitmap APIs
  gpio: xilinx: No need to disable IRQs in the handler

 drivers/gpio/gpio-xilinx.c | 385 +++++++++++++++++++------------------
 lib/bitmap.c               |   5 +-
 2 files changed, 198 insertions(+), 192 deletions(-)

-- 
2.30.2

