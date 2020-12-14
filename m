Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2482D9D05
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 17:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgLNQ5p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 11:57:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:6960 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440279AbgLNQ5e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 11:57:34 -0500
IronPort-SDR: pYsA3LljBS5qejlExQUi8HFtS9zwATAheYCPYne1vd02GHdyeohsZbQwtNykXeA1CZGAtiGOw0
 eoL66VXGWLHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="161788895"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="161788895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 08:55:29 -0800
IronPort-SDR: mFScIye5NRL/sXwVtNlGdGnjskNx7SG5iy2L5aelC++P/aS3KgN4HQqfmCe5jeFkMRZnwylNNt
 v2U3eMqFvtiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="336194847"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2020 08:55:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 61C32A7; Mon, 14 Dec 2020 18:55:25 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Luo Jiaxing <luojiaxing@huawei.com>, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] MAINTAINERS: Remove reference to non-existing file
Date:   Mon, 14 Dec 2020 18:55:24 +0200
Message-Id: <20201214165524.43843-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214165524.43843-1-andriy.shevchenko@linux.intel.com>
References: <20201214165524.43843-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO HiSilicon driver doesn't provide any platform data header.

Fixes: a8f25236e6e3 ("MAINTAINERS: Add maintainer for HiSilicon GPIO driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64a6c905107a..112a58976afe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8005,7 +8005,6 @@ M:	Luo Jiaxing <luojiaxing@huawei.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-hisi.c
-F:	include/linux/platform_data/gpio-hisi.h
 
 HISILICON HIGH PERFORMANCE RSA ENGINE DRIVER (HPRE)
 M:	Zaibo Xu <xuzaibo@huawei.com>
-- 
2.29.2

