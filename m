Return-Path: <linux-gpio+bounces-7813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E560891C632
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6961F23450
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DED5674E;
	Fri, 28 Jun 2024 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SoPZOSsv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B1A55E58
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601147; cv=none; b=Cye4arnFqeto1/NY4bJybyPEFxFfdqagLp1h264LBGDL988pHu+mtHI9q53n3MQtOb06Hadh/Xd8HwuL+iTbuPyDcHKP5tkuqWg8lSLQzg+YmA0UaRJKXRkaKbHqJo3V7WeZhTObnEI3b69v83QmyE3rj/kRpr7Url2Q5S8PLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601147; c=relaxed/simple;
	bh=jHDNApF6Py0Jb/L4gKZb/5Q3dfZO/6Yy20UkG2CM944=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWOa9qY5ndgGle7OFIRvMykbgmMD+AXXMQGJ+GmNngOPquxu3I4Sff/tVQxCvnZCSW8FEONqwj0ed1Fb2JWFzxx75/2sEdkUTlz0IPEoNOgPrxWKgw7Zdx8M1eQd5il6w59xoeIKInDfe12v9b6C6elvnf6MlYbeOwATjWgkaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SoPZOSsv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42562e4b5d1so6920535e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601142; x=1720205942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvTuvy1Ai6TZS13lF1q6X9ZQcEeWbyNLSCkPhm4FmQI=;
        b=SoPZOSsv+G6Wi5co0hdkCD4YXvlyRsUfzuU7Dti+Y+zJc8pHVm+g4zOF9e+EqAvYBR
         qXBly6479Ugvv/fWuqEoYHk0WSWeuXgkB4GEdMNFUoI6uE69TwGuKdnZSWiANDmxkO+f
         sCWNwj+Y1P07BbsQcr/QkLdFb0/0dw6+I7P1r9jcx3UeiYH13AgDnwekDJaGo4VYJcxW
         d4IoOUe2J904SvqjIEC9NoE2QV8q4s4ZCwn7bwH0lIAMDMU66LOXZE3tnlzjZvoB23ef
         kqmRE7eEONMsl0+P5aLxO5NwHrgBsaNbTs2rL4SoVmbdhv/EEORxyTCCq9AU5xu5thFN
         5t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601142; x=1720205942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvTuvy1Ai6TZS13lF1q6X9ZQcEeWbyNLSCkPhm4FmQI=;
        b=rvF1QALL5Z5aq1Hq2mgyLUQHgUXrILYk3dKh9+HDaGVzgbj/nzlM2ar9fbCu6H88kY
         9omZyoplhd5FC0aEFOkxY3Ia31p7Lr4t/at1DfuIYcbX+6RGmzWz3L7jojZLC1Djjt8Y
         sHVmWm0kZLucNLzRoRp11hL/0HHQHc1cJbtZhZAHSpkHk6FS9z98CINlTNoNB/kYm4cC
         6dR6b21zx5i7sshZIN2KMfknqxllL3AOzsZzO+kzTAXYRR0+GTFFAwmvsY1TVsHwo4Me
         KkeQdQeq732BEdEVMZ4McpG2yeAV4nT4GTq7LcqDSvE3yMEbWAdL60SWYoM3e1xHGmv9
         nxkg==
X-Forwarded-Encrypted: i=1; AJvYcCUaW/mO1NbxPCFKhn+ZnpRJHlhTCpJ1DSPN0MjwaEyFcPx8+CJ4O7pPaN42q9FA4x3Aw5vnx5ZfkKd33YWQup/zVWfhvQ6uArUykg==
X-Gm-Message-State: AOJu0YzLxt6cm66BC6MyJS2wCnnpMTcYT6uhfSonZc0HTRJarpnx3SVI
	JLn9Uppyiq3UMWFnaP8MRvMH+HF9s2nl3TO2QRDS37kgDSlSMMTjYlBaBIBosXE=
X-Google-Smtp-Source: AGHT+IG4C+LvpRHaDKX3xH2xK+TeA5HdHQEyj4m6r4kn0xqUMhbeO65JSMJ8V+Bdb/IaalLpn1lWJg==
X-Received: by 2002:a05:6000:154d:b0:366:e508:c7d7 with SMTP id ffacd0b85a97d-366e508c9d5mr15952943f8f.7.1719601141987;
        Fri, 28 Jun 2024 11:59:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:23 +0200
Subject: [PATCH RESEND libgpiod v2 04/18] bindings: glib: add public
 headers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-4-c1331ac17cb8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=49036;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yASdN/rfYx1HxoyUfgQTVlxDhy8bZbAEnv+bDBPwhdY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfq4jw3/hhZ1fgtFBetfOsGeeL/LPq/sE7s0
 clIXIzM7DiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H6gAKCRARpy6gFHHX
 csOqD/9JLxN34QcliguvOdHtl4RgsOds6zh3Xcc21LsAYcyTYinIrVzL154CYfK0D41+61+69sO
 1ZT0NLNjfnugiZpochKTDVTlTgI0KKbF6QZ/REqoAI9chR9o2HApjjnwLx9aCkh0mWUJV8k4LcK
 w9JRzcKUaKsX7slrQNoe1sBDWDimQhxZIuSiHzmpRGVLjdykxzxpR09IdF2o8mM3frSHKd3LgSk
 CwZbJJwpK8Sd6XI4skIN/RcNbF+LB2g0pMmYm+cYKakulFZPa+eThJVouBQow8LrS1soUiQ/ksP
 gaY3JZAwbHHz55uqQpiobAjQYoo8Z0psZtrU60hPljbHhYb5zFgK4Q3x7yN5ffYcS6u+eSXSLsb
 FtBm1PN68Ej+FM3uUkrShe5qruopGTneb9/Phh3Vo3zc43lbWdt/p7ZIkRkRLll9zFerTOqIdij
 56Do3yr9N+QXRPuha+ZV1fzgJHD4Qbur2s64ZgISu7+b1oqUAN5io9p4qlZbpA0Um9knC8BV+FL
 7PtHtUV7vW6Zt/Ze3Kmoo2qBnNtSVijlIIiwyLvUs6Si5/yiJgox6S4pDA+GLIirmeDghibEBuw
 hF58ZXzIsoJtOfL2Abj4LIp/ezC98Ic7yeIY/t9c9pVhdhz7KVfF/IeRtYrdE6UiI8vSKpUGXND
 VUIypGPu7+bTHxg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the public headers for GLib bindings. They contain the entire API
