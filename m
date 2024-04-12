Return-Path: <linux-gpio+bounces-5417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C948A2E32
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B29B1C22876
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515525676A;
	Fri, 12 Apr 2024 12:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xynTHTFi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8D56B65
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924905; cv=none; b=vGcBhddnun29dqKBck9gEQoRWP/ojISBqvgkAyNJBWOpMUdGEuRWIpcm0D7NGox94DUAiUIfde/sodZJ5+z1lhXUslpTwkIXsoLxr2pJLT+GgewyJkJh3gX4tDb7NfxCLon4/2psiGwyQF+CBlp3qwD3SYevmNzgGiaShHT6EpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924905; c=relaxed/simple;
	bh=BFXfce6irE3A84LfPhsWjf7glRx7VkIoUYlANEbHnj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dQ1wA7CGOX9urj8+o+6nmm0WhwrBbAIR3soHwiXhKzBETezdj8hr0I78T4wJv5AnF8tjUNzuHPa8lECBROqQTNi8RsQi9laeoNlMvKW3Ca9kV3Ir06aIB4PFl/SJB50uU/XulzP4URMdqmH4ZxwB7358bF6EQXNFhStZkVHYcJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xynTHTFi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3462178fbf9so426278f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924901; x=1713529701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRnNIYj97Ll16XeBsFoA52QGh8tNIGrSPjawsjKU6r4=;
        b=xynTHTFiDItLFTCAq+dEfoxAlGAeHWq/GoUY9bgUjDdWx+YToYpstbBgFJPyB/+P9s
         9t1IFL6Sw+O5iT3Yr3kgBjBw6+/f+vRD+eIqauMqJDce2I4AcCuWmkG5Rm8w1riUxslV
         6sSc4+oyB/efrxskboZfHrYaU408sobDix33XJV8pDHjmktwur/XoSHanqavgxnU4f8T
         WllVQq/8iFGYbnu7AALkB2squWrnDr24/ONGfufVw0CKRtdwfnP63ND8/v6MW0NcSlhZ
         Dvxu90ae6BPTZwuzpp7OQcoVPzUyvXPIGmvhZBNU4pcpyTujbOn6xayZ0JrhV6vz75xj
         cgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924901; x=1713529701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRnNIYj97Ll16XeBsFoA52QGh8tNIGrSPjawsjKU6r4=;
        b=lloKu7Z2oB5cwJfAx7Qk82YLWaRQj9Ro5x9m+wUTcz50ImvxOkIxt03KfKVATpIVzP
         fPTzA6NX33ikoMxQFEf6sEE8Hsy9cn6UD8qDEOHsEtuBitJS4NjLqj9Plxcfy6wHycXX
         tAHVheme630J1VdzpfNFwsTUN3q5jqTJfLQ/p8qs+UCA+gsSrYSjUavSVyVIHqR3eRJI
         MLq8xSwNDm9MuwL0Wd6HvVH8uBNFSYgl1LFb9u7G+//xMQVmTZL0yjqzWbZ05lImEwO6
         u6S+1bTZCO30tJoZQ8BWNgnbhPQoKe+/dn5WRzXqN7XN58M8LOKePQyh6cPdFbU91EYM
         Sghg==
X-Gm-Message-State: AOJu0YyQHgr+JDgx2Cw1rCPr1HsABuxv4mrS16crmQ/Ks2ieAQZCCPaY
	++zosLP72Fd739hve6B83wMnvBfEzZnKqtO7BNXDFhWM6CyZkFQ4nPILf47bz2inUc8048cgGBW
	m
X-Google-Smtp-Source: AGHT+IElEVk2xoJafwgUsfst0SXlxyuGGVI85Hljl2/I8pkef0VrooFhRFA0mNQSt7n/szpfmXg41A==
X-Received: by 2002:a05:6000:b05:b0:346:61a1:e6e3 with SMTP id dj5-20020a0560000b0500b0034661a1e6e3mr2027260wrb.64.1712924900763;
        Fri, 12 Apr 2024 05:28:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 06/18] bindings: glib: add examples
