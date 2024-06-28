Return-Path: <linux-gpio+bounces-7823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBDE91C63D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEB451F24D87
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F1E5B69E;
	Fri, 28 Jun 2024 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H1T6n+hW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1617655E58
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601158; cv=none; b=mRHOoB35fKulCGE1szvqpytN2/seD1p7UkLF6odEe5e1PEqK9uAWmfXySnqZ2Vb36UkopEwAAb/A9ruPdQYN7RJ7mx2WduySA5CU4k6KbHp7KlJ0kGavh0Ldx7F1DqWjEHWXp2cCoBpSPmmMm+swKlvXBae7xjeSSE33mQJoBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601158; c=relaxed/simple;
	bh=M/nxP1APEaOQdL1Fp1K6cdVWiGbW9uHGM+i0lqffMDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PU/DSZCemz7G560c07nL62q2DuLEKcKlPlo7dDHLfvrkNDDAn4X28A0Jf93+FhhO0b5yWGdLmOSWNBpEnmu5hbhSXT61OnjsixRDonTNctfFcBVW/J8XnAGhra1tOi7bGOuW0QgCzQfvhnXxvmVKsjQnZJuQBb8krnh3v9pXOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H1T6n+hW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3674e1931b7so699043f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601154; x=1720205954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2eBDW364M8zAI7+85aEbywY4CV9ymJQrKq8441onCI=;
        b=H1T6n+hWPA27HIMLbqPyXvxjTBYH/EZqITJkfrBJ5agCheHcdjVZvOH86vQwUoC5E/
         ldsXBcV//RX8LqLdUOWBTEXiEwllknbMnvi2cxHpVyeVyfdRXNNXF5gYt+jKswxgJe4S
         SMtKNe9+BvBDiSQ8UF/gzclBGn3czbTnq3xN5CHgGXt8S+UYlrc41VWMIfE3NsVpQ4/Q
         QzVDylgYYOG/OdJm/Om85c3noc0f+Ph9PLq7CubYlhVnlsbGYeb5CmVi3XM2rIpPjEzb
         eCws73UImY72kY6e/tcWsN8fFYl6w1f3gzJ652j1pxI401F9Yvm8nk0A4Cmo9TvBayB8
         +xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601154; x=1720205954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2eBDW364M8zAI7+85aEbywY4CV9ymJQrKq8441onCI=;
        b=aJl5GO4hQCBGY+C7L2En6RM3OQl/D2jVuEofx7wWntSCRiTNHDKZJo7lVKSqGs90vC
         3W8Zc8I+7h3oxzgYya2N/ZEO1O+0CZRrRgMG5mSoZlqSiHWgPhBY6SKbRLQhKzr8GkNT
         +w2HviI3Z7ew6e5+uo7ONlGf9vJFde0pzMEBAjVUu5f83M+LPPpPru33OMonvUiocSqU
         yKE1Hzmn7FCAfq9OBV1ul7UJzJi6MPVLRmvV2uWAv0g8MLg8OMOHZ0Z5lgYq6Zhb5vTQ
         hMD+qihgScCYX2k3uo1r1gTUvkz4Mi8Xd3RK7hfsV/o0i362hjfsBnXEN2CZ7mkvORat
         c++Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmUwjL2TGYLoWmO1aGWwNKQyk7rgNii0TuMl+pgy2gFqvP+fAxTwjAl4w8JJqs/tgSIP95rxW8kCmzrPUs1h8SRldBfKtqyU7e1g==
X-Gm-Message-State: AOJu0Yyzi1Or0xkk/o/8bhuTLaOyM6nJM1MNvGjfYpsvAy5HW9euTy9z
	OYuV571vIiJYwaSYDAljXhsCf9nMHKgMC6D0ENRR5Pr3y+bKOuIZGS038m2pVpY=
X-Google-Smtp-Source: AGHT+IFPpOpeDwWtsRGdlzPOa7rLnNN7faWC+Kx5yQeLDzh/S+QWb17Wt2y98riieKcxe6zI9yBPMw==
X-Received: by 2002:a05:6000:4010:b0:367:47e6:c7d8 with SMTP id ffacd0b85a97d-36747e6ca56mr4618723f8f.9.1719601154616;
        Fri, 28 Jun 2024 11:59:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:33 +0200
