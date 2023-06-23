Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2142973AF7E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjFWEjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjFWEjk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:39:40 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F352128
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:37 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3f9b1f43bd0so3884841cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495176; x=1690087176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctNOQCyLHkudXr2/oPyM3S869JlUqDDShl06PMk1r+c=;
        b=gFy1K8doszE1L2IesBdlEKkGH4mtYNEMsl4xrdlYJtVa7tD3UD7gol4v9VlnRSfMAy
         HS5L8d2VdY9+6JRRPN8NY1irCflLY33XPUMSnAdQD4nD5x0aPJyTz0fpnzk3NfMjvJuc
         /PbdhQHfnBnYSbMdzOKqJfL/EwT7jq1hOF5uJHrbKv116y7gEDU3725a+QyEtXbE3yez
         33OSpMG5Q/ePz2G/6t7zH6JRyHbQeNnqAdkT7VhCGnTf5ZEtpIkhbR08ktPSC+h6xFho
         GNjH87icGJI8ybCoSTdi3/ioc0pYxj6PKAt0XvsT9dnOUF26QBCjecqwVMUFV3MhYRdO
         dXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495176; x=1690087176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctNOQCyLHkudXr2/oPyM3S869JlUqDDShl06PMk1r+c=;
        b=U8X86H86dIXOH/SnvcSiAZVmZz9QhIzK9z3nv7Q3UnC/ouQMMGwuwatlnzehl/WLRq
         BkrmlYj1/sWHPcHC6EgmSn3LCuy9Zlvk5nDY3J23SSk5r8uLqMEZVjyFKxKKKQhOilMn
         Qz1v3PrYiOee3vKAiVv/zWFeUog2d5kl/VFkBfif7nZpaORmkH0Bnh4Zb8YMyxXYCufn
         rFcQ39kyHl2UvJXrlPp6TCL7bsSphlqpgNjxZfJ6tF+XfvuafKl9TZXoB/WM+zfa38Gp
         3fHB/5iR00AdHzzuoBYnHjtsDAQF8gN2Z8aSBHBt+S1LJAXQxstVR0aWbnZvx2du8A+p
         f+wg==
X-Gm-Message-State: AC+VfDwGWsmL14emMq70EofFsaCsB+O/K7HEVIGxRXDneFaivVmzqh2Q
        17G/tC+bqbrCQ/J9hZ9kLsH0EQNf27U=
X-Google-Smtp-Source: ACHHUZ7S1mCsUQ4BydDOh9Hv8CbF8+xA4tqAkWc3H/gi+t3/6ZVBiShMUOeF140LYdV3g5B8jq/6wA==
X-Received: by 2002:a05:622a:1cb:b0:3fd:e07a:24f7 with SMTP id t11-20020a05622a01cb00b003fde07a24f7mr14431222qtw.40.1687495175741;
        Thu, 22 Jun 2023 21:39:35 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:39:35 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/8] core: examples: add more use case examples
Date:   Fri, 23 Jun 2023 12:38:55 +0800
Message-ID: <20230623043901.16764-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
References: <20230623043901.16764-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add examples for use cases drawn from the tools.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 examples/.gitignore                    |   9 ++
 examples/Makefile.am                   |  29 ++++-
 examples/find_line_by_name.c           | 111 ++++++++++++++++++
 examples/get_chip_info.c               |  40 +++++++
 examples/get_line_info.c               |  56 +++++++++
 examples/get_multiple_line_values.c    | 119 +++++++++++++++++++
 examples/reconfigure_input_to_output.c | 152 +++++++++++++++++++++++++
 examples/toggle_multiple_line_values.c | 136 ++++++++++++++++++++++
 examples/watch_line_info.c             |  72 ++++++++++++
 examples/watch_line_rising.c           | 129 +++++++++++++++++++++
 examples/watch_multiple_line_values.c  | 140 +++++++++++++++++++++++
 11 files changed, 992 insertions(+), 1 deletion(-)
 create mode 100644 examples/find_line_by_name.c
 create mode 100644 examples/get_chip_info.c
 create mode 100644 examples/get_line_info.c
 create mode 100644 examples/get_multiple_line_values.c
 create mode 100644 examples/reconfigure_input_to_output.c
 create mode 100644 examples/toggle_multiple_line_values.c
 create mode 100644 examples/watch_line_info.c
 create mode 100644 examples/watch_line_rising.c
 create mode 100644 examples/watch_multiple_line_values.c

