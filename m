Return-Path: <linux-gpio+bounces-5426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DED8A2E3B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 122421C22732
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FD056B70;
	Fri, 12 Apr 2024 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uRLx7Jp2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6856750
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924914; cv=none; b=O+xeJyy9vxpEqGcXA/bmHjMgpDbol7yvRvUbk+8HZEgwmWWZ7mtSPviET+dussxSH5qBu6mUsXk2UaNCRKG3VLNexkrTQ9N2ka5csMC1GVy4UxSKcYsNu/3ax0Kn70mQJ/kx12weDfSIwbYYmeY/tmD9xnk0uQR7kXRzQnVEjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924914; c=relaxed/simple;
	bh=xgyn4AWcCXWjMY948V6sWC7oiHY3twuQyLv27ke8NHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kj5kgw60oJggcUETOui52fPTZLbc7GHfQ4Ak9hBqerES9IP/aJGXELZO8d+NPoEZI9ITnzQCAZ5iQ3vVJGJu39UQl/qICHlIJB+YnKx//lT49ddw+Anv9F4CPLs3PQpC3g442qXS6O5YrLt1BoCoiGWPA/CrC+WHiNGRNHTae1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uRLx7Jp2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4180e794745so1350245e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924909; x=1713529709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORUV6TPhx8uhfw2evsk48zUbEPRW+cCaAGV2XxxF+cA=;
        b=uRLx7Jp2Kt0ZPu/cviMcS6ZgvqGjVY62gu2W8l9OKSBUfbkBmDpKZRqQHqIPAUm9kT
         o4wVrTFAd/YG2fznC/WXx84DNWJb9vebndbMWgrABBYkD07C0fv7pp88pZvsbPFL/8Xx
         6FUA79KEorWAHubpg/iUmTdKEsRnwr+8sPVcNWhv+7Lsc5iIicMJfW9bsLE98JYz37Jx
         twk4zcwot+VHBZQxq5xNMxjOjzbCEzMo2Keq7BNhmG7VDdbFYB5qU2dEXRxfWBbAd06V
         vLM/0YPmh6Xq3fS4YApdeRClWBBmEaMpacBgljCZkLdRQ+udda/SePJ6+8+/EVtLAI4t
         gKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924909; x=1713529709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORUV6TPhx8uhfw2evsk48zUbEPRW+cCaAGV2XxxF+cA=;
        b=H6aHercfBS9RlGB4HgnGH05T7tMJ4FAiJYVovCb3r4hcDJSRHJ34Yua/woZ4EmTFX2
         y6Rfnv9H8cHOhYC73z2dtNYAXAdU305YkaeZcZtyvSR0qP3ARnrJqgBnkz8LghtHbeKi
         w4Ul3bYI+tL5xf3nq6kZZiCrU0VexlnQbxhm2HH59qWFihPQWVOt1FRWeXChKdA8WwXe
         5deh7yUpMuCbN21yOFrfGkRiVzd4VRDgqW+9RbEHsoTvenRqju8IiyFcWMAKpFULSk0c
         bxExJTXOISgdMzCdZQgz865tqSySn9OfBtJURgayc+40/893BSLdgfAzfQfsHhSTabKB
         +Efg==
X-Gm-Message-State: AOJu0Yz5CHctH1kyyfEydRSDmoga6c8SR/fWArwD08PwbU8pram0xjXO
	kdiSmAShTG6Va+L5HYsRYrNih5G9aDF6NHXUGrz93/0eMJT3fJVl6/nrlUeVbtA=
X-Google-Smtp-Source: AGHT+IGq8H4Jp2dpazMmWVFJdTlFCwOB0oAdfjjj/2EosB4T952ZeFZ7XzVQGYhm3kpkgjhJITHrsg==
X-Received: by 2002:a7b:c355:0:b0:414:bfd:379d with SMTP id l21-20020a7bc355000000b004140bfd379dmr1863006wmj.22.1712924908969;
        Fri, 12 Apr 2024 05:28:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 14/18] dbus: add tests
Date: Fri, 12 Apr 2024 14:28:00 +0200
Message-Id: <20240412122804.109323-15-brgl@bgdev.pl>
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