Date: Fri, 12 Apr 2024 14:27:52 +0200
Message-Id: <20240412122804.109323-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add example programs showcasing the usage of GLib bindings to libgpiod.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../glib/examples/find_line_by_name_glib.c    |  72 ++++++++++
 bindings/glib/examples/get_chip_info_glib.c   |  39 ++++++
 bindings/glib/examples/get_line_info_glib.c   |  79 +++++++++++
 bindings/glib/examples/get_line_value_glib.c  |  67 +++++++++
 .../examples/get_multiple_line_values_glib.c  |  72 ++++++++++
 .../reconfigure_input_to_output_glib.c        | 103 ++++++++++++++
 .../glib/examples/toggle_line_value_glib.c    |  99 +++++++++++++
 .../toggle_multiple_line_values_glib.c        | 132 ++++++++++++++++++
 bindings/glib/examples/watch_line_info_glib.c |  63 +++++++++
 .../glib/examples/watch_line_value_glib.c     |  91 ++++++++++++
 .../watch_multiple_edge_rising_glib.c         |  95 +++++++++++++
 11 files changed, 912 insertions(+)
 create mode 100644 bindings/glib/examples/find_line_by_name_glib.c
 create mode 100644 bindings/glib/examples/get_chip_info_glib.c
 create mode 100644 bindings/glib/examples/get_line_info_glib.c
 create mode 100644 bindings/glib/examples/get_line_value_glib.c
 create mode 100644 bindings/glib/examples/get_multiple_line_values_glib.c
 create mode 100644 bindings/glib/examples/reconfigure_input_to_output_glib.c
 create mode 100644 bindings/glib/examples/toggle_line_value_glib.c
 create mode 100644 bindings/glib/examples/toggle_multiple_line_values_glib.c
 create mode 100644 bindings/glib/examples/watch_line_info_glib.c
 create mode 100644 bindings/glib/examples/watch_line_value_glib.c
 create mode 100644 bindings/glib/examples/watch_multiple_edge_rising_glib.c