Subject: [PATCH RESEND libgpiod v2 14/18] dbus: add tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-14-c1331ac17cb8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=29190;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nI6Vwx8s+qcXK1eIPmjv63mVe69KqjXQ4/yD5nDi88I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfuawM73+7zi2xGChax3uY5zxt6Fu41rR/Yt
 9K0pIgCQW+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H7gAKCRARpy6gFHHX
 ckqTEADHYSZs/TfbtLZjsgtpb76pmeEaZrQl628uECMdbyKalXdznxOJS5wSN5Srf/cxIZlp5MD
 DHX5JTcjAjBg/W26cgkvVsIZvWzcyB+D3T8XoNeKk4DBj4T6tRhk40ZhheDlBc9HGmQRWSzRQRM
 n11LQEuxPhCBqpLKuRTFv7HiCZXKYQWHQAuR4StblUJX433+bzJWFU2oeEfdy0iGuMw03UWomfU
 egP++m1nY688XAq1ZaWDnRkdjV1XP0cirFDl59S6cec/cCpTS7AiB7F9mfeoZ/n+Evxt+4G+Ar+
 hT2leP0QJNuAoZ7LedUmSWfihwk7+ne+VUkAo9J3EJalisBW1Lrv427DwbRQ/JdtOU/dmYDj9a1
 lM5G44STSFz6ViklPqYwSHqwWbc+Unod10wq+dwdKZOXrpznYlSr5ZKxMsrKJy0mNuya8cG2XaM
 +n6vys80Ego9RKeqXEUt7lhaO95WRs8ToieUA/k/ICL7BQeAQwqG+zc9xTgUzTZIByuX0Y8CjPO
 yVYeUvOBvB0OFU0PZWUq5LJvKUjOUTAkh/THZrhZEr5pxbLBj4b/TUCXLe7AtsQqPCVkT8RWo0r
 jgvZ0mesVycAgLt2Ox2Cm7NFI0EjXdJ5tBNh6q2sW86QbgLZ7ExkNVt633mLo1UAjKxSpx3yIHp
 IoyVDx7D3NtZQ9A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a set of test-cases verifying the functionality of the gpio-manager
daemon.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/tests/daemon-process.c | 129 +++++++++++++++++++++++++
 dbus/tests/daemon-process.h |  20 ++++
 dbus/tests/helpers.c        | 107 ++++++++++++++++++++
 dbus/tests/helpers.h        | 112 +++++++++++++++++++++
 dbus/tests/tests-chip.c     | 133 +++++++++++++++++++++++++
 dbus/tests/tests-line.c     | 231 ++++++++++++++++++++++++++++++++++++++++++++
 dbus/tests/tests-request.c  | 116 ++++++++++++++++++++++
 7 files changed, 848 insertions(+)

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
index 0000000..48dfd1a
--- /dev/null
+++ b/dbus/tests/tests-line.c
@@ -0,0 +1,231 @@
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
+	GHashTable *changed_props = user_data;
+	GVariantIter iter;
+	GVariant *variant;
+	gchar *str;
+
+	g_variant_iter_init(&iter, changed_properties);
+	while (g_variant_iter_next(&iter, "{sv}", &str, &variant)) {
+		g_hash_table_insert(changed_props, str, NULL);
+		g_variant_unref(variant);
+	}
+}
+
+static void check_props_requested(GHashTable *props)
+{
+	if (!g_hash_table_contains(props, "Direction") ||
+	    !g_hash_table_contains(props, "Consumer") ||
+	    !g_hash_table_contains(props, "Used") ||
+	    !g_hash_table_contains(props, "RequestPath") ||
+	    !g_hash_table_contains(props, "Managed"))
+		g_test_fail_printf("Not all expected properties have changed");
+}
+
+static void check_props_released(GHashTable *props)
+{
+	if (!g_hash_table_contains(props, "RequestPath") ||
+	    !g_hash_table_contains(props, "Consumer") ||
+	    !g_hash_table_contains(props, "Used") ||
+	    !g_hash_table_contains(props, "Managed"))
+		g_test_fail_printf("Not all expected properties have changed");
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
+	g_autoptr(GHashTable) changed_props = NULL;
+	g_autoptr(GPIODBusRequest) request = NULL;
+	g_autoptr(GVariant) request_config = NULL;
+	g_autoptr(GVariant) line_config = NULL;
+	g_autofree gchar *line_obj_path = NULL;
+	g_autofree gchar *chip_obj_path = NULL;
+	g_autofree gchar *request_path = NULL;
+	g_autoptr(GPIODBusChip) chip = NULL;
+	g_autoptr(GPIODBusLine) line = NULL;
+	gboolean timed_out = FALSE;
+	guint timeout_id;
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
+	changed_props = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+						      NULL);
+
+	g_signal_connect(line, "g-properties-changed",
+			 G_CALLBACK(on_properties_changed), changed_props);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &timed_out);
+
+	line_config = make_props_changed_line_config();
+	request_config = gpiodbus_test_make_empty_request_config();
+
+	gpiodbus_test_chip_call_request_lines_sync_or_fail(chip, line_config,
+							   request_config,
+							   &request_path);
+
+	while (g_hash_table_size(changed_props) < 5 && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	check_props_requested(changed_props);
+
+	g_hash_table_destroy(g_hash_table_ref(changed_props));
+
+	request = gpiodbus_test_get_request_proxy_or_fail(request_path);
+	gpiodbus_test_request_call_release_sync_or_fail(request);
+
+	while (g_hash_table_size(changed_props) < 4 && !timed_out)
+		g_main_context_iteration(NULL, TRUE);
+
+	check_props_released(changed_props);
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
2.43.0


