Return-Path: <linux-gpio+bounces-8642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B861294A3DB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6664F284873
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92531D1757;
	Wed,  7 Aug 2024 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z9bx9979"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754B1D174E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021894; cv=none; b=oN2BpQGr6U8vYQXXX1NoV83J88jeyjED4FWPaqAxcHWbvQU7oSzfIYDeW3j12mLnclLXReeiVQhZiNaujXjRthknAYUdz36ZObVkTES/j6J9wVViRRdgY+XvG+FAdnRVEX7VkOv4QlzEjw6fiLOTUuF0WL9kr4qHRm/IP28KG4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021894; c=relaxed/simple;
	bh=crhTucHEcX3UAcx4tJoyf6jwbSTmnXqUGD1VW2jGEIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYsLNoth3ZNSC5zu+sRzqk1UWXSLjCkiPF15yGn/XQBRbVzPW8GnfRygHTXNiox1xhBvCPwiAwIO2ZXqmeMf85QGhYgpvVUBw6sYL2aqzB/zh9GLivuGpIWOnvS37eQsrq1iU0bXGg7FgSOJww6fQlwkAu9+b8xdwX6s4MUmbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z9bx9979; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so16468991fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021888; x=1723626688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsc8TI9WHkCfdLfmy3xgn5VW6t8W+L1gvDWNX8MvR20=;
        b=z9bx9979fuqktA79pgQ/pjycx+OIyJQAXehynl3RqjLOYv0FfCYFllEoFk/OaeNvGh
         0XL/diHi2aGeAQqSRBdPIOzJOxHkoQ6NU9MKP+wke8OxAx8/JiNm5/1Vmbnr6mzqCjPo
         fdo9ScvrpKiN7YI4kHVRS5r/N2VKPl9wuKAfEjTKLEcPrDznur9CHh6qg8FAYAdqWXwh
         c6cq7rzLU0X3bDQFA4oCfkhpxBiSl176rVg3E1EkD/qc6FmQdJlerIXex/kypMz9IVi9
         EFbA003U65wAFXhbVluqOA/NxVLxtRosmL48x9z4UuF3Y5dMTOXNQMmeKAw5hicdbg0D
         TfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021888; x=1723626688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsc8TI9WHkCfdLfmy3xgn5VW6t8W+L1gvDWNX8MvR20=;
        b=U7PL5J6cGLudPWWcfnE1aaSK8E9JfCIZG2FVbbbg+mq5w7P1WZ4gOULQDojzVabubZ
         PesbkIgPjz4LzPsZKBRjXtiqwts20LddXTLQoCDaTNEAjZZf1BZF6qQplVQmQ1EjzLMF
         +yMfPbrWgRkXNYaxg+NGntB0HR772A4MrOowchjrBfMflbmymdl8NXh1TK0LyqfQagAj
         XS3H1iAwhEpaHZG+XYX8IhSsmrf4sx1FgkrQfsJIYDmdFA1JSvTqOhQ06mDZDdUGIQj+
         TfIGae+qgqvrDe4G6kHAuiRV7ofkRv3H00q2qdVEhU8IdbIDkdBOvRZ/PXe3o3GUw8p+
         zWIw==
X-Gm-Message-State: AOJu0YztlM5mLpU6X2nGSBI9nq9YCgl56IaMBZgl+14NZm2wM40DAD/E
	afedB21FKhtKcIu58tUXEWMP2fcaJwUYq1vsEIm0pT9ZarQRCVaIX4fXN9DMaMo=
X-Google-Smtp-Source: AGHT+IG6hP8mMszIn1QrSHBYAJzYCXBOXjeab/HX57TowffG7I9OveFOWJOc2zK1DTfrnWjpAvRzAQ==
X-Received: by 2002:a2e:3815:0:b0:2f0:1b87:9090 with SMTP id 38308e7fff4ca-2f15aac1b77mr130118021fa.29.1723021887787;
        Wed, 07 Aug 2024 02:11:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:46 +0200
Subject: [PATCH libgpiod v4 15/18] dbus: add a command-line client
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-15-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=86139;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=I8z1qTxYPUPI2SChx/rUsN9Cpz9rR9vvTOPamkTIAZk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoTiynN7Lf5GeD8MtVv2B/tk+Bx++5L2lesO
 Anmp1C1nmqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EwAKCRARpy6gFHHX
 cgrVD/9DqTedq+QVEbrlL3ZsCXsDFkc+bBF1MsGs0uhpltNmO94rtLplNLtE3pCfp37GCzNK8MP
 VQiqWmd/liOFe6kzy2KkQrIeZYaIRMhP7Gn1e4GhfHf6ic24NgHropv8b/VGK+vfK5VOVs4a/U5
 E1/G5IA4/SY9M5NDQiSw/vq3w5DJzDwPDZdknLO/lHCHGAYg8faWg387fVbn+sNqEHA2IbBO2bd
 VpwasvXneR8Ox2qTOBV33SiFybSogGs4ccvHJXu21RKcsEBbehwoDBkF7OWexjxpwfPCr+q9eDI
 u4hZUsudG7BiBlJWUXrjnAbRuVKdS94O0ig/4WZ9hvobqt6w2huqxeSocefopKj30KEcvgDyjBO
 ASHaW1xmXkInSV0ZHeBXrrBE1Uy6g0MHTaUsRqumUG+6ZaJMEz57ujk16MdzhmnIOiSWaUnFe4p
 J0UNA9DrhN1qSk9ZeTE0PqhZuMSvkBgvK8yOIuFEScX1d+azJlLpDqmrGnvcHdw+xRklcrzP2dy
 6x1P6QQZNRwJM2DAzfXSiBKDx1LDR2qXMcv4pnOa9wzgOzkRvjX7x5Mz5Wtu/lwahoFuOu3kpLG
 75LTP5QkdZRClBc2H1Fii+YNGVi40LL6xRxbqpZcx5BYZbTkW8tcl7APe2pDpbQx25NaT/8ihOG
 uNaY9xYwgtEn+Gw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add code for gpiocli - the command-line client for controlling GPIOs
using the gpio-manager daemon.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/client/common.c      | 646 ++++++++++++++++++++++++++++++++++++++++++++++
 dbus/client/common.h      | 203 +++++++++++++++
 dbus/client/detect.c      |  53 ++++
 dbus/client/find.c        |  66 +++++
 dbus/client/get.c         | 212 +++++++++++++++
 dbus/client/gpiocli.c     | 174 +++++++++++++
 dbus/client/info.c        | 184 +++++++++++++
 dbus/client/monitor.c     | 191 ++++++++++++++
 dbus/client/notify.c      | 295 +++++++++++++++++++++
 dbus/client/reconfigure.c |  76 ++++++
 dbus/client/release.c     |  64 +++++
 dbus/client/request.c     | 250 ++++++++++++++++++
 dbus/client/requests.c    |  71 +++++
 dbus/client/set.c         | 173 +++++++++++++
 dbus/client/wait.c        | 188 ++++++++++++++
 15 files changed, 2846 insertions(+)

