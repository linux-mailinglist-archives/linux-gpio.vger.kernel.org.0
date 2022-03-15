Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D130F4D93E8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 06:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344859AbiCOFeN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 01:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344851AbiCOFeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 01:34:07 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E24426C3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:32:55 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id h2so13859114pfh.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kAVdOmwt/qXJYTeSpszyIg2oJUh4OyCICloIuINos0Y=;
        b=WSAdRMRL8sNPC8WBqVbQOYPU/U3ePKGNI5CNz2vY/TMwoKTdY1GOqCF/my6nvdWjjx
         2r9Bil+isaCeTaf4809EbDAiQjoZr87C9YxQL8Jz8M9317cSJo2KZL+csM72dZtjLTcT
         mrPYOlpqGG+0yLpxrgH+9UgfDuiyh/NkBJJFa2VxaA6KdoAn+BjbsEtR/ZNP5pzpd2xY
         wP6amSKN+n4XiiDoq1SqTY2UiRFVrrtSIJ0YW4jBfNSSiCDu6mP89DtheIMyHCTGD8Wq
         d+f/bPCWUBoS1/0lO3tFQG6Y8epGpY8Xfg19fn6f2qP3aGGEm7QpsZq4poSJA1OA/3Hu
         ks+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kAVdOmwt/qXJYTeSpszyIg2oJUh4OyCICloIuINos0Y=;
        b=UMgnwVD9T99/pTdUNcAyb1xTKsGroTjZYvWmoovSw7DHpo6RRj6P5LYIWsMNS5xgQf
         vHU8MOsCdDG9O7kmNMKMnWWWCEZkuyE4ZWdnZB3W2jMM8alaZTDQxZ3I8DNnBBK4akm3
         AqOGEClkT5Xu4m3RkTKGCd92O8b3SWdxfDjpvImGdMpgKqwMNyKKDk/KIuny5+u0NRR7
         wAsRZTGIWVOLhWKbtL+1QWynvw8rtSFEPmeYt2TfRw9BhhBbTh8laea0k/1dGomX9yT6
         BEoDk9mK4YvG8oinmLYWnAbVPwAZlK4KvDa4pjoHL3ZDPHjaMz1MFc9lLkmC3Ed3tsfA
         c/Mw==
X-Gm-Message-State: AOAM5339/WmZ5SGgjjKhxTN+IgO+GmXRRe1PqumF62Zvf9gs7tT5GSWP
        7CvjVbWlBzmcF4jofe4b1gXRPOIzKwvwow==
X-Google-Smtp-Source: ABdhPJxCSXUyNA3Ag4loFS5J7LbOI8OkSHv0yhz3ZfKlKniHWOyA11xt6edXHKZleVN9qFAsvILjIA==
X-Received: by 2002:a63:82c1:0:b0:37c:9950:2fec with SMTP id w184-20020a6382c1000000b0037c99502fecmr22284135pgd.13.1647322374251;
        Mon, 14 Mar 2022 22:32:54 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id a22-20020a056a000c9600b004f7ba8b445asm8840631pfv.65.2022.03.14.22.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 22:32:53 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 2/3] core: split chip_info out of chip
Date:   Tue, 15 Mar 2022 13:32:19 +0800
Message-Id: <20220315053220.102934-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315053220.102934-1-warthog618@gmail.com>
References: <20220315053220.102934-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The core library should be minimalist, only performing the operations
required, but gpiod_chip_open() always fetches the chip info,
even though the majority of the time the chip will only be used to
request a line, so the chip info is not required.

Split the chip_info from the chip, in the same style as line_info, and
update methods and tools appropriately.

