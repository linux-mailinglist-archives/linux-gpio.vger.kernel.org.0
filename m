Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48B22FDD10
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 00:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387942AbhATWfU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 17:35:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:15529 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728418AbhATVvQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 16:51:16 -0500
IronPort-SDR: dThbE9NW7Ya/UluXAp/KOzQm3Zl4LGVQ0nSu5rlbZRG1n7GG2692KSPrtrdPMnHgnuu13cy6iG
 MxIPPcwT8ztw==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166844447"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="166844447"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 13:45:51 -0800
IronPort-SDR: JcFFCuyJ5rZZgliale7ijBKodJjqS6C3L6pgSUxiF3X4wLc+BUQL9J0XElBMxPclnt+yedd7mS
 XejaEon8QWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="402929391"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2021 13:45:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9DA34118; Wed, 20 Jan 2021 23:45:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/5] lib/cmdline_kunit: add a new test case for get_options()
Date:   Wed, 20 Jan 2021 23:45:43 +0200
Message-Id: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a test case for get_options() which is provided by cmdline.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/cmdline_kunit.c | 52 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
index 550e7a47fd24..74da9ed61779 100644
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
@@ -84,10 +104,42 @@ static void cmdline_test_tail_int(struct kunit *test)
 	} while (++i < ARRAY_SIZE(cmdline_test_strings));
 }
 
+static void cmdline_do_one_range_test(struct kunit *test, const char *in,
+				      unsigned int n, const int *e)
+{
+	unsigned int i;
+	int r[16];
+
+#define FMT	"in test %u"
+#define FMT2	"expected %d numbers, got %d"
+#define FMT3	"at %d"
+	memset(r, 0, sizeof(r));
+	get_options(in, ARRAY_SIZE(r), r);
+	KUNIT_EXPECT_EQ_MSG(test, r[0], e[0], FMT " " FMT2, n, e[0], r[0]);
+	for (i = 1; i < ARRAY_SIZE(r); i++)
+		KUNIT_EXPECT_EQ_MSG(test, r[i], e[i], FMT " " FMT3, n, i);
+#undef FMT3
+#undef FMT2
+#undef FMT
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