diff --git a/examples/.gitignore b/examples/.gitignore
index bdfde9a..8fd3ff3 100644
--- a/examples/.gitignore
+++ b/examples/.gitignore
@@ -2,6 +2,15 @@
 # SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
 
 async_watch_line_value
+find_line_by_name
+get_chip_info
+get_line_info
 get_line_value
+get_multiple_line_values
+reconfigure_input_to_output
 toggle_line_value
+toggle_multiple_line_values
+watch_line_info
+watch_line_rising
 watch_line_value
+watch_multiple_line_values
diff --git a/examples/Makefile.am b/examples/Makefile.am
index 55dfe39..daf902b 100644
--- a/examples/Makefile.am
+++ b/examples/Makefile.am
@@ -8,14 +8,41 @@ LDADD = $(top_builddir)/lib/libgpiod.la
 
 noinst_PROGRAMS = \
 	async_watch_line_value \
+	find_line_by_name \
+	get_chip_info \
+	get_line_info \
 	get_line_value \
+	get_multiple_line_values \
+	reconfigure_input_to_output \
 	toggle_line_value \
-	watch_line_value
+	toggle_multiple_line_values \
+	watch_line_info \
+	watch_line_rising \
+	watch_line_value \
+	watch_multiple_line_values
 
 async_watch_line_value_SOURCES = async_watch_line_value.c
 
+find_line_by_name_SOURCES = find_line_by_name.c
+
+get_chip_info_SOURCES = get_chip_info.c
+
+get_line_info_SOURCES = get_line_info.c
+
 get_line_value_SOURCES = get_line_value.c
 
+get_multiple_line_values_SOURCES = get_multiple_line_values.c
+
+reconfigure_input_to_output_SOURCES = reconfigure_input_to_output.c
+
 toggle_line_value_SOURCES = toggle_line_value.c
 
+toggle_multiple_line_value_SOURCES = toggle_multiple_line_value.c
+
+watch_line_info_SOURCES = watch_line_info.c
+
+watch_line_rising_SOURCES = watch_line_rising.c
+
 watch_line_value_SOURCES = watch_line_value.c