In the rare occasions that the user requires the chip info they can
request it themselves using gpiod_chip_get_info(), as demonstrated
in the tool changes.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h            | 69 +++++++++++++++++++++++--------
 lib/Makefile.am            |  1 +
 lib/chip-info.c            | 72 ++++++++++++++++++++++++++++++++
 lib/chip.c                 | 85 ++++++++++++++++----------------------
 lib/internal.h             |  2 +
 tests/Makefile.am          |  1 +
 tests/gpiod-test-helpers.h |  3 ++
 tests/tests-chip-info.c    | 54 ++++++++++++++++++++++++
 tests/tests-chip.c         | 32 --------------
 tools/gpiodetect.c         | 13 ++++--
 tools/gpiofind.c           |  8 +++-
 tools/gpioinfo.c           | 16 ++++---
 12 files changed, 249 insertions(+), 107 deletions(-)
 create mode 100644 lib/chip-info.c
 create mode 100644 tests/tests-chip-info.c

diff --git a/include/gpiod.h b/include/gpiod.h
index 956ee12..e099515 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -41,6 +41,7 @@ extern "C" {
  */
 
 struct gpiod_chip;
+struct gpiod_chip_info;
 struct gpiod_line_info;
 struct gpiod_line_config;
 struct gpiod_request_config;
@@ -75,18 +76,12 @@ struct gpiod_chip *gpiod_chip_open(const char *path);
 void gpiod_chip_close(struct gpiod_chip *chip);
 
 /**
- * @brief Get the name of the chip as represented in the kernel.
+ * @brief Get information about the chip.
  * @param chip GPIO chip object.
- * @return Pointer to a human-readable string containing the chip name.
+ * @return New GPIO chip info object or NULL if an error occurred. The returned
+ *         object must be freed by the caller using ::gpiod_chip_info_free.
  */
-const char *gpiod_chip_get_name(struct gpiod_chip *chip);
-
-/**
- * @brief Get the label of the chip as represented in the kernel.
- * @param chip GPIO chip object.
- * @return Pointer to a human-readable string containing the chip label.
- */
-const char *gpiod_chip_get_label(struct gpiod_chip *chip);
+struct gpiod_chip_info *gpiod_chip_get_info(struct gpiod_chip *chip);
 
 /**
  * @brief Get the path used to open the chip.
@@ -95,13 +90,6 @@ const char *gpiod_chip_get_label(struct gpiod_chip *chip);
  */
 const char *gpiod_chip_get_path(struct gpiod_chip *chip);
 
-/**
- * @brief Get the number of lines exposed by the chip.
- * @param chip GPIO chip object.
- * @return Number of GPIO lines.
- */
-size_t gpiod_chip_get_num_lines(struct gpiod_chip *chip);
-
 /**
  * @brief Get a snapshot of information about a line.
  * @param chip GPIO chip object.
@@ -187,6 +175,53 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 			 struct gpiod_request_config *req_cfg,
 			 struct gpiod_line_config *line_cfg);
 
+/**
+ * @}
+ *
+ * @defgroup chip_info Chip info
+ * @{
+ *
+ * Functions for retrieving kernel information about chips.
+ *
+ * Line info object contains an immutable snapshot of a chip's status.
+ *
+ * The chip info contains all the publicly available information about a
+ * chip.
+ *
+ * Some accessor methods return pointers.  Those pointers refer to internal
+ * fields.  The lifetimes of those fields are tied to the lifetime of the
+ * containing chip info object.
+ * Such pointers remain valid until ::gpiod_chip_info_free is called on the
+ * containing chip info object. They must not be freed by the caller.
+ */
+
+/**
+ * @brief Free a chip info object and release all associated resources.
+ * @param info GPIO chip info object to free.
+ */
+void gpiod_chip_info_free(struct gpiod_chip_info *info);
+
+/**
+ * @brief Get the name of the chip as represented in the kernel.
+ * @param info GPIO chip info object.
+ * @return Pointer to a human-readable string containing the chip name.
+ */
+const char *gpiod_chip_info_get_name(struct gpiod_chip_info *info);
+
+/**
+ * @brief Get the label of the chip as represented in the kernel.
+ * @param info GPIO chip info object.
+ * @return Pointer to a human-readable string containing the chip label.
+ */
+const char *gpiod_chip_info_get_label(struct gpiod_chip_info *info);
+
+/**
+ * @brief Get the number of lines exposed by the chip.
+ * @param info GPIO chip info object.
+ * @return Number of GPIO lines.
+ */
+size_t gpiod_chip_info_get_num_lines(struct gpiod_chip_info *info);
+
 /**
  * @}
  *
diff --git a/lib/Makefile.am b/lib/Makefile.am
index b6854d9..1bd2b2e 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -3,6 +3,7 @@
 
 lib_LTLIBRARIES = libgpiod.la
 libgpiod_la_SOURCES =	chip.c \
+			chip-info.c \
 			edge-event.c \
 			info-event.c \
 			internal.h \
diff --git a/lib/chip-info.c b/lib/chip-info.c
new file mode 100644
index 0000000..df1f66a
--- /dev/null
+++ b/lib/chip-info.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Line attribute data structure and functions. */
+
+#include <gpiod.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "internal.h"
+
+struct gpiod_chip_info {
+	size_t num_lines;
+	char name[32];
+	char label[32];
+};
+
+GPIOD_API void gpiod_chip_info_free(struct gpiod_chip_info *info)
+{
+	if (!info)
+		return;
+
+	free(info);
+}
+
+
+GPIOD_API const char *gpiod_chip_info_get_name(struct gpiod_chip_info *info)
+{
+	return info->name;
+}
+
+GPIOD_API const char *gpiod_chip_info_get_label(struct gpiod_chip_info *info)
+{
+	return info->label;
+}
+
+GPIOD_API size_t gpiod_chip_info_get_num_lines(struct gpiod_chip_info *info)
+{
+	return info->num_lines;
+}
+
+struct gpiod_chip_info *
+gpiod_chip_info_from_kernel(struct gpiochip_info *uinfo)
+{
+	struct gpiod_chip_info *info;
+
+	info = malloc(sizeof(*info));
+	if (!info)
+		return NULL;
+
+	memset(info, 0, sizeof(*info));
+
+	info->num_lines = uinfo->lines;
+
+	/*
+	 * GPIO device must have a name - don't bother checking this field. In
+	 * the worst case (would have to be a weird kernel bug) it'll be empty.
+	 */
+	strncpy(info->name, uinfo->name, sizeof(info->name));
+
+	/*
+	 * The kernel sets the label of a GPIO device to "unknown" if it
+	 * hasn't been defined in DT, board file etc. On the off-chance that
+	 * we got an empty string, do the same.
+	 */
+	if (uinfo->label[0] == '\0')
+		strncpy(info->label, "unknown", sizeof(info->label));
+	else
+		strncpy(info->label, uinfo->label, sizeof(info->label));
+
+	return info;
+}
diff --git a/lib/chip.c b/lib/chip.c
index 50d8312..2dcabb3 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -15,17 +15,13 @@
 
 struct gpiod_chip {
 	int fd;
-	size_t num_lines;
-	char name[32];
-	char label[32];
 	char *path;
 };
 
 GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 {
-	struct gpiochip_info info;
 	struct gpiod_chip *chip;
-	int ret, fd;
+	int fd;
 
 	if (!gpiod_is_gpiochip_device(path))
 		return NULL;
@@ -39,39 +35,15 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 		goto err_close_fd;
 
 	memset(chip, 0, sizeof(*chip));
-	memset(&info, 0, sizeof(info));
 
 	chip->path = strdup(path);
 	if (!chip->path)
 		goto err_free_chip;
 
-	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &info);
-	if (ret < 0)
-		goto err_free_path;
-
 	chip->fd = fd;
-	chip->num_lines = info.lines;
-
-	/*
-	 * GPIO device must have a name - don't bother checking this field. In
-	 * the worst case (would have to be a weird kernel bug) it'll be empty.
-	 */
-	strncpy(chip->name, info.name, sizeof(chip->name));
-
-	/*
-	 * The kernel sets the label of a GPIO device to "unknown" if it
-	 * hasn't been defined in DT, board file etc. On the off-chance that
-	 * we got an empty string, do the same.
-	 */
-	if (info.label[0] == '\0')
-		strncpy(chip->label, "unknown", sizeof(chip->label));
-	else
-		strncpy(chip->label, info.label, sizeof(chip->label));
 
 	return chip;
 
-err_free_path:
-	free(chip->path);
 err_free_chip:
 	free(chip);
 err_close_fd:
@@ -90,14 +62,29 @@ GPIOD_API void gpiod_chip_close(struct gpiod_chip *chip)
 	free(chip);
 }
 
