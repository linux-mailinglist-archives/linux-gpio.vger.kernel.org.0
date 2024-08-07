Return-Path: <linux-gpio+bounces-8628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472D594A3E6
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B915AB279C3
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430991CCB58;
	Wed,  7 Aug 2024 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nrq0QUBP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83B1C9DE2
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021855; cv=none; b=eHyf6V37WZAybgLl+qh6vNL7jcEsWAxt77WnDAdD1x9LwRkSZX5H8POP+lxid6CFdz9lvW+V4GS9viWNQ2PbQmpq8QoG+6yT2w9lV5zwquvOaFIoBT/DLu1Q3icmwQYqsTGJZ2fMA14X6QdH1LeirfSe6EVN3MUj679ORvzGwa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021855; c=relaxed/simple;
	bh=cvNS54/qvflJCGwpqbSXxjwITqSF141hEaAF+cxSx5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3rpZuLE+2eplqnP6uVRzyPogNKBizdOPXZ/ba9634zd3wqbMDWxLL69fh95MfX2Brg/vTwPOjlGjwFEwr3HvFgN1FtLiYz0xb24LApnOMRmYkpSZkjlHwhv3YRo5roYmxVWrK30aIb6r0kULO7O8tFoN0749EM1P0iPkNTy1ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nrq0QUBP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42816ca782dso11499475e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021850; x=1723626650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In4CQJdLy6Uh24c1DZ/o+8qcSBbGHXtoX5c4M2wjh94=;
        b=nrq0QUBPTm50PHCaJs6dfVKZ4hVHbEGPFrlrIpQ9IckCQsVcWU36U7u1UOMiRiYMGx
         M4y0lO3P76ksK0+dnpe/nirZIAUT5rookGNPwKaVx5XKg76niIxTe9uYe3dP7eWOE5uV
         XEuRPRuFatq6F505PM6vgV2Xq/uODUdmHFu3KyBMzIh8DCCbo6y48k89zLAzl9nhoggP
         U6+uibOiU9xFBRIvQrFGEMoeWGsxT095+kiE/qyib/2yt3ZWIMLXBCRE5EOBw3lyTcbS
         KWC2J4eEGVZE3XktYtwnCi1xRBtbgftirzFIpqLvQwJRxRCf7sJKgm/AQFLP1d0Io/sG
         Zylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021850; x=1723626650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=In4CQJdLy6Uh24c1DZ/o+8qcSBbGHXtoX5c4M2wjh94=;
        b=kUnw8POysxcuIwzEGzmILcDB3B8O+GDKlXIOQTX3I+6Vs/0VhMxqaD2ip8Urf7aoww
         DEBGWVWLcJwACWVJ/+DG4ICBwW/8AHENGesnG7mGW71n1V6X/55jbX1Wl5OqOZ/MBWVq
         a+U30xKOwlKeTwx1A12pUNoM8PHizyshvEpjG5xv4vtSwJkzwtVxQeqMqVlayGelefZ0
         rVA0HOXRw1h2eeZ1+W9xlQ+wsyuN8XyzWV6Q/IfqWOay0bR56U5a/fSkVqhmkFquoQK8
         /sZiyY3ibTAee8AAWdBsj//rNisr4x+xkS63U4xASX73B6y9qFIhk8Aay265Ye4YVfzN
         77vQ==
X-Gm-Message-State: AOJu0YxqOCVcRXQ2UhFyCSqKKNt1f247oKRiPk0sadv3//YMNYbLxyxp
	eANBN9Jx2vZ5fzq3JSE2ydl9eeC2JBBKcIXaJBsh3B/mCWbkEvhFEfMkX5DYHrA=
X-Google-Smtp-Source: AGHT+IEfQwNdQRDUSz7+gjkbUCW/ifzMu+hIseJXlxZ8jX7vxQYHmSu7yc5GRgWqbG5kPbfPXZfVNQ==
X-Received: by 2002:a05:600c:1549:b0:426:6eb9:2643 with SMTP id 5b1f17b1804b1-428e6af6c58mr107338035e9.11.1723021849386;
        Wed, 07 Aug 2024 02:10:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:10:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:35 +0200
Subject: [PATCH libgpiod v4 04/18] bindings: glib: add public headers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-4-64ea80169e51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=48213;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bIDg0v1OGxX1NsMoHwxRSqN7f4vc/ZFdNGV8inxLkkU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoQFC9yxv75m/0/qU3cFOom4DSpJ3D/UblDK
 HUGBwlR0WGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EAAKCRARpy6gFHHX
 cnmCEACto0ExZ6r9lMIfHgJ/dpyAuVDLLo1p6/i//2Bl2aKMRj35UaEbaJsoOtK/zuhgbWMSwVC
 pZ6+m+U2K4l/0wRJy3cYFilwlA9d23UMAbhN7faPbz+VdMSh6Zknm3b5cUbv6XVOgDFPFrXNyek
 VMRGg5Wfov70rtfRhkEmQVls18K6cTyQNwXZf7saWUVFhl6yz5E37My4+CdBkpWsKaLyN/Q9FQV
 YNF3HZPlMIMIi9vesdetnpUGUbMhrpOBW//rxF1SCu1Iq2AK3/XqS69EDWWSo9OS+FxzKnYqf2q
 u4WxMT0LS2BpmLYou1+d4iFZkjMQtDfIwVTe9YQOpVRNyoDWp6IUMb30hkkMQRlQjAr3w71MA9u
 SALTQ7eX4mKQtLVw4bZaf78P/WAdlub2P5ZWyvNWFnHItPEYg9JX0+jFZQS2bGYjXWIpCydj0BQ
 XS9xt3z+CQeWoR2tCJkRty8NXfYwd3WuZpFd3xRHTAX58cd7V/isLtqGZgN1xDmhrGtww5TdKTB
 S/erkkh7ICv9wuKwqZCXDYv6xD8XZmuc0NOSFxF2+cblmTUCKC0lqi285Ot9JVZSN1T06m0dSTS
 Z0gVGxMLieK13tnbHpSOkc4gcCCASa51GfLYsliX09tWkaTicwEqAKIOaH21AuGzMuYzS8cKwN1
 kSPHR+aT34bIiGw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the public headers for GLib bindings. They contain the entire API