diff --git a/bindings/glib/examples/find_line_by_name_glib.c b/bindings/glib/examples/find_line_by_name_glib.c
new file mode 100644
index 0000000..935f229
--- /dev/null
+++ b/bindings/glib/examples/find_line_by_name_glib.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of finding a line with the given name. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const line_name = "GPIO0";
+
+	g_autoptr(GPIODChipInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+	g_autoptr(GDir) dir = NULL;
+	const gchar *filename;
+	gboolean ret;
+	guint offset;
+
+	dir = g_dir_open("/dev", 0, &err);
+	if (err) {
+		g_printerr("Unable to open /dev: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Names are not guaranteed unique, so this finds the first line with
+	 * the given name.
+	 */
+	while ((filename = g_dir_read_name(dir))) {
+		g_autoptr(GPIODChip) chip = NULL;
+		g_autofree gchar *path = NULL;
+
+		path = g_strdup_printf("/dev/%s", filename);
+		if (!g_gpiod_is_gpiochip_device(path))
+			continue;
+
+		chip = g_gpiod_chip_new(path, &err);
+		if (err) {
+			g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+				   path, err->message);
+			return EXIT_FAILURE;
+		}
+
+		ret = g_gpiod_chip_get_line_offset_from_name(chip, line_name,
+							     &offset, &err);
+		if (ret) {
+			info = g_gpiod_chip_get_info(chip, &err);
+			if (!info) {
+				g_printerr("Failed to get chip info: %s\n",
+					   err->message);
+				return EXIT_FAILURE;
+			}
+
+			g_print("%s %u\n",
+				g_gpiod_chip_info_get_name(info),
+				offset);
+
+			return EXIT_SUCCESS;
+		} else if (!ret && err) {
+			g_printerr("Failed to map the line name '%s' to offset: %s\n",
+				   line_name, err->message);
+			return EXIT_FAILURE;
+		}
+	}
+
+	g_print("line '%s' not found\n", line_name);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_chip_info_glib.c b/bindings/glib/examples/get_chip_info_glib.c
new file mode 100644
index 0000000..1f1811a
--- /dev/null
+++ b/bindings/glib/examples/get_chip_info_glib.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading the info for a chip. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip0";
+
+	g_autoptr(GPIODChipInfo) info = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (err) {
+		g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+			   chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	info = g_gpiod_chip_get_info(chip, &err);
+	if (err) {
+		g_printerr("Failed to retrieve GPIO chip info: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%s [%s] (%u lines)\n",
+		g_gpiod_chip_info_get_name(info),
+		g_gpiod_chip_info_get_label(info),
+		g_gpiod_chip_info_get_num_lines(info));
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_line_info_glib.c b/bindings/glib/examples/get_line_info_glib.c
new file mode 100644
index 0000000..f3da267
--- /dev/null
+++ b/bindings/glib/examples/get_line_info_glib.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading the info for a line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static GString *make_flags(GPIODLineInfo *info)
+{
+	g_autofree gchar *drive_str = NULL;
+	g_autofree gchar *edge_str = NULL;
+	g_autofree gchar *bias_str = NULL;
+	GPIODLineDrive drive;
+	GPIODLineEdge edge;
+	GPIODLineBias bias;
+	GString *ret;
+
+	edge = g_gpiod_line_info_get_edge_detection(info);
+	bias = g_gpiod_line_info_get_bias(info);
+	drive = g_gpiod_line_info_get_drive(info);
+
+	edge_str = g_enum_to_string(G_GPIOD_LINE_EDGE_TYPE, edge);
+	bias_str = g_enum_to_string(G_GPIOD_LINE_BIAS_TYPE, bias);
+	drive_str = g_enum_to_string(G_GPIOD_LINE_DRIVE_TYPE, drive);
+
+	ret = g_string_new(NULL);
+	g_string_printf(ret, "%s, %s, %s", edge_str, bias_str, drive_str);
+	g_string_replace(ret, "G_GPIOD_LINE_", "", 0);
+
+	return ret;
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip0";
+	static const guint line_offset = 4;
+
+	g_autoptr(GPIODLineInfo) info = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GString) flags = NULL;
+	const gchar *name, *consumer;
+	GPIODLineDirection direction;
+	g_autoptr(GError) err = NULL;
+	gboolean active_low;
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (err) {
+		g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+			   chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	info = g_gpiod_chip_get_line_info(chip, line_offset, &err);
+	if (err) {
+		g_printerr("Failed to retrieve GPIO line info: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	name = g_gpiod_line_info_get_name(info);
+	consumer = g_gpiod_line_info_get_consumer(info);
+	direction = g_gpiod_line_info_get_direction(info);
+	active_low = g_gpiod_line_info_is_active_low(info);
+	flags = make_flags(info);
+
+	g_print("\tline: %u %s %s %s %s [%s]\n",
+		line_offset,
+		name ?: "unnamed",
+		consumer ?: "unused",
+		direction == G_GPIOD_LINE_DIRECTION_INPUT ?
+					"input" : "output",
+		active_low ? "active-low" : "active-high",
+		flags->str);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_line_value_glib.c b/bindings/glib/examples/get_line_value_glib.c
new file mode 100644
index 0000000..614390e
--- /dev/null
+++ b/bindings/glib/examples/get_line_value_glib.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+	gboolean ret;
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			NULL);
+
+	line_cfg = g_gpiod_line_config_new();
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = g_gpiod_request_config_new("consumer", "get-line-value-glib",
+					     NULL);
+
+	request = g_gpiod_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = g_gpiod_line_request_get_value(request, line_offset,
+					     &offset, &err);
+	if (!ret) {
+		g_printerr("failed to read line values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%u\n", offset);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_multiple_line_values_glib.c b/bindings/glib/examples/get_multiple_line_values_glib.c
new file mode 100644
index 0000000..c65d45e
--- /dev/null
+++ b/bindings/glib/examples/get_multiple_line_values_glib.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading multiple lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const gsize num_lines = 3;
+
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i, j;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	for (i = 0; i < num_lines; i++)
+		g_array_append_val(offsets, line_offsets[i]);
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			NULL);
+
+	line_cfg = g_gpiod_line_config_new();
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = g_gpiod_request_config_new(
+			"consumer", "get-multiple-line-values", NULL);
+
+	request = g_gpiod_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = g_gpiod_line_request_get_values_subset(request, offsets,
+						     &values, &err);
+	if (!ret) {
+		g_printerr("failed to read line values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	for (j = 0; j < values->len; j++)
+		g_print("%d ", g_array_index(values, GPIODLineValue, j));
+	g_print("\n");
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/reconfigure_input_to_output_glib.c b/bindings/glib/examples/reconfigure_input_to_output_glib.c
new file mode 100644
index 0000000..896b19f
--- /dev/null
+++ b/bindings/glib/examples/reconfigure_input_to_output_glib.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*
+ * Example of a bi-directional line requested as input and then switched
+ * to output.
+ */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	GPIODLineValue value;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			NULL);
+
+	line_cfg = g_gpiod_line_config_new();
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = g_gpiod_request_config_new(
+			"consumer", "reconfigure-input-to-output", NULL);
+
+	request = g_gpiod_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Read the current line value. */
+	ret = g_gpiod_line_request_get_value(request, line_offset,
+					     &value, &err);
+	if (!ret) {
+		g_printerr("failed to read line value: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%s (input)\n",
+		value == G_GPIOD_LINE_VALUE_ACTIVE ? "Active" : "Inactive");
+
+	/* Switch the line to an output and drive it high. */
+	g_gpiod_line_settings_set_direction(settings,
+					    G_GPIOD_LINE_DIRECTION_OUTPUT);
+	g_gpiod_line_settings_set_output_value(settings,
+					       G_GPIOD_LINE_VALUE_ACTIVE);
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Reconfigure lines. */
+	ret = g_gpiod_line_request_reconfigure_lines(request, line_cfg, &err);
+	if (!ret) {
+		g_printerr("failed to reconfigure lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Report the current driven value. */
+	ret = g_gpiod_line_request_get_value(request, line_offset,
+					     &value, &err);
+	if (!ret) {
+		g_printerr("failed to read line value: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%s (output)\n",
+		value == G_GPIOD_LINE_VALUE_ACTIVE ? "Active" : "Inactive");
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/toggle_line_value_glib.c b/bindings/glib/examples/toggle_line_value_glib.c
new file mode 100644
index 0000000..f11f121
--- /dev/null
+++ b/bindings/glib/examples/toggle_line_value_glib.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of periodically toggling a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+typedef struct {
+	GPIODLineRequest *request;
+	guint line_offset;
+	GPIODLineValue value;
+} ToggleData;
+
+static gboolean toggle_line(gpointer user_data)
+{
+	ToggleData *data = user_data;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	data->value = data->value == G_GPIOD_LINE_VALUE_ACTIVE ?
+				G_GPIOD_LINE_VALUE_INACTIVE :
+				G_GPIOD_LINE_VALUE_ACTIVE;
+
+	ret = g_gpiod_line_request_set_value(data->request, data->line_offset,
+					     data->value, &err);
+	if (!ret) {
+		g_printerr("failed to set line value: %s\n", err->message);
+		exit(EXIT_FAILURE);
+	}
+
+	g_print("%u=%s\n",
+		data->line_offset,
+		data->value == G_GPIOD_LINE_VALUE_ACTIVE ?
+					"active" : "inactive");
+
+	return G_SOURCE_CONTINUE;
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GError) err = NULL;
+	ToggleData data;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT,
+			NULL);
+	line_cfg = g_gpiod_line_config_new();
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = g_gpiod_request_config_new("consumer", "toggle-line-value",
+					     NULL);
+
+	request = g_gpiod_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	data.request = request;
+	data.line_offset = line_offset;
+	data.value = G_GPIOD_LINE_VALUE_INACTIVE;
+
+	loop = g_main_loop_new(NULL, FALSE);
+	/* Do the GLib way: add a callback to be invoked from the main loop. */
+	g_timeout_add_seconds(1, toggle_line, &data);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/toggle_multiple_line_values_glib.c b/bindings/glib/examples/toggle_multiple_line_values_glib.c
new file mode 100644
index 0000000..24ee7fa
--- /dev/null
+++ b/bindings/glib/examples/toggle_multiple_line_values_glib.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of periodically toggling multiple lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+typedef struct {
+	GPIODLineRequest *request;
+	GArray *offsets;
+	GArray *values;
+} ToggleData;
+
+static void toggle_values(GArray *values)
+{
+	GPIODLineValue *value;
+	guint i;
+
+	for (i = 0; i < values->len; i++) {
+		value = &g_array_index(values, GPIODLineValue, i);
+		*value = *value == G_GPIOD_LINE_VALUE_ACTIVE ?
+					G_GPIOD_LINE_VALUE_INACTIVE :
+					G_GPIOD_LINE_VALUE_ACTIVE;
+	}
+}
+
+static gboolean toggle_lines(gpointer user_data)
+{
+	ToggleData *data = user_data;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	toggle_values(data->values);
+
+	ret = g_gpiod_line_request_set_values_subset(data->request,
+						     data->offsets,
+						     data->values, &err);
+	if (!ret) {
+		g_printerr("failed to set line values: %s\n", err->message);
+		exit(EXIT_FAILURE);
+	}
+
+	for (i = 0; i < data->offsets->len; i++)
+		g_print("%u=%s ",
+			g_array_index(data->offsets, guint, i),
+			g_array_index(data->values,
+				      GPIODLineValue,
+				      i) == G_GPIOD_LINE_VALUE_ACTIVE ?
+						"active" : "inactive");
+	g_print("\n");
+
+	return G_SOURCE_CONTINUE;
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const GPIODLineValue line_values[] = {
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_INACTIVE
+	};
+	static const gsize num_lines = 3;
+
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	ToggleData data;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_vals(offsets, line_offsets, num_lines);
+
+	values = g_array_new(FALSE, TRUE, sizeof(GPIODLineValue));
+	g_array_append_vals(values, line_values, num_lines);
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT,
+			NULL);
+	line_cfg = g_gpiod_line_config_new();
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = g_gpiod_line_config_set_output_values(line_cfg, values, &err);
+	if (!ret) {
+		g_printerr("failed to set output values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = g_gpiod_request_config_new("consumer", "toggle-line-value",
+					     NULL);
+
+	request = g_gpiod_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	data.request = request;
+	data.offsets = offsets;
+	data.values = values;
+
+	loop = g_main_loop_new(NULL, FALSE);
+	/* Do the GLib way: add a callback to be invoked from the main loop. */
+	g_timeout_add_seconds(1, toggle_lines, &data);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/watch_line_info_glib.c b/bindings/glib/examples/watch_line_info_glib.c
new file mode 100644
index 0000000..e05d020
--- /dev/null
+++ b/bindings/glib/examples/watch_line_info_glib.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of watching for requests on particular lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_info_event(GPIODChip *chip G_GNUC_UNUSED,
+			  GPIODInfoEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GPIODLineInfo) info = NULL;
+	g_autoptr(GString) event_name = NULL;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(G_GPIOD_INFO_EVENT_TYPE_TYPE,
+				g_gpiod_info_event_get_event_type(event)));
+	g_string_replace(event_name, "G_GPIOD_INFO_EVENT_LINE_", "", 0);
+	info = g_gpiod_info_event_get_line_info(event);
+	offset = g_gpiod_line_info_get_offset(info);
+
+	g_print("%s %u\n", event_name->str, offset);
+}
+
+int main(void)
+{
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const gsize num_lines = 3;
+
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint i;
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GPIODLineInfo) info =
+			g_gpiod_chip_watch_line_info(chip, line_offsets[i],
+						     &err);
+		if (!info) {
+			g_printerr("unable to watch line info for offset %u: %s",
+				   line_offsets[1], err->message);
+			return EXIT_FAILURE;
+		}
+	}
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	g_signal_connect(chip, "info-event", G_CALLBACK(on_info_event), NULL);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/watch_line_value_glib.c b/bindings/glib/examples/watch_line_value_glib.c
new file mode 100644
index 0000000..0f3933e
--- /dev/null
+++ b/bindings/glib/examples/watch_line_value_glib.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of asynchronously watching for edges on a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_edge_event(GPIODLineRequest *request G_GNUC_UNUSED,
+			  GPIODEdgeEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GString) event_name = NULL;
+	guint64 timestamp;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(G_GPIOD_EDGE_EVENT_TYPE_TYPE,
+				g_gpiod_edge_event_get_event_type(event)));
+	g_string_replace(event_name, "G_GPIOD_EDGE_EVENT_", "", 0);
+	timestamp = g_gpiod_edge_event_get_timestamp_ns(event);
+	offset = g_gpiod_edge_event_get_line_offset(event);
+
+	g_print("%s %lu %u\n", event_name->str, timestamp, offset);
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offset = 5;
+
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Assume a button connecting the pin to ground, so pull it up and
+	 * provide some debounce.
+	 */
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			"edge-detection", G_GPIOD_LINE_EDGE_BOTH,
+			"bias", G_GPIOD_LINE_BIAS_PULL_UP,
+			"debounce-period-us", 1000,
+			NULL);
+
+	line_cfg = g_gpiod_line_config_new();
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = g_gpiod_request_config_new("consumer", "watch-line-value",
+					     NULL);
+
+	request = g_gpiod_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s", err->message);
+		return EXIT_FAILURE;
+	}
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	/* Connect to the edge-event signal on the line-request. */
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_edge_event), NULL);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/watch_multiple_edge_rising_glib.c b/bindings/glib/examples/watch_multiple_edge_rising_glib.c
new file mode 100644
index 0000000..e99b58a
--- /dev/null
+++ b/bindings/glib/examples/watch_multiple_edge_rising_glib.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*
+ * Minimal example of asynchronously watching for rising edges on multiple
+ * lines.
+ */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_edge_event(GPIODLineRequest *request G_GNUC_UNUSED,
+			  GPIODEdgeEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GString) event_name = NULL;
+	guint64 timestamp;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(G_GPIOD_EDGE_EVENT_TYPE_TYPE,
+				g_gpiod_edge_event_get_event_type(event)));
+	g_string_replace(event_name, "G_GPIOD_EDGE_EVENT_", "", 0);
+	timestamp = g_gpiod_edge_event_get_timestamp_ns(event);
+	offset = g_gpiod_edge_event_get_line_offset(event);
+
+	g_print("%s %lu %u\n", event_name->str, timestamp, offset);
+}
+
+int main(void)
+{
+	/* Example configuration - customize to suit your situation. */
+	static const gchar *const chip_path = "/dev/gpiochip1";
+	static const guint line_offsets[] = { 5, 3, 7 };
+	static const gsize num_lines = 3;
+
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_vals(offsets, line_offsets, num_lines);
+
+	chip = g_gpiod_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Assume a button connecting the pin to ground, so pull it up and
+	 * provide some debounce.
+	 */
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			"edge-detection", G_GPIOD_LINE_EDGE_RISING,
+			"bias", G_GPIOD_LINE_BIAS_PULL_UP,
+			"debounce-period-us", 1000,
+			NULL);
+
+	line_cfg = g_gpiod_line_config_new();
+	ret = g_gpiod_line_config_add_line_settings(line_cfg, offsets,
+						    settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = g_gpiod_request_config_new(NULL);
+	g_gpiod_request_config_set_consumer(req_cfg, "watch-multiline-value");
+
+	request = g_gpiod_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s", err->message);
+		return EXIT_FAILURE;
+	}
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	/* Connect to the edge-event signal on the line-request. */
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_edge_event), NULL);
+
+	g_main_loop_run(loop);
+
+	return EXIT_SUCCESS;
+}
-- 
2.40.1