-GPIOD_API const char *gpiod_chip_get_name(struct gpiod_chip *chip)
+static int chip_read_chip_info(int fd, struct gpiochip_info *info)
 {
-	return chip->name;
+	int ret;
+
+	memset(info, 0, sizeof(*info));
+
+	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, info);
+	if (ret)
+		return -1;
+
+	return 0;
 }
 
-GPIOD_API const char *gpiod_chip_get_label(struct gpiod_chip *chip)
+GPIOD_API struct gpiod_chip_info *gpiod_chip_get_info(struct gpiod_chip *chip)
 {
-	return chip->label;
+	struct gpiochip_info info;
+	int ret;
+
+	ret = chip_read_chip_info(chip->fd, &info);
+	if (ret < 0)
+		return NULL;
+
+	return gpiod_chip_info_from_kernel(&info);
 }
 
 GPIOD_API const char *gpiod_chip_get_path(struct gpiod_chip *chip)
@@ -105,23 +92,18 @@ GPIOD_API const char *gpiod_chip_get_path(struct gpiod_chip *chip)
 	return chip->path;
 }
 
-GPIOD_API size_t gpiod_chip_get_num_lines(struct gpiod_chip *chip)
-{
-	return chip->num_lines;
-}
-
 static int chip_read_line_info(int fd, unsigned int offset,
-			       struct gpio_v2_line_info *infobuf, bool watch)
+			       struct gpio_v2_line_info *info, bool watch)
 {
 	int ret, cmd;
 
-	memset(infobuf, 0, sizeof(*infobuf));
-	infobuf->offset = offset;
+	memset(info, 0, sizeof(*info));
+	info->offset = offset;
 
 	cmd = watch ? GPIO_V2_GET_LINEINFO_WATCH_IOCTL :
 		      GPIO_V2_GET_LINEINFO_IOCTL;
 
-	ret = ioctl(fd, cmd, infobuf);
+	ret = ioctl(fd, cmd, info);
 	if (ret)
 		return -1;
 
@@ -131,14 +113,14 @@ static int chip_read_line_info(int fd, unsigned int offset,
 static struct gpiod_line_info *
 chip_get_line_info(struct gpiod_chip *chip, unsigned int offset, bool watch)
 {
-	struct gpio_v2_line_info infobuf;
+	struct gpio_v2_line_info info;
 	int ret;
 
-	ret = chip_read_line_info(chip->fd, offset, &infobuf, watch);
+	ret = chip_read_line_info(chip->fd, offset, &info, watch);
 	if (ret)
 		return NULL;
 
-	return gpiod_line_info_from_kernel(&infobuf);
+	return gpiod_line_info_from_kernel(&info);
 }
 
 GPIOD_API struct gpiod_line_info *
@@ -178,16 +160,21 @@ gpiod_chip_read_info_event(struct gpiod_chip *chip)
 
 GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 {
-	struct gpio_v2_line_info infobuf;
+	struct gpiochip_info chinfo;
+	struct gpio_v2_line_info linfo;
 	unsigned int offset;
 	int ret;
 
-	for (offset = 0; offset < chip->num_lines; offset++) {
-		ret = chip_read_line_info(chip->fd, offset, &infobuf, false);
+	ret = chip_read_chip_info(chip->fd, &chinfo);
+	if (ret < 0)
+		return -1;
+
+	for (offset = 0; offset < chinfo.lines; offset++) {
+		ret = chip_read_line_info(chip->fd, offset, &linfo, false);
 		if (ret)
 			return -1;
 
-		if (strcmp(name, infobuf.name) == 0)
+		if (strcmp(name, linfo.name) == 0)
 			return offset;
 	}
 
diff --git a/lib/internal.h b/lib/internal.h
index 9af2cda..ffef578 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -18,6 +18,8 @@
 
 #define GPIOD_BIT(nr)	(1UL << (nr))
 
+struct gpiod_chip_info *
+gpiod_chip_info_from_kernel(struct gpiochip_info *infobuf);
 struct gpiod_line_info *
 gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf);
 int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 89bf868..f37dc03 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -23,6 +23,7 @@ gpiod_test_SOURCES =			\
 		gpiod-test-sim.c	\
 		gpiod-test-sim.h	\
 		tests-chip.c		\
+		tests-chip-info.c	\
 		tests-edge-event.c	\
 		tests-info-event.c	\
 		tests-line-config.c	\
diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
index 4aa4202..acba686 100644
--- a/tests/gpiod-test-helpers.h
+++ b/tests/gpiod-test-helpers.h
@@ -18,6 +18,9 @@
 typedef struct gpiod_chip struct_gpiod_chip;
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_chip, gpiod_chip_close);
 
+typedef struct gpiod_chip_info struct_gpiod_chip_info;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_chip_info, gpiod_chip_info_free);
+
 typedef struct gpiod_line_info struct_gpiod_line_info;
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_line_info, gpiod_line_info_free);
 
