Return-Path: <linux-gpio+bounces-5425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E578A2E3A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A676D1F23337
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DA256B65;
	Fri, 12 Apr 2024 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Sw8h8ibe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382956B6F
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924913; cv=none; b=uOpW96oTrGjyoBzTROk8qzHvjmOVBWfs/QpWDiUUsYspY3Zi4tWh0oUZe/uG6zERIGM02HBi0KyDb88v8/dydzcDI/quZNeUkvlcn/fpfCfguie9EFOw470I4J21rKwHdF+NbWWoFpquIh2l49qqa4MCdhzTRqQqnpbXmcg1u4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924913; c=relaxed/simple;
	bh=dbLZ6YWIwweAncub35a9zl7u320HVMgQr+mLlnBqTdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VKddEal/k5+zmPGue4khZGjM9PN5Lm8qDbX0dN8GDqm8ZI726HrHQ2N2f2wzQ4+K2Hd7DhqHA3jN/9oZXYgjGh/90oC62p3ffKtYH8mkqaMd5GyB6DjHBv2PYvq6qa3o0XjTW0j3EmQdTeXLKbIyTHPg/9bEUuE9l64fcAsTMRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Sw8h8ibe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41802e8db57so2814065e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924908; x=1713529708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXyvb8knj8SNjWtyJPg5uzvJOuhWkBgbY8km8t8w53g=;
        b=Sw8h8ibeZHac7SiT/wm1hiR02/xBqFnZfWrx2rkL5NegtEWfuVoCGJAHV4fZH3/gFs
         1b2BOQ/I8HBRBsZEmEdtYO5yEsU2kHBDbaoujmYQgxBNviU55522mGdXuPR3lfxCEfWc
         3bm5MVZu5PFx1ZD0w7lnZlj/X1XES5PjIJEretMDpT9l5uvavHfrGtLgPsKlzk+PC4wQ
         xAwT2D+ihBuJMTLVWzEfcY3lNZBX1ZprqnaHxyo6/6GpCGmGnhTVv0IPtu0uk6AZCu+l
         8Dbtvt25FohmIcj9jSlme/0owqln8K4HqrF3gMEO9B2wLO61s+5F5fDA84MfJBZEib7g
         Yb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924908; x=1713529708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXyvb8knj8SNjWtyJPg5uzvJOuhWkBgbY8km8t8w53g=;
        b=t2Gn1gix7cshncG+mk2wXToOY6lSGNnsvqd7igTk3TOwxyEemsbuhx8u8EGwskmvZY
         T4QhrYVqGcylT/Phue72q+yHsrnbiA1YHuCnCc/1McaR6rS6dOabOwW4GrwM7o5K8Gdv
         DJ2FqPeU8z159dxwq/PAPABEJuTEfcdyaW5/BA+iJmiReXXeWc0HKfnj1FYgKyaS+G6y
         iDQXHSAQL1VXZIK/xAqdD5U0v1fgKWVRI9RXDLmo5vCUqLD4qQXTuGn/LoJmSd+7qwVA
         qzBiKKwXcR6us0pqWu8JLeMTvox1LoP8xqBoJF1H/3+pnCpQJcl8fv3dGEpkDluzBA9l
         ryoA==
X-Gm-Message-State: AOJu0YxvVQdidXSAGj0qOlnn140ZAYGkZ76xp5jb7BAapussCbcGUgSM
	R1ksChIxHZ58xGkGkK3F9lOSc0LFY9gmhgM8Pkloh8rsog5/kB9KFssBwM/V7ac=
X-Google-Smtp-Source: AGHT+IGtNpBNghkNEnnysN2Unvhq1ddmaCPq2iO/8L/nFaqJIYKZ86PEHmE11rW+1+3LghXblByWcQ==
X-Received: by 2002:a05:600c:354d:b0:417:fb19:eeee with SMTP id i13-20020a05600c354d00b00417fb19eeeemr1389161wmq.13.1712924908201;
        Fri, 12 Apr 2024 05:28:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 13/18] dbus: add gpio-manager code
Date: Fri, 12 Apr 2024 14:27:59 +0200
Message-Id: <20240412122804.109323-14-brgl@bgdev.pl>
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

Add the code for the gpio-manager - the actual implementation of the
DBus API defined in io.gpiod1.xml.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/manager/daemon.c       | 821 ++++++++++++++++++++++++++++++++++++
 dbus/manager/daemon.h       |  22 +
 dbus/manager/gpio-manager.c | 167 ++++++++
 dbus/manager/helpers.c      | 420 ++++++++++++++++++
 dbus/manager/helpers.h      |  24 ++
 5 files changed, 1454 insertions(+)
 create mode 100644 dbus/manager/daemon.c
 create mode 100644 dbus/manager/daemon.h
 create mode 100644 dbus/manager/gpio-manager.c
 create mode 100644 dbus/manager/helpers.c
 create mode 100644 dbus/manager/helpers.h

diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
new file mode 100644
index 0000000..59bf1ee
--- /dev/null
+++ b/dbus/manager/daemon.c
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiodbus.h>
+#include <gudev/gudev.h>
+
+#include "daemon.h"
+#include "helpers.h"
+
+struct _GPIODBusDaemon {
+	GObject parent;
+	GDBusConnection *con;
+	GUdevClient *udev;
+	GDBusObjectManagerServer *chip_manager;
+	GDBusObjectManagerServer *request_manager;
+	GHashTable *chips;
+	GHashTable *requests;
+	GTree *req_id_root;
+};
+
+G_DEFINE_TYPE(GPIODBusDaemon, gpiodbus_daemon, G_TYPE_OBJECT);
+
+typedef struct {
+	GPIODChip *chip;
+	GPIODBusChip *dbus_chip;
+	GPIODBusDaemon *daemon;
+	GDBusObjectManagerServer *line_manager;
+	GHashTable *lines;
+} GPIODBusDaemonChipData;
+
+typedef struct {
+	GPIODLineRequest *request;
+	GPIODBusRequest *dbus_request;
+	gint id;
+	GPIODBusDaemonChipData *chip_data;
+} GPIODBusDaemonRequestData;
+
+typedef struct {
+	GPIODBusLine *dbus_line;
+	GPIODBusDaemonChipData *chip_data;
+	GPIODBusDaemonRequestData *req_data;
+} GPIODBusDaemonLineData;
+
+static const gchar* const gpiodbus_daemon_udev_subsystems[] = { "gpio", NULL };
+
+static void gpiodbus_daemon_dispose(GObject *obj)
+{
+	GPIODBusDaemon *self = GPIODBUS_DAEMON(obj);
+
+	g_debug("disposing of the GPIO daemon");
+
+	g_clear_pointer(&self->chips, g_hash_table_unref);
+	/*
+	 * REVISIT: Do we even need to unref the request hash table here at
+	 * all? All requests should have been freed when removing their parent
+	 * chips.
+	 */
+	g_clear_pointer(&self->requests, g_hash_table_unref);
+	g_clear_pointer(&self->req_id_root, g_tree_destroy);
+	g_clear_object(&self->con);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_parent_class)->dispose(obj);
+}
+
+static void gpiodbus_daemon_finalize(GObject *obj)
+{
+	GPIODBusDaemon *self = GPIODBUS_DAEMON(obj);
+
+	g_debug("finalizing GPIO daemon");
+
+	g_clear_object(&self->request_manager);
+	g_clear_object(&self->chip_manager);
+	g_clear_object(&self->udev);
+
+	G_OBJECT_CLASS(gpiodbus_daemon_parent_class)->finalize(obj);
+}
+
+static void gpiodbus_daemon_class_init(GPIODBusDaemonClass *daemon_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(daemon_class);
+
+	class->dispose = gpiodbus_daemon_dispose;
+	class->finalize = gpiodbus_daemon_finalize;
+}
+
+static gboolean
+gpiodbus_remove_request_if_chip_matches(gpointer key G_GNUC_UNUSED,
+					gpointer value, gpointer user_data)
+{
+	GPIODBusDaemonChipData *chip_data = user_data;
+	GPIODBusDaemonRequestData *req_data = value;
+
+	return req_data->chip_data == chip_data;
+}
+
+static void gpiodbus_daemon_chip_data_free(gpointer data)
+{
+	GPIODBusDaemonChipData *chip_data = data;
+	const gchar *obj_path;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(chip_data->dbus_chip));
+
+	g_debug("unexporting object for GPIO chip: '%s'", obj_path);
+
+	g_hash_table_foreach_remove(chip_data->daemon->requests,
+				    gpiodbus_remove_request_if_chip_matches,
+				    chip_data);
+
+	g_dbus_object_manager_server_unexport(chip_data->daemon->chip_manager,
+					      obj_path);
+
+	g_hash_table_unref(chip_data->lines);
+	g_object_unref(chip_data->line_manager);
+	g_object_unref(chip_data->chip);
+	g_object_unref(chip_data->dbus_chip);
+	g_free(chip_data);
+}
+
+static void gpiodbus_daemon_line_data_free(gpointer data)
+{
+	GPIODBusDaemonLineData *line_data = data;
+	const gchar *obj_path;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(line_data->dbus_line));
+
+	g_debug("unexporting object for GPIO line: '%s'",
+		obj_path);
+
+	g_dbus_object_manager_server_unexport(
+				line_data->chip_data->line_manager, obj_path);
+
+	g_object_unref(line_data->dbus_line);
+	g_free(line_data);
+}
+
+static void gpiodbus_lines_set_managed(GPIODBusDaemonRequestData *req_data,
+				       gboolean managed)
+{
+	g_autoptr(GDBusObject) obj = NULL;
+	const gchar *const *line_paths;
+	GPIODBusLine *line;
+	const gchar *path;
+	guint i;
+
+	line_paths = gpiodbus_request_get_line_paths(req_data->dbus_request);
+
+	for (path = line_paths[0], i = 0; path; path = line_paths[++i]) {
+		obj = g_dbus_object_manager_get_object(
+			G_DBUS_OBJECT_MANAGER(
+				req_data->chip_data->line_manager), path);
+		line = gpiodbus_object_peek_line(GPIODBUS_OBJECT(obj));
+
+		g_debug("Setting line %u on chip object '%s' to '%s'",
+			gpiodbus_line_get_offset(line),
+			g_dbus_interface_skeleton_get_object_path(
+				G_DBUS_INTERFACE_SKELETON(
+					req_data->chip_data->dbus_chip)),
+			managed ? "managed" : "unmanaged");
+
+		gpiodbus_line_set_managed(line, managed);
+		gpiodbus_line_set_request_path(line,
+			managed ? g_dbus_interface_skeleton_get_object_path(
+				G_DBUS_INTERFACE_SKELETON(
+					req_data->dbus_request)) : NULL);
+		g_dbus_interface_skeleton_flush(
+					G_DBUS_INTERFACE_SKELETON(line));
+	}
+}
+
+static void gpiodbus_daemon_request_data_free(gpointer data)
+{
+	GPIODBusDaemonRequestData *req_data = data;
+	const gchar *obj_path;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(req_data->dbus_request));
+
+	g_debug("unexporting object for GPIO request: '%s'", obj_path);
+
+	g_dbus_object_manager_server_unexport(
+		req_data->chip_data->daemon->request_manager, obj_path);
+
+	gpiodbus_lines_set_managed(req_data, FALSE);
+	gpiodbus_id_free(req_data->chip_data->daemon->req_id_root,
+			 req_data->id);
+	g_object_unref(req_data->request);
+	g_object_unref(req_data->dbus_request);
+	g_free(req_data);
+}
+
+static void gpiodbus_daemon_init(GPIODBusDaemon *self)
+{
+	g_debug("initializing GPIO DBus daemon");
+
+	self->con = NULL;
+	self->udev = g_udev_client_new(gpiodbus_daemon_udev_subsystems);
+	self->chip_manager =
+			g_dbus_object_manager_server_new("/io/gpiod1/chips");
+	self->request_manager =
+			g_dbus_object_manager_server_new("/io/gpiod1/requests");
+	self->chips = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+					    gpiodbus_daemon_chip_data_free);
+	self->requests = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
+					gpiodbus_daemon_request_data_free);
+	self->req_id_root = g_tree_new_full(gpiodbus_id_cmp, NULL,
+					    g_free, NULL);
+}
+
+GPIODBusDaemon *gpiodbus_daemon_new(void)
+{
+	return GPIODBUS_DAEMON(g_object_new(GPIODBUS_DAEMON_TYPE, NULL));
+}
+
+static void gpiodbus_daemon_on_info_event(GPIODChip *chip G_GNUC_UNUSED,
+					  GPIODInfoEvent *event,
+					  gpointer data)
+{
+	GPIODBusDaemonChipData *chip_data = data;
+	g_autoptr(GPIODLineInfo) info = NULL;
+	GPIODBusDaemonLineData *line_data;
+	guint offset;
+
+	info = g_gpiod_info_event_get_line_info(event);
+	offset = g_gpiod_line_info_get_offset(info);
+
+	g_debug("line info event received for offset %u on chip '%s'",
+		offset,
+		g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(chip_data->dbus_chip)));
+
+	line_data = g_hash_table_lookup(chip_data->lines,
+					GINT_TO_POINTER(offset));
+	if (!line_data)
+		g_error("failed to retrieve line data - programming bug?");
+
+	gpiodbus_line_set_props(line_data->dbus_line, info);
+}
+
+static void gpiodbus_daemon_export_line(GPIODBusDaemon *self,
+					GPIODBusDaemonChipData *chip_data,
+					GPIODLineInfo *info)
+{
+	g_autofree GPIODBusDaemonLineData *line_data = NULL;
+	g_autoptr(GPIODBusObjectSkeleton) skeleton = NULL;
+	g_autoptr(GPIODBusLine) dbus_line = NULL;
+	g_autofree gchar *obj_path = NULL;
+	const gchar *obj_prefix;
+	guint line_offset;
+	gboolean ret;
+
+	obj_prefix = g_dbus_object_manager_get_object_path(
+				G_DBUS_OBJECT_MANAGER(chip_data->line_manager));
+	line_offset = g_gpiod_line_info_get_offset(info);
+	dbus_line = gpiodbus_line_skeleton_new();
+	obj_path = g_strdup_printf("%s/line%u", obj_prefix, line_offset);
+
+	gpiodbus_line_set_props(dbus_line, info);
+
+	skeleton = gpiodbus_object_skeleton_new(obj_path);
+	gpiodbus_object_skeleton_set_line(skeleton, GPIODBUS_LINE(dbus_line));
+
+	g_debug("exporting object for GPIO line: '%s'", obj_path);
+
+	g_dbus_object_manager_server_export(chip_data->line_manager,
+					    G_DBUS_OBJECT_SKELETON(skeleton));
+	g_dbus_object_manager_server_set_connection(chip_data->line_manager,
+						    self->con);
+
+	line_data = g_malloc0(sizeof(*line_data));
+	line_data->dbus_line = g_steal_pointer(&dbus_line);
+	line_data->chip_data = chip_data;
+
+	ret = g_hash_table_insert(chip_data->lines,
+				  GUINT_TO_POINTER(line_offset),
+				  g_steal_pointer(&line_data));
+	/* It's a programming bug if the line is already in the hashmap. */
+	g_assert(ret);
+}
+
+static gboolean gpiodbus_daemon_export_lines(GPIODBusDaemon *self,
+					     GPIODBusDaemonChipData *chip_data)
+{
+	g_autoptr(GPIODChipInfo) chip_info = NULL;
+	GPIODChip *chip = chip_data->chip;
+	g_autoptr(GError) err = NULL;
+	guint i, num_lines;
+	gint j;
+
+	chip_info = g_gpiod_chip_get_info(chip, &err);
+	if (!chip_info) {
+		g_critical("failed to read chip info: %s", err->message);
+		return FALSE;
+	}
+
+	num_lines = g_gpiod_chip_info_get_num_lines(chip_info);
+
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(gpiodbus_daemon_on_info_event), chip_data);
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GPIODLineInfo) linfo = NULL;
+
+		linfo = g_gpiod_chip_watch_line_info(chip, i, &err);
+		if (!linfo) {
+			g_critical("failed to setup a line-info watch: %s",
+				   err->message);
+			for (j = i; j >= 0; j--)
+				g_gpiod_chip_unwatch_line_info(chip, i, NULL);
+			return FALSE;
+		}
+
+		gpiodbus_daemon_export_line(self, chip_data, linfo);
+	}
+
+	return TRUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_release_lines(GPIODBusRequest *request,
+				     GDBusMethodInvocation *invocation,
+				     gpointer user_data)
+{
+	GPIODBusDaemonRequestData *req_data = user_data;
+	g_autofree gchar *obj_path = NULL;
+	gboolean ret;
+
+	obj_path = g_strdup(g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request)));
+
+	g_debug("release call received on request '%s'", obj_path);
+
+	ret = g_hash_table_remove(req_data->chip_data->daemon->requests,
+				  obj_path);
+	/* It's a programming bug if the request was not in the hashmap. */
+	if (!ret)
+		g_warning("request '%s' is not registered - logic error?",
+			  obj_path);
+
+	g_dbus_method_invocation_return_value(invocation, NULL);
+
+	return G_SOURCE_CONTINUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_reconfigure_lines(GPIODBusRequest *request,
+					 GDBusMethodInvocation *invocation,
+					 GVariant *arg_line_cfg,
+					 gpointer user_data)
+{
+	GPIODBusDaemonRequestData *req_data = user_data;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autofree gchar *line_cfg_str = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *obj_path;
+	gboolean ret;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request));
+	line_cfg_str = g_variant_print(arg_line_cfg, FALSE);
+
+	g_debug("reconfigure call received on request '%s', line config: %s",
+		obj_path, line_cfg_str);
+
+	line_cfg = gpiodbus_line_config_from_variant(arg_line_cfg);
+	if (!line_cfg) {
+		g_critical("failed to convert method call arguments '%s' to line config",
+			   line_cfg_str);
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "Invalid line configuration");
+		goto out;
+	}
+
+	ret = g_gpiod_line_request_reconfigure_lines(req_data->request,
+						     line_cfg, &err);
+	if (!ret) {
+		g_critical("failed to reconfigure GPIO lines on request '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+						"io.gpiod1.ReconfigureFailed",
+						err->message);
+		goto out;
+	}
+
+	g_dbus_method_invocation_return_value(invocation, NULL);
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_get_values(GPIODBusRequest *request,
+				  GDBusMethodInvocation *invocation,
+				  GVariant *arg_offsets, gpointer user_data)
+{
+	GPIODBusDaemonRequestData *req_data = user_data;
+	g_autoptr(GVariant) out_values = NULL;
+	g_autofree gchar *offsets_str = NULL;
+	g_autoptr(GVariant) response = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	GVariantBuilder builder;
+	const gchar *obj_path;
+	GVariantIter iter;
+	gsize num_offsets;
+	guint offset, i;
+	gboolean ret;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request));
+	offsets_str = g_variant_print(arg_offsets, FALSE);
+	num_offsets = g_variant_n_children(arg_offsets);
+
+	g_debug("get-values call received on request '%s' for offsets: %s",
+		obj_path, offsets_str);
+
+	if (num_offsets == 0) {
+		ret = g_gpiod_line_request_get_values(req_data->request,
+						      &values, &err);
+	} else {
+		offsets = g_array_sized_new(FALSE, TRUE, sizeof(offset),
+					    num_offsets);
+		g_variant_iter_init(&iter, arg_offsets);
+		while (g_variant_iter_next(&iter, "u", &offset))
+			g_array_append_val(offsets, offset);
+
+		ret = g_gpiod_line_request_get_values_subset(req_data->request,
+							     offsets, &values,
+							     &err);
+	}
+	if (!ret) {
+		g_critical("failed to get GPIO line values on request '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+						"io.gpiod1.GetValuesFailed",
+						err->message);
+		goto out;
+	}
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_ARRAY);
+	for (i = 0; i < values->len; i++)
+		g_variant_builder_add(&builder, "i",
+				      g_array_index(values, gint, i));
+	out_values = g_variant_ref_sink(g_variant_builder_end(&builder));
+
+	g_variant_builder_init(&builder, G_VARIANT_TYPE_TUPLE);
+	g_variant_builder_add_value(&builder, out_values);
+	response = g_variant_ref_sink(g_variant_builder_end(&builder));
+
+	g_dbus_method_invocation_return_value(invocation, response);
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static gboolean
+gpiodbus_daemon_handle_set_values(GPIODBusRequest *request,
+				  GDBusMethodInvocation *invocation,
+				  GVariant *arg_values, gpointer user_data)
+{
+	GPIODBusDaemonRequestData *req_data = user_data;
+	g_autofree gchar *values_str = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *obj_path;
+	GVariantIter iter;
+	gsize num_values;
+	guint offset;
+	gboolean ret;
+	gint value;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(request));
+	values_str = g_variant_print(arg_values, FALSE);
+	num_values = g_variant_n_children(arg_values);
+
+	g_debug("set-values call received on request '%s': %s",
+		obj_path, values_str);
+
+	if (num_values == 0) {
+		g_critical("Client passed no offset to value mappings");
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "No offset <-> value mappings specified");
+		goto out;
+	}
+
+	offsets = g_array_sized_new(FALSE, TRUE, sizeof(offset), num_values);
+	values = g_array_sized_new(FALSE, TRUE, sizeof(value), num_values);
+
+	g_variant_iter_init(&iter, arg_values);
+	while (g_variant_iter_next(&iter, "{ui}", &offset, &value)) {
+		g_array_append_val(offsets, offset);
+		g_array_append_val(values, value);
+	}
+
+	ret = g_gpiod_line_request_set_values_subset(req_data->request, offsets,
+						     values, &err);
+	if (!ret) {
+		g_critical("failed to set GPIO line values on request '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+						"io.gpiod1.SetValuesFailed",
+						err->message);
+		goto out;
+	}
+
+	g_dbus_method_invocation_return_value(invocation, NULL);
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static void
+gpiodbus_daemon_on_edge_event(GPIODLineRequest *request G_GNUC_UNUSED,
+			      GPIODEdgeEvent *event, gpointer user_data)
+{
+	GPIODBusDaemonRequestData *req_data = user_data;
+	GPIODBusDaemonLineData *line_data;
+	gulong line_seqno, global_seqno;
+	GPIODEdgeEventType edge;
+	guint64 timestamp;
+	guint offset;
+	gint val;
+
+	edge = g_gpiod_edge_event_get_event_type(event);
+	offset = g_gpiod_edge_event_get_line_offset(event);
+	timestamp = g_gpiod_edge_event_get_timestamp_ns(event);
+	global_seqno = g_gpiod_edge_event_get_global_seqno(event);
+	line_seqno = g_gpiod_edge_event_get_line_seqno(event);
+
+	val = edge == G_GPIOD_EDGE_EVENT_RISING_EDGE ? 1 : 0;
+
+	g_debug("%s edge event received for offset %u on request '%s'",
+		val ? "rising" : "falling", offset,
+		g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(req_data->dbus_request)));
+
+	line_data = g_hash_table_lookup(req_data->chip_data->lines,
+					GINT_TO_POINTER(offset));
+	if (!line_data)
+		g_error("failed to retrieve line data - programming bug?");
+
+	gpiodbus_line_emit_edge_event(line_data->dbus_line,
+				      g_variant_new("(ittt)", val, timestamp,
+						    global_seqno, line_seqno));
+}
+
+static void
+gpiodbus_daemon_export_request(GPIODBusDaemon *self, GPIODLineRequest *request,
+			       GPIODBusDaemonChipData *chip_data, gint id)
+{
+	g_autofree GPIODBusDaemonRequestData *req_data = NULL;
+	g_autoptr(GPIODBusObjectSkeleton) skeleton = NULL;
+	g_autoptr(GPIODBusRequest) dbus_req = NULL;
+	g_autofree gchar *obj_path = NULL;
+	gboolean ret;
+
+	dbus_req = gpiodbus_request_skeleton_new();
+	obj_path = g_strdup_printf("/io/gpiod1/requests/request%d", id);
+
+	gpiodbus_request_set_props(dbus_req, request, chip_data->dbus_chip,
+				G_DBUS_OBJECT_MANAGER(chip_data->line_manager));
+
+	skeleton = gpiodbus_object_skeleton_new(obj_path);
+	gpiodbus_object_skeleton_set_request(skeleton,
+					     GPIODBUS_REQUEST(dbus_req));
+
+	g_debug("exporting object for GPIO request: '%s'", obj_path);
+
+	g_dbus_object_manager_server_export(self->request_manager,
+					    G_DBUS_OBJECT_SKELETON(skeleton));
+
+	req_data = g_malloc0(sizeof(*req_data));
+	req_data->chip_data = chip_data;
+	req_data->dbus_request = g_steal_pointer(&dbus_req);
+	req_data->id = id;
+	req_data->request = g_object_ref(request);
+
+	g_signal_connect(req_data->dbus_request, "handle-release",
+			 G_CALLBACK(gpiodbus_daemon_handle_release_lines),
+			 req_data);
+	g_signal_connect(req_data->dbus_request, "handle-reconfigure-lines",
+			 G_CALLBACK(gpiodbus_daemon_handle_reconfigure_lines),
+			 req_data);
+	g_signal_connect(req_data->dbus_request, "handle-get-values",
+			 G_CALLBACK(gpiodbus_daemon_handle_get_values),
+			 req_data);
+	g_signal_connect(req_data->dbus_request, "handle-set-values",
+			 G_CALLBACK(gpiodbus_daemon_handle_set_values),
+			 req_data);
+	g_signal_connect(req_data->request, "edge-event",
+			 G_CALLBACK(gpiodbus_daemon_on_edge_event), req_data);
+
+	gpiodbus_lines_set_managed(req_data, TRUE);
+
+	ret = g_hash_table_insert(self->requests, g_steal_pointer(&obj_path),
+				  g_steal_pointer(&req_data));
+	/* It's a programming bug if the request is already in the hashmap. */
+	g_assert(ret);
+}
+
+static gboolean
+gpiodbus_daemon_handle_request_lines(GPIODBusChip *chip,
+				     GDBusMethodInvocation *invocation,
+				     GVariant *arg_line_cfg,
+				     GVariant *arg_req_cfg,
+				     gpointer user_data)
+{
+	GPIODBusDaemonChipData *chip_data = user_data;
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autofree gchar *line_cfg_str = NULL;
+	g_autofree gchar *req_cfg_str = NULL;
+	g_autofree gchar *response = NULL;
+	g_autoptr(GError) err = NULL;
+	const gchar *obj_path;
+	guint id;
+
+	obj_path = g_dbus_interface_skeleton_get_object_path(
+			G_DBUS_INTERFACE_SKELETON(chip));
+	line_cfg_str = g_variant_print(arg_line_cfg, FALSE);
+	req_cfg_str = g_variant_print(arg_req_cfg, FALSE);
+
+	g_debug("line request received on chip '%s', line config: %s, request_config: %s",
+		obj_path, line_cfg_str, req_cfg_str);
+
+	line_cfg = gpiodbus_line_config_from_variant(arg_line_cfg);
+	if (!line_cfg) {
+		g_critical("failed to convert method call arguments '%s' to line config",
+			   line_cfg_str);
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "Invalid line configuration");
+		goto out;
+	}
+
+	req_cfg = gpiodbus_request_config_from_variant(arg_req_cfg);
+	if (!req_cfg) {
+		g_critical("failed to convert method call arguments '%s' to request config",
+			   req_cfg_str);
+		g_dbus_method_invocation_return_error(invocation, G_DBUS_ERROR,
+						      G_DBUS_ERROR_INVALID_ARGS,
+						      "Invalid request configuration");
+		goto out;
+	}
+
+	request = g_gpiod_chip_request_lines(chip_data->chip, req_cfg, line_cfg,
+					     &err);
+	if (err) {
+		g_critical("failed to request GPIO lines on chip '%s': %s",
+			   obj_path, err->message);
+		g_dbus_method_invocation_return_dbus_error(invocation,
+				"io.gpiod1.RequestFailed", err->message);
+		goto out;
+	}
+
+	g_debug("line request succeeded on chip '%s'", obj_path);
+
+	id = gpiodbus_id_alloc(chip_data->daemon->req_id_root);
+	gpiodbus_daemon_export_request(chip_data->daemon, request,
+				       chip_data, id);
+
+	response = g_strdup_printf("/io/gpiod1/requests/request%d", id);
+	g_dbus_method_invocation_return_value(invocation,
+					      g_variant_new("(o)", response));
+
+out:
+	return G_SOURCE_CONTINUE;
+}
+
+static void gpiodbus_daemon_export_chip(GPIODBusDaemon *self, GUdevDevice *dev)
+{
+	g_autofree GPIODBusDaemonChipData *chip_data = NULL;
+	g_autoptr(GDBusObjectManagerServer) manager = NULL;
+	g_autoptr(GPIODBusObjectSkeleton) skeleton = NULL;
+	const gchar *devname, *devpath, *obj_prefix;
+	g_autoptr(GPIODBusChip) dbus_chip = NULL;
+	g_autoptr(GHashTable) lines = NULL;
+	g_autofree gchar *obj_path = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	devname = g_udev_device_get_name(dev);
+	devpath = g_udev_device_get_device_file(dev);
+	obj_prefix = g_dbus_object_manager_get_object_path(
+				G_DBUS_OBJECT_MANAGER(self->chip_manager));
+
+	chip = g_gpiod_chip_new(devpath, &err);
+	if (!chip) {
+		g_critical("failed to open GPIO chip %s: %s",
+			   devpath, err->message);
+		return;
+	}
+
+	dbus_chip = gpiodbus_chip_skeleton_new();
+	obj_path = g_strdup_printf("%s/%s", obj_prefix, devname);
+
+	ret = gpiodbus_chip_set_props(dbus_chip, chip, &err);
+	if (!ret) {
+		g_critical("failed to set chip properties: %s", err->message);
+		return;
+	}
+
+	skeleton = gpiodbus_object_skeleton_new(obj_path);
+	gpiodbus_object_skeleton_set_chip(skeleton, GPIODBUS_CHIP(dbus_chip));
+
+	g_debug("exporting object for GPIO chip: '%s'", obj_path);
+
+	g_dbus_object_manager_server_export(self->chip_manager,
+					    G_DBUS_OBJECT_SKELETON(skeleton));
+
+	lines = g_hash_table_new_full(g_direct_hash, g_direct_equal, NULL,
+				      gpiodbus_daemon_line_data_free);
+	manager = g_dbus_object_manager_server_new(obj_path);
+
+	chip_data = g_malloc0(sizeof(*chip_data));
+	chip_data->daemon = self;
+	chip_data->chip = g_steal_pointer(&chip);
+	chip_data->dbus_chip = g_steal_pointer(&dbus_chip);
+	chip_data->lines = g_steal_pointer(&lines);
+	chip_data->line_manager = g_steal_pointer(&manager);
+
+	ret = gpiodbus_daemon_export_lines(self, chip_data);
+	if (!ret) {
+		g_dbus_object_manager_server_unexport(self->chip_manager,
+						      obj_path);
+		return;
+	}
+
+	g_signal_connect(chip_data->dbus_chip, "handle-request-lines",
+			 G_CALLBACK(gpiodbus_daemon_handle_request_lines),
+			 chip_data);
+
+	ret = g_hash_table_insert(self->chips, g_strdup(devname),
+				  g_steal_pointer(&chip_data));
+	/* It's a programming bug if the chip is already in the hashmap. */
+	g_assert(ret);
+}
+
+static void gpiodbus_daemon_unexport_chip(GPIODBusDaemon *self,
+					  GUdevDevice *dev)
+{
+	const gchar *name = g_udev_device_get_name(dev);
+	gboolean ret;
+
+	ret = g_hash_table_remove(self->chips, name);
+	/* It's a programming bug if the chip was not in the hashmap. */
+	if (!ret)
+		g_warning("chip '%s' is not registered - exporting failed?",
+			  name);
+}
+
+/*
+ * We can get two uevents per action per gpiochip. One is for the new-style
+ * character device, the other for legacy sysfs devices. We are only concerned
+ * with the former, which we can tell from the latter by the presence of
+ * the device file.
+ */
+static gboolean gpiodbus_daemon_is_gpiochip_device(GUdevDevice *dev)
+{
+	return g_udev_device_get_device_file(dev) != NULL;
+}
+
+static void gpiodbus_daemon_on_uevent(GUdevClient *udev G_GNUC_UNUSED,
+				      const gchar *action, GUdevDevice *dev,
+				      gpointer data)
+{
+	GPIODBusDaemon *self = data;
+
+	if (!gpiodbus_daemon_is_gpiochip_device(dev))
+		return;
+
+	g_debug("uevent: %s action on %s device",
+		action, g_udev_device_get_name(dev));
+
+	if (g_strcmp0(action, "bind") == 0)
+		gpiodbus_daemon_export_chip(self, dev);
+	else if (g_strcmp0(action, "unbind") == 0)
+		gpiodbus_daemon_unexport_chip(self, dev);
+}
+
+static void gpiodbus_daemon_process_chip_dev(gpointer data, gpointer user_data)
+{
+	GPIODBusDaemon *daemon = user_data;
+	GUdevDevice *dev = data;
+
+	if (gpiodbus_daemon_is_gpiochip_device(dev))
+		gpiodbus_daemon_export_chip(daemon, dev);
+}
+
+void gpiodbus_daemon_start(GPIODBusDaemon *self, GDBusConnection *con)
+{
+	g_autolist(GUdevDevice) devs = NULL;
+
+	g_assert(self);
+	g_assert(!self->con); /* Don't allow to call this twice. */
+
+	self->con = g_object_ref(con);
+
+	/* Subscribe for GPIO uevents. */
+	g_signal_connect(self->udev, "uevent",
+			 G_CALLBACK(gpiodbus_daemon_on_uevent), self);
+
+	devs = g_udev_client_query_by_subsystem(self->udev, "gpio");
+	g_list_foreach(devs, gpiodbus_daemon_process_chip_dev, self);
+
+	g_dbus_object_manager_server_set_connection(self->chip_manager,
+						    self->con);
+	g_dbus_object_manager_server_set_connection(self->request_manager,
+						    self->con);
+
+	g_debug("GPIO daemon now listening");
+}
diff --git a/dbus/manager/daemon.h b/dbus/manager/daemon.h
new file mode 100644
index 0000000..7674892
--- /dev/null
+++ b/dbus/manager/daemon.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_DAEMON_H__
+#define __GPIODBUS_DAEMON_H__
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib-object.h>
+
+G_DECLARE_FINAL_TYPE(GPIODBusDaemon, gpiodbus_daemon,
+		     GPIODBUS, DAEMON, GObject);
+
+#define GPIODBUS_DAEMON_TYPE (gpiodbus_daemon_get_type())
+#define GPIODBUS_DAEMON(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), \
+	 GPIODBUS_DAEMON_TYPE, GPIODBusDaemon))
+
+GPIODBusDaemon *gpiodbus_daemon_new(void);
+void gpiodbus_daemon_start(GPIODBusDaemon *daemon, GDBusConnection *con);
+
+#endif /* __GPIODBUS_DAEMON_H__ */
diff --git a/dbus/manager/gpio-manager.c b/dbus/manager/gpio-manager.c
new file mode 100644
index 0000000..ad12fb7
--- /dev/null
+++ b/dbus/manager/gpio-manager.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib-unix.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+#include "daemon.h"
+
+static gboolean stop_main_loop_on_sig(gpointer data, const gchar *signame)
+{
+	GMainLoop *loop = data;
+
+	g_debug("%s received", signame);
+
+	g_main_loop_quit(loop);
+
+	return G_SOURCE_REMOVE;
+}
+
+static gboolean on_sigterm(gpointer data)
+{
+	return stop_main_loop_on_sig(data, "SIGTERM");
+}
+
+static gboolean on_sigint(gpointer data)
+{
+	return stop_main_loop_on_sig(data, "SIGINT");
+}
+
+static gboolean on_sighup(gpointer data G_GNUC_UNUSED)
+{
+	g_debug("SIGHUB received, ignoring");
+
+	return G_SOURCE_CONTINUE;
+}
+
+static void on_bus_acquired(GDBusConnection *con,
+			    const gchar *name G_GNUC_UNUSED,
+			    gpointer data)
+{
+	GPIODBusDaemon *daemon = data;
+
+	g_debug("DBus connection acquired");
+
+	gpiodbus_daemon_start(daemon, con);
+}
+
+static void on_name_acquired(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name, gpointer data G_GNUC_UNUSED)
+{
+	g_debug("DBus name acquired: '%s'", name);
+}
+
+static void on_name_lost(GDBusConnection *con,
+			 const gchar *name, gpointer data G_GNUC_UNUSED)
+{
+	g_debug("DBus name lost: '%s'", name);
+
+	if (!con)
+		g_error("unable to make connection to the bus");
+
+	if (g_dbus_connection_is_closed(con))
+		g_error("connection to the bus closed");
+
+	g_error("name '%s' lost on the bus", name);
+}
+
+static void print_version_and_exit(void)
+{
+	g_print("%s (libgpiod) v%s\n", g_get_prgname(), g_gpiod_api_version());
+
+	exit(EXIT_SUCCESS);
+}
+
+static void parse_opts(int argc, char **argv)
+{
+	gboolean ret, opt_debug = FALSE, opt_version = FALSE;
+	g_autoptr(GOptionContext) ctx = NULL;
+	g_auto(GStrv) remaining = NULL;
+	g_autoptr(GError) err = NULL;
+
+	const GOptionEntry opts[] = {
+		{
+			.long_name		= "debug",
+			.short_name		= 'd',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &opt_debug,
+			.description		= "Emit additional debug log messages.",
+		},
+		{
+			.long_name		= "version",
+			.short_name		= 'v',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_NONE,
+			.arg_data		= &opt_version,
+			.description		= "Print version and exit.",
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
+	ctx = g_option_context_new(NULL);
+	g_option_context_set_summary(ctx, "DBus daemon managing GPIOs.");
+	g_option_context_add_main_entries(ctx, opts, NULL);
+
+	ret = g_option_context_parse(ctx, &argc, &argv, &err);
+	if (!ret) {
+		g_printerr("Option parsing failed: %s\n\nUse %s --help\n",
+			   err->message, g_get_prgname());
+		exit(EXIT_FAILURE);
+	}
+
+	if (remaining) {
+		g_printerr("Option parsing failed: additional arguments are not allowed\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (opt_version)
+		print_version_and_exit();
+
+	if (opt_debug)
+		g_setenv("G_MESSAGES_DEBUG", "gpio-manager", FALSE);
+}
+
+int main(int argc, char **argv)
+{
+	g_autoptr(GPIODBusDaemon) daemon = NULL;
+	g_autofree gchar *basename = NULL;
+	g_autoptr(GMainLoop) loop = NULL;
+	guint bus_id;
+
+	basename = g_path_get_basename(argv[0]);
+	g_set_prgname(basename);
+	parse_opts(argc, argv);
+
+	g_message("initializing %s", g_get_prgname());
+
+	loop = g_main_loop_new(NULL, FALSE);
+	daemon = gpiodbus_daemon_new();
+
+	g_unix_signal_add(SIGTERM, on_sigterm, loop);
+	g_unix_signal_add(SIGINT, on_sigint, loop);
+	g_unix_signal_add(SIGHUP, on_sighup, NULL); /* Ignore SIGHUP. */
+
+	bus_id = g_bus_own_name(G_BUS_TYPE_SYSTEM, "io.gpiod1",
+				G_BUS_NAME_OWNER_FLAGS_NONE, on_bus_acquired,
+				on_name_acquired, on_name_lost, daemon, NULL);
+
+	g_message("%s started", g_get_prgname());
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(bus_id);
+
+	g_message("%s exiting", g_get_prgname());
+
+	return EXIT_SUCCESS;
+}
diff --git a/dbus/manager/helpers.c b/dbus/manager/helpers.c
new file mode 100644
index 0000000..c19ff59
--- /dev/null
+++ b/dbus/manager/helpers.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "helpers.h"
+
+gint gpiodbus_id_cmp(gconstpointer a, gconstpointer b,
+		     gpointer user_data G_GNUC_UNUSED)
+{
+	const gint *id_a = a;
+	const gint *id_b = b;
+
+	if (*id_a < *id_b)
+		return -1;
+	else if (*id_a > *id_b)
+		return 1;
+
+	return 0;
+}
+
+static gboolean find_lowest(gpointer key, gpointer value G_GNUC_UNUSED,
+			    gpointer data)
+{
+	gint *lowest = data, *curr = key;
+
+	if (*lowest == *curr)
+		(*lowest)++;
+
+	return FALSE;
+}
+
+gint gpiodbus_id_alloc(GTree *id_root)
+{
+	gint lowest = 0, *key;
+
+	g_tree_foreach(id_root, find_lowest, &lowest);
+
+	key = g_malloc(sizeof(*key));
+	*key = lowest;
+	g_tree_insert(id_root, key, NULL);
+
+	return lowest;
+}
+
+void gpiodbus_id_free(GTree *id_root, gint id)
+{
+	g_assert(g_tree_remove(id_root, &id));
+}
+
+gboolean
+gpiodbus_chip_set_props(GPIODBusChip *skeleton, GPIODChip *chip, GError **err)
+{
+	g_autoptr(GPIODChipInfo) info = NULL;
+
+	info = g_gpiod_chip_get_info(chip, err);
+	if (!info)
+		return FALSE;
+
+	gpiodbus_chip_set_name(skeleton, g_gpiod_chip_info_get_name(info));
+	gpiodbus_chip_set_label(skeleton, g_gpiod_chip_info_get_label(info));
+	gpiodbus_chip_set_num_lines(skeleton,
+				    g_gpiod_chip_info_get_num_lines(info));
+	gpiodbus_chip_set_path(skeleton, g_gpiod_chip_get_path(chip));
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+
+	return TRUE;
+}
+
+static const gchar *map_direction(GPIODLineDirection direction)
+{
+	switch (direction) {
+	case G_GPIOD_LINE_DIRECTION_INPUT:
+		return "input";
+	case G_GPIOD_LINE_DIRECTION_OUTPUT:
+		return "output";
+	default:
+		g_error("invalid direction value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_edge(GPIODLineEdge edge)
+{
+	switch (edge) {
+	case G_GPIOD_LINE_EDGE_NONE:
+		return "none";
+	case G_GPIOD_LINE_EDGE_FALLING:
+		return "falling";
+	case G_GPIOD_LINE_EDGE_RISING:
+		return "rising";
+	case G_GPIOD_LINE_EDGE_BOTH:
+		return "both";
+	default:
+		g_error("invalid edge value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_bias(GPIODLineBias bias)
+{
+	switch (bias) {
+	case G_GPIOD_LINE_BIAS_UNKNOWN:
+		return "unknown";
+	case G_GPIOD_LINE_BIAS_DISABLED:
+		return "disabled";
+	case G_GPIOD_LINE_BIAS_PULL_UP:
+		return "pull-up";
+	case G_GPIOD_LINE_BIAS_PULL_DOWN:
+		return "pull-down";
+	default:
+		g_error("invalid bias value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_drive(GPIODLineDrive drive)
+{
+	switch (drive) {
+	case G_GPIOD_LINE_DRIVE_PUSH_PULL:
+		return "push-pull";
+	case G_GPIOD_LINE_DRIVE_OPEN_DRAIN:
+		return "open-drain";
+	case G_GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		return "open-source";
+	default:
+		g_error("invalid drive value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_clock(GPIODLineClock event_clock)
+{
+	switch (event_clock) {
+	case G_GPIOD_LINE_CLOCK_MONOTONIC:
+		return "monotonic";
+	case G_GPIOD_LINE_CLOCK_REALTIME:
+		return "realtime";
+	case G_GPIOD_LINE_CLOCK_HTE:
+		return "hte";
+	default:
+		g_error("invalid event clock value returned by libgpiod-glib");
+	}
+}
+
+void gpiodbus_line_set_props(GPIODBusLine *skeleton, GPIODLineInfo *info)
+{
+	gpiodbus_line_set_offset(skeleton, g_gpiod_line_info_get_offset(info));
+	gpiodbus_line_set_name(skeleton, g_gpiod_line_info_get_name(info));
+	gpiodbus_line_set_used(skeleton, g_gpiod_line_info_is_used(info));
+	gpiodbus_line_set_consumer(skeleton,
+				   g_gpiod_line_info_get_consumer(info));
+	gpiodbus_line_set_direction(skeleton,
+			map_direction(g_gpiod_line_info_get_direction(info)));
+	gpiodbus_line_set_edge_detection(skeleton,
+			map_edge(g_gpiod_line_info_get_edge_detection(info)));
+	gpiodbus_line_set_bias(skeleton,
+			       map_bias(g_gpiod_line_info_get_bias(info)));
+	gpiodbus_line_set_drive(skeleton,
+				map_drive(g_gpiod_line_info_get_drive(info)));
+	gpiodbus_line_set_active_low(skeleton,
+				     g_gpiod_line_info_is_active_low(info));
+	gpiodbus_line_set_debounced(skeleton,
+				    g_gpiod_line_info_is_debounced(info));
+	gpiodbus_line_set_debounce_period_us(skeleton,
+				g_gpiod_line_info_get_debounce_period_us(info));
+	gpiodbus_line_set_event_clock(skeleton,
+			map_clock(g_gpiod_line_info_get_event_clock(info)));
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+}
+
+static gint line_offset_cmp(gconstpointer a, gconstpointer b)
+{
+	GPIODBusObject *line_obj = (GPIODBusObject *)a;
+	GPIODBusLine *line;
+	const guint *offset = b;
+
+	line = gpiodbus_object_peek_line(line_obj);
+
+	return gpiodbus_line_get_offset(line) != *offset;
+}
+
+void gpiodbus_request_set_props(GPIODBusRequest *skeleton,
+				GPIODLineRequest *request, GPIODBusChip *chip,
+				GDBusObjectManager *line_manager)
+{
+	g_autolist(GPIODBusObject) line_objs = NULL;
+	g_autoptr(GStrvBuilder) builder = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_auto(GStrv) paths = NULL;
+	GList *found;
+	guint i;
+
+	offsets = g_gpiod_line_request_get_requested_offsets(request);
+	line_objs = g_dbus_object_manager_get_objects(line_manager);
+	builder = g_strv_builder_new();
+
+	for (i = 0; i < offsets->len; i++) {
+		found = g_list_find_custom(line_objs,
+					   &g_array_index(offsets, guint, i),
+					   line_offset_cmp);
+		if (found)
+			g_strv_builder_add(builder,
+					   g_dbus_object_get_object_path(
+						G_DBUS_OBJECT(found->data)));
+	}
+
+	paths = g_strv_builder_end(builder);
+
+	gpiodbus_request_set_chip_path(skeleton,
+			g_dbus_interface_skeleton_get_object_path(
+					G_DBUS_INTERFACE_SKELETON(chip)));
+	gpiodbus_request_set_line_paths(skeleton, (const gchar *const *)paths);
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+}
+
+static gboolean
+set_settings_from_variant(GPIODLineSettings *settings, const gchar *key,
+			  GVariant *val)
+{
+	GPIODLineDirection direction;
+	GPIODLineClock event_clock;
+	GPIODLineDrive drive;
+	GPIODLineEdge edge;
+	GPIODLineBias bias;
+	const gchar *str;
+
+	/* FIXME: Make it into a nice set of hashmaps and callbacks. */
+	if (g_strcmp0(key, "direction") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "input") == 0) {
+			direction = G_GPIOD_LINE_DIRECTION_INPUT;
+		} else if (g_strcmp0(str, "output") == 0) {
+			direction = G_GPIOD_LINE_DIRECTION_OUTPUT;
+		} else if (g_strcmp0(str, "as-is") == 0) {
+			direction = G_GPIOD_LINE_DIRECTION_AS_IS;
+		} else {
+			g_critical("invalid direction value received: '%s'",
+				   str);
+			return FALSE;
+		}
+
+		g_gpiod_line_settings_set_direction(settings, direction);
+	} else if (g_strcmp0(key, "edge") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "falling") == 0) {
+			edge = G_GPIOD_LINE_EDGE_FALLING;
+		} else if (g_strcmp0(str, "rising") == 0) {
+			edge = G_GPIOD_LINE_EDGE_RISING;
+		} else if (g_strcmp0(str, "both") == 0) {
+			edge = G_GPIOD_LINE_EDGE_BOTH;
+		} else {
+			g_critical("invalid edge value received: '%s'", str);
+			return FALSE;
+		}
+
+		g_gpiod_line_settings_set_edge_detection(settings, edge);
+	} else if (g_strcmp0(key, "active-low") == 0) {
+		if (g_variant_get_boolean(val))
+			g_gpiod_line_settings_set_active_low(settings, TRUE);
+	} else if (g_strcmp0(key, "bias") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "as-is") == 0) {
+			bias = G_GPIOD_LINE_BIAS_AS_IS;
+		} else if (g_strcmp0(str, "pull-up") == 0) {
+			bias = G_GPIOD_LINE_BIAS_PULL_UP;
+		} else if (g_strcmp0(str, "pull-down") == 0) {
+			bias = G_GPIOD_LINE_BIAS_PULL_DOWN;
+		} else if (g_strcmp0(str, "disabled") == 0) {
+			bias = G_GPIOD_LINE_BIAS_DISABLED;
+		} else {
+			g_critical("invalid bias value received: '%s'", str);
+			return FALSE;
+		}
+
+		g_gpiod_line_settings_set_bias(settings, bias);
+	} else if (g_strcmp0(key, "drive") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "push-pull") == 0) {
+			drive = G_GPIOD_LINE_DRIVE_PUSH_PULL;
+		} else if (g_strcmp0(str, "open-drain") == 0) {
+			drive = G_GPIOD_LINE_DRIVE_OPEN_DRAIN;
+		} else if (g_strcmp0(str, "open-source") == 0) {
+			drive = G_GPIOD_LINE_DRIVE_OPEN_SOURCE;
+		} else {
+			g_critical("invalid drive value received: '%s'", str);
+			return FALSE;
+		}
+
+		g_gpiod_line_settings_set_drive(settings, drive);
+	} else if (g_strcmp0(key, "debounce-period") == 0) {
+		g_gpiod_line_settings_set_debounce_period_us(settings,
+						g_variant_get_int64(val));
+	} else if (g_strcmp0(key, "event-clock") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "monotonic") == 0) {
+			event_clock = G_GPIOD_LINE_CLOCK_MONOTONIC;
+		} else if (g_strcmp0(str, "realtime") == 0) {
+			event_clock = G_GPIOD_LINE_CLOCK_REALTIME;
+		} else if (g_strcmp0(str, "hte") == 0) {
+			event_clock = G_GPIOD_LINE_CLOCK_HTE;
+		} else {
+			g_critical("invalid event clock value received: '%s'",
+				   str);
+			return FALSE;
+		}
+
+		g_gpiod_line_settings_set_event_clock(settings, event_clock);
+	} else {
+		g_critical("invalid config option received: '%s'", key);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GPIODLineConfig *gpiodbus_line_config_from_variant(GVariant *variant)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GVariant) output_values_v = NULL;
+	g_autoptr(GVariant) line_configs_v = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	GVariantIter iter0, iter1;
+	guint offset;
+	gboolean ret;
+	GVariant *v;
+	gchar *k;
+	gint val;
+
+	line_configs_v = g_variant_get_child_value(variant, 0);
+	output_values_v = g_variant_get_child_value(variant, 1);
+
+	config = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_variant_iter_init(&iter0, line_configs_v);
+	while ((v = g_variant_iter_next_value(&iter0))) {
+		g_autoptr(GVariant) line_settings_v = NULL;
+		g_autoptr(GVariant) line_config_v = v;
+		g_autoptr(GVariant) offsets_v = NULL;
+		g_autoptr(GArray) offsets = NULL;
+
+		offsets_v = g_variant_get_child_value(line_config_v, 0);
+		line_settings_v = g_variant_get_child_value(line_config_v, 1);
+
+		g_gpiod_line_settings_reset(settings);
+		g_variant_iter_init(&iter1, line_settings_v);
+		while (g_variant_iter_next(&iter1, "{sv}", &k, &v)) {
+			g_autoptr(GVariant) val = v;
+			g_autofree gchar *key = k;
+
+			ret = set_settings_from_variant(settings, key, val);
+			if (!ret)
+				return NULL;
+		}
+
+		offsets = g_array_sized_new(FALSE, TRUE, sizeof(guint),
+					    g_variant_n_children(offsets_v));
+		g_variant_iter_init(&iter1, offsets_v);
+		while (g_variant_iter_next(&iter1, "u", &offset))
+			g_array_append_val(offsets, offset);
+
+		ret = g_gpiod_line_config_add_line_settings(config, offsets,
+							    settings, &err);
+		if (!ret) {
+			g_critical("failed to add line settings: %s",
+				   err->message);
+			return NULL;
+		}
+	}
+
+	values = g_array_sized_new(FALSE, TRUE, sizeof(gint),
+				   g_variant_n_children(output_values_v));
+	g_variant_iter_init(&iter0, output_values_v);
+	while (g_variant_iter_next(&iter0, "i", &val))
+		g_array_append_val(values, val);
+
+	if (values->len > 0) {
+		ret = g_gpiod_line_config_set_output_values(config, values,
+							    &err);
+		if (!ret) {
+			g_critical("failed to set output values: %s",
+				   err->message);
+			return NULL;
+		}
+	}
+
+	return g_object_ref(config);
+}
+
+GPIODRequestConfig *gpiodbus_request_config_from_variant(GVariant *variant)
+{
+	g_autoptr(GPIODRequestConfig) config = NULL;
+	GVariantIter iter;
+	GVariant *v;
+	gchar *k;
+
+	config = g_gpiod_request_config_new(NULL);
+
+	g_variant_iter_init(&iter, variant);
+	while (g_variant_iter_next(&iter, "{sv}", &k, &v)) {
+		g_autoptr(GVariant) val = v;
+		g_autofree gchar *key = k;
+
+		if (g_strcmp0(key, "consumer") == 0) {
+			g_gpiod_request_config_set_consumer(config,
+					g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "event-buffer-size") == 0) {
+			g_gpiod_request_config_set_event_buffer_size(config,
+					g_variant_get_uint32(val));
+		} else {
+			g_critical("invalid request config option received: '%s'",
+				   key);
+			return NULL;
+		}
+	}
+
+	return g_object_ref(config);
+}
diff --git a/dbus/manager/helpers.h b/dbus/manager/helpers.h
new file mode 100644
index 0000000..03b3240
--- /dev/null
+++ b/dbus/manager/helpers.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_HELPERS_H__
+#define __GPIODBUS_HELPERS_H__
+
+#include <gio/gio.h>
+#include <gpiod-glib.h>
+#include <glib.h>
+#include <gpiodbus.h>
+
+gint gpiodbus_id_cmp(gconstpointer a, gconstpointer b, gpointer user_data);
+gint gpiodbus_id_alloc(GTree *id_root);
+void gpiodbus_id_free(GTree *id_root, gint id);
+gboolean
+gpiodbus_chip_set_props(GPIODBusChip *skeleton, GPIODChip *chip, GError **err);
+void gpiodbus_line_set_props(GPIODBusLine *skeleton, GPIODLineInfo *info);
+void gpiodbus_request_set_props(GPIODBusRequest *skeleton,
+				GPIODLineRequest *request, GPIODBusChip *chip,
+				GDBusObjectManager *line_manager);
+GPIODLineConfig *gpiodbus_line_config_from_variant(GVariant *variant);
+GPIODRequestConfig *gpiodbus_request_config_from_variant(GVariant *variant);
+
+#endif /* __GPIODBUS_HELPERS_H__ */
-- 
2.40.1


