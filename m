Return-Path: <linux-gpio+bounces-8267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA55934AE7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 722DBB21AA3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B70E823CE;
	Thu, 18 Jul 2024 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hFIsg2GX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9709A8175F
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294927; cv=none; b=D477IuNrKzNqYg1KLXnjDY8Lgah6X+fLgiCV5TIErG/qEY8a0ha7wzy57Z2OURY3hT4gjr0LqZoR8YgU9OooRWLZF3t3zO4YATx5LZawIh43rmmYOWMZpktPkQX+hddsbbIXzXvEDV7vX4Z1EQBrKP1rEXr17/Q4DQBJnZXUnuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294927; c=relaxed/simple;
	bh=0wcMfzQFhzlij302GMY4WZ9ixIi9No6G7LpkeBET8qU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfTJr5l93Z2FwlsbGDL6AiZnt3F5+5fNY2u5qJGcwLNIbV+ZqniVEljtoIEBFaXefa4CF+p3SGa3YKHIKD6CGJb0xpPG7vMJ78FXNw81iMLiit5gz0PrGPPHCbUXxcgJHt9mAWwq4uqefPnN7+Vsy3FTHYlsslhnj1B/ZxwJbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hFIsg2GX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42679f33fefso761475e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294923; x=1721899723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qd6HF4U7ga46pzIv7o3cy2nIOXwA07Q8xGTDHh89CXo=;
        b=hFIsg2GX69oKabzPwbJQuEpsGPXBsGZrFVvhP1nF1i1J3cAfRQdpQlVZQLUVbGeVVI
         C1MrO/Z227fXO2fFUybhvaQJf1wf7+wE9G3WlqTWTAdHzF1csAhzuyTQ7QST9R4cXXbi
         trSwwNyz+7QRTylhXRYBOTLSGMEUOa+EwoiJs0j9mVevHXMzJIQ7Dq981HktaqqOMIWX
         Kbne+di3N6dNATHQI9luPovbHWV0PngbM/RgoF9rIxiy2cRv+6qtCV84r/l7OKbAawS6
         TY8/XG4jGK0uInfzX9Ejs1yHQGHt04ECFE0YZcE0c448PHLrYGBpjThdNTz3n+KEme9M
         E8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294923; x=1721899723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qd6HF4U7ga46pzIv7o3cy2nIOXwA07Q8xGTDHh89CXo=;
        b=wvUG+qfCuXcP7osUeIqHLU+UWeDdHe6Wt1eZDWONAqQrrYaUcN5NBECB1Ow3bJgQC6
         L2dizntNuq+DII1/itAUvKDxP+ANhdXV8U+nOyHFLpmbah0QkpDdb/egEduwFVj3CV21
         4Dt21hGXlgCxdKw8WreUffxAtms35a6zpq+QAoQrmbLUyBe+E/g4fkeqVP3okVwwkEqn
         5YkZSdqPrvLl8zF9YZpiar62Zm7+p6V10VB4SXh4K1xbTFwWGmMntJNfGDIFhC2rPiKb
         5/xtzlpaHGNpyKsQh9x586hVTWzCQTp8KIf7vrUaxtCMjYGjWK+hYc/FqlWt/1D7vDiU
         Aaqw==
X-Gm-Message-State: AOJu0Yy5ya6c8/y/yLz/aVF/ryXbTF4R8LOiqgtHFRkUVlQC9qTazER6
	fpJ4cWlKU3Ekk3xw5PMHbS/qLqiaVuJiRntHwMGy7BOqzSIdBW7QRbO3NBav2zk=
X-Google-Smtp-Source: AGHT+IHVzHe/XYOAunXf9u+/jwUH4jX0IagE9PjcC6wH+lTzAFgmjIYYk/0HTSAbOF3U84sL8fAhyQ==
X-Received: by 2002:a5d:64c5:0:b0:368:326e:1df6 with SMTP id ffacd0b85a97d-3685e166c4fmr628324f8f.19.1721294922740;
        Thu, 18 Jul 2024 02:28:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:00 +0200