diff --git a/tests/tests-chip-info.c b/tests/tests-chip-info.c
new file mode 100644
index 0000000..bffe823
--- /dev/null
+++ b/tests/tests-chip-info.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+#include "gpiod-test-sim.h"
+
+#define GPIOD_TEST_GROUP "chip-info"
+
+GPIOD_TEST_CASE(get_chip_info_name)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_chip_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_chip_get_info(chip);
+	g_assert_nonnull(info);
+	g_assert_cmpstr(gpiod_chip_info_get_name(info), ==,
+			g_gpiosim_chip_get_name(sim));
+}
+
+GPIOD_TEST_CASE(get_chip_info_label)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("label", "foobar",
+							NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_chip_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	info = gpiod_chip_get_info(chip);
+	g_assert_nonnull(info);
+
+	g_assert_cmpstr(gpiod_chip_info_get_label(info), ==, "foobar");
+}
+
+GPIOD_TEST_CASE(get_num_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_chip_info) info = NULL;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	info = gpiod_chip_get_info(chip);
+	g_assert_nonnull(info);
+
+	g_assert_cmpuint(gpiod_chip_info_get_num_lines(info), ==, 16);
+}
+
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 09906e3..3fad16d 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -47,28 +47,6 @@ GPIOD_TEST_CASE(open_chip_not_a_gpio_device)
 	gpiod_test_expect_errno(ENODEV);
 }
 