together with Doxygen comments.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/generated-enums.h.template  |  30 ++++
 bindings/glib/gpiod-glib.h                |  22 +++
 bindings/glib/gpiod-glib/chip-info.h      |  62 +++++++++
 bindings/glib/gpiod-glib/chip.h           | 157 +++++++++++++++++++++
 bindings/glib/gpiod-glib/edge-event.h     |  97 +++++++++++++
 bindings/glib/gpiod-glib/error.h          |  45 ++++++
 bindings/glib/gpiod-glib/info-event.h     |  76 +++++++++++
 bindings/glib/gpiod-glib/line-config.h    | 101 ++++++++++++++
 bindings/glib/gpiod-glib/line-info.h      | 171 +++++++++++++++++++++++
 bindings/glib/gpiod-glib/line-request.h   | 186 +++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line-settings.h  | 220 ++++++++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line.h           | 113 +++++++++++++++
 bindings/glib/gpiod-glib/misc.h           |  39 ++++++
 bindings/glib/gpiod-glib/request-config.h |  93 +++++++++++++
 14 files changed, 1412 insertions(+)

diff --git a/bindings/glib/generated-enums.h.template b/bindings/glib/generated-enums.h.template
new file mode 100644
index 0000000..d69d809
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
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
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
index 0000000..8f30452
--- /dev/null
+++ b/bindings/glib/gpiod-glib.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_H__
+#define __GPIODGLIB_H__
+
+#define __INSIDE_GPIOD_GLIB_H__
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
+#undef __INSIDE_GPIOD_GLIB_H__
+
+#endif /* __GPIODGLIB_H__ */
diff --git a/bindings/glib/gpiod-glib/chip-info.h b/bindings/glib/gpiod-glib/chip-info.h
new file mode 100644
index 0000000..9b3b87a
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip-info.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_CHIP_INFO_H__
+#define __GPIODGLIB_CHIP_INFO_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibChipInfo, gpiodglib_chip_info,
+		     GPIODGLIB, CHIP_INFO, GObject);
+
+#define GPIODGLIB_CHIP_INFO_TYPE (gpiodglib_chip_info_get_type())
+#define GPIODGLIB_CHIP_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_CHIP_INFO_TYPE, \
+				    GpiodglibChipInfo))
+
+/**
+ * gpiodglib_chip_info_dup_name:
+ * @self: #GpiodglibChipInfo to manipulate.
+ *
+ * Get the name of the chip as represented in the kernel.
+ *
+ * Returns: (transfer full): Valid pointer to a human-readable string
+ * containing the chip name. The returned string is a copy and must be freed by
+ * the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_info_dup_name(GpiodglibChipInfo *self);
+
+/**
+ * gpiodglib_chip_info_dup_label:
+ * @self: #GpiodglibChipInfo to manipulate.
+ *
+ * Get the label of the chip as represented in the kernel.
+ *
+ * Returns: (transfer full): Valid pointer to a human-readable string
+ * containing the chip label. The returned string is a copy and must be freed
+ * by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_info_dup_label(GpiodglibChipInfo *self);
+
+/**
+ * gpiodglib_chip_info_get_num_lines:
+ * @self: #GpiodglibChipInfo to manipulate.
+ *
+ * Get the number of lines exposed by the chip.
+ *
+ * Returns: Number of GPIO lines.
+ */
+guint gpiodglib_chip_info_get_num_lines(GpiodglibChipInfo *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_CHIP_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/chip.h b/bindings/glib/gpiod-glib/chip.h
new file mode 100644
index 0000000..d15d798
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_CHIP_H__
+#define __GPIODGLIB_CHIP_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
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
+G_DECLARE_FINAL_TYPE(GpiodglibChip, gpiodglib_chip, GPIODGLIB, CHIP, GObject);
+
+#define GPIODGLIB_CHIP_TYPE (gpiodglib_chip_get_type())
+#define GPIODGLIB_CHIP_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_CHIP_TYPE, GpiodglibChip))
+
+/**
+ * gpiodglib_chip_new:
+ * @path: Path to the device file to open.
+ * @err: Return location for error or %NULL.
+ *
+ * Instantiates a new chip object by opening the device file indicated by path.
+ *
+ * Returns: (transfer full): New GPIO chip object.
+ */
+GpiodglibChip *gpiodglib_chip_new(const gchar *path, GError **err);
+
+/**
+ * gpiodglib_chip_close:
+ * @self: #GpiodglibChip to close.
+ *
+ * Close the GPIO chip device file and free associated resources.
+ *
+ * The chip object can live after calling this method but any of the chip's
+ * methods will result in an error being set.
+ */
+void gpiodglib_chip_close(GpiodglibChip *self);
+
+/**
+ * gpiodglib_chip_is_closed:
+ * @self: #GpiodglibChip to manipulate.
+ *
+ * @brief Check if this object is valid.
+ *
+ * Returns: TRUE if this object's methods can be used, FALSE otherwise.
+ */
+gboolean gpiodglib_chip_is_closed(GpiodglibChip *self);
+
+/**
+ * gpiodglib_chip_dup_path:
+ * @self: #GpiodglibChip to manipulate.
+ *
+ * Get the filesystem path that was used to open this GPIO chip.
+ *
+ * Returns: Path to the underlying character device file. The string is a copy
+ * and must be freed by the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_chip_dup_path(GpiodglibChip *self);
+
+/**
+ * gpiodglib_chip_get_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @err: Return location for error or %NULL.
+ *
+ * Get information about the chip.
+ *
+ * Returns: (transfer full): New #GpiodglibChipInfo.
+ */
+GpiodglibChipInfo *gpiodglib_chip_get_info(GpiodglibChip *self, GError **err);
+
+/**
+ * gpiodglib_chip_get_line_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @offset: Offset of the line to get the info for.
+ * @err: Return location for error or %NULL.
+ *
+ * Retrieve the current snapshot of line information for a single line.
+ *
+ * Returns: (transfer full): New #GpiodglibLineInfo.
+ */
+GpiodglibLineInfo *
+gpiodglib_chip_get_line_info(GpiodglibChip *self, guint offset, GError **err);
+
+/**
+ * gpiodglib_chip_watch_line_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @offset: Offset of the line to get the info for and to watch.
+ * @err: Return location for error or %NULL.
+ *
+ * Retrieve the current snapshot of line information for a single line and
+ * start watching this line for future changes.
+ *
+ * Returns: (transfer full): New #GpiodglibLineInfo.
+ */
+GpiodglibLineInfo *
+gpiodglib_chip_watch_line_info(GpiodglibChip *self, guint offset, GError **err);
+
+/**
+ * gpiodglib_chip_unwatch_line_info:
+ * @self: #GpiodglibChip to manipulate.
+ * @offset: Offset of the line to get the info for.
+ * @err: Return location for error or %NULL.
+ *
+ * Stop watching the line at given offset for info events.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_chip_unwatch_line_info(GpiodglibChip *self, guint offset,
+				 GError **err);
+
+/**
+ * gpiodglib_chip_get_line_offset_from_name:
+ * @self: #GpiodglibChip to manipulate.
+ * @name: Name of the GPIO line to map.
+ * @offset: Return location for the mapped offset.
+ * @err: Return location for error or %NULL.
+ *
+ * Map a GPIO line's name to its offset within the chip.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_chip_get_line_offset_from_name(GpiodglibChip *self, const gchar *name,
+					 guint *offset, GError **err);
+
+/**
+ * gpiodglib_chip_request_lines:
+ * @self: #GpiodglibChip to manipulate.
+ * @req_cfg: Request config object. Can be NULL for default settings.
+ * @line_cfg: Line config object.
+ * @err: Return location for error or %NULL.
+ *
+ * Request a set of lines for exclusive usage.
+ *
+ * Returns: (transfer full): New #GpiodglibLineRequest.
+ */
+GpiodglibLineRequest *
+gpiodglib_chip_request_lines(GpiodglibChip *self,
+			     GpiodglibRequestConfig *req_cfg,
+			     GpiodglibLineConfig *line_cfg, GError **err);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_CHIP_H__ */
diff --git a/bindings/glib/gpiod-glib/edge-event.h b/bindings/glib/gpiod-glib/edge-event.h
new file mode 100644
index 0000000..2fa8339
--- /dev/null
+++ b/bindings/glib/gpiod-glib/edge-event.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_EDGE_EVENT_H__
+#define __GPIODGLIB_EDGE_EVENT_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
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
+G_DECLARE_FINAL_TYPE(GpiodglibEdgeEvent, gpiodglib_edge_event,
+		     GPIODGLIB, EDGE_EVENT, GObject);
+
+#define GPIODGLIB_EDGE_EVENT_TYPE (gpiodglib_edge_event_get_type())
+#define GPIODGLIB_EDGE_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_EDGE_EVENT_TYPE, \
+				    GpiodglibEdgeEvent))
+
+/**
+ * GpiodglibEdgeEventType:
+ * @GPIODGLIB_EDGE_EVENT_RISING_EDGE: Rising edge event.
+ * @GPIODGLIB_EDGE_EVENT_FALLING_EDGE: Falling edge event.
+ *
+ * Edge event types.
+ */
+typedef enum {
+	GPIODGLIB_EDGE_EVENT_RISING_EDGE = 1,
+	GPIODGLIB_EDGE_EVENT_FALLING_EDGE,
+} GpiodglibEdgeEventType;
+
+/**
+ * gpiodglib_edge_event_get_event_type:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the event type.
+ *
+ * Returns: The event type (@GPIODGLIB_EDGE_EVENT_RISING_EDGE or
+ * @GPIODGLIB_EDGE_EVENT_FALLING_EDGE).
+ */
+GpiodglibEdgeEventType
+gpiodglib_edge_event_get_event_type(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_timestamp_ns:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the timestamp of the event.
+ *
+ * The source clock for the timestamp depends on the event_clock setting for
+ * the line.
+ *
+ * Returns: Timestamp in nanoseconds.
+ */
+guint64 gpiodglib_edge_event_get_timestamp_ns(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_line_offset:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the offset of the line which triggered the event.
+ *
+ * Returns: Line offset.
+ */
+guint gpiodglib_edge_event_get_line_offset(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_global_seqno:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the global sequence number of the event.
+ *
+ * Returns: Sequence number of the event in the series of events for all lines
+ * in the associated line request.
+ */
+gulong gpiodglib_edge_event_get_global_seqno(GpiodglibEdgeEvent *self);
+
+/**
+ * gpiodglib_edge_event_get_line_seqno:
+ * @self: #GpiodglibEdgeEvent to manipulate.
+ *
+ * Get the event sequence number specific to the line.
+ *
+ * Returns: Sequence number of the event in the series of events only for this
+ * line within the lifetime of the associated line request.
+ */
+gulong gpiodglib_edge_event_get_line_seqno(GpiodglibEdgeEvent *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_EDGE_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/error.h b/bindings/glib/gpiod-glib/error.h
new file mode 100644
index 0000000..e23f07e
--- /dev/null
+++ b/bindings/glib/gpiod-glib/error.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_ERROR_H__
+#define __GPIODGLIB_ERROR_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+#define GPIODGLIB_ERROR gpiodglib_error_quark()
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
+} GpiodglibError;
+
+GQuark gpiodglib_error_quark(void);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_ERROR_H__ */
diff --git a/bindings/glib/gpiod-glib/info-event.h b/bindings/glib/gpiod-glib/info-event.h
new file mode 100644
index 0000000..ba8ad54
--- /dev/null
+++ b/bindings/glib/gpiod-glib/info-event.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_INFO_EVENT_H__
+#define __GPIODGLIB_INFO_EVENT_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
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
+G_DECLARE_FINAL_TYPE(GpiodglibInfoEvent, gpiodglib_info_event,
+		     GPIODGLIB, INFO_EVENT, GObject);
+
+#define GPIODGLIB_INFO_EVENT_TYPE (gpiodglib_info_event_get_type())
+#define GPIODGLIB_INFO_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_INFO_EVENT_TYPE, \
+				    GpiodglibInfoEvent))
+
+/**
+ * GpiodglibInfoEventType:
+ * @GPIODGLIB_INFO_EVENT_LINE_REQUESTED: Line has been requested.
+ * @GPIODGLIB_INFO_EVENT_LINE_RELEASED: Previously requested line has been
+ * released.
+ * @GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED: Line configuration has changed.
+ *
+ * Line status change event types.
+ */
+typedef enum {
+	GPIODGLIB_INFO_EVENT_LINE_REQUESTED = 1,
+	GPIODGLIB_INFO_EVENT_LINE_RELEASED,
+	GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED,
+} GpiodglibInfoEventType;
+
+/**
+ * gpiodglib_info_event_get_event_type:
+ * @self: #GpiodglibInfoEvent to manipulate.
+ *
+ * Get the event type of the status change event.
+ *
+ * Returns: One of @GPIODGLIB_INFO_EVENT_LINE_REQUESTED,
+ * @GPIODGLIB_INFO_EVENT_LINE_RELEASED or
+ * @GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED.
+ */
+GpiodglibInfoEventType
+gpiodglib_info_event_get_event_type(GpiodglibInfoEvent *self);
+
+/**
+ * gpiodglib_info_event_get_timestamp_ns:
+ * @self: #GpiodglibInfoEvent to manipulate.
+ *
+ * Get the timestamp of the event.
+ *
+ * Returns: Timestamp in nanoseconds, read from the monotonic clock.
+ */
+guint64 gpiodglib_info_event_get_timestamp_ns(GpiodglibInfoEvent *self);
+
+/**
+ * gpiodglib_info_event_get_line_info:
+ * @self #GpiodglibInfoEvent to manipulate.
+ *
+ * Get the snapshot of line-info associated with the event.
+ *
+ * Returns: (transfer full): New reference to the associated line-info object.
+ */
+GpiodglibLineInfo *gpiodglib_info_event_get_line_info(GpiodglibInfoEvent *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_INFO_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/line-config.h b/bindings/glib/gpiod-glib/line-config.h
new file mode 100644
index 0000000..20ce33d
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-config.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_CONFIG_H__
+#define __GPIODGLIB_LINE_CONFIG_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
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
+G_DECLARE_FINAL_TYPE(GpiodglibLineConfig, gpiodglib_line_config,
+		     GPIODGLIB, LINE_CONFIG, GObject);
+
+#define GPIODGLIB_LINE_CONFIG_TYPE (gpiodglib_line_config_get_type())
+#define GPIODGLIB_LINE_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_CONFIG_TYPE, \
+				    GpiodglibLineConfig))
+
+/**
+ * gpiodglib_line_config_new:
+ *
+ * Create a new #GpiodglibLineConfig.
+ *
+ * Returns: (transfer full): Empty #GpiodglibLineConfig.
+ */
+GpiodglibLineConfig *gpiodglib_line_config_new(void);
+
+/**
+ * gpiodglib_line_config_reset:
+ * @self: #GpiodglibLineConfig to manipulate.
+ *
+ * Reset the line config object.
+ */
+void gpiodglib_line_config_reset(GpiodglibLineConfig *self);
+
+/**
+ * gpiodglib_line_config_add_line_settings:
+ * @self: #GpiodglibLineConfig to manipulate.
+ * @offsets: (element-type GArray): GArray of offsets for which to apply the
+ * settings.
+ * @settings: #GpiodglibLineSettings to apply.
+ * @err: Return location for error or NULL.
+ *
+ * Add line settings for a set of offsets.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_config_add_line_settings(GpiodglibLineConfig *self,
+					const GArray *offsets,
+					GpiodglibLineSettings *settings,
+					GError **err);
+
+/**
+ * gpiodglib_line_config_get_line_settings:
+ * @self: #GpiodglibLineConfig to manipulate.
+ * @offset: Offset for which to get line settings.
+ *
+ * Get line settings for offset.
+ *
+ * Returns: (transfer full): New reference to a #GpiodglibLineSettings.
+ */
+GpiodglibLineSettings *
+gpiodglib_line_config_get_line_settings(GpiodglibLineConfig *self,
+					guint offset);
+
+/**
+ * gpiodglib_line_config_set_output_values:
+ * @self: #GpiodglibLineConfig to manipulate.
+ * @values: (element-type GArray): GArray containing the output values.
+ * @err: Return location for error or NULL.
+ *
+ * @brief Set output values for a number of lines.
+ *
+ * Returns: TRUE on success, FALSE on error.
+ */
+gboolean gpiodglib_line_config_set_output_values(GpiodglibLineConfig *self,
+						 const GArray *values,
+						 GError **err);
+
+/**
+ * gpiodglib_line_config_get_configured_offsets:
+ * @self: #GpiodglibLineConfig to manipulate.
+ *
+ * Get configured offsets.
+ *
+ * Returns: (transfer full) (element-type GArray): GArray containing the
+ * offsets for which configuration has been set.
+ */
+GArray *gpiodglib_line_config_get_configured_offsets(GpiodglibLineConfig *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_CONFIG_H__ */
diff --git a/bindings/glib/gpiod-glib/line-info.h b/bindings/glib/gpiod-glib/line-info.h
new file mode 100644
index 0000000..60fcad7
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-info.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_INFO_H__
+#define __GPIODGLIB_LINE_INFO_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
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
+G_DECLARE_FINAL_TYPE(GpiodglibLineInfo, gpiodglib_line_info,
+		     GPIODGLIB, LINE_INFO, GObject);
+
+#define GPIODGLIB_LINE_INFO_TYPE (gpiodglib_line_info_get_type())
+#define GPIODGLIB_LINE_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_INFO_TYPE, \
+				    GpiodglibLineInfo))
+
+/**
+ * gpiodglib_line_info_get_offset:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the offset of the line.
+ *
+ * The offset uniquely identifies the line on the chip. The combination of the
+ * chip and offset uniquely identifies the line within the system.
+ *
+ * Returns: Offset of the line within the parent chip.
+ */
+guint gpiodglib_line_info_get_offset(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_dup_name:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the name of the line.
+ *
+ * Returns: Name of the GPIO line as it is represented in the kernel. This
+ * function returns a valid pointer to a null-terminated string or NULL if the
+ * line is unnamed. The string is a copy of the line name and must be freed by
+ * the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_info_dup_name(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_is_used:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Check if the line is in use.
+ *
+ * The exact reason a line is busy cannot be determined from user space.
+ * It may have been requested by another process or hogged by the kernel.
+ * It only matters that the line is used and can't be requested until
+ * released by the existing consumer.
+ *
+ * Returns: TRUE if the line is in use, FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_used(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_dup_consumer:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the name of the consumer of the line.
+ *
+ * Returns: Name of the GPIO consumer as it is represented in the kernel. This
+ * function returns a valid pointer to a null-terminated string or NULL if the
+ * consumer name is not set. The string is a copy of the consumer label and
+ * must be freed by the caller with g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_info_dup_consumer(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_direction:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the direction setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_DIRECTION_INPUT or @GPIODGLIB_LINE_DIRECTION_OUTPUT.
+ */
+GpiodglibLineDirection
+gpiodglib_line_info_get_direction(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_edge_detection:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the edge detection setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_EDGE_NONE, @GPIODGLIB_LINE_EDGE_RISING,
+ * @GPIODGLIB_LINE_EDGE_FALLING or @GPIODGLIB_LINE_EDGE_BOTH.
+ */
+GpiodglibLineEdge
+gpiodglib_line_info_get_edge_detection(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_bias:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the bias setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_BIAS_PULL_UP, @GPIODGLIB_LINE_BIAS_PULL_DOWN,
+ * @GPIODGLIB_LINE_BIAS_DISABLED or @GPIODGLIB_LINE_BIAS_UNKNOWN.
+ */
+GpiodglibLineBias gpiodglib_line_info_get_bias(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_drive:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the drive setting of the line.
+ *
+ * Returns: @GPIODGLIB_LINE_DRIVE_PUSH_PULL, @GPIODGLIB_LINE_DRIVE_OPEN_DRAIN
+ * or @GPIODGLIB_LINE_DRIVE_OPEN_SOURCE.
+ */
+GpiodglibLineDrive gpiodglib_line_info_get_drive(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_is_active_low:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Check if the logical value of the line is inverted compared to the physical.
+ *
+ * Returns: TRUE if the line is "active-low", FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_active_low(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_is_debounced:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Check if the line is debounced (either by hardware or by the kernel
+ * software debouncer).
+ *
+ * Returns: TRUE if the line is debounced, FALSE otherwise.
+ */
+gboolean gpiodglib_line_info_is_debounced(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_debounce_period_us:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the debounce period of the line, in microseconds.
+ *
+ * Returns: Debounce period in microseconds. 0 if the line is not debounced.
+ */
+GTimeSpan gpiodglib_line_info_get_debounce_period_us(GpiodglibLineInfo *self);
+
+/**
+ * gpiodglib_line_info_get_event_clock:
+ * @self: #GpiodglibLineInfo to manipulate.
+ *
+ * Get the event clock setting used for edge event timestamps for the line.
+ *
+ * Returns: @GPIODGLIB_LINE_CLOCK_MONOTONIC, @GPIODGLIB_LINE_CLOCK_HTE or
+ * @GPIODGLIB_LINE_CLOCK_REALTIME.
+ */
+GpiodglibLineClock gpiodglib_line_info_get_event_clock(GpiodglibLineInfo *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/line-request.h b/bindings/glib/gpiod-glib/line-request.h
new file mode 100644
index 0000000..98393ec
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-request.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_REQUEST_H__
+#define __GPIODGLIB_LINE_REQUEST_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibLineRequest, gpiodglib_line_request,
+		     GPIODGLIB, LINE_REQUEST, GObject);
+
+#define GPIODGLIB_LINE_REQUEST_TYPE (gpiodglib_line_request_get_type())
+#define GPIODGLIB_LINE_REQUEST_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_REQUEST_TYPE, \
+				    GpiodglibLineRequest))
+
+/**
+ * gpiodglib_line_request_release:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Release the requested lines and free all associated resources.
+ */
+void gpiodglib_line_request_release(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_is_released:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Check if this request was released.
+ *
+ * Returns: TRUE if this request was released and is no longer valid, FALSE
+ * otherwise.
+ */
+gboolean gpiodglib_line_request_is_released(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_dup_chip_name:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Get the name of the chip this request was made on.
+ *
+ * Returns: Name the GPIO chip device. The string is a copy and must be freed
+ * by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_line_request_dup_chip_name(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_get_requested_offsets:
+ * @self: #GpiodglibLineRequest to manipulate.
+ *
+ * Get the offsets of the lines in the request.
+ *
+ * Returns: (transfer full) (element-type GArray): Array containing the
+ * requested offsets.
+ */
+GArray *
+gpiodglib_line_request_get_requested_offsets(GpiodglibLineRequest *self);
+
+/**
+ * gpiodglib_line_request_reconfigure_lines:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @config: New line config to apply.
+ * @err: Return location for error or NULL.
+ *
+ * Update the configuration of lines associated with a line request.
+ *
+ * The new line configuration completely replaces the old. Any requested lines
+ * without overrides are configured to the requested defaults. Any configured
+ * overrides for lines that have not been requested are silently ignored.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_reconfigure_lines(GpiodglibLineRequest *self,
+						  GpiodglibLineConfig *config,
+						  GError **err);
+
+/**
+ * gpiodglib_line_request_get_value:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offset: The offset of the line of which the value should be read.
+ * @value: Return location for the value.
+ * @err: Return location for error or NULL.
+ *
+ * Get the value of a single requested line.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_request_get_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue *value, GError **err);
+
+/**
+ * gpiodglib_line_request_get_values_subset:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offsets: (element-type GArray): Array of offsets identifying the subset of
+ * requested lines from which to read values.
+ * @values: (element-type GArray): Array in which the values will be stored.
+ * Can be NULL in which case a new array will be created and its location
+ * stored here.
+ * @err: Return location for error or NULL.
+ *
+ * Get the values of a subset of requested lines.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_get_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  GArray **values,
+						  GError **err);
+
+/**
+ * gpiodglib_line_request_get_values:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @values: (element-type GArray): Array in which the values will be stored.
+ * Can be NULL in which case a new array will be created and its location
+ * stored here.
+ * @err: Return location for error or NULL.
+ *
+ * Get the values of all requested lines.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_get_values(GpiodglibLineRequest *self,
+					   GArray **values, GError **err);
+
+/**
+ * gpiodglib_line_request_set_value:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offset: The offset of the line for which the value should be set.
+ * @value: Value to set.
+ * @err: Return location for error or NULL.
+ *
+ * Set the value of a single requested line.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean
+gpiodglib_line_request_set_value(GpiodglibLineRequest *self, guint offset,
+				 GpiodglibLineValue value, GError **err);
+
+/**
+ * gpiodglib_line_request_set_values_subset:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @offsets: (element-type GArray): Array of offsets identifying the requested
+ * lines for which to set values.
+ * @values: (element-type GArray): Array in which the values will be stored.
+ * Can be NULL in which case a new array will be created and its location
+ * stored here.
+ * @err: Return location for error or NULL.
+ *
+ * Set the values of a subset of requested lines.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_set_values_subset(GpiodglibLineRequest *self,
+						  const GArray *offsets,
+						  const GArray *values,
+						  GError **err);
+
+/**
+ * gpiodglib_line_request_set_values:
+ * @self: #GpiodglibLineRequest to manipulate.
+ * @values: (element-type GArray): Array containing the values to set. Must be
+ * sized to contain the number of values equal to the number of requested lines.
+ * Each value is associated with the line identified by the corresponding entry
+ * in the offset array filled by @gpiodglib_line_request_get_requested_offsets.
+ * @err: Return location for error or NULL.
+ *
+ * Set the values of all lines associated with a request.
+ *
+ * Returns: TRUE on success, FALSE on failure.
+ */
+gboolean gpiodglib_line_request_set_values(GpiodglibLineRequest *self,
+					   GArray *values, GError **err);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_REQUEST_H__ */
diff --git a/bindings/glib/gpiod-glib/line-settings.h b/bindings/glib/gpiod-glib/line-settings.h
new file mode 100644
index 0000000..3f14b91
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-settings.h
@@ -0,0 +1,220 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_SETTINGS_H__
+#define __GPIODGLIB_LINE_SETTINGS_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
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
+G_DECLARE_FINAL_TYPE(GpiodglibLineSettings, gpiodglib_line_settings,
+		     GPIODGLIB, LINE_SETTINGS, GObject);
+
+#define GPIODGLIB_LINE_SETTINGS_TYPE (gpiodglib_line_settings_get_type())
+#define GPIODGLIB_LINE_SETTINGS_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_LINE_SETTINGS_TYPE, \
+				    GpiodglibLineSettings))
+
+/**
+ * gpiodglib_line_settings_new:
+ * @first_prop: Name of the first property to set.
+ *
+ * Create a new line settings object.
+ *
+ * The constructor allows to set object's properties when it's first created
+ * instead of having to build an empty object and then call mutators separately.
+ *
+ * Currently supported properties are: `direction`, `edge-detection`, `bias`,
+ * `drive`, `debounce-period-us`, `active-low`, 'event-clock` and
+ * `output-value`.
+ *
+ * Returns: New #GpiodglibLineSettings.
+ */
+GpiodglibLineSettings *
+gpiodglib_line_settings_new(const gchar *first_prop, ...);
+
+/**
+ * gpiodglib_line_settings_reset:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Reset the line settings object to its default values.
+ */
+void gpiodglib_line_settings_reset(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_direction:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @direction: New direction.
+ *
+ * Set direction.
+ */
+void gpiodglib_line_settings_set_direction(GpiodglibLineSettings *self,
+					   GpiodglibLineDirection direction);
+
+/**
+ * gpiodglib_line_settings_get_direction:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get direction.
+ *
+ * Returns: Current direction.
+ */
+GpiodglibLineDirection
+gpiodglib_line_settings_get_direction(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_edge_detection:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @edge: New edge detection setting.
+ *
+ * Set edge detection.
+ */
+void gpiodglib_line_settings_set_edge_detection(GpiodglibLineSettings *self,
+						GpiodglibLineEdge edge);
+
+/**
+ * gpiodglib_line_settings_get_edge_detection:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get edge detection.
+ *
+ * Returns: Current edge detection setting.
+ */
+GpiodglibLineEdge
+gpiodglib_line_settings_get_edge_detection(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_bias:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @bias: New bias.
+ *
+ * Set bias.
+ */
+void gpiodglib_line_settings_set_bias(GpiodglibLineSettings *self,
+				      GpiodglibLineBias bias);
+
+/**
+ * gpiodglib_line_settings_get_bias:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get bias.
+ *
+ * Returns: Current bias setting.
+ */
+GpiodglibLineBias gpiodglib_line_settings_get_bias(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_drive:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @drive: New drive setting.
+ *
+ * Set drive.
+ */
+void gpiodglib_line_settings_set_drive(GpiodglibLineSettings *self,
+				       GpiodglibLineDrive drive);
+
+/**
+ * gpiodglib_line_settings_get_drive:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get drive.
+ *
+ * Returns: Current drive setting.
+ */
+GpiodglibLineDrive
+gpiodglib_line_settings_get_drive(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_active_low:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @active_low: New active-low setting.
+ *
+ * Set active-low setting.
+ */
+void gpiodglib_line_settings_set_active_low(GpiodglibLineSettings *self,
+					    gboolean active_low);
+
+/**
+ * gpiodglib_line_settings_get_active_low:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get active-low setting.
+ *
+ * Returns: TRUE if active-low is enabled, FALSE otherwise.
+ */
+gboolean gpiodglib_line_settings_get_active_low(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_debounce_period_us:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @period: New debounce period in microseconds.
+ *
+ * Set debounce period.
+ */
+void gpiodglib_line_settings_set_debounce_period_us(GpiodglibLineSettings *self,
+						    GTimeSpan period);
+
+/**
+ * gpiodglib_line_settings_get_debounce_period_us:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get debounce period.
+ *
+ * Returns: Current debounce period in microseconds.
+ */
+GTimeSpan
+gpiodglib_line_settings_get_debounce_period_us(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_event_clock:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @event_clock: New event clock.
+ *
+ * Set event clock.
+ */
+void gpiodglib_line_settings_set_event_clock(GpiodglibLineSettings *self,
+					     GpiodglibLineClock event_clock);
+
+/**
+ * gpiodglib_line_settings_get_event_clock:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get event clock setting.
+ *
+ * Returns: Current event clock setting.
+ */
+GpiodglibLineClock
+gpiodglib_line_settings_get_event_clock(GpiodglibLineSettings *self);
+
+/**
+ * gpiodglib_line_settings_set_output_value:
+ * @self: #GpiodglibLineSettings to manipulate.
+ * @value: New output value.
+ *
+ * Set the output value.
+ */
+void gpiodglib_line_settings_set_output_value(GpiodglibLineSettings *self,
+					      GpiodglibLineValue value);
+
+/**
+ * gpiodglib_line_settings_get_output_value:
+ * @self: #GpiodglibLineSettings to manipulate.
+ *
+ * Get the output value.
+ *
+ * Returns: Current output value.
+ */
+GpiodglibLineValue
+gpiodglib_line_settings_get_output_value(GpiodglibLineSettings *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_SETTINGS_H__ */
diff --git a/bindings/glib/gpiod-glib/line.h b/bindings/glib/gpiod-glib/line.h
new file mode 100644
index 0000000..16bcd9c
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_LINE_H__
+#define __GPIODGLIB_LINE_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+
+/**
+ * GpiodglibLineValue:
+ * @GPIODGLIB_LINE_VALUE_INACTIVE: Line is logically inactive.
+ * @GPIODGLIB_LINE_VALUE_ACTIVE: Line is logically active.
+ *
+ * Logical line state.
+ */
+typedef enum {
+	GPIODGLIB_LINE_VALUE_INACTIVE = 0,
+	GPIODGLIB_LINE_VALUE_ACTIVE = 1,
+} GpiodglibLineValue;
+
+/**
+ * GpiodglibLineDirection:
+ * @GPIODGLIB_LINE_DIRECTION_AS_IS: Request the line(s), but don't change
+ * direction.
+ * @GPIODGLIB_LINE_DIRECTION_INPUT: Direction is input - for reading the value
+ * of an externally driven GPIO line.
+ * @GPIODGLIB_LINE_DIRECTION_OUTPUT: Direction is output - for driving the GPIO
+ * line.
+ *
+ * Direction settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_DIRECTION_AS_IS = 1,
+	GPIODGLIB_LINE_DIRECTION_INPUT,
+	GPIODGLIB_LINE_DIRECTION_OUTPUT,
+} GpiodglibLineDirection;
+
+/**
+ * GpiodglibLineEdge
+ * @GPIODGLIB_LINE_EDGE_NONE: Line edge detection is disabled.
+ * @GPIODGLIB_LINE_EDGE_RISING: Line detects rising edge events.
+ * @GPIODGLIB_LINE_EDGE_FALLING: Line detects falling edge events.
+ * @GPIODGLIB_LINE_EDGE_BOTH: Line detects both rising and falling edge events.
+ *
+ * Edge detection settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_EDGE_NONE = 1,
+	GPIODGLIB_LINE_EDGE_RISING,
+	GPIODGLIB_LINE_EDGE_FALLING,
+	GPIODGLIB_LINE_EDGE_BOTH,
+} GpiodglibLineEdge;
+
+/**
+ * GpiodglibLineBias:
+ * @GPIODGLIB_LINE_BIAS_AS_IS: Don't change the bias setting when applying line
+ * config.
+ * @GPIODGLIB_LINE_BIAS_UNKNOWN: The internal bias state is unknown.
+ * @GPIODGLIB_LINE_BIAS_DISABLED: The internal bias is disabled.
+ * @GPIODGLIB_LINE_BIAS_PULL_UP: The internal pull-up bias is enabled.
+ * @GPIODGLIB_LINE_BIAS_PULL_DOWN: The internal pull-down bias is enabled.
+ *
+ * Internal bias settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_BIAS_AS_IS = 1,
+	GPIODGLIB_LINE_BIAS_UNKNOWN,
+	GPIODGLIB_LINE_BIAS_DISABLED,
+	GPIODGLIB_LINE_BIAS_PULL_UP,
+	GPIODGLIB_LINE_BIAS_PULL_DOWN,
+} GpiodglibLineBias;
+
+/**
+ * GpiodglibLineDrive:
+ * @GPIODGLIB_LINE_DRIVE_PUSH_PULL: Drive setting is push-pull.
+ * @GPIODGLIB_LINE_DRIVE_OPEN_DRAIN: Line output is open-drain.
+ * @GPIODGLIB_LINE_DRIVE_OPEN_SOURCE: Line output is open-source.
+ *
+ * Drive settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_DRIVE_PUSH_PULL = 1,
+	GPIODGLIB_LINE_DRIVE_OPEN_DRAIN,
+	GPIODGLIB_LINE_DRIVE_OPEN_SOURCE,
+} GpiodglibLineDrive;
+
+/**
+ * GpiodglibLineClock:
+ * @GPIODGLIB_LINE_CLOCK_MONOTONIC: Line uses the monotonic clock for edge
+ * event timestamps.
+ * @GPIODGLIB_LINE_CLOCK_REALTIME: Line uses the realtime clock for edge event
+ * timestamps.
+ * @GPIODGLIB_LINE_CLOCK_HTE: Line uses the hardware timestamp engine for event
+ * timestamps.
+ *
+ * Clock settings.
+ */
+typedef enum {
+	GPIODGLIB_LINE_CLOCK_MONOTONIC = 1,
+	GPIODGLIB_LINE_CLOCK_REALTIME,
+	GPIODGLIB_LINE_CLOCK_HTE,
+} GpiodglibLineClock;
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_LINE_H__ */
diff --git a/bindings/glib/gpiod-glib/misc.h b/bindings/glib/gpiod-glib/misc.h
new file mode 100644
index 0000000..2d30dbc
--- /dev/null
+++ b/bindings/glib/gpiod-glib/misc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_MISC_H__
+#define __GPIODGLIB_MISC_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * gpiodglib_is_gpiochip_device:
+ * @path: Path to check.
+ *
+ * Check if the file pointed to by path is a GPIO chip character device.
+ *
+ * Returns: TRUE if the file exists and is either a GPIO chip character device
+ * or a symbolic link to one, FALSE otherwise.
+ */
+gboolean gpiodglib_is_gpiochip_device(const gchar *path);
+
+/**
+ * gpiodglib_api_version:
+ *
+ * Get the API version of the library as a human-readable string.
+ *
+ * Returns: A valid pointer to a human-readable string containing the library
+ * version. The pointer is valid for the lifetime of the program and must not
+ * be freed by the caller.
+ */
+const gchar *gpiodglib_api_version(void);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_MISC_H__ */
diff --git a/bindings/glib/gpiod-glib/request-config.h b/bindings/glib/gpiod-glib/request-config.h
new file mode 100644
index 0000000..76e884b
--- /dev/null
+++ b/bindings/glib/gpiod-glib/request-config.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_REQUEST_CONFIG_H__
+#define __GPIODGLIB_REQUEST_CONFIG_H__
+
+#if !defined(__INSIDE_GPIOD_GLIB_H__) && !defined(GPIODGLIB_COMPILATION)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+#include <glib-object.h>
+
+G_BEGIN_DECLS
+
+G_DECLARE_FINAL_TYPE(GpiodglibRequestConfig, gpiodglib_request_config,
+		     GPIODGLIB, REQUEST_CONFIG, GObject);
+
+#define GPIODGLIB_REQUEST_CONFIG_TYPE (gpiodglib_request_config_get_type())
+#define GPIODGLIB_REQUEST_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), GPIODGLIB_REQUEST_CONFIG_TYPE, \
+				    GpiodglibRequestConfig))
+
+/**
+ * gpiodglib_request_config_new:
+ * @first_prop: Name of the first property to set.
+ *
+ * Create a new request config object.
+ *
+ * Returns: New #GpiodglibRequestConfig.
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
+ * gpiodglib_request_config_set_consumer:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ * @consumer: Consumer name.
+ *
+ * Set the consumer name for the request.
+ *
+ * If the consumer string is too long, it will be truncated to the max
+ * accepted length.
+ */
+void gpiodglib_request_config_set_consumer(GpiodglibRequestConfig *self,
+					   const gchar *consumer);
+
+/**
+ * gpiodglib_request_config_dup_consumer:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ *
+ * Get the consumer name configured in the request config.
+ *
+ * Returns: Consumer name stored in the request config. The returned string is
+ * a copy and must be freed by the caller using g_free().
+ */
+gchar * G_GNUC_WARN_UNUSED_RESULT
+gpiodglib_request_config_dup_consumer(GpiodglibRequestConfig *self);
+
+/**
+ * gpiodglib_request_config_set_event_buffer_size:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ * @event_buffer_size: New event buffer size.
+ *
+ * Set the size of the kernel event buffer for the request.
+ *
+ * The kernel may adjust the value if it's too high. If set to 0, the default
+ * value will be used.
+ */
+void
+gpiodglib_request_config_set_event_buffer_size(GpiodglibRequestConfig *self,
+					       guint event_buffer_size);
+
+
+/**
+ * gpiodglib_request_config_get_event_buffer_size:
+ * @self: #GpiodglibRequestConfig object to manipulate.
+ *
+ * Get the edge event buffer size for the request config.
+ *
+ * Returns: Edge event buffer size setting from the request config.
+ */
+guint
+gpiodglib_request_config_get_event_buffer_size(GpiodglibRequestConfig *self);
+
+G_END_DECLS
+
+#endif /* __GPIODGLIB_REQUEST_CONFIG_H__ */

-- 
2.43.0