Subject: [PATCH libgpiod v3 06/18] bindings: glib: add examples
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-6-c9ea2604f082@linaro.org>
References: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
In-Reply-To: <20240718-dbus-v3-0-c9ea2604f082@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=31642;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Nx2jQK96MCHStiHw0hjoMB4LTQ6/Kzp5NdUqfe+LYVk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOA/fj/apbswDyJku+xP9ytqH2LqYwb59GilT
 FPVAlYXW9+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgPwAKCRARpy6gFHHX
 ckTqD/0b0pz6LI6Nxx3Wubhwh1mDp+1cp4+6aoApvduQ5mLBCoYY6yMThdJ3hGIZAazBoK5R3kE
 zQySQUpCWasdUZ0O5g3nvGKaRGSoiaJpddYeAoCVZv1+tIjbtFJbG+fwNP4ga7aFK/qwSgSbw/I
 xaS4Bltr0Pu2aFuDZGBx0aK/Hr1iewLIDXI8rRrgKOPg/iGolv3g3luKSSK2HxA7rDY/gXuHB45
 aqUrnl9WquAt7c+BS6j/wJfe0FVXv4JP/G8VjcE8ogm336khEOB7pjhiXke9copOCdqx5rQQL2+
 KalbI6yIJbwAl2BO5euFcXpNBfzKWVhC8yjt5OZfWoTPk9olDut0MBuVSnrMhKLgVD4X7Id+ISa
 A6o2O4LXzHa0hvOJ2t8GwTjBa2Ok7mSk2dasc/lGT78EfpSzs4CSDLwgD1a0ARuO1P3ln9XG5H2
 rG1KplN8SRsXAVMH9fg08Z74+2VzwaAFV24xRoqFEwRJe5z8PMCeQkTN4iKkICN+pEvosdsnfUV
 MA/RGw2+JcvCjMIzbEmFrM1mlpySDFC12KZ7Ayx1DvUZlMqyJY0FVKK74dKaasVed2/Sm2YdQFR
 UjbyvP2xrP4WaH3/utObnqPb9MeBOUTSwuL3w0bcjV/qJJQ8gCL66Xr4cYlD/5THnaTwM4s64rN
 ru+a5a2+XowanuQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add example programs showcasing the usage of GLib bindings to libgpiod.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/examples/find_line_by_name_glib.c    |  71 +++++++++++
 bindings/glib/examples/get_chip_info_glib.c        |  42 +++++++
 bindings/glib/examples/get_line_info_glib.c        |  80 +++++++++++++
 bindings/glib/examples/get_line_value_glib.c       |  68 +++++++++++
 .../glib/examples/get_multiple_line_values_glib.c  |  73 ++++++++++++
 .../examples/reconfigure_input_to_output_glib.c    | 104 ++++++++++++++++
 bindings/glib/examples/toggle_line_value_glib.c    |  99 ++++++++++++++++
 .../examples/toggle_multiple_line_values_glib.c    | 132 +++++++++++++++++++++
 bindings/glib/examples/watch_line_info_glib.c      |  63 ++++++++++
 bindings/glib/examples/watch_line_value_glib.c     |  91 ++++++++++++++
 .../examples/watch_multiple_edge_rising_glib.c     |  95 +++++++++++++++
 11 files changed, 918 insertions(+)

