Return-Path: <linux-gpio+bounces-7789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4307E91C1BB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8542A1F24EE6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D501C0DE6;
	Fri, 28 Jun 2024 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jAmTDYS9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C931BF31A
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586432; cv=none; b=qSm2isaVQYpN7Qbh+Lt9GIS4wcXEkZhcCrOfPewW813uGKV75KYTo/kYIEjO0IbQtTO8D/QziMBfGqB4RE1PoVqTIwSEGbYqyccZwt5FB7bVBzy60Z12RXk1AXvCmMxtZMGnz45iBGaPG15a0diNQSJvAFi9uhEKuDcv2J3jwmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586432; c=relaxed/simple;
	bh=mdjjl2IMNF3Ssf4wGz9H2i6AZ0zD2QLj2X7GbvaPJ1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PcWzpTZ+cr2qP44uihW89IUYioywWtLwTFaROgG8+5cY0+px308jdFlO+HduVz+PYNulGSkFaUdmbtdeQM4o2zeJW3wpdMORKimunTh3qB8UumJD12v0FmsTp7Db4yrdn2ewN5dPgAlOcsk79N2i7qTNnIC11qIUjXv/2GRGG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jAmTDYS9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so467315f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586427; x=1720191227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb2Yln08TMSFxQEfIChyrOakYjsGVTl77vIFUgXk0fg=;
        b=jAmTDYS9djf+yisjVOhQ2uZlo04o22TbZgMkQoA7YqBV3goYo461Le7FI8pHUGwnOQ
         C3u+nAHn3DTiAbI5fsZflpcBMt2K2SsttG8/edifbVa8F4savDVSzBLJUh7MEnA5YjLi
         J50Ov2qkrhtHpgsaSF10FaibixM5MM0TcN1+A6uYyHH49v69Ke4u42N7e6pbA0qVMGYo
         UPIhvKJbDS2dnS/N3L6BBPcsnjjoV19/hO0dZnQSk5Elwr+4Z00f0D4CSat3cF/DWsa+
         WLa59YigMXecWlFnEzA2XJZaBATABPik0sMXWG0U7LXm3GluqItpVi+N5jIYRq5u13rT
         9H7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586427; x=1720191227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kb2Yln08TMSFxQEfIChyrOakYjsGVTl77vIFUgXk0fg=;
        b=O/6bfYe8pyjV0bA5i5kp/DB/9YofKHxRtMS52lGF/NtfZ/qCFBFgVQaHv9GwdhaSkE
         kxO4oBr7slNZmBrMxYkVz23AIwvCRFwb1wDvLBuG4VTGZAVYxYO7nEfycP+YR3IV4/Xb
         P095JRJ/haxYR1mGxTueOGu1ewtGykcLXIH+YnPdl3Y/pMMAWd3TyuEDCtY+tGIRf9wk
         eBfVlWHIjkS9b7jPU4StHKNRzYZRRfZp2LqL9+0Clyzi65V7iwF4EX+2dLeCDf7084fp
         R8D2QDabAeUtM7qOXFM2TdXdf2Rg3/NUtUnU6RRy/bRUsv5M1tK4gNoFeBYtS+XM8eG3
         ewLA==
X-Forwarded-Encrypted: i=1; AJvYcCX4H7VsEn1Dl989wGcC7eYwnuQkLo9C2saYu/gq2o6jtNMgWgG+7MdgAypoUY+klQp7rslG0MinVGLULRi0fXAy5LLhBkwF7w0JpQ==
X-Gm-Message-State: AOJu0YwbLhDfeDfP18iKiikxoCXmSXGr4xPS8Xq2RQv2hVnFRbJ75RUp
	O7FtjELYAOQtCHdIfwSY6HK/Y7b10Pzl7MEb7yWRx9RizFfpHs5iFrrZW5l3vlo=
X-Google-Smtp-Source: AGHT+IEGw25SHCPX7TvW+Y7/fdsqNP/S1OUQ6pL8y2AoHUrlV7uImeJ8OEqP0R60L+7ViB22ipwybw==
X-Received: by 2002:adf:e707:0:b0:367:4337:4065 with SMTP id ffacd0b85a97d-367433743f5mr3714066f8f.51.1719586426671;
        Fri, 28 Jun 2024 07:53:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:21 +0200
Subject: [PATCH libgpiod v2 05/18] bindings: glib: add core code
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-5-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=84166;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EPRdoubmRD3R0jNUbrrU9qS18PAMcHhZTpuMMM6JC2w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5xAJnUfv1I8pUI4r3YKwQuJNQ/hc+f6UYSN
 9YGIOUSn/SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcQAKCRARpy6gFHHX
 csgdEACvkHSO6lCR1QAYHGuIcXmJozn4R4J0Zr2/4AfJR2SOl+mlRcIRxP/JFoLJwbN0iOFsMAU
 83HSWckNqGlXpK4xR7Q5sdo7G2WJCaONeSW+hSiMhe5Y9mh90DkKD1jpwAG9aXnoo6o6kNOVNGZ
 +aPuLLumVOVK/n05srlUcDWsYL7VHwMzMDAoA+c0Dqx36wzKQMeMR1VLat+MIqFoQckRKMN9aDl
 bxnu1qs+O5+DzxhKC0kG/rLtX69UUsuGcAZ4Ke+OaNcQ+G2jfA/VSGBEDTyh98xA31+6+s2Vqjo
 0dPfUdF9LFmvJFYOswKfDPQNNpn4Co5OY4w48gufsYQEivDh/LjH2Mc9U9jFgOdV+AJcsLROQIL
 90lxbqw+n6l+LqYnxC7FPdTLhZ0ea4hYXfYrwcRWVQgdg0DLU6FGZO7Re6uFht5uoteUeTnW2lZ
 GJohYQpwuxpfHd6UHeHA7gLC/1FdY1Jp0mvBJ6G3vdr1qpr57svWI+JNmHp5UJUj89QWNaiYAfB
 zoT8NuZBhyIM9C9QrYyCCaeFH8K8Nd77fszGlVIeJ2g/okGjhwfGKH0jT+tL0o+Y5vKzXIm4nsV
 Qiv+8RdPWsIlw1TdCXRp6fJszAlmy0gphazWquTFL/DgMFSeEFdhmkmwBBZRw4AN9Ig+eitgL2Z
 mV+OMYQ2ExR/mLw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the files implementing the public API of the GLib bindings to
libgpiod.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/chip-info.c                | 118 +++++++++
 bindings/glib/chip.c                     | 396 ++++++++++++++++++++++++++++
 bindings/glib/edge-event.c               | 158 +++++++++++
 bindings/glib/error.c                    |  67 +++++
 bindings/glib/generated-enums.c.template |  43 +++
 bindings/glib/info-event.c               | 150 +++++++++++
 bindings/glib/internal.c                 | 334 ++++++++++++++++++++++++
 bindings/glib/internal.h                 |  54 ++++
 bindings/glib/line-config.c              | 186 +++++++++++++
 bindings/glib/line-info.c                | 274 +++++++++++++++++++
 bindings/glib/line-request.c             | 434 +++++++++++++++++++++++++++++++
 bindings/glib/line-settings.c            | 359 +++++++++++++++++++++++++
 bindings/glib/misc.c                     |  17 ++
 bindings/glib/request-config.c           | 155 +++++++++++
 14 files changed, 2745 insertions(+)

