Return-Path: <linux-gpio+bounces-8269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E58934AEA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7F01C20958
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6829F82D83;
	Thu, 18 Jul 2024 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jLUjLoES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C281AD7
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294931; cv=none; b=JC1I98DycanPWKuoqNF5YGkgRzmharfQGLD+GMAQjiw/tALxBlHs+6EnGu+Sk/ftxP8KADoiHEuU/cwmPo8gt0ZwD8r5c6Y9YUFQ1iScdIkTCPIU/jJ8RXuODzqYPgJ4dbGP9prwkkTvX4nutkzEp/wR8n/iIyZ3qxA9V2F/yh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294931; c=relaxed/simple;
	bh=22k6gf9vThz/+MGYyPlbKPRGCAtVOX5+GV4a3RUdeks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iu2EnhGS/wbClZZqJS64XQ865P+/dtuwLug+ZYogqDaXFa4m8dg3ANpL1PTNPWNJHjF9OirrGgwuowubc+RzzCkFf+6WtuFP0kyoETfGLKycHImIwwPN1pYRJWEOVDZyKmYg6O8abKFFn5TdzgX06X9LzUnG7/AQYZDarboK8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jLUjLoES; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3685b9c8998so144367f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294925; x=1721899725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Szuob1E6Fo+djoRcPBa+Eqm4pVOXSw1upHsLCvTr1YQ=;
        b=jLUjLoESmuIzkzfq2GXFZmrU6VEDTrJUkk1wQDmiCI+z80oL1muJp9RDRd6Jvmxqnf
         qVBE9qh/aFZd8eFydKSRZ4pwTWPe6GQXRxR+qgtdRlyT8ACl9RHnBj9vtpDs1jOdQ56b
         ENp/6Zs3S1YRe1UYuqmhhYfgItfXy5tsHw/jBvF+wINliloJV7Mfj/GGs5pVtQ73SIUW
         2bRsOer621SdaqzFIxmx2xjQO03+RnxHXfnat3NyJaLW3Ks052A8K9GFziGG3YYO3CYH
         N/VDqcr26M42zLeUQofi9LTVYy5H2reLn63l+VBlspJETEHDv6xqDM59wBJMPaDCcXVA
         KI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294925; x=1721899725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Szuob1E6Fo+djoRcPBa+Eqm4pVOXSw1upHsLCvTr1YQ=;
        b=szOqgclQtmBbvQJ6ysUvCUsd5vx+hK/HcY89gjf9vCct8jewenC+gj60G+tsJhJ5ic
         t5Xp8yqBxnMWT4PrKy+Qb/v4pbfeWfRXbl4Djax7dyrEygn/yFFTWuS+mfRO1JRI4nLd
         4OrUfqk07ABC53zbgfpdeZQFaV7gnR0ZEQTHfisxaPr/O1s93+xI6BYKjqlEeBXcJ20Q
         Ae6EPSpaSqy0UGv3D5ItgWdYeX39cAa44fcCssc3/3PyxnBCK/N4FIfIOp5JPCwMs7le
         4faEiKkrhqwnccw2m6iWg41GowsUjbt5TvT+drFta6g6PsndLZMiecOsQr4TTYLNHcE0
         SnOQ==
X-Gm-Message-State: AOJu0YxIcFecEJv+3mcZzrov13WSjmw5soe5Zj79hNm+XG2ZRVXqjAeW
	9wb5Ad3xlEYGVmDMi0v9TI394Q+wJK+NXEGgFWqyJnMiRcN1sMFfwgtTubWLHVo=
X-Google-Smtp-Source: AGHT+IG70AoZ/06e7vrB48EvWRXxfZARkzvwWh/7a41hGW7w4+mciKMni0xhBfO6FHDQvrR9/kntug==
X-Received: by 2002:a05:6000:71d:b0:366:e838:f5d4 with SMTP id ffacd0b85a97d-368315edb2emr3163365f8f.3.1721294925052;
        Thu, 18 Jul 2024 02:28:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:01 +0200
Subject: [PATCH libgpiod v3 07/18] bindings: glib: add tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-7-c9ea2604f082@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=79672;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=u3b7dMwlVXfU9YJkHGmlOqw3gEGLUnMjNHpIOFGPGqw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOA/lrz2qaRHTGXk6LmAou8t++iUkZx8p2Onu
 VAuMrIrOHqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgPwAKCRARpy6gFHHX
 curhD/9ioynZ9N52IKPnqQ8J+MbPon3ZZkQzCDl14EREBFRMXyKWhdc6p/27v7wVO10NZpq9v3K
 YnrACqghtMf6MTyNsn9hV8+eWxEouxyJjDuPSN0V7Y+M/LWUQPFzC87nSBkeYRLRgsIQNmiW5Ne
 yW9kZFX5RsZtqoMTya9MbyxsliHesJ3u740xKXOROP+7CL/+YR2rlnyJ3TyeM7CNYCK03/ZS1Y9
 bkwRUKYE+5qRYZuPMVWPpG3+QVCvMTsZWUdwlgjL6ATWuugoI52hzbCced+/h1Sh5QhF4yNDq0o
 6IsJI3T4mNVMAIm393PZVAfmnTXyLZRQUMZP9ZTgJDrwRLb/fES73GoIIeYP4JAF/BQciTrmf14
 /Y9gYkcTSaO2uXLQnUnSofhe56MKi6UOWmVICKGgYVCcc9ecY2CqCh0Gp0iQ0rBOucKEpMdgwTs
 1aV/tRZDeEI1quxkb1FxKRIFVepb37jRPkdrk9eDSTNNukCL9o/a1Dxx2UdlRSdL8sX/oM0R/oA
 xLiAzIsc6D8pA0i3ma5pRZCNEyJhac2+kVb/hl423L1Tb/pktc6Mc/NfYZyJJScc2oiMK87ZKPJ
 u27oa51LMMGUhafbsNReZwLN4fuJwMD8W8P5Sgfoqwy0p0R33WJmX9m9c4xCKqwSGBp86ETVUOw
 kozly9ZR/euWZpg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a comprehensive set of test-cases for GLib bindings to libgpiod
