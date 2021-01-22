Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBD230035E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbhAVMlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:41:12 -0500
Received: from mga07.intel.com ([134.134.136.100]:62320 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727892AbhAVMkt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:40:49 -0500
IronPort-SDR: U1eGLI6ykO3mCP9NAE/vUPCkgED59WCpU5L8wj5NElY3Rb/Yz/y4MPBaNzWVztoAuBC/Hoal2j
 bqiRfjCQowEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="243516879"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="243516879"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:38:59 -0800
IronPort-SDR: xFrnfTkcdiJHes4uhvacc0u7pV1JSJ6xJDyxJxChdh9ezkLSW8vbm84+iw55Wygjxqu6A4QOBT
 AmtNar7VuyLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="407733764"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2021 04:38:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BD73614F; Fri, 22 Jan 2021 14:38:56 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/6] lib/cmdline_kunit: add a new test case for get_options()
Date:   Fri, 22 Jan 2021 14:38:48 +0200
Message-Id: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a test case for get_options() which is provided by cmdline.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: drop string macros (Bart)
 lib/cmdline_kunit.c | 47 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
index 550e7a47fd24..91737f17ce51 100644
--- a/lib/cmdline_kunit.c
+++ b/lib/cmdline_kunit.c
@@ -18,6 +18,26 @@ static const int cmdline_test_values[] = {
 	1, 3, 2, 1, 1, 1, 3, 1,
 };
 
+static_assert(ARRAY_SIZE(cmdline_test_strings) == ARRAY_SIZE(cmdline_test_values));
+
+static const char *cmdline_test_range_strings[] = {
+	"-7" , "--7"  , "-1-2"    , "7--9",
+	"7-" , "-7--9", "7-9,"    , "9-7" ,
+	"5-a", "a-5"  , "5-8"     , ",8-5",
+	"+,1", "-,4"  , "-3,0-1,6", "4,-" ,
+	" +2", " -9"  , "0-1,-3,6", "- 9" ,
+};
+
+static const int cmdline_test_range_values[][16] = {
+	{ 1, -7, }, { 0, -0, }, { 4, -1, 0, +1, 2, }, { 0, 7, },
+	{ 0, +7, }, { 0, -7, }, { 3, +7, 8, +9, 0, }, { 0, 9, },
+	{ 0, +5, }, { 0, -0, }, { 4, +5, 6, +7, 8, }, { 0, 0, },
+	{ 0, +0, }, { 0, -0, }, { 4, -3, 0, +1, 6, }, { 1, 4, },
+	{ 0, +0, }, { 0, -0, }, { 4, +0, 1, -3, 6, }, { 0, 0, },
+};
+
+static_assert(ARRAY_SIZE(cmdline_test_range_strings) == ARRAY_SIZE(cmdline_test_range_values));
+
 static void cmdline_do_one_test(struct kunit *test, const char *in, int rc, int offset)
 {
 	const char *fmt = "Pattern: %s";
@@ -84,10 +104,37 @@ static void cmdline_test_tail_int(struct kunit *test)
 	} while (++i < ARRAY_SIZE(cmdline_test_strings));
 }
 
+static void cmdline_do_one_range_test(struct kunit *test, const char *in,
+				      unsigned int n, const int *e)
+{
+	unsigned int i;
+	int r[16];
+
+	memset(r, 0, sizeof(r));
+	get_options(in, ARRAY_SIZE(r), r);
+	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], "in test %u expected %d numbers, got %d",
+			    n, e[0], r[0]);
+	for (i = 1; i < ARRAY_SIZE(r); i++)
+		KUNIT_EXPECT_EQ_MSG(test, r[i], e[i], "in test %u at %d", n, i);
+}
+
+static void cmdline_test_range(struct kunit *test)
+{
+	unsigned int i = 0;
+
+	do {
+		const char *str = cmdline_test_range_strings[i];
+		const int *e = cmdline_test_range_values[i];
+
+		cmdline_do_one_range_test(test, str, i, e);
+	} while (++i < ARRAY_SIZE(cmdline_test_range_strings));
+}
+
 static struct kunit_case cmdline_test_cases[] = {
 	KUNIT_CASE(cmdline_test_noint),
 	KUNIT_CASE(cmdline_test_lead_int),
 	KUNIT_CASE(cmdline_test_tail_int),
+	KUNIT_CASE(cmdline_test_range),
 	{}
 };
 
-- 
2.29.2

