Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74496328658
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 18:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhCARIc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 12:08:32 -0500
Received: from mga11.intel.com ([192.55.52.93]:32444 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236024AbhCARGE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Mar 2021 12:06:04 -0500
IronPort-SDR: CPt35T8bAeNmDGRQ+vwNAoOYfzAw5ucjLEd45Gie8ZzlT0+mWB62gqRsOu6bKQYwWTqnHE0DgU
 e6MmR/JmGJ2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="183130147"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="183130147"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 08:59:41 -0800
IronPort-SDR: ulwloYRthgkrnhLed5rkUCfanQlnwbkuqi5xzZM2lM35hMGugJ3oucKxaaJqkxyBA3FytmDVPY
 8XT/GzEKuX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="505332951"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2021 08:59:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 48D9C1F1; Mon,  1 Mar 2021 18:59:39 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 2/2] gpio: aggregator: Replace custom get_arg() with a generic next_arg()
Date:   Mon,  1 Mar 2021 18:59:32 +0200
Message-Id: <20210301165932.62352-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

cmdline library provides next_arg() helper to traverse over parameters
and their values given in command line. Replace custom approach in the driver
by it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-aggregator.c | 39 +++++-----------------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 08171431bb8f..34e35b64dcdc 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -37,31 +37,6 @@ struct gpio_aggregator {
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
-static char *get_arg(char **args)
-{
-	char *start, *end;
-
-	start = skip_spaces(*args);
-	if (!*start)
-		return NULL;
-
-	if (*start == '"') {
-		/* Quoted arg */
-		end = strchr(++start, '"');
-		if (!end)
-			return ERR_PTR(-EINVAL);
-	} else {
-		/* Unquoted arg */
-		for (end = start; *end && !isspace(*end); end++) ;
-	}
-
-	if (*end)
-		*end++ = '\0';
-
-	*args = end;
-	return start;
-}
-
 static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 			 int hwnum, unsigned int *n)
 {
@@ -83,8 +58,8 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
+	char *args = skip_spaces(aggr->args);
 	char *name, *offsets, *p;
-	char *args = aggr->args;
 	unsigned long *bitmap;
 	unsigned int i, n = 0;
 	int error = 0;
@@ -93,13 +68,9 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 	if (!bitmap)
 		return -ENOMEM;
 
-	for (name = get_arg(&args), offsets = get_arg(&args); name;
-	     offsets = get_arg(&args)) {
-		if (IS_ERR(name)) {
-			pr_err("Cannot get GPIO specifier: %pe\n", name);
-			error = PTR_ERR(name);
-			goto free_bitmap;
-		}
+	args = next_arg(args, &name, &p);
+	while (*args) {
+		args = next_arg(args, &offsets, &p);
 
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
@@ -125,7 +96,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 				goto free_bitmap;
 		}
 
-		name = get_arg(&args);
+		args = next_arg(args, &name, &p);
 	}
 
 	if (!n) {
-- 
2.30.1

