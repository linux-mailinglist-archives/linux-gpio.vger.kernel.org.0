Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B803642C2E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 16:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbiLEPo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 10:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbiLEPof (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 10:44:35 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB091FCC1
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 07:44:13 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg10so9056807wmb.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 07:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dSXXpqkOfI6iX7DPdSwqjx/kWkV+rgw6PUOKgDniLQ=;
        b=F/C+bNc5BVLGPws2uUTW988I2HivgvoZ6p+JTXlCKQhLvg6SR0Id5SgeBJYoSbP2NN
         SZdBKtDy7cP558innIXM8hj/D/ypDsRwAMH9FtPW5UQBRCUQMO6sKA3pxrCz3Hb1pXaf
         5NPuer/nJXago+X6AiCJ8bhQwDhOfNN1fcsuq4cTvJX+0hSWW0b95i0Plk8cXtZDWrti
         CwWJ26Jx1YgoeKJNI5I/o5rzgb/q63UJ+Teb9F3zISXW6OL+PB0E+kiwl39OJKVTI/ZV
         yE1Ew4qvEC+fmVoRcfFhLiZQNljxRJpKbI0xoZMFKqXedvb0S0XZUF5lHU2LyfiGY1iI
         SWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dSXXpqkOfI6iX7DPdSwqjx/kWkV+rgw6PUOKgDniLQ=;
        b=egnvnY+XnjcHm/SgpdTn8/2jIZ7YjnHfmSCGlkDajQbuUKXeE4Zn5I78eLdYcHqfkL
         UzhQu+pWRcyIN5p6Ye/BpGiPVV/BIAxjys3+29H4GhJtTqXZNTUZoL/+b3i6khOboQyU
         mRfwDrBkKy+yW0/tfzjsCutygZpnX5mFP2B40m2aKuOqmaa4dSenLjCtIxYXf/HPtHoV
         WDLh88R/ZA6Ax3CVX3SdwB/eNQ2Cj/5O84FlXe+Q884p289ggMvMdj5nSBNzYvLeczjS
         gzxC8TyWslfonLPfzJo4E9c9BoiQBeCy4O7DRRhQc8+lMns/s/DL3ERMI4LSb6anJkbD
         /IEQ==
X-Gm-Message-State: ANoB5pnl61Qwm2eQIbvkqn2iiWhoPvjY3HrpXtLfyFNlATEWYYpZMNqQ
        1wTeLBUvJpE8oflz+5qUL9MxJg==
X-Google-Smtp-Source: AA0mqf4E5jtwThvGtdIMYPeAhjZeLR7tS4TUtwsfcdIqLLF0Beo0ruECcXsW5Q1Na9dKzT0WSXkutA==
X-Received: by 2002:a05:600c:3c87:b0:3d0:58bb:9fa3 with SMTP id bg7-20020a05600c3c8700b003d058bb9fa3mr27348653wmb.39.1670255052235;
        Mon, 05 Dec 2022 07:44:12 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1845:911d:bbf3:b5df])
        by smtp.gmail.com with ESMTPSA id i10-20020a1c540a000000b003cfc02ab8basm21138060wmb.33.2022.12.05.07.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:44:11 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] gpiosim: fix a resource leak
Date:   Mon,  5 Dec 2022 16:44:09 +0100
Message-Id: <20221205154409.1012081-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If we set the number of lines to x, set line names or hogs for lines
from 0 through x, then set the number of lines to (x - y), we will not
unlink all the line directories as we only iterate up to num_lines in
bank_release().

Allocate a small structure for every line we create a lineX directory
for and iterate over it in bank_release() to know exactly which ones
need freeing.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim.c | 92 ++++++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 34 deletions(-)

diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 45a0013..a8410f3 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -228,6 +228,12 @@ static void list_del(struct list_head *entry)
 	     !list_entry_is_head(pos, head, member); \
 	     pos = list_next_entry(pos, member))
 
