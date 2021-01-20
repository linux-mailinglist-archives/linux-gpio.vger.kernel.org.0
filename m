Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410C52FDD0D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 00:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729905AbhATWfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 17:35:06 -0500
Received: from mga11.intel.com ([192.55.52.93]:43959 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728298AbhATVuv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 16:50:51 -0500
IronPort-SDR: dQotdB7rP0x0hLIYaBbYPB0FD5GyNg9OisQX+rjtkorB4b1mzdHWBWnS1i3F8FZOgZEv6WqgEi
 bFSDw9mkDwkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="175675353"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="175675353"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 13:45:51 -0800
IronPort-SDR: lpgXQv6hPjDrq2skee6bD+HlHgTZfXQKiHoLmNKxDGhRldYrWDcgYZKbG3FBQ8U12+uMfIylvA
 Bl0SfowahHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="391696532"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2021 13:45:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B442F161; Wed, 20 Jan 2021 23:45:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/5] lib/cmdline: Allow get_options() to take 0 to validate the input
Date:   Wed, 20 Jan 2021 23:45:45 +0200
Message-Id: <20210120214547.89770-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow get_options() to take 0 as a number of integers parameter to validate
the input.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/cmdline.c       | 14 +++++++++++---
 lib/cmdline_kunit.c | 10 +++++++++-
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 2a9ae2143e42..1106a8bcd63e 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -91,6 +91,9 @@ EXPORT_SYMBOL(get_option);
  *	full, or when no more numbers can be retrieved from the
  *	string.
  *
+ *	When @nints is 0, the function just validates the given @str and
+ *	returns amount of parseable integers as described below.
+ *
  *	Returns:
  *
  *	The first element is filled by the amount of the collected numbers
@@ -103,15 +106,20 @@ EXPORT_SYMBOL(get_option);
 
 char *get_options(const char *str, int nints, int *ints)
 {
+	bool validate = nints == 0;
 	int res, i = 1;
 
-	while (i < nints) {
-		res = get_option((char **)&str, ints + i);
+	while (i < nints || validate) {
+		int *pint = validate ? ints : ints + i;
+
+		res = get_option((char **)&str, pint);
 		if (res == 0)
 			break;
 		if (res == 3) {
+			int n = validate ? 0 : nints - i;
 			int range_nums;
-			range_nums = get_range((char **)&str, ints + i, nints - i);
+
+			range_nums = get_range((char **)&str, pint, n);
 			if (range_nums < 0)
 				break;
 			/*
diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
index 74da9ed61779..a6119c164b48 100644
--- a/lib/cmdline_kunit.c
+++ b/lib/cmdline_kunit.c
@@ -109,15 +109,23 @@ static void cmdline_do_one_range_test(struct kunit *test, const char *in,
 {
 	unsigned int i;
 	int r[16];
+	int *p;
 
 #define FMT	"in test %u"
 #define FMT2	"expected %d numbers, got %d"
 #define FMT3	"at %d"
 	memset(r, 0, sizeof(r));
 	get_options(in, ARRAY_SIZE(r), r);
-	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " " FMT2, n, e[0], r[0]);
+	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " (parsed) " FMT2, n, e[0], r[0]);
 	for (i = 1; i < ARRAY_SIZE(r); i++)
 		KUNIT_EXPECT_EQ_MSG(test, r[i], e[i], FMT " " FMT3, n, i);
+
+	memset(r, 0, sizeof(r));
+	get_options(in, 0, r);
+	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " (validated) " FMT2, n, e[0], r[0]);
+
+	p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
+	KUNIT_EXPECT_PTR_EQ_MSG(test, p, (int *)0, FMT " out of bound " FMT3, n, p - r);
 #undef FMT3
 #undef FMT2
 #undef FMT
-- 
2.29.2