reusing the core test framework based around the gpio-sim module.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/tests/helpers.c              |  12 +
 bindings/glib/tests/helpers.h              | 140 ++++++
 bindings/glib/tests/tests-chip-info.c      |  58 +++
 bindings/glib/tests/tests-chip.c           | 187 ++++++++
 bindings/glib/tests/tests-edge-event.c     | 225 +++++++++
 bindings/glib/tests/tests-info-event.c     | 322 +++++++++++++
 bindings/glib/tests/tests-line-config.c    | 187 ++++++++
 bindings/glib/tests/tests-line-info.c      | 102 +++++
 bindings/glib/tests/tests-line-request.c   | 710 +++++++++++++++++++++++++++++
 bindings/glib/tests/tests-line-settings.c  | 256 +++++++++++
 bindings/glib/tests/tests-misc.c           |  88 ++++
 bindings/glib/tests/tests-request-config.c |  64 +++
 12 files changed, 2351 insertions(+)

diff --git a/bindings/glib/tests/helpers.c b/bindings/glib/tests/helpers.c
new file mode 100644
index 0000000..202c2d5
--- /dev/null
+++ b/bindings/glib/tests/helpers.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "helpers.h"
+
+GArray *gpiodglib_test_array_from_const(gconstpointer data, gsize len,
+					gsize elem_size)
+{
+	GArray *arr = g_array_new(FALSE, TRUE, elem_size);
+
+	return g_array_append_vals(arr, data, len);
+}
diff --git a/bindings/glib/tests/helpers.h b/bindings/glib/tests/helpers.h
new file mode 100644
index 0000000..ad0a938
--- /dev/null
+++ b/bindings/glib/tests/helpers.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODGLIB_TEST_HELPERS_H__
+#define __GPIODGLIB_TEST_HELPERS_H__
+
+#include <glib.h>
+#include <gpiod-test-common.h>
+
+#define gpiodglib_test_new_chip_or_fail(_path) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibChip *_chip = gpiodglib_chip_new(_path, &_err); \
+		g_assert_nonnull(_chip); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_chip; \
+	})
+
+#define gpiodglib_test_chip_get_info_or_fail(_chip) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibChipInfo *_info = gpiodglib_chip_get_info(_chip, \
+								   &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiodglib_test_chip_get_line_info_or_fail(_chip, _offset) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibLineInfo *_info = \
+			gpiodglib_chip_get_line_info(_chip, _offset, &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiodglib_test_chip_watch_line_info_or_fail(_chip, _offset) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibLineInfo *_info = \
+			gpiodglib_chip_watch_line_info(_chip, _offset, \
+						       &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiodglib_test_chip_unwatch_line_info_or_fail(_chip, _offset) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean ret = gpiodglib_chip_unwatch_line_info(_chip, \
+								_offset, \
+								&_err); \
+		g_assert_true(ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodglib_test_line_config_add_line_settings_or_fail(_config, \
+							     _offsets, \
+							     _settings) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret = \
+			gpiodglib_line_config_add_line_settings(_config, \
+								_offsets,\
+								_settings, \
+								&_err); \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodglib_test_line_config_get_line_settings_or_fail(_config, \
+							     _offset) \
+	({ \
+		GpiodglibLineSettings *_settings = \
+			gpiodglib_line_config_get_line_settings(_config, \
+								_offset); \
+		g_assert_nonnull(_settings); \
+		gpiod_test_return_if_failed(); \
+		_settings; \
+	})
+
+#define gpiodglib_test_line_config_set_output_values_or_fail(_config, \
+							     _values) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret = \
+			gpiodglib_line_config_set_output_values(_config, \
+								_values, \
+								&_err); \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiodglib_test_chip_request_lines_or_fail(_chip, _req_cfg, _line_cfg) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GpiodglibLineRequest *_req = \
+			gpiodglib_chip_request_lines(_chip, _req_cfg, \
+						     _line_cfg, &_err); \
+		g_assert_nonnull(_req); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_req; \
+	})
+
+#define gpiodglib_test_request_lines_or_fail(_path, _req_cfg, _line_cfg) \
+	({ \
+		g_autoptr(GpiodglibChip) _chip = \
+			gpiodglib_test_new_chip_or_fail(_path); \
+		GpiodglibLineRequest *_req = \
+			gpiodglib_test_chip_request_lines_or_fail(_chip, \
+								  _req_cfg, \
+								  _line_cfg); \
+		_req; \
+	})
+
+#define gpiodglib_test_check_error_or_fail(_err, _domain, _code) \
+	do { \
+		g_assert_nonnull(_err); \
+		gpiod_test_return_if_failed(); \
+		g_assert_cmpint(_domain, ==, (_err)->domain); \
+		g_assert_cmpint(_code, ==, (_err)->code); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+GArray *gpiodglib_test_array_from_const(const gconstpointer data, gsize len,
+					 gsize elem_size);
+
+#endif /* __GPIODGLIB_TEST_HELPERS_H__ */
+
diff --git a/bindings/glib/tests/tests-chip-info.c b/bindings/glib/tests/tests-chip-info.c
new file mode 100644
index 0000000..22b83c2
--- /dev/null
+++ b/bindings/glib/tests/tests-chip-info.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/chip-info"
+
+GPIOD_TEST_CASE(get_name)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autofree gchar *name = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_info_or_fail(chip);
+	name = gpiodglib_chip_info_dup_name(info);
+
+	g_assert_cmpstr(name, ==, g_gpiosim_chip_get_name(sim));
+}
+
+GPIOD_TEST_CASE(get_label)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("label", "foobar",
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	g_autofree gchar *label = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_info_or_fail(chip);
+	label = gpiodglib_chip_info_dup_label(info);
+
+	g_assert_cmpstr(label, ==, "foobar");
+}
+
+GPIOD_TEST_CASE(get_num_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_info_or_fail(chip);
+
+	g_assert_cmpuint(gpiodglib_chip_info_get_num_lines(info), ==, 16);
+}
diff --git a/bindings/glib/tests/tests-chip.c b/bindings/glib/tests/tests-chip.c
new file mode 100644
index 0000000..9888b38
--- /dev/null
+++ b/bindings/glib/tests/tests-chip.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/chip"
+
+GPIOD_TEST_CASE(open_chip_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new(g_gpiosim_chip_get_dev_path(sim), &err);
+	g_assert_nonnull(chip);
+	g_assert_null(err);
+}
+
+GPIOD_TEST_CASE(open_chip_nonexistent)
+{
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new("/dev/nonexistent", &err);
+	g_assert_null(chip);
+	gpiodglib_test_check_error_or_fail(err, GPIODGLIB_ERROR,
+					   GPIODGLIB_ERR_NOENT);
+}
+
+GPIOD_TEST_CASE(open_chip_not_a_character_device)
+{
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new("/tmp", &err);
+	g_assert_null(chip);
+	gpiodglib_test_check_error_or_fail(err, GPIODGLIB_ERROR,
+					   GPIODGLIB_ERR_NOTTY);
+}
+
+GPIOD_TEST_CASE(open_chip_not_a_gpio_device)
+{
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_chip_new("/dev/null", &err);
+	g_assert_null(chip);
+	gpiodglib_test_check_error_or_fail(err, GPIODGLIB_ERROR,
+					   GPIODGLIB_ERR_NODEV);
+}
+
+GPIOD_TEST_CASE(get_chip_path)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	const gchar *path = g_gpiosim_chip_get_dev_path(sim);
+	g_autofree gchar *chip_path = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(path);
+
+	chip_path = gpiodglib_chip_dup_path(chip);
+	g_assert_cmpstr(chip_path, ==, path);
+}
+
+GPIOD_TEST_CASE(closed_chip)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	g_autoptr(GpiodglibChipInfo) info = NULL;
+	const gchar *path = g_gpiosim_chip_get_dev_path(sim);
+	g_autofree gchar *chip_path = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(path);
+
+	gpiodglib_chip_close(chip);
+
+	info = gpiodglib_chip_get_info(chip, &err);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_CHIP_CLOSED);
+
+	/* Properties still work. */
+	chip_path = gpiodglib_chip_dup_path(chip);
+	g_assert_cmpstr(chip_path, ==, path);
+}
+
+GPIOD_TEST_CASE(find_line_bad)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_false(gpiodglib_chip_get_line_offset_from_name(chip,
+								"nonexistent",
+								&offset, &err));
+	g_assert_no_error(err);
+}
+
+GPIOD_TEST_CASE(find_line_good)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "bar", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_true(gpiodglib_chip_get_line_offset_from_name(chip, "baz",
+							       &offset, &err));
+	g_assert_no_error(err);
+	g_assert_cmpuint(offset, ==, 4);
+}
+
+/* Verify that for duplicated line names, the first one is returned. */
+GPIOD_TEST_CASE(find_line_duplicate)
+{
+	static const GPIOSimLineName names[] = {
+		{ .offset = 1, .name = "foo", },
+		{ .offset = 2, .name = "baz", },
+		{ .offset = 4, .name = "baz", },
+		{ .offset = 5, .name = "xyz", },
+		{ }
+	};
+
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_true(gpiodglib_chip_get_line_offset_from_name(chip, "baz",
+							       &offset, &err));
+	g_assert_no_error(err);
+	g_assert_cmpuint(offset, ==, 2);
+}
+
+GPIOD_TEST_CASE(find_line_null_name)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_false(gpiodglib_chip_get_line_offset_from_name(chip, NULL,
+								&offset, &err));
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
diff --git a/bindings/glib/tests/tests-edge-event.c b/bindings/glib/tests/tests-edge-event.c
new file mode 100644
index 0000000..4368e0f
--- /dev/null
+++ b/bindings/glib/tests/tests-edge-event.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/edge-event"
+
+static gpointer falling_and_rising_edge_events(gpointer data)
+{
+	GPIOSimChip *sim = data;
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
+
+	return NULL;
+}
+
+typedef struct {
+	gboolean rising;
+	gboolean falling;
+	gboolean failed;
+	guint64 falling_ts;
+	guint64 rising_ts;
+	guint falling_offset;
+	guint rising_offset;
+} EdgeEventCallbackData;
+
+static void on_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+			  GpiodglibEdgeEvent *event, gpointer data)
+{
+	EdgeEventCallbackData *cb_data = data;
+
+	if (gpiodglib_edge_event_get_event_type(event) ==
+	    GPIODGLIB_EDGE_EVENT_FALLING_EDGE) {
+		cb_data->falling = TRUE;
+		cb_data->falling_ts =
+			gpiodglib_edge_event_get_timestamp_ns(event);
+		cb_data->falling_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+	} else {
+		cb_data->rising = TRUE;
+		cb_data->rising_ts =
+			gpiodglib_edge_event_get_timestamp_ns(event);
+		cb_data->rising_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+	}
+}
+
+static gboolean on_timeout(gpointer data)
+{
+	EdgeEventCallbackData *cb_data = data;
+
+	g_test_fail_printf("timeout while waiting for edge events");
+	cb_data->failed = TRUE;
+
+	return G_SOURCE_CONTINUE;
+}
+
+GPIOD_TEST_CASE(read_both_events)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GThread) thread = NULL;
+	EdgeEventCallbackData cb_data = { };
+	guint timeout_id;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH, NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL, config);
+
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_edge_event), &cb_data);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &cb_data);
+
+	thread = g_thread_new("rising-falling-edge-events",
+			      falling_and_rising_edge_events, sim);
+	g_thread_ref(thread);
+
+	while (!cb_data.failed && (!cb_data.falling || !cb_data.rising))
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+	g_thread_join(thread);
+
+	g_assert_cmpuint(cb_data.falling_ts, >, cb_data.rising_ts);
+	g_assert_cmpuint(cb_data.falling_offset, ==, offset);
+	g_assert_cmpuint(cb_data.rising_offset, ==, offset);
+}
+
+typedef struct {
+	gboolean failed;
+	gboolean first;
+	gboolean second;
+	guint first_offset;
+	guint second_offset;
+	gulong first_line_seqno;
+	gulong second_line_seqno;
+	gulong first_global_seqno;
+	gulong second_global_seqno;
+} SeqnoCallbackData;
+
+static void on_seqno_edge_event(GpiodglibLineRequest *request G_GNUC_UNUSED,
+				GpiodglibEdgeEvent *event, gpointer data)
+{
+	SeqnoCallbackData *cb_data = data;
+
+	if (!cb_data->first) {
+		cb_data->first_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+		cb_data->first_line_seqno =
+			gpiodglib_edge_event_get_line_seqno(event);
+		cb_data->first_global_seqno =
+			gpiodglib_edge_event_get_global_seqno(event);
+		cb_data->first = TRUE;
+	} else {
+		cb_data->second_offset =
+			gpiodglib_edge_event_get_line_offset(event);
+		cb_data->second_line_seqno =
+			gpiodglib_edge_event_get_line_seqno(event);
+		cb_data->second_global_seqno =
+			gpiodglib_edge_event_get_global_seqno(event);
+		cb_data->second = TRUE;
+	}
+}
+
+static gpointer rising_edge_events_on_two_offsets(gpointer data)
+{
+	GPIOSimChip *sim = data;
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
+
+	g_usleep(1000);
+
+	g_gpiosim_chip_set_pull(sim, 3, G_GPIOSIM_PULL_UP);
+
+	return NULL;
+}
+
+static gboolean on_seqno_timeout(gpointer data)
+{
+	SeqnoCallbackData *cb_data = data;
+
+	g_test_fail_printf("timeout while waiting for edge events");
+	cb_data->failed = TRUE;
+
+	return G_SOURCE_CONTINUE;
+}
+
+GPIOD_TEST_CASE(seqno)
+{
+	static const guint offset_vals[] = { 2, 3 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GThread) thread = NULL;
+	SeqnoCallbackData cb_data = { };
+	guint timeout_id;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+		g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH, NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 2,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+	g_signal_connect(request, "edge-event",
+			 G_CALLBACK(on_seqno_edge_event), &cb_data);
+
+	timeout_id = g_timeout_add_seconds(5, on_seqno_timeout, &cb_data);
+
+	thread = g_thread_new("two-rising-edge-events",
+			      rising_edge_events_on_two_offsets, sim);
+	g_thread_ref(thread);
+
+	while (!cb_data.failed && (!cb_data.first || !cb_data.second))
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+	g_thread_join(thread);
+
+	g_assert_cmpuint(cb_data.first_offset, ==, 2);
+	g_assert_cmpuint(cb_data.second_offset, ==, 3);
+	g_assert_cmpuint(cb_data.first_line_seqno, ==, 1);
+	g_assert_cmpuint(cb_data.second_line_seqno, ==, 1);
+	g_assert_cmpuint(cb_data.first_global_seqno, ==, 1);
+	g_assert_cmpuint(cb_data.second_global_seqno, ==, 2);
+}
diff --git a/bindings/glib/tests/tests-info-event.c b/bindings/glib/tests/tests-info-event.c
new file mode 100644
index 0000000..0234905
--- /dev/null
+++ b/bindings/glib/tests/tests-info-event.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/info-event"
+
+GPIOD_TEST_CASE(watching_info_events_returns_line_info)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, 3);
+	g_assert_cmpuint(gpiodglib_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(try_offset_of_out_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	info = gpiodglib_chip_watch_line_info(chip, 11, &err);
+	g_assert_null(info);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+static void on_bad_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+			      GpiodglibInfoEvent *event G_GNUC_UNUSED,
+			      gpointer data G_GNUC_UNUSED)
+{
+	g_test_fail_printf("unexpected info event received");
+}
+
+static gboolean on_expected_timeout(gpointer data)
+{
+	gboolean *done = data;
+
+	*done = TRUE;
+
+	return G_SOURCE_REMOVE;
+}
+
+GPIOD_TEST_CASE(event_timeout)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	gboolean done = FALSE;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(on_bad_info_event), NULL);
+	g_timeout_add(100, on_expected_timeout, &done);
+
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, 3);
+
+	while (!done && !g_test_failed())
+		g_main_context_iteration(NULL, TRUE);
+}
+
+typedef struct {
+	const gchar *chip_path;
+	guint offset;
+} RequestContext;
+
+typedef struct {
+	GPtrArray *events;
+	guint done;
+	gboolean failed;
+} EventContext;
+
+static gpointer request_reconfigure_release_line(gpointer data)
+{
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	RequestContext *ctx = data;
+	gboolean ret;
+
+	chip = gpiodglib_chip_new(ctx->chip_path, &err);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	offsets = gpiodglib_test_array_from_const(&ctx->offset, 1,
+						   sizeof(guint));
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
+
+	ret = gpiodglib_line_config_add_line_settings(config, offsets,
+						      settings, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(1000);
+
+	request = gpiodglib_chip_request_lines(chip, NULL, config, &err);
+	g_assert_nonnull(request);
+	g_assert_no_error(err);
+
+	g_usleep(1000);
+
+	gpiodglib_line_config_reset(config);
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	ret = gpiodglib_line_config_add_line_settings(config, offsets,
+						      settings, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, config, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(1000);
+
+	gpiodglib_line_request_release(request);
+
+	return NULL;
+}
+
+static void basic_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+			  GpiodglibInfoEvent *event, gpointer data)
+{
+	EventContext *ctx = data;
+
+	g_ptr_array_add(ctx->events, g_object_ref(event));
+	ctx->done++;
+}
+
+static gboolean on_timeout(gpointer data)
+{
+	gboolean *failed = data;
+
+	g_test_fail_printf("wait for info event timed out");
+	*failed = TRUE;
+
+	return G_SOURCE_CONTINUE;
+}
+
+GPIOD_TEST_CASE(request_reconfigure_release_events)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GPtrArray) events = NULL;
+	g_autoptr(GThread) thread = NULL;
+	const gchar *chip_path = g_gpiosim_chip_get_dev_path(sim);
+	GpiodglibInfoEvent *req_ev, *reconf_ev, *rel_ev;
+	guint64 req_ts, reconf_ts, rel_ts;
+	EventContext ev_ctx;
+	RequestContext req_ctx;
+	guint timeout_id;
+
+	events = g_ptr_array_new_full(3, g_object_unref);
+
+	chip = gpiodglib_test_new_chip_or_fail(chip_path);
+	g_signal_connect(chip, "info-event", G_CALLBACK(basic_on_info_event),
+			 &ev_ctx);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &ev_ctx.failed);
+
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, 3);
+
+	g_assert_false(gpiodglib_line_info_is_used(info));
+
+	req_ctx.chip_path = chip_path;
+	req_ctx.offset = 3;
+
+	thread = g_thread_new("request-reconfigure-release",
+			      request_reconfigure_release_line, &req_ctx);
+	g_thread_ref(thread);
+
+	ev_ctx.done = 0;
+	ev_ctx.failed = FALSE;
+	ev_ctx.events = events;
+
+	while (ev_ctx.done != 3 && !ev_ctx.failed)
+		g_main_context_iteration(NULL, TRUE);
+
+	g_source_remove(timeout_id);
+	g_thread_join(thread);
+
+	req_ev = g_ptr_array_index(events, 0);
+	reconf_ev = g_ptr_array_index(events, 1);
+	rel_ev = g_ptr_array_index(events, 2);
+
+	g_assert_cmpint(gpiodglib_info_event_get_event_type(req_ev), ==,
+			GPIODGLIB_INFO_EVENT_LINE_REQUESTED);
+	g_assert_cmpint(gpiodglib_info_event_get_event_type(reconf_ev), ==,
+			GPIODGLIB_INFO_EVENT_LINE_CONFIG_CHANGED);
+	g_assert_cmpint(gpiodglib_info_event_get_event_type(rel_ev), ==,
+			GPIODGLIB_INFO_EVENT_LINE_RELEASED);
+
+	req_ts = gpiodglib_info_event_get_timestamp_ns(req_ev);
+	reconf_ts = gpiodglib_info_event_get_timestamp_ns(reconf_ev);
+	rel_ts = gpiodglib_info_event_get_timestamp_ns(rel_ev);
+
+	g_assert_cmpuint(req_ts, <, reconf_ts);
+	g_assert_cmpuint(reconf_ts, <, rel_ts);
+}
+
+static void unwatch_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+				  GpiodglibInfoEvent *event G_GNUC_UNUSED,
+				  gpointer data)
+{
+	gboolean *got_event = data;
+
+	*got_event = TRUE;
+}
+
+GPIOD_TEST_CASE(unwatch_and_check_that_no_events_are_generated)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	gboolean got_event = FALSE;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	g_signal_connect(chip, "info-event", G_CALLBACK(unwatch_on_info_event),
+			 &got_event);
+
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	info = gpiodglib_test_chip_watch_line_info_or_fail(chip, offset);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_true(got_event);
+
+	gpiodglib_test_chip_unwatch_line_info_or_fail(chip, offset);
+
+	got_event = FALSE;
+	gpiodglib_line_request_release(request);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_false(got_event);
+}
+
+static void check_line_info_on_info_event(GpiodglibChip *chip G_GNUC_UNUSED,
+					  GpiodglibInfoEvent *event,
+					  gpointer data)
+{
+	GpiodglibLineInfo **info = data;
+
+	*info = gpiodglib_info_event_get_line_info(event);
+}
+
+GPIOD_TEST_CASE(info_event_contains_new_line_info)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) initial_info = NULL;
+	g_autoptr(GpiodglibLineInfo) event_info = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(check_line_info_on_info_event),
+			 &event_info);
+
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	config = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	initial_info = gpiodglib_test_chip_watch_line_info_or_fail(chip,
+								   offset);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_nonnull(event_info);
+}
diff --git a/bindings/glib/tests/tests-line-config.c b/bindings/glib/tests/tests-line-config.c
new file mode 100644
index 0000000..74cd440
--- /dev/null
+++ b/bindings/glib/tests/tests-line-config.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-config"
+
+GPIOD_TEST_CASE(too_many_lines)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	settings = gpiodglib_line_settings_new(NULL);
+	config = gpiodglib_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	for (i = 0; i < 65; i++)
+		g_array_append_val(offsets, i);
+
+	ret = gpiodglib_line_config_add_line_settings(config, offsets,
+						      settings, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_E2BIG);
+}
+
+GPIOD_TEST_CASE(get_line_settings)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineSettings) retrieved = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_DOWN,
+			NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+
+	retrieved = gpiodglib_test_line_config_get_line_settings_or_fail(
+								config, 2);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(retrieved), ==,
+			GPIODGLIB_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(retrieved), ==,
+			GPIODGLIB_LINE_BIAS_PULL_DOWN);
+}
+
+GPIOD_TEST_CASE(null_settings)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     NULL);
+
+	settings = gpiodglib_test_line_config_get_line_settings_or_fail(config,
+									2);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+}
+
+GPIOD_TEST_CASE(null_offsets)
+{
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	settings = gpiodglib_line_settings_new(NULL);
+	config = gpiodglib_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	ret = gpiodglib_line_config_add_line_settings(config, NULL, settings,
+						      &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(zero_offsets)
+{
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	settings = gpiodglib_line_settings_new(NULL);
+	config = gpiodglib_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	ret = gpiodglib_line_config_add_line_settings(config, offsets, settings,
+						      &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_global_output_values)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+	static const GpiodglibLineValue output_values[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiodglib_line_settings_new("direction",
+					       GPIODGLIB_LINE_DIRECTION_OUTPUT,
+					       NULL);
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+	values = gpiodglib_test_array_from_const(output_values, 4,
+						 sizeof(GpiodglibLineValue));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     settings);
+	gpiodglib_test_line_config_set_output_values_or_fail(config, values);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    config);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(handle_duplicate_offsets)
+{
+	static const guint offset_vals[] = { 0, 2, 2, 3 };
+
+	g_autoptr(GpiodglibLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) retrieved = NULL;
+
+	config = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(config, offsets,
+							     NULL);
+
+	retrieved = gpiodglib_line_config_get_configured_offsets(config);
+	g_assert_cmpuint(retrieved->len, ==, 3);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 0), ==, 0);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 1), ==, 2);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 2), ==, 3);
+}
diff --git a/bindings/glib/tests/tests-line-info.c b/bindings/glib/tests/tests-line-info.c
new file mode 100644
index 0000000..6ab3ab4
--- /dev/null
+++ b/bindings/glib/tests/tests-line-info.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-info"
+
+GPIOD_TEST_CASE(get_line_info_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_test_chip_get_line_info_or_fail(chip, 3);
+
+	g_assert_cmpuint(gpiodglib_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(get_line_info_offset_out_of_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiodglib_chip_get_line_info(chip, 8, &err);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(line_info_basic_properties)
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
+	g_autoptr(GVariant) vnames = g_gpiosim_package_line_names(names);
+	g_autoptr(GVariant) vhogs = g_gpiosim_package_hogs(hogs);
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8,
+							"line-names", vnames,
+							"hogs", vhogs,
+							NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineInfo) info4 = NULL;
+	g_autoptr(GpiodglibLineInfo) info6 = NULL;
+	g_autofree gchar *consumer = NULL;
+	g_autofree gchar *name = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+				g_gpiosim_chip_get_dev_path(sim));
+	info4 = gpiodglib_test_chip_get_line_info_or_fail(chip, 4);
+	info6 = gpiodglib_test_chip_get_line_info_or_fail(chip, 6);
+
+	g_assert_cmpuint(gpiodglib_line_info_get_offset(info4), ==, 4);
+	name = gpiodglib_line_info_dup_name(info4);
+	g_assert_cmpstr(name, ==, "baz");
+	consumer = gpiodglib_line_info_dup_consumer(info4);
+	g_assert_cmpstr(consumer, ==, "hog4");
+	g_assert_true(gpiodglib_line_info_is_used(info4));
+	g_assert_cmpint(gpiodglib_line_info_get_direction(info4), ==,
+			GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiodglib_line_info_get_edge_detection(info4), ==,
+			GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_false(gpiodglib_line_info_is_active_low(info4));
+	g_assert_cmpint(gpiodglib_line_info_get_bias(info4), ==,
+			GPIODGLIB_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(gpiodglib_line_info_get_drive(info4), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiodglib_line_info_get_event_clock(info4), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_false(gpiodglib_line_info_is_debounced(info4));
+	g_assert_cmpuint(gpiodglib_line_info_get_debounce_period_us(info4), ==,
+			 0);
+}
diff --git a/bindings/glib/tests/tests-line-request.c b/bindings/glib/tests/tests-line-request.c
new file mode 100644
index 0000000..5866282
--- /dev/null
+++ b/bindings/glib/tests/tests-line-request.c
@@ -0,0 +1,710 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiosim-glib.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-request"
+
+GPIOD_TEST_CASE(request_fails_with_no_offsets)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GError) err = NULL;
+
+	line_cfg = gpiodglib_line_config_new();
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	request = gpiodglib_chip_request_lines(chip, NULL, line_cfg, &err);
+	g_assert_null(request);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(request_fails_with_no_line_config)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	request = gpiodglib_chip_request_lines(chip, NULL, NULL, &err);
+	g_assert_null(request);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_consumer)
+{
+	static const gchar *const consumer = "foobar";
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibRequestConfig) req_cfg = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autofree gchar *cpy = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	req_cfg = gpiodglib_request_config_new("consumer", consumer, NULL);
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, req_cfg,
+							    line_cfg);
+
+	info = gpiodglib_test_chip_get_line_info_or_fail(chip, offset);
+	cpy = gpiodglib_line_info_dup_consumer(info);
+	g_assert_cmpstr(cpy, ==, consumer);
+}
+
+GPIOD_TEST_CASE(empty_consumer)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibChip) chip = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GpiodglibLineInfo) info = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	chip = gpiodglib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_chip_request_lines_or_fail(chip, NULL,
+							    line_cfg);
+
+	info = gpiodglib_test_chip_get_line_info_or_fail(chip, offset);
+	consumer = gpiodglib_line_info_dup_consumer(info);
+	g_assert_cmpstr(consumer, ==, "?");
+}
+
+GPIOD_TEST_CASE(get_requested_offsets)
+{
+	static const guint offset_vals[] = { 2, 1, 6, 4 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) retrieved = NULL;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offset_vals, 4,
+						  sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	retrieved = gpiodglib_line_request_get_requested_offsets(request);
+	g_assert_cmpuint(retrieved->len, ==, 4);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 0), ==, 2);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 1), ==, 1);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 2), ==, 6);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 3), ==, 4);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_reconfigure)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_request_release(request);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_get_value)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodglibLineValue value;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_request_release(request);
+
+	ret = gpiodglib_line_request_get_value(request, offset, &value, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = gpiodglib_line_request_get_values(request, &values, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_set_value)
+{
+	static const guint offset = 3;
+	static const GpiodglibLineValue value = GPIODGLIB_LINE_VALUE_ACTIVE;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_request_release(request);
+
+	ret = gpiodglib_line_request_set_value(request, offset, value, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+
+	g_clear_pointer(&err, g_error_free);
+
+	values = gpiodglib_test_array_from_const(&value, 1, sizeof(value));
+	ret = gpiodglib_line_request_set_values(request, values, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(reconfigure_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset_vals[2];
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT,
+			"output-value", GPIODGLIB_LINE_VALUE_ACTIVE,
+			NULL);
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	offset_vals[0] = 0;
+	offset_vals[1] = 2;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_INACTIVE);
+	offset_vals[0] = 1;
+	offset_vals[1] = 3;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+
+	gpiodglib_line_config_reset(line_cfg);
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_INACTIVE);
+	offset_vals[0] = 0;
+	offset_vals[1] = 2;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_ACTIVE);
+	offset_vals[0] = 1;
+	offset_vals[1] = 3;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(reconfigure_fails_without_config)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, NULL, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(reconfigure_with_different_offsets)
+{
+	static const guint offsets0[] = { 0, 1, 2, 3 };
+	static const guint offsets1[] = { 2, 4, 5 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(offsets0, 4, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+	g_free(g_array_steal(offsets, NULL));
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	gpiodglib_line_config_reset(line_cfg);
+
+	g_array_append_vals(offsets, offsets1, 3);
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	ret = gpiodglib_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(read_one_value)
+{
+	static const guint offset_vals[] = { 0, 2, 4 };
+	static const gint pulls[] = { 0, 1, 0 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	GpiodglibLineValue value;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 3,
+						  sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 3; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	ret = gpiodglib_line_request_get_value(request, 2, &value, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(value, ==, GPIODGLIB_LINE_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(read_all_values_null_array)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 5,
+						  sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	ret = gpiodglib_line_request_get_values(request, &values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpuint(values->len, ==, 5);
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_array_index(values, GpiodglibLineValue, i), ==,
+				pulls[i]);
+}
+
+GPIOD_TEST_CASE(read_all_values_preallocated_array)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 5,
+						  sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	values = g_array_new(FALSE, TRUE, sizeof(GpiodglibLineValue));
+	g_array_set_size(values, 5);
+
+	ret = gpiodglib_line_request_get_values(request, &values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpuint(values->len, ==, 5);
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_array_index(values, GpiodglibLineValue, i),
+				==, pulls[i]);
+}
+
+GPIOD_TEST_CASE(set_one_value)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT,
+			"output-value", GPIODGLIB_LINE_VALUE_INACTIVE,
+			NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_assert_cmpuint(g_gpiosim_chip_get_value(sim, offset), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+
+	ret = gpiodglib_line_request_set_value(request, 4,
+					       GPIODGLIB_LINE_VALUE_ACTIVE,
+					       &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+
+	g_assert_cmpuint(g_gpiosim_chip_get_value(sim, offset), ==,
+			 G_GPIOSIM_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(set_all_values)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 6 };
+	static const GpiodglibLineValue value_vals[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_ACTIVE
+	};
+	static const GPIOSimValue sim_values[] = {
+		G_GPIOSIM_VALUE_ACTIVE,
+		G_GPIOSIM_VALUE_INACTIVE,
+		G_GPIOSIM_VALUE_ACTIVE,
+		G_GPIOSIM_VALUE_ACTIVE,
+		G_GPIOSIM_VALUE_ACTIVE
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(offset_vals, 5, sizeof(guint));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	values = gpiodglib_test_array_from_const(value_vals, 5,
+						 sizeof(GpiodglibLineValue));
+
+	ret = gpiodglib_line_request_set_values(request, values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offset_vals[i]),
+				==, sim_values[i]);
+}
+
+GPIOD_TEST_CASE(get_values_invalid_arguments)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(offset));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = gpiodglib_line_request_get_values_subset(request, offsets, NULL,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = gpiodglib_line_request_get_values_subset(request, NULL, &values,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_values_invalid_arguments)
+{
+	static const guint offset = 3;
+	static const GpiodglibLineValue value_vals[] = {
+		GPIODGLIB_LINE_VALUE_ACTIVE,
+		GPIODGLIB_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GArray) vals_inval = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = gpiodglib_line_config_new();
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(offset));
+	values = gpiodglib_test_array_from_const(value_vals, 1,
+						 sizeof(GpiodglibLineValue));
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets,
+							     settings);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = gpiodglib_line_request_set_values_subset(request, offsets, NULL,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = gpiodglib_line_request_set_values_subset(request, NULL, values,
+						       &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	vals_inval = gpiodglib_test_array_from_const(value_vals, 2,
+						sizeof(GpiodglibLineValue));
+
+	ret = gpiodglib_line_request_set_values_subset(request, offsets,
+						       vals_inval, &err);
+	g_assert_false(ret);
+	g_assert_error(err, GPIODGLIB_ERROR, GPIODGLIB_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(get_chip_name)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GpiodglibLineConfig) line_cfg = NULL;
+	g_autoptr(GpiodglibLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autofree gchar *name = NULL;
+
+	line_cfg = gpiodglib_line_config_new();
+	offsets = gpiodglib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiodglib_test_line_config_add_line_settings_or_fail(line_cfg,
+							     offsets, NULL);
+
+	request = gpiodglib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	name = gpiodglib_line_request_dup_chip_name(request);
+	g_assert_cmpstr(g_gpiosim_chip_get_name(sim), ==, name);
+}
diff --git a/bindings/glib/tests/tests-line-settings.c b/bindings/glib/tests/tests-line-settings.c
new file mode 100644
index 0000000..35d2a8d
--- /dev/null
+++ b/bindings/glib/tests/tests-line-settings.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/line-settings"
+
+GPIOD_TEST_CASE(default_config)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiodglib_line_settings_get_active_low(settings));
+	g_assert_cmpint(
+		gpiodglib_line_settings_get_debounce_period_us(settings),
+		==, 0);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(set_direction)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_INPUT);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_OUTPUT);
+}
+
+GPIOD_TEST_CASE(set_edge_detection)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_BOTH);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_BOTH);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_NONE);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_FALLING);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_FALLING);
+
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_RISING);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_RISING);
+}
+
+GPIOD_TEST_CASE(set_bias)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_bias(settings,
+					 GPIODGLIB_LINE_BIAS_DISABLED);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_DISABLED);
+
+	gpiodglib_line_settings_set_bias(settings, GPIODGLIB_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_AS_IS);
+
+	gpiodglib_line_settings_set_bias(settings,
+					 GPIODGLIB_LINE_BIAS_PULL_DOWN);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_PULL_DOWN);
+
+	gpiodglib_line_settings_set_bias(settings, GPIODGLIB_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_PULL_UP);
+}
+
+GPIOD_TEST_CASE(set_drive)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_drive(settings,
+					  GPIODGLIB_LINE_DRIVE_OPEN_DRAIN);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_OPEN_DRAIN);
+
+	gpiodglib_line_settings_set_drive(settings,
+					  GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+
+	gpiodglib_line_settings_set_drive(settings,
+					  GPIODGLIB_LINE_DRIVE_OPEN_SOURCE);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_OPEN_SOURCE);
+}
+
+GPIOD_TEST_CASE(set_active_low)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_active_low(settings, TRUE);
+	g_assert_true(gpiodglib_line_settings_get_active_low(settings));
+
+	gpiodglib_line_settings_set_active_low(settings, FALSE);
+	g_assert_false(gpiodglib_line_settings_get_active_low(settings));
+}
+
+GPIOD_TEST_CASE(set_debounce_period)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_debounce_period_us(settings, 4000);
+	g_assert_cmpint(gpiodglib_line_settings_get_debounce_period_us(settings),
+			==, 4000);
+}
+
+GPIOD_TEST_CASE(set_event_clock)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_REALTIME);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_REALTIME);
+
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_HTE);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_HTE);
+}
+
+GPIOD_TEST_CASE(set_output_value)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_ACTIVE);
+
+	gpiodglib_line_settings_set_output_value(settings,
+						 GPIODGLIB_LINE_VALUE_INACTIVE);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(reset_settings)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(NULL);
+
+	gpiodglib_line_settings_set_direction(settings,
+					      GPIODGLIB_LINE_DIRECTION_INPUT);
+	gpiodglib_line_settings_set_edge_detection(settings,
+						   GPIODGLIB_LINE_EDGE_BOTH);
+	gpiodglib_line_settings_set_debounce_period_us(settings, 2000);
+	gpiodglib_line_settings_set_event_clock(settings,
+						GPIODGLIB_LINE_CLOCK_REALTIME);
+
+	gpiodglib_line_settings_reset(settings);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings),
+			==, GPIODGLIB_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiodglib_line_settings_get_active_low(settings));
+	g_assert_cmpint(
+		gpiodglib_line_settings_get_debounce_period_us(settings),
+		==, 0);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(set_props_in_constructor)
+{
+	g_autoptr(GpiodglibLineSettings) settings = NULL;
+
+	settings = gpiodglib_line_settings_new(
+			"direction", GPIODGLIB_LINE_DIRECTION_INPUT,
+			"edge-detection", GPIODGLIB_LINE_EDGE_BOTH,
+			"active-low", TRUE,
+			"debounce-period-us", (GTimeSpan)3000,
+			"bias", GPIODGLIB_LINE_BIAS_PULL_UP,
+			"event-clock", GPIODGLIB_LINE_CLOCK_REALTIME,
+			NULL);
+
+	g_assert_cmpint(gpiodglib_line_settings_get_direction(settings), ==,
+			GPIODGLIB_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiodglib_line_settings_get_edge_detection(settings), ==,
+			GPIODGLIB_LINE_EDGE_BOTH);
+	g_assert_cmpint(gpiodglib_line_settings_get_bias(settings), ==,
+			GPIODGLIB_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(gpiodglib_line_settings_get_drive(settings), ==,
+			GPIODGLIB_LINE_DRIVE_PUSH_PULL);
+	g_assert_true(gpiodglib_line_settings_get_active_low(settings));
+	g_assert_cmpint(gpiodglib_line_settings_get_debounce_period_us(settings),
+			==, 3000);
+	g_assert_cmpint(gpiodglib_line_settings_get_event_clock(settings), ==,
+			GPIODGLIB_LINE_CLOCK_REALTIME);
+	g_assert_cmpint(gpiodglib_line_settings_get_output_value(settings), ==,
+			GPIODGLIB_LINE_VALUE_INACTIVE);
+}
diff --git a/bindings/glib/tests/tests-misc.c b/bindings/glib/tests/tests-misc.c
new file mode 100644
index 0000000..a19a20e
--- /dev/null
+++ b/bindings/glib/tests/tests-misc.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+#include <gpiod-test-common.h>
+#include <gpiosim-glib.h>
+
+#define GPIOD_TEST_GROUP "glib/misc"
+
+GPIOD_TEST_CASE(is_gpiochip_bad)
+{
+	g_assert_false(gpiodglib_is_gpiochip_device("/dev/null"));
+	g_assert_false(gpiodglib_is_gpiochip_device("/dev/nonexistent"));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+
+	g_assert_true(gpiodglib_is_gpiochip_device(
+			g_gpiosim_chip_get_dev_path(sim)));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_link_bad)
+{
+	g_autofree gchar *link = NULL;
+	gint ret;
+
+	link = g_strdup_printf("/tmp/gpiod-test-link.%u", getpid());
+	ret = symlink("/dev/null", link);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiodglib_is_gpiochip_device(link));
+	ret = unlink(link);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+GPIOD_TEST_CASE(is_gpiochip_link_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autofree gchar *link = NULL;
+	gint ret;
+
+	link = g_strdup_printf("/tmp/gpiod-test-link.%u", getpid());
+	ret = symlink(g_gpiosim_chip_get_dev_path(sim), link);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(gpiodglib_is_gpiochip_device(link));
+	ret = unlink(link);
+	g_assert_cmpint(ret, ==, 0);
+}
+
+GPIOD_TEST_CASE(version_string)
+{
+	static const gchar *const pattern = "^\\d+\\.\\d+(\\.\\d+|\\-devel|\\-rc\\d+)$";
+
+	g_autoptr(GError) err = NULL;
+	g_autoptr(GRegex) regex = NULL;
+	g_autoptr(GMatchInfo) match = NULL;
+	g_autofree gchar *res = NULL;
+	const gchar *ver;
+	gboolean ret;
+
+	ver = gpiodglib_api_version();
+	g_assert_nonnull(ver);
+	gpiod_test_return_if_failed();
+
+	regex = g_regex_new(pattern, 0, 0, &err);
+	g_assert_nonnull(regex);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	ret = g_regex_match(regex, ver, 0, &match);
+	g_assert_true(ret);
+	gpiod_test_return_if_failed();
+
+	g_assert_true(g_match_info_matches(match));
+	res = g_match_info_fetch(match, 0);
+	g_assert_nonnull(res);
+	g_assert_cmpstr(res, ==, ver);
+	g_match_info_next(match, &err);
+	g_assert_no_error(err);
+	g_assert_false(g_match_info_matches(match));
+}
diff --git a/bindings/glib/tests/tests-request-config.c b/bindings/glib/tests/tests-request-config.c
new file mode 100644
index 0000000..23ebea5
--- /dev/null
+++ b/bindings/glib/tests/tests-request-config.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include <glib.h>
+#include <gpiod-glib.h>
+#include <gpiod-test.h>
+
+#include "helpers.h"
+
+#define GPIOD_TEST_GROUP "glib/request-config"
+
+GPIOD_TEST_CASE(default_config)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	config = gpiodglib_request_config_new(NULL);
+	consumer = gpiodglib_request_config_dup_consumer(config);
+
+	g_assert_null(consumer);
+	g_assert_cmpuint(gpiodglib_request_config_get_event_buffer_size(config),
+			 ==, 0);
+}
+
+GPIOD_TEST_CASE(set_consumer)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	config = gpiodglib_request_config_new(NULL);
+
+	gpiodglib_request_config_set_consumer(config, "foobar");
+	consumer = gpiodglib_request_config_dup_consumer(config);
+	g_assert_cmpstr(consumer, ==, "foobar");
+
+	gpiodglib_request_config_set_consumer(config, NULL);
+	g_free(consumer);
+	consumer = gpiodglib_request_config_dup_consumer(config);
+	g_assert_null(consumer);
+}
+
+GPIOD_TEST_CASE(set_event_buffer_size)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+
+	config = gpiodglib_request_config_new(NULL);
+
+	gpiodglib_request_config_set_event_buffer_size(config, 128);
+	g_assert_cmpuint(gpiodglib_request_config_get_event_buffer_size(config),
+			 ==, 128);
+}
+
+GPIOD_TEST_CASE(set_properties_in_constructor)
+{
+	g_autoptr(GpiodglibRequestConfig) config = NULL;
+	g_autofree gchar *consumer = NULL;
+
+	config = gpiodglib_request_config_new("consumer", "foobar",
+					    "event-buffer-size", 64, NULL);
+	consumer = gpiodglib_request_config_dup_consumer(config);
+	g_assert_cmpstr(consumer, ==, "foobar");
+	g_assert_cmpuint(gpiodglib_request_config_get_event_buffer_size(config),
+			 ==, 64);
+}

-- 
2.43.0