diff --git a/bindings/glib/chip-info.c b/bindings/glib/chip-info.c
new file mode 100644
index 0000000..a2038c6
--- /dev/null
+++ b/bindings/glib/chip-info.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+#include "internal.h"
+
+struct _GPIODChipInfo {
+	GObject parent_instance;
+	struct gpiod_chip_info *handle;
+};
+
+enum {
+	G_GPIOD_CHIP_INFO_PROP_HANDLE = 1,
+	G_GPIOD_CHIP_INFO_PROP_NAME,
+	G_GPIOD_CHIP_INFO_PROP_LABEL,
+	G_GPIOD_CHIP_INFO_PROP_NUM_LINES,
+};
+
+G_DEFINE_TYPE(GPIODChipInfo, g_gpiod_chip_info, G_TYPE_OBJECT);
+
+static void g_gpiod_chip_info_get_property(GObject *obj, guint prop_id,
+					   GValue *val, GParamSpec *pspec)
+{
+	GPIODChipInfo *self = G_GPIOD_CHIP_INFO_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_CHIP_INFO_PROP_NAME:
+		g_value_set_static_string(val,
+			gpiod_chip_info_get_name(self->handle));
+		break;
+	case G_GPIOD_CHIP_INFO_PROP_LABEL:
+		g_value_set_static_string(val,
+			gpiod_chip_info_get_label(self->handle));
+		break;
+	case G_GPIOD_CHIP_INFO_PROP_NUM_LINES:
+		g_value_set_uint(val,
+			gpiod_chip_info_get_num_lines(self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_chip_info_set_property(GObject *obj, guint prop_id,
+					   const GValue *val, GParamSpec *pspec)
+{
+	GPIODChipInfo *self = G_GPIOD_CHIP_INFO_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_CHIP_INFO_PROP_HANDLE:
+		self->handle = g_value_get_pointer(val);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_chip_info_finalize(GObject *obj)
+{
+	GPIODChipInfo *self = G_GPIOD_CHIP_INFO_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_chip_info_free);
+
+	G_OBJECT_CLASS(g_gpiod_chip_info_parent_class)->finalize(obj);
+}
+
+static void g_gpiod_chip_info_class_init(GPIODChipInfoClass *chip_info_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(chip_info_class);
+
+	class->set_property = g_gpiod_chip_info_set_property;
+	class->get_property = g_gpiod_chip_info_get_property;
+	class->finalize = g_gpiod_chip_info_finalize;
+
+	g_object_class_install_property(class, G_GPIOD_CHIP_INFO_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO Chip information object.",
+			G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE));
+
+	g_object_class_install_property(class, G_GPIOD_CHIP_INFO_PROP_NAME,
+		g_param_spec_string("name", "Name",
+			"Name of this GPIO chip device.", NULL,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_CHIP_INFO_PROP_LABEL,
+		g_param_spec_string("label", "Label",
+			"Label of this GPIO chip device.", NULL,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_CHIP_INFO_PROP_NUM_LINES,
+		g_param_spec_uint("num-lines", "NumLines",
+			"Number of GPIO lines exposed by this chip.",
+			1, G_MAXUINT, 1,
+			G_PARAM_READABLE));
+}
+
+static void g_gpiod_chip_info_init(GPIODChipInfo *self)
+{
+	self->handle = NULL;
+}
+
+const gchar *g_gpiod_chip_info_get_name(GPIODChipInfo *self)
+{
+	return g_gpiod_get_prop_string(G_OBJECT(self), "name");
+}
+
+const gchar *g_gpiod_chip_info_get_label(GPIODChipInfo *self)
+{
+	return g_gpiod_get_prop_string(G_OBJECT(self), "label");
+}
+
+guint g_gpiod_chip_info_get_num_lines(GPIODChipInfo *self)
+{
+	return g_gpiod_get_prop_uint(G_OBJECT(self), "num-lines");
+}
diff --git a/bindings/glib/chip.c b/bindings/glib/chip.c
new file mode 100644
index 0000000..bd8495b
--- /dev/null
+++ b/bindings/glib/chip.c
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+#include "internal.h"
+
+struct _GPIODChip {
+	GObject parent_instance;
+	GString *path;
+	GError *construct_err;
+	struct gpiod_chip *handle;
+	GSource *info_event_src;
+	guint info_event_src_id;
+};
+
+enum {
+	G_GPIOD_CHIP_PROP_PATH = 1,
+	G_GPIOD_CHIP_PROP_HANDLE,
+};
+
+enum {
+	G_GPIOD_CHIP_SIGNAL_INFO_EVENT,
+	G_GPIOD_CHIP_SIGNAL_LAST,
+};
+
+static guint signals[G_GPIOD_CHIP_SIGNAL_LAST];
+
+static void g_string_free_complete(GString *str)
+{
+	g_string_free(str, TRUE);
+}
+
+static gboolean g_gpiod_chip_on_info_event(GIOChannel *source G_GNUC_UNUSED,
+					   GIOCondition condition G_GNUC_UNUSED,
+					   gpointer data)
+{
+	g_autoptr(GPIODInfoEvent) event = NULL;
+	struct gpiod_info_event *event_handle;
+	GPIODChip *self = data;
+
+	event_handle = gpiod_chip_read_info_event(self->handle);
+	if (!event_handle)
+		return TRUE;
+
+	event = G_GPIOD_INFO_EVENT_OBJ(g_object_new(G_GPIOD_INFO_EVENT_TYPE,
+						    "handle", event_handle,
+						    NULL));
+
+	g_signal_emit(self,
+		      signals[G_GPIOD_CHIP_SIGNAL_INFO_EVENT],
+		      0,
+		      event);
+
+	return TRUE;
+}
+
+static gboolean
+g_gpiod_chip_initable_init(GInitable *initable,
+			   GCancellable *cancellable G_GNUC_UNUSED,
+			   GError **err)
+{
+	GPIODChip *self = G_GPIOD_CHIP_OBJ(initable);
+
+	if (self->construct_err) {
+		g_propagate_error(err, self->construct_err);
+		self->construct_err = NULL;
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+static void g_gpiod_chip_initable_iface_init(GInitableIface *iface)
+{
+	iface->init = g_gpiod_chip_initable_init;
+}
+
+G_DEFINE_TYPE_WITH_CODE(GPIODChip, g_gpiod_chip, G_TYPE_OBJECT,
+			G_IMPLEMENT_INTERFACE(
+				G_TYPE_INITABLE,
+				g_gpiod_chip_initable_iface_init));
+
+static void g_gpiod_chip_constructed(GObject *obj)
+{
+	GPIODChip *self = G_GPIOD_CHIP_OBJ(obj);
+	g_autoptr(GIOChannel) channel = NULL;
+
+	g_assert(!self->handle);
+	g_assert(self->path);
+
+	self->handle = gpiod_chip_open(self->path->str);
+	if (!self->handle) {
+		g_gpiod_set_error_from_errno(&self->construct_err,
+					     "unable to open GPIO chip '%s'",
+					     self->path->str);
+		return;
+	}
+
+	channel = g_io_channel_unix_new(gpiod_chip_get_fd(self->handle));
+	self->info_event_src = g_io_create_watch(channel, G_IO_IN);
+	g_source_set_callback(self->info_event_src,
+			      G_SOURCE_FUNC(g_gpiod_chip_on_info_event),
+			      self, NULL);
+	self->info_event_src_id = g_source_attach(self->info_event_src, NULL);
+
+	G_OBJECT_CLASS(g_gpiod_chip_parent_class)->constructed(obj);
+}
+
+static void g_gpiod_chip_get_property(GObject *obj, guint prop_id,
+				      GValue *val, GParamSpec *pspec)
+{
+	GPIODChip *self = G_GPIOD_CHIP_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_CHIP_PROP_PATH:
+		g_value_set_static_string(val, self->path->str);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_chip_set_property(GObject *obj, guint prop_id,
+				      const GValue *val, GParamSpec *pspec)
+{
+	GPIODChip *self = G_GPIOD_CHIP_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_CHIP_PROP_PATH:
+		self->path = g_string_new(g_value_get_string(val));
+		break;
+	case G_GPIOD_CHIP_PROP_HANDLE:
+		self->handle = g_value_get_pointer(val);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+void g_gpiod_chip_close(GPIODChip *self)
+{
+	g_clear_pointer(&self->info_event_src, g_source_unref);
+	g_clear_pointer(&self->handle, gpiod_chip_close);
+}
+
+static void g_gpiod_chip_dispose(GObject *obj)
+{
+	GPIODChip *self = G_GPIOD_CHIP_OBJ(obj);
+
+	if (self->info_event_src_id)
+		g_source_remove(self->info_event_src_id);
+
+	g_gpiod_chip_close(self);
+
+	G_OBJECT_CLASS(g_gpiod_chip_parent_class)->dispose(obj);
+}
+
+static void g_gpiod_chip_finalize(GObject *obj)
+{
+	GPIODChip *self = G_GPIOD_CHIP_OBJ(obj);
+
+	g_clear_error(&self->construct_err);
+	g_clear_pointer(&self->path, g_string_free_complete);
+
+	G_OBJECT_CLASS(g_gpiod_chip_parent_class)->finalize(obj);
+}
+
+static void g_gpiod_chip_class_init(GPIODChipClass *chip_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(chip_class);
+
+	class->constructed = g_gpiod_chip_constructed;
+	class->get_property = g_gpiod_chip_get_property;
+	class->set_property = g_gpiod_chip_set_property;
+	class->dispose = g_gpiod_chip_dispose;
+	class->finalize = g_gpiod_chip_finalize;
+
+	g_object_class_install_property(class, G_GPIOD_CHIP_PROP_PATH,
+		g_param_spec_string("path", "Path",
+			"Path to the GPIO chip device used to create this chip.",
+			NULL, G_PARAM_CONSTRUCT_ONLY | G_PARAM_READWRITE));
+
+	g_object_class_install_property(class, G_GPIOD_CHIP_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"Open GPIO chip handle as returned by gpiod_chip_open().",
+			G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE));
+
+	signals[G_GPIOD_CHIP_SIGNAL_INFO_EVENT] =
+				g_signal_new("info-event",
+					     G_TYPE_FROM_CLASS(chip_class),
+					     G_SIGNAL_RUN_LAST,
+					     0,
+					     NULL,
+					     NULL,
+					     g_cclosure_marshal_generic,
+					     G_TYPE_NONE,
+					     1,
+					     G_GPIOD_INFO_EVENT_TYPE);
+}
+
+static void g_gpiod_chip_init(GPIODChip *self)
+{
+	self->path = NULL;
+	self->construct_err = NULL;
+	self->handle = NULL;
+	self->info_event_src = NULL;
+	self->info_event_src_id = 0;
+}
+
+GPIODChip *g_gpiod_chip_new(const gchar *path, GError **err)
+{
+	return G_GPIOD_CHIP_OBJ(g_initable_new(G_GPIOD_CHIP_TYPE, NULL, err,
+					       "path", path, NULL));
+}
+
+gboolean g_gpiod_chip_is_closed(GPIODChip *self)
+{
+	return !self->handle;
+}
+
+const gchar *g_gpiod_chip_get_path(GPIODChip *self)
+{
+	return g_gpiod_get_prop_string(G_OBJECT(self), "path");
+}
+
+static void set_err_chip_closed(GError **err)
+{
+	g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_CHIP_CLOSED,
+		    "Chip was closed and cannot be used");
+}
+
+GPIODChipInfo *g_gpiod_chip_get_info(GPIODChip *self, GError **err)
+{
+	struct gpiod_chip_info *info;
+
+	g_assert(self);
+
+	if (g_gpiod_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	info = gpiod_chip_get_info(self->handle);
+	if (!info) {
+		g_gpiod_set_error_from_errno(err,
+			"unable to retrieve GPIO chip information");
+		return NULL;
+	}
+
+	return G_GPIOD_CHIP_INFO_OBJ(g_object_new(G_GPIOD_CHIP_INFO_TYPE,
+						  "handle", info, NULL));
+}
+
+static GPIODLineInfo *
+g_gpiod_chip_do_get_line_info(GPIODChip *self, guint offset, GError **err,
+			struct gpiod_line_info *(*func)(struct gpiod_chip *,
+							unsigned int),
+			const gchar *err_action)
+{
+	struct gpiod_line_info *info;
+
+	g_assert(self);
+
+	if (g_gpiod_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	info = func(self->handle, offset);
+	if (!info) {
+		g_gpiod_set_error_from_errno(err, "unable to %s for offset %u",
+					     err_action, offset);
+		return NULL;
+	}
+
+	return G_GPIOD_LINE_INFO_OBJ(g_object_new(G_GPIOD_LINE_INFO_TYPE,
+						  "handle", info, NULL));
+		
+}
+
+GPIODLineInfo *
+g_gpiod_chip_get_line_info(GPIODChip *self, guint offset, GError **err)
+{
+	return g_gpiod_chip_do_get_line_info(self, offset, err,
+					     gpiod_chip_get_line_info,
+					     "retrieve GPIO line-info");
+}
+
+GPIODLineInfo *
+g_gpiod_chip_watch_line_info(GPIODChip *self, guint offset, GError **err)
+{
+	return g_gpiod_chip_do_get_line_info(self, offset, err,
+					     gpiod_chip_watch_line_info,
+					     "setup a line-info watch");
+}
+
+gboolean
+g_gpiod_chip_unwatch_line_info(GPIODChip *self, guint offset, GError **err)
+{
+	int ret;
+
+	g_assert(self);
+
+	if (g_gpiod_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return FALSE;
+	}
+
+	ret = gpiod_chip_unwatch_line_info(self->handle, offset);
+	if (ret) {
+		g_gpiod_set_error_from_errno(err,
+			    "unable to unwatch line-info events for offset %u",
+			    offset);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean
+g_gpiod_chip_get_line_offset_from_name(GPIODChip *self, const gchar *name,
+				       guint *offset, GError **err)
+{
+	gint ret;
+
+	g_assert(self);
+
+	if (g_gpiod_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return FALSE;
+	}
+
+	if (!name) {
+		g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL,
+			    "name must not be NULL");
+		return FALSE;
+	}
+
+	ret = gpiod_chip_get_line_offset_from_name(self->handle, name);
+	if (ret < 0) {
+		if (errno != ENOENT)
+			g_gpiod_set_error_from_errno(err,
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
+GPIODLineRequest *g_gpiod_chip_request_lines(GPIODChip *self,
+					     GPIODRequestConfig *req_cfg,
+					     GPIODLineConfig *line_cfg,
+					     GError **err)
+{
+	struct gpiod_request_config *req_cfg_handle;
+	struct gpiod_line_config *line_cfg_handle;
+	struct gpiod_line_request *req;
+
+	g_assert(self);
+
+	if (g_gpiod_chip_is_closed(self)) {
+		set_err_chip_closed(err);
+		return NULL;
+	}
+
+	if (!line_cfg) {
+		g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL,
+			    "line-config is required for request");
+		return NULL;
+	}
+
+	req_cfg_handle = req_cfg ?
+		g_gpiod_get_prop_pointer(G_OBJECT(req_cfg), "handle") : NULL;
+	line_cfg_handle = g_gpiod_get_prop_pointer(G_OBJECT(line_cfg),
+						   "handle");
+
+	req = gpiod_chip_request_lines(self->handle,
+				       req_cfg_handle, line_cfg_handle);
+	if (!req) {
+		g_gpiod_set_error_from_errno(err,
+				"failed to request GPIO lines");
+		return NULL;
+	}
+
+	return G_GPIOD_LINE_REQUEST_OBJ(g_object_new(G_GPIOD_LINE_REQUEST_TYPE,
+						     "handle", req, NULL));
+}
diff --git a/bindings/glib/edge-event.c b/bindings/glib/edge-event.c
new file mode 100644
index 0000000..c732138
--- /dev/null
+++ b/bindings/glib/edge-event.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+#include "internal.h"
+
+struct _GPIODEdgeEvent {
+	GObject parent_instance;
+	struct gpiod_edge_event *handle;
+};
+
+enum {
+	G_GPIOD_EDGE_EVENT_PROP_HANDLE = 1,
+	G_GPIOD_EDGE_EVENT_PROP_EVENT_TYPE,
+	G_GPIOD_EDGE_EVENT_PROP_TIMESTAMP_NS,
+	G_GPIOD_EDGE_EVENT_PROP_LINE_OFFSET,
+	G_GPIOD_EDGE_EVENT_PROP_GLOBAL_SEQNO,
+	G_GPIOD_EDGE_EVENT_PROP_LINE_SEQNO,
+};
+
+G_DEFINE_TYPE(GPIODEdgeEvent, g_gpiod_edge_event, G_TYPE_OBJECT);
+
+static void g_gpiod_edge_event_get_property(GObject *obj, guint prop_id,
+					    GValue *val, GParamSpec *pspec)
+{
+	GPIODEdgeEvent *self = G_GPIOD_EDGE_EVENT_OBJ(obj);
+	GPIODEdgeEventType type;
+
+	switch (prop_id) {
+	case G_GPIOD_EDGE_EVENT_PROP_EVENT_TYPE:
+		type = g_gpiod_edge_event_type_from_library(
+				gpiod_edge_event_get_event_type(self->handle));
+		g_value_set_enum(val, type);
+		break;
+	case G_GPIOD_EDGE_EVENT_PROP_TIMESTAMP_NS:
+		g_value_set_uint64(val,
+			gpiod_edge_event_get_timestamp_ns(self->handle));
+		break;
+	case G_GPIOD_EDGE_EVENT_PROP_LINE_OFFSET:
+		g_value_set_uint(val,
+			gpiod_edge_event_get_line_offset(self->handle));
+		break;
+	case G_GPIOD_EDGE_EVENT_PROP_GLOBAL_SEQNO:
+		g_value_set_ulong(val,
+			gpiod_edge_event_get_global_seqno(self->handle));
+		break;
+	case G_GPIOD_EDGE_EVENT_PROP_LINE_SEQNO:
+		g_value_set_ulong(val,
+			gpiod_edge_event_get_line_seqno(self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_edge_event_set_property(GObject *obj, guint prop_id,
+					    const GValue *val,
+					    GParamSpec *pspec)
+{
+	GPIODEdgeEvent *self = G_GPIOD_EDGE_EVENT_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_EDGE_EVENT_PROP_HANDLE:
+		self->handle = g_value_get_pointer(val);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_edge_event_finalize(GObject *obj)
+{
+	GPIODEdgeEvent *self = G_GPIOD_EDGE_EVENT_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_edge_event_free);
+
+	G_OBJECT_CLASS(g_gpiod_edge_event_parent_class)->finalize(obj);
+}
+
+static void g_gpiod_edge_event_class_init(GPIODEdgeEventClass *edge_event_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(edge_event_class);
+
+	class->set_property = g_gpiod_edge_event_set_property;
+	class->get_property = g_gpiod_edge_event_get_property;
+	class->finalize = g_gpiod_edge_event_finalize;
+
+	g_object_class_install_property(class, G_GPIOD_EDGE_EVENT_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO info event object.",
+			G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_EDGE_EVENT_PROP_EVENT_TYPE,
+		g_param_spec_enum("event-type", "Event Type",
+			"Type of the edge event.",
+			G_GPIOD_EDGE_EVENT_TYPE_TYPE,
+			G_GPIOD_EDGE_EVENT_RISING_EDGE,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_EDGE_EVENT_PROP_TIMESTAMP_NS,
+		g_param_spec_uint64("timestamp-ns",
+			"Timestamp (in nanoseconds)",
+			"Timestamp of the edge event expressed in nanoseconds.",
+			0, G_MAXUINT64, 0, G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_EDGE_EVENT_PROP_LINE_OFFSET,
+		g_param_spec_uint("line-offset", "Line Offset",
+			"Offset of the line on which this event was registered.",
+			0, G_MAXUINT, 0, G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_EDGE_EVENT_PROP_GLOBAL_SEQNO,
+		g_param_spec_ulong("global-seqno", "Global Sequence Number",
+			"Global sequence number of this event",
+			0, G_MAXULONG, 0, G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_EDGE_EVENT_PROP_LINE_SEQNO,
+		g_param_spec_ulong("line-seqno", "Line Sequence Number",
+			"Event sequence number specific to the line.",
+			0, G_MAXULONG, 0, G_PARAM_READABLE));
+}
+
+static void g_gpiod_edge_event_init(GPIODEdgeEvent *self)
+{
+	self->handle = NULL;
+}
+
+GPIODEdgeEventType g_gpiod_edge_event_get_event_type(GPIODEdgeEvent *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "event-type");
+}
+
+guint64 g_gpiod_edge_event_get_timestamp_ns(GPIODEdgeEvent *self)
+{
+	return g_gpiod_get_prop_uint64(G_OBJECT(self), "timestamp-ns");
+}
+
+guint g_gpiod_edge_event_get_line_offset(GPIODEdgeEvent *self)
+{
+	return g_gpiod_get_prop_uint(G_OBJECT(self), "line-offset");
+}
+
+gulong g_gpiod_edge_event_get_global_seqno(GPIODEdgeEvent *self)
+{
+	return g_gpiod_get_prop_ulong(G_OBJECT(self), "global-seqno");
+}
+
+gulong g_gpiod_edge_event_get_line_seqno(GPIODEdgeEvent *self)
+{
+	return g_gpiod_get_prop_ulong(G_OBJECT(self), "line-seqno");
+}
diff --git a/bindings/glib/error.c b/bindings/glib/error.c
new file mode 100644
index 0000000..6a1dc00
--- /dev/null
+++ b/bindings/glib/error.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <stdarg.h>
+
+G_DEFINE_QUARK(g-gpiod-error, g_gpiod_error)
+
+static GPIODError error_from_errno(void)
+{
+	switch (errno) {
+	case EPERM:
+		return G_GPIOD_ERR_PERM;
+	case ENOENT:
+		return G_GPIOD_ERR_NOENT;
+	case EINTR:
+		return G_GPIOD_ERR_INTR;
+	case EIO:
+		return G_GPIOD_ERR_IO;
+	case ENXIO:
+		return G_GPIOD_ERR_NXIO;
+	case E2BIG:
+		return G_GPIOD_ERR_E2BIG;
+	case EBADFD:
+		return G_GPIOD_ERR_BADFD;
+	case ECHILD:
+		return G_GPIOD_ERR_CHILD;
+	case EAGAIN:
+		return G_GPIOD_ERR_AGAIN;
+	case ENOMEM:
+		/* Special case - as a convention GLib just aborts on ENOMEM. */
+		g_error("out of memory");
+	case EACCES:
+		return G_GPIOD_ERR_ACCES;
+	case EFAULT:
+		return G_GPIOD_ERR_FAULT;
+	case EBUSY:
+		return G_GPIOD_ERR_BUSY;
+	case EEXIST:
+		return G_GPIOD_ERR_EXIST;
+	case ENODEV:
+		return G_GPIOD_ERR_NODEV;
+	case EINVAL:
+		return G_GPIOD_ERR_INVAL;
+	case ENOTTY:
+		return G_GPIOD_ERR_NOTTY;
+	case EPIPE:
+		return G_GPIOD_ERR_PIPE;
+	default:
+		return G_GPIOD_ERR_FAILED;
+	}
+}
+
+void g_gpiod_set_error_from_errno(GError **err, const gchar *fmt, ...)
+{
+	g_autofree gchar *msg = NULL;
+	va_list va;
+
+	va_start(va, fmt);
+	msg = g_strdup_vprintf(fmt, va);
+	va_end(va);
+
+	g_set_error(err, G_GPIOD_ERROR, error_from_errno(),
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
index 0000000..4abaee3
--- /dev/null
+++ b/bindings/glib/info-event.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+#include "internal.h"
+
+struct _GPIODInfoEvent {
+	GObject parent_instance;
+	struct gpiod_info_event *handle;
+	GPIODLineInfo *info;
+};
+
+enum {
+	G_GPIOD_INFO_EVENT_PROP_HANDLE = 1,
+	G_GPIOD_INFO_EVENT_PROP_EVENT_TYPE,
+	G_GPIOD_INFO_EVENT_PROP_TIMESTAMP,
+	G_GPIOD_INFO_EVENT_PROP_LINE_INFO,
+};
+
+G_DEFINE_TYPE(GPIODInfoEvent, g_gpiod_info_event, G_TYPE_OBJECT);
+
+static void g_gpiod_info_event_get_property(GObject *obj, guint prop_id,
+					    GValue *val, GParamSpec *pspec)
+{
+	GPIODInfoEvent *self = G_GPIOD_INFO_EVENT_OBJ(obj);
+	struct gpiod_line_info *info, *cpy;
+	GPIODInfoEventType type;
+
+	switch (prop_id) {
+	case G_GPIOD_INFO_EVENT_PROP_EVENT_TYPE:
+		type = g_gpiod_info_event_type_from_library(
+				gpiod_info_event_get_event_type(self->handle));
+		g_value_set_enum(val, type);
+		break;
+	case G_GPIOD_INFO_EVENT_PROP_TIMESTAMP:
+		g_value_set_uint64(val,
+			gpiod_info_event_get_timestamp_ns(self->handle));
+		break;
+	case G_GPIOD_INFO_EVENT_PROP_LINE_INFO:
+		if (!self->info) {
+			info = gpiod_info_event_get_line_info(self->handle);
+			cpy = gpiod_line_info_copy(info);
+			if (!cpy)
+				g_error("Failed to allocate memory for line-info object");
+
+			self->info = G_GPIOD_LINE_INFO_OBJ(
+				g_object_new(G_GPIOD_LINE_INFO_TYPE,
+					"handle", cpy, NULL));
+		}
+
+		g_value_set_object(val, g_object_ref(self->info));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_info_event_set_property(GObject *obj, guint prop_id,
+					    const GValue *val,
+					    GParamSpec *pspec)
+{
+	GPIODInfoEvent *self = G_GPIOD_INFO_EVENT_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_INFO_EVENT_PROP_HANDLE:
+		self->handle = g_value_get_pointer(val);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_info_event_dispose(GObject *obj)
+{
+	GPIODInfoEvent *self = G_GPIOD_INFO_EVENT_OBJ(obj);
+
+	g_clear_object(&self->info);
+
+	G_OBJECT_CLASS(g_gpiod_info_event_parent_class)->dispose(obj);
+}
+
+static void g_gpiod_info_event_finalize(GObject *obj)
+{
+	GPIODInfoEvent *self = G_GPIOD_INFO_EVENT_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_info_event_free);
+
+	G_OBJECT_CLASS(g_gpiod_info_event_parent_class)->finalize(obj);
+}
+
+static void g_gpiod_info_event_class_init(GPIODInfoEventClass *info_event_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(info_event_class);
+
+	class->set_property = g_gpiod_info_event_set_property;
+	class->get_property = g_gpiod_info_event_get_property;
+	class->dispose = g_gpiod_info_event_dispose;
+	class->finalize = g_gpiod_info_event_finalize;
+
+	g_object_class_install_property(class, G_GPIOD_INFO_EVENT_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO info event object.",
+			G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_INFO_EVENT_PROP_EVENT_TYPE,
+		g_param_spec_enum("event-type", "Event Type",
+			"Type of the info event.",
+			G_GPIOD_INFO_EVENT_TYPE_TYPE,
+			G_GPIOD_INFO_EVENT_LINE_REQUESTED,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_INFO_EVENT_PROP_TIMESTAMP,
+		g_param_spec_uint64("timestamp-ns",
+			"Timestamp (in nanoseconds)",
+			"Timestamp of the info event expressed in nanoseconds.",
+			0, G_MAXUINT64, 0, G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_INFO_EVENT_PROP_LINE_INFO,
+		g_param_spec_object("line-info", "Line Info",
+			"New line-info snapshot associated with this info event.",
+			G_GPIOD_LINE_INFO_TYPE, G_PARAM_READABLE));
+}
+
+static void g_gpiod_info_event_init(GPIODInfoEvent *self)
+{
+	self->handle = NULL;
+	self->info = NULL;
+}
+
+GPIODInfoEventType g_gpiod_info_event_get_event_type(GPIODInfoEvent *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "event-type");
+}
+
+guint64 g_gpiod_info_event_get_timestamp_ns(GPIODInfoEvent *self)
+{
+	return g_gpiod_get_prop_uint64(G_OBJECT(self), "timestamp-ns");
+}
+
+GPIODLineInfo *g_gpiod_info_event_get_line_info(GPIODInfoEvent *self)
+{
+	return G_GPIOD_LINE_INFO_OBJ(
+			g_gpiod_get_prop_object(G_OBJECT(self), "line-info"));
+}
diff --git a/bindings/glib/internal.c b/bindings/glib/internal.c
new file mode 100644
index 0000000..40192a4
--- /dev/null
+++ b/bindings/glib/internal.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "internal.h"
+
+#define get_prop(_obj, _prop, _type, _vtype, _get_func) \
+	({ \
+		g_auto(GValue) _val = G_VALUE_INIT; \
+		_type _ret; \
+		g_value_init(&_val, _vtype); \
+		g_object_get_property(_obj, _prop, &_val); \
+		_ret = _get_func(&_val); \
+		_ret; \
+	})
+
+G_GNUC_INTERNAL const gchar *
+g_gpiod_get_prop_string(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, const gchar *, G_TYPE_STRING,
+			g_value_get_string);
+}
+
+G_GNUC_INTERNAL gboolean g_gpiod_get_prop_bool(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gboolean, G_TYPE_BOOLEAN,
+			g_value_get_boolean);
+}
+
+G_GNUC_INTERNAL gint g_gpiod_get_prop_enum(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gint, G_TYPE_ENUM, g_value_get_enum);
+}
+
+G_GNUC_INTERNAL guint g_gpiod_get_prop_uint(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, guint, G_TYPE_UINT, g_value_get_uint);
+}
+
+G_GNUC_INTERNAL guint64 g_gpiod_get_prop_uint64(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, guint64, G_TYPE_UINT64, g_value_get_uint64);
+}
+
+G_GNUC_INTERNAL gulong g_gpiod_get_prop_ulong(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gulong, G_TYPE_ULONG, g_value_get_ulong);
+}
+
+G_GNUC_INTERNAL GTimeSpan
+g_gpiod_get_prop_timespan(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, GTimeSpan, G_TYPE_INT64, g_value_get_int64);
+}
+
+G_GNUC_INTERNAL GObject *
+g_gpiod_get_prop_object(GObject *obj, const gchar *prop)
+{
+	return G_OBJECT(get_prop(obj, prop, gpointer, G_TYPE_OBJECT,
+			g_value_get_object));
+}
+
+G_GNUC_INTERNAL gpointer
+g_gpiod_get_prop_pointer(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gpointer, G_TYPE_POINTER,
+			g_value_get_pointer);
+}
+
+G_GNUC_INTERNAL gpointer
+g_gpiod_get_prop_boxed_array(GObject *obj, const gchar *prop)
+{
+	return get_prop(obj, prop, gpointer, G_TYPE_ARRAY, g_value_get_boxed);
+}
+
+#define set_prop(_obj, _prop, _set_func, _vtype, _val) \
+	do { \
+		g_auto(GValue) _gval = G_VALUE_INIT; \
+		g_value_init(&_gval, _vtype); \
+		_set_func(&_gval, _val); \
+		g_object_set_property(_obj, _prop, &_gval); \
+	} while (0)
+
+G_GNUC_INTERNAL void
+g_gpiod_set_prop_uint(GObject *obj, const gchar *prop, guint val)
+{
+	set_prop(obj, prop, g_value_set_uint, G_TYPE_UINT, val);
+}
+
+G_GNUC_INTERNAL void
+g_gpiod_set_prop_string(GObject *obj, const gchar *prop, const gchar *val)
+{
+	set_prop(obj, prop, g_value_set_string, G_TYPE_STRING, val);
+}
+
+G_GNUC_INTERNAL void
+g_gpiod_set_prop_enum(GObject *obj, const gchar *prop, gint val)
+{
+	set_prop(obj, prop, g_value_set_enum, G_TYPE_ENUM, val);
+}
+
+G_GNUC_INTERNAL void
+g_gpiod_set_prop_bool(GObject *obj, const gchar *prop, gboolean val)
+{
+	set_prop(obj, prop, g_value_set_boolean, G_TYPE_BOOLEAN, val);
+}
+
+G_GNUC_INTERNAL void
+g_gpiod_set_prop_timespan(GObject *obj, const gchar *prop, GTimeSpan val)
+{
+	set_prop(obj, prop, g_value_set_int64, G_TYPE_INT64, val);
+}
+
+G_GNUC_INTERNAL GPIODLineDirection
+g_gpiod_line_direction_from_library(enum gpiod_line_direction direction,
+				    gboolean allow_as_is)
+{
+	switch (direction) {
+	case GPIOD_LINE_DIRECTION_AS_IS:
+		if (allow_as_is)
+			return G_GPIOD_LINE_DIRECTION_AS_IS;
+		break;
+	case GPIOD_LINE_DIRECTION_INPUT:
+		return G_GPIOD_LINE_DIRECTION_INPUT;
+	case GPIOD_LINE_DIRECTION_OUTPUT:
+		return G_GPIOD_LINE_DIRECTION_OUTPUT;
+	}
+
+	g_error("invalid line direction value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GPIODLineEdge
+g_gpiod_line_edge_from_library(enum gpiod_line_edge edge)
+{
+	switch (edge) {
+	case GPIOD_LINE_EDGE_NONE:
+		return G_GPIOD_LINE_EDGE_NONE;
+	case GPIOD_LINE_EDGE_RISING:
+		return G_GPIOD_LINE_EDGE_RISING;
+	case GPIOD_LINE_EDGE_FALLING:
+		return G_GPIOD_LINE_EDGE_FALLING;
+	case GPIOD_LINE_EDGE_BOTH:
+		return G_GPIOD_LINE_EDGE_BOTH;
+	}
+
+	g_error("invalid line edge value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GPIODLineBias
+g_gpiod_line_bias_from_library(enum gpiod_line_bias bias, gboolean allow_as_is)
+{
+	switch (bias) {
+	case GPIOD_LINE_BIAS_AS_IS:
+		if (allow_as_is)
+			return G_GPIOD_LINE_BIAS_AS_IS;
+		break;
+	case GPIOD_LINE_BIAS_UNKNOWN:
+		return G_GPIOD_LINE_BIAS_UNKNOWN;
+	case GPIOD_LINE_BIAS_DISABLED:
+		return G_GPIOD_LINE_BIAS_DISABLED;
+	case GPIOD_LINE_BIAS_PULL_UP:
+		return G_GPIOD_LINE_BIAS_PULL_UP;
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		return G_GPIOD_LINE_BIAS_PULL_DOWN;
+	}
+
+	g_error("invalid line bias value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GPIODLineDrive
+g_gpiod_line_drive_from_library(enum gpiod_line_drive drive)
+{
+	switch (drive) {
+	case GPIOD_LINE_DRIVE_PUSH_PULL:
+		return G_GPIOD_LINE_DRIVE_PUSH_PULL;
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
+		return G_GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		return G_GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	}
+
+	g_error("invalid line drive value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GPIODLineClock
+g_gpiod_line_clock_from_library(enum gpiod_line_clock event_clock)
+{
+	switch (event_clock) {
+	case GPIOD_LINE_CLOCK_MONOTONIC:
+		return G_GPIOD_LINE_CLOCK_MONOTONIC;
+	case GPIOD_LINE_CLOCK_REALTIME:
+		return G_GPIOD_LINE_CLOCK_REALTIME;
+	case GPIOD_LINE_CLOCK_HTE:
+		return G_GPIOD_LINE_CLOCK_HTE;
+	}
+
+	g_error("invalid line event clock value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GPIODLineValue
+g_gpiod_line_value_from_library(enum gpiod_line_value value)
+{
+	switch (value) {
+	case GPIOD_LINE_VALUE_INACTIVE:
+		return G_GPIOD_LINE_VALUE_INACTIVE;
+	case GPIOD_LINE_VALUE_ACTIVE:
+		return G_GPIOD_LINE_VALUE_ACTIVE;
+	default:
+		break;
+	}
+
+	g_error("invalid line value returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GPIODInfoEventType
+g_gpiod_info_event_type_from_library(enum gpiod_info_event_type type)
+{
+	switch (type) {
+	case GPIOD_INFO_EVENT_LINE_REQUESTED:
+		return G_GPIOD_INFO_EVENT_LINE_REQUESTED;
+	case GPIOD_INFO_EVENT_LINE_RELEASED:
+		return G_GPIOD_INFO_EVENT_LINE_RELEASED;
+	case GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED:
+		return G_GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED;
+	}
+	
+	g_error("invalid info-event type returned by libgpiod");
+}
+
+G_GNUC_INTERNAL GPIODEdgeEventType
+g_gpiod_edge_event_type_from_library(enum gpiod_edge_event_type type)
+{
+	switch (type) {
+	case GPIOD_EDGE_EVENT_RISING_EDGE:
+		return G_GPIOD_EDGE_EVENT_RISING_EDGE;
+	case GPIOD_EDGE_EVENT_FALLING_EDGE:
+		return G_GPIOD_EDGE_EVENT_FALLING_EDGE;
+	}
+
+	g_error("invalid edge-event type returned by libgpiod");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_direction
+g_gpiod_line_direction_to_library(GPIODLineDirection direction)
+{
+	switch (direction) {
+	case G_GPIOD_LINE_DIRECTION_AS_IS:
+		return GPIOD_LINE_DIRECTION_AS_IS;
+	case G_GPIOD_LINE_DIRECTION_INPUT:
+		return GPIOD_LINE_DIRECTION_INPUT;
+	case G_GPIOD_LINE_DIRECTION_OUTPUT:
+		return GPIOD_LINE_DIRECTION_OUTPUT;
+	}
+
+	g_error("invalid line direction value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_edge
+g_gpiod_line_edge_to_library(GPIODLineEdge edge)
+{
+	switch (edge) {
+	case G_GPIOD_LINE_EDGE_NONE:
+		return GPIOD_LINE_EDGE_NONE;
+	case G_GPIOD_LINE_EDGE_RISING:
+		return GPIOD_LINE_EDGE_RISING;
+	case G_GPIOD_LINE_EDGE_FALLING:
+		return GPIOD_LINE_EDGE_FALLING;
+	case G_GPIOD_LINE_EDGE_BOTH:
+		return GPIOD_LINE_EDGE_BOTH;
+	}
+
+	g_error("invalid line edge value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_bias
+g_gpiod_line_bias_to_library(GPIODLineBias bias)
+{
+	switch (bias) {
+	case G_GPIOD_LINE_BIAS_AS_IS:
+		return GPIOD_LINE_BIAS_AS_IS;
+	case G_GPIOD_LINE_BIAS_DISABLED:
+		return GPIOD_LINE_BIAS_DISABLED;
+	case G_GPIOD_LINE_BIAS_PULL_UP:
+		return GPIOD_LINE_BIAS_PULL_UP;
+	case G_GPIOD_LINE_BIAS_PULL_DOWN:
+		return GPIOD_LINE_BIAS_PULL_DOWN;
+	default:
+		break;
+	}
+
+	g_error("invalid line bias value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_drive
+g_gpiod_line_drive_to_library(GPIODLineDrive drive)
+{
+	switch (drive) {
+	case G_GPIOD_LINE_DRIVE_PUSH_PULL:
+		return GPIOD_LINE_DRIVE_PUSH_PULL;
+	case G_GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		return GPIOD_LINE_DRIVE_OPEN_SOURCE;
+	case G_GPIOD_LINE_DRIVE_OPEN_DRAIN:
+		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
+	}
+
+	g_error("invalid line drive value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_clock
+g_gpiod_line_clock_to_library(GPIODLineClock event_clock)
+{
+	switch (event_clock) {
+	case G_GPIOD_LINE_CLOCK_MONOTONIC:
+		return GPIOD_LINE_CLOCK_MONOTONIC;
+	case G_GPIOD_LINE_CLOCK_REALTIME:
+		return GPIOD_LINE_CLOCK_REALTIME;
+	case G_GPIOD_LINE_CLOCK_HTE:
+		return GPIOD_LINE_CLOCK_HTE;
+	}
+
+	g_error("invalid line clock value");
+}
+
+G_GNUC_INTERNAL enum gpiod_line_value
+g_gpiod_line_value_to_library(GPIODLineValue value)
+{
+	switch (value) {
+	case G_GPIOD_LINE_VALUE_INACTIVE:
+		return GPIOD_LINE_VALUE_INACTIVE;
+	case G_GPIOD_LINE_VALUE_ACTIVE:
+		return GPIOD_LINE_VALUE_ACTIVE;
+	}
+
+	g_error("invalid line value");
+}
diff --git a/bindings/glib/internal.h b/bindings/glib/internal.h
new file mode 100644
index 0000000..a1fa516
--- /dev/null
+++ b/bindings/glib/internal.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIOD_GLIB_INTERNAL_H__
+#define __GPIOD_GLIB_INTERNAL_H__
+
+#include <glib.h>
+#include <glib-object.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+void g_gpiod_set_error_from_errno(GError **err, const gchar *fmt, ...);
+
+const gchar *g_gpiod_get_prop_string(GObject *obj, const gchar *prop);
+gboolean g_gpiod_get_prop_bool(GObject *obj, const gchar *prop);
+gint g_gpiod_get_prop_enum(GObject *obj, const gchar *prop);
+guint g_gpiod_get_prop_uint(GObject *obj, const gchar *prop);
+guint64 g_gpiod_get_prop_uint64(GObject *obj, const gchar *prop);
+gulong g_gpiod_get_prop_ulong(GObject *obj, const gchar *prop);
+GTimeSpan g_gpiod_get_prop_timespan(GObject *obj, const gchar *prop);
+GObject *g_gpiod_get_prop_object(GObject *obj, const gchar *prop);
+gpointer g_gpiod_get_prop_pointer(GObject *obj, const gchar *prop);
+gpointer g_gpiod_get_prop_boxed_array(GObject *obj, const gchar *prop);
+
+void g_gpiod_set_prop_uint(GObject *obj, const gchar *prop, guint val);
+void g_gpiod_set_prop_string(GObject *obj, const gchar *prop, const gchar *val);
+void g_gpiod_set_prop_enum(GObject *obj, const gchar *prop, gint val);
+void g_gpiod_set_prop_bool(GObject *obj, const gchar *prop, gboolean val);
+void g_gpiod_set_prop_timespan(GObject *obj, const gchar *prop, GTimeSpan val);
+
+GPIODLineDirection
+g_gpiod_line_direction_from_library(enum gpiod_line_direction direction,
+				    gboolean allow_as_is);
+GPIODLineEdge g_gpiod_line_edge_from_library(enum gpiod_line_edge edge);
+GPIODLineBias g_gpiod_line_bias_from_library(enum gpiod_line_bias bias,
+					     gboolean allow_as_is);
+GPIODLineDrive g_gpiod_line_drive_from_library(enum gpiod_line_drive drive);
+GPIODLineClock
+g_gpiod_line_clock_from_library(enum gpiod_line_clock event_clock);
+GPIODLineValue g_gpiod_line_value_from_library(enum gpiod_line_value value);
+GPIODInfoEventType
+g_gpiod_info_event_type_from_library(enum gpiod_info_event_type type);
+GPIODEdgeEventType
+g_gpiod_edge_event_type_from_library(enum gpiod_edge_event_type type);
+
+enum gpiod_line_direction
+g_gpiod_line_direction_to_library(GPIODLineDirection direction);
+enum gpiod_line_edge g_gpiod_line_edge_to_library(GPIODLineEdge edge);
+enum gpiod_line_bias g_gpiod_line_bias_to_library(GPIODLineBias bias);
+enum gpiod_line_drive g_gpiod_line_drive_to_library(GPIODLineDrive drive);
+enum gpiod_line_clock g_gpiod_line_clock_to_library(GPIODLineClock event_clock);
+enum gpiod_line_value g_gpiod_line_value_to_library(GPIODLineValue value);
+
+#endif /* __GPIOD_GLIB_INTERNAL_H__ */
diff --git a/bindings/glib/line-config.c b/bindings/glib/line-config.c
new file mode 100644
index 0000000..4fc1585
--- /dev/null
+++ b/bindings/glib/line-config.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+#include "internal.h"
+
+struct _GPIODLineConfig {
+	GObject parent_instance;
+	struct gpiod_line_config *handle;
+};
+
+enum {
+	G_GPIOD_LINE_CONFIG_PROP_HANDLE = 1,
+	G_GPIOD_LINE_CONFIG_PROP_CONFIGURED_OFFSETS,
+};
+
+G_DEFINE_TYPE(GPIODLineConfig, g_gpiod_line_config, G_TYPE_OBJECT);
+
+static void g_gpiod_line_config_get_property(GObject *obj, guint prop_id,
+					     GValue *val, GParamSpec *pspec)
+{
+	GPIODLineConfig *self = G_GPIOD_LINE_CONFIG_OBJ(obj);
+	g_autofree guint *offsets = NULL;
+	gsize num_offsets, i;
+	GArray *boxed;
+
+	switch (prop_id) {
+	case G_GPIOD_LINE_CONFIG_PROP_HANDLE:
+		g_value_set_pointer(val, self->handle);
+		break;
+	case G_GPIOD_LINE_CONFIG_PROP_CONFIGURED_OFFSETS:
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
+static void g_gpiod_line_config_finalize(GObject *obj)
+{
+	GPIODLineConfig *self = G_GPIOD_LINE_CONFIG_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_config_free);
+
+	G_OBJECT_CLASS(g_gpiod_line_config_parent_class)->finalize(obj);
+}
+
+static void
+g_gpiod_line_config_class_init(GPIODLineConfigClass *line_config_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_config_class);
+
+	class->get_property = g_gpiod_line_config_get_property;
+	class->finalize = g_gpiod_line_config_finalize;
+
+	g_object_class_install_property(class, G_GPIOD_LINE_CONFIG_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO line config object.",
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_CONFIG_PROP_CONFIGURED_OFFSETS,
+		g_param_spec_boxed("configured-offsets", "Configured Offsets",
+			"Array of offsets for which line settings have been set.",
+			G_TYPE_ARRAY,
+			G_PARAM_READABLE));
+}
+
+static void g_gpiod_line_config_init(GPIODLineConfig *self)
+{
+	self->handle = gpiod_line_config_new();
+	if (!self->handle)
+		/* The only possible error is ENOMEM. */
+		g_error("Failed to allocate memory for the request-config object.");
+}
+
+GPIODLineConfig *g_gpiod_line_config_new(void)
+{
+	return G_GPIOD_LINE_CONFIG_OBJ(
+			g_object_new(G_GPIOD_LINE_CONFIG_TYPE, NULL));
+}
+
+void g_gpiod_line_config_reset(GPIODLineConfig *self)
+{
+	g_assert(self);
+
+	gpiod_line_config_reset(self->handle);
+}
+
+gboolean g_gpiod_line_config_add_line_settings(GPIODLineConfig *self,
+					       const GArray *offsets,
+					       GPIODLineSettings *settings,
+					       GError **err)
+{
+	struct gpiod_line_settings *settings_handle;
+	int ret;
+
+	g_assert(self);
+
+	if (!offsets || !offsets->len) {
+		g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL,
+			    "at least one offset must be specified when adding line settings");
+		return FALSE;
+	}
+
+	settings_handle = settings ?
+		g_gpiod_get_prop_pointer(G_OBJECT(settings), "handle") : NULL;
+	ret = gpiod_line_config_add_line_settings(self->handle,
+						  (unsigned int *)offsets->data,
+						  offsets->len,
+						  settings_handle);
+	if (ret) {
+		g_gpiod_set_error_from_errno(err,
+			"failed to add line settings to line config");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GPIODLineSettings *
+g_gpiod_line_config_get_line_settings(GPIODLineConfig *self, guint offset)
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
+	return G_GPIOD_LINE_SETTINGS_OBJ(
+		g_object_new(G_GPIOD_LINE_SETTINGS_TYPE,
+			     "handle", settings, NULL));
+}
+
+gboolean g_gpiod_line_config_set_output_values(GPIODLineConfig *self,
+					       const GArray *values,
+					       GError **err)
+{
+	g_autofree enum gpiod_line_value *vals = NULL;
+	gint ret;
+	guint i;
+
+	g_assert(self);
+
+	vals = g_malloc0(sizeof(*vals) * values->len);
+	for (i = 0; i < values->len; i++)
+		vals[i] = g_gpiod_line_value_to_library(
+				g_array_index(values, GPIODLineValue, i));
+
+	ret = gpiod_line_config_set_output_values(self->handle, vals,
+						  values->len);
+	if (ret) {
+		g_gpiod_set_error_from_errno(err,
+				"unable to set output values");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+GArray *g_gpiod_line_config_get_configured_offsets(GPIODLineConfig *self)
+{
+	return g_gpiod_get_prop_boxed_array(G_OBJECT(self),
+					    "configured-offsets");
+}
diff --git a/bindings/glib/line-info.c b/bindings/glib/line-info.c
new file mode 100644
index 0000000..38b332f
--- /dev/null
+++ b/bindings/glib/line-info.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+#include "internal.h"
+
+struct _GPIODLineInfo {
+	GObject parent_instance;
+	struct gpiod_line_info *handle;
+};
+
+enum {
+	G_GPIOD_LINE_INFO_PROP_HANDLE = 1,
+	G_GPIOD_LINE_INFO_PROP_OFFSET,
+	G_GPIOD_LINE_INFO_PROP_NAME,
+	G_GPIOD_LINE_INFO_PROP_USED,
+	G_GPIOD_LINE_INFO_PROP_CONSUMER,
+	G_GPIOD_LINE_INFO_PROP_DIRECTION,
+	G_GPIOD_LINE_INFO_PROP_EDGE_DETECTION,
+	G_GPIOD_LINE_INFO_PROP_BIAS,
+	G_GPIOD_LINE_INFO_PROP_DRIVE,
+	G_GPIOD_LINE_INFO_PROP_ACTIVE_LOW,
+	G_GPIOD_LINE_INFO_PROP_DEBOUNCED,
+	G_GPIOD_LINE_INFO_PROP_DEBOUNCE_PERIOD,
+	G_GPIOD_LINE_INFO_PROP_EVENT_CLOCK,
+};
+
+G_DEFINE_TYPE(GPIODLineInfo, g_gpiod_line_info, G_TYPE_OBJECT);
+
+static void g_gpiod_line_info_get_property(GObject *obj, guint prop_id,
+					   GValue *val, GParamSpec *pspec)
+{
+	GPIODLineInfo *self = G_GPIOD_LINE_INFO_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_LINE_INFO_PROP_OFFSET:
+		g_value_set_uint(val, gpiod_line_info_get_offset(self->handle));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_NAME:
+		g_value_set_static_string(val,
+			gpiod_line_info_get_name(self->handle));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_USED:
+		g_value_set_boolean(val, gpiod_line_info_is_used(self->handle));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_CONSUMER:
+		g_value_set_static_string(val,
+			gpiod_line_info_get_consumer(self->handle));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_DIRECTION:
+		g_value_set_enum(val,
+			g_gpiod_line_direction_from_library(
+				gpiod_line_info_get_direction(self->handle),
+				FALSE));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_EDGE_DETECTION:
+		g_value_set_enum(val,
+			g_gpiod_line_edge_from_library(
+				gpiod_line_info_get_edge_detection(
+					self->handle)));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_BIAS:
+		g_value_set_enum(val,
+			g_gpiod_line_bias_from_library(
+				gpiod_line_info_get_bias(self->handle),
+				FALSE));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_DRIVE:
+		g_value_set_enum(val,
+			g_gpiod_line_drive_from_library(
+				gpiod_line_info_get_drive(self->handle)));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_ACTIVE_LOW:
+		g_value_set_boolean(val,
+			gpiod_line_info_is_active_low(self->handle));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_DEBOUNCED:
+		g_value_set_boolean(val,
+			gpiod_line_info_is_debounced(self->handle));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_DEBOUNCE_PERIOD:
+		g_value_set_int64(val,
+			gpiod_line_info_get_debounce_period_us(self->handle));
+		break;
+	case G_GPIOD_LINE_INFO_PROP_EVENT_CLOCK:
+		g_value_set_enum(val,
+			g_gpiod_line_clock_from_library(
+				gpiod_line_info_get_event_clock(self->handle)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_line_info_set_property(GObject *obj, guint prop_id,
+					   const GValue *val, GParamSpec *pspec)
+{
+	GPIODLineInfo *self = G_GPIOD_LINE_INFO_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_LINE_INFO_PROP_HANDLE:
+		self->handle = g_value_get_pointer(val);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_line_info_finalize(GObject *obj)
+{
+	GPIODLineInfo *self = G_GPIOD_LINE_INFO_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_info_free);
+
+	G_OBJECT_CLASS(g_gpiod_line_info_parent_class)->finalize(obj);
+}
+
+static void g_gpiod_line_info_class_init(GPIODLineInfoClass *line_info_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_info_class);
+
+	class->set_property = g_gpiod_line_info_set_property;
+	class->get_property = g_gpiod_line_info_get_property;
+	class->finalize = g_gpiod_line_info_finalize;
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO line information object.",
+			G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_OFFSET,
+		g_param_spec_uint("offset", "Offset",
+			"Offset of the GPIO line.",
+			0, G_MAXUINT, 0, G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_NAME,
+		g_param_spec_string("name", "Name",
+			"Name of the GPIO line, if named.",
+			NULL, G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_USED,
+		g_param_spec_boolean("used", "Is Used",
+			"Indicates whether the GPIO line is requested for exclusive usage",
+			FALSE, G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_CONSUMER,
+		g_param_spec_string("consumer", "Consumer",
+			"Name of the consumer of the GPIO line, if requested.",
+			NULL, G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_DIRECTION,
+		g_param_spec_enum("direction", "Direction",
+			"Direction of the GPIO line.",
+			G_GPIOD_LINE_DIRECTION_TYPE,
+			G_GPIOD_LINE_DIRECTION_INPUT,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_INFO_PROP_EDGE_DETECTION,
+		g_param_spec_enum("edge-detection", "Edge Detection",
+			"Edge detection setting of the GPIO line.",
+			G_GPIOD_LINE_EDGE_TYPE,
+			G_GPIOD_LINE_EDGE_NONE,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_BIAS,
+		g_param_spec_enum("bias", "Bias",
+			"Bias setting of the GPIO line.",
+			G_GPIOD_LINE_BIAS_TYPE,
+			G_GPIOD_LINE_BIAS_UNKNOWN,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_DRIVE,
+		g_param_spec_enum("drive", "Drive",
+			"Drive setting of the GPIO line.",
+			G_GPIOD_LINE_DRIVE_TYPE,
+			G_GPIOD_LINE_DRIVE_PUSH_PULL,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_INFO_PROP_ACTIVE_LOW,
+		g_param_spec_boolean("active-low", "Is Active-Low",
+			"Indicates whether the signal of the line is inverted.",
+			FALSE, G_PARAM_READABLE));
+
+	g_object_class_install_property(class, G_GPIOD_LINE_INFO_PROP_DEBOUNCED,
+		g_param_spec_boolean("debounced", "Is Debounced",
+			"Indicates whether the line is debounced (by hardware or by the kernel software debouncer).",
+			FALSE, G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_INFO_PROP_DEBOUNCE_PERIOD,
+		g_param_spec_int64("debounce-period-us",
+			"Debounce Period (in microseconds)",
+			"Debounce period of the line (expressed in microseconds).",
+			0, G_MAXINT64, 0,
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_INFO_PROP_EVENT_CLOCK,
+		g_param_spec_enum("event-clock", "Event Clock",
+			"Event clock used to timestamp the edge events of the line.",
+			G_GPIOD_LINE_CLOCK_TYPE,
+			G_GPIOD_LINE_CLOCK_MONOTONIC,
+			G_PARAM_READABLE));
+}
+
+static void g_gpiod_line_info_init(GPIODLineInfo *self)
+{
+	self->handle = NULL;
+}
+
+guint g_gpiod_line_info_get_offset(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_uint(G_OBJECT(self), "offset");
+}
+
+const gchar *g_gpiod_line_info_get_name(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_string(G_OBJECT(self), "name");
+}
+
+gboolean g_gpiod_line_info_is_used(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_bool(G_OBJECT(self), "used");
+}
+
+const gchar *g_gpiod_line_info_get_consumer(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_string(G_OBJECT(self), "consumer");
+}
+
+GPIODLineDirection g_gpiod_line_info_get_direction(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "direction");
+}
+
+GPIODLineEdge g_gpiod_line_info_get_edge_detection(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "edge-detection");
+}
+
+GPIODLineBias g_gpiod_line_info_get_bias(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "bias");
+}
+
+GPIODLineDrive g_gpiod_line_info_get_drive(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "drive");
+}
+
+gboolean g_gpiod_line_info_is_active_low(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_bool(G_OBJECT(self), "active-low");
+}
+
+gboolean g_gpiod_line_info_is_debounced(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_bool(G_OBJECT(self), "debounced");
+}
+
+GTimeSpan g_gpiod_line_info_get_debounce_period_us(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_timespan(G_OBJECT(self), "debounce-period-us");
+}
+
+GPIODLineClock g_gpiod_line_info_get_event_clock(GPIODLineInfo *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "event-clock");
+}
diff --git a/bindings/glib/line-request.c b/bindings/glib/line-request.c
new file mode 100644
index 0000000..d26dd9c
--- /dev/null
+++ b/bindings/glib/line-request.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+#include "internal.h"
+
+static const gsize event_buf_size = 64;
+
+struct _GPIODLineRequest {
+	GObject parent_instance;
+	struct gpiod_line_request *handle;
+	struct gpiod_edge_event_buffer *event_buf;
+	GSource *edge_event_src;
+	guint edge_event_src_id;
+	enum gpiod_line_value *val_buf;
+};
+
+enum {
+	G_GPIOD_LINE_REQUEST_PROP_HANDLE = 1,
+	G_GPIOD_LINE_REQUEST_PROP_CHIP_NAME,
+	G_GPIOD_LINE_REQUEST_PROP_REQUESTED_OFFSETS,
+};
+
+enum {
+	G_GPIOD_LINE_REQUEST_SIGNAL_EDGE_EVENT,
+	G_GPIOD_LINE_REQUEST_SIGNAL_LAST,
+};
+
+static guint signals[G_GPIOD_LINE_REQUEST_SIGNAL_LAST];
+
+G_DEFINE_TYPE(GPIODLineRequest, g_gpiod_line_request, G_TYPE_OBJECT);
+
+static gboolean
+g_gpiod_line_request_on_edge_event(GIOChannel *source G_GNUC_UNUSED,
+				   GIOCondition condition G_GNUC_UNUSED,
+				   gpointer data)
+{
+	struct gpiod_edge_event *event_handle, *event_copy;
+	GPIODLineRequest *self = data;
+	gint ret, i;
+
+	ret = gpiod_line_request_read_edge_events(self->handle,
+						  self->event_buf,
+						  event_buf_size);
+	if (ret < 0)
+		return TRUE;
+
+	for (i = 0; i < ret; i++) {
+		g_autoptr(GPIODEdgeEvent) event = NULL;
+
+		event_handle = gpiod_edge_event_buffer_get_event(
+						self->event_buf, i);
+		event_copy = gpiod_edge_event_copy(event_handle);
+		if (!event_copy)
+			g_error("failed to copy the edge event");
+
+		event = G_GPIOD_EDGE_EVENT_OBJ(
+				g_object_new(G_GPIOD_EDGE_EVENT_TYPE,
+					     "handle", event_copy, NULL));
+
+		g_signal_emit(self,
+			      signals[G_GPIOD_LINE_REQUEST_SIGNAL_EDGE_EVENT],
+			      0,
+			      event);
+	}
+
+	return TRUE;
+}
+
+static void g_gpiod_line_request_constructed(GObject *obj)
+{
+	GPIODLineRequest *self = G_GPIOD_LINE_REQUEST_OBJ(obj);
+	g_autoptr(GIOChannel) channel = NULL;
+	gsize num_lines;
+
+	self->event_buf = gpiod_edge_event_buffer_new(event_buf_size);
+	if (!self->event_buf)
+		g_error("failed to allocate the edge event buffer");
+
+	channel = g_io_channel_unix_new(
+			gpiod_line_request_get_fd(self->handle));
+	self->edge_event_src = g_io_create_watch(channel, G_IO_IN);
+	g_source_set_callback(self->edge_event_src,
+			      G_SOURCE_FUNC(g_gpiod_line_request_on_edge_event),
+			      self, NULL);
+	self->edge_event_src_id = g_source_attach(self->edge_event_src, NULL);
+
+	num_lines = gpiod_line_request_get_num_requested_lines(self->handle);
+	self->val_buf = g_malloc0(sizeof(enum gpiod_line_value) * num_lines);
+
+	G_OBJECT_CLASS(g_gpiod_line_request_parent_class)->constructed(obj);
+}
+
+static void g_gpiod_line_request_get_property(GObject *obj, guint prop_id,
+						GValue *val, GParamSpec *pspec)
+{
+	GPIODLineRequest *self = G_GPIOD_LINE_REQUEST_OBJ(obj);
+	g_autofree guint *offsets = NULL;
+	gsize num_offsets;
+	GArray *boxed;
+
+	switch (prop_id) {
+	case G_GPIOD_LINE_REQUEST_PROP_CHIP_NAME:
+		g_value_set_static_string(val,
+			gpiod_line_request_get_chip_name(self->handle));
+		break;
+	case G_GPIOD_LINE_REQUEST_PROP_REQUESTED_OFFSETS:
+		boxed = g_array_new(FALSE, TRUE, sizeof(guint));
+
+		if (!g_gpiod_line_request_is_released(self)) {
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
+static void g_gpiod_line_request_set_property(GObject *obj, guint prop_id,
+					       const GValue *val, GParamSpec *pspec)
+{
+	GPIODLineRequest *self = G_GPIOD_LINE_REQUEST_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_LINE_REQUEST_PROP_HANDLE:
+		self->handle = g_value_get_pointer(val);
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_line_request_dispose(GObject *obj)
+{
+	GPIODLineRequest *self = G_GPIOD_LINE_REQUEST_OBJ(obj);
+
+	if (self->edge_event_src_id)
+		g_source_remove(self->edge_event_src_id);
+
+	G_OBJECT_CLASS(g_gpiod_line_request_parent_class)->dispose(obj);
+}
+
+static void g_gpiod_line_request_finalize(GObject *obj)
+{
+	GPIODLineRequest *self = G_GPIOD_LINE_REQUEST_OBJ(obj);
+
+	g_gpiod_line_request_release(self);
+	g_clear_pointer(&self->event_buf, gpiod_edge_event_buffer_free);
+	g_clear_pointer(&self->val_buf, g_free);
+
+	G_OBJECT_CLASS(g_gpiod_line_request_parent_class)->finalize(obj);
+}
+
+static void g_gpiod_line_request_class_init(GPIODLineRequestClass *line_request_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_request_class);
+
+	class->constructed = g_gpiod_line_request_constructed;
+	class->set_property = g_gpiod_line_request_set_property;
+	class->get_property = g_gpiod_line_request_get_property;
+	class->dispose = g_gpiod_line_request_dispose;
+	class->finalize = g_gpiod_line_request_finalize;
+
+	g_object_class_install_property(class, G_GPIOD_LINE_REQUEST_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO line request object.",
+			G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_REQUEST_PROP_CHIP_NAME,
+		g_param_spec_string("chip-name", "Chip Name",
+			"Name of the GPIO chip this request was made on.",
+			NULL, G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_REQUEST_PROP_REQUESTED_OFFSETS,
+		g_param_spec_boxed("requested-offsets", "Requested offsets",
+			"Array of requested offsets.",
+			G_TYPE_ARRAY,
+			G_PARAM_READABLE));
+
+	signals[G_GPIOD_LINE_REQUEST_SIGNAL_EDGE_EVENT] =
+			g_signal_new("edge-event",
+				     G_TYPE_FROM_CLASS(line_request_class),
+				     G_SIGNAL_RUN_LAST,
+				     0,
+				     NULL,
+				     NULL,
+				     g_cclosure_marshal_generic,
+				     G_TYPE_NONE,
+				     1,
+				     G_GPIOD_EDGE_EVENT_TYPE);
+}
+
+static void g_gpiod_line_request_init(GPIODLineRequest *self)
+{
+	self->handle = NULL;
+	self->event_buf = NULL;
+	self->edge_event_src = NULL;
+}
+
+void g_gpiod_line_request_release(GPIODLineRequest *self)
+{
+	g_assert(self);
+
+	g_clear_pointer(&self->edge_event_src, g_source_unref);
+	g_clear_pointer(&self->handle, gpiod_line_request_release);
+}
+
+gboolean g_gpiod_line_request_is_released(GPIODLineRequest *self)
+{
+	g_assert(self);
+
+	return !self->handle;
+}
+
+static void set_err_request_released(GError **err)
+{
+	g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_REQUEST_RELEASED,
+		    "line request was released and cannot be used");
+}
+
+const gchar *g_gpiod_line_request_get_chip_name(GPIODLineRequest *self)
+{
+	return g_gpiod_get_prop_string(G_OBJECT(self), "chip-name");
+}
+
+GArray *g_gpiod_line_request_get_requested_offsets(GPIODLineRequest *self)
+{
+	return g_gpiod_get_prop_boxed_array(G_OBJECT(self),
+					    "requested-offsets");
+}
+
+gboolean g_gpiod_line_request_reconfigure_lines(GPIODLineRequest *self,
+						GPIODLineConfig *config,
+						GError **err)
+{
+	struct gpiod_line_config *config_handle;
+	gint ret;
+
+	g_assert(self);
+
+	if (g_gpiod_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!config) {
+		g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL,
+			    "line-config is required to reconfigure lines");
+		return FALSE;
+	}
+
+	config_handle = g_gpiod_get_prop_pointer(G_OBJECT(config), "handle");
+
+	ret = gpiod_line_request_reconfigure_lines(self->handle, config_handle);
+	if (ret) {
+		g_gpiod_set_error_from_errno(err,
+					     "failed to reconfigure lines");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean
+g_gpiod_line_request_get_value(GPIODLineRequest *self, guint offset,
+			       GPIODLineValue *value, GError **err)
+{
+	enum gpiod_line_value val;
+
+	g_assert(self);
+
+	if (g_gpiod_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	val = gpiod_line_request_get_value(self->handle, offset);
+	if (val == GPIOD_LINE_VALUE_ERROR) {
+		g_gpiod_set_error_from_errno(err,
+			    "failed to get line value for offset %u", offset);
+		return FALSE;
+	}
+
+	*value = g_gpiod_line_value_from_library(val);
+	return TRUE;
+}
+
+gboolean g_gpiod_line_request_get_values_subset(GPIODLineRequest *self,
+						const GArray *offsets,
+						GArray **values,
+						GError **err)
+{
+	guint i;
+	int ret;
+
+	g_assert(self);
+
+	if (g_gpiod_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!offsets || !values) {
+		g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL,
+			    "offsets and values must not be NULL");
+		return FALSE;
+	}
+
+	ret = gpiod_line_request_get_values_subset(self->handle, offsets->len,
+					(const unsigned int *)offsets->data,
+					self->val_buf);
+	if (ret) {
+		g_gpiod_set_error_from_errno(err, "failed to read line values");
+		return FALSE;
+	}
+
+	if (!(*values)) {
+		*values = g_array_sized_new(FALSE, TRUE,
+					    sizeof(GPIODLineValue),
+					    offsets->len);
+	}
+
+	g_array_set_size(*values, offsets->len);
+
+	for (i = 0; i < offsets->len; i++) {
+		GPIODLineValue *val = &g_array_index(*values, GPIODLineValue, i);
+		*val = g_gpiod_line_value_from_library(self->val_buf[i]);
+	}
+
+	return TRUE;
+}
+
+gboolean g_gpiod_line_request_get_values(GPIODLineRequest *self,
+					 GArray **values, GError **err)
+{
+	g_autoptr(GArray) offsets = NULL;
+
+	offsets = g_gpiod_line_request_get_requested_offsets(self);
+
+	return g_gpiod_line_request_get_values_subset(self, offsets,
+						      values, err);
+}
+
+gboolean g_gpiod_line_request_set_value(GPIODLineRequest *self, guint offset,
+					GPIODLineValue value, GError **err)
+{
+	int ret;
+
+	g_assert(self);
+
+	if (g_gpiod_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	ret = gpiod_line_request_set_value(self->handle, offset,
+				g_gpiod_line_value_to_library(value));
+	if (ret) {
+		g_gpiod_set_error_from_errno(err,
+			"failed to set line value for offset: %u", offset);
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean g_gpiod_line_request_set_values_subset(GPIODLineRequest *self,
+						const GArray *offsets,
+						const GArray *values,
+						GError **err)
+{
+	guint i;
+	int ret;
+
+	g_assert(self);
+
+	if (g_gpiod_line_request_is_released(self)) {
+		set_err_request_released(err);
+		return FALSE;
+	}
+
+	if (!offsets || !values) {
+		g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL,
+			    "offsets and values must not be NULL");
+		return FALSE;
+	}
+
+	if (offsets->len != values->len) {
+		g_set_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL,
+			    "offsets and values must have the sme size");
+		return FALSE;
+	}
+
+	for (i = 0; i < values->len; i++)
+		self->val_buf[i] = g_gpiod_line_value_to_library(
+					g_array_index(values,
+						      GPIODLineValue, i));
+
+	ret = gpiod_line_request_set_values_subset(self->handle,
+						offsets->len,
+						(unsigned int *)offsets->data,
+						self->val_buf);
+	if (ret) {
+		g_gpiod_set_error_from_errno(err, "failed to set line values");
+		return FALSE;
+	}
+
+	return TRUE;
+}
+
+gboolean g_gpiod_line_request_set_values(GPIODLineRequest *self,
+					 GArray *values, GError **err)
+{
+	g_autoptr(GArray) offsets = NULL;
+
+	offsets = g_gpiod_line_request_get_requested_offsets(self);
+
+	return g_gpiod_line_request_set_values_subset(self, offsets,
+						      values, err);
+}
diff --git a/bindings/glib/line-settings.c b/bindings/glib/line-settings.c
new file mode 100644
index 0000000..612a17e
--- /dev/null
+++ b/bindings/glib/line-settings.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+#include <stdarg.h>
+
+#include "internal.h"
+
+struct _GPIODLineSettings {
+	GObject parent_instance;
+	struct gpiod_line_settings *handle;
+};
+
+enum {
+	G_GPIOD_LINE_SETTINGS_PROP_HANDLE = 1,
+	G_GPIOD_LINE_SETTINGS_PROP_DIRECTION,
+	G_GPIOD_LINE_SETTINGS_PROP_EDGE_DETECTION,
+	G_GPIOD_LINE_SETTINGS_PROP_BIAS,
+	G_GPIOD_LINE_SETTINGS_PROP_DRIVE,
+	G_GPIOD_LINE_SETTINGS_PROP_ACTIVE_LOW,
+	G_GPIOD_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US,
+	G_GPIOD_LINE_SETTINGS_PROP_EVENT_CLOCK,
+	G_GPIOD_LINE_SETTINGS_PROP_OUTPUT_VALUE,
+};
+
+G_DEFINE_TYPE(GPIODLineSettings, g_gpiod_line_settings, G_TYPE_OBJECT);
+
+static void g_gpiod_line_settings_constructed(GObject *obj)
+{
+	GPIODLineSettings *self = G_GPIOD_LINE_SETTINGS_OBJ(obj);
+
+	/*
+	 * If we still haven't created the handle at this point, do it now.
+	 * This is normal if called did g_gpiod_line_settings_new(NULL).
+	 */
+	if (!self->handle) {
+		self->handle = gpiod_line_settings_new();
+		if (!self->handle)
+			g_error("failed to allocate line settings");
+	}
+
+	G_OBJECT_CLASS(g_gpiod_line_settings_parent_class)->constructed(obj);
+}
+
+static void g_gpiod_line_settings_get_property(GObject *obj, guint prop_id,
+					       GValue *val, GParamSpec *pspec)
+{
+	GPIODLineSettings *self = G_GPIOD_LINE_SETTINGS_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_LINE_SETTINGS_PROP_HANDLE:
+		g_value_set_pointer(val, self->handle);
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_DIRECTION:
+		g_value_set_enum(val,
+			g_gpiod_line_direction_from_library(
+				gpiod_line_settings_get_direction(
+							self->handle), TRUE));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_EDGE_DETECTION:
+		g_value_set_enum(val,
+			g_gpiod_line_edge_from_library(
+				gpiod_line_settings_get_edge_detection(
+							self->handle)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_BIAS:
+		g_value_set_enum(val,
+			g_gpiod_line_bias_from_library(
+				gpiod_line_settings_get_bias(self->handle),
+				TRUE));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_DRIVE:
+		g_value_set_enum(val,
+			g_gpiod_line_drive_from_library(
+				gpiod_line_settings_get_drive(self->handle)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_ACTIVE_LOW:
+		g_value_set_boolean(val,
+			gpiod_line_settings_get_active_low(self->handle));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US:
+		g_value_set_int64(val,
+			gpiod_line_settings_get_debounce_period_us(
+							self->handle));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_EVENT_CLOCK:
+		g_value_set_enum(val,
+			g_gpiod_line_clock_from_library(
+				gpiod_line_settings_get_event_clock(
+							self->handle)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_OUTPUT_VALUE:
+		g_value_set_enum(val,
+			g_gpiod_line_value_from_library(
+				gpiod_line_settings_get_output_value(
+							self->handle)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_line_settings_set_property(GObject *obj, guint prop_id,
+					       const GValue *val,
+					       GParamSpec *pspec)
+{
+	GPIODLineSettings *self = G_GPIOD_LINE_SETTINGS_OBJ(obj);
+
+	if (!self->handle && prop_id != G_GPIOD_LINE_SETTINGS_PROP_HANDLE) {
+		self->handle = gpiod_line_settings_new();
+		if (!self->handle)
+			/* The only possible error is ENOMEM. */
+			g_error("Failed to allocate memory for the line-settings object.");
+	}
+
+	switch (prop_id) {
+	case G_GPIOD_LINE_SETTINGS_PROP_HANDLE:
+		self->handle = g_value_get_pointer(val);
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_DIRECTION:
+		gpiod_line_settings_set_direction(self->handle,
+			g_gpiod_line_direction_to_library(
+				g_value_get_enum(val)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_EDGE_DETECTION:
+		gpiod_line_settings_set_edge_detection(self->handle,
+			g_gpiod_line_edge_to_library(g_value_get_enum(val)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_BIAS:
+		gpiod_line_settings_set_bias(self->handle,
+			g_gpiod_line_bias_to_library(g_value_get_enum(val)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_DRIVE:
+		gpiod_line_settings_set_drive(self->handle,
+			g_gpiod_line_drive_to_library(g_value_get_enum(val)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_ACTIVE_LOW:
+		gpiod_line_settings_set_active_low(self->handle,
+						   g_value_get_boolean(val));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US:
+		gpiod_line_settings_set_debounce_period_us(self->handle,
+						g_value_get_int64(val));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_EVENT_CLOCK:
+		gpiod_line_settings_set_event_clock(self->handle,
+			g_gpiod_line_clock_to_library(g_value_get_enum(val)));
+		break;
+	case G_GPIOD_LINE_SETTINGS_PROP_OUTPUT_VALUE:
+		gpiod_line_settings_set_output_value(self->handle,
+			g_gpiod_line_value_to_library(g_value_get_enum(val)));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_line_settings_finalize(GObject *obj)
+{
+	GPIODLineSettings *self = G_GPIOD_LINE_SETTINGS_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_line_settings_free);
+
+	G_OBJECT_CLASS(g_gpiod_line_settings_parent_class)->finalize(obj);
+}
+
+static void
+g_gpiod_line_settings_class_init(GPIODLineSettingsClass *line_settings_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(line_settings_class);
+
+	class->constructed = g_gpiod_line_settings_constructed;
+	class->set_property = g_gpiod_line_settings_set_property;
+	class->get_property = g_gpiod_line_settings_get_property;
+	class->finalize = g_gpiod_line_settings_finalize;
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_SETTINGS_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO line settings object.",
+			G_PARAM_CONSTRUCT_ONLY | G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_SETTINGS_PROP_DIRECTION,
+		g_param_spec_enum("direction", "Direction",
+			"Line direction setting.",
+			G_GPIOD_LINE_DIRECTION_TYPE,
+			G_GPIOD_LINE_DIRECTION_AS_IS,
+			G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_SETTINGS_PROP_EDGE_DETECTION,
+		g_param_spec_enum("edge-detection", "Edge Detection",
+			"Line edge detection setting.",
+			G_GPIOD_LINE_EDGE_TYPE,
+			G_GPIOD_LINE_EDGE_NONE,
+			G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_SETTINGS_PROP_BIAS,
+		g_param_spec_enum("bias", "Bias",
+			"Line bias setting.",
+			G_GPIOD_LINE_BIAS_TYPE,
+			G_GPIOD_LINE_BIAS_AS_IS,
+			G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_SETTINGS_PROP_DRIVE,
+		g_param_spec_enum("drive", "Drive",
+			"Line drive setting.",
+			G_GPIOD_LINE_DRIVE_TYPE,
+			G_GPIOD_LINE_DRIVE_PUSH_PULL,
+			G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_SETTINGS_PROP_ACTIVE_LOW,
+		g_param_spec_boolean("active-low", "Active-Low",
+			"Line active-low settings.",
+			FALSE, G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_SETTINGS_PROP_DEBOUNCE_PERIOD_US,
+		g_param_spec_int64("debounce-period-us",
+			"Debounce Period (in microseconds)",
+			"Line debounce period (expressed in microseconds).",
+			0, G_MAXINT64, 0, G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_LINE_SETTINGS_PROP_EVENT_CLOCK,
+		g_param_spec_enum("event-clock", "Event Clock",
+			"Clock used to timestamp edge events.",
+			G_GPIOD_LINE_CLOCK_TYPE,
+			G_GPIOD_LINE_CLOCK_MONOTONIC,
+			G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_LINE_SETTINGS_PROP_OUTPUT_VALUE,
+		g_param_spec_enum("output-value", "Output Value",
+			"Line output value.",
+			G_GPIOD_LINE_VALUE_TYPE,
+			G_GPIOD_LINE_VALUE_INACTIVE,
+			G_PARAM_READWRITE));
+}
+
+static void g_gpiod_line_settings_init(GPIODLineSettings *self)
+{
+	self->handle = NULL;
+}
+
+GPIODLineSettings *g_gpiod_line_settings_new(const gchar *first_prop, ...)
+{
+	GPIODLineSettings *settings;
+	va_list va;
+
+	va_start(va, first_prop);
+	settings = G_GPIOD_LINE_SETTINGS_OBJ(
+			g_object_new_valist(G_GPIOD_LINE_SETTINGS_TYPE,
+					    first_prop, va));
+	va_end(va);
+
+	return settings;
+}
+
+void g_gpiod_line_settings_reset(GPIODLineSettings *self)
+{
+	g_assert(self);
+
+	gpiod_line_settings_reset(self->handle);
+}
+
+void g_gpiod_line_settings_set_direction(GPIODLineSettings *self,
+					 GPIODLineDirection direction)
+{
+	g_gpiod_set_prop_enum(G_OBJECT(self), "direction", direction);
+}
+
+GPIODLineDirection g_gpiod_line_settings_get_direction(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "direction");
+}
+
+void g_gpiod_line_settings_set_edge_detection(GPIODLineSettings *self,
+					      GPIODLineEdge edge)
+{
+	g_gpiod_set_prop_enum(G_OBJECT(self), "edge-detection", edge);
+}
+
+GPIODLineEdge g_gpiod_line_settings_get_edge_detection(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "edge-detection");
+}
+
+void g_gpiod_line_settings_set_bias(GPIODLineSettings *self, GPIODLineBias bias)
+{
+	g_gpiod_set_prop_enum(G_OBJECT(self), "bias", bias);
+}
+
+GPIODLineBias g_gpiod_line_settings_get_bias(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "bias");
+}
+
+void g_gpiod_line_settings_set_drive(GPIODLineSettings *self,
+				     GPIODLineDrive drive)
+{
+	g_gpiod_set_prop_enum(G_OBJECT(self), "drive", drive);
+}
+
+GPIODLineDrive g_gpiod_line_settings_get_drive(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "drive");
+}
+
+void g_gpiod_line_settings_set_active_low(GPIODLineSettings *self,
+					  gboolean active_low)
+{
+	g_gpiod_set_prop_bool(G_OBJECT(self), "active-low", active_low);
+}
+
+gboolean g_gpiod_line_settings_get_active_low(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_bool(G_OBJECT(self), "active-low");
+}
+
+void g_gpiod_line_settings_set_debounce_period_us(GPIODLineSettings *self,
+						  GTimeSpan period)
+{
+	g_gpiod_set_prop_timespan(G_OBJECT(self),
+				  "debounce-period-us", period);
+}
+
+GTimeSpan g_gpiod_line_settings_get_debounce_period_us(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_timespan(G_OBJECT(self), "debounce-period-us");
+}
+
+void g_gpiod_line_settings_set_event_clock(GPIODLineSettings *self,
+					   GPIODLineClock event_clock)
+{
+	g_gpiod_set_prop_enum(G_OBJECT(self), "event-clock", event_clock);
+}
+
+GPIODLineClock g_gpiod_line_settings_get_event_clock(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "event-clock");
+}
+
+void g_gpiod_line_settings_set_output_value(GPIODLineSettings *self,
+					    GPIODLineValue value)
+{
+	g_gpiod_set_prop_enum(G_OBJECT(self), "output-value", value);
+}
+
+GPIODLineValue g_gpiod_line_settings_get_output_value(GPIODLineSettings *self)
+{
+	return g_gpiod_get_prop_enum(G_OBJECT(self), "output-value");
+}
diff --git a/bindings/glib/misc.c b/bindings/glib/misc.c
new file mode 100644
index 0000000..139efed
--- /dev/null
+++ b/bindings/glib/misc.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod.h>
+#include <gpiod-glib.h>
+
+gboolean g_gpiod_is_gpiochip_device(const gchar *path)
+{
+	g_assert(path);
+
+	return gpiod_is_gpiochip_device(path);
+}
+
+const gchar *g_gpiod_api_version(void)
+{
+	return gpiod_api_version();
+}
diff --git a/bindings/glib/request-config.c b/bindings/glib/request-config.c
new file mode 100644
index 0000000..05c903b
--- /dev/null
+++ b/bindings/glib/request-config.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gio/gio.h>
+#include <gpiod.h>
+#include <gpiod-glib.h>
+#include <stdarg.h>
+
+#include "internal.h"
+
+struct _GPIODRequestConfig {
+	GObject parent_instance;
+	struct gpiod_request_config *handle;
+};
+
+enum {
+	G_GPIOD_REQUEST_CONFIG_PROP_HANDLE = 1,
+	G_GPIOD_REQUEST_CONFIG_PROP_CONSUMER,
+	G_GPIOD_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE,
+};
+
+G_DEFINE_TYPE(GPIODRequestConfig, g_gpiod_request_config, G_TYPE_OBJECT);
+
+static void g_gpiod_request_config_get_property(GObject *obj, guint prop_id,
+						GValue *val, GParamSpec *pspec)
+{
+	GPIODRequestConfig *self = G_GPIOD_REQUEST_CONFIG_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_REQUEST_CONFIG_PROP_HANDLE:
+		g_value_set_pointer(val, self->handle);
+		break;
+	case G_GPIOD_REQUEST_CONFIG_PROP_CONSUMER:
+		g_value_set_static_string(val,
+			gpiod_request_config_get_consumer(self->handle));
+		break;
+	case G_GPIOD_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE:
+		g_value_set_uint(val,
+			gpiod_request_config_get_event_buffer_size(
+				self->handle));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_request_config_set_property(GObject *obj, guint prop_id,
+						const GValue *val,
+						GParamSpec *pspec)
+{
+	GPIODRequestConfig *self = G_GPIOD_REQUEST_CONFIG_OBJ(obj);
+
+	switch (prop_id) {
+	case G_GPIOD_REQUEST_CONFIG_PROP_CONSUMER:
+		gpiod_request_config_set_consumer(self->handle,
+						  g_value_get_string(val));
+		break;
+	case G_GPIOD_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE:
+		gpiod_request_config_set_event_buffer_size(self->handle,
+							g_value_get_uint(val));
+		break;
+	default:
+		G_OBJECT_WARN_INVALID_PROPERTY_ID(obj, prop_id, pspec);
+	}
+}
+
+static void g_gpiod_request_config_finalize(GObject *obj)
+{
+	GPIODRequestConfig *self = G_GPIOD_REQUEST_CONFIG_OBJ(obj);
+
+	g_clear_pointer(&self->handle, gpiod_request_config_free);
+
+	G_OBJECT_CLASS(g_gpiod_request_config_parent_class)->finalize(obj);
+}
+
+static void
+g_gpiod_request_config_class_init(GPIODRequestConfigClass *request_config_class)
+{
+	GObjectClass *class = G_OBJECT_CLASS(request_config_class);
+
+	class->set_property = g_gpiod_request_config_set_property;
+	class->get_property = g_gpiod_request_config_get_property;
+	class->finalize = g_gpiod_request_config_finalize;
+
+	g_object_class_install_property(class,
+					G_GPIOD_REQUEST_CONFIG_PROP_HANDLE,
+		g_param_spec_pointer("handle", "Handle",
+			"GPIO request config object.",
+			G_PARAM_READABLE));
+
+	g_object_class_install_property(class,
+					G_GPIOD_REQUEST_CONFIG_PROP_CONSUMER,
+		g_param_spec_string("consumer", "Consumer",
+			"Name of the request consumer.",
+			NULL, G_PARAM_READWRITE));
+
+	g_object_class_install_property(class,
+				G_GPIOD_REQUEST_CONFIG_PROP_EVENT_BUFFER_SIZE,
+		g_param_spec_uint("event-buffer-size", "Event Buffer Size",
+			"Size of the kernel event buffer size of the request.",
+			0, G_MAXUINT, 64, G_PARAM_READWRITE));
+}
+
+static void g_gpiod_request_config_init(GPIODRequestConfig *self)
+{
+	self->handle = gpiod_request_config_new();
+	if (!self->handle)
+		/* The only possible error is ENOMEM. */
+		g_error("Failed to allocate memory for the request-config object.");
+}
+
+GPIODRequestConfig *g_gpiod_request_config_new(const gchar *first_prop, ...)
+{
+	GPIODRequestConfig *settings;
+	va_list va;
+
+	va_start(va, first_prop);
+	settings = G_GPIOD_REQUEST_CONFIG_OBJ(
+			g_object_new_valist(G_GPIOD_REQUEST_CONFIG_TYPE,
+					    first_prop, va));
+	va_end(va);
+
+	return settings;
+}
+
+void g_gpiod_request_config_set_consumer(GPIODRequestConfig *self,
+					 const gchar *consumer)
+{
+	g_assert(self);
+
+	g_gpiod_set_prop_string(G_OBJECT(self), "consumer", consumer);
+}
+
+const gchar *g_gpiod_request_config_get_consumer(GPIODRequestConfig *self)
+{
+	g_assert(self);
+
+	return g_gpiod_get_prop_string(G_OBJECT(self), "consumer");
+}
+
+void g_gpiod_request_config_set_event_buffer_size(GPIODRequestConfig *self,
+						  guint event_buffer_size)
+{
+	g_assert(self);
+
+	g_gpiod_set_prop_uint(G_OBJECT(self), "event-buffer-size",
+			      event_buffer_size);
+}
+
+guint g_gpiod_request_config_get_event_buffer_size(GPIODRequestConfig *self)
+{
+	g_assert(self);
+
+	return g_gpiod_get_prop_uint(G_OBJECT(self), "event-buffer-size");
+}

-- 
2.43.0


