Return-Path: <linux-gpio+bounces-8639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905394A3D9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09740284751
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467721D1750;
	Wed,  7 Aug 2024 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fuHInaLX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D71D173A
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021890; cv=none; b=gwqcoAnbpzx8JERCS8WtSsDQLgTvDz9RwE4weI7c2xm9hY8NFIQybx6kJZj41PRq+xx8SdRpzQ8GEHjBjUlY9KFIJcxPB+LrVsUrVqYw0EIsTkRFOCG+WOuBbjR5bzhZyoIDTYkV/tNaFmfIe8CzzoPW1PFllH6qUoqesu9yR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021890; c=relaxed/simple;
	bh=3TFqo13AgEuKldomFYatbNEwbrZT/6APEtn5z/hX7AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3ck/7zXeDpi47rD9l4bc2/Vnwwq9MHEuNI/sJdvp3XJtakK9d625qrZ1go30pfetMDrwZAsZa7GQ6GtyjeK6Pr9+5kqrNxpqo1oB9tc9N0y7WqantFS9/NydiTwqFVmIK41vyoZ1YVVVtYMXOTMBdFAWB7sMLnoEinb6OghK98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fuHInaLX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so10570735e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021885; x=1723626685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kemVWrdbvs1kI5VlAwptc4EOYKaJ+AE0jFBkx7w5Ts8=;
        b=fuHInaLXiM8qwrKRqaRVWZZY+fkeotWxkVqfBnbYWnC71cVRE/uPpEHTBt4nKC6dhN
         gMgqDqB2rlf5GO0Ox776QfU71dQY0HNnTx842YA4bQTSfIzayX7nSiPHJ141GEWBxIjv
         bBJ8SGGfYFmRI1EUYI27ylWXteLTi1zQFXdkGb2Z9IfDY/Ogfus5QFLnVNIkYRXhd9RH
         FJUGW96m73XKGcrR472fFDllAS3UHaLfSVME5EzL6DkRJ1A92DzdQKpRWbMgVUGJNffN
         MNfXXhuKqBvqMPdy9V8wlY64GL1Nl5ttficABjZKysFujet4A183oofEuo9R5dSt4t1T
         wj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021885; x=1723626685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kemVWrdbvs1kI5VlAwptc4EOYKaJ+AE0jFBkx7w5Ts8=;
        b=w75xIBYAAiSfnm6XqVCa0j32CGBG2v3F49oELOJXlUXkSfoUYyH5TXMu5MmEgR5gRG
         1MmpnnQQLHvdCQlNwrZBttyicT9+o/+ME2LJ7O/rArWBSdRKZa4V4stIFzSR7q+oLN6F
         A69GgVk2fdcEtPZeKQT0SY0czLLI2cNRTw/Ez6fWxzIvC6SMG3NLEc9WBpNhE5T8eCYJ
         0yIrgsn0mQpOEx9IB/gPzjCFZsfGpTi0J+irhAXxS+r+4WTJQD6Zz9E2rhXph9TcSl26
         0hSjhHM7CzlI9hiSSdOQMUcZsp8ZFORv7pyF9nn8aNTgwEMj1OFsaZsg0oK+D2v2H1Bf
         qVNQ==
X-Gm-Message-State: AOJu0YzyzPIieH32oEVcdldv8BHSt4X3WZxsiKxmT4MjFtPT28hEq5fL
	MmnB+gY2vdJQ3itpY6IVlblmtGAHezpA/q+4D33/x0j0fTilqMxhRX+MoMtHnv4=
X-Google-Smtp-Source: AGHT+IFf/WVOfZuqynfwaRBzl020tUNiI0wDl4S4zvIljuIv0SgnhPWK1gwUSqB9ucKNfKe6baFG1A==
X-Received: by 2002:a05:600c:1f8e:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-428e6b81f40mr121804675e9.26.1723021884706;
        Wed, 07 Aug 2024 02:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:44 +0200