diff --git a/bindings/glib/examples/find_line_by_name_glib.c b/bindings/glib/examples/find_line_by_name_glib.c
new file mode 100644
index 0000000..ee8766e
--- /dev/null
+++ b/bindings/glib/examples/find_line_by_name_glib.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GpiodglibChipInfo) info = NULL;
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
+		g_autoptr(GpiodglibChip) chip = NULL;
+		g_autofree gchar *path = NULL;
+		g_autofree gchar *name = NULL;
+
+		path = g_build_filename("/dev", filename, NULL);
+		if (!gpiodglib_is_gpiochip_device(path))
+			continue;
+
+		chip = gpiodglib_chip_new(path, &err);
+		if (err) {
+			g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+				   path, err->message);
+			return EXIT_FAILURE;
+		}
+
+		ret = gpiodglib_chip_get_line_offset_from_name(chip, line_name,
+							       &offset, &err);
+		if (!ret) {
+			g_printerr("Failed to map the line name '%s' to offset: %s\n",
+				   line_name, err->message);
+			return EXIT_FAILURE;
+		}
+
+		info = gpiodglib_chip_get_info(chip, &err);
+		if (!info) {
+			g_printerr("Failed to get chip info: %s\n",
+				   err->message);
+			return EXIT_FAILURE;
+		}
+
+		name = gpiodglib_chip_info_dup_name(info);
+
+		g_print("%s %u\n", name, offset);
+	}
+
+	g_print("line '%s' not found\n", line_name);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_chip_info_glib.c b/bindings/glib/examples/get_chip_info_glib.c
new file mode 100644
index 0000000..ccdf437
--- /dev/null
+++ b/bindings/glib/examples/get_chip_info_glib.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autofree gchar *label = NULL;
+	g_autofree gchar *name = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (err) {
+		g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+			   chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	info = gpiodglib_chip_get_info(chip, &err);
+	if (err) {
+		g_printerr("Failed to retrieve GPIO chip info: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	name = gpiodglib_chip_info_dup_name(info);
+	label = gpiodglib_chip_info_dup_label(info);
+
+	g_print("%s [%s] (%u lines)\n",
+		name, label, gpiodglib_chip_info_get_num_lines(info));
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_line_info_glib.c b/bindings/glib/examples/get_line_info_glib.c
new file mode 100644
index 0000000..bd49332
--- /dev/null
+++ b/bindings/glib/examples/get_line_info_glib.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of reading the info for a line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static GString *make_flags(GpiodglibLineInfo *info)
+{
+	g_autofree gchar *drive_str = NULL;
+	g_autofree gchar *edge_str = NULL;
+	g_autofree gchar *bias_str = NULL;
+	GpiodglibLineDrive drive;
+	GpiodglibLineEdge edge;
+	GpiodglibLineBias bias;
+	GString *ret;
+
+	edge = gpiodglib_line_info_get_edge_detection(info);
+	bias = gpiodglib_line_info_get_bias(info);
+	drive = gpiodglib_line_info_get_drive(info);
+
+	edge_str = g_enum_to_string(GPIODGLIB_LINE_EDGE_TYPE, edge);
+	bias_str = g_enum_to_string(GPIODGLIB_LINE_BIAS_TYPE, bias);
+	drive_str = g_enum_to_string(GPIODGLIB_LINE_DRIVE_TYPE, drive);
+
+	ret = g_string_new(NULL);
+	g_string_printf(ret, "%s, %s, %s", edge_str, bias_str, drive_str);
+	g_string_replace(ret, "GPIODGLIB_LINE_", "", 0);
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
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autofree gchar *consumer = NULL;
+	GpiodglibLineDirection direction;
+	g_autoptr(GString) flags = NULL;
+	g_autofree gchar *name = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean active_low;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (err) {
+		g_printerr("Failed to open the GPIO chip at '%s': %s\n",
+			   chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	info = gpiodglib_chip_get_line_info(chip, line_offset, &err);
+	if (err) {
+		g_printerr("Failed to retrieve GPIO line info: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	name = gpiodglib_line_info_dup_name(info);
+	consumer = gpiodglib_line_info_dup_consumer(info);
+	direction = gpiodglib_line_info_get_direction(info);
+	active_low = gpiodglib_line_info_is_active_low(info);
+	flags = make_flags(info);
+
+	g_print("\tline: %u %s %s %s %s [%s]\n",
+		line_offset,
+		name ?: "unnamed",
+		consumer ?: "unused",
+		direction == GPIODGLIB_LINE_DIRECTION_INPUT ?
+					"input" : "output",
+		active_low ? "active-low" : "active-high",
+		flags->str);
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/get_line_value_glib.c b/bindings/glib/examples/get_line_value_glib.c
new file mode 100644
index 0000000..660ba7d
--- /dev/null
+++ b/bindings/glib/examples/get_line_value_glib.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+	gboolean ret;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_INPUT,
+					       NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer",
+					       "get-line-value-glib",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = gpiodglib_line_request_get_value(request, line_offset,
+					       &offset, &err);
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
index 0000000..2b2e547
--- /dev/null
+++ b/bindings/glib/examples/get_multiple_line_values_glib.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i, j;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	for (i = 0; i < num_lines; i++)
+		g_array_append_val(offsets, line_offsets[i]);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_INPUT,
+					       NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer",
+					       "get-multiple-line-values",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = gpiodglib_line_request_get_values_subset(request, offsets,
+						       &values, &err);
+	if (!ret) {
+		g_printerr("failed to read line values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	for (j = 0; j < values->len; j++)
+		g_print("%d ", g_array_index(values, GpiodglibLineValue, j));
+	g_print("\n");
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/reconfigure_input_to_output_glib.c b/bindings/glib/examples/reconfigure_input_to_output_glib.c
new file mode 100644
index 0000000..9254cfb
--- /dev/null
+++ b/bindings/glib/examples/reconfigure_input_to_output_glib.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodglibLineValue value;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_INPUT,
+					       NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer",
+					       "reconfigure-input-to-output",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Read the current line value. */
+	ret = gpiodglib_line_request_get_value(request, line_offset,
+					       &value, &err);
+	if (!ret) {
+		g_printerr("failed to read line value: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%s (input)\n",
+		value == GPIODGLIB_LINE_VALUE_ACTIVE ? "Active" : "Inactive");
+
+	/* Switch the line to an output and drive it high. */
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_ACTIVE);
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Reconfigure lines. */
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	if (!ret) {
+		g_printerr("failed to reconfigure lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	/* Report the current driven value. */
+	ret = gpiodglib_line_request_get_value(request, line_offset,
+					       &value, &err);
+	if (!ret) {
+		g_printerr("failed to read line value: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	g_print("%s (output)\n",
+		value == GPIODGLIB_LINE_VALUE_ACTIVE ? "Active" : "Inactive");
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/glib/examples/toggle_line_value_glib.c b/bindings/glib/examples/toggle_line_value_glib.c
new file mode 100644
index 0000000..e9e0e41
--- /dev/null
+++ b/bindings/glib/examples/toggle_line_value_glib.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of periodically toggling a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+typedef struct {
+	GpiodglibLineRequest *request;
+	guint line_offset;
+	GpiodglibLineValue value;
+} ToggleData;
+
+static gboolean toggle_line(gpointer user_data)
+{
+	ToggleData *data = user_data;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	data->value = data->value == GPIODGLIB_LINE_VALUE_ACTIVE ?
+					GPIODGLIB_LINE_VALUE_INACTIVE :
+					GPIODGLIB_LINE_VALUE_ACTIVE;
+
+	ret = gpiodglib_line_request_set_value(data->request, data->line_offset,
+					       data->value, &err);
+	if (!ret) {
+		g_printerr("failed to set line value: %s\n", err->message);
+		exit(EXIT_FAILURE);
+	}
+
+	g_print("%u=%s\n",
+		data->line_offset,
+		data->value == GPIODGLIB_LINE_VALUE_ACTIVE ?
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
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GError) err = NULL;
+	ToggleData data;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_OUTPUT,
+					       NULL);
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer", "toggle-line-value",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
+	if (!request) {
+		g_printerr("failed to request lines: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	data.request = request;
+	data.line_offset = line_offset;
+	data.value = GPIODGLIB_LINE_VALUE_INACTIVE;
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
index 0000000..d1b37b3
--- /dev/null
+++ b/bindings/glib/examples/toggle_multiple_line_values_glib.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of periodically toggling multiple lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+typedef struct {
+	GpiodglibLineRequest *request;
+	GArray *offsets;
+	GArray *values;
+} ToggleData;
+
+static void toggle_values(GArray *values)
+{
+	GpiodglibLineValue *value;
+	guint i;
+
+	for (i = 0; i < values->len; i++) {
+		value = &g_array_index(values, GpiodglibLineValue, i);
+		*value = *value == GPIODGLIB_LINE_VALUE_ACTIVE ?
+					GPIODGLIB_LINE_VALUE_INACTIVE :
+					GPIODGLIB_LINE_VALUE_ACTIVE;
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
+	ret = gpiodglib_line_request_set_values_subset(data->request,
+						       data->offsets,
+						       data->values, &err);
+	if (!ret) {
+		g_printerr("failed to set line values: %s\n", err->message);
+		exit(EXIT_FAILURE);
+	}
+
+	for (i = 0; i < data->offsets->len; i++)
+		g_print("%u=%s ",
+			g_array_index(data->offsets, guint, i),
+			g_array_index(data->values,
+				      GpiodglibLineValue,
+				      i) == GPIODGLIB_LINE_VALUE_ACTIVE ?
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
+	static const GpiodglibLineValue line_values[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE
+	};
+	static const gsize num_lines = 3;
+
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	ToggleData data;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_vals(offsets, line_offsets, num_lines);
+
+	values = g_array_new(FALSE, TRUE, sizeof(GpiodglibLineValue));
+	g_array_append_vals(values, line_values, num_lines);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_OUTPUT,
+					       NULL);
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s\n",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	ret = gpiodglib_line_config_set_output_values(line_cfg, values, &err);
+	if (!ret) {
+		g_printerr("failed to set output values: %s\n", err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer", "toggle-line-value",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
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
index 0000000..e3b3ae4
--- /dev/null
+++ b/bindings/glib/examples/watch_line_info_glib.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of watching for requests on particular lines. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+			  GpiodglibInfoEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GString) event_name = NULL;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(GPIODGLIB_INFO_EVENT_TYPE_TYPE,
+				gpiodglib_info_event_get_event_type(event)));
+	g_string_replace(event_name, "GPIODGLIB_INFO_EVENT_LINE_", "", 0);
+	info = gpiodglib_info_event_get_line_info(event);
+	offset = gpiodglib_line_info_get_offset(info);
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
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint i;
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GpiodglibLineInfo) info =
+			gpiodglib_chip_watch_line_info(chip, line_offsets[i],
+						       &err);
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
index 0000000..2292f16
--- /dev/null
+++ b/bindings/glib/examples/watch_line_value_glib.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/* Minimal example of asynchronously watching for edges on a single line. */
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+static void on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			  GpiodglibEdgeEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GString) event_name = NULL;
+	guint64 timestamp;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(GPIODGLIB_EDGE_EVENT_TYPE_TYPE,
+				gpiodglib_edge_event_get_event_type(event)));
+	g_string_replace(event_name, "GPIODGLIB_EDGE_EVENT_", "", 0);
+	timestamp = gpiodglib_edge_event_get_timestamp_ns(event);
+	offset = gpiodglib_edge_event_get_line_offset(event);
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
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_val(offsets, line_offset);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Assume a button connecting the pin to ground, so pull it up and
+	 * provide some debounce.
+	 */
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_UP,
+			"debounce-period-us", 1000,
+			NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new("consumer", "watch-line-value",
+					       NULL);
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
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
index 0000000..aa47713
--- /dev/null
+++ b/bindings/glib/examples/watch_multiple_edge_rising_glib.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+static void on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			  GpiodglibEdgeEvent *event,
+			  gpointer data G_GNUC_UNUSED)
+{
+	g_autoptr(GString) event_name = NULL;
+	guint64 timestamp;
+	guint offset;
+
+	event_name = g_string_new(
+			g_enum_to_string(GPIODGLIB_EDGE_EVENT_TYPE_TYPE,
+				gpiodglib_edge_event_get_event_type(event)));
+	g_string_replace(event_name, "GPIODGLIB_EDGE_EVENT_", "", 0);
+	timestamp = gpiodglib_edge_event_get_timestamp_ns(event);
+	offset = gpiodglib_edge_event_get_line_offset(event);
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
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	g_array_append_vals(offsets, line_offsets, num_lines);
+
+	chip = gpiodglib_chip_new(chip_path, &err);
+	if (!chip) {
+		g_printerr("unable to open %s: %s\n", chip_path, err->message);
+		return EXIT_FAILURE;
+	}
+
+	/*
+	 * Assume a button connecting the pin to ground, so pull it up and
+	 * provide some debounce.
+	 */
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_RISING,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_UP,
+			"debounce-period-us", 1000,
+			NULL);
+
+	line_cfg = gpiodglib_line_config_new();
+	ret = gpiodglib_line_config_add_line_settings(line_cfg, offsets,
+						      settings, &err);
+	if (!ret) {
+		g_printerr("failed to add line settings to line config: %s",
+			   err->message);
+		return EXIT_FAILURE;
+	}
+
+	req_cfg = gpiodglib_request_config_new(NULL);
+	gpiodglib_request_config_set_consumer(req_cfg, "watch-multiline-value");
+
+	request = gpiodglib_chip_request_lines(chip, req_cfg, line_cfg, &err);
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
2.43.0


