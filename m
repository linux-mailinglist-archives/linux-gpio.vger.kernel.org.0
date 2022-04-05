Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A8E4F43E7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 00:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242410AbiDEUTu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240715AbiDEOvQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 10:51:16 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D21613195C
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 06:22:02 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b19so19269653wrh.11
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2022 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8NKCceUq+skXHoCvY1gf94qLqSh/BMwJZwP5XDeE1k=;
        b=YZqo+8LH/XJA7u76GAKQyHthzdLOYBfIDtpzQ/y9JF1UySK2E3g0FYURGlGXPUYP4M
         JXEud1QOcSMeN0oz5ZOwiVl1ZLn0zUfU+jgGhXrxcQzsianw80sZ6xk3/QcHTxial5dO
         sEqJIgSPWuoJFg60Yh3h6iCaaLnDcoPJUVqfETkK+hsHicZ8an+tbScBzpRYaISP1873
         Kz24eawrBce0pGOCQUkBAYMqgjuMCWVCnmqvPLxSMQgQGNf/fLZCwf6jnnHl9isy+NjP
         C9SdT9uEPX7zA4lGETjjbI2lEr7+qOm+zlz008stq2t7IbZ7GNJ6RKp5wnFwnQTlqz2k
         NeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D8NKCceUq+skXHoCvY1gf94qLqSh/BMwJZwP5XDeE1k=;
        b=Vs2ibzUeL782AyeUu6a5SPPrewGeWauL570WAjnRL0KW8T1fWQfyKBe6fsWNElweYU
         uWBhXIRs3fl8xYct6NQ+gnskBOkKGq87kEXOB0RKe3WA2oGMv9sTSuDqhijqVVW0I6Bx
         edhpQzwpJLm3tAQJjWv32vSmAI/6FwhVnDSg/QfD/plNQbstFCL9D32jLTZdTfghceSn
         BTjYY7ZGXveWCCojXEMeiqsWJzOWTY0APFjbTvQmC5DNolk1fx2WP8b3MZgBYDTA244w
         iJHFDkIeHT1g3cAz1PXVufQ3ru3iuDL0EmZb8vbPf94Y502sRk1NvH8ZsL4/Q1kRR4zg
         FDIw==
X-Gm-Message-State: AOAM532UVahHdQ+I+uunE3L+Mfgh4JdsNWtks80ImtGx/Ksld3jFCxGo
        x9DEhPPcHIdPAOn+LUNgdMK7Sg==
X-Google-Smtp-Source: ABdhPJw9i4Y8+kd4b1oxxQvQg/bYAAnWPrclIM2HJOL5OX9Fnl6gMqQm3mDQAQLFIGUpqnIwNX8BQw==
X-Received: by 2002:a5d:6709:0:b0:206:e20:2272 with SMTP id o9-20020a5d6709000000b002060e202272mr2747841wru.462.1649164920876;
        Tue, 05 Apr 2022 06:22:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c7f0:a1c2:55a6:6909])
        by smtp.gmail.com with ESMTPSA id d13-20020a056000114d00b0020617a5b437sm3938151wrx.16.2022.04.05.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:22:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] API: rename gpiod_chip_find_line()
Date:   Tue,  5 Apr 2022 15:21:58 +0200
Message-Id: <20220405132158.33433-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The name "find_line" is quite ambigous. We should indicate that the
purpose of this routine is to map the line name to its HW offset.
Kent suggested get_line_get_offset_from_name() which is hard to beat
when it comes to being explicit.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h    |  3 ++-
 lib/chip.c         |  3 ++-
 tests/tests-chip.c | 10 +++++++---
 tools/gpiofind.c   |  2 +-
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index c605da8..344a8fc 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -158,7 +158,8 @@ struct gpiod_info_event *gpiod_chip_read_info_event(struct gpiod_chip *chip);
  * @note If a line with given name is not exposed by the chip, the function
  *       sets errno to ENOENT.
  */
-int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
+int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
+					 const char *name);
 
 /**
  * @brief Request a set of lines for exclusive usage.
diff --git a/lib/chip.c b/lib/chip.c
index edb2dfd..eef3be2 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -156,7 +156,8 @@ gpiod_chip_read_info_event(struct gpiod_chip *chip)
 	return gpiod_info_event_read_fd(chip->fd);
 }
 
-GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
+GPIOD_API int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
+						   const char *name)
 {
 	struct gpio_v2_line_info linfo;
 	struct gpiochip_info chinfo;
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 3fad16d..efb4f74 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -88,7 +88,9 @@ GPIOD_TEST_CASE(find_line_bad)
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
-	g_assert_cmpint(gpiod_chip_find_line(chip, "nonexistent"), ==, -1);
+	g_assert_cmpint(
+		gpiod_chip_get_line_offset_from_name(chip,
+						     "nonexistent"), ==, -1);
 	gpiod_test_expect_errno(ENOENT);
 }
 
@@ -112,7 +114,8 @@ GPIOD_TEST_CASE(find_line_good)
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
-	g_assert_cmpint(gpiod_chip_find_line(chip, "baz"), ==, 4);
+	g_assert_cmpint(gpiod_chip_get_line_offset_from_name(chip, "baz"),
+			==, 4);
 }
 
 /* Verify that for duplicated line names, the first one is returned. */
@@ -136,5 +139,6 @@ GPIOD_TEST_CASE(find_line_duplicate)
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
-	g_assert_cmpint(gpiod_chip_find_line(chip, "baz"), ==, 2);
+	g_assert_cmpint(gpiod_chip_get_line_offset_from_name(chip, "baz"),
+			==, 2);
 }
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 36eba86..03b15c9 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -75,7 +75,7 @@ int main(int argc, char **argv)
 			die_perror("unable to open %s", entries[i]->d_name);
 		}
 
-		offset = gpiod_chip_find_line(chip, argv[0]);
+		offset = gpiod_chip_get_line_offset_from_name(chip, argv[0]);
 		if (offset >= 0) {
 			info = gpiod_chip_get_info(chip);
 			if (!info)
-- 
2.32.0

