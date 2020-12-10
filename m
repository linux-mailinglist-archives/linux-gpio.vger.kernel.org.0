Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095192D5BA2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389202AbgLJNYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389114AbgLJNYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:45 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2282BC061285
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:35 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id k14so5481237wrn.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lb5AeKppZ+OB7xrPFrogKVvDyFShpykJR5gK9BWPsIA=;
        b=Onagba7v55bps3OjXuqlR7+cc5q8MMO8FizbeGjjN3zf9rGoo/+HJ4LNOlzVtjXP/g
         ia5ffNwtC9SKIIkHv5bLFS+1lq8B5mqKu05D+cNzcVlxB3ti1CQqDkTWBjX8opmAiJvy
         uea2P3dSBOIVTYgugdFn3Fd3JM8dWuv8vQDXaIkLHR4E5QWwgQQPuCF6+VjkcKHFxO96
         ln/MUDwSuYqazk9rPMPbQLI2POsPK5CLHJE++IkA2KBMq3B2FU41a7dumKYMb5i2cpb8
         4tvgFU2Wg0N6Ox9+SARESH+UZc0WxrItEA6DjMMlxZAMzriqMk05E6ugnJOKb5mpZ/LY
         2WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lb5AeKppZ+OB7xrPFrogKVvDyFShpykJR5gK9BWPsIA=;
        b=tnFgjMpm7WiviSCCPT7DC24/syBrysm8gM+T8mBXRrmEx9X4j8slfDKdN7Jt4wXykk
         NCVXIklz1qaq9h4ACVGG176IM4soHyZ/q55tkYVp1DsUPI9IHZ6bu3cN15VkRu7Wa0La
         k3qBJfeSpJgEBu1VVjKLNE7q5+B2vYXj5Pohy3KLAJjgSwEENhRaqPRh2VfrWDzuea4X
         c69GijsuRjSxfctNeL4H9HqJ1wbiJ0oTGujlxNdIG1iUdzDF1ppNdJawBNE3ynIos7Fm
         Baf29o4mpLOxzhgoK5jxySA79EXOdamXtwqSXWM72UDFagwTRdtFvm/A7WS0gg/+xXwa
         HRGA==
X-Gm-Message-State: AOAM532T+Nx3BaibOcpVmiykuuifI9p/2Aqt82fv7XI33MJuLwdqceal
        zz9m22tToPlOPChG+IqXwYBJRQ==
X-Google-Smtp-Source: ABdhPJxOsr/utKoy9h93eFeuVCOF2TXEzehSwBLBl/oNqBuu1WVIiQ72Q63cA/LtnOFIuoKvM2ae/Q==
X-Received: by 2002:a5d:4209:: with SMTP id n9mr8103818wrq.128.1607606613943;
        Thu, 10 Dec 2020 05:23:33 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:33 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 09/14] core: kill gpiod_line_get()
Date:   Thu, 10 Dec 2020 14:23:10 +0100
Message-Id: <20201210132315.5785-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're dropping all interfaces for global line lookup and accessing. Lines
should be always accessed via their owning chip object.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/gpiod.h    | 15 ---------------
 lib/helpers.c      | 18 ------------------
 tests/tests-line.c | 21 ---------------------
 3 files changed, 54 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 2e8323a..c1113bf 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1062,21 +1062,6 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
  * Functions that didn't fit anywhere else.
  */
 
-/**
- * @brief Get a GPIO line handle by GPIO chip description and offset.
- * @param device String describing the gpiochip.
- * @param offset The offset of the GPIO line.
- * @return GPIO line handle or NULL if an error occurred.
- *
- * This routine provides a shorter alternative to calling
- * ::gpiod_chip_open_lookup and ::gpiod_chip_get_line.
- *
- * If this function succeeds, the caller is responsible for closing the
- * associated GPIO chip.
- */
-struct gpiod_line *
-gpiod_line_get(const char *device, unsigned int offset) GPIOD_API;
-
 /**
  * @brief Find a GPIO line by its name.
  * @param name Name of the GPIO line.
diff --git a/lib/helpers.c b/lib/helpers.c
index b3050ca..2063c3f 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -378,24 +378,6 @@ int gpiod_line_request_bulk_both_edges_events_flags(
 					GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
 }
 
-struct gpiod_line *gpiod_line_get(const char *device, unsigned int offset)
-{
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-
-	chip = gpiod_chip_open_lookup(device);
-	if (!chip)
-		return NULL;
-
-	line = gpiod_chip_get_line(chip, offset);
-	if (!line) {
-		gpiod_chip_close(chip);
-		return NULL;
-	}
-
-	return line;
-}
-
 struct gpiod_line *gpiod_line_find(const char *name)
 {
 	struct gpiod_chip_iter *iter;
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 4bb5f0f..235df0f 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -716,27 +716,6 @@ GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 }
 
-GPIOD_TEST_CASE(get_line_helper, 0, { 16, 16, 32, 16 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-
-	line = gpiod_line_get(gpiod_test_chip_name(2), 18);
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-	chip = gpiod_line_get_chip(line);
-	g_assert_cmpint(gpiod_line_offset(line), ==, 18);
-}
-
-GPIOD_TEST_CASE(get_line_helper_invalid_offset, 0, { 16, 16, 32, 16 })
-{
-	struct gpiod_line *line;
-
-	line = gpiod_line_get(gpiod_test_chip_name(3), 18);
-	g_assert_null(line);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
 GPIOD_TEST_CASE(find_good, GPIOD_TEST_FLAG_NAMED_LINES, { 16, 16, 32, 16 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-- 
2.29.1

