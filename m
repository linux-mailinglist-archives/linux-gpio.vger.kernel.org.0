Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DF51EF974
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 15:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgFENkm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 09:40:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:61677 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbgFENkl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 09:40:41 -0400
IronPort-SDR: ofbkWt8wzKdOKg780+tC1SsiWJd/ZHtiV8932LOxGaK+4r1sMa0BGVMUEVS19wQof0yTydUr5w
 unxqm3/kuCxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 06:40:39 -0700
IronPort-SDR: fHikN9QEsACU9YVbdzNnr64FofFhwjV74rhpK3hrPPDVi3I+BL7FOhQcf7Pg/qnF6unPkKjgkG
 AgeRQikBBxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="258695056"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Jun 2020 06:40:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 362BE2FB; Fri,  5 Jun 2020 16:40:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for automatic address incrementing
Date:   Fri,  5 Jun 2020 16:40:36 +0300
Message-Id: <20200605134036.9013-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's a repetition of the commit aa58a21ae378
  ("gpio: pca953x: disable regmap locking")
which states the following:

  This driver uses its own locking but regmap silently uses
  a mutex for all operations too. Add the option to disable
  locking to the regmap config struct.

Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic address incrementing")
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 97c9ac31ecb5..6f409ee0b033 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -395,6 +395,7 @@ static const struct regmap_config pca953x_ai_i2c_regmap = {
 	.writeable_reg = pca953x_writeable_register,
 	.volatile_reg = pca953x_volatile_register,
 
+	.disable_locking = true,
 	.cache_type = REGCACHE_RBTREE,
 	.max_register = 0x7f,
 };
-- 
2.27.0.rc2