diff --git a/dbus/client/common.c b/dbus/client/common.c
new file mode 100644
index 0000000..912c1ad
--- /dev/null
+++ b/dbus/client/common.c
@@ -0,0 +1,646 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib/gprintf.h>
+#include <stdarg.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "common.h"
+
+static void print_err_msg(GError *err, const gchar *fmt, va_list va)
+{
+	g_printerr("%s: ", g_get_prgname());
+	g_vfprintf(stderr, fmt, va);
+	if (err)
+		g_printerr(": %s", err->message);
+	g_printerr("\n");
+}
+
+void die(const gchar *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	print_err_msg(NULL, fmt, va);
+	va_end(va);
+
+	exit(EXIT_FAILURE);
+}
+
+void die_gerror(GError *err, const gchar *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	print_err_msg(err, fmt, va);
+	va_end(va);
+
+	exit(EXIT_FAILURE);
+}
+
+void die_parsing_opts(const char *fmt, ...)
+{
+	va_list va;
+
+	va_start(va, fmt);
+	print_err_msg(NULL, fmt, va);
+	va_end(va);
+	g_printerr("\nSee %s --help\n", g_get_prgname());
+
+	exit(EXIT_FAILURE);
+}
+
+void parse_options(const GOptionEntry *opts, const gchar *summary,
+		   const gchar *description, int *argc, char ***argv)
+{
+	g_autoptr(GOptionContext) ctx = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	ctx = g_option_context_new(NULL);
+	g_option_context_set_summary(ctx, summary);
+	g_option_context_set_description(ctx, description);
+	g_option_context_add_main_entries(ctx, opts, NULL);
+	g_option_context_set_strict_posix(ctx, TRUE);
+
+	ret = g_option_context_parse(ctx, argc, argv, &err);
+	if (!ret) {
+		g_printerr("%s: Option parsing failed: %s\nSee %s --help\n",
+			   g_get_prgname(), err->message, g_get_prgname());
+		exit(EXIT_FAILURE);
+	}
+}
+
+void check_manager(void)
+{
+	g_autoptr(GDBusProxy) proxy = NULL;
+	g_autoptr(GVariant) result = NULL;
+	g_autoptr(GError) err = NULL;
+
+	proxy = g_dbus_proxy_new_for_bus_sync(
+			G_BUS_TYPE_SYSTEM, G_DBUS_PROXY_FLAGS_NONE, NULL,
+			"io.gpiod1", "/io/gpiod1", "org.freedesktop.DBus.Peer",
+			NULL, &err);
+	if (!proxy)
+		die_gerror(err, "Unable to create a proxy to '/io/gpiod1'");
+
+	result = g_dbus_proxy_call_sync(proxy, "Ping", NULL,
+					G_DBUS_CALL_FLAGS_NONE, -1, NULL,
+					&err);
+	if (!result) {
+		if (err->domain == G_DBUS_ERROR) {
+			switch (err->code) {
+			case G_DBUS_ERROR_ACCESS_DENIED:
+				die("Access to gpio-manager denied, check your permissions");
+			case G_DBUS_ERROR_SERVICE_UNKNOWN:
+				die("gpio-manager not running");
+			}
+		}
+
+		die_gerror(err, "Failed trying to contect the gpio manager");
+	}
+}
+
+gboolean quit_main_loop_on_signal(gpointer user_data)
+{
+	GMainLoop *loop = user_data;
+
+	g_main_loop_quit(loop);
+
+	return G_SOURCE_REMOVE;
+}
+
+void die_on_name_vanished(GDBusConnection *con G_GNUC_UNUSED,
+			  const gchar *name G_GNUC_UNUSED,
+			  gpointer user_data G_GNUC_UNUSED)
+{
+	die("gpio-manager exited unexpectedly");
+}
+
+GList *strv_to_gstring_list(GStrv lines)
+{
+	gsize llen = g_strv_length(lines);
+	GList *list = NULL;
+	guint i;
+
+	for (i = 0; i < llen; i++)
+		list = g_list_append(list, g_string_new(lines[i]));
+
+	return list;
+}
+
+gint output_value_from_str(const gchar *value_str)
+{
+	if ((g_strcmp0(value_str, "active") == 0) ||
+	    (g_strcmp0(value_str, "1") == 0))
+		return 1;
+	else if ((g_strcmp0(value_str, "inactive") == 0) ||
+		 (g_strcmp0(value_str, "0") == 0))
+		return 0;
+
+	die_parsing_opts("invalid output value: '%s'", value_str);
+}
+
+static gboolean str_is_all_digits(const gchar *str)
+{
+	for (; *str; str++) {
+		if (!g_ascii_isdigit(*str))
+			return FALSE;
+	}
+
+	return TRUE;
+}
+
+static gint compare_objs_by_path(GDBusObject *a, GDBusObject *b)
+{
+	return strverscmp(g_dbus_object_get_object_path(a),
+			  g_dbus_object_get_object_path(b));
+}
+
+GDBusObjectManager *get_object_manager_client(const gchar *obj_path)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GError) err = NULL;
+
+	manager = gpiodbus_object_manager_client_new_for_bus_sync(
+				G_BUS_TYPE_SYSTEM,
+				G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE,
+				"io.gpiod1", obj_path, NULL, &err);
+	if (!manager)
+		die_gerror(err,
+			   "failed to create the object manager client for %s",
+			   obj_path);
+
+	return g_object_ref(manager);
+}
+
+static gchar *make_chip_obj_path(const gchar *chip)
+{
+	return g_strdup_printf(
+		str_is_all_digits(chip) ?
+			"/io/gpiod1/chips/gpiochip%s" :
+			"/io/gpiod1/chips/%s",
+		chip);
+}
+
+GpiodbusObject *get_chip_obj_by_path(const gchar *obj_path)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/chips");
+
+	chip_obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+								    obj_path));
+	if (!chip_obj)
+		die("No such chip object: '%s'", obj_path);
+
+	return g_object_ref(chip_obj);
+}
+
+GpiodbusObject *get_chip_obj(const gchar *chip_name)
+{
+	g_autofree gchar *chip_path = make_chip_obj_path(chip_name);
+
+	return get_chip_obj_by_path(chip_path);
+}
+
+GList *get_chip_objs(GStrv chip_names)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	GList *objs = NULL;
+	gint i;
+
+	manager = get_object_manager_client("/io/gpiod1/chips");
+
+	if (!chip_names)
+		return g_list_sort(g_dbus_object_manager_get_objects(manager),
+				   (GCompareFunc)compare_objs_by_path);
+
+	for (i = 0; chip_names[i]; i++) {
+		g_autofree gchar *obj_path = make_chip_obj_path(chip_names[i]);
+		g_autoptr(GpiodbusObject) obj = NULL;
+
+		obj = GPIODBUS_OBJECT(
+			g_dbus_object_manager_get_object(manager, obj_path));
+		if (!obj)
+			die("No such chip: '%s'", chip_names[i]);
+
+		objs = g_list_insert_sorted(objs, g_object_ref(obj),
+					    (GCompareFunc)compare_objs_by_path);
+	}
+
+	return objs;
+}
+
+gchar *make_request_obj_path(const gchar *request)
+{
+	return g_strdup_printf(
+		str_is_all_digits(request) ?
+			"/io/gpiod1/requests/request%s" :
+			"/io/gpiod1/requests/%s",
+		request);
+}
+
+GpiodbusObject *get_request_obj(const gchar *request_name)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/requests");
+	obj_path = make_request_obj_path(request_name);
+
+	req_obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+								   obj_path));
+	if (!req_obj)
+		die("No such request: '%s'", request_name);
+
+	return g_object_ref(req_obj);
+}
+
+GList *get_request_objs(void)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	GList *objs = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/requests");
+	objs = g_dbus_object_manager_get_objects(manager);
+
+	return g_list_sort(objs, (GCompareFunc)compare_objs_by_path);
+}
+
+GArray *get_request_offsets(GpiodbusRequest *request)
+{
+	const gchar *chip_path, *line_path, *const *line_paths;
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	GpiodbusLine *line;
+	guint i, offset;
+
+	chip_path = gpiodbus_request_get_chip_path(request);
+	line_paths = gpiodbus_request_get_line_paths(request);
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	manager = get_object_manager_client(chip_path);
+
+	for (i = 0, line_path = line_paths[i];
+	     line_path;
+	     line_path = line_paths[++i]) {
+		g_autoptr(GDBusObject) line_obj = NULL;
+
+		line_obj = g_dbus_object_manager_get_object(manager, line_path);
+		line = gpiodbus_object_peek_line(GPIODBUS_OBJECT(line_obj));
+		offset = gpiodbus_line_get_offset(line);
+		g_array_append_val(offsets, offset);
+	}
+
+	return g_array_ref(offsets);
+}
+
+gboolean get_line_obj_by_name(const gchar *name, GpiodbusObject **line_obj,
+			      GpiodbusObject **chip_obj)
+{
+	g_autolist(GpiodbusObject) chip_objs = NULL;
+	GList *pos;
+
+	if (str_is_all_digits(name))
+		die("Refusing to use line offsets if chip is not specified");
+
+	chip_objs = get_chip_objs(NULL);
+
+	for (pos = g_list_first(chip_objs); pos; pos = g_list_next(pos)) {
+		*line_obj = get_line_obj_by_name_for_chip(pos->data, name);
+		if (*line_obj) {
+			if (chip_obj)
+				*chip_obj = g_object_ref(pos->data);
+			return TRUE;
+		}
+	}
+
+	return FALSE;
+}
+
+GpiodbusObject *
+get_line_obj_by_name_for_chip(GpiodbusObject *chip_obj, const gchar *line_name)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autolist(GpiodbusObject) line_objs = NULL;
+	const gchar *chip_path;
+	GpiodbusLine *line;
+	guint64 offset;
+	GList *pos;
+
+	chip_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(chip_obj));
+	manager = get_object_manager_client(chip_path);
+	line_objs = g_dbus_object_manager_get_objects(manager);
+
+	for (pos = g_list_first(line_objs); pos; pos = g_list_next(pos)) {
+		line = gpiodbus_object_peek_line(pos->data);
+
+		if (g_strcmp0(gpiodbus_line_get_name(line), line_name) == 0)
+			return g_object_ref(pos->data);
+
+		if (str_is_all_digits(line_name)) {
+			offset = g_ascii_strtoull(line_name, NULL, 10);
+			if (offset == gpiodbus_line_get_offset(line))
+				return g_object_ref(pos->data);
+		}
+	}
+
+	return NULL;
+}
+
+GList *get_all_line_objs_for_chip(GpiodbusObject *chip_obj)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	const gchar *chip_path;
+
+	chip_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(chip_obj));
+	manager = get_object_manager_client(chip_path);
+
+	return g_list_sort(g_dbus_object_manager_get_objects(manager),
+			   (GCompareFunc)compare_objs_by_path);
+}
+
+static gchar *sanitize_str(const gchar *str)
+{
+	if (!strlen(str))
+		return NULL;
+
+	return g_strdup(str);
+}
+
+static const gchar *sanitize_direction(const gchar *direction)
+{
+	if ((g_strcmp0(direction, "input") == 0) ||
+	    (g_strcmp0(direction, "output") == 0))
+		return direction;
+
+	die("invalid direction value received from manager: '%s'", direction);
+}
+
+static const gchar *sanitize_drive(const gchar *drive)
+{
+	if ((g_strcmp0(drive, "push-pull") == 0) ||
+	    (g_strcmp0(drive, "open-source") == 0) ||
+	    (g_strcmp0(drive, "open-drain") == 0))
+		return drive;
+
+	die("invalid drive value received from manager: '%s'", drive);
+}
+
+static const gchar *sanitize_bias(const gchar *bias)
+{
+	if ((g_strcmp0(bias, "pull-up") == 0) ||
+	    (g_strcmp0(bias, "pull-down") == 0) ||
+	    (g_strcmp0(bias, "disabled") == 0))
+		return bias;
+
+	if (g_strcmp0(bias, "unknown") == 0)
+		return NULL;
+
+	die("invalid bias value received from manager: '%s'", bias);
+}
+
+static const gchar *sanitize_edge(const gchar *edge)
+{
+	if ((g_strcmp0(edge, "rising") == 0) ||
+	    (g_strcmp0(edge, "falling") == 0) ||
+	    (g_strcmp0(edge, "both") == 0))
+		return edge;
+
+	if (g_strcmp0(edge, "none") == 0)
+		return NULL;
+
+	die("invalid edge value received from manager: '%s'", edge);
+}
+
+static const gchar *sanitize_clock(const gchar *event_clock)
+{
+	if ((g_strcmp0(event_clock, "monotonic") == 0) ||
+	    (g_strcmp0(event_clock, "realtime") == 0) ||
+	    (g_strcmp0(event_clock, "hte") == 0))
+		return event_clock;
+
+	die("invalid clock value received from manager: '%s'", event_clock);
+}
+
+gchar *sanitize_object_path(const gchar *path)
+{
+	if (g_strcmp0(path, "/") == 0)
+		return g_strdup("N/A");
+
+	return g_path_get_basename(path);
+}
+
+LineProperties *get_line_properties(GpiodbusLine *line)
+{
+	LineProperties *props;
+
+	props = g_malloc0(sizeof(*props));
+	props->name = sanitize_str(gpiodbus_line_get_name(line));
+	props->offset = gpiodbus_line_get_offset(line);
+	props->used = gpiodbus_line_get_used(line);
+	props->consumer = sanitize_str(gpiodbus_line_get_consumer(line));
+	props->direction = sanitize_direction(
+				gpiodbus_line_get_direction(line));
+	props->drive = sanitize_drive(gpiodbus_line_get_drive(line));
+	props->bias = sanitize_bias(gpiodbus_line_get_bias(line));
+	props->active_low = gpiodbus_line_get_active_low(line);
+	props->edge = sanitize_edge(gpiodbus_line_get_edge_detection(line));
+	props->debounced = gpiodbus_line_get_debounced(line);
+	props->debounce_period = gpiodbus_line_get_debounce_period_us(line);
+	props->event_clock = sanitize_clock(
+				gpiodbus_line_get_event_clock(line));
+	props->managed = gpiodbus_line_get_managed(line);
+	props->request_name = sanitize_object_path(
+			gpiodbus_line_get_request_path(line));
+
+	return props;
+}
+
+void free_line_properties(LineProperties *props)
+{
+	g_free(props->name);
+	g_free(props->consumer);
+	g_free(props->request_name);
+	g_free(props);
+}
+
+void validate_line_config_opts(LineConfigOpts *opts)
+{
+	gint counter;
+
+	if (opts->input && opts->output)
+		die_parsing_opts("--input and --output are mutually exclusive");
+
+	if (opts->both_edges)
+		opts->rising_edge = opts->falling_edge = TRUE;
+
+	if (!opts->input && (opts->rising_edge || opts->falling_edge))
+		die_parsing_opts("monitoring edges is only possible in input mode");
+
+	counter = 0;
+	if (opts->push_pull)
+		counter++;
+	if (opts->open_drain)
+		counter++;
+	if (opts->open_source)
+		counter++;
+
+	if (counter > 1)
+		die_parsing_opts("--push-pull, --open-drain and --open-source are mutually exclusive");
+
+	if (!opts->output && (counter > 0))
+		die_parsing_opts("--push-pull, --open-drain and --open-source are only available in output mode");
+
+	counter = 0;
+	if (opts->pull_up)
+		counter++;
+	if (opts->pull_down)
+		counter++;
+	if (opts->bias_disabled)
+		counter++;
+
+	if (counter > 1)
+		die_parsing_opts("--pull-up, --pull-down and --bias-disabled are mutually exclusive");
+
+	counter = 0;
+	if (opts->clock_monotonic)
+		counter++;
+	if (opts->clock_realtime)
+		counter++;
+	if (opts->clock_hte)
+		counter++;
+
+	if (counter > 1)
+		die_parsing_opts("--clock-monotonic, --clock-realtime and --clock-hte are mutually exclusive");
+
+	if (counter > 0 && (!opts->rising_edge && !opts->falling_edge))
+		die_parsing_opts("--clock-monotonic, --clock-realtime and --clock-hte can only be used with edge detection enabled");
+
+	if (opts->debounce_period && (!opts->rising_edge && !opts->falling_edge))
+		die_parsing_opts("--debounce-period can only be used with edge-detection enabled");
+}
+
+GVariant *make_line_config(GArray *offsets, LineConfigOpts *opts)
+{
+	const char *direction, *edge = NULL, *bias = NULL, *drive = NULL,
+		   *clock = NULL;
+	g_autoptr(GVariant) output_values = NULL;
+	g_autoptr(GVariant) line_settings = NULL;
+	g_autoptr(GVariant) line_offsets = NULL;
+	g_autoptr(GVariant) line_configs = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	GVariantBuilder builder;
+	guint i;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	for (i = 0; i < offsets->len; i++)
+		g_variant_builder_add_value(&builder,
+			g_variant_new_uint32(g_array_index(offsets, guint, i)));
+	line_offsets = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+
+	if (opts->input)
+		direction = "input";
+	else if (opts->output)
+		direction = "output";
+	else
+		direction = "as-is";
+
+	if (direction)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "direction",
+				      g_variant_new_string(direction)));
+
+	if (opts->rising_edge && opts->falling_edge)
+		edge = "both";
+	else if (opts->falling_edge)
+		edge = "falling";
+	else if (opts->rising_edge)
+		edge = "rising";
+
+	if (edge)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "edge",
+				      g_variant_new_string(edge)));
+
+	if (opts->pull_up)
+		bias = "pull-up";
+	else if (opts->pull_down)
+		bias = "pull-down";
+	else if (opts->bias_disabled)
+		bias = "disabled";
+
+	if (bias)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "bias",
+				      g_variant_new_string(bias)));
+
+	if (opts->push_pull)
+		drive = "push-pull";
+	else if (opts->open_drain)
+		drive = "open-drain";
+	else if (opts->open_source)
+		drive = "open-source";
+
+	if (drive)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "drive",
+				      g_variant_new_string(drive)));
+
+	if (opts->active_low)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "active-low",
+				      g_variant_new_boolean(TRUE)));
+
+	if (opts->debounce_period)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "debounce-period",
+				g_variant_new_int64(opts->debounce_period)));
+
+	if (opts->clock_monotonic)
+		clock = "monotonic";
+	else if (opts->clock_realtime)
+		clock = "realtime";
+	else if (opts->clock_hte)
+		clock = "hte";
+
+	if (clock)
+		g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "event-clock",
+				      g_variant_new_string(clock)));
+
+	line_settings = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_offsets));
+	g_variant_builder_add_value(&builder, g_variant_ref(line_settings));
+	line_config = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_config));
+	line_configs = g_variant_builder_end(&builder);
+
+	if (opts->output_values) {
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		for (i = 0; i < opts->output_values->len; i++) {
+			g_variant_builder_add(&builder, "i",
+					g_array_index(opts->output_values,
+						      gint, i));
+		}
+		output_values = g_variant_builder_end(&builder);
+	} else {
+		output_values = g_variant_new("ai", opts->output_values);
+	}
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_configs));
+	g_variant_builder_add_value(&builder, g_variant_ref(output_values));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
diff --git a/dbus/client/common.h b/dbus/client/common.h
new file mode 100644
index 0000000..772e94a
--- /dev/null
+++ b/dbus/client/common.h
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIOCLI_COMMON_H__
+#define __GPIOCLI_COMMON_H__
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiodbus.h>
+
+void die(const gchar *fmt, ...) G_NORETURN G_GNUC_PRINTF(1, 2);
+void
+die_gerror(GError *err, const gchar *fmt, ...) G_NORETURN G_GNUC_PRINTF(2, 3);
+void die_parsing_opts(const char *fmt, ...) G_NORETURN G_GNUC_PRINTF(1, 2);
+
+void parse_options(const GOptionEntry *opts, const gchar *summary,
+		   const gchar *description, int *argc, char ***argv);
+void check_manager(void);
+
+gboolean quit_main_loop_on_signal(gpointer user_data);
+void die_on_name_vanished(GDBusConnection *con, const gchar *name,
+			  gpointer user_data);
+
+GList *strv_to_gstring_list(GStrv lines);
+gint output_value_from_str(const gchar *value_str);
+
+GDBusObjectManager *get_object_manager_client(const gchar *obj_path);
+GpiodbusObject *get_chip_obj_by_path(const gchar *obj_path);
+GpiodbusObject *get_chip_obj(const gchar *chip_name);
+GList *get_chip_objs(GStrv chip_names);
+gchar *make_request_obj_path(const gchar *request);
+GpiodbusObject *get_request_obj(const gchar *request_name);
+GList *get_request_objs(void);
+GArray *get_request_offsets(GpiodbusRequest *request);
+gboolean get_line_obj_by_name(const gchar *name, GpiodbusObject **line_obj,
+			      GpiodbusObject **chip_obj);
+GpiodbusObject *
+get_line_obj_by_name_for_chip(GpiodbusObject *chip_obj, const gchar *name_line);
+GList *get_all_line_objs_for_chip(GpiodbusObject *chip_obj);
+
+gchar *sanitize_object_path(const gchar *path);
+
+typedef struct {
+	gchar *name;
+	guint offset;
+	gboolean used;
+	gchar *consumer;
+	const gchar *direction;
+	const gchar *drive;
+	const gchar *bias;
+	gboolean active_low;
+	const gchar *edge;
+	gboolean debounced;
+	guint64 debounce_period;
+	const gchar *event_clock;
+	gboolean managed;
+	gchar *request_name;
+} LineProperties;
+
+LineProperties *get_line_properties(GpiodbusLine *line);
+void free_line_properties(LineProperties *props);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(LineProperties, free_line_properties);
+
+typedef struct {
+	gboolean input;
+	gboolean output;
+	gboolean active_low;
+	gboolean rising_edge;
+	gboolean falling_edge;
+	gboolean both_edges;
+	gboolean push_pull;
+	gboolean open_source;
+	gboolean open_drain;
+	gboolean pull_up;
+	gboolean pull_down;
+	gboolean bias_disabled;
+	gboolean clock_monotonic;
+	gboolean clock_realtime;
+	gboolean clock_hte;
+	GTimeSpan debounce_period;
+	GArray *output_values;
+} LineConfigOpts;
+
+#define LINE_CONFIG_OPTIONS(opts) \
+		{ \
+			.long_name		= "input", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->input, \
+			.description		= "Set direction to input.", \
+		}, \
+		{ \
+			.long_name		= "output", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->output, \
+			.description		= "Set direction to output.", \
+		}, \
+		{ \
+			.long_name		= "rising-edge", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->rising_edge, \
+			.description		= "Monitor rising edges." \
+		}, \
+		{ \
+			.long_name		= "falling-edge", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->falling_edge, \
+			.description		= "Monitor falling edges." \
+		}, \
+		{ \
+			.long_name		= "both-edges", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->both_edges, \
+			.description		= "Monitor rising and falling edges." \
+		}, \
+		{ \
+			.long_name		= "push-pull", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->push_pull, \
+			.description		= "Drive the line in push-pull mode.", \
+		}, \
+		{ \
+			.long_name		= "open-drain", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->open_drain, \
+			.description		= "Drive the line in open-drain mode.", \
+		}, \
+		{ \
+			.long_name		= "open-source", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->open_source, \
+			.description		= "Drive the line in open-source mode.", \
+		}, \
+		{ \
+			.long_name		= "pull-up", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->pull_up, \
+			.description		= "Enable internal pull-up bias.", \
+		}, \
+		{ \
+			.long_name		= "pull-down", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->pull_down, \
+			.description		= "Enable internal pull-down bias.", \
+		}, \
+		{ \
+			.long_name		= "bias-disabled", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->bias_disabled, \
+			.description		= "Disable internal pull-up/down bias.", \
+		}, \
+		{ \
+			.long_name		= "active-low", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->active_low, \
+			.description		= "Treat the lines as active low.", \
+		}, \
+		{ \
+			.long_name		= "debounce-period", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_INT64, \
+			.arg_data		= &(opts)->debounce_period, \
+			.arg_description	= "<period in miliseconds>", \
+			.description		= "Enable debouncing and set the period", \
+		}, \
+		{ \
+			.long_name		= "clock-monotonic", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->clock_monotonic, \
+			.description		= "Use monotonic clock for edge event timestamps", \
+		}, \
+		{ \
+			.long_name		= "clock-realtime", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->clock_realtime, \
+			.description		= "Use realtime clock for edge event timestamps", \
+		}, \
+		{ \
+			.long_name		= "clock-hte", \
+			.flags			= G_OPTION_FLAG_NONE, \
+			.arg			= G_OPTION_ARG_NONE, \
+			.arg_data		= &(opts)->clock_hte, \
+			.description		= "Use HTE clock (if available) for edge event timestamps", \
+		}
+
+void validate_line_config_opts(LineConfigOpts *opts);
+GVariant *make_line_config(GArray *offsets, LineConfigOpts *cfg_opts);
+
+#endif /* __GPIOCLI_COMMON_H__ */
diff --git a/dbus/client/detect.c b/dbus/client/detect.c
new file mode 100644
index 0000000..a98c3d3
--- /dev/null
+++ b/dbus/client/detect.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void show_chip(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	GpiodbusObject *chip_obj = elem;
+	GpiodbusChip *chip;
+
+	chip = gpiodbus_object_peek_chip(chip_obj);
+
+	g_print("%s [%s] (%u lines)\n",
+		gpiodbus_chip_get_name(chip),
+		gpiodbus_chip_get_label(chip),
+		gpiodbus_chip_get_num_lines(chip));
+}
+
+int gpiocli_detect_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"List GPIO chips, print their labels and number of GPIO lines.";
+
+	static const gchar *const description =
+"Chips may be identified by name or number. e.g. '0' and 'gpiochip0' refer to\n"
+"the same chip.\n"
+"\n"
+"If no chips are specified - display information for all chips in the system.";
+
+	g_autolist(GpiodbusObject) chip_objs = NULL;
+	g_auto(GStrv) chip_names = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &chip_names,
+			.arg_description	= "[chip]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	chip_objs = get_chip_objs(chip_names);
+	g_list_foreach(chip_objs, show_chip, NULL);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/find.c b/dbus/client/find.c
new file mode 100644
index 0000000..9fe4c1a
--- /dev/null
+++ b/dbus/client/find.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void find_line_in_chip(gpointer elem, gpointer user_data)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	GpiodbusObject *chip_obj = elem;
+	const gchar *name = user_data;
+	GpiodbusChip *chip;
+	GpiodbusLine *line;
+
+	line_obj = get_line_obj_by_name_for_chip(chip_obj, name);
+	if (!line_obj)
+		return;
+
+	chip = gpiodbus_object_peek_chip(chip_obj);
+	line = gpiodbus_object_peek_line(line_obj);
+
+	g_print("%s %u\n",
+		gpiodbus_chip_get_name(chip),
+		gpiodbus_line_get_offset(line));
+
+	exit(EXIT_SUCCESS);
+}
+
+int gpiocli_find_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Gicen a line name, find the name of the parent chip and offset of the line within that chip.";
+
+	static const gchar *const description =
+"As line names are not guaranteed to be unique, this command finds the first line with given name.";
+
+	g_autolist(GpiodbusObject) objs = NULL;
+	g_auto(GStrv) line_name = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &line_name,
+			.arg_description	= "<line name>",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	if (!line_name)
+		die_parsing_opts("line name must be specified");
+	if (g_strv_length(line_name) != 1)
+		die_parsing_opts("only one line can be mapped");
+
+	objs = get_chip_objs(NULL);
+	g_list_foreach(objs, find_line_in_chip, line_name[0]);
+
+	/* If we got here, the line was not found. */
+	die("line '%s' not found", line_name[0]);
+	return EXIT_FAILURE;
+}
diff --git a/dbus/client/get.c b/dbus/client/get.c
new file mode 100644
index 0000000..4ca6f3c
--- /dev/null
+++ b/dbus/client/get.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+int gpiocli_get_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Get values of one or more GPIO lines.";
+
+	static const gchar *const description =
+"If -r/--request is specified then all the lines must belong to the same\n"
+"request (and - by extension - the same chip).\n"
+"\n"
+"If no lines are specified but -r/--request was passed then all lines within\n"
+"the request will be used.";
+
+	const gchar *request_name = NULL, *chip_path, *req_path;
+	gboolean ret, unquoted = FALSE, numeric = FALSE;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	g_auto(GStrv) lines = NULL;
+	GpiodbusRequest *request;
+	GVariantBuilder builder;
+	GpiodbusLine *line;
+	gsize num_lines, i;
+	GVariantIter iter;
+	guint offset;
+	gint value;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "request",
+			.short_name		= 'r',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &request_name,
+			.description		= "restrict scope to a particular request",
+			.arg_description	= "<request>",
+		},
+		{
+			.long_name		= "unquoted",
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &unquoted,
+			.description		= "don't quote line names",
+		},
+		{
+			.long_name		= "numeric",
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &numeric,
+			.description		= "display line values as '0' (inactive) or '1' (active)",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "[line0] [line1]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	if (!lines && !request_name)
+		die_parsing_opts("either at least one line or the request must be specified");
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	num_lines = lines ? g_strv_length(lines) : 0;
+
+	if (!request_name) {
+		/*
+		 * TODO Limit the number of D-Bus calls by gathering the requests
+		 * and their relevant lines into a container of some kind first.
+		 */
+
+		values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+					   num_lines);
+
+		for (i = 0; i < num_lines; i++) {
+			g_autoptr(GpiodbusRequest) req_proxy = NULL;
+			g_autoptr(GpiodbusObject) line_obj = NULL;
+			g_autoptr(GVariant) arg_offsets = NULL;
+			g_autoptr(GVariant) arg_values = NULL;
+
+			ret = get_line_obj_by_name(lines[i], &line_obj, NULL);
+			if (!ret)
+				die("Line not found: %s\n", lines[i]);
+
+			line = gpiodbus_object_peek_line(line_obj);
+			req_path = gpiodbus_line_get_request_path(line);
+
+			if (!gpiodbus_line_get_managed(line))
+				die("Line '%s' not managed by gpio-manager, must be requested first",
+				    lines[i]);
+
+			req_proxy = gpiodbus_request_proxy_new_for_bus_sync(
+							G_BUS_TYPE_SYSTEM,
+							G_DBUS_PROXY_FLAGS_NONE,
+							"io.gpiod1", req_path,
+							NULL, &err);
+			if (err)
+				die_gerror(err,
+					   "Failed to get D-Bus proxy for '%s'",
+					   req_path);
+
+			offset = gpiodbus_line_get_offset(line);
+			g_array_append_val(offsets, offset);
+
+			g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+			g_variant_builder_add(&builder, "u", offset);
+			arg_offsets = g_variant_ref_sink(
+					g_variant_builder_end(&builder));
+
+			ret = gpiodbus_request_call_get_values_sync(
+							req_proxy, arg_offsets,
+							G_DBUS_CALL_FLAGS_NONE,
+							-1, &arg_values, NULL,
+							&err);
+			if (!ret)
+				die_gerror(err, "Failed to get line values");
+
+			g_variant_iter_init(&iter, arg_values);
+			while (g_variant_iter_next(&iter, "i", &value))
+				g_array_append_val(values, value);
+		}
+	} else {
+		g_autoptr(GVariant) arg_offsets = NULL;
+		g_autoptr(GVariant) arg_values = NULL;
+
+		req_obj = get_request_obj(request_name);
+		request = gpiodbus_object_peek_request(req_obj);
+		chip_path = gpiodbus_request_get_chip_path(request);
+		chip_obj = get_chip_obj_by_path(chip_path);
+
+		if (lines) {
+			for (i = 0; i < num_lines; i++) {
+				g_autoptr(GpiodbusObject) line_obj = NULL;
+
+				line_obj = get_line_obj_by_name_for_chip(
+							chip_obj, lines[i]);
+				if (!line_obj)
+					die("Line not found: %s\n", lines[i]);
+
+				line = gpiodbus_object_peek_line(line_obj);
+
+				if (!gpiodbus_line_get_managed(line))
+					die("Line '%s' not managed by gpio-manager, must be requested first",
+					    lines[i]);
+
+				offset = gpiodbus_line_get_offset(line);
+				g_array_append_val(offsets, offset);
+			}
+		} else {
+			offsets = get_request_offsets(request);
+			num_lines = offsets->len;
+		}
+
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		for (i = 0; i < offsets->len; i++)
+			g_variant_builder_add(&builder, "u",
+					      g_array_index(offsets, guint, i));
+		arg_offsets = g_variant_ref_sink(
+					g_variant_builder_end(&builder));
+
+		ret = gpiodbus_request_call_get_values_sync(
+							request, arg_offsets,
+							G_DBUS_CALL_FLAGS_NONE,
+							-1, &arg_values, NULL,
+							&err);
+		if (!ret)
+			die_gerror(err, "Failed to get line values");
+
+		values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+					   g_variant_n_children(arg_values));
+
+		g_variant_iter_init(&iter, arg_values);
+		while (g_variant_iter_next(&iter, "i", &value))
+			g_array_append_val(values, value);
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		if (!unquoted)
+			g_print("\"");
+
+		if (lines)
+			g_print("%s", lines[i]);
+		else
+			g_print("%u", g_array_index(offsets, guint, i));
+
+		if (!unquoted)
+			g_print("\"");
+
+		g_print("=%s", g_array_index(values, guint, i) ?
+					numeric ? "1" : "active" :
+					numeric ? "0" : "inactive");
+
+		if (i != (num_lines - 1))
+			g_print(" ");
+	}
+	g_print("\n");
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/gpiocli.c b/dbus/client/gpiocli.c
new file mode 100644
index 0000000..fbd1bbe
--- /dev/null
+++ b/dbus/client/gpiocli.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib/gstdio.h>
+
+#include "common.h"
+
+typedef struct {
+	gchar *name;
+	int (*main_func)(int argc, char **argv);
+	gchar *descr;
+} GPIOCliCmd;
+
+int gpiocli_detect_main(int argc, char **argv);
+int gpiocli_find_main(int argc, char **argv);
+int gpiocli_info_main(int argc, char **argv);
+int gpiocli_get_main(int argc, char **argv);
+int gpiocli_monitor_main(int argc, char **argv);
+int gpiocli_notify_main(int argc, char **argv);
+int gpiocli_reconfigure_main(int argc, char **argv);
+int gpiocli_release_main(int argc, char **argv);
+int gpiocli_request_main(int argc, char **argv);
+int gpiocli_requests_main(int argc, char **argv);
+int gpiocli_set_main(int argc, char **argv);
+int gpiocli_wait_main(int argc, char **argv);
+
+static const GPIOCliCmd cli_cmds[] = {
+	{
+		.name = "detect",
+		.main_func = gpiocli_detect_main,
+		.descr = "list GPIO chips and print their properties",
+	},
+	{
+		.name = "find",
+		.main_func = gpiocli_find_main,
+		.descr = "take a line name and find its parent chip's name and offset within it",
+	},
+	{
+		.name = "info",
+		.main_func = gpiocli_info_main,
+		.descr = "print information about GPIO lines",
+	},
+	{
+		.name = "get",
+		.main_func = gpiocli_get_main,
+		.descr = "get values of GPIO lines",
+	},
+	{
+		.name = "monitor",
+		.main_func = gpiocli_monitor_main,
+		.descr = "notify the user about edge events",
+	},
+	{
+		.name = "notify",
+		.main_func = gpiocli_notify_main,
+		.descr = "notify the user about line property changes",
+	},
+	{
+		.name = "reconfigure",
+		.main_func = gpiocli_reconfigure_main,
+		.descr = "change the line configuration for an existing request",
+	},
+	{
+		.name = "release",
+		.main_func = gpiocli_release_main,
+		.descr = "release one of the line requests controlled by the manager",
+	},
+	{
+		.name = "request",
+		.main_func = gpiocli_request_main,
+		.descr = "request a set of GPIO lines for exclusive usage by the manager",
+	},
+	{
+		.name = "requests",
+		.main_func = gpiocli_requests_main,
+		.descr = "list all line requests controlled by the manager",
+	},
+	{
+		.name = "set",
+		.main_func = gpiocli_set_main,
+		.descr = "set values of GPIO lines",
+	},
+	{
+		.name = "wait",
+		.main_func = gpiocli_wait_main,
+		.descr = "wait for the gpio-manager interface to appear",
+	},
+	{ }
+};
+
+static GHashTable *make_cmd_table(void)
+{
+	GHashTable *cmd_table = g_hash_table_new_full(g_str_hash, g_str_equal,
+						      NULL, NULL);
+	const GPIOCliCmd *cmd;
+
+	for (cmd = &cli_cmds[0]; cmd->name; cmd++)
+		g_hash_table_insert(cmd_table, cmd->name, cmd->main_func);
+
+	return cmd_table;
+}
+
+static gchar *make_description(void)
+{
+	g_autoptr(GString) descr = g_string_new("Available commands:\n");
+	const GPIOCliCmd *cmd;
+
+	for (cmd = &cli_cmds[0]; cmd->name; cmd++)
+		g_string_append_printf(descr, "  %s - %s\n",
+				       cmd->name, cmd->descr);
+
+	g_string_truncate(descr, descr->len - 1);
+	return g_strdup(descr->str);
+}
+
+static void show_version_and_exit(void)
+{
+	g_print("gpiocli v%s\n", GPIOD_VERSION_STR);
+
+	exit(EXIT_SUCCESS);
+}
+
+int main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Simple command-line client for controlling gpio-manager.";
+
+	g_autoptr(GHashTable) cmd_table = make_cmd_table();
+	g_autofree gchar *description = make_description();
+	g_autofree gchar *basename = NULL;
+	g_autofree gchar *cmd_name = NULL;
+	gint (*cmd_func)(gint, gchar **);
+	g_auto(GStrv) cmd_args = NULL;
+	gboolean show_version = FALSE;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "version",
+			.short_name		= 'v',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &show_version,
+			.description		= "Show version and exit.",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &cmd_args,
+			.arg_description	= "CMD [ARGS?] ...",
+		},
+		{ }
+	};
+
+	basename = g_path_get_basename(argv[0]);
+	g_set_prgname(basename);
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	if (show_version)
+		show_version_and_exit();
+
+	if (!cmd_args)
+		die_parsing_opts("Command must be specified.");
+
+	cmd_func = g_hash_table_lookup(cmd_table, cmd_args[0]);
+	if (!cmd_func)
+		die_parsing_opts("Unknown command: %s.", cmd_args[0]);
+
+	cmd_name = g_strdup_printf("%s %s", basename, cmd_args[0]);
+	g_set_prgname(cmd_name);
+
+	return cmd_func(g_strv_length(cmd_args), cmd_args);
+}
diff --git a/dbus/client/info.c b/dbus/client/info.c
new file mode 100644
index 0000000..fa08a3f
--- /dev/null
+++ b/dbus/client/info.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+#include <string.h>
+
+#include "common.h"
+
+static gchar *make_line_name(const gchar *name)
+{
+	if (!name)
+		return g_strdup("unnamed");
+
+	return g_strdup_printf("\"%s\"", name);
+}
+
+static void do_print_line_info(GpiodbusObject *line_obj,
+			       GpiodbusObject *chip_obj)
+{
+	g_autoptr(LineProperties) props = NULL;
+	g_autoptr(GString) attributes = NULL;
+	g_autofree gchar *line_name = NULL;
+	GpiodbusChip *chip;
+
+	props = get_line_properties(gpiodbus_object_peek_line(line_obj));
+	line_name = make_line_name(props->name);
+
+	attributes = g_string_new("[");
+
+	if (props->used)
+		g_string_append_printf(attributes, "used,consumer=\"%s\",",
+				       props->consumer);
+
+	if (props->managed)
+		g_string_append_printf(attributes, "managed=\"%s\",",
+				       props->request_name);
+
+	if (props->edge) {
+		g_string_append_printf(attributes, "edges=%s,event-clock=%s,",
+				       props->edge, props->event_clock);
+		if (props->debounced)
+			g_string_append_printf(attributes,
+					       "debounce-period=%lu,",
+					       props->debounce_period);
+	}
+
+	if (props->bias)
+		g_string_append_printf(attributes, "bias=%s,", props->bias);
+
+	if (props->active_low)
+		attributes = g_string_append(attributes, "active-low,");
+
+	g_string_append_printf(attributes, "%s", props->direction);
+
+	if (g_strcmp0(props->direction, "output") == 0)
+		g_string_append_printf(attributes, ",%s", props->drive);
+
+	attributes = g_string_append(attributes, "]");
+
+	if (chip_obj) {
+		chip = gpiodbus_object_peek_chip(chip_obj);
+		g_print("%s ", gpiodbus_chip_get_name(chip));
+	} else {
+		g_print("\tline ");
+	}
+
+	g_print("%3u:\t%s\t\t%s\n", props->offset, line_name, attributes->str);
+}
+
+static void print_line_info(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	GpiodbusObject *line_obj = elem;
+
+	do_print_line_info(line_obj, NULL);
+}
+
+static void do_show_chip(GpiodbusObject *chip_obj)
+{
+	GpiodbusChip *chip = gpiodbus_object_peek_chip(chip_obj);
+	g_autolist(GpiodbusObject) line_objs = NULL;
+
+	g_print("%s - %u lines:\n",
+		gpiodbus_chip_get_name(chip),
+		gpiodbus_chip_get_num_lines(chip));
+
+	line_objs = get_all_line_objs_for_chip(chip_obj);
+	g_list_foreach(line_objs, print_line_info, NULL);
+}
+
+static void show_chip(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	GpiodbusObject *chip_obj = elem;
+
+	do_show_chip(chip_obj);
+}
+
+static void show_line_with_chip(gpointer elem, gpointer user_data)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	GpiodbusObject *chip_obj = user_data;
+	g_autofree gchar *chip_name = NULL;
+	GString *line_name = elem;
+
+	line_obj = get_line_obj_by_name_for_chip(chip_obj, line_name->str);
+	if (!line_obj) {
+		chip_name = g_path_get_basename(
+			g_dbus_object_get_object_path(G_DBUS_OBJECT(chip_obj)));
+		die("no line '%s' on chip '%s'", line_name->str, chip_name);
+	}
+
+	do_print_line_info(line_obj, chip_obj);
+}
+
+static void show_line(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	GString *line_name = elem;
+	gboolean ret;
+
+	ret = get_line_obj_by_name(line_name->str, &line_obj, &chip_obj);
+	if (!ret)
+		die("line '%s' not found", line_name->str);
+
+	do_print_line_info(line_obj, chip_obj);
+}
+
+int gpiocli_info_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Print information about GPIO lines.";
+
+	static const gchar *const description =
+"Lines are specified by name, or optionally by offset if the chip option\n"
+"is provided.\n";
+
+	g_autolist(GpiodbusObject) chip_objs = NULL;
+	g_autolist(GString) line_name_list = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_auto(GStrv) line_names = NULL;
+	const gchar *chip_name = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		= "restrict scope to a particular chip",
+			.arg_description	= "<chip>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &line_names,
+			.arg_description	= "[line1] [line2] ...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+	check_manager();
+
+	if (chip_name)
+		chip_obj = get_chip_obj(chip_name);
+
+	if (line_names) {
+		line_name_list = strv_to_gstring_list(line_names);
+		if (chip_obj)
+			g_list_foreach(line_name_list, show_line_with_chip,
+				       chip_obj);
+		else
+			g_list_foreach(line_name_list, show_line, NULL);
+	} else if (chip_obj) {
+		do_show_chip(chip_obj);
+	} else {
+		chip_objs = get_chip_objs(NULL);
+		g_list_foreach(chip_objs, show_chip, NULL);
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/monitor.c b/dbus/client/monitor.c
new file mode 100644
index 0000000..292b2bf
--- /dev/null
+++ b/dbus/client/monitor.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib-unix.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "common.h"
+
+typedef struct {
+	GList *lines;
+} MonitorData;
+
+static void on_edge_event(GpiodbusLine *line, GVariant *args,
+			  gpointer user_data G_GNUC_UNUSED)
+{
+	const char *name = gpiodbus_line_get_name(line);
+	gulong global_seqno, line_seqno;
+	guint64 timestamp;
+	gint edge;
+
+	g_variant_get(args, "(ittt)", &edge, &timestamp,
+		      &global_seqno, &line_seqno);
+
+	g_print("%lu %s ", timestamp, edge ? "rising " : "falling");
+	if (strlen(name))
+		g_print("\"%s\"\n", name);
+	else
+		g_print("%u\n", gpiodbus_line_get_offset(line));
+}
+
+static void connect_edge_event(gpointer elem, gpointer user_data)
+{
+	GpiodbusObject *line_obj = elem;
+	MonitorData *data = user_data;
+	g_autoptr(GError) err = NULL;
+	const gchar *line_obj_path;
+	GpiodbusLine *line;
+
+	line_obj_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(line_obj));
+
+	line = gpiodbus_line_proxy_new_for_bus_sync(G_BUS_TYPE_SYSTEM,
+						    G_DBUS_PROXY_FLAGS_NONE,
+						    "io.gpiod1", line_obj_path,
+						    NULL, &err);
+	if (err)
+		die_gerror(err, "Failed to get D-Bus proxy for '%s'",
+			   line_obj_path);
+
+	if (!gpiodbus_line_get_managed(line))
+		die("Line must be managed by gpio-manager in order to be monitored");
+
+	if (g_strcmp0(gpiodbus_line_get_edge_detection(line), "none") == 0)
+		die("Edge detection must be enabled for monitored lines");
+
+	data->lines = g_list_append(data->lines, line);
+
+	g_signal_connect(line, "edge-event", G_CALLBACK(on_edge_event), NULL);
+}
+
+int gpiocli_monitor_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Get values of one or more GPIO lines.";
+
+	static const gchar *const description =
+"If -r/--request is specified then all the lines must belong to the same\n"
+"request (and - by extension - the same chip).\n"
+"\n"
+"If no lines are specified but -r/--request was passed then all lines within\n"
+"the request will be used.";
+
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	const gchar *request_name = NULL, *chip_path;
+	g_autolist(GpiodbusObject) line_objs = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_auto(GStrv) lines = NULL;
+	GpiodbusRequest *request;
+	MonitorData data = { };
+	gsize num_lines, i;
+	guint watch_id;
+	gboolean ret;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "request",
+			.short_name		= 'r',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &request_name,
+			.description		= "restrict scope to a particular request",
+			.arg_description	= "<request>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "[line0] [line1]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	watch_id = g_bus_watch_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				    G_BUS_NAME_WATCHER_FLAGS_NONE,
+				    NULL, die_on_name_vanished, NULL, NULL);
+	check_manager();
+
+	if (!lines && !request_name)
+		die_parsing_opts("either at least one line or the request must be specified");
+
+	if (request_name) {
+		req_obj = get_request_obj(request_name);
+		request = gpiodbus_object_peek_request(req_obj);
+		chip_path = gpiodbus_request_get_chip_path(request);
+		chip_obj = get_chip_obj_by_path(chip_path);
+		offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+		if (lines) {
+			num_lines = g_strv_length(lines);
+
+			for (i = 0; i < num_lines; i++) {
+				g_autoptr(GpiodbusObject) line_obj = NULL;
+
+				line_obj = get_line_obj_by_name_for_chip(
+							chip_obj, lines[i]);
+				if (!line_obj)
+					die("Line not found: %s\n", lines[i]);
+
+				line_objs = g_list_append(line_objs,
+							g_object_ref(line_obj));
+			}
+		} else {
+			offsets = get_request_offsets(request);
+			manager = get_object_manager_client(chip_path);
+
+			for (i = 0; i < offsets->len; i++) {
+				g_autoptr(GpiodbusObject) line_obj = NULL;
+				g_autofree char *obj_path = NULL;
+
+				obj_path = g_strdup_printf("%s/line%u",
+							   chip_path,
+							   g_array_index(
+								offsets,
+								guint, i));
+
+				line_obj = GPIODBUS_OBJECT(
+					g_dbus_object_manager_get_object(
+								manager,
+								obj_path));
+				if (!line_obj)
+					die("Line not found: %u\n",
+					    g_array_index(offsets, guint, i));
+
+				line_objs = g_list_append(line_objs,
+							g_object_ref(line_obj));
+			}
+		}
+	} else {
+		num_lines = g_strv_length(lines);
+
+		for (i = 0; i < num_lines; i++) {
+			g_autoptr(GpiodbusObject) line_obj = NULL;
+
+			ret = get_line_obj_by_name(lines[i], &line_obj, NULL);
+			if (!ret)
+				die("Line not found: %s\n", lines[i]);
+
+			line_objs = g_list_append(line_objs,
+						  g_object_ref(line_obj));
+		}
+	}
+
+	g_list_foreach(line_objs, connect_edge_event, &data);
+
+	loop = g_main_loop_new(NULL, FALSE);
+	g_unix_signal_add(SIGTERM, quit_main_loop_on_signal, loop);
+	g_unix_signal_add(SIGINT, quit_main_loop_on_signal, loop);
+
+	g_main_loop_run(loop);
+
+	g_bus_unwatch_name(watch_id);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/notify.c b/dbus/client/notify.c
new file mode 100644
index 0000000..f5a8e5d
--- /dev/null
+++ b/dbus/client/notify.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib-unix.h>
+#include <stdlib.h>
+
+#include "common.h"
+
+/*
+ * Used to keep line proxies and chip interfaces alive for the duration of the
+ * program, which is required for signals to work.
+ */
+typedef struct {
+	GList *lines;
+	GList *chips;
+	GpiodbusObject *scoped_chip;
+} NotifyData;
+
+static void clear_notify_data(NotifyData *data)
+{
+	g_list_free_full(data->lines, g_object_unref);
+	g_list_free_full(data->chips, g_object_unref);
+
+	if (data->scoped_chip)
+		g_clear_object(&data->scoped_chip);
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(NotifyData, clear_notify_data);
+
+static const gchar *bool_to_str(gboolean val)
+{
+	return val ? "True" : "False";
+}
+
+static const gchar *bool_variant_to_str(GVariant *val)
+{
+	return bool_to_str(g_variant_get_boolean(val));
+}
+
+static void
+on_properties_changed(GpiodbusLine *line, GVariant *changed_properties,
+		      GStrv invalidated_properties G_GNUC_UNUSED,
+		      gpointer user_data)
+{
+	GpiodbusChip *chip = user_data;
+	g_autofree gchar *name = NULL;
+	const gchar *consumer, *tmp;
+	GVariantIter iter;
+	GVariant *v;
+	gsize len;
+	gchar *k;
+
+	if (g_variant_n_children(changed_properties) == 0)
+		return;
+
+	tmp = gpiodbus_line_get_name(line);
+	name = tmp ? g_strdup_printf("\"%s\"", tmp) : g_strdup("unnamed");
+
+	g_variant_iter_init(&iter, changed_properties);
+	while (g_variant_iter_next(&iter, "{sv}", &k, &v)) {
+		g_autoptr(GString) change = g_string_new(NULL);
+		g_autofree gchar *req_name = NULL;
+		g_autoptr(GVariant) val = v;
+		g_autofree gchar *key = k;
+
+		if (g_strcmp0(key, "Consumer") == 0) {
+			consumer = g_variant_get_string(val, &len);
+			g_string_printf(change, "consumer=>\"%s\"",
+					len ? consumer : "unused");
+		} else if (g_strcmp0(key, "Used") == 0) {
+			g_string_printf(change, "used=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "Debounced") == 0) {
+			g_string_printf(change, "debounced=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "ActiveLow") == 0) {
+			g_string_printf(change, "active-low=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "Direction") == 0) {
+			g_string_printf(change, "direction=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "Drive") == 0) {
+			g_string_printf(change, "drive=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "Bias") == 0) {
+			g_string_printf(change, "bias=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "EdgeDetection") == 0) {
+			g_string_printf(change, "edge=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "EventClock") == 0) {
+			g_string_printf(change, "event-clock=>%s",
+					       g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "DebouncePeriodUs") == 0) {
+			g_string_printf(change, "debounce-period=>%ld",
+					       g_variant_get_uint64(val));
+		} else if (g_strcmp0(key, "Managed") == 0) {
+			g_string_printf(change, "managed=>%s",
+					       bool_variant_to_str(val));
+		} else if (g_strcmp0(key, "RequestPath") == 0) {
+			req_name = sanitize_object_path(
+					g_variant_get_string(val, NULL));
+			g_string_printf(change, "request=>%s",
+					       req_name);
+		} else {
+			die("unexpected property update received from manager: '%s'",
+			    key);
+		}
+
+		g_print("%s - %u (%s): [%s]\n", gpiodbus_chip_get_name(chip),
+			gpiodbus_line_get_offset(line), name ?: "unnamed",
+			change->str);
+	}
+}
+
+static void print_line_info(GpiodbusLine *line, GpiodbusChip *chip)
+{
+	g_autoptr(LineProperties) props = get_line_properties(line);
+	g_autoptr(GString) attrs = g_string_new(props->direction);
+	g_autofree gchar *name = NULL;
+
+	if (props->used)
+		g_string_append(attrs, ",used");
+
+	if (props->consumer)
+		g_string_append_printf(attrs, ",consumer=\"%s\"",
+				       props->consumer);
+
+	if (props->drive && g_strcmp0(props->direction, "output") == 0)
+		g_string_append_printf(attrs, ",%s", props->drive);
+
+	if (props->bias) {
+		if (g_strcmp0(props->bias, "disabled") == 0)
+			g_string_append(attrs, ",bias-disabled");
+		else
+			g_string_append_printf(attrs, ",%s", props->bias);
+	}
+
+	if (props->active_low)
+		g_string_append(attrs, ",active-low");
+
+	if (props->edge) {
+		if (g_strcmp0(props->edge, "both") == 0)
+			g_string_append(attrs, ",both-edges");
+		else
+			g_string_append_printf(attrs, ",%s-edge", props->edge);
+
+		g_string_append_printf(attrs, ",%s-clock", props->event_clock);
+
+		if (props->debounced)
+			g_string_append_printf(attrs,
+					       "debounced,debounce-period=%lu",
+					       props->debounce_period);
+	}
+
+	if (props->managed)
+		g_string_append_printf(attrs, ",managed,request=\"%s\"",
+				       props->request_name);
+
+	name = props->name ? g_strdup_printf("\"%s\"", props->name) :
+			     g_strdup("unnamed");
+
+	g_print("%s - %u (%s): [%s]\n", gpiodbus_chip_get_name(chip),
+		props->offset, name ?: "unnamed", attrs->str);
+}
+
+static void connect_line(gpointer elem, gpointer user_data)
+{
+	g_autoptr(GpiodbusObject) line_obj = NULL;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusLine) line = NULL;
+	g_autoptr(GpiodbusChip) chip = NULL;
+	g_autofree gchar *chip_name = NULL;
+	g_autoptr(GError) err = NULL;
+	NotifyData *data = user_data;
+	const gchar *line_obj_path;
+	GString *line_name = elem;
+	gboolean ret;
+
+	if (data->scoped_chip) {
+		chip_obj = g_object_ref(data->scoped_chip);
+		line_obj = get_line_obj_by_name_for_chip(chip_obj,
+							 line_name->str);
+		if (!line_obj) {
+			chip_name = g_path_get_basename(
+				g_dbus_object_get_object_path(
+					G_DBUS_OBJECT(chip_obj)));
+			die("no line '%s' on chip '%s'",
+			    line_name->str, chip_name);
+		}
+	} else {
+		ret = get_line_obj_by_name(line_name->str,
+					   &line_obj, &chip_obj);
+		if (!ret)
+			die("line '%s' not found", line_name->str);
+	}
+
+	line_obj_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(line_obj));
+
+	line = gpiodbus_line_proxy_new_for_bus_sync(G_BUS_TYPE_SYSTEM,
+						    G_DBUS_PROXY_FLAGS_NONE,
+						    "io.gpiod1", line_obj_path,
+						    NULL, &err);
+	if (err)
+		die_gerror(err, "Failed to get D-Bus proxy for '%s'",
+			   line_obj_path);
+
+	data->lines = g_list_append(data->lines, g_object_ref(line));
+
+	if (data->scoped_chip) {
+		if (g_list_length(data->chips) == 0) {
+			chip = gpiodbus_object_get_chip(chip_obj);
+			data->chips = g_list_append(data->chips,
+						    g_object_ref(chip));
+		} else {
+			chip = g_list_first(data->chips)->data;
+		}
+	} else {
+		chip = gpiodbus_object_get_chip(chip_obj);
+		data->chips = g_list_append(data->chips, g_object_ref(chip));
+	}
+
+	print_line_info(line, chip);
+
+	g_signal_connect(line, "g-properties-changed",
+			 G_CALLBACK(on_properties_changed), chip);
+}
+
+int gpiocli_notify_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Monitor a set of lines for property changes.";
+
+	static const gchar *const description =
+"Lines are specified by name, or optionally by offset if the chip option\n"
+"is provided.\n";
+
+	g_autolist(GString) line_name_list = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	g_auto(GStrv) line_names = NULL;
+	const gchar *chip_name = NULL;
+	/*
+	 * FIXME: data internals must be freed but there's some issue with
+	 * unrefing the GpiodbusObject here. For now it's leaking memory.
+	 */
+	NotifyData data = { };
+	guint watch_id;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		= "restrict scope to a particular chip",
+			.arg_description	= "<chip>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &line_names,
+			.arg_description	= "<line1> [line2] ...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	watch_id = g_bus_watch_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				    G_BUS_NAME_WATCHER_FLAGS_NONE,
+				    NULL, die_on_name_vanished, NULL, NULL);
+	check_manager();
+
+	if (!line_names)
+		die_parsing_opts("at least one line must be specified");
+
+	if (chip_name)
+		data.scoped_chip = get_chip_obj(chip_name);
+
+	line_name_list = strv_to_gstring_list(line_names);
+	g_list_foreach(line_name_list, connect_line, &data);
+
+	loop = g_main_loop_new(NULL, FALSE);
+	g_unix_signal_add(SIGTERM, quit_main_loop_on_signal, loop);
+	g_unix_signal_add(SIGINT, quit_main_loop_on_signal, loop);
+
+	g_main_loop_run(loop);
+
+	g_bus_unwatch_name(watch_id);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/reconfigure.c b/dbus/client/reconfigure.c
new file mode 100644
index 0000000..cb22f58
--- /dev/null
+++ b/dbus/client/reconfigure.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+int gpiocli_reconfigure_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Change the line configuration for an existing request.";
+
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autoptr(GArray) output_values = NULL;
+	LineConfigOpts line_cfg_opts = { };
+	g_autoptr(GArray) offsets = NULL;
+	g_auto(GStrv) remaining = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodbusRequest *request;
+	gsize num_values;
+	gboolean ret;
+	gint val;
+	guint i;
+
+	const GOptionEntry opts[] = {
+		LINE_CONFIG_OPTIONS(&line_cfg_opts),
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+			.arg_description	= "<request> [value1] [value2]...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+	validate_line_config_opts(&line_cfg_opts);
+
+	if (!remaining || g_strv_length(remaining) == 0)
+		die_parsing_opts("Exactly one request to reconfigure must be specified.");
+
+	num_values = g_strv_length(remaining) - 1;
+
+	check_manager();
+
+	req_obj = get_request_obj(remaining[0]);
+	request = gpiodbus_object_peek_request(req_obj);
+	offsets = get_request_offsets(request);
+
+	if (num_values) {
+		if (num_values != offsets->len)
+			die_parsing_opts("The number of output values must correspond to the number of lines in the request");
+
+		output_values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+						  num_values);
+
+		for (i = 0; i < num_values; i++) {
+			val = output_value_from_str(remaining[i + 1]);
+			g_array_append_val(output_values, val);
+		}
+	}
+
+	line_cfg_opts.output_values = output_values;
+	line_config = make_line_config(offsets, &line_cfg_opts);
+
+	ret = gpiodbus_request_call_reconfigure_lines_sync(
+						request, line_config,
+						G_DBUS_CALL_FLAGS_NONE,
+						-1, NULL, &err);
+	if (!ret)
+		die_gerror(err, "Failed to reconfigure lines");
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/release.c b/dbus/client/release.c
new file mode 100644
index 0000000..84e364f
--- /dev/null
+++ b/dbus/client/release.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+int gpiocli_release_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Release one of the line requests controlled by the manager.";
+
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GpiodbusObject) obj = NULL;
+	g_autofree gchar *obj_path = NULL;
+	g_auto(GStrv) remaining = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *request_name;
+	GpiodbusRequest *request;
+	gboolean ret;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+			.arg_description	= "<request>",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+
+	if (!remaining || g_strv_length(remaining) != 1)
+		die_parsing_opts("Exactly one request to release must be specified.");
+
+	check_manager();
+
+	request_name = remaining[0];
+
+	obj_path = make_request_obj_path(request_name);
+	manager = get_object_manager_client("/io/gpiod1/requests");
+	obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+							       obj_path));
+	if (!obj)
+		goto no_request;
+
+	request = gpiodbus_object_peek_request(obj);
+	if (!request)
+		goto no_request;
+
+	ret = gpiodbus_request_call_release_sync(request,
+						 G_DBUS_CALL_FLAGS_NONE,
+						 -1, NULL, &err);
+	if (!ret)
+		die_gerror(err, "Failed to release request '%s': %s",
+			   request_name, err->message);
+
+	return EXIT_SUCCESS;
+
+no_request:
+	die("No such request: '%s'", request_name);
+}
diff --git a/dbus/client/request.c b/dbus/client/request.c
new file mode 100644
index 0000000..f12d903
--- /dev/null
+++ b/dbus/client/request.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+typedef struct {
+	LineConfigOpts line_cfg_opts;
+	const gchar *consumer;
+} RequestOpts;
+
+typedef struct {
+	const gchar *request_path;
+	gboolean done;
+} RequestWaitData;
+
+static GVariant *make_request_config(RequestOpts *opts)
+{
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder,
+			g_variant_new("{sv}", "consumer",
+				      g_variant_new_string(opts->consumer)));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+static gboolean on_timeout(gpointer user_data G_GNUC_UNUSED)
+{
+	die("wait for request to appear timed out!");
+}
+
+static void obj_match_request_path(GpiodbusObject *obj, RequestWaitData *data)
+{
+	if (g_strcmp0(g_dbus_object_get_object_path(G_DBUS_OBJECT(obj)),
+		      data->request_path) == 0)
+		data->done = TRUE;
+}
+
+static void match_request_path(gpointer elem, gpointer user_data)
+{
+	RequestWaitData *data = user_data;
+	GpiodbusObject *obj = elem;
+
+	obj_match_request_path(obj, data);
+}
+
+static void on_object_added(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GpiodbusObject *obj, gpointer user_data)
+{
+	RequestWaitData *data = user_data;
+
+	obj_match_request_path(GPIODBUS_OBJECT(obj), data);
+}
+
+static void wait_for_request(const gchar *request_path)
+{
+	RequestWaitData data = { .request_path = request_path };
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autolist(GpiodbusObject) objs = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/requests");
+
+	g_signal_connect(manager, "object-added",
+			 G_CALLBACK(on_object_added), &data);
+
+	objs = g_dbus_object_manager_get_objects(manager);
+	g_list_foreach(objs, match_request_path, &data);
+
+	g_timeout_add(5000, on_timeout, NULL);
+
+	while (!data.done)
+		g_main_context_iteration(NULL, TRUE);
+}
+
+static int
+request_lines(GList *line_names, const gchar *chip_name, RequestOpts *req_opts)
+{
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autofree gchar *request_name = NULL;
+	g_autofree gchar *dyn_name = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodbusLine *line;
+	GpiodbusChip *chip;
+	GString *line_name;
+	guint i, *offset;
+	gboolean ret;
+	GList *pos;
+	gsize llen;
+
+	llen = g_list_length(line_names);
+	offsets = g_array_sized_new(FALSE, TRUE, sizeof(guint), llen);
+	g_array_set_size(offsets, llen);
+
+	if (chip_name)
+		chip_obj = get_chip_obj(chip_name);
+
+	for (i = 0, pos = g_list_first(line_names);
+	     i < llen;
+	     i++, pos = g_list_next(pos)) {
+		g_autoptr(GpiodbusObject) line_obj = NULL;
+
+		line_name = pos->data;
+
+		if (chip_obj) {
+			line_obj = get_line_obj_by_name_for_chip(chip_obj,
+								line_name->str);
+			if (!line_obj) {
+				if (dyn_name) {
+					ret = get_line_obj_by_name(
+							line_name->str,
+							&line_obj, NULL);
+					if (ret)
+						/*
+						 * This means the line exists
+						 * but on a different chip.
+						 */
+						die("all requested lines must belong to the same chip");
+				}
+
+				die("no line '%s' on chip '%s'",
+				    line_name->str, chip_name);
+			}
+		} else {
+			ret = get_line_obj_by_name(line_name->str, &line_obj,
+						   &chip_obj);
+			if (!ret)
+				die("line '%s' not found", line_name->str);
+
+			dyn_name = g_path_get_basename(
+					g_dbus_object_get_object_path(
+						G_DBUS_OBJECT(chip_obj)));
+			chip_name = dyn_name;
+		}
+
+		line = gpiodbus_object_peek_line(line_obj);
+		offset = &g_array_index(offsets, guint, i);
+		*offset = gpiodbus_line_get_offset(line);
+	}
+
+	chip = gpiodbus_object_peek_chip(chip_obj);
+	line_config = make_line_config(offsets, &req_opts->line_cfg_opts);
+	request_config = make_request_config(req_opts);
+
+	ret = gpiodbus_chip_call_request_lines_sync(chip, line_config,
+						    request_config,
+						    G_DBUS_CALL_FLAGS_NONE, -1,
+						    &request_path, NULL, &err);
+	if (err)
+		die_gerror(err, "failed to request lines from chip '%s'",
+			   chip_name);
+
+	wait_for_request(request_path);
+
+	request_name = g_path_get_basename(request_path);
+	g_print("%s\n", request_name);
+
+	return EXIT_SUCCESS;
+}
+
+int gpiocli_request_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Request a set of GPIO lines for exclusive usage by the gpio-manager.";
+
+	g_autoptr(GArray) output_values = NULL;
+	g_autolist(GString) line_names = NULL;
+	const gchar *chip_name = NULL;
+	g_auto(GStrv) lines = NULL;
+	RequestOpts req_opts = {};
+	gsize llen;
+	gint val;
+	guint i;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		=
+"Explicitly specify the chip_name on which to resolve the lines which allows to use raw offsets instead of line names.",
+			.arg_description	= "<chip name>",
+		},
+		{
+			.long_name		= "consumer",
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &req_opts.consumer,
+			.description		= "Consumer string (defaults to program name)",
+			.arg_description	= "<consumer name>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "<line1>[=value1] [line2[=value2]] ...",
+		},
+		LINE_CONFIG_OPTIONS(&req_opts.line_cfg_opts),
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+	validate_line_config_opts(&req_opts.line_cfg_opts);
+
+	if (!lines)
+		die_parsing_opts("At least one line must be specified");
+
+	if (!req_opts.consumer)
+		req_opts.consumer = "gpio-manager";
+
+	for (i = 0, llen = g_strv_length(lines); i < llen; i++) {
+		g_auto(GStrv) tokens = NULL;
+
+		tokens = g_strsplit(lines[i], "=", 2);
+		line_names = g_list_append(line_names, g_string_new(tokens[0]));
+		if (g_strv_length(tokens) == 2) {
+			if (!req_opts.line_cfg_opts.output)
+				die_parsing_opts("Output values can only be set in output mode");
+
+			if (!output_values)
+				output_values = g_array_sized_new(FALSE, TRUE,
+								  sizeof(gint),
+								  llen);
+			val = output_value_from_str(tokens[1]);
+			g_array_append_val(output_values, val);
+		}
+	}
+
+	if (output_values && req_opts.line_cfg_opts.input)
+		die_parsing_opts("cannot set output values in input mode");
+
+	if (output_values &&
+	    (g_list_length(line_names) != output_values->len))
+		die_parsing_opts("if values are set, they must be set for all lines");
+
+	req_opts.line_cfg_opts.output_values = output_values;
+
+	check_manager();
+
+	return request_lines(line_names, chip_name, &req_opts);
+}
diff --git a/dbus/client/requests.c b/dbus/client/requests.c
new file mode 100644
index 0000000..be25823
--- /dev/null
+++ b/dbus/client/requests.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void show_request(gpointer elem, gpointer user_data G_GNUC_UNUSED)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autofree gchar *request_name = NULL;
+	g_autofree gchar *offsets_str = NULL;
+	g_autoptr(GVariant) voffsets = NULL;
+	g_autofree gchar *chip_name = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	GpiodbusObject *obj = elem;
+	GpiodbusRequest *request;
+	GVariantBuilder builder;
+	const gchar *chip_path;
+	gsize i;
+
+	request_name = g_path_get_basename(
+			g_dbus_object_get_object_path(G_DBUS_OBJECT(obj)));
+	request = gpiodbus_object_peek_request(obj);
+	chip_path = gpiodbus_request_get_chip_path(request);
+	manager = get_object_manager_client(chip_path);
+	/* FIXME: Use chip proxy? */
+	chip_name = g_path_get_basename(chip_path);
+
+	offsets = get_request_offsets(request);
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	for (i = 0; i < offsets->len; i++)
+		g_variant_builder_add(&builder, "u",
+				      g_array_index(offsets, guint, i));
+	voffsets = g_variant_ref_sink(g_variant_builder_end(&builder));
+	offsets_str = g_variant_print(voffsets, FALSE);
+
+	g_print("%s (%s) Offsets: %s\n",
+		request_name, chip_name, offsets_str);
+}
+
+int gpiocli_requests_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"List all line requests controlled by the manager.";
+
+	g_autolist(GpiodbusObject) request_objs = NULL;
+	g_auto(GStrv) remaining = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+			.arg_description	= NULL,
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, NULL, &argc, &argv);
+	check_manager();
+
+	if (remaining)
+		die_parsing_opts("command doesn't take additional arguments");
+
+	request_objs = get_request_objs();
+	g_list_foreach(request_objs, show_request, NULL);
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/set.c b/dbus/client/set.c
new file mode 100644
index 0000000..6460dd5
--- /dev/null
+++ b/dbus/client/set.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+static void free_str(gpointer data)
+{
+	GString *str = data;
+
+	g_string_free(str, TRUE);
+}
+
+int gpiocli_set_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Set values of one or more GPIO lines.";
+
+	static const gchar *const description =
+"If -r/--request is specified then all the lines must belong to the same\n"
+"request (and - by extension - the same chip).";
+
+	const gchar *request_name = NULL, *chip_path, *req_path;
+	g_autoptr(GpiodbusObject) chip_obj = NULL;
+	g_autoptr(GpiodbusObject) req_obj = NULL;
+	g_autoptr(GPtrArray) line_names = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	g_auto(GStrv) lines = NULL;
+	GpiodbusRequest *request;
+	GVariantBuilder builder;
+	GpiodbusLine *line;
+	gsize num_lines, i;
+	GString *line_name;
+	gboolean ret;
+	guint offset;
+	gint val;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "request",
+			.short_name		= 'r',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &request_name,
+			.description		= "restrict scope to a particular request",
+			.arg_description	= "<request>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &lines,
+			.arg_description	= "<line1=value1> [line2=value2] ...",
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	if (!lines)
+		die_parsing_opts("at least one line value must be specified");
+
+	num_lines = g_strv_length(lines);
+	line_names = g_ptr_array_new_full(num_lines, free_str);
+	values = g_array_sized_new(FALSE, TRUE, sizeof(gint), num_lines);
+
+	for (i = 0; i < num_lines; i++) {
+		g_auto(GStrv) tokens = NULL;
+
+		tokens = g_strsplit(lines[i], "=", 2);
+		if (g_strv_length(tokens) != 2)
+			die_parsing_opts("line must have a single value assigned");
+
+		g_ptr_array_add(line_names, g_string_new(tokens[0]));
+		val = output_value_from_str(tokens[1]);
+		g_array_append_val(values, val);
+	}
+
+	check_manager();
+
+	if (request_name) {
+		g_autoptr(GVariant) arg_values = NULL;
+		g_autoptr(GArray) offsets = NULL;
+
+		req_obj = get_request_obj(request_name);
+		request = gpiodbus_object_peek_request(req_obj);
+		chip_path = gpiodbus_request_get_chip_path(request);
+		chip_obj = get_chip_obj_by_path(chip_path);
+		offsets = g_array_sized_new(FALSE, TRUE, sizeof(guint),
+					    num_lines);
+
+		for (i = 0; i < num_lines; i++) {
+			g_autoptr(GpiodbusObject) line_obj = NULL;
+
+			line_name = g_ptr_array_index(line_names, i);
+
+			line_obj = get_line_obj_by_name_for_chip(chip_obj,
+								line_name->str);
+			if (!line_obj)
+				die("Line not found: %s\n", line_name->str);
+
+			line = gpiodbus_object_peek_line(line_obj);
+			offset = gpiodbus_line_get_offset(line);
+			g_array_append_val(offsets, offset);
+		}
+
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		for (i = 0; i < num_lines; i++) {
+			g_variant_builder_add(&builder, "{ui}",
+					      g_array_index(offsets, guint, i),
+					      g_array_index(values, gint, i));
+		}
+
+		arg_values = g_variant_ref_sink(
+				g_variant_builder_end(&builder));
+
+		ret = gpiodbus_request_call_set_values_sync(
+							request, arg_values,
+							G_DBUS_CALL_FLAGS_NONE,
+							-1, NULL, &err);
+		if (!ret)
+			die_gerror(err, "Failed to set line values");
+
+		return EXIT_SUCCESS;
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GpiodbusRequest) req_proxy = NULL;
+		g_autoptr(GpiodbusObject) line_obj = NULL;
+		g_autoptr(GVariant) arg_values = NULL;
+
+		line_name = g_ptr_array_index(line_names, i);
+
+		ret = get_line_obj_by_name(line_name->str, &line_obj, NULL);
+		if (!ret)
+			die("Line not found: %s\n", line_name->str);
+
+		line = gpiodbus_object_peek_line(line_obj);
+		req_path = gpiodbus_line_get_request_path(line);
+
+		if (!gpiodbus_line_get_managed(line))
+			die("Line '%s' not managed by gpio-manager, must be requested first",
+			    line_name->str);
+
+		req_proxy = gpiodbus_request_proxy_new_for_bus_sync(
+						G_BUS_TYPE_SYSTEM,
+						G_DBUS_PROXY_FLAGS_NONE,
+						"io.gpiod1", req_path,
+						NULL, &err);
+		if (err)
+			die_gerror(err, "Failed to get D-Bus proxy for '%s'",
+				   req_path);
+
+		offset = gpiodbus_line_get_offset(line);
+
+		g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+		g_variant_builder_add(&builder, "{ui}", offset,
+				      g_array_index(values, gint, i));
+		arg_values = g_variant_ref_sink(
+				g_variant_builder_end(&builder));
+
+		ret = gpiodbus_request_call_set_values_sync(
+						req_proxy, arg_values,
+						G_DBUS_CALL_FLAGS_NONE, -1,
+						NULL, &err);
+		if (!ret)
+			die_gerror(err, "Failed to set line values");
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/client/wait.c b/dbus/client/wait.c
new file mode 100644
index 0000000..d65c4e7
--- /dev/null
+++ b/dbus/client/wait.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <stdlib.h>
+
+#include "common.h"
+
+typedef struct {
+	gboolean name_done;
+	gboolean chip_done;
+	const gchar *label;
+} WaitData;
+
+static void obj_match_label(GpiodbusObject *chip_obj, WaitData *data)
+{
+	GpiodbusChip *chip = gpiodbus_object_peek_chip(chip_obj);
+
+	if (g_strcmp0(gpiodbus_chip_get_label(chip), data->label) == 0)
+		data->chip_done = TRUE;
+}
+
+static void check_label(gpointer elem, gpointer user_data)
+{
+	WaitData *data = user_data;
+	GpiodbusObject *obj = elem;
+
+	obj_match_label(obj, data);
+}
+
+static void on_object_added(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GpiodbusObject *obj, gpointer user_data)
+{
+	WaitData *data = user_data;
+
+	obj_match_label(GPIODBUS_OBJECT(obj), data);
+}
+
+static void wait_for_chip(WaitData *data)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autolist(GpiodbusObject) objs = NULL;
+
+	manager = get_object_manager_client("/io/gpiod1/chips");
+
+	g_signal_connect(manager, "object-added",
+			 G_CALLBACK(on_object_added), data);
+
+	objs = g_dbus_object_manager_get_objects(manager);
+	g_list_foreach(objs, check_label, data);
+
+	while (!data->chip_done)
+		g_main_context_iteration(NULL, TRUE);
+}
+
+static void on_name_appeared(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name G_GNUC_UNUSED,
+			     const gchar *name_owner G_GNUC_UNUSED,
+			     gpointer user_data)
+{
+	WaitData *data = user_data;
+
+	data->name_done = TRUE;
+}
+
+static void on_name_vanished(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name G_GNUC_UNUSED,
+			     gpointer user_data)
+{
+	WaitData *data = user_data;
+
+	if (data->label && data->chip_done)
+		die("gpio-manager vanished while waiting for chip");
+}
+
+static gboolean on_timeout(gpointer user_data G_GNUC_UNUSED)
+{
+	die("wait timed out!");
+}
+
+static guint schedule_timeout(const gchar *timeout)
+{
+	gint64 period, multiplier = 0;
+	gchar *end;
+
+	period = g_ascii_strtoll(timeout, &end, 10);
+
+	switch (*end) {
+	case 'm':
+		multiplier = 1;
+		end++;
+		break;
+	case 's':
+		multiplier = 1000;
+		break;
+	case '\0':
+		break;
+	default:
+		goto invalid_timeout;
+	}
+
+	if (multiplier) {
+		if (*end != 's')
+			goto invalid_timeout;
+
+		end++;
+	} else {
+		/* Default to miliseconds. */
+		multiplier = 1;
+	}
+
+	period *= multiplier;
+	if (period > G_MAXUINT)
+		die("timeout must not exceed %u miliseconds\n", G_MAXUINT);
+
+	return g_timeout_add(period, on_timeout, NULL);
+			
+invalid_timeout:
+	die("invalid timeout value: %s", timeout);
+}
+
+int gpiocli_wait_main(int argc, char **argv)
+{
+	static const gchar *const summary =
+"Wait for the gpio-manager interface to appear.";
+
+	static const gchar *const description =
+"Timeout period defaults to miliseconds but can be given in seconds or miliseconds\n"
+"explicitly .e.g: --timeout=1000, --timeout=1000ms and --timeout=1s all specify\n"
+"the same period.";
+
+	const gchar *timeout_str = NULL;
+	guint watch_id, timeout_id = 0;
+	g_auto(GStrv) remaining = NULL;
+	WaitData data = {};
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &data.label,
+			.description		= "Wait for a specific chip to appear.",
+			.arg_description	= "<label>",
+		},
+		{
+			.long_name		= "timeout",
+			.short_name		= 't',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &timeout_str,
+			.description		= "Bail-out if timeout expires.",
+			.arg_description	= "<timeout_str>",
+		},
+		{
+			.long_name		= G_OPTION_REMAINING,
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING_ARRAY,
+			.arg_data		= &remaining,
+		},
+		{ }
+	};
+
+	parse_options(opts, summary, description, &argc, &argv);
+
+	if (remaining)
+		die_parsing_opts("command doesn't take additional arguments");
+
+	watch_id = g_bus_watch_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				    G_BUS_NAME_WATCHER_FLAGS_NONE,
+				    on_name_appeared, on_name_vanished,
+				    &data, NULL);
+
+	if (timeout_str)
+		timeout_id = schedule_timeout(timeout_str);
+
+	while (!data.name_done)
+		g_main_context_iteration(NULL, TRUE);
+
+	if (data.label)
+		wait_for_chip(&data);
+
+	g_bus_unwatch_name(watch_id);
+	if (timeout_str)
+		g_source_remove(timeout_id);
+
+	return EXIT_SUCCESS;
+}

-- 
2.43.0