+#define list_for_each_entry_safe(pos, next, head, member) \
+	for (pos = list_first_entry(head, typeof(*pos), member), \
+	     next = list_next_entry(pos, member); \
+	     !list_entry_is_head(pos, head, member); \
+	     pos = next, next = list_next_entry(next, member))
+
 static int open_write_close(int base_fd, const char *where, const char *what)
 {
 	ssize_t written, size;
@@ -411,6 +417,12 @@ struct gpiosim_bank {
 	int cfs_dir_fd;
 	int sysfs_dir_fd;
 	size_t num_lines;
+	struct list_head lines;
+};
+
+struct gpiosim_line {
+	struct list_head siblings;
+	unsigned int offset;
 };
 
 static inline struct gpiosim_ctx *to_gpiosim_ctx(struct refcount *ref)
@@ -841,15 +853,18 @@ static void bank_release(struct refcount *ref)
 {
 	struct gpiosim_bank *bank = to_gpiosim_bank(ref);
 	struct gpiosim_dev *dev = bank->dev;
-	unsigned int i;
+	struct gpiosim_line *line, *tmp;
 	char buf[64];
 
-	/* FIXME should be based on dirent because num_lines can change. */
-	for (i = 0; i < bank->num_lines; i++) {
-		snprintf(buf, sizeof(buf), "line%u/hog", i);
+	list_for_each_entry_safe(line, tmp, &bank->lines, siblings) {
+		snprintf(buf, sizeof(buf), "line%u/hog", line->offset);
 		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
-		snprintf(buf, sizeof(buf), "line%u", i);
+
+		snprintf(buf, sizeof(buf), "line%u", line->offset);
 		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
+
+		list_del(&line->siblings);
+		free(line);
 	}
 
 	list_del(&bank->siblings);
@@ -900,6 +915,7 @@ GPIOSIM_API struct gpiosim_bank *gpiosim_bank_new(struct gpiosim_dev *dev)
 	bank->item_name = item_name;
 	bank->num_lines = 1;
 	bank->id = id;
+	list_init(&bank->lines);
 
 	return bank;
 
@@ -969,25 +985,34 @@ GPIOSIM_API int gpiosim_bank_set_num_lines(struct gpiosim_bank *bank,
 	return 0;
 }
 
-/*
- * Create a sub-directory under given bank's configfs directory. Do nothing
- * if the directory exists and is writable. Mode is O_RDONLY.
- */
-static int bank_mkdirat(struct gpiosim_bank *bank, const char *path)
+static int bank_make_line_dir(struct gpiosim_bank *bank, unsigned int offset)
 {
+	struct gpiosim_line *line;
+	char buf[32];
 	int ret;
 
-	ret = faccessat(bank->cfs_dir_fd, path, W_OK, 0);
+	snprintf(buf, sizeof(buf), "line%u", offset);
+
+	ret = faccessat(bank->cfs_dir_fd, buf, W_OK, 0);
+	if (!ret)
+		return 0;
+	if (ret && errno != ENOENT)
+		return -1;
+
+	line = malloc(sizeof(*line));
+	if (!line)
+		return -1;
+
+	ret = mkdirat(bank->cfs_dir_fd, buf, O_RDONLY);
 	if (ret) {
-		if (errno == ENOENT) {
-			ret = mkdirat(bank->cfs_dir_fd, path, O_RDONLY);
-			if (ret)
-				return -1;
-		} else {
-			return -1;
-		}
+		free(line);
+		return -1;
 	}
 
+	memset(line, 0, sizeof(*line));
+	line->offset = offset;
+	list_add(&line->siblings, &bank->lines);
+
 	return 0;
 }
 
@@ -996,24 +1021,18 @@ GPIOSIM_API int gpiosim_bank_set_line_name(struct gpiosim_bank *bank,
 					   const char *name)
 {
 	char buf[32];
-	int ret, fd;
+	int ret;
 
 	if (!dev_check_pending(bank->dev))
 		return -1;
 
-	snprintf(buf, sizeof(buf), "line%u", offset);
-
-	ret = bank_mkdirat(bank, buf);
+	ret = bank_make_line_dir(bank, offset);
 	if (ret)
 		return -1;
 
-	fd = openat(bank->cfs_dir_fd, buf, O_RDONLY);
-	if (fd < 0)
-		return -1;
+	snprintf(buf, sizeof(buf), "line%u/name", offset);
 
-	ret = open_write_close(fd, "name", name ?: "");
-	close(fd);
-	return ret;
+	return open_write_close(bank->cfs_dir_fd, buf, name ?: "");
 }
 
 GPIOSIM_API int gpiosim_bank_hog_line(struct gpiosim_bank *bank,
@@ -1040,17 +1059,22 @@ GPIOSIM_API int gpiosim_bank_hog_line(struct gpiosim_bank *bank,
 	if (!dev_check_pending(bank->dev))
 		return -1;
 
-	snprintf(buf, sizeof(buf), "line%u", offset);
-
-	ret = bank_mkdirat(bank, buf);
+	ret = bank_make_line_dir(bank, offset);
 	if (ret)
 		return -1;
 
 	snprintf(buf, sizeof(buf), "line%u/hog", offset);
 
-	ret = bank_mkdirat(bank, buf);
-	if (ret)
-		return -1;
+	ret = faccessat(bank->cfs_dir_fd, buf, W_OK, 0);
+	if (ret) {
+		if (errno == ENOENT) {
+			ret = mkdirat(bank->cfs_dir_fd, buf, O_RDONLY);
+			if (ret)
+				return -1;
+		} else {
+			return -1;
+		}
+	}
 
 	fd = openat(bank->cfs_dir_fd, buf, O_RDONLY);
 	if (fd < 0)
-- 
2.37.2

