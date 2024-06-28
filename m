Return-Path: <linux-gpio+bounces-7815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3591C634
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A83028689A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6306157CBE;
	Fri, 28 Jun 2024 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pV/q0HzU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CBB55887
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601149; cv=none; b=KwzzrcsYXUJGbJq5E88EJ0H1uQW5AwiI7kZAfQd2V5/AXDZq3kjzL3RJNsoP9KS9wa9m1tDR0tLSs8MIScWrydWpfTFKrUXTttXChSlpKlgm4SQjvlysfQ9MVbk8gvslRy4rDcCQvF5pwAzwvshaYroP/dVovRnkbCYY9aVJZMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601149; c=relaxed/simple;
	bh=SlzY/eobVZbAqEQnhELAbpVvIf4+tFvg5l6GcSa0cPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzL2NNBYwRkFjbZ0pzKqFhpuKeTIr6+cDeTIrfw4WRrcuXVkfhmP1Bj1mMKYdRer08ZAejsuhR5ZZxmkH7Yn+iO9R92/m4vhPlOXHvJ0iWZnc3ORm9g2nCZxvkf26T5XadhCrqEYgJeuY200bTpUEXNGpMte3AwZjdULdJESy0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pV/q0HzU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-425680b1d3aso6583465e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601145; x=1720205945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TxxKDw6lFxix32iMlWY5Xj3wDy40LO1W4xF7xjBoQs=;
        b=pV/q0HzUncLa/HDIv8plXtGFhBbV+5CgnZvcfMcIK/oHlzJj2qHigtBIfkqn58PIKx
         A3o9OiGdyoJixkOhAJRdRfmWkFqpPsQYD//cGzCra4SEp/5P+X0RctghM66nCDMpwtCM
         zqGJj6gPIvqDxMU1tK5VJY7L1dGfebRGtUzmL2HJb2dNgYGw+A2nvEpDZWPofKlaqoTD
         BqgnYeDhUd3mC91J6NKgjCAVmP5x4JkvCaLcRngvAyJQHVzrixM957xsAoka6F6SGKJD
         +KnRsuw0nWVdaxUA1qH7cPbbiURlDZreb718YEs1OMVjC7tpyI1GqzOKz7kWwT/X8fZM
         u9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601145; x=1720205945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TxxKDw6lFxix32iMlWY5Xj3wDy40LO1W4xF7xjBoQs=;
        b=Aztnd3FHIGkXHIvPG4BcwpROdKnUxYx+fZoITXDJ+B0kynIQeOukTQub1D6rgZNYe9
         u1sv2sb731+J3Z74fJGdxzMXaMxAU2Nvxz8j06O6e9Tch/khtvH094jCSVu6+nJttGv2
         RfFCrBYmuBpcCUlM0NPGsiJzX7pNMr5zcLZ7g6MWLhFEFjUBB4O3EujrHqDOGXgNV7Nw
         uzZFRLLvczofmlKNn0QJO+U41ODoClX63iGE/3qO46SK/VQEB4HPkgLtqChUKJR2g90f
         ICV3KhxLGHeAFQrS+X5AWwMSUtBCW6XnZp4a/tK55F0SYqjW3994YK/mk4sQTboM3Vfq
         GUeg==
X-Forwarded-Encrypted: i=1; AJvYcCWN9klb4VDRP7xbCO231M1VUxJkJOtRFH1kWGp/Ri5IUFn0K85/G4ZSguo1iOjbUK5X9ykHQuXJmZ+EmJJZiDHmV82FYGFzMX58+Q==
X-Gm-Message-State: AOJu0YzT8a8NW7ZWVuy44JHbvrkbm2IwuGshyGFNrEOk7XoFZfZfCKt6
	PzcwCCoUkDg/Dtvna+Njz18qzo+zn4BBv1lL6JroXgiKGZ7mEr6UuBac8JDbWBo=
X-Google-Smtp-Source: AGHT+IEubA+6EKVJwOoYNecPKFmEPUqCHTRQdzvA7WehmxQBzPQtKf7Ot7A1lFqRaRzKGKiyZeH0ng==
X-Received: by 2002:adf:f782:0:b0:35f:2725:7ae2 with SMTP id ffacd0b85a97d-366e9628e80mr12292776f8f.57.1719601144693;
        Fri, 28 Jun 2024 11:59:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:25 +0200
