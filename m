Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52DA358797
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 16:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhDHO4E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 10:56:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:23179 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231557AbhDHO4D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 10:56:03 -0400
IronPort-SDR: HiMqLgjD+mwKO4L7yQBaMNoTqnfKIy0MhVc1287gWNqwTUlmeOIn8u6QOcwcn5At4w5S6a4pCO
 Y6cMc7mQVY9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="173033285"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="173033285"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 07:55:52 -0700
IronPort-SDR: dgf9RWywikSAzthwS691EXZl6/fOl7kLiVbTciktdFgqtU1LTXY2jXSI/nYXzHVZd1WtVwMQMT
 HGLUUUljGp4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="613364323"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2021 07:55:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ECC3AFC; Thu,  8 Apr 2021 17:56:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: [RFT, PATCH v1 0/5] gpio: xilinx: convert to use bitmap API
Date:   Thu,  8 Apr 2021 17:55:56 +0300
Message-Id: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The change in the series has been inspired by [1], which, I think,
can be improved. Here I present the view how it can be done.

The series marked as RFT since I have no hardware and I perform
compile test only.

The patches 1 and 2 can be (independently) applied for v5.13, but I'm not in
hurry with the series, due to above (lack of real testing). So I'm flexible in
a way how it can be proceed.

[1]: cover.1617380819.git.syednwaris@gmail.com

Andy Shevchenko (5):
  bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
  gpio: xilinx: Correct kernel doc for xgpio_probe()
  gpio: xilinx: Introduce xgpio_read_chan() / xgpio_write_chan()
  gpio: xilinx: Switch to use bitmap APIs
  gpio: xilinx: No need to disable IRQs in the handler

 drivers/gpio/gpio-xilinx.c | 377 ++++++++++++++++++-------------------
 lib/bitmap.c               |   5 +-
 2 files changed, 190 insertions(+), 192 deletions(-)

-- 
2.30.2

