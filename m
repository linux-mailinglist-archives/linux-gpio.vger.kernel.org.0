Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B916630035F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbhAVMlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:41:12 -0500
Received: from mga01.intel.com ([192.55.52.88]:9678 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727758AbhAVMkt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:40:49 -0500
IronPort-SDR: mQooJYxkBMiI6TtL+ejiLS2UqGnjqpOJQTj4EM++xgVCI8cqwQWeUvOGCqDGnbZOhbKBcKsC2i
 sPlxyP4i1bHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198194072"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="198194072"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:38:58 -0800
IronPort-SDR: rlqDyJsWAokdTmAgpUGeMaO3JZ1NtA4vjtUsBdE1VNwaCv8DvSRlctIrxoyEQDM2STTU6yxxL6
 tUIGhq4VtM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="572116309"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jan 2021 04:38:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DB9DE1C7; Fri, 22 Jan 2021 14:38:56 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/6] lib/cmdline: Allow get_options() to take 0 to validate the input
Date:   Fri, 22 Jan 2021 14:38:50 +0200
Message-Id: <20210122123853.75162-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow get_options() to take 0 as a number of integers parameter to validate
the input.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: dropped string macros, added "the" in the comment (Bart)
 lib/cmdline.c       | 14 +++++++++++---
 lib/cmdline_kunit.c | 11 ++++++++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 2a9ae2143e42..16b9eaa39538 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -91,6 +91,9 @@ EXPORT_SYMBOL(get_option);
  *	full, or when no more numbers can be retrieved from the
  *	string.
  *
+ *	When @nints is 0, the function just validates the given @str and
+ *	returns the amount of parseable integers as described below.
+ *
  *	Returns:
  *
  *	The first element is filled by the amount of the collected numbers
@@ -103,15 +106,20 @@ EXPORT_SYMBOL(get_option);
 
 char *get_options(const char *str, int nints, int *ints)
 {
+	bool validate = (nints == 0);
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
index 91737f17ce51..3622c62bcf08 100644
--- a/lib/cmdline_kunit.c
+++ b/lib/cmdline_kunit.c
@@ -109,13 +109,22 @@ static void cmdline_do_one_range_test(struct kunit *test, const char *in,
 {
 	unsigned int i;
 	int r[16];
+	int *p;
 
 	memset(r, 0, sizeof(r));
 	get_options(in, ARRAY_SIZE(r), r);
-	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], "in test %u expected %d numbers, got %d",
+	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], "in test %u (parsed) expected %d numbers, got %d",
 			    n, e[0], r[0]);
 	for (i = 1; i < ARRAY_SIZE(r); i++)
 		KUNIT_EXPECT_EQ_MSG(test, r[i], e[i], "in test %u at %d", n, i);
+
+	memset(r, 0, sizeof(r));
+	get_options(in, 0, r);
+	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], "in test %u (validated) expected %d numbers, got %d",
+			    n, e[0], r[0]);
+
+	p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
+	KUNIT_EXPECT_PTR_EQ_MSG(test, p, (int *)0, "in test %u out of bound at %d", n, p - r);
 }
 
 static void cmdline_test_range(struct kunit *test)
-- 
2.29.2