Subject: [PATCH RESEND libgpiod v2 06/18] bindings: glib: add examples
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-6-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=30641;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LIJC546j181NYtljHCaPFJ+KtgQfVmiCJZfnYLabPyY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfre+HHgYbww0p3+i+Hr0uqnOZHeqSLbQleb
 I1t1bTwXlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H6wAKCRARpy6gFHHX
 cs7qEADQb1rL9gvvQxijDLGNTaas/7iprK4TkN1NrTolBptKxgd0JwcwG3J7JRQhvIuNkTUHcxf
 nFoWrsqiR6TJFAHSLZ1hnLTB0OMgyhd1DeojL60dYqG2sqlnrgwn//nDiWUVmzROpoo5Eal9cM6
 L0cJPBtz3YBE96Z+aHFiTi4AHRM9FmqJzZxQDKOaHWNKIcA27jrge9vx+qp38pl9C5jWkEXPBOU
 NqY/seHGgZXZUMnsQ5ccUldAuY43GR88E4N/iRduXOZ6JH7jjVzOi9ctRjIRrB4nFDijqJSmIH4
 ER3DcVwqr0qF+ZL0N7VS2z55tLZumuUux+Utr5jWXqHEYG1mKDo1xT//C0bnEDQsS32u3DHuTcx
 1bVi5OGeW8p/u4SksTU/rjbo/wNHrRrbpsNbZZx7rYbZKZCByVgsshphjW7azcWaCJAo0okXd3K
 gaEntxAzfL4PKeZM/4rPbB5ZvrFb1Q/12CEn+cgEE9tu1pIFQGMmrTnob8si4M43MHIqKccNNBq
 NyljzQBY8bfgNjWqbbVLEea9f5dW6J49asY5aeKxQ54HB+zAoD1N4dT5aClohiIhNqGb++tnpAv
 nrGJpgw9XbpwiLJcHW0H4ui3+3LzOvU0ypntUa76cybaTeu040QTPc675uMWvirZYeFaMwjNbcj
 +nVo2PVOBvK/gIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add example programs showcasing the usage of GLib bindings to libgpiod.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/examples/find_line_by_name_glib.c    |  68 +++++++++++
 bindings/glib/examples/get_chip_info_glib.c        |  39 ++++++
 bindings/glib/examples/get_line_info_glib.c        |  79 ++++++++++++
 bindings/glib/examples/get_line_value_glib.c       |  67 +++++++++++
 .../glib/examples/get_multiple_line_values_glib.c  |  72 +++++++++++
 .../examples/reconfigure_input_to_output_glib.c    | 103 ++++++++++++++++
 bindings/glib/examples/toggle_line_value_glib.c    |  99 ++++++++++++++++
 .../examples/toggle_multiple_line_values_glib.c    | 132 +++++++++++++++++++++
 bindings/glib/examples/watch_line_info_glib.c      |  63 ++++++++++
 bindings/glib/examples/watch_line_value_glib.c     |  91 ++++++++++++++
 .../examples/watch_multiple_edge_rising_glib.c     |  95 +++++++++++++++
 11 files changed, 908 insertions(+)

diff --git a/bindings/glib/examples/find_line_by_name_glib.c b/bindings/glib/examples/find_line_by_name_glib.c
new file mode 100644
index 0000000..46a193e
--- /dev/null
+++ b/bindings/glib/examples/find_line_by_name_glib.c
@@ -0,0 +1,68 @@
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
+		if (!ret) {
+			g_printerr("Failed to map the line name '%s' to offset: %s\n",
+				   line_name, err->message);
+			return EXIT_FAILURE;
+		}
+
+		info = g_gpiod_chip_get_info(chip, &err);
+		if (!info) {
+			g_printerr("Failed to get chip info: %s\n",
+				   err->message);
+			return EXIT_FAILURE;
+		}
+
+		g_print("%s %u\n", g_gpiod_chip_info_get_name(info), offset);
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
2.43.0


