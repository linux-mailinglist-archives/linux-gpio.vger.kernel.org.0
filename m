Return-Path: <linux-gpio+bounces-8631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB494A3D1
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB90283978
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FF91D0DEB;
	Wed,  7 Aug 2024 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t6kzwrrJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1961C9EC8
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021857; cv=none; b=L0TTr9MmrGx0OqjfOVyT7yQBPp+KL84jysmxBqnSP8VsCZKaGVKUcxLDkDY0aW7GA+qL0ECye534hzWHQA/MJnCSbvDeTOgPdqu02I9Ko6tjIvWn5BNx0lULPlpEWcJKzrfSmJ7PCaS+oaVzd859a+DFG7lZV7Ocar/6BsZF/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021857; c=relaxed/simple;
	bh=TDlPXdQMueCBmTmPpSnKPuY7eK0T65yVlDwoGw4dhpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/AMr9ht+C9x6FbpLeeVQOqX7tieE04UjUd+erK3LNeWIPD+grxZvswzaZevAlG47s2y3pWH80Iny+7dOJaCGRUoKMZNEZUTBP2CmGNnv9G9RD6FDpeVBZ2JYqLC4lIgdWp5irTaJ2KXHv3bulbctlW78L7cjt/1mrsj+w934n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t6kzwrrJ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f1870c355cso16470831fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021851; x=1723626651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICJxrxAGHc0hWgP5vhwVgLrwmzvl3iIt6EyChH4hKAM=;
        b=t6kzwrrJS8e2tmBgaSaO0kktxu0ZcB+6zYkLeTCdUzjUkYK+NRhzlkV2q9H828MoEY
         sdoBmpLew+rC1i8rV8u9+jnBZLnIXzR30SC8GAUlPuyo8J3dASyB+RKddmshOnREZt7O
         Vazk5FQ4Dq2L8fD5m6Sy46YMCpnDNwc5lCr6caWP0lICSel/h9YAn1gz7t2Av5/R8r/S
         i9CCFogzjhHmVc3jSRAptrQtYshhSkgwiVTzZkOs9hg0iW01dlGIwlOBP3ESN0DJo86m
         n+iUh9O1NlW9mpu+uyIiiGkFuj63QuN66XNk6HBmHxjbTaZYzEWipIeNWxpWiwFzIm5/
         c4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021851; x=1723626651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICJxrxAGHc0hWgP5vhwVgLrwmzvl3iIt6EyChH4hKAM=;
        b=XuaYj+4KYi5WEa6yccdJk27DLWv6XfAL6IFFerD0YzRTBhqJZhbOo6mkilYAruJhg7
         1K1AlO/g8w1h7k4+A4KMmaZcYt5tylTQXINi229Kx8I1wIdHCMzN0tCYnvkRv9TwcY1F
         6/P6NZxkeRlK22dCn2cLDLJbYKfYBDQkHquNKw7JzXRvkJExlPM5qu/gFBT33LfxpJOe
         3ieWHqFse1MtR6+MIcgpy9tfIN1PLuqPoQ6WOH28ODfFFz/HCFzIOcSIf2YG3nYpV0oW
         Q5IrYHqlOaipi3qfFHkoQaxTcsX7OVcuKIlZQiAoAltog6FN8/BZyd57qdVbW3gbJR5E
         uFkA==
X-Gm-Message-State: AOJu0YyzaeZvCPPxaW3wMciYYxVNjHfzEIZAJ2d90aZIZxH9M285xLGT
	4BvFqp2xYbRM7etmHN0Ebl4OksIGw3GkAV7dXp0oFtMs7WxA9Qyg2KLHDctoSAH2UP+SWhK/wkt
	nm7o=
X-Google-Smtp-Source: AGHT+IFo+ZHbfr2iMzMCe8vbcTNGbNDvybQGV38Hb/ZjLgKHCbbnpQaO9Pq3IAZ6oZE1tWFY/WnhHw==
X-Received: by 2002:a2e:9b88:0:b0:2ef:320e:cbe9 with SMTP id 38308e7fff4ca-2f15aa84d50mr117167061fa.9.1723021850577;
        Wed, 07 Aug 2024 02:10:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:10:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:36 +0200
Subject: [PATCH libgpiod v4 05/18] bindings: glib: add core code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-5-64ea80169e51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=90238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DvK7EobztQvpPD1sHaGmD5xyiwdOZu2T3IBEcd/uk1A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoQwiHvFv/DMZuN1LFXk30V1IZbDWHvcX6Ul
 QX/b0/ePtWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EAAKCRARpy6gFHHX
 cntZD/9KOm/IsXQBJrmqM/gMZG8YyAV5EKIrvu4a/nXHRqcdH9xuwr+FakMb8HJqmgGRnXUvWkm
 N7Z36gaGNVpEOYYbs/P2N56IGl9ZbRiA1oU8sVV15GGuUs0sIcFJw2Tiy1A2GQN/XeknNMpufYW
 u+u/K1u04i7NQhC/+xT74bsCki3f7GjaelrypzhPOGeB2WxeNddPNYjW7Iowd7FAARXb4ZakJa5
 LHu28AaHNG0z1ZVrfGYD1gO+7WS69cxJqQNtfEcOnbZ4AKIsyZSWGB6bqvNTpjBeH5eRZ02tns0
 7QMXunOFKZ3wsRCusCZ5zY1LuSVsF3nXUPa4RoiNsfVzd0607jK/pgQv/mJk3QT7hdCZBwhvEIk
 YxMcolxZdTUri/KGcPTn4Z5sabfo8GFSRoTgYjBLpiRCwXJnHs50I3KT/vWwsW9bePrselKQo4Y
 8b9g/m+DZNAtrvK/I2fcLswGqm0FFGOebfT5ZWnXbKBcJKsWZS5E2G1SZd8w3Gvg1kHJMp/c99x
 YRjgdjpUKGxFZDq+CM9xjobFxxuIVlMBeT+AOn1Ob2UNwfUomHSUHVMRdqIBHG3jsRtxIbpllnT
 RDdi3Pk6cydN1WnrRJ8aPWzRB5pPzxRLo+g7lUSDKLwLuHY632Fuh4Awv2fZM42XIAc73VVTf7O
 vECEwx24FlheCaA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the files implementing the public API of the GLib bindings to
libgpiod.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/chip-info.c                | 129 +++++++++
 bindings/glib/chip.c                     | 397 +++++++++++++++++++++++++++
 bindings/glib/edge-event.c               | 186 +++++++++++++
 bindings/glib/error.c                    |  67 +++++
 bindings/glib/generated-enums.c.template |  43 +++
 bindings/glib/info-event.c               | 163 +++++++++++
 bindings/glib/internal.c                 | 327 ++++++++++++++++++++++
 bindings/glib/internal.h                 |  79 ++++++
 bindings/glib/line-config.c              | 193 +++++++++++++
 bindings/glib/line-info.c                | 342 +++++++++++++++++++++++
 bindings/glib/line-request.c             | 452 +++++++++++++++++++++++++++++++
 bindings/glib/line-settings.c            | 408 ++++++++++++++++++++++++++++
 bindings/glib/misc.c                     |  17 ++
 bindings/glib/request-config.c           | 170 ++++++++++++
 14 files changed, 2973 insertions(+)

