Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21C5743BD6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 14:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjF3M2J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 08:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjF3M2J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 08:28:09 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8068D19B5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:28:07 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-313e12db357so2200796f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 05:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688128086; x=1690720086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7RekjfWWo8VbnYQss2qAr2/EN4cFn8FMfZc8nSZkPQ=;
        b=z2luj64Zp29Hfp4iarSjScSJZYo1gtXPGGt5pnrHXg+5hJDV44zamxyah22MgcadmC
         xgXNQVeqCFYO8e8xaC6ede815KqqrwQignRAhIVLIua67pCGSmfIe8rPIBcpso+ORLtg
         vofqvbEolyL9cvJ6F7QIl5NGoXQBLfzLxop31mcqaE7fsdl3skhY/QHPaUKu9oEg2eH/
         xsMXjyu8h7Ah3OZjd3xxiPns0wg3u4WnwrcOkR1G7dI23J5RVEqR+07VV/HCiv+H9z5X
         9Xn7UHWzStVCp6d1JxLXnA3uvZ6DL1zwlpf5XwY9lvCJ4k7oai0E9d4124mVnABJTsFZ
         OWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688128086; x=1690720086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7RekjfWWo8VbnYQss2qAr2/EN4cFn8FMfZc8nSZkPQ=;
        b=I6XWCMrkPsuBvJ0e05PvTCrX1aCMQLsSvKWBWVV+4cd9U+9eKxbeych1LFncf+004C
         H9U0vlODlR99cMWgua2NvKUZo+N08mvpbyEIc5n3EzqwOZCvqk54TttOYNtZPegjFzgb
         Z5vZf5LTaE9d90WdRwezt33Y+Kep2xK0EDZlq6CsSaxN/sJ+/K9HvOQv2GOZazyZpSoY
         4fmSNAg+KquFcMTUgdakl+IGffkl53c6/bSJ8PfdLaxz/FIiqxNtPTVe3MM5qwm4hSpB
         3jUxJfb11bs9SIR4ib8kP4ktKR6jTzfYC02mBRu9DJQp70nHo2xxTVBb716UyxAF5k0V
         j3sg==
X-Gm-Message-State: ABy/qLYxFAGg74RvyTR1TAurAgfbyxEuEYJ2LchOo1cqNBKzlQsmqvKS
        ZKSgHcjpdnUpTcu93WUhps8E5A==
X-Google-Smtp-Source: APBJJlHib59PJQ3tbuFKuSfmX8Qb5m9+rIY08kMJfSRQjXEpYxa0rjS3zIpxEl65nEWTu/3yrXB+Cw==
X-Received: by 2002:adf:eccc:0:b0:313:f6fc:1f48 with SMTP id s12-20020adfeccc000000b00313f6fc1f48mr2298016wro.14.1688128085881;
        Fri, 30 Jun 2023 05:28:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7302:c906:33b6:6f53])
        by smtp.gmail.com with ESMTPSA id c1-20020a056000104100b003140039f318sm9381975wrx.69.2023.06.30.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 05:28:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] build: remove redundant SOURCES assignments
Date:   Fri, 30 Jun 2023 14:27:58 +0200
Message-Id: <20230630122758.117871-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For any given target (let's say foobar), automake defaults to looking for
foobar.c if foobar_SOURCES are not specified. Remove redundant assignments
as we've seen multiple hidden typos in makefiles already.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 examples/Makefile.am      | 26 --------------------------
 tests/gpiosim/Makefile.am |  1 -
 tools/Makefile.am         | 12 ------------
 3 files changed, 39 deletions(-)

diff --git a/examples/Makefile.am b/examples/Makefile.am
index daf902b..ed01dbc 100644
--- a/examples/Makefile.am
+++ b/examples/Makefile.am
@@ -20,29 +20,3 @@ noinst_PROGRAMS = \
 	watch_line_rising \
 	watch_line_value \
 	watch_multiple_line_values
-
-async_watch_line_value_SOURCES = async_watch_line_value.c
-
-find_line_by_name_SOURCES = find_line_by_name.c
-
-get_chip_info_SOURCES = get_chip_info.c
-
-get_line_info_SOURCES = get_line_info.c
-
-get_line_value_SOURCES = get_line_value.c
-
-get_multiple_line_values_SOURCES = get_multiple_line_values.c
-
-reconfigure_input_to_output_SOURCES = reconfigure_input_to_output.c
-
-toggle_line_value_SOURCES = toggle_line_value.c
-
-toggle_multiple_line_value_SOURCES = toggle_multiple_line_value.c
-
-watch_line_info_SOURCES = watch_line_info.c
-
-watch_line_rising_SOURCES = watch_line_rising.c
-
-watch_line_value_SOURCES = watch_line_value.c
-
-watch_multiple_line_values_SOURCES = watch_multiple_line_values.c
diff --git a/tests/gpiosim/Makefile.am b/tests/gpiosim/Makefile.am
index 05dce79..5888873 100644
--- a/tests/gpiosim/Makefile.am
+++ b/tests/gpiosim/Makefile.am
@@ -12,5 +12,4 @@ libgpiosim_la_CFLAGS = $(AM_CFLAGS) $(KMOD_CFLAGS) $(MOUNT_CFLAGS)
 libgpiosim_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GPIOSIM_VERSION))
 libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(MOUNT_LIBS) -pthread
 
-gpiosim_selftest_SOURCES = gpiosim-selftest.c
 gpiosim_selftest_LDADD = libgpiosim.la
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 92a819f..40ea3a3 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -18,18 +18,6 @@ endif
 
 bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpionotify
 
-gpiodetect_SOURCES = gpiodetect.c
-
-gpioinfo_SOURCES = gpioinfo.c
-
-gpioget_SOURCES = gpioget.c
-
-gpioset_SOURCES = gpioset.c
-
-gpiomon_SOURCES = gpiomon.c
-
-gpionotify_SOURCES = gpionotify.c
-
 if WITH_TESTS
 
 noinst_SCRIPTS = gpio-tools-test.bash
-- 
2.39.2