+
+watch_multiple_line_values_SOURCES = watch_multiple_line_values.c
diff --git a/examples/find_line_by_name.c b/examples/find_line_by_name.c
new file mode 100644
index 0000000..ea1d938
--- /dev/null
+++ b/examples/find_line_by_name.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of finding a line with the given name. */
+
+#include <dirent.h>
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+
+static int chip_dir_filter(const struct dirent *entry)
+{
+	struct stat sb;
+	int ret = 0;
+	char *path;
+
+	if (asprintf(&path, "/dev/%s", entry->d_name) < 0)
+		return 0;
+
+	if ((lstat(path, &sb) == 0) && (!S_ISLNK(sb.st_mode)) &&
+	    gpiod_is_gpiochip_device(path))
+		ret = 1;
+
+	free(path);
+
+	return ret;
+}
+
+static int all_chip_paths(char ***paths_ptr)
+{
+	int i, j, num_chips, ret = 0;
+	struct dirent **entries;
+	char **paths;
+
+	num_chips = scandir("/dev/", &entries, chip_dir_filter, versionsort);
+	if (num_chips < 0)
+		return 0;
+
+	paths = calloc(num_chips, sizeof(*paths));
+	if (!paths)
+		return 0;
+
+	for (i = 0; i < num_chips; i++) {
+		if (asprintf(&paths[i], "/dev/%s", entries[i]->d_name) < 0) {
+			for (j = 0; j < i; j++)
+				free(paths[j]);
+
+			free(paths);
+			return 0;
+		}
+	}
+
+	*paths_ptr = paths;
+	ret = num_chips;
+
+	for (i = 0; i < num_chips; i++)
+		free(entries[i]);
+
+	free(entries);
+	return ret;
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const line_name = "GPIO19";
+
+	struct gpiod_chip *chip;
+	struct gpiod_chip_info *cinfo;
+	struct gpiod_line_info *linfo;
+	char **chip_paths;
+	const char *name;
+	unsigned int j, num_lines;
+	int i, num_chips;
+
+	/*
+	 * Names are not guaranteed unique, so this finds the first line with
+	 * the given name.
+	 */
+	num_chips = all_chip_paths(&chip_paths);
+	for (i = 0; i < num_chips; i++) {
+		chip = gpiod_chip_open(chip_paths[i]);
+		if (!chip)
+			continue;
+		cinfo = gpiod_chip_get_info(chip);
+		if (!cinfo)
+			continue;
+
+		num_lines = gpiod_chip_info_get_num_lines(cinfo);
+		for (j = 0; j < num_lines; j++) {
+			linfo = gpiod_chip_get_line_info(chip, j);
+			if (!linfo)
+				continue;
+			name = gpiod_line_info_get_name(linfo);
+			if (name && (strcmp(line_name, name) == 0)) {
+				printf("%s: %s %d\n", line_name,
+				       gpiod_chip_info_get_name(cinfo), j);
+				return EXIT_SUCCESS;
+			}
+			gpiod_line_info_free(linfo);
+		}
+		gpiod_chip_info_free(cinfo);
+		gpiod_chip_close(chip);
+	}
+
+	printf("line '%s' not found\n", line_name);
+	return EXIT_FAILURE;
+}
diff --git a/examples/get_chip_info.c b/examples/get_chip_info.c
new file mode 100644
index 0000000..5c181c8
--- /dev/null
+++ b/examples/get_chip_info.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading the info for a chip. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+
+	struct gpiod_chip_info *info;
+	struct gpiod_chip *chip;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip) {
+		fprintf(stderr, "failed to open chip: %s\n", strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	info = gpiod_chip_get_info(chip);
+	if (!info) {
+		fprintf(stderr, "failed to read info: %s\n", strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	printf("%s [%s] (%zu lines)\n", gpiod_chip_info_get_name(info),
+	       gpiod_chip_info_get_label(info),
+	       gpiod_chip_info_get_num_lines(info));
+
+	gpiod_chip_info_free(info);
+	gpiod_chip_close(chip);
+
+	return EXIT_SUCCESS;
+}
diff --git a/examples/get_line_info.c b/examples/get_line_info.c
new file mode 100644
index 0000000..743c98f
--- /dev/null
+++ b/examples/get_line_info.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading the info for a line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+	static const unsigned int line_offset = 3;
+
+	struct gpiod_line_info *info;
+	struct gpiod_chip *chip;
+	const char *name, *consumer, *dir;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip) {
+		fprintf(stderr, "failed to open chip: %s\n", strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	info = gpiod_chip_get_line_info(chip, line_offset);
+	if (!info) {
+		fprintf(stderr, "failed to read info: %s\n", strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	name = gpiod_line_info_get_name(info);
+	if (!name)
+		name = "unnamed";
+
+	consumer = gpiod_line_info_get_consumer(info);
+	if (!consumer)
+		consumer = "unused";
+
+	dir = (gpiod_line_info_get_direction(info) ==
+	       GPIOD_LINE_DIRECTION_INPUT) ?
+		      "input" :
+		      "output";
+
+	printf("line %3d: %12s %12s %8s %10s\n",
+	       gpiod_line_info_get_offset(info), name, consumer, dir,
+	       gpiod_line_info_is_active_low(info) ? "active-low" :
+						     "active-high");
+
+	gpiod_line_info_free(info);
+	gpiod_chip_close(chip);
+
+	return EXIT_SUCCESS;
+}
diff --git a/examples/get_multiple_line_values.c b/examples/get_multiple_line_values.c
new file mode 100644
index 0000000..fc26636
--- /dev/null
+++ b/examples/get_multiple_line_values.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading a single line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/* Request a line as input. */
+static struct gpiod_line_request *
+request_input_lines(const char *chip_path, const unsigned int *offsets,
+		    unsigned int num_lines, const char *consumer)
+{
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	unsigned int i;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	for (i = 0; i < num_lines; i++) {
+		ret = gpiod_line_config_add_line_settings(line_cfg, &offsets[i],
+							  1, settings);
+		if (ret)
+			goto free_line_config;
+	}
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+
+free_settings:
+	gpiod_line_settings_free(settings);
+
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+static int print_values(const unsigned int *offsets, unsigned int num_lines,
+			enum gpiod_line_value *values)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_lines; i++) {
+		if (values[i] == GPIOD_LINE_VALUE_ACTIVE)
+			printf("%d=Active ", offsets[i]);
+		else if (values[i] == GPIOD_LINE_VALUE_INACTIVE) {
+			printf("%d=Inactive ", offsets[i]);
+		} else {
+			fprintf(stderr, "error reading value: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+	}
+	printf("\n");
+
+	return EXIT_SUCCESS;
+}
+
+#define NUM_LINES 3
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+	static const unsigned int line_offsets[NUM_LINES] = { 5, 3, 7 };
+
+	struct gpiod_line_request *request;
+	enum gpiod_line_value values[NUM_LINES];
+	int ret;
+
+	request = request_input_lines(chip_path, line_offsets, NUM_LINES,
+				      "get-multiple-line-values");
+	if (!request) {
+		fprintf(stderr, "failed to request lines: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	ret = gpiod_line_request_get_values(request, values);
+	if (ret == -1) {
+		fprintf(stderr, "failed to get values: %s\n", strerror(errno));
+		return EXIT_FAILURE;
+	}
+	ret = print_values(line_offsets, NUM_LINES, values);
+
+	return ret;
+}
diff --git a/examples/reconfigure_input_to_output.c b/examples/reconfigure_input_to_output.c
new file mode 100644
index 0000000..e8fbb1c
--- /dev/null
+++ b/examples/reconfigure_input_to_output.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading a single line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/* Request a line as input. */
+static struct gpiod_line_request *request_input_line(const char *chip_path,
+						     unsigned int offset,
+						     const char *consumer)
+{
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_line_config;
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+
+free_settings:
+	gpiod_line_settings_free(settings);
+
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+static int reconfigure_as_output_line(struct gpiod_line_request *request,
+				      unsigned int offset,
+				      enum gpiod_line_value value)
+{
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *line_cfg;
+	int ret = -1;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		return -1;
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings, value);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_line_config;
+
+	ret = gpiod_line_request_reconfigure_lines(request, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+
+free_settings:
+	gpiod_line_settings_free(settings);
+
+	return ret;
+}
+
+static const char * value_str(enum gpiod_line_value value)
+{
+	if (value == GPIOD_LINE_VALUE_ACTIVE)
+		return "Active";
+	else if (value == GPIOD_LINE_VALUE_INACTIVE) {
+		return "Inactive";
+	} else {
+		return "Unknown";
+	}
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+	static const unsigned int line_offset = 5;
+
+	struct gpiod_line_request *request;
+	enum gpiod_line_value value;
+	int ret;
+
+	/* request the line initially as an input */
+	request = request_input_line(chip_path, line_offset,
+				     "reconfigure-input-to-output");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	/* read the current line value */
+	value = gpiod_line_request_get_value(request, line_offset);
+	printf("%d=%s (input)\n", line_offset, value_str(value));
+
+	/* switch the line to an output and drive it low */
+	ret = reconfigure_as_output_line(request, line_offset,
+					 GPIOD_LINE_VALUE_INACTIVE);
+
+	/* report the current driven value */
+	value = gpiod_line_request_get_value(request, line_offset);
+	printf("%d=%s (output)\n", line_offset, value_str(value));
+
+	/* not strictly required here, but if the app wasn't exiting... */
+	gpiod_line_request_release(request);
+
+	return ret;
+}
diff --git a/examples/toggle_multiple_line_values.c b/examples/toggle_multiple_line_values.c
new file mode 100644
index 0000000..059a79f
--- /dev/null
+++ b/examples/toggle_multiple_line_values.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of toggling multiple lines. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+static struct gpiod_line_request *
+request_output_lines(const char *chip_path, const unsigned int *offsets,
+		     enum gpiod_line_value *values, unsigned int num_lines,
+		     const char *consumer)
+{
+	struct gpiod_request_config *rconfig = NULL;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *lconfig;
+	struct gpiod_chip *chip;
+	unsigned int i;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+
+	lconfig = gpiod_line_config_new();
+	if (!lconfig)
+		goto free_settings;
+
+	for (i = 0; i < num_lines; i++) {
+		ret = gpiod_line_config_add_line_settings(lconfig, &offsets[i],
+							  1, settings);
+		if (ret)
+			goto free_line_config;
+	}
+	gpiod_line_config_set_output_values(lconfig, values, num_lines);
+
+	if (consumer) {
+		rconfig = gpiod_request_config_new();
+		if (!rconfig)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(rconfig, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, rconfig, lconfig);
+
+	gpiod_request_config_free(rconfig);
+
+free_line_config:
+	gpiod_line_config_free(lconfig);
+
+free_settings:
+	gpiod_line_settings_free(settings);
+
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+static enum gpiod_line_value toggle_line_value(enum gpiod_line_value value)
+{
+	return (value == GPIOD_LINE_VALUE_ACTIVE) ? GPIOD_LINE_VALUE_INACTIVE :
+						    GPIOD_LINE_VALUE_ACTIVE;
+}
+
+static void toggle_line_values(enum gpiod_line_value *values,
+			       unsigned int num_lines)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_lines; i++) {
+		values[i] = toggle_line_value(values[i]);
+	}
+}
+
+static void print_values(const unsigned int *offsets,
+			 const enum gpiod_line_value *values,
+			 unsigned int num_lines)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_lines; i++) {
+		if (values[i] == GPIOD_LINE_VALUE_ACTIVE)
+			printf("%d=Active ", offsets[i]);
+		else
+			printf("%d=Inactive ", offsets[i]);
+	}
+	printf("\n");
+}
+
+#define NUM_LINES 3
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+	static const unsigned int line_offsets[NUM_LINES] = { 5, 3, 7 };
+
+	enum gpiod_line_value values[NUM_LINES] = { GPIOD_LINE_VALUE_ACTIVE,
+						    GPIOD_LINE_VALUE_ACTIVE,
+						    GPIOD_LINE_VALUE_INACTIVE };
+	struct gpiod_line_request *request;
+
+	request = request_output_lines(chip_path, line_offsets, values,
+				       NUM_LINES,
+				       "toggle-multiple-line-values");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	for (;;) {
+		print_values(line_offsets, values, NUM_LINES);
+		sleep(1);
+		toggle_line_values(values, NUM_LINES);
+		gpiod_line_request_set_values(request, values);
+	}
+
+	gpiod_line_request_release(request);
+
+	return EXIT_SUCCESS;
+}
diff --git a/examples/watch_line_info.c b/examples/watch_line_info.c
new file mode 100644
index 0000000..51fb5c7
--- /dev/null
+++ b/examples/watch_line_info.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for info changes on particular lines. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+const char *event_type(struct gpiod_info_event *event)
+{
+	switch (gpiod_info_event_get_event_type(event)) {
+	case GPIOD_INFO_EVENT_LINE_REQUESTED:
+		return "Requested";
+	case GPIOD_INFO_EVENT_LINE_RELEASED:
+		return "Released";
+	case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
+		return "Reconfig";
+	default:
+		return "Unknown";
+	}
+}
+
+#define NUM_LINES 3
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+	static const unsigned int line_offsets[NUM_LINES] = { 5, 3, 7 };
+
+	struct gpiod_line_info *info;
+	struct gpiod_info_event *event;
+	struct gpiod_chip *chip;
+	unsigned int i;
+	uint64_t timestamp_ns;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip) {
+		fprintf(stderr, "failed to open chip: %s\n", strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	for (i = 0; i < NUM_LINES; i++) {
+		info = gpiod_chip_watch_line_info(chip, line_offsets[i]);
+		if (!info) {
+			fprintf(stderr, "failed to read info: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+	}
+
+	for (;;) {
+		/* Blocks until an event is available. */
+		event = gpiod_chip_read_info_event(chip);
+		if (!event) {
+			fprintf(stderr, "failed to read event: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+
+		info = gpiod_info_event_get_line_info(event);
+		timestamp_ns = gpiod_info_event_get_timestamp_ns(event);
+		printf("line %3d: %-9s %ld.%ld\n",
+		       gpiod_line_info_get_offset(info), event_type(event),
+		       timestamp_ns / 1000000000, timestamp_ns % 1000000000);
+
+		gpiod_info_event_free(event);
+	}
+}
diff --git a/examples/watch_line_rising.c b/examples/watch_line_rising.c
new file mode 100644
index 0000000..062a46a
--- /dev/null
+++ b/examples/watch_line_rising.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for rising edges on a single line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/* Request a line as input with edge detection. */
+static struct gpiod_line_request *request_input_line(const char *chip_path,
+						     unsigned int offset,
+						     const char *consumer)
+{
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_RISING);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_line_config;
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+
+free_settings:
+	gpiod_line_settings_free(settings);
+
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+static const char *edge_event_type_str(struct gpiod_edge_event *event)
+{
+	switch (gpiod_edge_event_get_event_type(event)) {
+	case GPIOD_EDGE_EVENT_RISING_EDGE:
+		return "Rising";
+	case GPIOD_EDGE_EVENT_FALLING_EDGE:
+		return "Falling";
+	default:
+		return "Unknown";
+	}
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+	static const unsigned int line_offset = 5;
+
+	struct gpiod_edge_event_buffer *event_buffer;
+	struct gpiod_line_request *request;
+	struct gpiod_edge_event *event;
+	int i, ret, event_buf_size;
+
+	request = request_input_line(chip_path, line_offset,
+				     "watch-line-value");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * A larger buffer is an optimisation for reading bursts of events from
+	 * the kernel, but that is not necessary in this case, so 1 is fine.
+	 */
+	event_buf_size = 1;
+	event_buffer = gpiod_edge_event_buffer_new(event_buf_size);
+	if (!event_buffer) {
+		fprintf(stderr, "failed to create event buffer: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	for (;;) {
+		/* Blocks until at least one event is available. */
+		ret = gpiod_line_request_read_edge_events(request, event_buffer,
+							  event_buf_size);
+		if (ret == -1) {
+			fprintf(stderr, "error reading edge events: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+		for (i = 0; i < ret; i++) {
+			event = gpiod_edge_event_buffer_get_event(event_buffer,
+								  i);
+			printf("offset: %d  type: %-7s  event #%ld\n",
+			       gpiod_edge_event_get_line_offset(event),
+			       edge_event_type_str(event),
+			       gpiod_edge_event_get_line_seqno(event));
+		}
+	}
+}
diff --git a/examples/watch_multiple_line_values.c b/examples/watch_multiple_line_values.c
new file mode 100644
index 0000000..6918aa6
--- /dev/null
+++ b/examples/watch_multiple_line_values.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for edges on a single line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/* Request a line as input with edge detection. */
+static struct gpiod_line_request *
+request_input_lines(const char *chip_path, const unsigned int *offsets,
+		    unsigned int num_lines, const char *consumer)
+{
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	unsigned int i;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	/* Assume a button connecting the pin to ground, so pull it up... */
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_UP);
+	/* ... and provide some debounce. */
+	gpiod_line_settings_set_debounce_period_us(settings, 10000);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	for (i = 0; i < num_lines; i++) {
+		ret = gpiod_line_config_add_line_settings(line_cfg, &offsets[i],
+							  1, settings);
+		if (ret)
+			goto free_line_config;
+	}
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+
+free_settings:
+	gpiod_line_settings_free(settings);
+
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+static const char *edge_event_type_str(struct gpiod_edge_event *event)
+{
+	switch (gpiod_edge_event_get_event_type(event)) {
+	case GPIOD_EDGE_EVENT_RISING_EDGE:
+		return "Rising";
+	case GPIOD_EDGE_EVENT_FALLING_EDGE:
+		return "Falling";
+	default:
+		return "Unknown";
+	}
+}
+
+#define NUM_LINES 3
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const char *const chip_path = "/dev/gpiochip0";
+	static const unsigned int line_offsets[NUM_LINES] = { 5, 3, 7 };
+
+	struct gpiod_edge_event_buffer *event_buffer;
+	struct gpiod_line_request *request;
+	struct gpiod_edge_event *event;
+	int i, ret, event_buf_size;
+
+	request = request_input_lines(chip_path, line_offsets, NUM_LINES,
+				      "watch-multiple-line-values");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * A larger buffer is an optimisation for reading bursts of events from
+	 * the kernel, so even a value of 1 would be fine.
+	 * The size here allows for a simultaneous event on each of the lines
+	 * to be copied in one read.
+	 */
+	event_buf_size = NUM_LINES;
+	event_buffer = gpiod_edge_event_buffer_new(event_buf_size);
+	if (!event_buffer) {
+		fprintf(stderr, "failed to create event buffer: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	for (;;) {
+		/* Blocks until at least one event is available. */
+		ret = gpiod_line_request_read_edge_events(request, event_buffer,
+							  event_buf_size);
+		if (ret == -1) {
+			fprintf(stderr, "error reading edge events: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+		for (i = 0; i < ret; i++) {
+			event = gpiod_edge_event_buffer_get_event(event_buffer,
+								  i);
+			printf("offset: %d  type: %-7s  event #%ld\n",
+			       gpiod_edge_event_get_line_offset(event),
+			       edge_event_type_str(event),
+			       gpiod_edge_event_get_line_seqno(event));
+		}
+	}
+}
-- 
2.41.0

