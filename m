Return-Path: <linux-gpio+bounces-8266-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF409934AE6
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39281B20C64
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE8C81205;
	Thu, 18 Jul 2024 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c4McRYFi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716EA81AD7
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294926; cv=none; b=QZGuP049mQitqxClyhdroktohrttGyKGaA8MNcFTmi1ppjpto6FGF/wzUYZCF2UlTvj4nNn2ZHW8gAUhvtBFhhSvdDP1IrpUtR/aCuBOIu8a/TXGUZt3yzFrOJo2zdTnJ2aUULn4wKIxWrfKFmAT4h0xMJv34k/mR7dX4LiKeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294926; c=relaxed/simple;
	bh=+cpgB/sUNLElfXii6HKp8dxHm/FplVyOSKb0xmgMpzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aI9nWeh1bLOjyFh+OEunpGATyorqywnr9vSCkM/e5jcVKUr1KPfGpn6Fzj6YVNkNLNzugNDB7txDwm9afeB1rP6iBPRIgILZTs665noH7PMPNJ9Iy1UZrjxf7ABO0wWv+uxRgKbw+3UY5O1nJwSYmvd9sRPqY2fwHJg3lZBSbtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c4McRYFi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso184023f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294921; x=1721899721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzDjC3x46ghGclx++6S3uqoVesqd7loVQVZvAOGTIsw=;
        b=c4McRYFirwmkuEqsboWfjdQR2Dd0zFJ7BqoohROVZObFFEia89EyIfw6ObySlShdrG
         a5NIY5UIu9/JCobwSE2EdSOaDZFBeU1bVKkT8nNokpjM6GGU6NxGGna6gC14YEQ0X+ka
         YcyO5IzXyZaGZYLKQ2VvQVgRB8wQ3RCxk90dI68xKxPnIiEIsk0PM8VZ3tFFGJRlb4YF
         u43jC4gRZV5Cd/mlpYSePpT9jmvEeuKSuFLevfl9LAyC2oEGzqmS9FEbZyHrNacobipH
         4wYz4IjGV5aKDho4uHCAi6ygd8nRtm7xk4OPaO4OBMcn3ljG8DoxgPXEySIjyCG++k88
         cqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294921; x=1721899721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzDjC3x46ghGclx++6S3uqoVesqd7loVQVZvAOGTIsw=;
        b=UK/lIqRnJmQQ4tgktLfJUtrD+VHU2OWlW7mNYRy4q/v3Z8Ox6uWIEylbEZx9wyzkSX
         rS7VSdDzSCR38BFCV/Eowh/aT1RrMbKisx3e8EgUKZuoCLHxcHVMP3sj4bAH4hJLh90M
         ButS5TpXlH6KC5pmSpl4pGdp8ipSwFHDc3L6ZH9qwAay8/CEdPc0LLS16kFr9d00ZD7P
         s3jQhO3y2V3Ys4suPXc1GFq4VBhob6wyyuF0zJxd2D3D/hkKCDuYa5LRz7/NEQdiLo/f
         VVr3/h3j4Oj+ej2X+/C2fOcBjz6fx3VD++YCojoBgxepfuoN9DOIDtCeIKNYHmq9HQds
         YXFw==
X-Gm-Message-State: AOJu0YweheGqiTVTox8WnpW9k4EDvLszyvvX1cN4pHu9FTOAc4W/3dqF
	EJAmgjcOoISHrvb1GCOCIjoIGQR56QZBh5Wv7FbivIcQdAPivTuO5gNu1qce/Ss=
X-Google-Smtp-Source: AGHT+IEvcGg0BbSI63Xluszyrs5zgRNwpQ9OqQE7TD2pJKb550x7Q9I0xtsgsEZo+MOGEC/+vHlBHA==
X-Received: by 2002:a5d:56ce:0:b0:367:9877:750e with SMTP id ffacd0b85a97d-36831605880mr2533471f8f.25.1721294920243;
        Thu, 18 Jul 2024 02:28:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:27:58 +0200
Subject: [PATCH libgpiod v3 04/18] bindings: glib: add public headers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-4-c9ea2604f082@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=50408;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o1YHZRtKPcoebq8WsM64/quJLEmVtRjxOJv66s5/IcE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOA+iOEiLMBjoIzgfSvJ0Kr/chFsiQNrSEZui
 rsfmbniZkqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgPgAKCRARpy6gFHHX
 cnqyEADWKUUioK6KbyKVrJvomP0icca+36isVt+/uOaN7O7oFtQP/a5d8mGTuf9GbwGNOW8dclU
 NNskn7L5aITXM0zsnOwHhTqJ4AEs8hvlM16hO7z7KFlV331Hoa9lJAsvvQlGlRLc971/zVDyxXR
 Wc6+ECFMGo43tAT7fzuK9D79TxHwNrWSIZOez6heKhVXLDo4S1sv3EVWEeMu+C/N9CchFyyx54Q
 sFUfZwG+wlyOdbeOoib21b5RC/zF/8j1B4O1peS0Q0d6sSlIybu6e5z7yXKyCbjHa/UvyktCwfC
 z/AgH8IQy5Nv9V7YtWFixUyxCy8eWVHqdPBRs+BaGSa7dZOqTBtG4dyiQYNgzxXACnkI4R31vto
 aWu7S/BxQwlujk36u0SP33wZkHfYSsQfmDT6POESD0OCjdHh8c0RYbYqMTwRahYRdafWmY9FAcw
 vm444mtk/ZFL8uum6+/l74FuLiDy8DXrWEhThSGcPo8O8ZbrZ1qCVEyeWtjD71V+gRUc20xS7Jx
 j50PfU3lq5Dw2rLduVxhS3aHSqXecZZbvXqu84iAVuBX3gpMcEEWgUBlkg/nPQxqyOkNR2cG3cx
 sFpy+f6yvEC8T8JXHddLnbHc8sfyGCbPVc3+Cbrk0AE5ZGp1WDQp9YPQr6SDEi7iH2bt+RFAIgD
 87dqCHAf0Wj3pKw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the public headers for GLib bindings. They contain the entire API