diff --git a/bindings/glib/chip-info.c b/bindings/glib/chip-info.c
new file mode 100644
index 0000000..5c67018
--- /dev/null
+++ b/bindings/glib/chip-info.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibChipInfo:
+ *
+ * Represents an immutable snapshot of GPIO chip information.
+ */
+struct _GpiodglibChipInfo {
+	GObject parent_instance;
+	struct gpiod_chip_info *handle;
+};
+
+typedef enum {
+	GPIODGLIB_CHIP_INFO_PROP_NAME = 1,
+	GPIODGLIB_CHIP_INFO_PROP_LABEL,
+	GPIODGLIB_CHIP_INFO_PROP_NUM_LINES,
+} GpiodglibChipInfoProp;
+
+G_DEFINE_TYPE(GpiodglibChipInfo, gpiodglib_chip_info, G_TYPE_OBJECT);
+
+static void gpiodglib_chip_info_get_property(GObject *obj, guint prop_id,
+					     GValue *val, GParamSpec *pspec)
+{
+	GpiodglibChipInfo *self = GPIODGLIB_CHIP_INFO_OBJ(obj);
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibChipInfoProp)prop_id) {
+	case GPIODGLIB_CHIP_INFO_PROP_NAME:
+		g_value_set_string(val,
+				   gpiod_chip_info_get_name(self->handle));
+		break;
+	case GPIODGLIB_CHIP_INFO_PROP_LABEL:
+		g_value_set_string(val,
+				   gpiod_chip_info_get_label(self->handle));
+		break;
+	case GPIODGLIB_CHIP_INFO_PROP_NUM_LINES:
+		g_value_set_uint(val,
+			gpiod_chip_info_get_num_lines(self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_chip_info_finalize(GObject *obj)
+{
+	GpiodglibChipInfo *self = GPIODGLIB_CHIP_INFO_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_chip_info_free);
+
+	G_OBJECT_CLASS(gpiodglib_chip_info_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_chip_info_class_init(GpiodglibChipInfoClass *chip_info_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(chip_info_class);
+
+	class->get_property = gpiodglib_chip_info_get_property;
+	class->finalize = gpiodglib_chip_info_finalize;
+
+	/**
+	 * GpiodglibChipInfo:name:
+	 *
+	 * Name of this GPIO chip device.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_INFO_PROP_NAME,
+		g_param_spec_string("name", "Name",
+			"Name of this GPIO chip device.", NULL,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibChipInfo:label:
+	 *
+	 * Label of this GPIO chip device.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_INFO_PROP_LABEL,
+		g_param_spec_string("label", "Label",
+			"Label of this GPIO chip device.", NULL,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibChipInfo:num-lines:
+	 *
+	 * Number of GPIO lines exposed by this chip.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_INFO_PROP_NUM_LINES,
+		g_param_spec_uint("num-lines", "NumLines",
+			"Number of GPIO lines exposed by this chip.",
+			1, G_MAXUINT, 1,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_chip_info_init(GpiodglibChipInfo *self)
+{
+	self->handle = NULL;
+}
+
+gchar *gpiodglib_chip_info_dup_name(GpiodglibChipInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "name");
+}
+
+gchar *gpiodglib_chip_info_dup_label(GpiodglibChipInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "label");
+}
+
+guint gpiodglib_chip_info_get_num_lines(GpiodglibChipInfo *self)
+{
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "num-lines");
+}
+
+GpiodglibChipInfo *_gpiodglib_chip_info_new(struct gpiod_chip_info *handle)
+{
+	GpiodglibChipInfo *info;
+
+	info = GPIODGLIB_CHIP_INFO_OBJ(g_object_new(GPIODGLIB_CHIP_INFO_TYPE,
+						    NULL));
+	info->handle = handle;
+
+	return info;
+}
diff --git a/bindings/glib/chip.c b/bindings/glib/chip.c
new file mode 100644
index 0000000..d4c0e15
--- /dev/null
+++ b/bindings/glib/chip.c
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibChip:
+ *
+ * Represents a single GPIO chip.
+ */
+struct _GpiodglibChip {
+	GObject parent_instance;
+	GString *path;
+	GError *construct_err;
+	struct gpiod_chip *handle;
+	GSource *info_event_src;
+	guint info_event_src_id;
+};
+
+typedef enum {
+	GPIODGLIB_CHIP_PROP_PATH = 1,
+} GpiodglibChipProp;
+
+enum {
+	GPIODGLIB_CHIP_SIGNAL_INFO_EVENT,
+	GPIODGLIB_CHIP_SIGNAL_LAST,
+};
+
+static guint signals[GPIODGLIB_CHIP_SIGNAL_LAST];
+
+static void g_string_free_complete(GString *str)
+{
+	g_string_free(str, TRUE);
+}
+
+static gboolean
+gpiodglib_chip_on_info_event(GIOChannel *source G_GNUC_UNUSED,
+			     GIOCondition condition G_GNUC_UNUSED,
+			     gpointer data)
+{
+	g_autoptr(GpiodglibInfoEvent) event = NULL;
+	struct gpiod_info_event *event_handle;
+	GpiodglibChip *self = data;
+
+	event_handle = gpiod_chip_read_info_event(self->handle);
+	if (!event_handle)
+		return TRUE;
+
+	event = _gpiodglib_info_event_new(event_handle);
+
+	g_signal_emit(self, signals[GPIODGLIB_CHIP_SIGNAL_INFO_EVENT], 0,
+		      event);
+
+	return TRUE;
+}
+
+static gboolean
+gpiodglib_chip_initable_init(GInitable *initable,
+			     GCancellable *cancellable G_GNUC_UNUSED,
+			     GError **err)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(initable);
+
+	if (self->construct_err) {
+		g_propagate_error(err, g_steal_pointer(&self->construct_err));
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+static void gpiodglib_chip_initable_iface_init(GInitableIface *iface)
+{
+	iface->init = gpiodglib_chip_initable_init;
+}
+
+G_DEFINE_TYPE_WITH_CODE(GpiodglibChip, gpiodglib_chip, G_TYPE_OBJECT,
+			G_IMPLEMENT_INTERFACE(
+				G_TYPE_INITABLE,
+				gpiodglib_chip_initable_iface_init));
+
+static void gpiodglib_chip_constructed(GObject *obj)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+	g_autoptr(GIOChannel) channel = NULL;
+
+	g_assert(!self->handle);
+	g_assert(self->path);
+
+	self->handle = gpiod_chip_open(self->path->str);
+	if (!self->handle) {
+		_gpiodglib_set_error_from_errno(&self->construct_err,
+					       "unable to open GPIO chip '%s'",
+					       self->path->str);
+		return;
+	}
+
+	channel = g_io_channel_unix_new(gpiod_chip_get_fd(self->handle));
+	self->info_event_src = g_io_create_watch(channel, G_IO_IN);
+	g_source_set_callback(self->info_event_src,
+			      G_SOURCE_FUNC(gpiodglib_chip_on_info_event),
+			      self, NULL);
+	self->info_event_src_id = g_source_attach(self->info_event_src, NULL);
+
+	G_OBJECT_CLASS(gpiodglib_chip_parent_class)->constructed(obj);
+}
+
+static void gpiodglib_chip_get_property(GObject *obj, guint prop_id,
+					GValue *val, GParamSpec *pspec)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	switch ((GpiodglibChipProp)prop_id) {
+	case GPIODGLIB_CHIP_PROP_PATH:
+		g_value_set_string(val, self->path->str);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_chip_set_property(GObject *obj, guint prop_id,
+					const GValue *val, GParamSpec *pspec)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	switch ((GpiodglibChipProp)prop_id) {
+	case GPIODGLIB_CHIP_PROP_PATH:
+		self->path = g_string_new(g_value_get_string(val));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+void gpiodglib_chip_close(GpiodglibChip *self)
+{
+	g_clear_pointer(&self->info_event_src, g_source_unref);
+	g_clear_pointer(&self->handle, gpiod_chip_close);
+}
+
+static void gpiodglib_chip_dispose(GObject *obj)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	if (self->info_event_src_id)
+		g_source_remove(self->info_event_src_id);
+
+	gpiodglib_chip_close(self);
+
+	G_OBJECT_CLASS(gpiodglib_chip_parent_class)->dispose(obj);
+}
+
+static void gpiodglib_chip_finalize(GObject *obj)
+{
+	GpiodglibChip *self = GPIODGLIB_CHIP_OBJ(obj);
+
+	g_clear_error(&self->construct_err);
+	g_clear_pointer(&self->path, g_string_free_complete);
+
+	G_OBJECT_CLASS(gpiodglib_chip_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_chip_class_init(GpiodglibChipClass *chip_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(chip_class);
+
+	class->constructed = gpiodglib_chip_constructed;
+	class->get_property = gpiodglib_chip_get_property;
+	class->set_property = gpiodglib_chip_set_property;
+	class->dispose = gpiodglib_chip_dispose;
+	class->finalize = gpiodglib_chip_finalize;
+
+	/**
+	 * GpiodglibChip:path:
+	 *
+	 * Path that was used to open this GPIO chip.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_CHIP_PROP_PATH,
+		g_param_spec_string("path", "Path",
+			"Path to the GPIO chip device used to create this chip.",
+			NULL,
+			G_PARAM_CONSTRUCT_ONLY |
+			G_PARAM_READWRITE |
+			G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibChip::info-event:
+	 * @chip: #GpiodglibChip receiving the event
+	 * @event: The #GpiodglibInfoEvent
+	 *
+	 * Emitted when the state of a watched GPIO line changes.
+	 */
+	signals[GPIODGLIB_CHIP_SIGNAL_INFO_EVENT] =
+				g_signal_new("info-event",
+					     G_TYPE_FROM_CLASS(chip_class),
+					     G_SIGNAL_RUN_LAST,
+					     0,
+					     NULL,
+					     NULL,
+					     g_cclosure_marshal_generic,
+					     G_TYPE_NONE,
+					     1,
+					     GPIODGLIB_INFO_EVENT_TYPE);
+}
+
+static void gpiodglib_chip_init(GpiodglibChip *self)
+{
+	self->path = NULL;
+	self->construct_err = NULL;
+	self->handle = NULL;
+	self->info_event_src = NULL;
+	self->info_event_src_id = 0;
+}
+
+GpiodglibChip *gpiodglib_chip_new(const gchar *path, GError **err)
+{
+	return GPIODGLIB_CHIP_OBJ(g_initable_new(GPIODGLIB_CHIP_TYPE, NULL, err,
+						 "path", path, NULL));
+}
+
+gboolean gpiodglib_chip_is_closed(GpiodglibChip *self)
+{
+	return !self->handle;
+}
+
+gchar *gpiodglib_chip_dup_path(GpiodglibChip *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "path");
+}
+
+static void set_err_chip_closed(GError **err)
+{
+	g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_CHIP_CLOSED,
+		    "Chip was closed and cannot be used");
+}
+
+GpiodglibChipInfo *gpiodglib_chip_get_info(GpiodglibChip *self, GError **err)
+{
+	struct gpiod_chip_info *info;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	info = gpiod_chip_get_info(self->handle);
+	if (!info) {
+		_gpiodglib_set_error_from_errno(err,
+			"unable to retrieve GPIO chip information");
+		return NULL;
+	}
+
+	return _gpiodglib_chip_info_new(info);
+}
+
+static GpiodglibLineInfo *
+gpiodglib_chip_do_get_line_info(GpiodglibChip *self, guint offset, GError **err,
+			struct gpiod_line_info *(*func)(struct gpiod_chip *,
+							unsigned int),
+			const gchar *err_action)
+{
+	struct gpiod_line_info *info;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	info = func(self->handle, offset);
+	if (!info) {
+		_gpiodglib_set_error_from_errno(err, "unable to %s for offset %u",
+						err_action, offset);
+		return NULL;
+	}
+
+	return _gpiodglib_line_info_new(info);
+}
+
+GpiodglibLineInfo *
+gpiodglib_chip_get_line_info(GpiodglibChip *self, guint offset, GError **err)
+{
+	return gpiodglib_chip_do_get_line_info(self, offset, err,
+					       gpiod_chip_get_line_info,
+					       "retrieve GPIO line-info");
+}
+
+GpiodglibLineInfo *
+gpiodglib_chip_watch_line_info(GpiodglibChip *self, guint offset, GError **err)
+{
+	return gpiodglib_chip_do_get_line_info(self, offset, err,
+					       gpiod_chip_watch_line_info,
+					       "setup a line-info watch");
+}
+
+gboolean
+gpiodglib_chip_unwatch_line_info(GpiodglibChip *self, guint offset,
+				 GError **err)
+{
+	int ret;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return FALSE;
+	}
+
+	ret = gpiod_chip_unwatch_line_info(self->handle, offset);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+			    "unable to unwatch line-info events for offset %u",
+			    offset);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean
+gpiodglib_chip_get_line_offset_from_name(GpiodglibChip *self, const gchar *name,
+					 guint *offset, GError **err)
+{
+	gint ret;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return FALSE;
+	}
+
+	if (!name) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "name must not be NULL");
+		return FALSE;
+	}
+
+	ret = gpiod_chip_get_line_offset_from_name(self->handle, name);
+	if (ret < 0) {
+		if (errno != ENOENT)
+			_gpiodglib_set_error_from_errno(err,
+				    "failed to map line name to offset");
+		else
+			errno = 0;
+
+		return FALSE;
+	}
+
+	if (offset)
+		*offset = ret;
+
+	return TRUE;
+}
+
+GpiodglibLineRequest *
+gpiodglib_chip_request_lines(GpiodglibChip *self,
+			     GpiodglibRequestConfig *req_cfg,
+			     GpiodglibLineConfig *line_cfg, GError **err)
+{
+	struct gpiod_request_config *req_cfg_handle;
+	struct gpiod_line_config *line_cfg_handle;
+	struct gpiod_line_request *req;
+
+	g_assert(self);
+
+	if (gpiodglib_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	if (!line_cfg) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "line-config is required for request");
+		return NULL;
+	}
+
+	req_cfg_handle = req_cfg ?
+		_gpiodglib_request_config_get_handle(req_cfg) : NULL;
+	line_cfg_handle = _gpiodglib_line_config_get_handle(line_cfg);
+
+	req = gpiod_chip_request_lines(self->handle,
+				       req_cfg_handle, line_cfg_handle);
+	if (!req) {
+		_gpiodglib_set_error_from_errno(err,
+				"failed to request GPIO lines");
+		return NULL;
+	}
+
+	return _gpiodglib_line_request_new(req);
+}
diff --git a/bindings/glib/edge-event.c b/bindings/glib/edge-event.c
new file mode 100644
index 0000000..a7791c7
--- /dev/null
+++ b/bindings/glib/edge-event.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibEdgeEvent:
+ *
+ * #GpiodglibEdgeEvent stores information about a single line edge event.
+ * It contains the event type, timestamp and the offset of the line on which
+ * the event occurred as well as two sequence numbers (global for all lines
+ * in the associated request and local for this line only).
+ */
+struct _GpiodglibEdgeEvent {
+	GObject parent_instance;
+	struct gpiod_edge_event *handle;
+};
+
+typedef enum {
+	GPIODGLIB_EDGE_EVENT_PROP_EVENT_TYPE = 1,
+	GPIODGLIB_EDGE_EVENT_PROP_TIMESTAMP_NS,
+	GPIODGLIB_EDGE_EVENT_PROP_LINE_OFFSET,
+	GPIODGLIB_EDGE_EVENT_PROP_GLOBAL_SEQNO,
+	GPIODGLIB_EDGE_EVENT_PROP_LINE_SEQNO,
+} GpiodglibEdgeEventProp;
+
+G_DEFINE_TYPE(GpiodglibEdgeEvent, gpiodglib_edge_event, G_TYPE_OBJECT);
+
+static void gpiodglib_edge_event_get_property(GObject *obj, guint prop_id,
+					      GValue *val, GParamSpec *pspec)
+{
+	GpiodglibEdgeEvent *self = GPIODGLIB_EDGE_EVENT_OBJ(obj);
+	GpiodglibEdgeEventType type;
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibEdgeEventProp)prop_id) {
+	case GPIODGLIB_EDGE_EVENT_PROP_EVENT_TYPE:
+		type = _gpiodglib_edge_event_type_from_library(
+				gpiod_edge_event_get_event_type(self->handle));
+		g_value_set_enum(val, type);
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_TIMESTAMP_NS:
+		g_value_set_uint64(val,
+			gpiod_edge_event_get_timestamp_ns(self->handle));
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_LINE_OFFSET:
+		g_value_set_uint(val,
+			gpiod_edge_event_get_line_offset(self->handle));
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_GLOBAL_SEQNO:
+		g_value_set_ulong(val,
+			gpiod_edge_event_get_global_seqno(self->handle));
+		break;
+	case GPIODGLIB_EDGE_EVENT_PROP_LINE_SEQNO:
+		g_value_set_ulong(val,
+			gpiod_edge_event_get_line_seqno(self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_edge_event_finalize(GObject *obj)
+{
+	GpiodglibEdgeEvent *self = GPIODGLIB_EDGE_EVENT_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_edge_event_free);
+
+	G_OBJECT_CLASS(gpiodglib_edge_event_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_edge_event_class_init(GpiodglibEdgeEventClass *edge_event_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(edge_event_class);
+
+	class->get_property = gpiodglib_edge_event_get_property;
+	class->finalize = gpiodglib_edge_event_finalize;
+
+	/**
+	 * GpiodglibEdgeEvent:event-type:
+	 *
+	 * Type of the edge event.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_EVENT_TYPE,
+		g_param_spec_enum("event-type", "Event Type",
+			"Type of the edge event.",
+			GPIODGLIB_EDGE_EVENT_TYPE_TYPE,
+			GPIODGLIB_EDGE_EVENT_RISING_EDGE,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:timestamp-ns:
+	 *
+	 * Timestamp of the edge event expressed in nanoseconds.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_TIMESTAMP_NS,
+		g_param_spec_uint64("timestamp-ns",
+			"Timestamp (in nanoseconds)",
+			"Timestamp of the edge event expressed in nanoseconds.",
+			0, G_MAXUINT64, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:line-offset:
+	 *
+	 * Offset of the line on which this event was registered.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_LINE_OFFSET,
+		g_param_spec_uint("line-offset", "Line Offset",
+			"Offset of the line on which this event was registered.",
+			0, G_MAXUINT, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:global-seqno:
+	 *
+	 * Global sequence number of this event.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_GLOBAL_SEQNO,
+		g_param_spec_ulong("global-seqno", "Global Sequence Number",
+			"Global sequence number of this event.",
+			0, G_MAXULONG, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibEdgeEvent:line-seqno:
+	 *
+	 * Event sequence number specific to the line.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_EDGE_EVENT_PROP_LINE_SEQNO,
+		g_param_spec_ulong("line-seqno", "Line Sequence Number",
+			"Event sequence number specific to the line.",
+			0, G_MAXULONG, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_edge_event_init(GpiodglibEdgeEvent *self)
+{
+	self->handle = NULL;
+}
+
+GpiodglibEdgeEventType
+gpiodglib_edge_event_get_event_type(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-type");
+}
+
+guint64 gpiodglib_edge_event_get_timestamp_ns(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_uint64(G_OBJECT(self), "timestamp-ns");
+}
+
+guint gpiodglib_edge_event_get_line_offset(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "line-offset");
+}
+
+gulong gpiodglib_edge_event_get_global_seqno(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_ulong(G_OBJECT(self), "global-seqno");
+}
+
+gulong gpiodglib_edge_event_get_line_seqno(GpiodglibEdgeEvent *self)
+{
+	return _gpiodglib_get_prop_ulong(G_OBJECT(self), "line-seqno");
+}
+
+GpiodglibEdgeEvent *_gpiodglib_edge_event_new(struct gpiod_edge_event *handle)
+{
+	GpiodglibEdgeEvent *event;
+
+	event = GPIODGLIB_EDGE_EVENT_OBJ(
+			g_object_new(GPIODGLIB_EDGE_EVENT_TYPE, NULL));
+	event->handle = handle;
+
+	return event;
+}
diff --git a/bindings/glib/error.c b/bindings/glib/error.c
new file mode 100644
index 0000000..cc0250a
--- /dev/null
+++ b/bindings/glib/error.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdarg.h>
+
+G_DEFINE_QUARK(g-gpiod-error, gpiodglib_error)
+
+static GpiodglibError error_from_errno(void)
+{
+	switch (errno) {
+	case EPERM:
+		return GPIODGLIB_ERR_PERM;
+	case ENOENT:
+		return GPIODGLIB_ERR_NOENT;
+	case EINTR:
+		return GPIODGLIB_ERR_INTR;
+	case EIO:
+		return GPIODGLIB_ERR_IO;
+	case ENXIO:
+		return GPIODGLIB_ERR_NXIO;
+	case E2BIG:
+		return GPIODGLIB_ERR_E2BIG;
+	case EBADFD:
+		return GPIODGLIB_ERR_BADFD;
+	case ECHILD:
+		return GPIODGLIB_ERR_CHILD;
+	case EAGAIN:
+		return GPIODGLIB_ERR_AGAIN;
+	case ENOMEM:
+		/* Special case - as a convention GLib just aborts on ENOMEM. */
+		g_error("out of memory");
+	case EACCES:
+		return GPIODGLIB_ERR_ACCES;
+	case EFAULT:
+		return GPIODGLIB_ERR_FAULT;
+	case EBUSY:
+		return GPIODGLIB_ERR_BUSY;
+	case EEXIST:
+		return GPIODGLIB_ERR_EXIST;
+	case ENODEV:
+		return GPIODGLIB_ERR_NODEV;
+	case EINVAL:
+		return GPIODGLIB_ERR_INVAL;
+	case ENOTTY:
+		return GPIODGLIB_ERR_NOTTY;
+	case EPIPE:
+		return GPIODGLIB_ERR_PIPE;
+	default:
+		return GPIODGLIB_ERR_FAILED;
+	}
+}
+
+void _gpiodglib_set_error_from_errno(GError **err, const gchar *fmt, ...)
+{
+	g_autofree gchar *msg = NULL;
+	va_list va;
+
+	va_start(va, fmt);
+	msg = g_strdup_vprintf(fmt, va);
+	va_end(va);
+
+	g_set_error(err, GPIODGLIB_ERROR, error_from_errno(),
+		    "%s: %s", msg, g_strerror(errno));
+}
diff --git a/bindings/glib/generated-enums.c.template b/bindings/glib/generated-enums.c.template
new file mode 100644
index 0000000..c124eb7
--- /dev/null
+++ b/bindings/glib/generated-enums.c.template
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*** BEGIN file-header ***/
+
+#include <gpiod-glib.h>
+
+/*** END file-header ***/
+
+/*** BEGIN file-production ***/
+
+/* enumerations from "@basename@" */
+
+/*** END file-production ***/
+
+/*** BEGIN value-header ***/
+
+GType @enum_name@_get_type(void)
+{
+	static gsize static_g_@type@_type_id;
+
+	if (g_once_init_enter(&static_g_@type@_type_id)) {
+		static const G@Type@Value values[] = {
+/*** END value-header ***/
+
+/*** BEGIN value-production ***/
+			{@VALUENAME@, "@VALUENAME@", "@valuenick@"},
+/*** END value-production ***/
+
+/*** BEGIN value-tail ***/
+			{ 0, NULL, NULL }
+		};
+
+		GType g_@type@_type_id = g_@type@_register_static(
+				g_intern_static_string("@EnumName@"), values);
+
+		g_once_init_leave (&static_g_@type@_type_id, g_@type@_type_id);
+	}
+
+	return static_g_@type@_type_id;
+}
+
+/*** END value-tail ***/
diff --git a/bindings/glib/info-event.c b/bindings/glib/info-event.c
new file mode 100644
index 0000000..1c339db
--- /dev/null
+++ b/bindings/glib/info-event.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibInfoEvent:
+ *
+ * #GpiodglibInfoEvent contains information about the event itself (timestamp,
+ * type) as well as a snapshot of line's status in the form of a line-info
+ * object.
+ */
+struct _GpiodglibInfoEvent {
+	GObject parent_instance;
+	struct gpiod_info_event *handle;
+	GpiodglibLineInfo *info;
+};
+
+typedef enum {
+	GPIODGLIB_INFO_EVENT_PROP_EVENT_TYPE = 1,
+	GPIODGLIB_INFO_EVENT_PROP_TIMESTAMP,
+	GPIODGLIB_INFO_EVENT_PROP_LINE_INFO,
+} GpiodglibInfoEventProp;
+
+G_DEFINE_TYPE(GpiodglibInfoEvent, gpiodglib_info_event, G_TYPE_OBJECT);
+
+static void gpiodglib_info_event_get_property(GObject *obj, guint prop_id,
+					      GValue *val, GParamSpec *pspec)
+{
+	GpiodglibInfoEvent *self = GPIODGLIB_INFO_EVENT_OBJ(obj);
+	struct gpiod_line_info *info, *cpy;
+	GpiodglibInfoEventType type;
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibInfoEventProp)prop_id) {
+	case GPIODGLIB_INFO_EVENT_PROP_EVENT_TYPE:
+		type = _gpiodglib_info_event_type_from_library(
+				gpiod_info_event_get_event_type(self->handle));
+		g_value_set_enum(val, type);
+		break;
+	case GPIODGLIB_INFO_EVENT_PROP_TIMESTAMP:
+		g_value_set_uint64(val,
+			gpiod_info_event_get_timestamp_ns(self->handle));
+		break;
+	case GPIODGLIB_INFO_EVENT_PROP_LINE_INFO:
+		if (!self->info) {
+			info = gpiod_info_event_get_line_info(self->handle);
+			cpy = gpiod_line_info_copy(info);
+			if (!cpy)
+				g_error("Failed to allocate memory for line-info object");
+
+			self->info = _gpiodglib_line_info_new(cpy);
+		}
+
+		g_value_set_object(val, self->info);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_info_event_dispose(GObject *obj)
+{
+	GpiodglibInfoEvent *self = GPIODGLIB_INFO_EVENT_OBJ(obj);
+
+	g_clear_object(&self->info);
+
+	G_OBJECT_CLASS(gpiodglib_info_event_parent_class)->dispose(obj);
+}
+
+static void gpiodglib_info_event_finalize(GObject *obj)
+{
+	GpiodglibInfoEvent *self = GPIODGLIB_INFO_EVENT_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_info_event_free);
+
+	G_OBJECT_CLASS(gpiodglib_info_event_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_info_event_class_init(GpiodglibInfoEventClass *info_event_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(info_event_class);
+
+	class->get_property = gpiodglib_info_event_get_property;
+	class->dispose = gpiodglib_info_event_dispose;
+	class->finalize = gpiodglib_info_event_finalize;
+
+	/**
+	 * GpiodglibInfoEvent:event-type
+	 *
+	 * Type of the info event. One of @GPIODGLIB_INFO_EVENT_LINE_REQUESTED,
+	 * @GPIODGLIB_INFO_EVENT_LINE_RELEASED or
+	 * @GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_INFO_EVENT_PROP_EVENT_TYPE,
+		g_param_spec_enum("event-type", "Event Type",
+			"Type of the info event.",
+			GPIODGLIB_INFO_EVENT_TYPE_TYPE,
+			GPIODGLIB_INFO_EVENT_LINE_REQUESTED,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibInfoEvent:timestamp-ns
+	 *
+	 * Timestamp (in nanoseconds).
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_INFO_EVENT_PROP_TIMESTAMP,
+		g_param_spec_uint64("timestamp-ns",
+			"Timestamp (in nanoseconds).",
+			"Timestamp of the info event expressed in nanoseconds.",
+			0, G_MAXUINT64, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibInfoEvent:line-info
+	 *
+	 * New line-info snapshot associated with this info event.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_INFO_EVENT_PROP_LINE_INFO,
+		g_param_spec_object("line-info", "Line Info",
+			"New line-info snapshot associated with this info event.",
+			GPIODGLIB_LINE_INFO_TYPE,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_info_event_init(GpiodglibInfoEvent *self)
+{
+	self->handle = NULL;
+	self->info = NULL;
+}
+
+GpiodglibInfoEventType gpiodglib_info_event_get_event_type(GpiodglibInfoEvent *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-type");
+}
+
+guint64 gpiodglib_info_event_get_timestamp_ns(GpiodglibInfoEvent *self)
+{
+	return _gpiodglib_get_prop_uint64(G_OBJECT(self), "timestamp-ns");
+}
+
+GpiodglibLineInfo *gpiodglib_info_event_get_line_info(GpiodglibInfoEvent *self)
+{
+	return GPIODGLIB_LINE_INFO_OBJ(
+			_gpiodglib_get_prop_object(G_OBJECT(self), "line-info"));
+}
+
+GpiodglibInfoEvent *_gpiodglib_info_event_new(struct gpiod_info_event *handle)
+{
+	GpiodglibInfoEvent *event;
+
+	event = GPIODGLIB_INFO_EVENT_OBJ(
+			g_object_new(GPIODGLIB_INFO_EVENT_TYPE, NULL));
+	event->handle = handle;
+
+	return event;
+}
diff --git a/bindings/glib/internal.c b/bindings/glib/internal.c
new file mode 100644
index 0000000..6898637
--- /dev/null
+++ b/bindings/glib/internal.c
@@ -0,0 +1,327 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "internal.h"
+
+#define get_prop(_obj, _prop, _type) \
+	({ \
+		_type _ret; \
+		g_object_get(_obj, _prop, &_ret, NULL); \
+		_ret; \
+	})
+
+G_GNUC_INTERNAL gchar *
+_gpiodglib_dup_prop_string(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gchar *);
+}
+
+G_GNUC_INTERNAL gboolean
+_gpiodglib_get_prop_bool(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gboolean);
+}
+
+G_GNUC_INTERNAL gint _gpiodglib_get_prop_enum(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gint);
+}
+
+G_GNUC_INTERNAL guint _gpiodglib_get_prop_uint(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, guint);
+}
+
+G_GNUC_INTERNAL guint64
+_gpiodglib_get_prop_uint64(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, guint64);
+}
+
+G_GNUC_INTERNAL gulong _gpiodglib_get_prop_ulong(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gulong);
+}
+
+G_GNUC_INTERNAL GTimeSpan
+_gpiodglib_get_prop_timespan(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, GTimeSpan);
+}
+
+G_GNUC_INTERNAL GObject *
+_gpiodglib_get_prop_object(GObject *obj, const gchar *prop)
+{
+	return G_OBJECT(get_prop(obj, prop, gpointer));
+}
+
+G_GNUC_INTERNAL gpointer
+_gpiodglib_get_prop_pointer(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gpointer);
+}
+
+G_GNUC_INTERNAL gpointer
+_gpiodglib_get_prop_boxed_array(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gpointer);
+}
+
+#define set_prop(_obj, _prop, _val) \
+	do { \
+		g_object_set(_obj, _prop, _val, NULL); \
+	} while (0)
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_uint(GObject *obj, const gchar *prop, guint val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_string(GObject *obj, const gchar *prop, const gchar *val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_enum(GObject *obj, const gchar *prop, gint val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_bool(GObject *obj, const gchar *prop, gboolean val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL void
+_gpiodglib_set_prop_timespan(GObject *obj, const gchar *prop, GTimeSpan val)
+{
+	set_prop(obj, prop, val);
+}
+
+G_GNUC_INTERNAL GpiodglibLineDirection
+_gpiodglib_line_direction_from_library(enum gpiod_line_direction direction,
+				       gboolean allow_as_is)
+{
+	switch (direction) {
+	case GPIOD_LINE_DIRECTION_AS_IS:
+		if (allow_as_is)
+			return GPIODGLIB_LINE_DIRECTION_AS_IS;
+		break;
+	case GPIOD_LINE_DIRECTION_INPUT:
+		return GPIODGLIB_LINE_DIRECTION_INPUT;
+	case GPIOD_LINE_DIRECTION_OUTPUT:
+		return GPIODGLIB_LINE_DIRECTION_OUTPUT;
+	}
+
+	g_error("invalid line direction value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineEdge
+_gpiodglib_line_edge_from_library(enum gpiod_line_edge edge)
+{
+	switch (edge) {
+	case GPIOD_LINE_EDGE_NONE:
+		return GPIODGLIB_LINE_EDGE_NONE;
+	case GPIOD_LINE_EDGE_RISING:
+		return GPIODGLIB_LINE_EDGE_RISING;
+	case GPIOD_LINE_EDGE_FALLING:
+		return GPIODGLIB_LINE_EDGE_FALLING;
+	case GPIOD_LINE_EDGE_BOTH:
+		return GPIODGLIB_LINE_EDGE_BOTH;
+	}
+
+	g_error("invalid line edge value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineBias
+_gpiodglib_line_bias_from_library(enum gpiod_line_bias bias,
+				  gboolean allow_as_is)
+{
+	switch (bias) {
+	case GPIOD_LINE_BIAS_AS_IS:
+		if (allow_as_is)
+			return GPIODGLIB_LINE_BIAS_AS_IS;
+		break;
+	case GPIOD_LINE_BIAS_UNKNOWN:
+		return GPIODGLIB_LINE_BIAS_UNKNOWN;
+	case GPIOD_LINE_BIAS_DISABLED:
+		return GPIODGLIB_LINE_BIAS_DISABLED;
+	case GPIOD_LINE_BIAS_PULL_UP:
+		return GPIODGLIB_LINE_BIAS_PULL_UP;
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		return GPIODGLIB_LINE_BIAS_PULL_DOWN;
+	}
+
+	g_error("invalid line bias value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineDrive
+_gpiodglib_line_drive_from_library(enum gpiod_line_drive drive)
+{
+	switch (drive) {
+	case GPIOD_LINE_DRIVE_PUSH_PULL:
+		return GPIODGLIB_LINE_DRIVE_PUSH_PULL;
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
+		return GPIODGLIB_LINE_DRIVE_OPEN_DRAIN;
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		return GPIODGLIB_LINE_DRIVE_OPEN_SOURCE;
+	}
+
+	g_error("invalid line drive value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineClock
+_gpiodglib_line_clock_from_library(enum gpiod_line_clock event_clock)
+{
+	switch (event_clock) {
+	case GPIOD_LINE_CLOCK_MONOTONIC:
+		return GPIODGLIB_LINE_CLOCK_MONOTONIC;
+	case GPIOD_LINE_CLOCK_REALTIME:
+		return GPIODGLIB_LINE_CLOCK_REALTIME;
+	case GPIOD_LINE_CLOCK_HTE:
+		return GPIODGLIB_LINE_CLOCK_HTE;
+	}
+
+	g_error("invalid line event clock value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibLineValue
+_gpiodglib_line_value_from_library(enum gpiod_line_value value)
+{
+	switch (value) {
+	case GPIOD_LINE_VALUE_INACTIVE:
+		return GPIODGLIB_LINE_VALUE_INACTIVE;
+	case GPIOD_LINE_VALUE_ACTIVE:
+		return GPIODGLIB_LINE_VALUE_ACTIVE;
+	default:
+		break;
+	}
+
+	g_error("invalid line value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibInfoEventType
+_gpiodglib_info_event_type_from_library(enum gpiod_info_event_type type)
+{
+	switch (type) {
+	case GPIOD_INFO_EVENT_LINE_REQUESTED:
+		return GPIODGLIB_INFO_EVENT_LINE_REQUESTED;
+	case GPIOD_INFO_EVENT_LINE_RELEASED:
+		return GPIODGLIB_INFO_EVENT_LINE_RELEASED;
+	case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
+		return GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED;
+	}
+	
+	g_error("invalid info-event type returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GpiodglibEdgeEventType
+_gpiodglib_edge_event_type_from_library(enum gpiod_edge_event_type type)
+{
+	switch (type) {
+	case GPIOD_EDGE_EVENT_RISING_EDGE:
+		return GPIODGLIB_EDGE_EVENT_RISING_EDGE;
+	case GPIOD_EDGE_EVENT_FALLING_EDGE:
+		return GPIODGLIB_EDGE_EVENT_FALLING_EDGE;
+	}
+
+	g_error("invalid edge-event type returned by libgpiod");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_direction
+_gpiodglib_line_direction_to_library(GpiodglibLineDirection direction)
+{
+	switch (direction) {
+	case GPIODGLIB_LINE_DIRECTION_AS_IS:
+		return GPIOD_LINE_DIRECTION_AS_IS;
+	case GPIODGLIB_LINE_DIRECTION_INPUT:
+		return GPIOD_LINE_DIRECTION_INPUT;
+	case GPIODGLIB_LINE_DIRECTION_OUTPUT:
+		return GPIOD_LINE_DIRECTION_OUTPUT;
+	}
+
+	g_error("invalid line direction value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_edge
+_gpiodglib_line_edge_to_library(GpiodglibLineEdge edge)
+{
+	switch (edge) {
+	case GPIODGLIB_LINE_EDGE_NONE:
+		return GPIOD_LINE_EDGE_NONE;
+	case GPIODGLIB_LINE_EDGE_RISING:
+		return GPIOD_LINE_EDGE_RISING;
+	case GPIODGLIB_LINE_EDGE_FALLING:
+		return GPIOD_LINE_EDGE_FALLING;
+	case GPIODGLIB_LINE_EDGE_BOTH:
+		return GPIOD_LINE_EDGE_BOTH;
+	}
+
+	g_error("invalid line edge value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_bias
+_gpiodglib_line_bias_to_library(GpiodglibLineBias bias)
+{
+	switch (bias) {
+	case GPIODGLIB_LINE_BIAS_AS_IS:
+		return GPIOD_LINE_BIAS_AS_IS;
+	case GPIODGLIB_LINE_BIAS_DISABLED:
+		return GPIOD_LINE_BIAS_DISABLED;
+	case GPIODGLIB_LINE_BIAS_PULL_UP:
+		return GPIOD_LINE_BIAS_PULL_UP;
+	case GPIODGLIB_LINE_BIAS_PULL_DOWN:
+		return GPIOD_LINE_BIAS_PULL_DOWN;
+	default:
+		break;
+	}
+
+	g_error("invalid line bias value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_drive
+_gpiodglib_line_drive_to_library(GpiodglibLineDrive drive)
+{
+	switch (drive) {
+	case GPIODGLIB_LINE_DRIVE_PUSH_PULL:
+		return GPIOD_LINE_DRIVE_PUSH_PULL;
+	case GPIODGLIB_LINE_DRIVE_OPEN_SOURCE:
+		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	case GPIODGLIB_LINE_DRIVE_OPEN_DRAIN:
+		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	}
+
+	g_error("invalid line drive value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_clock
+_gpiodglib_line_clock_to_library(GpiodglibLineClock event_clock)
+{
+	switch (event_clock) {
+	case GPIODGLIB_LINE_CLOCK_MONOTONIC:
+		return GPIOD_LINE_CLOCK_MONOTONIC;
+	case GPIODGLIB_LINE_CLOCK_REALTIME:
+		return GPIOD_LINE_CLOCK_REALTIME;
+	case GPIODGLIB_LINE_CLOCK_HTE:
+		return GPIOD_LINE_CLOCK_HTE;
+	}
+
+	g_error("invalid line clock value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_value
+_gpiodglib_line_value_to_library(GpiodglibLineValue value)
+{
+	switch (value) {
+	case GPIODGLIB_LINE_VALUE_INACTIVE:
+		return GPIOD_LINE_VALUE_INACTIVE;
+	case GPIODGLIB_LINE_VALUE_ACTIVE:
+		return GPIOD_LINE_VALUE_ACTIVE;
+	}
+
+	g_error("invalid line value");
+}
diff --git a/bindings/glib/internal.h b/bindings/glib/internal.h
new file mode 100644
index 0000000..b6f8f42
--- /dev/null
+++ b/bindings/glib/internal.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_INTERNAL_H__
+#define __GPIODGLIB_INTERNAL_H__
+
+#include <glib.h>
+#include <glib-object.h>
+#include <gpiod.h>
+
+#include "gpiod-glib.h"
+
+GpiodglibLineSettings *
+_gpiodglib_line_settings_new(struct gpiod_line_settings *handle);
+GpiodglibChipInfo *_gpiodglib_chip_info_new(struct gpiod_chip_info *handle);
+GpiodglibLineInfo *_gpiodglib_line_info_new(struct gpiod_line_info *handle);
+GpiodglibEdgeEvent *_gpiodglib_edge_event_new(struct gpiod_edge_event *handle);
+GpiodglibInfoEvent *_gpiodglib_info_event_new(struct gpiod_info_event *handle);
+GpiodglibLineRequest *
+_gpiodglib_line_request_new(struct gpiod_line_request *handle);
+
+struct gpiod_request_config *
+_gpiodglib_request_config_get_handle(GpiodglibRequestConfig *req_cfg);
+struct gpiod_line_config *
+_gpiodglib_line_config_get_handle(GpiodglibLineConfig *line_cfg);
+struct gpiod_line_settings *
+_gpiodglib_line_settings_get_handle(GpiodglibLineSettings *settings);
+
+void _gpiodglib_set_error_from_errno(GError **err,
+				     const gchar *fmt, ...) G_GNUC_PRINTF(2, 3);
+
+gchar *_gpiodglib_dup_prop_string(GObject *obj, const gchar *prop);
+gboolean _gpiodglib_get_prop_bool(GObject *obj, const gchar *prop);
+gint _gpiodglib_get_prop_enum(GObject *obj, const gchar *prop);
+guint _gpiodglib_get_prop_uint(GObject *obj, const gchar *prop);
+guint64 _gpiodglib_get_prop_uint64(GObject *obj, const gchar *prop);
+gulong _gpiodglib_get_prop_ulong(GObject *obj, const gchar *prop);
+GTimeSpan _gpiodglib_get_prop_timespan(GObject *obj, const gchar *prop);
+GObject *_gpiodglib_get_prop_object(GObject *obj, const gchar *prop);
+gpointer _gpiodglib_get_prop_pointer(GObject *obj, const gchar *prop);
+gpointer _gpiodglib_get_prop_boxed_array(GObject *obj, const gchar *prop);
+
+void _gpiodglib_set_prop_uint(GObject *obj, const gchar *prop, guint val);
+void _gpiodglib_set_prop_string(GObject *obj, const gchar *prop,
+				const gchar *val);
+void _gpiodglib_set_prop_enum(GObject *obj, const gchar *prop, gint val);
+void _gpiodglib_set_prop_bool(GObject *obj, const gchar *prop, gboolean val);
+void _gpiodglib_set_prop_timespan(GObject *obj, const gchar *prop,
+				  GTimeSpan val);
+
+GpiodglibLineDirection
+_gpiodglib_line_direction_from_library(enum gpiod_line_direction direction,
+				       gboolean allow_as_is);
+GpiodglibLineEdge _gpiodglib_line_edge_from_library(enum gpiod_line_edge edge);
+GpiodglibLineBias _gpiodglib_line_bias_from_library(enum gpiod_line_bias bias,
+						    gboolean allow_as_is);
+GpiodglibLineDrive
+_gpiodglib_line_drive_from_library(enum gpiod_line_drive drive);
+GpiodglibLineClock
+_gpiodglib_line_clock_from_library(enum gpiod_line_clock event_clock);
+GpiodglibLineValue
+_gpiodglib_line_value_from_library(enum gpiod_line_value value);
+GpiodglibInfoEventType
+_gpiodglib_info_event_type_from_library(enum gpiod_info_event_type type);
+GpiodglibEdgeEventType
+_gpiodglib_edge_event_type_from_library(enum gpiod_edge_event_type type);
+
+enum gpiod_line_direction
+_gpiodglib_line_direction_to_library(GpiodglibLineDirection direction);
+enum gpiod_line_edge _gpiodglib_line_edge_to_library(GpiodglibLineEdge edge);
+enum gpiod_line_bias _gpiodglib_line_bias_to_library(GpiodglibLineBias bias);
+enum gpiod_line_drive
+_gpiodglib_line_drive_to_library(GpiodglibLineDrive drive);
+enum gpiod_line_clock
+_gpiodglib_line_clock_to_library(GpiodglibLineClock event_clock);
+enum gpiod_line_value
+_gpiodglib_line_value_to_library(GpiodglibLineValue value);
+
+#endif /* __GPIODGLIB_INTERNAL_H__ */
diff --git a/bindings/glib/line-config.c b/bindings/glib/line-config.c
new file mode 100644
index 0000000..37d3c21
--- /dev/null
+++ b/bindings/glib/line-config.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibLineConfig:
+ *
+ * The line-config object contains the configuration for lines that can be
+ * used in two cases:
+ *  - when making a line request
+ *  - when reconfiguring a set of already requested lines.
+ */
+struct _GpiodglibLineConfig {
+	GObject parent_instance;
+	struct gpiod_line_config *handle;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_CONFIG_PROP_CONFIGURED_OFFSETS = 1,
+} GpiodglibLineConfigProp;
+
+G_DEFINE_TYPE(GpiodglibLineConfig, gpiodglib_line_config, G_TYPE_OBJECT);
+
+static void gpiodglib_line_config_get_property(GObject *obj, guint prop_id,
+					       GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineConfig *self = GPIODGLIB_LINE_CONFIG_OBJ(obj);
+	g_autofree guint *offsets = NULL;
+	g_autoptr(GArray) boxed = NULL;
+	gsize num_offsets, i;
+
+	switch ((GpiodglibLineConfigProp)prop_id) {
+	case GPIODGLIB_LINE_CONFIG_PROP_CONFIGURED_OFFSETS:
+		num_offsets = gpiod_line_config_get_num_configured_offsets(
+								self->handle);
+		offsets = g_malloc0(num_offsets * sizeof(guint));
+		gpiod_line_config_get_configured_offsets(self->handle, offsets,
+							 num_offsets);
+
+		boxed = g_array_new(FALSE, TRUE, sizeof(guint));
+		for (i = 0; i < num_offsets; i++)
+			g_array_append_val(boxed, offsets[i]);
+
+		g_value_set_boxed(val, boxed);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_config_finalize(GObject *obj)
+{
+	GpiodglibLineConfig *self = GPIODGLIB_LINE_CONFIG_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_config_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_config_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_line_config_class_init(GpiodglibLineConfigClass *line_config_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_config_class);
+
+	class->get_property = gpiodglib_line_config_get_property;
+	class->finalize = gpiodglib_line_config_finalize;
+
+	/**
+	 * GpiodglibLineConfig:configured-offsets:
+	 *
+	 * Array of offsets for which line settings have been set.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_CONFIG_PROP_CONFIGURED_OFFSETS,
+		g_param_spec_boxed("configured-offsets", "Configured Offsets",
+			"Array of offsets for which line settings have been set.",
+			G_TYPE_ARRAY,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_line_config_init(GpiodglibLineConfig *self)
+{
+	self->handle = gpiod_line_config_new();
+	if (!self->handle)
+		/* The only possible error is ENOMEM. */
+		g_error("Failed to allocate memory for the request-config object.");
+}
+
+GpiodglibLineConfig *gpiodglib_line_config_new(void)
+{
+	return GPIODGLIB_LINE_CONFIG_OBJ(
+			g_object_new(GPIODGLIB_LINE_CONFIG_TYPE, NULL));
+}
+
+void gpiodglib_line_config_reset(GpiodglibLineConfig *self)
+{
+	g_assert(self);
+
+	gpiod_line_config_reset(self->handle);
+}
+
+gboolean
+gpiodglib_line_config_add_line_settings(GpiodglibLineConfig *self,
+					const GArray *offsets,
+					GpiodglibLineSettings *settings,
+					GError **err)
+{
+	struct gpiod_line_settings *settings_handle;
+	int ret;
+
+	g_assert(self);
+
+	if (!offsets || !offsets->len) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "at least one offset must be specified when adding line settings");
+		return FALSE;
+	}
+
+	settings_handle = settings ?
+		_gpiodglib_line_settings_get_handle(settings) : NULL;
+	ret = gpiod_line_config_add_line_settings(self->handle,
+						  (unsigned int *)offsets->data,
+						  offsets->len,
+						  settings_handle);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+			"failed to add line settings to line config");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GpiodglibLineSettings *
+gpiodglib_line_config_get_line_settings(GpiodglibLineConfig *self, guint offset)
+{
+	struct gpiod_line_settings *settings;
+
+	g_assert(self);
+
+	settings = gpiod_line_config_get_line_settings(self->handle, offset);
+	if (!settings) {
+		if (errno == ENOENT)
+			return NULL;
+
+		/* Let's bail-out on ENOMEM/ */
+		g_error("failed to retrieve line settings for offset %u: %s",
+			offset, g_strerror(errno));
+	}
+
+	return _gpiodglib_line_settings_new(settings);
+}
+
+gboolean gpiodglib_line_config_set_output_values(GpiodglibLineConfig *self,
+						 const GArray *values,
+						 GError **err)
+{
+	g_autofree enum gpiod_line_value *vals = NULL;
+	gint ret;
+	guint i;
+
+	g_assert(self);
+
+	vals = g_malloc0(sizeof(*vals) * values->len);
+	for (i = 0; i < values->len; i++)
+		vals[i] = _gpiodglib_line_value_to_library(
+				g_array_index(values, GpiodglibLineValue, i));
+
+	ret = gpiod_line_config_set_output_values(self->handle, vals,
+						  values->len);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+				"unable to set output values");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GArray *gpiodglib_line_config_get_configured_offsets(GpiodglibLineConfig *self)
+{
+	return _gpiodglib_get_prop_boxed_array(G_OBJECT(self),
+					       "configured-offsets");
+}
+
+struct gpiod_line_config *
+_gpiodglib_line_config_get_handle(GpiodglibLineConfig *line_cfg)
+{
+	return line_cfg->handle;
+}
diff --git a/bindings/glib/line-info.c b/bindings/glib/line-info.c
new file mode 100644
index 0000000..37cca37
--- /dev/null
+++ b/bindings/glib/line-info.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+/**
+ *  GpiodglibLineInfo:
+ *
+ * Line info object contains an immutable snapshot of a line's status.
+ *
+ * The line info contains all the publicly available information about a
+ * line, which does not include the line value. The line must be requested
+ * to access the line value.
+ */
+struct _GpiodglibLineInfo {
+	GObject parent_instance;
+	struct gpiod_line_info *handle;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_INFO_PROP_OFFSET = 1,
+	GPIODGLIB_LINE_INFO_PROP_NAME,
+	GPIODGLIB_LINE_INFO_PROP_USED,
+	GPIODGLIB_LINE_INFO_PROP_CONSUMER,
+	GPIODGLIB_LINE_INFO_PROP_DIRECTION,
+	GPIODGLIB_LINE_INFO_PROP_EDGE_DETECTION,
+	GPIODGLIB_LINE_INFO_PROP_BIAS,
+	GPIODGLIB_LINE_INFO_PROP_DRIVE,
+	GPIODGLIB_LINE_INFO_PROP_ACTIVE_LOW,
+	GPIODGLIB_LINE_INFO_PROP_DEBOUNCED,
+	GPIODGLIB_LINE_INFO_PROP_DEBOUNCE_PERIOD,
+	GPIODGLIB_LINE_INFO_PROP_EVENT_CLOCK,
+} GpiodglibLineInfoProp;
+
+G_DEFINE_TYPE(GpiodglibLineInfo, gpiodglib_line_info, G_TYPE_OBJECT);
+
+static void gpiodglib_line_info_get_property(GObject *obj, guint prop_id,
+					     GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineInfo *self = GPIODGLIB_LINE_INFO_OBJ(obj);
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibLineInfoProp)prop_id) {
+	case GPIODGLIB_LINE_INFO_PROP_OFFSET:
+		g_value_set_uint(val, gpiod_line_info_get_offset(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_NAME:
+		g_value_set_string(val,
+				   gpiod_line_info_get_name(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_USED:
+		g_value_set_boolean(val, gpiod_line_info_is_used(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_CONSUMER:
+		g_value_set_string(val,
+				   gpiod_line_info_get_consumer(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DIRECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_direction_from_library(
+				gpiod_line_info_get_direction(self->handle),
+				FALSE));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_EDGE_DETECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_edge_from_library(
+				gpiod_line_info_get_edge_detection(
+					self->handle)));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_BIAS:
+		g_value_set_enum(val,
+			_gpiodglib_line_bias_from_library(
+				gpiod_line_info_get_bias(self->handle),
+				FALSE));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DRIVE:
+		g_value_set_enum(val,
+			_gpiodglib_line_drive_from_library(
+				gpiod_line_info_get_drive(self->handle)));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_ACTIVE_LOW:
+		g_value_set_boolean(val,
+			gpiod_line_info_is_active_low(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DEBOUNCED:
+		g_value_set_boolean(val,
+			gpiod_line_info_is_debounced(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_DEBOUNCE_PERIOD:
+		g_value_set_int64(val,
+			gpiod_line_info_get_debounce_period_us(self->handle));
+		break;
+	case GPIODGLIB_LINE_INFO_PROP_EVENT_CLOCK:
+		g_value_set_enum(val,
+			_gpiodglib_line_clock_from_library(
+				gpiod_line_info_get_event_clock(self->handle)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_info_finalize(GObject *obj)
+{
+	GpiodglibLineInfo *self = GPIODGLIB_LINE_INFO_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_info_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_info_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_line_info_class_init(GpiodglibLineInfoClass *line_info_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_info_class);
+
+	class->get_property = gpiodglib_line_info_get_property;
+	class->finalize = gpiodglib_line_info_finalize;
+
+	/**
+	 * GpiodglibLineInfo:offset:
+	 *
+	 * Offset of the GPIO line.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_OFFSET,
+		g_param_spec_uint("offset", "Offset",
+			"Offset of the GPIO line.",
+			0, G_MAXUINT, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:name:
+	 *
+	 * Name of the GPIO line, if named.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_NAME,
+		g_param_spec_string("name", "Name",
+			"Name of the GPIO line, if named.",
+			NULL, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:used:
+	 *
+	 * Indicates whether the GPIO line is requested for exclusive usage.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_USED,
+		g_param_spec_boolean("used", "Is Used",
+			"Indicates whether the GPIO line is requested for exclusive usage.",
+			FALSE, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:consumer:
+	 *
+	 * Name of the consumer of the GPIO line, if requested.
+	 */
+	g_object_class_install_property(class,
+			GPIODGLIB_LINE_INFO_PROP_CONSUMER,
+		g_param_spec_string("consumer", "Consumer",
+			"Name of the consumer of the GPIO line, if requested.",
+			NULL, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:direction:
+	 *
+	 * Direction of the GPIO line.
+	 */
+	g_object_class_install_property(class,
+			GPIODGLIB_LINE_INFO_PROP_DIRECTION,
+		g_param_spec_enum("direction", "Direction",
+			"Direction of the GPIO line.",
+			GPIODGLIB_LINE_DIRECTION_TYPE,
+			GPIODGLIB_LINE_DIRECTION_INPUT,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:edge-detection:
+	 *
+	 * Edge detection setting of the GPIO line.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_INFO_PROP_EDGE_DETECTION,
+		g_param_spec_enum("edge-detection", "Edge Detection",
+			"Edge detection setting of the GPIO line.",
+			GPIODGLIB_LINE_EDGE_TYPE,
+			GPIODGLIB_LINE_EDGE_NONE,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:bias:
+	 *
+	 * Bias setting of the GPIO line.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_BIAS,
+		g_param_spec_enum("bias", "Bias",
+			"Bias setting of the GPIO line.",
+			GPIODGLIB_LINE_BIAS_TYPE,
+			GPIODGLIB_LINE_BIAS_UNKNOWN,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:drive:
+	 *
+	 * Drive setting of the GPIO line.
+	 */
+	g_object_class_install_property(class, GPIODGLIB_LINE_INFO_PROP_DRIVE,
+		g_param_spec_enum("drive", "Drive",
+			"Drive setting of the GPIO line.",
+			GPIODGLIB_LINE_DRIVE_TYPE,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:active-low:
+	 *
+	 * Indicates whether the signal of the line is inverted.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_INFO_PROP_ACTIVE_LOW,
+		g_param_spec_boolean("active-low", "Is Active-Low",
+			"Indicates whether the signal of the line is inverted.",
+			FALSE, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:debounced:
+	 *
+	 * Indicates whether the line is debounced (by hardware or by the
+	 * kernel software debouncer).
+	 */
+	g_object_class_install_property(class,
+			GPIODGLIB_LINE_INFO_PROP_DEBOUNCED,
+		g_param_spec_boolean("debounced", "Is Debounced",
+			"Indicates whether the line is debounced (by hardware or by the kernel software debouncer).",
+			FALSE, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:debounce-period-us:
+	 *
+	 * Debounce period of the line (expressed in microseconds).
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_INFO_PROP_DEBOUNCE_PERIOD,
+		g_param_spec_int64("debounce-period-us",
+			"Debounce Period (in microseconds)",
+			"Debounce period of the line (expressed in microseconds).",
+			0, G_MAXINT64, 0,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineInfo:event-clock:
+	 *
+	 * Event clock used to timestamp the edge events of the line.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_INFO_PROP_EVENT_CLOCK,
+		g_param_spec_enum("event-clock", "Event Clock",
+			"Event clock used to timestamp the edge events of the line.",
+			GPIODGLIB_LINE_CLOCK_TYPE,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_line_info_init(GpiodglibLineInfo *self)
+{
+	self->handle = NULL;
+}
+
+guint gpiodglib_line_info_get_offset(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "offset");
+}
+
+gchar *gpiodglib_line_info_dup_name(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "name");
+}
+
+gboolean gpiodglib_line_info_is_used(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "used");
+}
+
+gchar *gpiodglib_line_info_dup_consumer(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "consumer");
+}
+
+GpiodglibLineDirection
+gpiodglib_line_info_get_direction(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "direction");
+}
+
+GpiodglibLineEdge
+gpiodglib_line_info_get_edge_detection(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "edge-detection");
+}
+
+GpiodglibLineBias gpiodglib_line_info_get_bias(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "bias");
+}
+
+GpiodglibLineDrive gpiodglib_line_info_get_drive(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "drive");
+}
+
+gboolean gpiodglib_line_info_is_active_low(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "active-low");
+}
+
+gboolean gpiodglib_line_info_is_debounced(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "debounced");
+}
+
+GTimeSpan gpiodglib_line_info_get_debounce_period_us(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_timespan(G_OBJECT(self),
+					   "debounce-period-us");
+}
+
+GpiodglibLineClock gpiodglib_line_info_get_event_clock(GpiodglibLineInfo *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-clock");
+}
+
+GpiodglibLineInfo *_gpiodglib_line_info_new(struct gpiod_line_info *handle)
+{
+	GpiodglibLineInfo *info;
+
+	info = GPIODGLIB_LINE_INFO_OBJ(g_object_new(GPIODGLIB_LINE_INFO_TYPE,
+						    NULL));
+	info->handle = handle;
+
+	return info;
+}
diff --git a/bindings/glib/line-request.c b/bindings/glib/line-request.c
new file mode 100644
index 0000000..1720c75
--- /dev/null
+++ b/bindings/glib/line-request.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+
+#include "internal.h"
+
+static const gsize event_buf_size = 64;
+
+/**
+ * GpiodglibLineRequest:
+ *
+ * Line request object allows interacting with a set of requested GPIO lines.
+ */
+struct _GpiodglibLineRequest {
+	GObject parent_instance;
+	struct gpiod_line_request *handle;
+	struct gpiod_edge_event_buffer *event_buf;
+	GSource *edge_event_src;
+	guint edge_event_src_id;
+	enum gpiod_line_value *val_buf;
+	gboolean released;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_REQUEST_PROP_CHIP_NAME = 1,
+	GPIODGLIB_LINE_REQUEST_PROP_REQUESTED_OFFSETS,
+} GpiodglibLineRequestProp;
+
+enum {
+	GPIODGLIB_LINE_REQUEST_SIGNAL_EDGE_EVENT,
+	GPIODGLIB_LINE_REQUEST_SIGNAL_LAST,
+};
+
+static guint signals[GPIODGLIB_LINE_REQUEST_SIGNAL_LAST];
+
+G_DEFINE_TYPE(GpiodglibLineRequest, gpiodglib_line_request, G_TYPE_OBJECT);
+
+static gboolean
+gpiodglib_line_request_on_edge_event(GIOChannel *source G_GNUC_UNUSED,
+				     GIOCondition condition G_GNUC_UNUSED,
+				     gpointer data)
+{
+	struct gpiod_edge_event *event_handle, *event_copy;
+	GpiodglibLineRequest *self = data;
+	gint ret, i;
+
+	ret = gpiod_line_request_read_edge_events(self->handle,
+						  self->event_buf,
+						  event_buf_size);
+	if (ret < 0)
+		return TRUE;
+
+	for (i = 0; i < ret; i++) {
+		g_autoptr(GpiodglibEdgeEvent) event = NULL;
+
+		event_handle = gpiod_edge_event_buffer_get_event(
+						self->event_buf, i);
+		event_copy = gpiod_edge_event_copy(event_handle);
+		if (!event_copy)
+			g_error("failed to copy the edge event");
+
+		event = _gpiodglib_edge_event_new(event_copy);
+
+		g_signal_emit(self,
+			      signals[GPIODGLIB_LINE_REQUEST_SIGNAL_EDGE_EVENT],
+			      0,
+			      event);
+	}
+
+	return TRUE;
+}
+
+static void gpiodglib_line_request_get_property(GObject *obj, guint prop_id,
+						GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineRequest *self = GPIODGLIB_LINE_REQUEST_OBJ(obj);
+	g_autofree guint *offsets = NULL;
+	g_autoptr(GArray) boxed = NULL;
+	gsize num_offsets;
+
+	g_assert(self->handle);
+
+	switch ((GpiodglibLineRequestProp)prop_id) {
+	case GPIODGLIB_LINE_REQUEST_PROP_CHIP_NAME:
+		if (gpiodglib_line_request_is_released(self))
+			g_value_set_static_string(val, NULL);
+		else
+			g_value_set_string(val,
+				gpiod_line_request_get_chip_name(self->handle));
+		break;
+	case GPIODGLIB_LINE_REQUEST_PROP_REQUESTED_OFFSETS:
+		boxed = g_array_new(FALSE, TRUE, sizeof(guint));
+
+		if (!gpiodglib_line_request_is_released(self)) {
+			num_offsets =
+				gpiod_line_request_get_num_requested_lines(
+								self->handle);
+			offsets = g_malloc0(num_offsets * sizeof(guint));
+			gpiod_line_request_get_requested_offsets(self->handle,
+								 offsets,
+								 num_offsets);
+			g_array_append_vals(boxed, offsets, num_offsets);
+		}
+
+		g_value_set_boxed(val, boxed);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_request_dispose(GObject *obj)
+{
+	GpiodglibLineRequest *self = GPIODGLIB_LINE_REQUEST_OBJ(obj);
+
+	if (self->edge_event_src_id)
+		g_source_remove(self->edge_event_src_id);
+
+	G_OBJECT_CLASS(gpiodglib_line_request_parent_class)->dispose(obj);
+}
+
+static void gpiodglib_line_request_finalize(GObject *obj)
+{
+	GpiodglibLineRequest *self = GPIODGLIB_LINE_REQUEST_OBJ(obj);
+
+	if (!self->released)
+		gpiodglib_line_request_release(self);
+
+	g_clear_pointer(&self->event_buf, gpiod_edge_event_buffer_free);
+	g_clear_pointer(&self->val_buf, g_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_request_parent_class)->finalize(obj);
+}
+
+static void
+gpiodglib_line_request_class_init(GpiodglibLineRequestClass *line_request_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_request_class);
+
+	class->get_property = gpiodglib_line_request_get_property;
+	class->dispose = gpiodglib_line_request_dispose;
+	class->finalize = gpiodglib_line_request_finalize;
+
+	/**
+	 * GpiodglibLineRequest:chip-name
+	 *
+	 * Name of the GPIO chip this request was made on.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_REQUEST_PROP_CHIP_NAME,
+		g_param_spec_string("chip-name", "Chip Name",
+			"Name of the GPIO chip this request was made on.",
+			NULL, G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineRequest:requested-offsets
+	 *
+	 * Array of requested offsets.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_REQUEST_PROP_REQUESTED_OFFSETS,
+		g_param_spec_boxed("requested-offsets", "Requested offsets",
+			"Array of requested offsets.",
+			G_TYPE_ARRAY,
+			G_PARAM_READABLE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineRequest::edge-event:
+	 * @chip: #GpiodglibLineRequest receiving the event
+	 * @event: The #GpiodglibEdgeEvent
+	 *
+	 * Emitted when an edge event is detected on one of the requested GPIO
+	 * line.
+	 */
+	signals[GPIODGLIB_LINE_REQUEST_SIGNAL_EDGE_EVENT] =
+			g_signal_new("edge-event",
+				     G_TYPE_FROM_CLASS(line_request_class),
+				     G_SIGNAL_RUN_LAST,
+				     0,
+				     NULL,
+				     NULL,
+				     g_cclosure_marshal_generic,
+				     G_TYPE_NONE,
+				     1,
+				     GPIODGLIB_EDGE_EVENT_TYPE);
+}
+
+static void gpiodglib_line_request_init(GpiodglibLineRequest *self)
+{
+	self->handle = NULL;
+	self->event_buf = NULL;
+	self->edge_event_src = NULL;
+	self->released = FALSE;
+}
+
+void gpiodglib_line_request_release(GpiodglibLineRequest *self)
+{
+	g_assert(self);
+
+	g_clear_pointer(&self->edge_event_src, g_source_unref);
+	gpiod_line_request_release(self->handle);
+	self->released = TRUE;
+}
+
+gboolean gpiodglib_line_request_is_released(GpiodglibLineRequest *self)
+{
+	g_assert(self);
+
+	return self->released;
+}
+
+static void set_err_request_released(GError **err)
+{
+	g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED,
+		    "line request was released and cannot be used");
+}
+
+gchar *gpiodglib_line_request_dup_chip_name(GpiodglibLineRequest *self)
+{
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "chip-name");
+}
+
+GArray *gpiodglib_line_request_get_requested_offsets(GpiodglibLineRequest *self)
+{
+	return _gpiodglib_get_prop_boxed_array(G_OBJECT(self),
+					      "requested-offsets");
+}
+
+gboolean gpiodglib_line_request_reconfigure_lines(GpiodglibLineRequest *self,
+						  GpiodglibLineConfig *config,
+						  GError **err)
+{
+	struct gpiod_line_config *config_handle;
+	gint ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!config) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "line-config is required to reconfigure lines");
+		return FALSE;
+	}
+
+	config_handle = _gpiodglib_line_config_get_handle(config);
+
+	ret = gpiod_line_request_reconfigure_lines(self->handle, config_handle);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+						"failed to reconfigure lines");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean
+gpiodglib_line_request_get_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue *value, GError **err)
+{
+	enum gpiod_line_value val;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	val = gpiod_line_request_get_value(self->handle, offset);
+	if (val == GPIOD_LINE_VALUE_ERROR) {
+		_gpiodglib_set_error_from_errno(err,
+			    "failed to get line value for offset %u", offset);
+		return FALSE;
+	}
+
+	*value = _gpiodglib_line_value_from_library(val);
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_get_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  GArray **values, GError **err)
+{
+	guint i;
+	int ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!offsets || !values) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "offsets and values must not be NULL");
+		return FALSE;
+	}
+
+	ret = gpiod_line_request_get_values_subset(self->handle, offsets->len,
+					(const unsigned int *)offsets->data,
+					self->val_buf);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err, "failed to read line values");
+		return FALSE;
+	}
+
+	if (!(*values)) {
+		*values = g_array_sized_new(FALSE, TRUE,
+					    sizeof(GpiodglibLineValue),
+					    offsets->len);
+	}
+
+	g_array_set_size(*values, offsets->len);
+
+	for (i = 0; i < offsets->len; i++) {
+		GpiodglibLineValue *val = &g_array_index(*values,
+							 GpiodglibLineValue, i);
+		*val = _gpiodglib_line_value_from_library(self->val_buf[i]);
+	}
+
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_get_values(GpiodglibLineRequest *self,
+					 GArray **values, GError **err)
+{
+	g_autoptr(GArray) offsets = NULL;
+
+	offsets = gpiodglib_line_request_get_requested_offsets(self);
+
+	return gpiodglib_line_request_get_values_subset(self, offsets,
+							values, err);
+}
+
+gboolean gpiodglib_line_request_set_value(GpiodglibLineRequest *self,
+					  guint offset,
+					  GpiodglibLineValue value,
+					  GError **err)
+{
+	int ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	ret = gpiod_line_request_set_value(self->handle, offset,
+				_gpiodglib_line_value_to_library(value));
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+			"failed to set line value for offset: %u", offset);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_set_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  const GArray *values,
+						  GError **err)
+{
+	guint i;
+	int ret;
+
+	g_assert(self && self->handle);
+
+	if (gpiodglib_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!offsets || !values) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "offsets and values must not be NULL");
+		return FALSE;
+	}
+
+	if (offsets->len != values->len) {
+		g_set_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL,
+			    "offsets and values must have the sme size");
+		return FALSE;
+	}
+
+	for (i = 0; i < values->len; i++)
+		self->val_buf[i] = _gpiodglib_line_value_to_library(
+					g_array_index(values,
+						      GpiodglibLineValue, i));
+
+	ret = gpiod_line_request_set_values_subset(self->handle,
+						  offsets->len,
+						  (unsigned int *)offsets->data,
+						  self->val_buf);
+	if (ret) {
+		_gpiodglib_set_error_from_errno(err,
+					       "failed to set line values");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean gpiodglib_line_request_set_values(GpiodglibLineRequest *self,
+					   GArray *values, GError **err)
+{
+	g_autoptr(GArray) offsets = NULL;
+
+	offsets = gpiodglib_line_request_get_requested_offsets(self);
+
+	return gpiodglib_line_request_set_values_subset(self, offsets,
+							values, err);
+}
+
+GpiodglibLineRequest *
+_gpiodglib_line_request_new(struct gpiod_line_request *handle)
+{
+	g_autoptr(GIOChannel) channel = NULL;
+	GpiodglibLineRequest *req;
+	gsize num_lines;
+
+	req = GPIODGLIB_LINE_REQUEST_OBJ(
+		g_object_new(GPIODGLIB_LINE_REQUEST_TYPE, NULL));
+	req->handle = handle;
+
+	req->event_buf = gpiod_edge_event_buffer_new(event_buf_size);
+	if (!req->event_buf)
+		g_error("failed to allocate the edge event buffer");
+
+	channel = g_io_channel_unix_new(
+			gpiod_line_request_get_fd(req->handle));
+	req->edge_event_src = g_io_create_watch(channel, G_IO_IN);
+	g_source_set_callback(
+			req->edge_event_src,
+			G_SOURCE_FUNC(gpiodglib_line_request_on_edge_event),
+			req, NULL);
+	req->edge_event_src_id = g_source_attach(req->edge_event_src, NULL);
+
+	num_lines = gpiod_line_request_get_num_requested_lines(req->handle);
+	req->val_buf = g_malloc0(sizeof(enum gpiod_line_value) * num_lines);
+
+
+	return req;
+}
diff --git a/bindings/glib/line-settings.c b/bindings/glib/line-settings.c
new file mode 100644
index 0000000..2d7d52a
--- /dev/null
+++ b/bindings/glib/line-settings.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <stdarg.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibLineSettings:
+ *
+ * Line settings object contains a set of line properties that can be used
+ * when requesting lines or reconfiguring an existing request.
+ */
+struct _GpiodglibLineSettings {
+	GObject parent_instance;
+	struct gpiod_line_settings *handle;
+};
+
+typedef enum {
+	GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION = 1,
+	GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION,
+	GPIODGLIB_LINE_SETTINGS_PROP_BIAS,
+	GPIODGLIB_LINE_SETTINGS_PROP_DRIVE,
+	GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW,
+	GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US,
+	GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK,
+	GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE,
+} GpiodglibLineSettingsProp;
+
+G_DEFINE_TYPE(GpiodglibLineSettings, gpiodglib_line_settings, G_TYPE_OBJECT);
+
+static void gpiodglib_line_settings_init_handle(GpiodglibLineSettings *self)
+{
+	if (!self->handle) {
+		self->handle = gpiod_line_settings_new();
+		if (!self->handle)
+			/* The only possible error is ENOMEM. */
+			g_error("Failed to allocate memory for the line-settings object.");
+	}
+}
+
+static void gpiodglib_line_settings_get_property(GObject *obj, guint prop_id,
+						 GValue *val, GParamSpec *pspec)
+{
+	GpiodglibLineSettings *self = GPIODGLIB_LINE_SETTINGS_OBJ(obj);
+
+	gpiodglib_line_settings_init_handle(self);
+
+	switch ((GpiodglibLineSettingsProp)prop_id) {
+	case GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_direction_from_library(
+				gpiod_line_settings_get_direction(
+							self->handle), TRUE));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION:
+		g_value_set_enum(val,
+			_gpiodglib_line_edge_from_library(
+				gpiod_line_settings_get_edge_detection(
+							self->handle)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_BIAS:
+		g_value_set_enum(val,
+			_gpiodglib_line_bias_from_library(
+				gpiod_line_settings_get_bias(self->handle),
+				TRUE));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DRIVE:
+		g_value_set_enum(val,
+			_gpiodglib_line_drive_from_library(
+				gpiod_line_settings_get_drive(self->handle)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW:
+		g_value_set_boolean(val,
+			gpiod_line_settings_get_active_low(self->handle));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US:
+		g_value_set_int64(val,
+			gpiod_line_settings_get_debounce_period_us(
+							self->handle));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK:
+		g_value_set_enum(val,
+			_gpiodglib_line_clock_from_library(
+				gpiod_line_settings_get_event_clock(
+							self->handle)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE:
+		g_value_set_enum(val,
+			_gpiodglib_line_value_from_library(
+				gpiod_line_settings_get_output_value(
+							self->handle)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_settings_set_property(GObject *obj, guint prop_id,
+						 const GValue *val,
+						 GParamSpec *pspec)
+{
+	GpiodglibLineSettings *self = GPIODGLIB_LINE_SETTINGS_OBJ(obj);
+
+	gpiodglib_line_settings_init_handle(self);
+
+	switch ((GpiodglibLineSettingsProp)prop_id) {
+	case GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION:
+		gpiod_line_settings_set_direction(self->handle,
+			_gpiodglib_line_direction_to_library(
+				g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION:
+		gpiod_line_settings_set_edge_detection(self->handle,
+			_gpiodglib_line_edge_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_BIAS:
+		gpiod_line_settings_set_bias(self->handle,
+			_gpiodglib_line_bias_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DRIVE:
+		gpiod_line_settings_set_drive(self->handle,
+			_gpiodglib_line_drive_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW:
+		gpiod_line_settings_set_active_low(self->handle,
+						   g_value_get_boolean(val));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US:
+		gpiod_line_settings_set_debounce_period_us(self->handle,
+						g_value_get_int64(val));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK:
+		gpiod_line_settings_set_event_clock(self->handle,
+			_gpiodglib_line_clock_to_library(g_value_get_enum(val)));
+		break;
+	case GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE:
+		gpiod_line_settings_set_output_value(self->handle,
+			_gpiodglib_line_value_to_library(g_value_get_enum(val)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_line_settings_finalize(GObject *obj)
+{
+	GpiodglibLineSettings *self = GPIODGLIB_LINE_SETTINGS_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_settings_free);
+
+	G_OBJECT_CLASS(gpiodglib_line_settings_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_line_settings_class_init(
+			GpiodglibLineSettingsClass *line_settings_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_settings_class);
+
+	class->set_property = gpiodglib_line_settings_set_property;
+	class->get_property = gpiodglib_line_settings_get_property;
+	class->finalize = gpiodglib_line_settings_finalize;
+
+	/**
+	 * GpiodglibLineSettings:direction
+	 *
+	 * Line direction setting.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_SETTINGS_PROP_DIRECTION,
+		g_param_spec_enum("direction", "Direction",
+			"Line direction setting.",
+			GPIODGLIB_LINE_DIRECTION_TYPE,
+			GPIODGLIB_LINE_DIRECTION_AS_IS,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:edge-detection
+	 *
+	 * Line edge detection setting.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_EDGE_DETECTION,
+		g_param_spec_enum("edge-detection", "Edge Detection",
+			"Line edge detection setting.",
+			GPIODGLIB_LINE_EDGE_TYPE,
+			GPIODGLIB_LINE_EDGE_NONE,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:bias
+	 *
+	 * Line bias setting.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_BIAS,
+		g_param_spec_enum("bias", "Bias",
+			"Line bias setting.",
+			GPIODGLIB_LINE_BIAS_TYPE,
+			GPIODGLIB_LINE_BIAS_AS_IS,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:drive
+	 *
+	 * Line drive setting.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_DRIVE,
+		g_param_spec_enum("drive", "Drive",
+			"Line drive setting.",
+			GPIODGLIB_LINE_DRIVE_TYPE,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:active-low
+	 *
+	 * Line active-low settings.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_LINE_SETTINGS_PROP_ACTIVE_LOW,
+		g_param_spec_boolean("active-low", "Active-Low",
+			"Line active-low settings.",
+			FALSE, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:debounce-period-us
+	 *
+	 * Line debounce period (expressed in microseconds).
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US,
+		g_param_spec_int64("debounce-period-us",
+			"Debounce Period (in microseconds)",
+			"Line debounce period (expressed in microseconds).",
+			0, G_MAXINT64, 0,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:event-clock
+	 *
+	 * Clock used to timestamp edge events.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_EVENT_CLOCK,
+		g_param_spec_enum("event-clock", "Event Clock",
+			"Clock used to timestamp edge events.",
+			GPIODGLIB_LINE_CLOCK_TYPE,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibLineSettings:output-value
+	 *
+	 * Line output value.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_LINE_SETTINGS_PROP_OUTPUT_VALUE,
+		g_param_spec_enum("output-value", "Output Value",
+			"Line output value.",
+			GPIODGLIB_LINE_VALUE_TYPE,
+			GPIODGLIB_LINE_VALUE_INACTIVE,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_line_settings_init(GpiodglibLineSettings *self)
+{
+	self->handle = NULL;
+}
+
+GpiodglibLineSettings *gpiodglib_line_settings_new(const gchar *first_prop, ...)
+{
+	GpiodglibLineSettings *settings;
+	va_list va;
+
+	va_start(va, first_prop);
+	settings = GPIODGLIB_LINE_SETTINGS_OBJ(
+			g_object_new_valist(GPIODGLIB_LINE_SETTINGS_TYPE,
+					    first_prop, va));
+	va_end(va);
+
+	return settings;
+}
+
+void gpiodglib_line_settings_reset(GpiodglibLineSettings *self)
+{
+	g_assert(self);
+
+	if (self->handle)
+		gpiod_line_settings_reset(self->handle);
+}
+
+void gpiodglib_line_settings_set_direction(GpiodglibLineSettings *self,
+					   GpiodglibLineDirection direction)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "direction", direction);
+}
+
+GpiodglibLineDirection
+gpiodglib_line_settings_get_direction(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "direction");
+}
+
+void gpiodglib_line_settings_set_edge_detection(GpiodglibLineSettings *self,
+						GpiodglibLineEdge edge)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "edge-detection", edge);
+}
+
+GpiodglibLineEdge
+gpiodglib_line_settings_get_edge_detection(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "edge-detection");
+}
+
+void gpiodglib_line_settings_set_bias(GpiodglibLineSettings *self,
+				      GpiodglibLineBias bias)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "bias", bias);
+}
+
+GpiodglibLineBias gpiodglib_line_settings_get_bias(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "bias");
+}
+
+void gpiodglib_line_settings_set_drive(GpiodglibLineSettings *self,
+				       GpiodglibLineDrive drive)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "drive", drive);
+}
+
+GpiodglibLineDrive
+gpiodglib_line_settings_get_drive(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "drive");
+}
+
+void gpiodglib_line_settings_set_active_low(GpiodglibLineSettings *self,
+					    gboolean active_low)
+{
+	_gpiodglib_set_prop_bool(G_OBJECT(self), "active-low", active_low);
+}
+
+gboolean gpiodglib_line_settings_get_active_low(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_bool(G_OBJECT(self), "active-low");
+}
+
+void gpiodglib_line_settings_set_debounce_period_us(GpiodglibLineSettings *self,
+						    GTimeSpan period)
+{
+	_gpiodglib_set_prop_timespan(G_OBJECT(self),
+				     "debounce-period-us", period);
+}
+
+GTimeSpan
+gpiodglib_line_settings_get_debounce_period_us(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_timespan(G_OBJECT(self),
+					   "debounce-period-us");
+}
+
+void gpiodglib_line_settings_set_event_clock(GpiodglibLineSettings *self,
+					     GpiodglibLineClock event_clock)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "event-clock", event_clock);
+}
+
+GpiodglibLineClock
+gpiodglib_line_settings_get_event_clock(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "event-clock");
+}
+
+void gpiodglib_line_settings_set_output_value(GpiodglibLineSettings *self,
+					      GpiodglibLineValue value)
+{
+	_gpiodglib_set_prop_enum(G_OBJECT(self), "output-value", value);
+}
+
+GpiodglibLineValue
+gpiodglib_line_settings_get_output_value(GpiodglibLineSettings *self)
+{
+	return _gpiodglib_get_prop_enum(G_OBJECT(self), "output-value");
+}
+
+struct gpiod_line_settings *
+_gpiodglib_line_settings_get_handle(GpiodglibLineSettings *settings)
+{
+	return settings->handle;
+}
+
+GpiodglibLineSettings *
+_gpiodglib_line_settings_new(struct gpiod_line_settings *handle)
+{
+	GpiodglibLineSettings *settings;
+
+	settings = GPIODGLIB_LINE_SETTINGS_OBJ(
+			g_object_new(GPIODGLIB_LINE_SETTINGS_TYPE, NULL));
+	gpiod_line_settings_free(settings->handle);
+	settings->handle = handle;
+
+	return settings;
+}
diff --git a/bindings/glib/misc.c b/bindings/glib/misc.c
new file mode 100644
index 0000000..d0563bd
--- /dev/null
+++ b/bindings/glib/misc.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+gboolean gpiodglib_is_gpiochip_device(const gchar *path)
+{
+	g_assert(path);
+
+	return gpiod_is_gpiochip_device(path);
+}
+
+const gchar *gpiodglib_api_version(void)
+{
+	return gpiod_api_version();
+}
diff --git a/bindings/glib/request-config.c b/bindings/glib/request-config.c
new file mode 100644
index 0000000..65ce4c3
--- /dev/null
+++ b/bindings/glib/request-config.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <stdarg.h>
+
+#include "internal.h"
+
+/**
+ * GpiodglibRequestConfig:
+ *
+ * Request config objects are used to pass a set of options to the kernel at
+ * the time of the line request.
+ */
+struct _GpiodglibRequestConfig {
+	GObject parent_instance;
+	struct gpiod_request_config *handle;
+};
+
+typedef enum {
+	GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER = 1,
+	GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE,
+} GpiodglibRequestConfigProp;
+
+G_DEFINE_TYPE(GpiodglibRequestConfig, gpiodglib_request_config, G_TYPE_OBJECT);
+
+static void gpiodglib_request_config_get_property(GObject *obj, guint prop_id,
+						  GValue *val,
+						  GParamSpec *pspec)
+{
+	GpiodglibRequestConfig *self = GPIODGLIB_REQUEST_CONFIG_OBJ(obj);
+
+	switch ((GpiodglibRequestConfigProp)prop_id) {
+	case GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER:
+		g_value_set_string(val,
+			gpiod_request_config_get_consumer(self->handle));
+		break;
+	case GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE:
+		g_value_set_uint(val,
+			gpiod_request_config_get_event_buffer_size(
+				self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_request_config_set_property(GObject *obj, guint prop_id,
+						  const GValue *val,
+						  GParamSpec *pspec)
+{
+	GpiodglibRequestConfig *self = GPIODGLIB_REQUEST_CONFIG_OBJ(obj);
+
+	switch ((GpiodglibRequestConfigProp)prop_id) {
+	case GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER:
+		gpiod_request_config_set_consumer(self->handle,
+						  g_value_get_string(val));
+		break;
+	case GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE:
+		gpiod_request_config_set_event_buffer_size(self->handle,
+							g_value_get_uint(val));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void gpiodglib_request_config_finalize(GObject *obj)
+{
+	GpiodglibRequestConfig *self = GPIODGLIB_REQUEST_CONFIG_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_request_config_free);
+
+	G_OBJECT_CLASS(gpiodglib_request_config_parent_class)->finalize(obj);
+}
+
+static void gpiodglib_request_config_class_init(
+			GpiodglibRequestConfigClass *request_config_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(request_config_class);
+
+	class->set_property = gpiodglib_request_config_set_property;
+	class->get_property = gpiodglib_request_config_get_property;
+	class->finalize = gpiodglib_request_config_finalize;
+
+	/**
+	 * GpiodglibRequestConfig:consumer:
+	 *
+	 * Name of the request consumer.
+	 */
+	g_object_class_install_property(class,
+					GPIODGLIB_REQUEST_CONFIG_PROP_CONSUMER,
+		g_param_spec_string("consumer", "Consumer",
+			"Name of the request consumer.",
+			NULL, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+
+	/**
+	 * GpiodglibRequestConfig:event-buffer-size:
+	 *
+	 * Size of the kernel event buffer size of the request.
+	 */
+	g_object_class_install_property(class,
+				GPIODGLIB_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE,
+		g_param_spec_uint("event-buffer-size", "Event Buffer Size",
+			"Size of the kernel event buffer size of the request.",
+			0, G_MAXUINT, 64,
+			G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+}
+
+static void gpiodglib_request_config_init(GpiodglibRequestConfig *self)
+{
+	self->handle = gpiod_request_config_new();
+	if (!self->handle)
+		/* The only possible error is ENOMEM. */
+		g_error("Failed to allocate memory for the request-config object.");
+}
+
+GpiodglibRequestConfig *
+gpiodglib_request_config_new(const gchar *first_prop, ...)
+{
+	GpiodglibRequestConfig *settings;
+	va_list va;
+
+	va_start(va, first_prop);
+	settings = GPIODGLIB_REQUEST_CONFIG_OBJ(
+			g_object_new_valist(GPIODGLIB_REQUEST_CONFIG_TYPE,
+					    first_prop, va));
+	va_end(va);
+
+	return settings;
+}
+
+void gpiodglib_request_config_set_consumer(GpiodglibRequestConfig *self,
+					   const gchar *consumer)
+{
+	g_assert(self);
+
+	_gpiodglib_set_prop_string(G_OBJECT(self), "consumer", consumer);
+}
+
+gchar *gpiodglib_request_config_dup_consumer(GpiodglibRequestConfig *self)
+{
+	g_assert(self);
+
+	return _gpiodglib_dup_prop_string(G_OBJECT(self), "consumer");
+}
+
+void
+gpiodglib_request_config_set_event_buffer_size(GpiodglibRequestConfig *self,
+					       guint event_buffer_size)
+{
+	g_assert(self);
+
+	_gpiodglib_set_prop_uint(G_OBJECT(self), "event-buffer-size",
+				 event_buffer_size);
+}
+
+guint
+gpiodglib_request_config_get_event_buffer_size(GpiodglibRequestConfig *self)
+{
+	g_assert(self);
+
+	return _gpiodglib_get_prop_uint(G_OBJECT(self), "event-buffer-size");
+}
+
+struct gpiod_request_config *
+_gpiodglib_request_config_get_handle(GpiodglibRequestConfig *req_cfg)
+{
+	return req_cfg->handle;
+}

-- 
2.43.0