Add a set of test-cases verifying the functionality of the gpio-manager
daemon.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/tests/daemon-process.c | 129 ++++++++++++++++++++++
 dbus/tests/daemon-process.h |  20 ++++
 dbus/tests/helpers.c        | 107 ++++++++++++++++++
 dbus/tests/helpers.h        | 112 +++++++++++++++++++
 dbus/tests/tests-chip.c     | 133 ++++++++++++++++++++++
 dbus/tests/tests-line.c     | 213 ++++++++++++++++++++++++++++++++++++
 dbus/tests/tests-request.c  | 116 ++++++++++++++++++++
 7 files changed, 830 insertions(+)
 create mode 100644 dbus/tests/daemon-process.c
 create mode 100644 dbus/tests/daemon-process.h
 create mode 100644 dbus/tests/helpers.c
 create mode 100644 dbus/tests/helpers.h
 create mode 100644 dbus/tests/tests-chip.c
 create mode 100644 dbus/tests/tests-line.c
 create mode 100644 dbus/tests/tests-request.c

diff --git a/dbus/tests/daemon-process.c b/dbus/tests/daemon-process.c
new file mode 100644
index 0000000..9eec71b
--- /dev/null
+++ b/dbus/tests/daemon-process.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <signal.h>
+
+#include "daemon-process.h"
+
+struct _GPIODBusDaemonProcess {
+	GObject parent_instance;
+	GSubprocess *proc;
+};
+
+G_DEFINE_TYPE(GPIODBusDaemonProcess, gpiodbus_daemon_process, G_TYPE_OBJECT);
+
+static gboolean on_timeout(gpointer data G_GNUC_UNUSED)
+{
+	g_error("timeout reached waiting for the daemon name to appear on the system bus");
+
+	return G_SOURCE_REMOVE;
+}
+
+static void on_name_appeared(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name G_GNUC_UNUSED,
+			     const gchar *name_owner G_GNUC_UNUSED,
+			     gpointer data)
+{
+	gboolean *name_state = data;
+
+	*name_state = TRUE;
+}
+
+static void gpiodbus_daemon_process_constructed(GObject *obj)
+{
+	GPIODBusDaemonProcess *self = GPIODBUS_DAEMON_PROCESS_OBJ(obj);
+	const gchar *path = g_getenv("GPIODBUS_TEST_DAEMON_PATH");
+	g_autoptr(GDBusConnection) con = NULL;
+	g_autofree gchar *addr = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean name_state = FALSE;
+	guint watch_id, timeout_id;
+
+	if (!path)
+		g_error("GPIODBUS_TEST_DAEMON_PATH environment variable must be set");
+
+	addr = g_dbus_address_get_for_bus_sync(G_BUS_TYPE_SYSTEM, NULL, &err);
+	if (!addr)
+		g_error("failed to get an address for system bus: %s",
+			err->message);
+
+	con = g_dbus_connection_new_for_address_sync(addr,
+			G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+			G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+			NULL, NULL, &err);
+	if (!con)
+		g_error("failed to get a dbus connection: %s", err->message);
+
+	watch_id = g_bus_watch_name_on_connection(con, "io.gpiod1",
+						  G_BUS_NAME_WATCHER_FLAGS_NONE,
+						  on_name_appeared, NULL,
+						  &name_state, NULL);
+
+	self->proc = g_subprocess_new(G_SUBPROCESS_FLAGS_STDOUT_SILENCE |
+				      G_SUBPROCESS_FLAGS_STDERR_SILENCE,
+				      &err, path, NULL);
+	if (!self->proc)
+		g_error("failed to launch the gpio-manager process: %s",
+			err->message);
+
+	timeout_id = g_timeout_add_seconds(5, on_timeout, NULL);
+
+	while (!name_state)
+		g_main_context_iteration(NULL, TRUE);
+
+	g_bus_unwatch_name(watch_id);
+	g_source_remove(timeout_id);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_process_parent_class)->constructed(obj);
+}
+
+static void gpiodbus_daemon_process_kill(GSubprocess *proc)
+{
+	g_autoptr(GError) err = NULL;
+	gint status;
+
+	g_subprocess_send_signal(proc, SIGTERM);
+	g_subprocess_wait(proc, NULL, &err);
+	if (err)
+		g_error("failed to collect the exit status of gpio-manager: %s",
+			err->message);
+
+	if (!g_subprocess_get_if_exited(proc))
+		g_error("dbus-manager process did not exit normally");
+
+	status = g_subprocess_get_exit_status(proc);
+	if (status != 0)
+		g_error("dbus-manager process exited with a non-zero status: %d",
+			status);
+
+	g_object_unref(proc);
+}
+
+static void gpiodbus_daemon_process_dispose(GObject *obj)
+{
+	GPIODBusDaemonProcess *self = GPIODBUS_DAEMON_PROCESS_OBJ(obj);
+
+	g_clear_pointer(&self->proc, gpiodbus_daemon_process_kill);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_process_parent_class)->dispose(obj);
+}
+
+static void
+gpiodbus_daemon_process_class_init(GPIODBusDaemonProcessClass *proc_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(proc_class);
+
+	class->constructed = gpiodbus_daemon_process_constructed;
+	class->dispose = gpiodbus_daemon_process_dispose;
+}
+
+static void gpiodbus_daemon_process_init(GPIODBusDaemonProcess *self)
+{
+	self->proc = NULL;
+}
+
+GPIODBusDaemonProcess *gpiodbus_daemon_process_new(void)
+{
+	return g_object_new(GPIODBUS_DAEMON_PROCESS_TYPE, NULL);
+}
diff --git a/dbus/tests/daemon-process.h b/dbus/tests/daemon-process.h
new file mode 100644
index 0000000..24d22a8
--- /dev/null
+++ b/dbus/tests/daemon-process.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_TEST_DAEMON_PROCESS_H__
+#define __GPIODBUS_TEST_DAEMON_PROCESS_H__
+
+#include <glib.h>
+
+G_DECLARE_FINAL_TYPE(GPIODBusDaemonProcess, gpiodbus_daemon_process,
+		     GPIODBUS, DAEMON_PROCESS, GObject);
+
+#define GPIODBUS_DAEMON_PROCESS_TYPE (gpiodbus_daemon_process_get_type())
+#define GPIODBUS_DAEMON_PROCESS_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST(obj, \
+	 GPIODBUS_DAEMON_PROCESS_TYPE, \
+	 GPIODBusDaemonProcess))
+
+GPIODBusDaemonProcess *gpiodbus_daemon_process_new(void);
+
+#endif /* __GPIODBUS_TEST_DAEMON_PROCESS_H__ */
diff --git a/dbus/tests/helpers.c b/dbus/tests/helpers.c
new file mode 100644
index 0000000..c2f5142
--- /dev/null
+++ b/dbus/tests/helpers.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "helpers.h"
+
+GDBusConnection *gpiodbus_test_get_dbus_connection(void)
+{
+	g_autoptr(GDBusConnection) con = NULL;
+	g_autofree gchar *addr = NULL;
+	g_autoptr(GError) err = NULL;
+
+	addr = g_dbus_address_get_for_bus_sync(G_BUS_TYPE_SYSTEM, NULL, &err);
+	if (!addr)
+		g_error("Failed to get address on the bus: %s", err->message);
+
+	con = g_dbus_connection_new_for_address_sync(addr,
+		G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+		G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+		NULL, NULL, &err);
+	if (!con)
+		g_error("Failed to get system bus connection: %s",
+			err->message);
+
+	return g_object_ref(con);
+}
+
+typedef struct {
+	gboolean *added;
+	gchar *obj_path;
+} OnObjectAddedData;
+
+static void on_object_added(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GPIODBusObject *object, gpointer data)
+{
+	OnObjectAddedData *cb_data = data;
+	const gchar *path;
+
+	path = g_dbus_object_get_object_path(G_DBUS_OBJECT(object));
+
+	if (g_strcmp0(path, cb_data->obj_path) == 0)
+		*cb_data->added = TRUE;
+}
+
+static gboolean on_timeout(gpointer data G_GNUC_UNUSED)
+{
+	g_error("timeout reached waiting for the gpiochip interface to appear on the bus");
+
+	return G_SOURCE_REMOVE;
+}
+
+void gpiodbus_test_wait_for_sim_intf(GPIOSimChip *sim)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GDBusConnection) con = NULL;
+	g_autoptr(GPIODBusObject) obj = NULL;
+	g_autoptr(GError) err = NULL;
+	g_autofree gchar *obj_path;
+	OnObjectAddedData cb_data;
+	gboolean added = FALSE;
+	guint timeout_id;
+
+	con = gpiodbus_test_get_dbus_connection();
+	if (!con)
+		g_error("failed to obtain a bus connection: %s", err->message);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+
+	cb_data.added = &added;
+	cb_data.obj_path = obj_path;
+
+	manager = gpiodbus_object_manager_client_new_sync(con,
+				G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE,
+				"io.gpiod1", "/io/gpiod1/chips", NULL, &err);
+	if (!manager)
+		g_error("failed to create the object manager client: %s",
+			err->message);
+
+	g_signal_connect(manager, "object-added", G_CALLBACK(on_object_added),
+			 &cb_data);
+
+	obj = GPIODBUS_OBJECT(g_dbus_object_manager_get_object(manager,
+							       obj_path));
+	if (obj) {
+		if (g_strcmp0(g_dbus_object_get_object_path(G_DBUS_OBJECT(obj)),
+			      obj_path) == 0)
+			added = TRUE;
+	}
+
+	timeout_id = g_timeout_add_seconds(5, on_timeout, NULL);
+
+	while (!added)
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+}
+
+GVariant *gpiodbus_test_make_empty_request_config(void)
+{
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE("a{sv}"));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
diff --git a/dbus/tests/helpers.h b/dbus/tests/helpers.h
new file mode 100644
index 0000000..6f789dd
--- /dev/null
+++ b/dbus/tests/helpers.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_TEST_INTERNAL_H__
+#define __GPIODBUS_TEST_INTERNAL_H__
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#define __gpiodbus_test_check_gboolean_and_error(_ret, _err) \
+	do { \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define __gpiodbus_test_check_nonnull_and_error(_ptr, _err) \
+	do { \
+		g_assert_nonnull(_ptr); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodbus_test_get_chip_proxy_or_fail(_obj_path) \
+	({ \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		g_autoptr(GPIODBusChip) _chip = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_chip = gpiodbus_chip_proxy_new_sync(_con, \
+						     G_DBUS_PROXY_FLAGS_NONE, \
+						     "io.gpiod1", _obj_path, \
+						     NULL, &_err); \
+		__gpiodbus_test_check_nonnull_and_error(_chip, _err); \
+		g_object_ref(_chip); \
+	})
+
+#define gpiodbus_test_get_line_proxy_or_fail(_obj_path) \
+	({ \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		g_autoptr(GPIODBusLine) _line = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_line = gpiodbus_line_proxy_new_sync(_con, \
+						     G_DBUS_PROXY_FLAGS_NONE, \
+						     "io.gpiod1", _obj_path, \
+						     NULL, &_err); \
+		__gpiodbus_test_check_nonnull_and_error(_line, _err); \
+		g_object_ref(_line); \
+	})
+
+#define gpiodbus_test_get_request_proxy_or_fail(_obj_path) \
+	({ \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		g_autoptr(GPIODBusRequest) _req = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_req = gpiodbus_request_proxy_new_sync(_con, \
+						G_DBUS_PROXY_FLAGS_NONE, \
+						"io.gpiod1", _obj_path, \
+						NULL, &_err); \
+		__gpiodbus_test_check_nonnull_and_error(_req, _err); \
+		g_object_ref(_req); \
+	})
+
+#define gpiodbus_test_get_chip_object_manager_or_fail() \
+	({ \
+		g_autoptr(GDBusObjectManager) _manager = NULL; \
+		g_autoptr(GDBusConnection) _con = NULL; \
+		g_autoptr(GError) _err = NULL; \
+		_con = gpiodbus_test_get_dbus_connection(); \
+		_manager = gpiodbus_object_manager_client_new_sync( \
+				_con, \
+				G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE, \
+				"io.gpiod1", "/io/gpiod1/chips", NULL, \
+				&_err); \
+		__gpiodbus_test_check_nonnull_and_error(_manager, _err); \
+		g_object_ref(_manager); \
+	})
+
+#define gpiodbus_test_chip_call_request_lines_sync_or_fail(_chip, \
+							   _line_config, \
+							   _request_config, \
+							   _request_path) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret; \
+		_ret = gpiodbus_chip_call_request_lines_sync(_chip, \
+							     _line_config, \
+							     _request_config, \
+							     _request_path, \
+							     NULL, &_err); \
+		__gpiodbus_test_check_gboolean_and_error(_ret, _err); \
+	} while (0)
+
+#define gpiodbus_test_request_call_release_sync_or_fail(_request) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret; \
+		_ret = gpiodbus_request_call_release_sync(_request, NULL, \
+							  &_err); \
+		__gpiodbus_test_check_gboolean_and_error(_ret, _err); \
+	} while (0)
+
+GDBusConnection *gpiodbus_test_get_dbus_connection(void);
+void gpiodbus_test_wait_for_sim_intf(GPIOSimChip *sim);
+GVariant *gpiodbus_test_make_empty_request_config(void);
+
+#endif /* __GPIODBUS_TEST_INTERNAL_H__ */
+
diff --git a/dbus/tests/tests-chip.c b/dbus/tests/tests-chip.c
new file mode 100644
index 0000000..c01b2f5
--- /dev/null
+++ b/dbus/tests/tests-chip.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#include "daemon-process.h"
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "gpiodbus/chip"
+
+GPIOD_TEST_CASE(read_chip_info)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"label", "foobar",
+							NULL);
+	g_autoptr(GPIODBusDaemonProcess) mgr = NULL;
+	g_autoptr(GPIODBusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+
+	g_assert_cmpstr(gpiodbus_chip_get_name(chip), ==,
+			g_gpiosim_chip_get_name(sim));
+	g_assert_cmpstr(gpiodbus_chip_get_label(chip), ==, "foobar");
+	g_assert_cmpuint(gpiodbus_chip_get_num_lines(chip), ==, 8);
+	g_assert_cmpstr(gpiodbus_chip_get_path(chip), ==,
+			g_gpiosim_chip_get_dev_path(sim));
+}
+
+static gboolean on_timeout(gpointer user_data)
+{
+	gboolean *timed_out = user_data;
+
+	*timed_out = TRUE;
+
+	return G_SOURCE_REMOVE;
+}
+
+static void on_object_event(GDBusObjectManager *manager G_GNUC_UNUSED,
+			    GPIODBusObject *object, gpointer user_data)
+{
+	gchar **obj_path = user_data;
+
+	*obj_path = g_strdup(g_dbus_object_get_object_path(
+						G_DBUS_OBJECT(object)));
+}
+
+GPIOD_TEST_CASE(chip_added)
+{
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GPIODBusDaemonProcess) mgr = NULL;
+	g_autofree gchar *sim_obj_path = NULL;
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autofree gchar *obj_path = NULL;
+	gboolean timed_out = FALSE;
+	guint timeout_id;
+
+	mgr = gpiodbus_daemon_process_new();
+
+	manager = gpiodbus_test_get_chip_object_manager_or_fail();
+
+	g_signal_connect(manager, "object-added", G_CALLBACK(on_object_event),
+			 &obj_path);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &timed_out);
+
+	sim = g_gpiosim_chip_new(NULL);
+
+	while (!obj_path && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	if (timed_out) {
+		g_test_fail_printf("timeout reached waiting for chip to be added");
+		return;
+	}
+
+	sim_obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				       g_gpiosim_chip_get_name(sim));
+
+	g_assert_cmpstr(sim_obj_path, ==, obj_path);
+
+	g_source_remove(timeout_id);
+}
+
+GPIOD_TEST_CASE(chip_removed)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GDBusObjectManager) manager = NULL;
+	g_autoptr(GPIODBusDaemonProcess) mgr = NULL;
+	g_autofree gchar *sim_obj_path = NULL;
+	g_autoptr(GPIODBusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+	gboolean timed_out = FALSE;
+	guint timeout_id;
+
+	sim_obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				       g_gpiosim_chip_get_name(sim));
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+	manager = gpiodbus_test_get_chip_object_manager_or_fail();
+
+	g_signal_connect(manager, "object-removed", G_CALLBACK(on_object_event),
+			 &obj_path);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &timed_out);
+
+	g_clear_object(&sim);
+
+	while (!obj_path && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	if (timed_out) {
+		g_test_fail_printf("timeout reached waiting for chip to be removed");
+		return;
+	}
+
+	g_assert_cmpstr(sim_obj_path, ==, obj_path);
+
+	g_source_remove(timeout_id);
+}
diff --git a/dbus/tests/tests-line.c b/dbus/tests/tests-line.c
new file mode 100644
index 0000000..b9c46fd
--- /dev/null
+++ b/dbus/tests/tests-line.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#include "daemon-process.h"
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "gpiodbus/line"
+
+GPIOD_TEST_CASE(read_line_properties)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	static const GPIOSimHog hogs[] = {
+		{
+			.offset = 3,
+			.name = "hog3",
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_HIGH,
+		},
+		{
+			.offset = 4,
+			.name = "hog4",
+			.direction = G_GPIOSIM_DIRECTION_OUTPUT_LOW,
+		},
+		{ }
+	};
+
+	g_autoptr(GPIODBusDaemonProcess) mgr = NULL;
+	g_autoptr(GPIODBusLine) line4 = NULL;
+	g_autoptr(GPIODBusLine) line6 = NULL;
+	g_autofree gchar *obj_path_4 = NULL;
+	g_autofree gchar *obj_path_6 = NULL;
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GVariant) vhogs = g_gpiosim_package_hogs(hogs);
+
+	sim = g_gpiosim_chip_new(
+			"num-lines", 8,
+			"line-names", vnames,
+			"hogs", vhogs,
+			NULL);
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path_4 = g_strdup_printf("/io/gpiod1/chips/%s/line4",
+				     g_gpiosim_chip_get_name(sim));
+	line4 = gpiodbus_test_get_line_proxy_or_fail(obj_path_4);
+
+	obj_path_6 = g_strdup_printf("/io/gpiod1/chips/%s/line6",
+				     g_gpiosim_chip_get_name(sim));
+	line6 = gpiodbus_test_get_line_proxy_or_fail(obj_path_6);
+
+	g_assert_cmpuint(gpiodbus_line_get_offset(line4), ==, 4);
+	g_assert_cmpstr(gpiodbus_line_get_name(line4), ==, "baz");
+	g_assert_cmpstr(gpiodbus_line_get_consumer(line4), ==, "hog4");
+	g_assert_true(gpiodbus_line_get_used(line4));
+	g_assert_false(gpiodbus_line_get_managed(line4));
+	g_assert_cmpstr(gpiodbus_line_get_direction(line4), ==, "output");
+	g_assert_cmpstr(gpiodbus_line_get_edge_detection(line4), ==, "none");
+	g_assert_false(gpiodbus_line_get_active_low(line4));
+	g_assert_cmpstr(gpiodbus_line_get_bias(line4), ==, "unknown");
+	g_assert_cmpstr(gpiodbus_line_get_drive(line4), ==, "push-pull");
+	g_assert_cmpstr(gpiodbus_line_get_event_clock(line4), ==, "monotonic");
+	g_assert_false(gpiodbus_line_get_debounced(line4));
+	g_assert_cmpuint(gpiodbus_line_get_debounce_period_us(line4), ==, 0);
+
+	g_assert_cmpuint(gpiodbus_line_get_offset(line6), ==, 6);
+	g_assert_cmpstr(gpiodbus_line_get_name(line6), ==, "");
+	g_assert_cmpstr(gpiodbus_line_get_consumer(line6), ==, "");
+	g_assert_false(gpiodbus_line_get_used(line6));
+}
+
+static gboolean on_timeout(gpointer user_data)
+{
+	gboolean *timed_out = user_data;
+
+	*timed_out = TRUE;
+
+	return G_SOURCE_REMOVE;
+}
+
+static void
+on_properties_changed(GPIODBusLine *line G_GNUC_UNUSED,
+		      GVariant *changed_properties,
+		      GStrv invalidated_properties G_GNUC_UNUSED,
+		      gpointer user_data)
+{
+	guint *done = user_data;
+	GVariantDict dict;
+
+	g_variant_dict_init(&dict, changed_properties);
+
+	if (*done == 0) {
+		if (!g_variant_dict_contains(&dict, "Direction") ||
+		    !g_variant_dict_contains(&dict, "Consumer") ||
+		    !g_variant_dict_contains(&dict, "Used") ||
+		    !g_variant_dict_contains(&dict, "RequestObject") ||
+		    !g_variant_dict_contains(&dict, "Managed"))
+			g_test_fail_printf("Not all expected properties have changed");
+		*done = 1;
+	} else {
+		if (!g_variant_dict_contains(&dict, "Consumer") ||
+		    !g_variant_dict_contains(&dict, "Used") ||
+		    !g_variant_dict_contains(&dict, "RequestObject") ||
+		    !g_variant_dict_contains(&dict, "Managed"))
+			g_test_fail_printf("Not all expected properties have changed");
+		*done = 2;
+	}
+}
+
+static GVariant *make_props_changed_line_config(void)
+{
+	g_autoptr(GVariant) output_values = NULL;
+	g_autoptr(GVariant) line_settings = NULL;
+	g_autoptr(GVariant) line_offsets = NULL;
+	g_autoptr(GVariant) line_configs = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(4));
+	line_offsets = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder,
+				g_variant_new("{sv}", "direction",
+					      g_variant_new_string("output")));
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
+	output_values = g_variant_new("ai", NULL);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_configs));
+	g_variant_builder_add_value(&builder, g_variant_ref(output_values));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+GPIOD_TEST_CASE(properties_changed)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODBusDaemonProcess) mgr = NULL;
+	g_autoptr(GPIODBusRequest) request = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *line_obj_path = NULL;
+	g_autofree gchar *chip_obj_path = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autoptr(GPIODBusChip) chip = NULL;
+	g_autoptr(GPIODBusLine) line = NULL;
+	gboolean timed_out = FALSE;
+	guint timeout_id, done = 0;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	line_obj_path = g_strdup_printf("/io/gpiod1/chips/%s/line4",
+					g_gpiosim_chip_get_name(sim));
+	line = gpiodbus_test_get_line_proxy_or_fail(line_obj_path);
+
+	chip_obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+					g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(chip_obj_path);
+
+	g_signal_connect(line, "g-properties-changed",
+			 G_CALLBACK(on_properties_changed), &done);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &timed_out);
+
+	line_config = make_props_changed_line_config();
+	request_config = gpiodbus_test_make_empty_request_config();
+
+	gpiodbus_test_chip_call_request_lines_sync_or_fail(chip, line_config,
+							   request_config,
+							   &request_path);
+
+	while (done != 1 && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	request = gpiodbus_test_get_request_proxy_or_fail(request_path);
+	gpiodbus_test_request_call_release_sync_or_fail(request);
+
+	while (done != 2 && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	if (timed_out) {
+		g_test_fail_printf("timeout reached waiting for line properties to change");
+		return;
+	}
+
+	g_source_remove(timeout_id);
+}
diff --git a/dbus/tests/tests-request.c b/dbus/tests/tests-request.c
new file mode 100644
index 0000000..1af31fe
--- /dev/null
+++ b/dbus/tests/tests-request.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiodbus.h>
+#include <gpiosim-glib.h>
+
+#include "daemon-process.h"
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "gpiodbus/request"
+
+static GVariant *make_empty_request_config(void)
+{
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE("a{sv}"));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+static GVariant *make_input_lines_line_config(void)
+{
+	g_autoptr(GVariant) output_values = NULL;
+	g_autoptr(GVariant) line_settings = NULL;
+	g_autoptr(GVariant) line_offsets = NULL;
+	g_autoptr(GVariant) line_configs = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	GVariantBuilder builder;
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(3));
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(5));
+	g_variant_builder_add_value(&builder, g_variant_new_uint32(7));
+	line_offsets = g_variant_builder_end(&builder);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	g_variant_builder_add_value(&builder,
+				g_variant_new("{sv}", "direction",
+					      g_variant_new_string("input")));
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
+	output_values = g_variant_new("ai", NULL);
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, g_variant_ref(line_configs));
+	g_variant_builder_add_value(&builder, g_variant_ref(output_values));
+
+	return g_variant_ref_sink(g_variant_builder_end(&builder));
+}
+
+GPIOD_TEST_CASE(request_input_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODBusDaemonProcess) mgr = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autoptr(GPIODBusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+
+	line_config = make_input_lines_line_config();
+	request_config = make_empty_request_config();
+
+	gpiodbus_test_chip_call_request_lines_sync_or_fail(chip, line_config,
+							   request_config,
+							   &request_path);
+}
+
+GPIOD_TEST_CASE(release_request)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODBusDaemonProcess) mgr = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GPIODBusRequest) request = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autoptr(GPIODBusChip) chip = NULL;
+	g_autofree gchar *obj_path = NULL;
+
+	mgr = gpiodbus_daemon_process_new();
+	gpiodbus_test_wait_for_sim_intf(sim);
+
+	obj_path = g_strdup_printf("/io/gpiod1/chips/%s",
+				   g_gpiosim_chip_get_name(sim));
+	chip = gpiodbus_test_get_chip_proxy_or_fail(obj_path);
+
+	line_config = make_input_lines_line_config();
+	request_config = make_empty_request_config();
+
+	gpiodbus_test_chip_call_request_lines_sync_or_fail(chip, line_config,
+							   request_config,
+							   &request_path);
+
+	request = gpiodbus_test_get_request_proxy_or_fail(request_path);
+	gpiodbus_test_request_call_release_sync_or_fail(request);
+}
-- 
2.40.1