Subject: [PATCH libgpiod v4 13/18] dbus: add gpio-manager code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-13-64ea80169e51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=47591;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RW1sY0D0WIxMYpE7Ks2Nsp+01rG4pJd+5KmbUv27kpA=;
 b=kA0DAAoBEacuoBRx13IByyZiAGazOhKhTTW+j1Xdr7lc20QQPq7wuugwJzEGpfkDIsBJuHlQj
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJmszoSAAoJEBGnLqAUcddyS1IQAKWd
 db3hJPN5TFSUBmB2vSoFXUErovrFDcWZ6E7Nqs7vkXk1NUvKrNca7ZwpyK7SxiU1wHJLX8Eky/E
 R5R0Mac0Xrz4eDtj97kXyj2eyGVQTGTm48y198fcUgb5GXZFsDfdxn9KzriaEtHSbV5fy5PJAQk
 zfdoMH6CAlZRSEgmVfuZ01ym7KwC27IRnDa7U5LPiP0sj7Gy9ez7mKrD9/KKeWHXW3NG8qCEKiW
 mZZ0/s2uqD7ajLesWq8nrZeyyqpNByrICrKmWfjwDhkMAhre/y84ok915PGtD4UOskIjcIQC8/I
 MpuZUPdPJDdUHUupUNEyvcrfc1/Dice0sLglRqAIE8dQ0P18b9WwW7H6xbSy8ISCFb3fWLA09fr
 /pM6JLw0Cz6CFgPZoVqY91T9FXsTZgSofoTDgreFhdK+fVfUmHZYcoXUynsAZGLVPq1gx+ZRFLW
 8Dn2w2RyYPZG+YIKouV5m9aVQw74+E+Xd/O/ytNo+YI3BlmIGUZdtlQ3isO7SCAagKZDf6gGeRF
 mMfL//5YEryrVp4+Lo4gAz8ptuTHV3lHBs/Y2AMhZwcA79TqUhbKPKU0EZHjPoC+zb4Cq8r7fOv
 rZkz0K0GZltIUMW3zeHY/hhioVQ4CnDMaDJEFA0g6FnhlOc3DoW8mcRyXGywx6+IwNf1xTKcwni
 TSkkd
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the code for the gpio-manager - the actual implementation of the
DBus API defined in io.gpiod1.xml.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/manager/daemon.c       | 821 ++++++++++++++++++++++++++++++++++++++++++++
 dbus/manager/daemon.h       |  22 ++
 dbus/manager/gpio-manager.c | 173 ++++++++++
 dbus/manager/helpers.c      | 431 +++++++++++++++++++++++
 dbus/manager/helpers.h      |  26 ++
 5 files changed, 1473 insertions(+)