together with Doxygen comments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/generated-enums.h.template  |  30 +++++
 bindings/glib/gpiod-glib.h                |  33 +++++
 bindings/glib/gpiod-glib/chip-info.h      |  84 +++++++++++++
 bindings/glib/gpiod-glib/chip.h           | 164 ++++++++++++++++++++++++
 bindings/glib/gpiod-glib/edge-event.h     | 114 +++++++++++++++++
 bindings/glib/gpiod-glib/error.h          |  67 ++++++++++
 bindings/glib/gpiod-glib/info-event.h     |  97 ++++++++++++++
 bindings/glib/gpiod-glib/line-config.h    | 116 +++++++++++++++++
 bindings/glib/gpiod-glib/line-info.h      | 171 +++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line-request.h   | 182 +++++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line-settings.h  | 202 ++++++++++++++++++++++++++++++
 bindings/glib/gpiod-glib/line.h           | 114 +++++++++++++++++
 bindings/glib/gpiod-glib/misc.h           |  51 ++++++++
 bindings/glib/gpiod-glib/request-config.h | 107 ++++++++++++++++
 14 files changed, 1532 insertions(+)

diff --git a/bindings/glib/generated-enums.h.template b/bindings/glib/generated-enums.h.template
new file mode 100644
index 0000000..53ea247
--- /dev/null
+++ b/bindings/glib/generated-enums.h.template
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+/*** BEGIN file-header ***/
+
+#ifndef __GPIOD_GLIB_GENERATED_ENUMS_H__
+#define __GPIOD_GLIB_GENERATED_ENUMS_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+#endif /* __GPIOD_GLIB_GENERATED_ENUMS_H__ */
+/*** END file-tail ***/
diff --git a/bindings/glib/gpiod-glib.h b/bindings/glib/gpiod-glib.h
new file mode 100644
index 0000000..c45064c
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
+ * @defgroup gpiod_glib GLib bindings
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
index 0000000..bfa5a02
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip-info.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file chip-info.h
+ */
+
+#ifndef __GPIOD_GLIB_CHIP_INFO_H__
+#define __GPIOD_GLIB_CHIP_INFO_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODChipInfo, g_gpiod_chip_info,
+		     G_GPIOD, CHIP_INFO, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_CHIP_INFO_TYPE (g_gpiod_chip_info_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO chip-info concrete GObject.
+ */
+#define G_GPIOD_CHIP_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_CHIP_INFO_TYPE, \
+				    GPIODChipInfo))
+
+/**
+ * @brief Get the name of the chip as represented in the kernel.
+ * @param self GPIO chip info object to manipulate.
+ * @return Valid pointer to a human-readable string containing the chip name.
+ *         The string lifetime is tied to the chip info object so the pointer
+ *         must not be freed by the caller.
+ */
+const gchar *g_gpiod_chip_info_get_name(GPIODChipInfo *self);
+
+/**
+ * @brief Get the label of the chip as represented in the kernel.
+ * @param self GPIO chip info object to manipulate.
+ * @return Valid pointer to a human-readable string containing the chip label.
+ *         The string lifetime is tied to the chip info object so the pointer
+ *         must not be freed by the caller.
+ */
+const gchar *g_gpiod_chip_info_get_label(GPIODChipInfo *self);
+
+/**
+ * @brief Get the number of lines exposed by the chip.
+ * @param self GPIO chip info object to manipulate.
+ * @return Number of GPIO lines.
+ */
+guint g_gpiod_chip_info_get_num_lines(GPIODChipInfo *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_CHIP_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/chip.h b/bindings/glib/gpiod-glib/chip.h
new file mode 100644
index 0000000..3b6e907
--- /dev/null
+++ b/bindings/glib/gpiod-glib/chip.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file chip.h
+ */
+
+#ifndef __GPIOD_GLIB_CHIP_H__
+#define __GPIOD_GLIB_CHIP_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODChip, g_gpiod_chip, G_GPIOD, CHIP, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
+ * @{
+ *
+ * @defgroup gobject_chip GPIO chip GObject
+ * @{
+ *
+ * This type represents a GPIO chip. In addition to the methods defined here,
+ * it exposes the `info-event` signal with the following signature:
+ *
+ *     void (*)(GPIODChip *, GPIODInfoEvent *, gpointer)
+ */
+
+/**
+ * @brief Get the GObject type for the GPIO chip.
+ */
+#define G_GPIOD_CHIP_TYPE (g_gpiod_chip_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO chip concrete GObject.
+ */
+#define G_GPIOD_CHIP_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_CHIP_TYPE, GPIODChip))
+
+/**
+ * @brief Instantiates a new chip object by opening the device file indicated
+ *        by \p path.
+ * @param path Path to the device file to open.
+ * @param err Return location for error or NULL.
+ * @return New GPIO chip object.
+ */
+GPIODChip *g_gpiod_chip_new(const gchar *path, GError **err);
+
+/**
+ * @brief Close the GPIO chip device file and free associated resources.
+ * @param self Chip object to manipulate.
+ * @note The chip object can live after calling this method but any of
+ *       the chip's methods will result in an error being set.
+ */
+void g_gpiod_chip_close(GPIODChip *self);
+
+/**
+ * @brief Check if this object is valid.
+ * @param self Chip object to manipulate.
+ * @return TRUE if this object's methods can be used, FALSE otherwise.
+ *         False usually means the chip was closed. If the user calls
+ *         any of the methods of this class on an object for which this
+ *         operator returned false, a logic_error will be thrown.
+ */
+gboolean g_gpiod_chip_is_closed(GPIODChip *self);
+
+/**
+ * @brief Get the filesystem path that was used to open this GPIO chip.
+ * @param self Chip object to manipulate.
+ * @return Path to the underlying character device file.
+ */
+const gchar *g_gpiod_chip_get_path(GPIODChip *self);
+
+/**
+ * @brief Get information about the chip.
+ * @param self Chip object to manipulate.
+ * @param err Return location for error or NULL.
+ * @return New GPIO chip info object.
+ */
+GPIODChipInfo *g_gpiod_chip_get_info(GPIODChip *self, GError **err);
+
+/**
+ * @brief Retrieve the current snapshot of line information for a single line.
+ * @param self Chip object to manipulate.
+ * @param offset Offset of the line to get the info for.
+ * @param err Return location for error or NULL.
+ * @return New GPIO line info object.
+ */
+GPIODLineInfo *
+g_gpiod_chip_get_line_info(GPIODChip *self, guint offset, GError **err);
+
+/**
+ * @brief Retrieve the current snapshot of line information for a single line
+ *        and start watching this line for future changes.
+ * @param self Chip object to manipulate.
+ * @param offset Offset of the line to get the info for and to watch.
+ * @param err Return location for error or NULL.
+ * @return New GPIO line info object.
+ */
+GPIODLineInfo *
+g_gpiod_chip_watch_line_info(GPIODChip *self, guint offset, GError **err);
+
+/**
+ * @brief Stop watching the line at given offset for info events.
+ * @param self Chip object to manipulate.
+ * @param offset Offset of the line to get the info for.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean
+g_gpiod_chip_unwatch_line_info(GPIODChip *self, guint offset, GError **err);
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
+g_gpiod_chip_get_line_offset_from_name(GPIODChip *self, const gchar *name,
+				       guint *offset, GError **err);
+
+/**
+ * @brief Request a set of lines for exclusive usage.
+ * @param self Chip object to manipulate.
+ * @param req_cfg Request config object. Can be NULL for default settings.
+ * @param line_cfg Line config object.
+ * @param err Return location for error or NULL.
+ * @return New GPIO line request object or NULL on failure.
+ */
+GPIODLineRequest *g_gpiod_chip_request_lines(GPIODChip *self,
+					     GPIODRequestConfig *req_cfg,
+					     GPIODLineConfig *line_cfg,
+					     GError **err);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_CHIP_H__ */
diff --git a/bindings/glib/gpiod-glib/edge-event.h b/bindings/glib/gpiod-glib/edge-event.h
new file mode 100644
index 0000000..711a8fb
--- /dev/null
+++ b/bindings/glib/gpiod-glib/edge-event.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file edge-event.h
+ */
+
+#ifndef __GPIOD_GLIB_EDGE_EVENT_H__
+#define __GPIOD_GLIB_EDGE_EVENT_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODEdgeEvent, g_gpiod_edge_event,
+		     G_GPIOD, EDGE_EVENT, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_EDGE_EVENT_TYPE (g_gpiod_edge_event_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO edge-event concrete GObject.
+ */
+#define G_GPIOD_EDGE_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_EDGE_EVENT_TYPE, \
+				    GPIODEdgeEvent))
+
+/**
+ * @brief Event types.
+ */
+typedef enum {
+	G_GPIOD_EDGE_EVENT_RISING_EDGE = 1,
+	/**< Rising edge event. */
+	G_GPIOD_EDGE_EVENT_FALLING_EDGE,
+	/**< Falling edge event. */
+} GPIODEdgeEventType;
+
+/**
+ * @brief Get the event type.
+ * @param self GPIO edge event to manipulate.
+ * @return The event type (::G_GPIOD_EDGE_EVENT_RISING_EDGE or
+ *         ::G_GPIOD_EDGE_EVENT_FALLING_EDGE).
+ */
+GPIODEdgeEventType g_gpiod_edge_event_get_event_type(GPIODEdgeEvent *self);
+
+/**
+ * @brief Get the timestamp of the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Timestamp in nanoseconds.
+ * @note The source clock for the timestamp depends on the event_clock
+ *       setting for the line.
+ */
+guint64 g_gpiod_edge_event_get_timestamp_ns(GPIODEdgeEvent *self);
+
+/**
+ * @brief Get the offset of the line which triggered the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Line offset.
+ */
+guint g_gpiod_edge_event_get_line_offset(GPIODEdgeEvent *self);
+
+/**
+ * @brief Get the global sequence number of the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Sequence number of the event in the series of events for all lines
+ *         in the associated line request.
+ */
+gulong g_gpiod_edge_event_get_global_seqno(GPIODEdgeEvent *self);
+
+/**
+ * @brief Get the event sequence number specific to the line.
+ * @param self GPIO edge event to manipulate.
+ * @return Sequence number of the event in the series of events only for this
+ *         line within the lifetime of the associated line request.
+ */
+gulong g_gpiod_edge_event_get_line_seqno(GPIODEdgeEvent *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_EDGE_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/error.h b/bindings/glib/gpiod-glib/error.h
new file mode 100644
index 0000000..3433c11
--- /dev/null
+++ b/bindings/glib/gpiod-glib/error.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file error.h
+ */
+
+#ifndef __GPIOD_GLIB_ERROR_H__
+#define __GPIOD_GLIB_ERROR_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @ingroup gpiod_glib
+ * @{
+ */
+
+/**
+ * @brief Get the libgpiod GObject error domain.
+ */
+#define G_GPIOD_ERROR g_gpiod_error_quark()
+
+/**
+ * @}
+ *
+ * @cond
+ */
+
+typedef enum {
+	G_GPIOD_ERR_FAILED = 1,
+	G_GPIOD_ERR_CHIP_CLOSED,
+	G_GPIOD_ERR_REQUEST_RELEASED,
+	G_GPIOD_ERR_PERM,
+	G_GPIOD_ERR_NOENT,
+	G_GPIOD_ERR_INTR,
+	G_GPIOD_ERR_IO,
+	G_GPIOD_ERR_NXIO,
+	G_GPIOD_ERR_E2BIG,
+	G_GPIOD_ERR_BADFD,
+	G_GPIOD_ERR_CHILD,
+	G_GPIOD_ERR_AGAIN,
+	G_GPIOD_ERR_NOMEM,
+	G_GPIOD_ERR_ACCES,
+	G_GPIOD_ERR_FAULT,
+	G_GPIOD_ERR_BUSY,
+	G_GPIOD_ERR_EXIST,
+	G_GPIOD_ERR_NODEV,
+	G_GPIOD_ERR_INVAL,
+	G_GPIOD_ERR_NOTTY,
+	G_GPIOD_ERR_PIPE,
+} GPIODError;
+
+GQuark g_gpiod_error_quark(void);
+
+/**
+ * @endcond
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_ERROR_H__ */
diff --git a/bindings/glib/gpiod-glib/info-event.h b/bindings/glib/gpiod-glib/info-event.h
new file mode 100644
index 0000000..d9e61e3
--- /dev/null
+++ b/bindings/glib/gpiod-glib/info-event.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file info-event.h
+ */
+
+#ifndef __GPIOD_GLIB_INFO_EVENT_H__
+#define __GPIOD_GLIB_INFO_EVENT_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODInfoEvent, g_gpiod_info_event,
+		     G_GPIOD, INFO_EVENT, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_INFO_EVENT_TYPE (g_gpiod_info_event_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO info-event concrete GObject.
+ */
+#define G_GPIOD_INFO_EVENT_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_INFO_EVENT_TYPE, \
+				    GPIODInfoEvent))
+
+/**
+ * @brief Line status change event types.
+ */
+typedef enum {
+	G_GPIOD_INFO_EVENT_LINE_REQUESTED = 1,
+	/**< Line has been requested. */
+	G_GPIOD_INFO_EVENT_LINE_RELEASED,
+	/**< Previously requested line has been released. */
+	G_GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,
+	/**< Line configuration has changed. */
+} GPIODInfoEventType;
+
+/**
+ * @brief Get the event type of the status change event.
+ * @param self GPIO edge event to manipulate.
+ * @return One of ::G_GPIOD_INFO_EVENT_LINE_REQUESTED,
+ *         ::G_GPIOD_INFO_EVENT_LINE_RELEASED or
+ *         ::G_GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED.
+ */
+GPIODInfoEventType g_gpiod_info_event_get_event_type(GPIODInfoEvent *self);
+
+/**
+ * @brief Get the timestamp of the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Timestamp in nanoseconds, read from the monotonic clock.
+ */
+guint64 g_gpiod_info_event_get_timestamp_ns(GPIODInfoEvent *self);
+
+/**
+ * @brief Get the snapshot of line-info associated with the event.
+ * @param self GPIO edge event to manipulate.
+ * @return Returns a new reference to the associated line-info object.
+ */
+GPIODLineInfo *g_gpiod_info_event_get_line_info(GPIODInfoEvent *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_INFO_EVENT_H__ */
diff --git a/bindings/glib/gpiod-glib/line-config.h b/bindings/glib/gpiod-glib/line-config.h
new file mode 100644
index 0000000..a477165
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-config.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-config.h
+ */
+
+#ifndef __GPIOD_GLIB_LINE_CONFIG_H__
+#define __GPIOD_GLIB_LINE_CONFIG_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODLineConfig, g_gpiod_line_config,
+		     G_GPIOD, LINE_CONFIG, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_LINE_CONFIG_TYPE (g_gpiod_line_config_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-config concrete GObject.
+ */
+#define G_GPIOD_LINE_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_LINE_CONFIG_TYPE, \
+				    GPIODLineConfig))
+
+/**
+ * @brief Create a new line config object.
+ * @return Empty line config object.
+ */
+GPIODLineConfig *g_gpiod_line_config_new(void);
+
+/**
+ * @brief Reset the line config object.
+ * @param self GPIO line config to manipulate.
+ */
+void g_gpiod_line_config_reset(GPIODLineConfig *self);
+
+/**
+ * @brief Add line settings for a set of offsets.
+ * @param self GPIO line config to manipulate.
+ * @param offsets GArray of offsets for which to apply the settings.
+ * @param settings Line settings to apply.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean g_gpiod_line_config_add_line_settings(GPIODLineConfig *self,
+					       const GArray *offsets,
+					       GPIODLineSettings *settings,
+					       GError **err);
+
+/**
+ * @brief Get line settings for offset.
+ * @param self GPIO line config to manipulate.
+ * @param offset Offset for which to get line settings.
+ * @return New reference to a line settings object.
+ */
+GPIODLineSettings *
+g_gpiod_line_config_get_line_settings(GPIODLineConfig *self, guint offset);
+
+/**
+ * @brief Set output values for a number of lines.
+ * @param self GPIO line config to manipulate.
+ * @param values GArray containing the output values.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on error.
+ */
+gboolean g_gpiod_line_config_set_output_values(GPIODLineConfig *self,
+					       const GArray *values,
+					       GError **err);
+
+/**
+ * @brief Get configured offsets.
+ * @param self GPIO line config to manipulate.
+ * @return GArray containing the offsets for which configuration has been set.
+ */
+GArray *g_gpiod_line_config_get_configured_offsets(GPIODLineConfig *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_LINE_CONFIG_H__ */
diff --git a/bindings/glib/gpiod-glib/line-info.h b/bindings/glib/gpiod-glib/line-info.h
new file mode 100644
index 0000000..d94750c
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-info.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-info.h
+ */
+
+#ifndef __GPIOD_GLIB_LINE_INFO_H__
+#define __GPIOD_GLIB_LINE_INFO_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODLineInfo, g_gpiod_line_info,
+		     G_GPIOD, LINE_INFO, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_LINE_INFO_TYPE (g_gpiod_line_info_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-info concrete GObject.
+ */
+#define G_GPIOD_LINE_INFO_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_LINE_INFO_TYPE, \
+				    GPIODLineInfo))
+
+/**
+ * @brief Get the offset of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Offset of the line within the parent chip.
+ *
+ * The offset uniquely identifies the line on the chip. The combination of the
+ * chip and offset uniquely identifies the line within the system.
+ */
+guint g_gpiod_line_info_get_offset(GPIODLineInfo *self);
+
+/**
+ * @brief Get the name of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Name of the GPIO line as it is represented in the kernel.
+ *         This function returns a valid pointer to a null-terminated string
+ *         or NULL if the line is unnamed. The string lifetime is tied to the
+ *         line info object so the pointer must not be freed.
+ */
+const gchar *g_gpiod_line_info_get_name(GPIODLineInfo *self);
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
+gboolean g_gpiod_line_info_is_used(GPIODLineInfo *self);
+
+/**
+ * @brief Get the name of the consumer of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Name of the GPIO consumer as it is represented in the kernel.
+ *         This function returns a valid pointer to a null-terminated string
+ *         or NULL if the consumer name is not set. The string lifetime is tied
+ *         to the line info object so the pointer must not be freed.
+ */
+const gchar *g_gpiod_line_info_get_consumer(GPIODLineInfo *self);
+
+/**
+ * @brief Get the direction setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::G_GPIOD_LINE_DIRECTION_INPUT or
+ *        ::G_GPIOD_LINE_DIRECTION_OUTPUT.
+ */
+GPIODLineDirection g_gpiod_line_info_get_direction(GPIODLineInfo *self);
+
+/**
+ * @brief Get the edge detection setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::G_GPIOD_LINE_EDGE_NONE, ::G_GPIOD_LINE_EDGE_RISING,
+ *        ::G_GPIOD_LINE_EDGE_FALLING or ::G_GPIOD_LINE_EDGE_BOTH.
+ */
+GPIODLineEdge g_gpiod_line_info_get_edge_detection(GPIODLineInfo *self);
+
+/**
+ * @brief Get the bias setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::G_GPIOD_LINE_BIAS_PULL_UP, ::G_GPIOD_LINE_BIAS_PULL_DOWN,
+ *         ::G_GPIOD_LINE_BIAS_DISABLED or ::G_GPIOD_LINE_BIAS_UNKNOWN.
+ */
+GPIODLineBias g_gpiod_line_info_get_bias(GPIODLineInfo *self);
+
+/**
+ * @brief Get the drive setting of the line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::G_GPIOD_LINE_DRIVE_PUSH_PULL,
+ *         ::G_GPIOD_LINE_DRIVE_OPEN_DRAIN or ::G_GPIOD_LINE_DRIVE_OPEN_SOURCE.
+ */
+GPIODLineDrive g_gpiod_line_info_get_drive(GPIODLineInfo *self);
+
+/**
+ * @brief Check if the logical value of the line is inverted compared to the
+ *        physical.
+ * @param self GPIO line info object to manipulate.
+ * @return TRUE if the line is "active-low", FALSE otherwise.
+ */
+gboolean g_gpiod_line_info_is_active_low(GPIODLineInfo *self);
+
+/**
+ * @brief Check if the line is debounced (either by hardware or by the kernel
+ *        software debouncer).
+ * @param self GPIO line info object to manipulate.
+ * @return TRUE if the line is debounced, FALSE otherwise.
+ */
+gboolean g_gpiod_line_info_is_debounced(GPIODLineInfo *self);
+
+/**
+ * @brief Get the debounce period of the line, in microseconds.
+ * @param self GPIO line info object to manipulate.
+ * @return Debounce period in microseconds. 0 if the line is not debounced.
+ */
+GTimeSpan g_gpiod_line_info_get_debounce_period_us(GPIODLineInfo *self);
+
+/**
+ * @brief Get the event clock setting used for edge event timestamps for the
+ *        line.
+ * @param self GPIO line info object to manipulate.
+ * @return Returns ::G_GPIOD_LINE_CLOCK_MONOTONIC, ::G_GPIOD_LINE_CLOCK_HTE or
+ *         ::G_GPIOD_LINE_CLOCK_REALTIME.
+ */
+GPIODLineClock g_gpiod_line_info_get_event_clock(GPIODLineInfo *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_LINE_INFO_H__ */
diff --git a/bindings/glib/gpiod-glib/line-request.h b/bindings/glib/gpiod-glib/line-request.h
new file mode 100644
index 0000000..1c906f1
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-request.h
@@ -0,0 +1,182 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-request.h
+ */
+
+#ifndef __GPIOD_GLIB_LINE_REQUEST_H__
+#define __GPIOD_GLIB_LINE_REQUEST_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODLineRequest, g_gpiod_line_request,
+		     G_GPIOD, LINE_REQUEST, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_LINE_REQUEST_TYPE (g_gpiod_line_request_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-request concrete GObject.
+ */
+#define G_GPIOD_LINE_REQUEST_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_LINE_REQUEST_TYPE, \
+				    GPIODLineRequest))
+
+/**
+ * @brief Release the requested lines and free all associated resources.
+ * @param self GPIO line request object to manipulate.
+ */
+void g_gpiod_line_request_release(GPIODLineRequest *self);
+
+/**
+ * @brief Check if this request was released.
+ * @param self GPIO line request object to manipulate.
+ * @return TRUE if this request was released and is no longer valid, FALSE
+ *         otherwise.
+ */
+gboolean g_gpiod_line_request_is_released(GPIODLineRequest *self);
+
+/**
+ * @brief Get the name of the chip this request was made on.
+ * @param self GPIO line request object to manipulate.
+ * @return Name the GPIO chip device.
+ */
+const gchar *g_gpiod_line_request_get_chip_name(GPIODLineRequest *self);
+
+/**
+ * @brief Get the offsets of the lines in the request.
+ * @param self GPIO line request object to manipulate.
+ * @return Array containing the requested offsets.
+ */
+GArray *g_gpiod_line_request_get_requested_offsets(GPIODLineRequest *self);
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
+gboolean g_gpiod_line_request_reconfigure_lines(GPIODLineRequest *self,
+						GPIODLineConfig *config,
+						GError **err);
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
+g_gpiod_line_request_get_value(GPIODLineRequest *self, guint offset,
+			       GPIODLineValue *value, GError **err);
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
+gboolean g_gpiod_line_request_get_values_subset(GPIODLineRequest *self,
+						const GArray *offsets,
+						GArray **values,
+						GError **err);
+
+/**
+ * @brief Get the values of all requested lines.
+ * @param self GPIO line request object to manipulate.
+ * @param values Array in which the values will be stored. Can be NULL in which
+ *               case a new array will be created and its location stored here.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean g_gpiod_line_request_get_values(GPIODLineRequest *self,
+					 GArray **values, GError **err);
+
+/**
+ * @brief Set the value of a single requested line.
+ * @param self GPIO line request object to manipulate.
+ * @param offset The offset of the line for which the value should be set.
+ * @param value Value to set.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean g_gpiod_line_request_set_value(GPIODLineRequest *self, guint offset,
+					GPIODLineValue value, GError **err);
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
+gboolean g_gpiod_line_request_set_values_subset(GPIODLineRequest *self,
+						const GArray *offsets,
+						const GArray *values,
+						GError **err);
+
+/**
+ * @brief Set the values of all lines associated with a request.
+ * @param self GPIO line request object to manipulate.
+ * @param values Array containing the values to set. Must be sized to
+ *               contain the number of values equal to the number of requested
+ *               lines. Each value is associated with the line identified by
+ *               the corresponding entry in the offset array filled by
+ *               ::g_gpiod_line_request_get_requested_offsets.
+ *               case a new array will be created and its location stored here.
+ * @param err Return location for error or NULL.
+ * @return TRUE on success, FALSE on failure.
+ */
+gboolean g_gpiod_line_request_set_values(GPIODLineRequest *self,
+					 GArray *values, GError **err);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_LINE_REQUEST_H__ */
diff --git a/bindings/glib/gpiod-glib/line-settings.h b/bindings/glib/gpiod-glib/line-settings.h
new file mode 100644
index 0000000..fbdf911
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line-settings.h
@@ -0,0 +1,202 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line-settings.h
+ */
+
+#ifndef __GPIOD_GLIB_LINE_SETTINGS_H__
+#define __GPIOD_GLIB_LINE_SETTINGS_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODLineSettings, g_gpiod_line_settings,
+		     G_GPIOD, LINE_SETTINGS, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_LINE_SETTINGS_TYPE (g_gpiod_line_settings_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO line-settings concrete GObject.
+ */
+#define G_GPIOD_LINE_SETTINGS_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_LINE_SETTINGS_TYPE, \
+				    GPIODLineSettings))
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
+GPIODLineSettings *g_gpiod_line_settings_new(const gchar *first_prop, ...);
+
+/**
+ * @brief Reset the line settings object to its default values.
+ * @param self Line settings object to manipulate.
+ */
+void g_gpiod_line_settings_reset(GPIODLineSettings *self);
+
+/**
+ * @brief Set direction.
+ * @param self Line settings object to manipulate.
+ * @param direction New direction.
+ */
+void g_gpiod_line_settings_set_direction(GPIODLineSettings *self,
+					 GPIODLineDirection direction);
+
+/**
+ * @brief Get direction.
+ * @param self Line settings object to manipulate.
+ * @return Current direction.
+ */
+GPIODLineDirection g_gpiod_line_settings_get_direction(GPIODLineSettings *self);
+
+/**
+ * @brief Set edge detection.
+ * @param self Line settings object to manipulate.
+ * @param edge New edge detection setting.
+ */
+void g_gpiod_line_settings_set_edge_detection(GPIODLineSettings *self,
+					      GPIODLineEdge edge);
+
+/**
+ * @brief Get edge detection.
+ * @param self Line settings object to manipulate.
+ * @return Current edge detection setting.
+ */
+GPIODLineEdge g_gpiod_line_settings_get_edge_detection(GPIODLineSettings *self);
+
+/**
+ * @brief Set bias.
+ * @param self Line settings object to manipulate.
+ * @param bias New bias.
+ */
+void g_gpiod_line_settings_set_bias(GPIODLineSettings *self,
+				    GPIODLineBias bias);
+
+/**
+ * @brief Get bias.
+ * @param self Line settings object to manipulate.
+ * @return Current bias setting.
+ */
+GPIODLineBias g_gpiod_line_settings_get_bias(GPIODLineSettings *self);
+
+/**
+ * @brief Set drive.
+ * @param self Line settings object to manipulate.
+ * @param drive New drive setting.
+ */
+void g_gpiod_line_settings_set_drive(GPIODLineSettings *self,
+				     GPIODLineDrive drive);
+
+/**
+ * @brief Get drive.
+ * @param self Line settings object to manipulate.
+ * @return Current drive setting.
+ */
+GPIODLineDrive g_gpiod_line_settings_get_drive(GPIODLineSettings *self);
+
+/**
+ * @brief Set active-low setting.
+ * @param self Line settings object to manipulate.
+ * @param active_low New active-low setting.
+ */
+void g_gpiod_line_settings_set_active_low(GPIODLineSettings *self,
+					  gboolean active_low);
+
+/**
+ * @brief Get active-low setting.
+ * @param self Line settings object to manipulate.
+ * @return TRUE if active-low is enabled, FALSE otherwise.
+ */
+gboolean g_gpiod_line_settings_get_active_low(GPIODLineSettings *self);
+
+/**
+ * @brief Set debounce period.
+ * @param self Line settings object to manipulate.
+ * @param period New debounce period in microseconds.
+ */
+void g_gpiod_line_settings_set_debounce_period_us(GPIODLineSettings *self,
+						  GTimeSpan period);
+
+/**
+ * @brief Get debounce period.
+ * @param self Line settings object to manipulate.
+ * @return Current debounce period in microseconds.
+ */
+GTimeSpan g_gpiod_line_settings_get_debounce_period_us(GPIODLineSettings *self);
+
+/**
+ * @brief Set event clock.
+ * @param self Line settings object to manipulate.
+ * @param event_clock New event clock.
+ */
+void g_gpiod_line_settings_set_event_clock(GPIODLineSettings *self,
+					   GPIODLineClock event_clock);
+
+/**
+ * @brief Get event clock setting.
+ * @param self Line settings object to manipulate.
+ * @return Current event clock setting.
+ */
+GPIODLineClock g_gpiod_line_settings_get_event_clock(GPIODLineSettings *self);
+
+/**
+ * @brief Set the output value.
+ * @param self Line settings object to manipulate.
+ * @param value New output value.
+ */
+void g_gpiod_line_settings_set_output_value(GPIODLineSettings *self,
+					    GPIODLineValue value);
+
+/**
+ * @brief Get the output value.
+ * @param self Line settings object to manipulate.
+ * @return Current output value.
+ */
+GPIODLineValue g_gpiod_line_settings_get_output_value(GPIODLineSettings *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_LINE_SETTINGS_H__ */
diff --git a/bindings/glib/gpiod-glib/line.h b/bindings/glib/gpiod-glib/line.h
new file mode 100644
index 0000000..9d90b74
--- /dev/null
+++ b/bindings/glib/gpiod-glib/line.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file line.h
+ */
+
+#ifndef __GPIOD_GLIB_LINE_H__
+#define __GPIOD_GLIB_LINE_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @ingroup gpiod_glib
+ * @{
+ *
+ * @defgroup gpiod_glib_line Line definitions
+ * @{
+ *
+ * These defines are used across the API.
+ */
+
+/**
+ * @brief Logical line state.
+ */
+typedef enum {
+	G_GPIOD_LINE_VALUE_INACTIVE = 0,
+	/**< Line is logically inactive. */
+	G_GPIOD_LINE_VALUE_ACTIVE = 1,
+	/**< Line is logically active. */
+} GPIODLineValue;
+
+/**
+ * @brief Direction settings.
+ */
+typedef enum {
+	G_GPIOD_LINE_DIRECTION_AS_IS = 1,
+	/**< Request the line(s), but don't change direction. */
+	G_GPIOD_LINE_DIRECTION_INPUT,
+	/**< Direction is input - for reading the value of an externally driven
+	 *   GPIO line. */
+	G_GPIOD_LINE_DIRECTION_OUTPUT,
+	/**< Direction is output - for driving the GPIO line. */
+} GPIODLineDirection;
+
+/**
+ * @brief Edge detection settings.
+ */
+typedef enum {
+	G_GPIOD_LINE_EDGE_NONE = 1,
+	/**< Line edge detection is disabled. */
+	G_GPIOD_LINE_EDGE_RISING,
+	/**< Line detects rising edge events. */
+	G_GPIOD_LINE_EDGE_FALLING,
+	/**< Line detects falling edge events. */
+	G_GPIOD_LINE_EDGE_BOTH,
+	/**< Line detects both rising and falling edge events. */
+} GPIODLineEdge;
+
+/**
+ * @brief Internal bias settings.
+ */
+typedef enum {
+	G_GPIOD_LINE_BIAS_AS_IS = 1,
+	/**< Don't change the bias setting when applying line config. */
+	G_GPIOD_LINE_BIAS_UNKNOWN,
+	/**< The internal bias state is unknown. */
+	G_GPIOD_LINE_BIAS_DISABLED,
+	/**< The internal bias is disabled. */
+	G_GPIOD_LINE_BIAS_PULL_UP,
+	/**< The internal pull-up bias is enabled. */
+	G_GPIOD_LINE_BIAS_PULL_DOWN,
+	/**< The internal pull-down bias is enabled. */
+} GPIODLineBias;
+
+/**
+ * @brief Drive settings.
+ */
+typedef enum {
+	G_GPIOD_LINE_DRIVE_PUSH_PULL = 1,
+	/**< Drive setting is push-pull. */
+	G_GPIOD_LINE_DRIVE_OPEN_DRAIN,
+	/**< Line output is open-drain. */
+	G_GPIOD_LINE_DRIVE_OPEN_SOURCE,
+	/**< Line output is open-source. */
+} GPIODLineDrive;
+
+/**
+ * @brief Clock settings.
+ */
+typedef enum {
+	G_GPIOD_LINE_CLOCK_MONOTONIC = 1,
+	/**< Line uses the monotonic clock for edge event timestamps. */
+	G_GPIOD_LINE_CLOCK_REALTIME,
+	/**< Line uses the realtime clock for edge event timestamps. */
+	G_GPIOD_LINE_CLOCK_HTE,
+	/**< Line uses the hardware timestamp engine for event timestamps. */
+} GPIODLineClock;
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_LINE_H__ */
diff --git a/bindings/glib/gpiod-glib/misc.h b/bindings/glib/gpiod-glib/misc.h
new file mode 100644
index 0000000..d555aae
--- /dev/null
+++ b/bindings/glib/gpiod-glib/misc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file misc.h
+ */
+
+#ifndef __GPIOD_GLIB_MISC_H__
+#define __GPIOD_GLIB_MISC_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
+#error "Only <gpiod-glib.h> can be included directly."
+#endif
+
+#include <glib.h>
+
+G_BEGIN_DECLS
+
+/**
+ * @ingroup gpiod_glib
+ * @{
+ *
+ * @defgroup gpiod_glib_misc Misc functions.
+ * @{
+ */
+
+/**
+ * @brief Check if the file pointed to by path is a GPIO chip character device.
+ * @param path Path to check.
+ * @return TRUE if the file exists and is either a GPIO chip character device
+ *         or a symbolic link to one, FALSE otherwise.
+ */
+gboolean g_gpiod_is_gpiochip_device(const gchar *path);
+
+/**
+ * @brief Get the API version of the library as a human-readable string.
+ * @return A valid pointer to a human-readable string containing the library
+ *         version. The pointer is valid for the lifetime of the program and
+ *         must not be freed by the caller.
+ */
+const gchar *g_gpiod_api_version(void);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_MISC_H__ */
diff --git a/bindings/glib/gpiod-glib/request-config.h b/bindings/glib/gpiod-glib/request-config.h
new file mode 100644
index 0000000..c413f0f
--- /dev/null
+++ b/bindings/glib/gpiod-glib/request-config.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+/**
+ * @file request-config.h
+ */
+
+#ifndef __GPIOD_GLIB_REQUEST_CONFIG_H__
+#define __GPIOD_GLIB_REQUEST_CONFIG_H__
+
+#if !defined (__GPIOD_GLIB_INSIDE__)
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
+G_DECLARE_FINAL_TYPE(GPIODRequestConfig, g_gpiod_request_config,
+		     G_GPIOD, REQUEST_CONFIG, GObject);
+
+/**
+ * @endcond
+ *
+ * @ingroup gpiod_glib
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
+#define G_GPIOD_REQUEST_CONFIG_TYPE (g_gpiod_request_config_get_type())
+
+/**
+ * @brief Cast a GObject to a GPIO request-config concrete GObject.
+ */
+#define G_GPIOD_REQUEST_CONFIG_OBJ(obj) \
+	(G_TYPE_CHECK_INSTANCE_CAST((obj), G_GPIOD_REQUEST_CONFIG_TYPE, \
+				    GPIODRequestConfig))
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
+GPIODRequestConfig *g_gpiod_request_config_new(const gchar *first_prop, ...);
+
+/**
+ * @brief Set the consumer name for the request.
+ * @param self GPIO request config object to manipulate.
+ * @param consumer Consumer name.
+ * @note If the consumer string is too long, it will be truncated to the max
+ *       accepted length.
+ */
+void g_gpiod_request_config_set_consumer(GPIODRequestConfig *self,
+					 const gchar *consumer);
+
+/**
+ * @brief Get the consumer name configured in the request config.
+ * @param self GPIO request config object to manipulate.
+ * @return Consumer name stored in the request config.
+ */
+const gchar *g_gpiod_request_config_get_consumer(GPIODRequestConfig *self);
+
+/**
+ * @brief Set the size of the kernel event buffer for the request.
+ * @param self GPIO request config object to manipulate.
+ * @param event_buffer_size New event buffer size.
+ * @note The kernel may adjust the value if it's too high. If set to 0, the
+ *       default value will be used.
+ */
+void g_gpiod_request_config_set_event_buffer_size(GPIODRequestConfig *self,
+						  guint event_buffer_size);
+
+
+/**
+ * @brief Get the edge event buffer size for the request config.
+ * @param self GPIO request config object to manipulate.
+ * @return Edge event buffer size setting from the request config.
+ */
+guint g_gpiod_request_config_get_event_buffer_size(GPIODRequestConfig *self);
+
+/**
+ * @}
+ *
+ * @}
+ */
+
+G_END_DECLS
+
+#endif /* __GPIOD_GLIB_REQUEST_CONFIG_H__ */

-- 
2.43.0


