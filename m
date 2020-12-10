Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD052D5B97
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgLJNYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732914AbgLJNYH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:07 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BACC06179C
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:27 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id y23so5310372wmi.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E/y6OQOvdPOBskkmYC0zRTt8HrGrenF6WJlIv6knk3Q=;
        b=T22UOOsIjZWyKPa8pj4oy5SbCXRgbkACPrt0hr5+rmUxcyMDVYAXJEEzSY/DDjlhI5
         NLUUBAYkQiP1h9AZPXpFuMTuXfpsRxLbQ21HlK0ZqUwLd5+l/UDChM0oIKBp2d87t0J1
         unUzcApMDqwLILPZh1IpA6GZbxqDhmmpNHyT++rk+//+b53zgXE0Q+z2Qumnj+EN3Wcj
         bMwqtKEySNMAmYb7mZVNo6RlQNzKqQzMT2+wIhE1hhsn+lqYJK56Y5WOHfnq8Cz0x2/F
         p3xv0vQUcgad1R5gtzqPwcY0suf3a2JZVDkRVU9nZSPRPXnnWsbtx+ds4+wb5qTXYap0
         qmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E/y6OQOvdPOBskkmYC0zRTt8HrGrenF6WJlIv6knk3Q=;
        b=tbpJs+nqRqAuXma+vLyZxBYIEQnL3h5fdtHSZtrVijHFUGip7RhDvtpx6wBQtS4/Lm
         7Bh0X5yAtAhGG1/3iRPCC0C3y56o3HKrHiwGvm6mRZr54sHJ4UHI2c+yrl1gy/WFUEQn
         Jc2oTBKibN/6Zk9PHGH6sjOInwHAD0XrAbqoB7YUksH6JzBGXlkQX34dA0hDQnsRMi77
         u6dfDWT2PFTWhw7nPob7MtW4nQIRgiw0vOY6cViAJp+Ibx+mY2BO5u/pyzaifJsbJR9d
         6/K66KAJugomd3dNZcasNItvn/pWb2CX0UAKS8GLFAjGqaozHQCUhKR1fAXaAGXpXDT0
         1Gfg==
X-Gm-Message-State: AOAM531pohjXrxnEs7V/qxGC+JkV7/AagS7W4f9HVevOu1CrzcLGDu1F
        xwMLV3nKBdp500FPL3lAWTuO0g==
X-Google-Smtp-Source: ABdhPJxTgqKgh3H6/uqwwgxbzt5o7athFxz34ukzpJTNLp1n6fpDBqTZc032A0KvfIWggC766d+i0A==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr8071944wmh.88.1607606606295;
        Thu, 10 Dec 2020 05:23:26 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 03/14] core: export gpiod_is_gpiochip_device()
Date:   Thu, 10 Dec 2020 14:23:04 +0100
Message-Id: <20201210132315.5785-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We'll be dropping chip iterators treewide. Instead we'll encourage
scanning /dev for GPIO chip devices. Exporting this function allows
users to easily check if given file represents a GPIO chip character
device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/gpiod.h    |  8 ++++++++
 lib/core.c         |  4 ++--
 tests/tests-chip.c | 15 +++++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 355a99a..742dfc2 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -71,6 +71,14 @@ struct gpiod_line_bulk;
  * Functions and data structures dealing with GPIO chips.
  */
 
+/**
+ * @brief Check if the file pointed to by path is a GPIO chip character device.
+ * @param path Path to check.
+ * @return True if the file exists and is a GPIO chip character device or a
+ *         symbolic link to it.
+ */
+bool gpiod_is_gpiochip_device(const char *path) GPIOD_API;
+
 /**
  * @brief Open a gpiochip by path.
  * @param path Path to the gpiochip device file.
diff --git a/lib/core.c b/lib/core.c
index bf52fa6..efba959 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -177,7 +177,7 @@ void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
 	     (index) < (bulk)->num_lines;				\
 	     (index)++, (line) = (bulk)->lines[(index)])
 
-static bool is_gpiochip_cdev(const char *path)
+bool gpiod_is_gpiochip_device(const char *path)
 {
 	char *name, *realname, *sysfsp, sysfsdev[16], devstr[16];
 	struct stat statbuf;
@@ -282,7 +282,7 @@ struct gpiod_chip *gpiod_chip_open(const char *path)
 	 * We were able to open the file but is it really a gpiochip character
 	 * device?
 	 */
-	if (!is_gpiochip_cdev(path))
+	if (!gpiod_is_gpiochip_device(path))
 		goto err_close_fd;
 
 	chip = malloc(sizeof(*chip));
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 289c458..2f19c49 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -11,6 +11,21 @@
 
 #define GPIOD_TEST_GROUP "chip"
 
+GPIOD_TEST_CASE(is_gpiochip_good, 0, { 8 })
+{
+	g_assert_true(gpiod_is_gpiochip_device(gpiod_test_chip_path(0)));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_bad, 0, { 8 })
+{
+	g_assert_false(gpiod_is_gpiochip_device("/dev/null"));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_nonexistent, 0, { 8 })
+{
+	g_assert_false(gpiod_is_gpiochip_device("/dev/nonexistent_gpiochip"));
+}
+
 GPIOD_TEST_CASE(open_good, 0, { 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-- 
2.29.1