diff --git a/dbus/manager/daemon.c b/dbus/manager/daemon.c
new file mode 100644
index 0000000..d6eb4a5
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
+struct _GpiodbusDaemon {
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
+G_DEFINE_TYPE(GpiodbusDaemon, gpiodbus_daemon, G_TYPE_OBJECT);
+
+typedef struct {
+	GpiodglibChip *chip;
+	GpiodbusChip *dbus_chip;
+	GpiodbusDaemon *daemon;
+	GDBusObjectManagerServer *line_manager;
+	GHashTable *lines;
+} GpiodbusDaemonChipData;
+
+typedef struct {
+	GpiodglibLineRequest *request;
+	GpiodbusRequest *dbus_request;
+	gint id;
+	GpiodbusDaemonChipData *chip_data;
+} GpiodbusDaemonRequestData;
+
+typedef struct {
+	GpiodbusLine *dbus_line;
+	GpiodbusDaemonChipData *chip_data;
+	GpiodbusDaemonRequestData *req_data;
+} GpiodbusDaemonLineData;
+
+static const gchar* const gpiodbus_daemon_udev_subsystems[] = { "gpio", NULL };
+
+static void gpiodbus_daemon_dispose(GObject *obj)
+{
+	GpiodbusDaemon *self = GPIODBUS_DAEMON(obj);
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
+	GpiodbusDaemon *self = GPIODBUS_DAEMON(obj);
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
+static void gpiodbus_daemon_class_init(GpiodbusDaemonClass *daemon_class)
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
+	GpiodbusDaemonChipData *chip_data = user_data;
+	GpiodbusDaemonRequestData *req_data = value;
+
+	return req_data->chip_data == chip_data;
+}
+
+static void gpiodbus_daemon_chip_data_free(gpointer data)
+{
+	GpiodbusDaemonChipData *chip_data = data;
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
+	GpiodbusDaemonLineData *line_data = data;
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
+static void gpiodbus_lines_set_managed(GpiodbusDaemonRequestData *req_data,
+				       gboolean managed)
+{
+	g_autoptr(GDBusObject) obj = NULL;
+	const gchar *const *line_paths;
+	GpiodbusLine *line;
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
+	GpiodbusDaemonRequestData *req_data = data;
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
+static void gpiodbus_daemon_init(GpiodbusDaemon *self)
+{
+	g_debug("initializing GPIO D-Bus daemon");
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
+GpiodbusDaemon *gpiodbus_daemon_new(void)
+{
+	return GPIODBUS_DAEMON(g_object_new(GPIODBUS_DAEMON_TYPE, NULL));
+}
+
+static void gpiodbus_daemon_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+					  GpiodglibInfoEvent *event,
+					  gpointer data)
+{
+	GpiodbusDaemonChipData *chip_data = data;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	GpiodbusDaemonLineData *line_data;
+	guint offset;
+
+	info = gpiodglib_info_event_get_line_info(event);
+	offset = gpiodglib_line_info_get_offset(info);
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
+static void gpiodbus_daemon_export_line(GpiodbusDaemon *self,
+					GpiodbusDaemonChipData *chip_data,
+					GpiodglibLineInfo *info)
+{
+	g_autofree GpiodbusDaemonLineData *line_data = NULL;
+	g_autoptr(GpiodbusObjectSkeleton) skeleton = NULL;
+	g_autoptr(GpiodbusLine) dbus_line = NULL;
+	g_autofree gchar *obj_path = NULL;
+	const gchar *obj_prefix;
+	guint line_offset;
+	gboolean ret;
+
+	obj_prefix = g_dbus_object_manager_get_object_path(
+				G_DBUS_OBJECT_MANAGER(chip_data->line_manager));
+	line_offset = gpiodglib_line_info_get_offset(info);
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
+static gboolean gpiodbus_daemon_export_lines(GpiodbusDaemon *self,
+					     GpiodbusDaemonChipData *chip_data)
+{
+	g_autoptr(GpiodglibChipInfo) chip_info = NULL;
+	GpiodglibChip *chip = chip_data->chip;
+	g_autoptr(GError) err = NULL;
+	guint i, num_lines;
+	gint j;
+
+	chip_info = gpiodglib_chip_get_info(chip, &err);
+	if (!chip_info) {
+		g_critical("failed to read chip info: %s", err->message);
+		return FALSE;
+	}
+
+	num_lines = gpiodglib_chip_info_get_num_lines(chip_info);
+
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(gpiodbus_daemon_on_info_event), chip_data);
+
+	for (i = 0; i < num_lines; i++) {
+		g_autoptr(GpiodglibLineInfo) linfo = NULL;
+
+		linfo = gpiodglib_chip_watch_line_info(chip, i, &err);
+		if (!linfo) {
+			g_critical("failed to setup a line-info watch: %s",
+				   err->message);
+			for (j = i; j >= 0; j--)
+				gpiodglib_chip_unwatch_line_info(chip, i, NULL);
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
+gpiodbus_daemon_handle_release_lines(GpiodbusRequest *request,
+				     GDBusMethodInvocation *invocation,
+				     gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
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
+gpiodbus_daemon_handle_reconfigure_lines(GpiodbusRequest *request,
+					 GDBusMethodInvocation *invocation,
+					 GVariant *arg_line_cfg,
+					 gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
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
+	ret = gpiodglib_line_request_reconfigure_lines(req_data->request,
+						       line_cfg, &err);
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
+gpiodbus_daemon_handle_get_values(GpiodbusRequest *request,
+				  GDBusMethodInvocation *invocation,
+				  GVariant *arg_offsets, gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
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
+		ret = gpiodglib_line_request_get_values(req_data->request,
+							&values, &err);
+	} else {
+		offsets = g_array_sized_new(FALSE, TRUE, sizeof(offset),
+					    num_offsets);
+		g_variant_iter_init(&iter, arg_offsets);
+		while (g_variant_iter_next(&iter, "u", &offset))
+			g_array_append_val(offsets, offset);
+
+		ret = gpiodglib_line_request_get_values_subset(
+				req_data->request, offsets, &values, &err);
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
+gpiodbus_daemon_handle_set_values(GpiodbusRequest *request,
+				  GDBusMethodInvocation *invocation,
+				  GVariant *arg_values, gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
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
+	ret = gpiodglib_line_request_set_values_subset(req_data->request,
+						       offsets, values, &err);
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
+gpiodbus_daemon_on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			      GpiodglibEdgeEvent *event, gpointer user_data)
+{
+	GpiodbusDaemonRequestData *req_data = user_data;
+	GpiodbusDaemonLineData *line_data;
+	gulong line_seqno, global_seqno;
+	GpiodglibEdgeEventType edge;
+	guint64 timestamp;
+	guint offset;
+	gint val;
+
+	edge = gpiodglib_edge_event_get_event_type(event);
+	offset = gpiodglib_edge_event_get_line_offset(event);
+	timestamp = gpiodglib_edge_event_get_timestamp_ns(event);
+	global_seqno = gpiodglib_edge_event_get_global_seqno(event);
+	line_seqno = gpiodglib_edge_event_get_line_seqno(event);
+
+	val = edge == GPIODGLIB_EDGE_EVENT_RISING_EDGE ? 1 : 0;
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
+gpiodbus_daemon_export_request(GpiodbusDaemon *self,
+			       GpiodglibLineRequest *request,
+			       GpiodbusDaemonChipData *chip_data, gint id)
+{
+	g_autofree GpiodbusDaemonRequestData *req_data = NULL;
+	g_autoptr(GpiodbusObjectSkeleton) skeleton = NULL;
+	g_autoptr(GpiodbusRequest) dbus_req = NULL;
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
+gpiodbus_daemon_handle_request_lines(GpiodbusChip *chip,
+				     GDBusMethodInvocation *invocation,
+				     GVariant *arg_line_cfg,
+				     GVariant *arg_req_cfg,
+				     gpointer user_data)
+{
+	GpiodbusDaemonChipData *chip_data = user_data;
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
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
+	request = gpiodglib_chip_request_lines(chip_data->chip, req_cfg,
+					      line_cfg, &err);
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
+static void gpiodbus_daemon_export_chip(GpiodbusDaemon *self, GUdevDevice *dev)
+{
+	g_autofree GpiodbusDaemonChipData *chip_data = NULL;
+	g_autoptr(GDBusObjectManagerServer) manager = NULL;
+	g_autoptr(GpiodbusObjectSkeleton) skeleton = NULL;
+	const gchar *devname, *devpath, *obj_prefix;
+	g_autoptr(GpiodbusChip) dbus_chip = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GHashTable) lines = NULL;
+	g_autofree gchar *obj_path = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	devname = g_udev_device_get_name(dev);
+	devpath = g_udev_device_get_device_file(dev);
+	obj_prefix = g_dbus_object_manager_get_object_path(
+				G_DBUS_OBJECT_MANAGER(self->chip_manager));
+
+	chip = gpiodglib_chip_new(devpath, &err);
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
+static void gpiodbus_daemon_unexport_chip(GpiodbusDaemon *self,
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
+	GpiodbusDaemon *self = data;
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
+	GpiodbusDaemon *daemon = user_data;
+	GUdevDevice *dev = data;
+
+	if (gpiodbus_daemon_is_gpiochip_device(dev))
+		gpiodbus_daemon_export_chip(daemon, dev);
+}
+
+void gpiodbus_daemon_start(GpiodbusDaemon *self, GDBusConnection *con)
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
index 0000000..716396d
--- /dev/null
+++ b/dbus/manager/daemon.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_DAEMON_H__
+#define __GPIODBUS_DAEMON_H__
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib-object.h>
+
+G_DECLARE_FINAL_TYPE(GpiodbusDaemon, gpiodbus_daemon,
+		     GPIODBUS, DAEMON, GObject);
+
+#define GPIODBUS_DAEMON_TYPE (gpiodbus_daemon_get_type())
+#define GPIODBUS_DAEMON(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), \
+	 GPIODBUS_DAEMON_TYPE, GpiodbusDaemon))
+
+GpiodbusDaemon *gpiodbus_daemon_new(void);
+void gpiodbus_daemon_start(GpiodbusDaemon *daemon, GDBusConnection *con);
+
+#endif /* __GPIODBUS_DAEMON_H__ */
diff --git a/dbus/manager/gpio-manager.c b/dbus/manager/gpio-manager.c
new file mode 100644
index 0000000..e07641d
--- /dev/null
+++ b/dbus/manager/gpio-manager.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib-unix.h>
+#include <gpiod-glib.h>
+#include <stdlib.h>
+
+#include "daemon.h"
+
+static const gchar *const debug_domains[] = {
+	"gpio-manager",
+	"gpiodglib",
+	NULL
+};
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
+	GpiodbusDaemon *daemon = data;
+
+	g_debug("D-Bus connection acquired");
+
+	gpiodbus_daemon_start(daemon, con);
+}
+
+static void on_name_acquired(GDBusConnection *con G_GNUC_UNUSED,
+			     const gchar *name, gpointer data G_GNUC_UNUSED)
+{
+	g_debug("D-Bus name acquired: '%s'", name);
+}
+
+static void on_name_lost(GDBusConnection *con,
+			 const gchar *name, gpointer data G_GNUC_UNUSED)
+{
+	g_debug("D-Bus name lost: '%s'", name);
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
+	g_print("%s (libgpiod) v%s\n", g_get_prgname(), gpiodglib_api_version());
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
+	g_option_context_set_summary(ctx, "D-Bus daemon managing GPIOs.");
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
+		g_log_writer_default_set_debug_domains(debug_domains);
+}
+
+int main(int argc, char **argv)
+{
+	g_autoptr(GpiodbusDaemon) daemon = NULL;
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
index 0000000..6e90460
--- /dev/null
+++ b/dbus/manager/helpers.c
@@ -0,0 +1,431 @@
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
+gpiodbus_chip_set_props(GpiodbusChip *skeleton, GpiodglibChip *chip,
+			GError **err)
+{
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autofree gchar *label = NULL;
+	g_autofree gchar *path = NULL;
+	g_autofree gchar *name = NULL;
+
+	info = gpiodglib_chip_get_info(chip, err);
+	if (!info)
+		return FALSE;
+
+	name = gpiodglib_chip_info_dup_name(info);
+	label = gpiodglib_chip_info_dup_label(info);
+
+	gpiodbus_chip_set_name(skeleton, name);
+	gpiodbus_chip_set_label(skeleton, label);
+	gpiodbus_chip_set_num_lines(skeleton,
+				    gpiodglib_chip_info_get_num_lines(info));
+	path = gpiodglib_chip_dup_path(chip);
+	gpiodbus_chip_set_path(skeleton, path);
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+
+	return TRUE;
+}
+
+static const gchar *map_direction(GpiodglibLineDirection direction)
+{
+	switch (direction) {
+	case GPIODGLIB_LINE_DIRECTION_INPUT:
+		return "input";
+	case GPIODGLIB_LINE_DIRECTION_OUTPUT:
+		return "output";
+	default:
+		g_error("invalid direction value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_edge(GpiodglibLineEdge edge)
+{
+	switch (edge) {
+	case GPIODGLIB_LINE_EDGE_NONE:
+		return "none";
+	case GPIODGLIB_LINE_EDGE_FALLING:
+		return "falling";
+	case GPIODGLIB_LINE_EDGE_RISING:
+		return "rising";
+	case GPIODGLIB_LINE_EDGE_BOTH:
+		return "both";
+	default:
+		g_error("invalid edge value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_bias(GpiodglibLineBias bias)
+{
+	switch (bias) {
+	case GPIODGLIB_LINE_BIAS_UNKNOWN:
+		return "unknown";
+	case GPIODGLIB_LINE_BIAS_DISABLED:
+		return "disabled";
+	case GPIODGLIB_LINE_BIAS_PULL_UP:
+		return "pull-up";
+	case GPIODGLIB_LINE_BIAS_PULL_DOWN:
+		return "pull-down";
+	default:
+		g_error("invalid bias value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_drive(GpiodglibLineDrive drive)
+{
+	switch (drive) {
+	case GPIODGLIB_LINE_DRIVE_PUSH_PULL:
+		return "push-pull";
+	case GPIODGLIB_LINE_DRIVE_OPEN_DRAIN:
+		return "open-drain";
+	case GPIODGLIB_LINE_DRIVE_OPEN_SOURCE:
+		return "open-source";
+	default:
+		g_error("invalid drive value returned by libgpiod-glib");
+	}
+}
+
+static const gchar *map_clock(GpiodglibLineClock event_clock)
+{
+	switch (event_clock) {
+	case GPIODGLIB_LINE_CLOCK_MONOTONIC:
+		return "monotonic";
+	case GPIODGLIB_LINE_CLOCK_REALTIME:
+		return "realtime";
+	case GPIODGLIB_LINE_CLOCK_HTE:
+		return "hte";
+	default:
+		g_error("invalid event clock value returned by libgpiod-glib");
+	}
+}
+
+void gpiodbus_line_set_props(GpiodbusLine *skeleton, GpiodglibLineInfo *info)
+{
+	g_autofree gchar *consumer = gpiodglib_line_info_dup_consumer(info);
+	g_autofree gchar *name = gpiodglib_line_info_dup_name(info);
+
+	gpiodbus_line_set_offset(skeleton,
+				 gpiodglib_line_info_get_offset(info));
+	gpiodbus_line_set_name(skeleton, name);
+	gpiodbus_line_set_used(skeleton, gpiodglib_line_info_is_used(info));
+	gpiodbus_line_set_consumer(skeleton, consumer);
+	gpiodbus_line_set_direction(skeleton,
+			map_direction(gpiodglib_line_info_get_direction(info)));
+	gpiodbus_line_set_edge_detection(skeleton,
+			map_edge(gpiodglib_line_info_get_edge_detection(info)));
+	gpiodbus_line_set_bias(skeleton,
+			       map_bias(gpiodglib_line_info_get_bias(info)));
+	gpiodbus_line_set_drive(skeleton,
+				map_drive(gpiodglib_line_info_get_drive(info)));
+	gpiodbus_line_set_active_low(skeleton,
+				     gpiodglib_line_info_is_active_low(info));
+	gpiodbus_line_set_debounced(skeleton,
+				    gpiodglib_line_info_is_debounced(info));
+	gpiodbus_line_set_debounce_period_us(skeleton,
+			gpiodglib_line_info_get_debounce_period_us(info));
+	gpiodbus_line_set_event_clock(skeleton,
+			map_clock(gpiodglib_line_info_get_event_clock(info)));
+	g_dbus_interface_skeleton_flush(G_DBUS_INTERFACE_SKELETON(skeleton));
+}
+
+static gint line_offset_cmp(gconstpointer a, gconstpointer b)
+{
+	GpiodbusObject *line_obj = (GpiodbusObject *)a;
+	GpiodbusLine *line;
+	const guint *offset = b;
+
+	line = gpiodbus_object_peek_line(line_obj);
+
+	return gpiodbus_line_get_offset(line) != *offset;
+}
+
+void gpiodbus_request_set_props(GpiodbusRequest *skeleton,
+				GpiodglibLineRequest *request, GpiodbusChip *chip,
+				GDBusObjectManager *line_manager)
+{
+	g_autolist(GpiodbusObject) line_objs = NULL;
+	g_autoptr(GStrvBuilder) builder = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_auto(GStrv) paths = NULL;
+	GList *found;
+	guint i;
+
+	offsets = gpiodglib_line_request_get_requested_offsets(request);
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
+set_settings_from_variant(GpiodglibLineSettings *settings, const gchar *key,
+			  GVariant *val)
+{
+	GpiodglibLineDirection direction;
+	GpiodglibLineClock event_clock;
+	GpiodglibLineDrive drive;
+	GpiodglibLineEdge edge;
+	GpiodglibLineBias bias;
+	const gchar *str;
+
+	/* FIXME: Make it into a nice set of hashmaps and callbacks. */
+	if (g_strcmp0(key, "direction") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "input") == 0) {
+			direction = GPIODGLIB_LINE_DIRECTION_INPUT;
+		} else if (g_strcmp0(str, "output") == 0) {
+			direction = GPIODGLIB_LINE_DIRECTION_OUTPUT;
+		} else if (g_strcmp0(str, "as-is") == 0) {
+			direction = GPIODGLIB_LINE_DIRECTION_AS_IS;
+		} else {
+			g_critical("invalid direction value received: '%s'",
+				   str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_direction(settings, direction);
+	} else if (g_strcmp0(key, "edge") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "falling") == 0) {
+			edge = GPIODGLIB_LINE_EDGE_FALLING;
+		} else if (g_strcmp0(str, "rising") == 0) {
+			edge = GPIODGLIB_LINE_EDGE_RISING;
+		} else if (g_strcmp0(str, "both") == 0) {
+			edge = GPIODGLIB_LINE_EDGE_BOTH;
+		} else {
+			g_critical("invalid edge value received: '%s'", str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_edge_detection(settings, edge);
+	} else if (g_strcmp0(key, "active-low") == 0) {
+		if (g_variant_get_boolean(val))
+			gpiodglib_line_settings_set_active_low(settings, TRUE);
+	} else if (g_strcmp0(key, "bias") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "as-is") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_AS_IS;
+		} else if (g_strcmp0(str, "pull-up") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_PULL_UP;
+		} else if (g_strcmp0(str, "pull-down") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_PULL_DOWN;
+		} else if (g_strcmp0(str, "disabled") == 0) {
+			bias = GPIODGLIB_LINE_BIAS_DISABLED;
+		} else {
+			g_critical("invalid bias value received: '%s'", str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_bias(settings, bias);
+	} else if (g_strcmp0(key, "drive") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "push-pull") == 0) {
+			drive = GPIODGLIB_LINE_DRIVE_PUSH_PULL;
+		} else if (g_strcmp0(str, "open-drain") == 0) {
+			drive = GPIODGLIB_LINE_DRIVE_OPEN_DRAIN;
+		} else if (g_strcmp0(str, "open-source") == 0) {
+			drive = GPIODGLIB_LINE_DRIVE_OPEN_SOURCE;
+		} else {
+			g_critical("invalid drive value received: '%s'", str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_drive(settings, drive);
+	} else if (g_strcmp0(key, "debounce-period") == 0) {
+		gpiodglib_line_settings_set_debounce_period_us(settings,
+						g_variant_get_int64(val));
+	} else if (g_strcmp0(key, "event-clock") == 0) {
+		str = g_variant_get_string(val, NULL);
+
+		if (g_strcmp0(str, "monotonic") == 0) {
+			event_clock = GPIODGLIB_LINE_CLOCK_MONOTONIC;
+		} else if (g_strcmp0(str, "realtime") == 0) {
+			event_clock = GPIODGLIB_LINE_CLOCK_REALTIME;
+		} else if (g_strcmp0(str, "hte") == 0) {
+			event_clock = GPIODGLIB_LINE_CLOCK_HTE;
+		} else {
+			g_critical("invalid event clock value received: '%s'",
+				   str);
+			return FALSE;
+		}
+
+		gpiodglib_line_settings_set_event_clock(settings, event_clock);
+	} else {
+		g_critical("invalid config option received: '%s'", key);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GpiodglibLineConfig *gpiodbus_line_config_from_variant(GVariant *variant)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
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
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
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
+		gpiodglib_line_settings_reset(settings);
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
+		ret = gpiodglib_line_config_add_line_settings(config, offsets,
+							      settings, &err);
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
+		ret = gpiodglib_line_config_set_output_values(config, values,
+							      &err);
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
+GpiodglibRequestConfig *gpiodbus_request_config_from_variant(GVariant *variant)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	GVariantIter iter;
+	GVariant *v;
+	gchar *k;
+
+	config = gpiodglib_request_config_new(NULL);
+
+	g_variant_iter_init(&iter, variant);
+	while (g_variant_iter_next(&iter, "{sv}", &k, &v)) {
+		g_autoptr(GVariant) val = v;
+		g_autofree gchar *key = k;
+
+		if (g_strcmp0(key, "consumer") == 0) {
+			gpiodglib_request_config_set_consumer(config,
+					g_variant_get_string(val, NULL));
+		} else if (g_strcmp0(key, "event-buffer-size") == 0) {
+			gpiodglib_request_config_set_event_buffer_size(config,
+						g_variant_get_uint32(val));
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
index 0000000..6ad83bd
--- /dev/null
+++ b/dbus/manager/helpers.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
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
+gpiodbus_chip_set_props(GpiodbusChip *skeleton, GpiodglibChip *chip,
+			GError **err);
+void gpiodbus_line_set_props(GpiodbusLine *skeleton, GpiodglibLineInfo *info);
+void gpiodbus_request_set_props(GpiodbusRequest *skeleton,
+				GpiodglibLineRequest *request,
+				GpiodbusChip *chip,
+				GDBusObjectManager *line_manager);
+GpiodglibLineConfig *gpiodbus_line_config_from_variant(GVariant *variant);
+GpiodglibRequestConfig *gpiodbus_request_config_from_variant(GVariant *variant);
+
+#endif /* __GPIODBUS_HELPERS_H__ */

-- 
2.43.0


