Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD35328655
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 18:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhCARI1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 12:08:27 -0500
Received: from mga04.intel.com ([192.55.52.120]:27159 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236971AbhCARFs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 12:05:48 -0500
IronPort-SDR: jzFkkJ8xkimntsU8v9vzX+bJrj2WjrFgSRWHi6ZJzlpdV042/xCuMMbWY6jCPDNT6nvxyLW8e9
 pFNFRKfNK2JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184088036"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="184088036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 09:00:25 -0800
IronPort-SDR: zMcPTAAj+Ck5b/wEusFaONFxoS25gXsd8WCICpontZ9GGrJ3fOEmRq2Wr+3c8G8G8HVp3BWwfg
 3j5BEFpwqzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="435446416"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2021 08:59:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1CC4313A; Mon,  1 Mar 2021 18:59:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 1/2] lib/cmdline: Export next_arg() for being used in modules
Date:   Mon,  1 Mar 2021 18:59:31 +0200
Message-Id: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

At least one module will benefit from using next_arg() helper.
Let's export it for that module and others if they consider it
helpful.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/cmdline.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 5d474c626e24..5546bf588780 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -272,3 +272,4 @@ char *next_arg(char *args, char **param, char **val)
 	/* Chew up trailing spaces. */
 	return skip_spaces(args);
 }
+EXPORT_SYMBOL(next_arg);
-- 
2.30.1