together with Doxygen comments.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/generated-enums.h.template  |  30 +++++
 bindings/glib/gpiod-glib.h                |  33 +++++
 bindings/glib/gpiod-glib/chip-info.h      |  86 ++++++++++++
 bindings/glib/gpiod-glib/chip.h           | 167 ++++++++++++++++++++++++
 bindings/glib/gpiod-glib/edge-event.h     | 115 ++++++++++++++++
 bindings/glib/gpiod-glib/error.h          |  67 ++++++++++
 bindings/glib/gpiod-glib/info-event.h     |  98 ++++++++++++++
 bindings/glib/gpiod-glib/line-config.h    | 118 +++++++++++++++++
 bindings/glib/gpiod-glib/line-info.h      | 175 +++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line-request.h   | 186 ++++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line-settings.h  | 209 ++++++++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line.h           | 114 ++++++++++++++++
 bindings/glib/gpiod-glib/misc.h           |  51 ++++++++
 bindings/glib/gpiod-glib/request-config.h | 112 ++++++++++++++++
 14 files changed, 1561 insertions(+)

diff --git a/bindings/glib/generated-enums.h.template b/bindings/glib/generated-enums.h.template
new file mode 100644
index 0000000..94f3763
--- /dev/null
+++ b/bindings/glib/generated-enums.h.template
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*** BEGIN file-header ***/
+
+#ifndef __GPIODGLIB_GENERATED_ENUMS_H__
+#define __GPIODGLIB_GENERATED_ENUMS_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+G_BEGIN_DECLS
+/*** END file-header ***/
+
+/*** BEGIN file-production ***/
+
+/*** END file-production ***/
+
+/*** BEGIN value-header ***/
+GType @enum_name@_get_type(void) G_GNUC_CONST;
+#define @ENUMPREFIX@_@ENUMSHORT@_TYPE (@enum_name@_get_type())
+/*** END value-header ***/
+
+/*** BEGIN file-tail ***/
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_GENERATED_ENUMS_H__ */
+/*** END file-tail ***/
diff --git a/bindings/glib/gpiod-glib.h b/bindings/glib/gpiod-glib.h
new file mode 100644
index 0000000..228f540
--- /dev/null
+++ b/bindings/glib/gpiod-glib.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file gpiod-glib.h
+ */
+
+#ifndef __GPIOD_GLIB_H__
+#define __GPIOD_GLIB_H__
+
+/**
+ * @defgroup gpiodglib GLib bindings
+ *
+ * GLib bindings for libgpiod representing all data structures using the
+ * GObject type system.
+ */
+
+#define __GPIOD_GLIB_INSIDE__
+#include "gpiod-glib/chip.h"
+#include "gpiod-glib/chip-info.h"
+#include "gpiod-glib/edge-event.h"
+#include "gpiod-glib/error.h"
+#include "gpiod-glib/generated-enums.h"
+#include "gpiod-glib/info-event.h"
+#include "gpiod-glib/line-config.h"
+#include "gpiod-glib/line-info.h"
+#include "gpiod-glib/line-request.h"
+#include "gpiod-glib/line-settings.h"
+#include "gpiod-glib/misc.h"
+#include "gpiod-glib/request-config.h"
+#undef __GPIOD_GLIB_INSIDE__
+
+#endif /* __GPIOD_GLIB_H__ */
diff --git a/bindings/glib/gpiod-glib/chip-info.h b/bindings/glib/gpiod-glib/chip-info.h
new file mode 100644
index 0000000..8eea3e8
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip-info.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file chip-info.h
+ */
+
+#ifndef __GPIODGLIB_CHIP_INFO_H__
+#define __GPIODGLIB_CHIP_INFO_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibChipInfo, gpiodglib_chip_info,
+		     GPIODGLIB, CHIP_INFO, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_chip_info GPIO chip info GObject
+ * @{
+ *
+ * Represents an immutable snapshot of GPIO chip information.
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO chip-info.
+ */
+#define GPIODGLIB_CHIP_INFO_TYPE (gpiodglib_chip_info_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO chip-info concrete GObject.
+ */
+#define GPIODGLIB_CHIP_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_CHIP_INFO_TYPE, \
+				    GpiodglibChipInfo))
+
+/**
+ * @brief Get the name of the chip as represented in the kernel.
+ * @param self GPIO chip info object to manipulate.
+ * @return Valid pointer to a human-readable string containing the chip name.
+ *         The returned string is a copy and must be freed by the caller using
+ *         g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_info_dup_name(GpiodglibChipInfo *self);
+
+/**
+ * @brief Get the label of the chip as represented in the kernel.
+ * @param self GPIO chip info object to manipulate.
+ * @return Valid pointer to a human-readable string containing the chip label.
+ *         The returned string is a copy and must be freed by the caller using
+ *         g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_info_dup_label(GpiodglibChipInfo *self);
+
+/**
+ * @brief Get the number of lines exposed by the chip.
+ * @param self GPIO chip info object to manipulate.
+ * @return Number of GPIO lines.
+ */
+guint gpiodglib_chip_info_get_num_lines(GpiodglibChipInfo *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_CHIP_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/chip.h b/bindings/glib/gpiod-glib/chip.h
new file mode 100644
index 0000000..00c833d
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip.h
@@ -0,0 +1,167 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file chip.h
+ */
+
+#ifndef __GPIODGLIB_CHIP_H__
+#define __GPIODGLIB_CHIP_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "chip-info.h"
+#include "line-config.h"
+#include "line-info.h"
+#include "line-request.h"
+#include "request-config.h"
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibChip, gpiodglib_chip, GPIODGLIB, CHIP, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_chip GPIO chip GObject
+ * @{
+ *
+ * This type represents a GPIO chip. In addition to the methods defined here,
+ * it exposes the `info-event` signal with the following signature:
+ *
+ *     void (*)(GpiodglibChip *, GpiodglibInfoEvent *, gpointer)
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO chip.
+ */
+#define GPIODGLIB_CHIP_TYPE (gpiodglib_chip_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO chip concrete GObject.
+ */
+#define GPIODGLIB_CHIP_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_CHIP_TYPE, GpiodglibChip))
+
+/**
+ * @brief Instantiates a new chip object by opening the device file indicated
+ *        by \p path.
+ * @param path Path to the device file to open.
+ * @param err Return location for error or NULL.
+ * @return New GPIO chip object.
+ */
+GpiodglibChip *gpiodglib_chip_new(const gchar *path, GError **err);
+
+/**
+ * @brief Close the GPIO chip device file and free associated resources.
+ * @param self Chip object to manipulate.
+ * @note The chip object can live after calling this method but any of
+ *       the chip's methods will result in an error being set.
+ */
+void gpiodglib_chip_close(GpiodglibChip *self);
+
+/**
+ * @brief Check if this object is valid.
+ * @param self Chip object to manipulate.
+ * @return TRUE if this object's methods can be used, FALSE otherwise.
+ *         False usually means the chip was closed. If the user calls
+ *         any of the methods of this class on an object for which this
+ *         operator returned false, a logic_error will be thrown.
+ */
+gboolean gpiodglib_chip_is_closed(GpiodglibChip *self);
+
+/**
+ * @brief Get the filesystem path that was used to open this GPIO chip.
+ * @param self Chip object to manipulate.
+ * @return Path to the underlying character device file. The string is a copy
+ *         and must be freed by the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_dup_path(GpiodglibChip *self);
+
+/**
+ * @brief Get information about the chip.
+ * @param self Chip object to manipulate.
+ * @param err Return location for error or NULL.
+ * @return New GPIO chip info object.
+ */
+GpiodglibChipInfo *gpiodglib_chip_get_info(GpiodglibChip *self, GError **err);
+
+/**
+ * @brief Retrieve the current snapshot of line information for a single line.
+ * @param self Chip object to manipulate.
+ * @param offset Offset of the line to get the info for.
+ * @param err Return location for error or NULL.
+ * @return New GPIO line info object.
+ */
+GpiodglibLineInfo *
+gpiodglib_chip_get_line_info(GpiodglibChip *self, guint offset, GError **err);
+
+/**
+ * @brief Retrieve the current snapshot of line information for a single line
+ *        and start watching this line for future changes.
+ * @param self Chip object to manipulate.
+ * @param offset Offset of the line to get the info for and to watch.
+ * @param err Return location for error or NULL.
+ * @return New GPIO line info object.
+ */
+GpiodglibLineInfo *
+gpiodglib_chip_watch_line_info(GpiodglibChip *self, guint offset, GError **err);
+
+/**
+ * @brief Stop watching the line at given offset for info events.
+ * @param self Chip object to manipulate.
+ * @param offset Offset of the line to get the info for.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_chip_unwatch_line_info(GpiodglibChip *self, guint offset,
+				 GError **err);
+
+/**
+ * @brief Map a GPIO line's name to its offset within the chip.
+ * @param self Chip object to manipulate.
+ * @param name Name of the GPIO line to map.
+ * @param offset Return location for the mapped offset.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_chip_get_line_offset_from_name(GpiodglibChip *self, const gchar *name,
+					 guint *offset, GError **err);
+
+/**
+ * @brief Request a set of lines for exclusive usage.
+ * @param self Chip object to manipulate.
+ * @param req_cfg Request config object. Can be NULL for default settings.
+ * @param line_cfg Line config object.
+ * @param err Return location for error or NULL.
+ * @return New GPIO line request object or NULL on failure.
+ */
+GpiodglibLineRequest *
+gpiodglib_chip_request_lines(GpiodglibChip *self,
+			     GpiodglibRequestConfig *req_cfg,
+			     GpiodglibLineConfig *line_cfg, GError **err);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_CHIP_H__ */
diff --git a/bindings/glib/gpiod-glib/edge-event.h b/bindings/glib/gpiod-glib/edge-event.h
new file mode 100644
index 0000000..bbcf2b3
--- /dev/null
+++ b/bindings/glib/gpiod-glib/edge-event.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file edge-event.h
+ */
+
+#ifndef __GPIODGLIB_EDGE_EVENT_H__
+#define __GPIODGLIB_EDGE_EVENT_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line-info.h"
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibEdgeEvent, gpiodglib_edge_event,
+		     GPIODGLIB, EDGE_EVENT, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_edge_event GPIO edge-event GObject
+ * @{
+ *
+ * An edge event object contains information about a single line edge event.
+ * It contains the event type, timestamp and the offset of the line on which
+ * the event occurred as well as two sequence numbers (global for all lines
+ * in the associated request and local for this line only).
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO edge-event.
+ */
+#define GPIODGLIB_EDGE_EVENT_TYPE (gpiodglib_edge_event_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO edge-event concrete GObject.
+ */
+#define GPIODGLIB_EDGE_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_EDGE_EVENT_TYPE, \
+				    GpiodglibEdgeEvent))
+
+/**
+ * @brief Event types.
+ */
+typedef enum {
+	GPIODGLIB_EDGE_EVENT_RISING_EDGE = 1,
+	/**< Rising edge event. */
+	GPIODGLIB_EDGE_EVENT_FALLING_EDGE,
+	/**< Falling edge event. */
+} GpiodglibEdgeEventType;
+
+/**
+ * @brief Get the event type.
+ * @param self GPIO edge event to manipulate.
+ * @return The event type (::GPIODGLIB_EDGE_EVENT_RISING_EDGE or
+ *         ::GPIODGLIB_EDGE_EVENT_FALLING_EDGE).
+ */
+GpiodglibEdgeEventType
+gpiodglib_edge_event_get_event_type(GpiodglibEdgeEvent *self);
+
+/**
+ * @brief Get the timestamp of the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Timestamp in nanoseconds.
+ * @note The source clock for the timestamp depends on the event_clock
+ *       setting for the line.
+ */
+guint64 gpiodglib_edge_event_get_timestamp_ns(GpiodglibEdgeEvent *self);
+
+/**
+ * @brief Get the offset of the line which triggered the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Line offset.
+ */
+guint gpiodglib_edge_event_get_line_offset(GpiodglibEdgeEvent *self);
+
+/**
+ * @brief Get the global sequence number of the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Sequence number of the event in the series of events for all lines
+ *         in the associated line request.
+ */
+gulong gpiodglib_edge_event_get_global_seqno(GpiodglibEdgeEvent *self);
+
+/**
+ * @brief Get the event sequence number specific to the line.
+ * @param self GPIO edge event to manipulate.
+ * @return Sequence number of the event in the series of events only for this
+ *         line within the lifetime of the associated line request.
+ */
+gulong gpiodglib_edge_event_get_line_seqno(GpiodglibEdgeEvent *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_EDGE_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/error.h b/bindings/glib/gpiod-glib/error.h
new file mode 100644
index 0000000..738f080
--- /dev/null
+++ b/bindings/glib/gpiod-glib/error.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file error.h
+ */
+
+#ifndef __GPIODGLIB_ERROR_H__
+#define __GPIODGLIB_ERROR_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @ingroup gpiodglib
+ * @{
+ */
+
+/**
+ * @brief Get the libgpiod GObject error domain.
+ */
+#define GPIODGLIB_ERROR gpiodglib_error_quark()
+
+/**
+ * @}
+ *
+ * @cond
+ */
+
+typedef enum {
+	GPIODGLIB_ERR_FAILED = 1,
+	GPIODGLIB_ERR_CHIP_CLOSED,
+	GPIODGLIB_ERR_REQUEST_RELEASED,
+	GPIODGLIB_ERR_PERM,
+	GPIODGLIB_ERR_NOENT,
+	GPIODGLIB_ERR_INTR,
+	GPIODGLIB_ERR_IO,
+	GPIODGLIB_ERR_NXIO,
+	GPIODGLIB_ERR_E2BIG,
+	GPIODGLIB_ERR_BADFD,
+	GPIODGLIB_ERR_CHILD,
+	GPIODGLIB_ERR_AGAIN,
+	GPIODGLIB_ERR_NOMEM,
+	GPIODGLIB_ERR_ACCES,
+	GPIODGLIB_ERR_FAULT,
+	GPIODGLIB_ERR_BUSY,
+	GPIODGLIB_ERR_EXIST,
+	GPIODGLIB_ERR_NODEV,
+	GPIODGLIB_ERR_INVAL,
+	GPIODGLIB_ERR_NOTTY,
+	GPIODGLIB_ERR_PIPE,
+} GPIODError;
+
+GQuark gpiodglib_error_quark(void);
+
+/**
+ * @endcond
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_ERROR_H__ */
diff --git a/bindings/glib/gpiod-glib/info-event.h b/bindings/glib/gpiod-glib/info-event.h
new file mode 100644
index 0000000..b83bf16
--- /dev/null
+++ b/bindings/glib/gpiod-glib/info-event.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file info-event.h
+ */
+
+#ifndef __GPIODGLIB_INFO_EVENT_H__
+#define __GPIODGLIB_INFO_EVENT_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line-info.h"
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibInfoEvent, gpiodglib_info_event,
+		     GPIODGLIB, INFO_EVENT, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_info_event GPIO info-event GObject
+ * @{
+ *
+ * An info-event contains information about the event itself (timestamp, type)
+ * as well as a snapshot of line's status in the form of a line-info object.
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO info-event.
+ */
+#define GPIODGLIB_INFO_EVENT_TYPE (gpiodglib_info_event_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO info-event concrete GObject.
+ */
+#define GPIODGLIB_INFO_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_INFO_EVENT_TYPE, \
+				    GpiodglibInfoEvent))
+
+/**
+ * @brief Line status change event types.
+ */
+typedef enum {
+	GPIODGLIB_INFO_EVENT_LINE_REQUESTED = 1,
+	/**< Line has been requested. */
+	GPIODGLIB_INFO_EVENT_LINE_RELEASED,
+	/**< Previously requested line has been released. */
+	GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED,
+	/**< Line configuration has changed. */
+} GpiodglibInfoEventType;
+
+/**
+ * @brief Get the event type of the status change event.
+ * @param self GPIO edge event to manipulate.
+ * @return One of ::GPIODGLIB_INFO_EVENT_LINE_REQUESTED,
+ *         ::GPIODGLIB_INFO_EVENT_LINE_RELEASED or
+ *         ::GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED.
+ */
+GpiodglibInfoEventType
+gpiodglib_info_event_get_event_type(GpiodglibInfoEvent *self);
+
+/**
+ * @brief Get the timestamp of the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Timestamp in nanoseconds, read from the monotonic clock.
+ */
+guint64 gpiodglib_info_event_get_timestamp_ns(GpiodglibInfoEvent *self);
+
+/**
+ * @brief Get the snapshot of line-info associated with the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Returns a new reference to the associated line-info object.
+ */
+GpiodglibLineInfo *gpiodglib_info_event_get_line_info(GpiodglibInfoEvent *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_INFO_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/line-config.h b/bindings/glib/gpiod-glib/line-config.h
new file mode 100644
index 0000000..9b2a997
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-config.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-config.h
+ */
+
+#ifndef __GPIODGLIB_LINE_CONFIG_H__
+#define __GPIODGLIB_LINE_CONFIG_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line-settings.h"
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineConfig, gpiodglib_line_config,
+		     GPIODGLIB, LINE_CONFIG, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_line_config GPIO line config GObject
+ * @{
+ *
+ * The line-config object contains the configuration for lines that can be
+ * used in two cases:
+ *  - when making a line request
+ *  - when reconfiguring a set of already requested lines.
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO line-config.
+ */
+#define GPIODGLIB_LINE_CONFIG_TYPE (gpiodglib_line_config_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-config concrete GObject.
+ */
+#define GPIODGLIB_LINE_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_CONFIG_TYPE, \
+				    GpiodglibLineConfig))
+
+/**
+ * @brief Create a new line config object.
+ * @return Empty line config object.
+ */
+GpiodglibLineConfig *gpiodglib_line_config_new(void);
+
+/**
+ * @brief Reset the line config object.
+ * @param self GPIO line config to manipulate.
+ */
+void gpiodglib_line_config_reset(GpiodglibLineConfig *self);
+
+/**
+ * @brief Add line settings for a set of offsets.
+ * @param self GPIO line config to manipulate.
+ * @param offsets GArray of offsets for which to apply the settings.
+ * @param settings Line settings to apply.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_config_add_line_settings(GpiodglibLineConfig *self,
+					const GArray *offsets,
+					GpiodglibLineSettings *settings,
+					GError **err);
+
+/**
+ * @brief Get line settings for offset.
+ * @param self GPIO line config to manipulate.
+ * @param offset Offset for which to get line settings.
+ * @return New reference to a line settings object.
+ */
+GpiodglibLineSettings *
+gpiodglib_line_config_get_line_settings(GpiodglibLineConfig *self,
+					guint offset);
+
+/**
+ * @brief Set output values for a number of lines.
+ * @param self GPIO line config to manipulate.
+ * @param values GArray containing the output values.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on error.
+ */
+gboolean gpiodglib_line_config_set_output_values(GpiodglibLineConfig *self,
+						 const GArray *values,
+						 GError **err);
+
+/**
+ * @brief Get configured offsets.
+ * @param self GPIO line config to manipulate.
+ * @return GArray containing the offsets for which configuration has been set.
+ */
+GArray *gpiodglib_line_config_get_configured_offsets(GpiodglibLineConfig *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_CONFIG_H__ */
diff --git a/bindings/glib/gpiod-glib/line-info.h b/bindings/glib/gpiod-glib/line-info.h
new file mode 100644
index 0000000..1158a68
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-info.h
@@ -0,0 +1,175 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-info.h
+ */
+
+#ifndef __GPIODGLIB_LINE_INFO_H__
+#define __GPIODGLIB_LINE_INFO_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line.h"
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineInfo, gpiodglib_line_info,
+		     GPIODGLIB, LINE_INFO, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_line_info GPIO line-info GObject
+ * @{
+ *
+ * Line info object contains an immutable snapshot of a line's status.
+ *
+ * The line info contains all the publicly available information about a
+ * line, which does not include the line value. The line must be requested
+ * to access the line value.
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO line-info.
+ */
+#define GPIODGLIB_LINE_INFO_TYPE (gpiodglib_line_info_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-info concrete GObject.
+ */
+#define GPIODGLIB_LINE_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_INFO_TYPE, \
+				    GpiodglibLineInfo))
+
+/**
+ * @brief Get the offset of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Offset of the line within the parent chip.
+ *
+ * The offset uniquely identifies the line on the chip. The combination of the
+ * chip and offset uniquely identifies the line within the system.
+ */
+guint gpiodglib_line_info_get_offset(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the name of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Name of the GPIO line as it is represented in the kernel.
+ *         This function returns a valid pointer to a null-terminated string
+ *         or NULL if the line is unnamed. The string is a copy of the
+ *         line name and must be freed by the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_info_dup_name(GpiodglibLineInfo *self);
+
+/**
+ * @brief Check if the line is in use.
+ * @param self GPIO line info object to manipulate.
+ * @return True if the line is in use, false otherwise.
+ *
+ * The exact reason a line is busy cannot be determined from user space.
+ * It may have been requested by another process or hogged by the kernel.
+ * It only matters that the line is used and can't be requested until
+ * released by the existing consumer.
+ */
+gboolean gpiodglib_line_info_is_used(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the name of the consumer of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Name of the GPIO consumer as it is represented in the kernel.
+ *         This function returns a valid pointer to a null-terminated string
+ *         or NULL if the consumer name is not set. The string is a copy of the
+ *         consumer label and must be freed by the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_info_dup_consumer(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the direction setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::GPIODGLIB_LINE_DIRECTION_INPUT or
+ *        ::GPIODGLIB_LINE_DIRECTION_OUTPUT.
+ */
+GpiodglibLineDirection
+gpiodglib_line_info_get_direction(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the edge detection setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::GPIODGLIB_LINE_EDGE_NONE, ::GPIODGLIB_LINE_EDGE_RISING,
+ *        ::GPIODGLIB_LINE_EDGE_FALLING or ::GPIODGLIB_LINE_EDGE_BOTH.
+ */
+GpiodglibLineEdge
+gpiodglib_line_info_get_edge_detection(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the bias setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::GPIODGLIB_LINE_BIAS_PULL_UP, ::GPIODGLIB_LINE_BIAS_PULL_DOWN,
+ *         ::GPIODGLIB_LINE_BIAS_DISABLED or ::GPIODGLIB_LINE_BIAS_UNKNOWN.
+ */
+GpiodglibLineBias gpiodglib_line_info_get_bias(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the drive setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::GPIODGLIB_LINE_DRIVE_PUSH_PULL,
+ *         ::GPIODGLIB_LINE_DRIVE_OPEN_DRAIN or ::GPIODGLIB_LINE_DRIVE_OPEN_SOURCE.
+ */
+GpiodglibLineDrive gpiodglib_line_info_get_drive(GpiodglibLineInfo *self);
+
+/**
+ * @brief Check if the logical value of the line is inverted compared to the
+ *        physical.
+ * @param self GPIO line info object to manipulate.
+ * @return TRUE if the line is "active-low", FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_active_low(GpiodglibLineInfo *self);
+
+/**
+ * @brief Check if the line is debounced (either by hardware or by the kernel
+ *        software debouncer).
+ * @param self GPIO line info object to manipulate.
+ * @return TRUE if the line is debounced, FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_debounced(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the debounce period of the line, in microseconds.
+ * @param self GPIO line info object to manipulate.
+ * @return Debounce period in microseconds. 0 if the line is not debounced.
+ */
+GTimeSpan gpiodglib_line_info_get_debounce_period_us(GpiodglibLineInfo *self);
+
+/**
+ * @brief Get the event clock setting used for edge event timestamps for the
+ *        line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::GPIODGLIB_LINE_CLOCK_MONOTONIC, ::GPIODGLIB_LINE_CLOCK_HTE or
+ *         ::GPIODGLIB_LINE_CLOCK_REALTIME.
+ */
+GpiodglibLineClock gpiodglib_line_info_get_event_clock(GpiodglibLineInfo *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/line-request.h b/bindings/glib/gpiod-glib/line-request.h
new file mode 100644
index 0000000..8d0d5e8
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-request.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-request.h
+ */
+
+#ifndef __GPIODGLIB_LINE_REQUEST_H__
+#define __GPIODGLIB_LINE_REQUEST_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineRequest, gpiodglib_line_request,
+		     GPIODGLIB, LINE_REQUEST, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_line_request GPIO line-request GObject
+ * @{
+ *
+ * Line request object allows interacting with a set of requested GPIO lines.
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO line-request.
+ */
+#define GPIODGLIB_LINE_REQUEST_TYPE (gpiodglib_line_request_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-request concrete GObject.
+ */
+#define GPIODGLIB_LINE_REQUEST_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_REQUEST_TYPE, \
+				    GpiodglibLineRequest))
+
+/**
+ * @brief Release the requested lines and free all associated resources.
+ * @param self GPIO line request object to manipulate.
+ */
+void gpiodglib_line_request_release(GpiodglibLineRequest *self);
+
+/**
+ * @brief Check if this request was released.
+ * @param self GPIO line request object to manipulate.
+ * @return TRUE if this request was released and is no longer valid, FALSE
+ *         otherwise.
+ */
+gboolean gpiodglib_line_request_is_released(GpiodglibLineRequest *self);
+
+/**
+ * @brief Get the name of the chip this request was made on.
+ * @param self GPIO line request object to manipulate.
+ * @return Name the GPIO chip device. The string is a copy and must be freed
+ *         by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_request_dup_chip_name(GpiodglibLineRequest *self);
+
+/**
+ * @brief Get the offsets of the lines in the request.
+ * @param self GPIO line request object to manipulate.
+ * @return Array containing the requested offsets.
+ */
+GArray *
+gpiodglib_line_request_get_requested_offsets(GpiodglibLineRequest *self);
+
+/**
+ * @brief Update the configuration of lines associated with a line request.
+ * @param self GPIO line request object to manipulate.
+ * @param config New line config to apply.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ * @note The new line configuration completely replaces the old.
+ * @note Any requested lines without overrides are configured to the requested
+ *       defaults.
+ * @note Any configured overrides for lines that have not been requested
+ *       are silently ignored.
+ */
+gboolean gpiodglib_line_request_reconfigure_lines(GpiodglibLineRequest *self,
+						  GpiodglibLineConfig *config,
+						  GError **err);
+
+/**
+ * @brief Get the value of a single requested line.
+ * @param self GPIO line request object to manipulate.
+ * @param offset The offset of the line of which the value should be read.
+ * @param value Return location for the value.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_request_get_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue *value, GError **err);
+
+/**
+ * @brief Get the values of a subset of requested lines.
+ * @param self GPIO line request object to manipulate.
+ * @param offsets Array of offsets identifying the subset of requested lines
+ *                from which to read values.
+ * @param values Array in which the values will be stored. Can be NULL in which
+ *               case a new array will be created and its location stored here.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_get_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  GArray **values,
+						  GError **err);
+
+/**
+ * @brief Get the values of all requested lines.
+ * @param self GPIO line request object to manipulate.
+ * @param values Array in which the values will be stored. Can be NULL in which
+ *               case a new array will be created and its location stored here.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_get_values(GpiodglibLineRequest *self,
+					   GArray **values, GError **err);
+
+/**
+ * @brief Set the value of a single requested line.
+ * @param self GPIO line request object to manipulate.
+ * @param offset The offset of the line for which the value should be set.
+ * @param value Value to set.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_request_set_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue value, GError **err);
+
+/**
+ * @brief Set the values of a subset of requested lines.
+ * @param self GPIO line request object to manipulate.
+ * @param offsets Array of offsets identifying the requested lines for
+ *                which to set values.
+ * @param values Array in which the values will be stored. Can be NULL in which
+ *               case a new array will be created and its location stored here.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_set_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  const GArray *values,
+						  GError **err);
+
+/**
+ * @brief Set the values of all lines associated with a request.
+ * @param self GPIO line request object to manipulate.
+ * @param values Array containing the values to set. Must be sized to
+ *               contain the number of values equal to the number of requested
+ *               lines. Each value is associated with the line identified by
+ *               the corresponding entry in the offset array filled by
+ *               ::gpiodglib_line_request_get_requested_offsets.
+ *               case a new array will be created and its location stored here.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_set_values(GpiodglibLineRequest *self,
+					   GArray *values, GError **err);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_REQUEST_H__ */
diff --git a/bindings/glib/gpiod-glib/line-settings.h b/bindings/glib/gpiod-glib/line-settings.h
new file mode 100644
index 0000000..56eea40
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-settings.h
@@ -0,0 +1,209 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-settings.h
+ */
+
+#ifndef __GPIODGLIB_LINE_SETTINGS_H__
+#define __GPIODGLIB_LINE_SETTINGS_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+#include "line.h"
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineSettings, gpiodglib_line_settings,
+		     GPIODGLIB, LINE_SETTINGS, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_line_settings GPIO line-settings GObject
+ * @{
+ *
+ * Line settings object contains a set of line properties that can be used
+ * when requesting lines or reconfiguring an existing request.
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO line-settings.
+ */
+#define GPIODGLIB_LINE_SETTINGS_TYPE (gpiodglib_line_settings_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-settings concrete GObject.
+ */
+#define GPIODGLIB_LINE_SETTINGS_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_SETTINGS_TYPE, \
+				    GpiodglibLineSettings))
+
+/**
+ * @brief Create a new line settings object.
+ * @param first_prop Name of the first property to set.
+ * @return New line settings object.
+ *
+ * The constructor allows to set object's properties when it's first created
+ * instead of having to build an empty object and then call mutators separately.
+ *
+ * Currently supported properties are: `direction`, `edge-detection`, `bias`,
+ * `drive`, `debounce-period-us`, `active-low`, 'event-clock` and
+ * `output-value`.
+ */
+GpiodglibLineSettings *
+gpiodglib_line_settings_new(const gchar *first_prop, ...);
+
+/**
+ * @brief Reset the line settings object to its default values.
+ * @param self Line settings object to manipulate.
+ */
+void gpiodglib_line_settings_reset(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set direction.
+ * @param self Line settings object to manipulate.
+ * @param direction New direction.
+ */
+void gpiodglib_line_settings_set_direction(GpiodglibLineSettings *self,
+					   GpiodglibLineDirection direction);
+
+/**
+ * @brief Get direction.
+ * @param self Line settings object to manipulate.
+ * @return Current direction.
+ */
+GpiodglibLineDirection
+gpiodglib_line_settings_get_direction(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set edge detection.
+ * @param self Line settings object to manipulate.
+ * @param edge New edge detection setting.
+ */
+void gpiodglib_line_settings_set_edge_detection(GpiodglibLineSettings *self,
+						GpiodglibLineEdge edge);
+
+/**
+ * @brief Get edge detection.
+ * @param self Line settings object to manipulate.
+ * @return Current edge detection setting.
+ */
+GpiodglibLineEdge
+gpiodglib_line_settings_get_edge_detection(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set bias.
+ * @param self Line settings object to manipulate.
+ * @param bias New bias.
+ */
+void gpiodglib_line_settings_set_bias(GpiodglibLineSettings *self,
+				      GpiodglibLineBias bias);
+
+/**
+ * @brief Get bias.
+ * @param self Line settings object to manipulate.
+ * @return Current bias setting.
+ */
+GpiodglibLineBias gpiodglib_line_settings_get_bias(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set drive.
+ * @param self Line settings object to manipulate.
+ * @param drive New drive setting.
+ */
+void gpiodglib_line_settings_set_drive(GpiodglibLineSettings *self,
+				       GpiodglibLineDrive drive);
+
+/**
+ * @brief Get drive.
+ * @param self Line settings object to manipulate.
+ * @return Current drive setting.
+ */
+GpiodglibLineDrive
+gpiodglib_line_settings_get_drive(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set active-low setting.
+ * @param self Line settings object to manipulate.
+ * @param active_low New active-low setting.
+ */
+void gpiodglib_line_settings_set_active_low(GpiodglibLineSettings *self,
+					    gboolean active_low);
+
+/**
+ * @brief Get active-low setting.
+ * @param self Line settings object to manipulate.
+ * @return TRUE if active-low is enabled, FALSE otherwise.
+ */
+gboolean gpiodglib_line_settings_get_active_low(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set debounce period.
+ * @param self Line settings object to manipulate.
+ * @param period New debounce period in microseconds.
+ */
+void gpiodglib_line_settings_set_debounce_period_us(GpiodglibLineSettings *self,
+						    GTimeSpan period);
+
+/**
+ * @brief Get debounce period.
+ * @param self Line settings object to manipulate.
+ * @return Current debounce period in microseconds.
+ */
+GTimeSpan
+gpiodglib_line_settings_get_debounce_period_us(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set event clock.
+ * @param self Line settings object to manipulate.
+ * @param event_clock New event clock.
+ */
+void gpiodglib_line_settings_set_event_clock(GpiodglibLineSettings *self,
+					     GpiodglibLineClock event_clock);
+
+/**
+ * @brief Get event clock setting.
+ * @param self Line settings object to manipulate.
+ * @return Current event clock setting.
+ */
+GpiodglibLineClock
+gpiodglib_line_settings_get_event_clock(GpiodglibLineSettings *self);
+
+/**
+ * @brief Set the output value.
+ * @param self Line settings object to manipulate.
+ * @param value New output value.
+ */
+void gpiodglib_line_settings_set_output_value(GpiodglibLineSettings *self,
+					      GpiodglibLineValue value);
+
+/**
+ * @brief Get the output value.
+ * @param self Line settings object to manipulate.
+ * @return Current output value.
+ */
+GpiodglibLineValue
+gpiodglib_line_settings_get_output_value(GpiodglibLineSettings *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_SETTINGS_H__ */
diff --git a/bindings/glib/gpiod-glib/line.h b/bindings/glib/gpiod-glib/line.h
new file mode 100644
index 0000000..2022ee6
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line.h
+ */
+
+#ifndef __GPIODGLIB_LINE_H__
+#define __GPIODGLIB_LINE_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gpiodglib_line Line definitions
+ * @{
+ *
+ * These defines are used across the API.
+ */
+
+/**
+ * @brief Logical line state.
+ */
+typedef enum {
+	GPIODGLIB_LINE_VALUE_INACTIVE = 0,
+	/**< Line is logically inactive. */
+	GPIODGLIB_LINE_VALUE_ACTIVE = 1,
+	/**< Line is logically active. */
+} GpiodglibLineValue;
+
+/**
+ * @brief Direction settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_DIRECTION_AS_IS = 1,
+	/**< Request the line(s), but don't change direction. */
+	GPIODGLIB_LINE_DIRECTION_INPUT,
+	/**< Direction is input - for reading the value of an externally driven
+	     GPIO line. */
+	GPIODGLIB_LINE_DIRECTION_OUTPUT,
+	/**< Direction is output - for driving the GPIO line. */
+} GpiodglibLineDirection;
+
+/**
+ * @brief Edge detection settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_EDGE_NONE = 1,
+	/**< Line edge detection is disabled. */
+	GPIODGLIB_LINE_EDGE_RISING,
+	/**< Line detects rising edge events. */
+	GPIODGLIB_LINE_EDGE_FALLING,
+	/**< Line detects falling edge events. */
+	GPIODGLIB_LINE_EDGE_BOTH,
+	/**< Line detects both rising and falling edge events. */
+} GpiodglibLineEdge;
+
+/**
+ * @brief Internal bias settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_BIAS_AS_IS = 1,
+	/**< Don't change the bias setting when applying line config. */
+	GPIODGLIB_LINE_BIAS_UNKNOWN,
+	/**< The internal bias state is unknown. */
+	GPIODGLIB_LINE_BIAS_DISABLED,
+	/**< The internal bias is disabled. */
+	GPIODGLIB_LINE_BIAS_PULL_UP,
+	/**< The internal pull-up bias is enabled. */
+	GPIODGLIB_LINE_BIAS_PULL_DOWN,
+	/**< The internal pull-down bias is enabled. */
+} GpiodglibLineBias;
+
+/**
+ * @brief Drive settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_DRIVE_PUSH_PULL = 1,
+	/**< Drive setting is push-pull. */
+	GPIODGLIB_LINE_DRIVE_OPEN_DRAIN,
+	/**< Line output is open-drain. */
+	GPIODGLIB_LINE_DRIVE_OPEN_SOURCE,
+	/**< Line output is open-source. */
+} GpiodglibLineDrive;
+
+/**
+ * @brief Clock settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_CLOCK_MONOTONIC = 1,
+	/**< Line uses the monotonic clock for edge event timestamps. */
+	GPIODGLIB_LINE_CLOCK_REALTIME,
+	/**< Line uses the realtime clock for edge event timestamps. */
+	GPIODGLIB_LINE_CLOCK_HTE,
+	/**< Line uses the hardware timestamp engine for event timestamps. */
+} GpiodglibLineClock;
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_H__ */
diff --git a/bindings/glib/gpiod-glib/misc.h b/bindings/glib/gpiod-glib/misc.h
new file mode 100644
index 0000000..f148baf
--- /dev/null
+++ b/bindings/glib/gpiod-glib/misc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file misc.h
+ */
+
+#ifndef __GPIODGLIB_MISC_H__
+#define __GPIODGLIB_MISC_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gpiodglib_misc Misc functions.
+ * @{
+ */
+
+/**
+ * @brief Check if the file pointed to by path is a GPIO chip character device.
+ * @param path Path to check.
+ * @return TRUE if the file exists and is either a GPIO chip character device
+ *         or a symbolic link to one, FALSE otherwise.
+ */
+gboolean gpiodglib_is_gpiochip_device(const gchar *path);
+
+/**
+ * @brief Get the API version of the library as a human-readable string.
+ * @return A valid pointer to a human-readable string containing the library
+ *         version. The pointer is valid for the lifetime of the program and
+ *         must not be freed by the caller.
+ */
+const gchar *gpiodglib_api_version(void);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_MISC_H__ */
diff --git a/bindings/glib/gpiod-glib/request-config.h b/bindings/glib/gpiod-glib/request-config.h
new file mode 100644
index 0000000..0d1160d
--- /dev/null
+++ b/bindings/glib/gpiod-glib/request-config.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file request-config.h
+ */
+
+#ifndef __GPIODGLIB_REQUEST_CONFIG_H__
+#define __GPIODGLIB_REQUEST_CONFIG_H__
+
+#if !defined (__GPIODGLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @cond
+ */
+
+G_DECLARE_FINAL_TYPE(GpiodglibRequestConfig, gpiodglib_request_config,
+		     GPIODGLIB, REQUEST_CONFIG, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiodglib
+ * @{
+ *
+ * @defgroup gobject_request_config GPIO request-config GObject
+ * @{
+ *
+ * Request config objects are used to pass a set of options to the kernel at
+ * the time of the line request.
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO request-config.
+ */
+#define GPIODGLIB_REQUEST_CONFIG_TYPE (gpiodglib_request_config_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO request-config concrete GObject.
+ */
+#define GPIODGLIB_REQUEST_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_REQUEST_CONFIG_TYPE, \
+				    GpiodglibRequestConfig))
+
+/**
+ * @brief Create a new request config object.
+ * @param first_prop Name of the first property to set.
+ * @return New request config object.
+ *
+ * The constructor allows to set object's properties when it's first created
+ * instead of having to build an empty object and then call mutators separately.
+ *
+ * Currently supported properties are: `consumer` and `event-buffer-size`.
+ */
+GpiodglibRequestConfig *
+gpiodglib_request_config_new(const gchar *first_prop, ...);
+
+/**
+ * @brief Set the consumer name for the request.
+ * @param self GPIO request config object to manipulate.
+ * @param consumer Consumer name.
+ * @note If the consumer string is too long, it will be truncated to the max
+ *       accepted length.
+ */
+void gpiodglib_request_config_set_consumer(GpiodglibRequestConfig *self,
+					   const gchar *consumer);
+
+/**
+ * @brief Get the consumer name configured in the request config.
+ * @param self GPIO request config object to manipulate.
+ * @return Consumer name stored in the request config. The returned string is
+ *         a copy and must be freed by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_request_config_dup_consumer(GpiodglibRequestConfig *self);
+
+/**
+ * @brief Set the size of the kernel event buffer for the request.
+ * @param self GPIO request config object to manipulate.
+ * @param event_buffer_size New event buffer size.
+ * @note The kernel may adjust the value if it's too high. If set to 0, the
+ *       default value will be used.
+ */
+void
+gpiodglib_request_config_set_event_buffer_size(GpiodglibRequestConfig *self,
+					       guint event_buffer_size);
+
+
+/**
+ * @brief Get the edge event buffer size for the request config.
+ * @param self GPIO request config object to manipulate.
+ * @return Edge event buffer size setting from the request config.
+ */
+guint
+gpiodglib_request_config_get_event_buffer_size(GpiodglibRequestConfig *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_REQUEST_CONFIG_H__ */

-- 
2.43.0