-GPIOD_TEST_CASE(get_chip_name)
-{
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-
-	g_assert_cmpstr(gpiod_chip_get_name(chip), ==,
-			g_gpiosim_chip_get_name(sim));
-}
-
-GPIOD_TEST_CASE(get_chip_label)
-{
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("label", "foobar",
-							NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-
-	g_assert_cmpstr(gpiod_chip_get_label(chip), ==, "foobar");
-}
-
 GPIOD_TEST_CASE(get_chip_path)
 {
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
@@ -80,16 +58,6 @@ GPIOD_TEST_CASE(get_chip_path)
 	g_assert_cmpstr(gpiod_chip_get_path(chip), ==, path);
 }
 
-GPIOD_TEST_CASE(get_num_lines)
-{
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-
-	g_assert_cmpuint(gpiod_chip_get_num_lines(chip), ==, 16);
-}
-
 GPIOD_TEST_CASE(get_fd)
 {
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 6ce3cb8..8f6e8b3 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -34,6 +34,7 @@ int main(int argc, char **argv)
 {
 	int optc, opti, num_chips, i;
 	struct gpiod_chip *chip;
+	struct gpiod_chip_info *info;
 	struct dirent **entries;
 
 	for (;;) {
@@ -70,11 +71,17 @@ int main(int argc, char **argv)
 		if (!chip)
 			die_perror("unable to open %s", entries[i]->d_name);
 
+		info = gpiod_chip_get_info(chip);
+		if (!info)
+			die_perror("unable to get info for %s", entries[i]->d_name);
+
+
 		printf("%s [%s] (%zu lines)\n",
-		       gpiod_chip_get_name(chip),
-		       gpiod_chip_get_label(chip),
-		       gpiod_chip_get_num_lines(chip));
+		       gpiod_chip_info_get_name(info),
+		       gpiod_chip_info_get_label(info),
+		       gpiod_chip_info_get_num_lines(info));
 
+		gpiod_chip_info_free(info);
 		gpiod_chip_close(chip);
 		free(entries[i]);
 	}
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 910cb8b..36eba86 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -34,6 +34,7 @@ int main(int argc, char **argv)
 {
 	int i, num_chips, optc, opti, offset;
 	struct gpiod_chip *chip;
+	struct gpiod_chip_info *info;
 	struct dirent **entries;
 
 	for (;;) {
@@ -76,8 +77,13 @@ int main(int argc, char **argv)
 
 		offset = gpiod_chip_find_line(chip, argv[0]);
 		if (offset >= 0) {
+			info = gpiod_chip_get_info(chip);
+			if (!info)
+				die_perror("unable to get info for %s", entries[i]->d_name);
+
 			printf("%s %u\n",
-			       gpiod_chip_get_name(chip), offset);
+			       gpiod_chip_info_get_name(info), offset);
+			gpiod_chip_info_free(info);
 			gpiod_chip_close(chip);
 			return EXIT_SUCCESS;
 		}
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index c852b36..fbe2a13 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -125,19 +125,24 @@ static PRINTF(3, 4) void prinfo(bool *of,
 static void list_lines(struct gpiod_chip *chip)
 {
 	bool flag_printed, of, active_low;
+	struct gpiod_chip_info *chip_info;
 	struct gpiod_line_info *info;
 	const char *name, *consumer;
-	size_t i, offset;
+	size_t i, offset, num_lines;
 	int direction;
 
+	chip_info = gpiod_chip_get_info(chip);
+	if (!chip_info)
+		die_perror("unable to retrieve the chip info from chip");
+
+	num_lines = gpiod_chip_info_get_num_lines(chip_info);
 	printf("%s - %zu lines:\n",
-	       gpiod_chip_get_name(chip), gpiod_chip_get_num_lines(chip));
+	       gpiod_chip_info_get_name(chip_info), num_lines);
 
-	for (offset = 0; offset < gpiod_chip_get_num_lines(chip); offset++) {
+	for (offset = 0; offset < num_lines; offset++) {
 		info = gpiod_chip_get_line_info(chip, offset);
 		if (!info)
-			die_perror("unable to retrieve the line object from chip");
-
+			die_perror("unable to retrieve the line info from chip");
 		name = gpiod_line_info_get_name(info);
 		consumer = gpiod_line_info_get_consumer(info);
 		direction = gpiod_line_info_get_direction(info);
@@ -184,6 +189,7 @@ static void list_lines(struct gpiod_chip *chip)
 
 		gpiod_line_info_free(info);
 	}
+	gpiod_chip_info_free(chip_info);
 }
 
 int main(int argc, char **argv)
-- 
2.35.1

