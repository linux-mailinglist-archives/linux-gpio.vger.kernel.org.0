Return-Path: <linux-gpio+bounces-7793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808791C1BE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDFC285828
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22AD1C0DEE;
	Fri, 28 Jun 2024 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="doOY8631"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A571C006E
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586436; cv=none; b=uaNObfq5jL6KTdCpTDfYG5X9tJ1DhkK3jfib6R0ybanvVthPgA7lb0yj9xs4uKFwjlInO0hIri0TzRsIJ3C71Yra7hJdjmp33oEk/w+o/LRTim7F4ySaIwQ9f4s0JuSvx0u/Ao86j3SEg1mUVVzfnUJyPTKAAEuqNWsAYTZGu8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586436; c=relaxed/simple;
	bh=GuhTB/3KTzCmSyJpKU3o2obXm/jl63IYW6Msbognq8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfaaLtT9IFEQeZm7hlvEqjJVYuaitM593Vcg7QWdvCwVeOEr7/cdEhl9BY91YZPOk2wcSYSO1gLxLI5S1b+UG3VCQl8ImDNJ6HdVj2RnsjCkSOXgoAYERKyKvzELzqMRxJznSDLzUs7OKbmzTB3yFcZPWMmh8BguvVz4rHTpud4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=doOY8631; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-424acf3226fso6031265e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586431; x=1720191231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Dv7BoiOnC/L/YFNzBSd09xy/6EmCsqspK46sKjijCI=;
        b=doOY8631SZwy5OxRV8eiAZl4XGomrYd3Nh6m8pmPy2dRGDehMC6YlOgz9eI5gsP2rH
         vUzqiLvSZv7lX589pwJtzjRr1krxqy61ZWCNWvruAs5sqFhjOI1XCqQ8rtTa8ICiCU6/
         BBIBZW025k51aIFyE5PbgNaB2+JR3EEyC2Ta+FdK9KxgovOeUe9q9pj7wcx5csztWyns
         7iF+9cLVA5FsB9Lbd6t4/N+5KPx4J/2EJKbylKmf2pJZIrSpeMKKowMA8SALWI6Rcke5
         Soz0wpLM2x2Bm2ulRquQRgluqNWuylMgmXz2x1IPeEjryRKMy4qCJRbrpPBMeY/4gk8Q
         pE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586431; x=1720191231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Dv7BoiOnC/L/YFNzBSd09xy/6EmCsqspK46sKjijCI=;
        b=Y96Xs007b4ckyyot+R0PKEUb29L3eurOfRoMuwLlfcRqBhN063GdpnZvLGuUd2uh3N
         OyBS2PGw8IkQKBEibOhMwdgYXTQ4/pvJ8yGmX+JYHnDESyzLma7iAvWgBiGYBiReiWxf
         17pnTE0+xRNiW78IhXeHmWwZUKT64HhpPLQBdeOMKz/HHk8Lp3ARqwjleyXGFrWG8omk
         zjBi1qnMaFzUC7qTeOFA6rtM4Y2GYwnxUqykpzQllZ5mK2uN6sIxrVCfirPs7tqIJ5Lw
         GDdHzPxzgCKlHmMrfFaTRle/p8fSkP2m/gtVXfOlPH97sgZvEfXjQFYjuYaaEnL6am5Q
         pPVg==
X-Forwarded-Encrypted: i=1; AJvYcCWIof8wEQYdfyTlQ1wCBDJvhWAN/rXW0W2iYzx4EXD16o/no2FBpKIcYlrT5QJXocsdCn7kiB32pI5L36WEr2y1RXiS5q0sKI8Fzg==
X-Gm-Message-State: AOJu0Yw2iCXLOPXRwPcVGR+UJFkAJ8StuLsMvcVZKJiPrMSA5c0HnxX2
	vuDl9nLZmSDKprf8FkECGVAmLUeITh266Py8yPGWoEcO9JIHCYGnUWrNcrcdvAg=
X-Google-Smtp-Source: AGHT+IGeQPFz2a5rxOVQjW3H/48Xr5fk4YEkXam1JxCo9LgOl94H2xw0WzH6GdGdYxMVrKxEVSbUTQ==
X-Received: by 2002:a05:6000:1847:b0:366:ec2c:8648 with SMTP id ffacd0b85a97d-366ec2c86camr12673518f8f.43.1719586430587;
        Fri, 28 Jun 2024 07:53:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:23 +0200
Subject: [PATCH libgpiod v2 07/18] bindings: glib: add tests
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-7-e42336efe2d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=77510;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7KjS9OCtohvbg1fQ/qG4jZL13JQM0DyG6puHfOGrzRA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5xaVtH3xOFGjBo/OdrsO1MrVEziC8IjsH1f
 t5AUMbntr6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcQAKCRARpy6gFHHX
 cmhrEACTT7kwUw4qCnJ9xtdGxl2OBYzZ+ELx8z2NWU9OruLfEFJpkD910yKkCiTadJ2p/xc5X5/
 yXqywUbLfKakHyR5mEkh2q0vAU6IXjVQMw9wgYLlHSBrX4Ddqo2/mnyXfBkU1gcx+lyTJLnW2Sx
 k9aqsgVPRpfAU6q1TWjX4k9HV4j45nz7vlk4uu1ULoxrppK9bAQRBlGa/gojvapG5dGC4iJsc7E
 maVCfSHyM953A7X3Ms6XrYpBvCd6i755KUtZVvYAwI9KHr3xKOc6Z4hCJZVoUpx6H/EjALqpv3E
 H08YmGJizLwATmJwXPYmTuH/gFuHXJy4yhbJy6gwL7KsA8WOBDRo0hzFsu+gJpop7iuuFJqewNa
 SaiJ/NjqGCrmY4JbFd6Kw6tzoVs+wRAO0x0y7x9mKXN0tpdCoXF3IKf7N+Q90nFya1jiNfmgq51
 Cxt6O4MU8CZQSUGegwTyPf+YE52O5/Rc7OD4FTOaw5w4KazqB4ZJvDeN7Rb3qR2r9rYeQ8pUpv6
 xGbqaJ79JtX+7opJc9OpCO9wJBfe8ZhhLglW2engMewluTD8Rb0KXM+AtAtM2idrYUf27En8zSS
 vQ+9MuCp7UkKICYbQs+eV171yWeZn5/lh+jELQBdyJAfbnfv5mVhQecls370POFp/ZpDkH1Nc4R
 qqKO0nSDMtC2Egg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a comprehensive set of test-cases for GLib bindings to libgpiod
reusing the core test framework based around the gpio-sim module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/glib/tests/helpers.c              |  12 +
 bindings/glib/tests/helpers.h              | 139 ++++++
 bindings/glib/tests/tests-chip-info.c      |  55 +++
 bindings/glib/tests/tests-chip.c           | 183 ++++++++
 bindings/glib/tests/tests-edge-event.c     | 226 +++++++++
 bindings/glib/tests/tests-info-event.c     | 321 +++++++++++++
 bindings/glib/tests/tests-line-config.c    | 186 ++++++++
 bindings/glib/tests/tests-line-info.c      |  98 ++++
 bindings/glib/tests/tests-line-request.c   | 704 +++++++++++++++++++++++++++++
 bindings/glib/tests/tests-line-settings.c  | 252 +++++++++++
 bindings/glib/tests/tests-misc.c           |  88 ++++
 bindings/glib/tests/tests-request-config.c |  58 +++
 12 files changed, 2322 insertions(+)

diff --git a/bindings/glib/tests/helpers.c b/bindings/glib/tests/helpers.c
new file mode 100644
index 0000000..d77f2b8
--- /dev/null
+++ b/bindings/glib/tests/helpers.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+#include "helpers.h"
+
+GArray *gpiod_glib_test_array_from_const(gconstpointer data, gsize len,
+					 gsize elem_size)
+{
+	GArray *arr = g_array_new(FALSE, TRUE, elem_size);
+
+	return g_array_append_vals(arr, data, len);
+}
diff --git a/bindings/glib/tests/helpers.h b/bindings/glib/tests/helpers.h
new file mode 100644
index 0000000..2eda6a7
--- /dev/null
+++ b/bindings/glib/tests/helpers.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIOD_GLIB_TEST_HELPERS_H__
+#define __GPIOD_GLIB_TEST_HELPERS_H__
+
+#include <glib.h>
+#include <gpiod-test-common.h>
+
+#define gpiod_glib_test_new_chip_or_fail(_path) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GPIODChip *_chip = g_gpiod_chip_new(_path, &_err); \
+		g_assert_nonnull(_chip); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_chip; \
+	})
+
+#define gpiod_glib_test_chip_get_info_or_fail(_chip) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GPIODChipInfo *_info = g_gpiod_chip_get_info(_chip, &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiod_glib_test_chip_get_line_info_or_fail(_chip, _offset) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GPIODLineInfo *_info = g_gpiod_chip_get_line_info(_chip, \
+								  _offset, \
+								  &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiod_glib_test_chip_watch_line_info_or_fail(_chip, _offset) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GPIODLineInfo *_info = g_gpiod_chip_watch_line_info(_chip, \
+								    _offset, \
+								    &_err); \
+		g_assert_nonnull(_info); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_info; \
+	})
+
+#define gpiod_glib_test_chip_unwatch_line_info_or_fail(_chip, _offset) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean ret = \
+			g_gpiod_chip_unwatch_line_info(_chip, _offset, &_err); \
+		g_assert_true(ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiod_glib_test_line_config_add_line_settings_or_fail(_config, \
+							      _offsets, \
+							      _settings) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret = \
+			g_gpiod_line_config_add_line_settings(_config, \
+							      _offsets,\
+							      _settings, \
+							      &_err); \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiod_glib_test_line_config_get_line_settings_or_fail(_config, \
+							      _offset) \
+	({ \
+		GPIODLineSettings *_settings = \
+			g_gpiod_line_config_get_line_settings(_config, \
+							      _offset); \
+		g_assert_nonnull(_settings); \
+		gpiod_test_return_if_failed(); \
+		_settings; \
+	})
+
+#define gpiod_glib_test_line_config_set_output_values_or_fail(_config, \
+							      _values) \
+	do { \
+		g_autoptr(GError) _err = NULL; \
+		gboolean _ret = \
+			g_gpiod_line_config_set_output_values(_config, \
+							      _values, \
+							      &_err); \
+		g_assert_true(_ret); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+#define gpiod_glib_test_chip_request_lines_or_fail(_chip, _req_cfg, _line_cfg) \
+	({ \
+		g_autoptr(GError) _err = NULL; \
+		GPIODLineRequest *_req = \
+			g_gpiod_chip_request_lines(_chip, _req_cfg, \
+						   _line_cfg, &_err); \
+		g_assert_nonnull(_req); \
+		g_assert_no_error(_err); \
+		gpiod_test_return_if_failed(); \
+		_req; \
+	})
+
+#define gpiod_glib_test_request_lines_or_fail(_path, _req_cfg, _line_cfg) \
+	({ \
+		g_autoptr(GPIODChip) _chip = \
+			gpiod_glib_test_new_chip_or_fail(_path); \
+		GPIODLineRequest *_req = \
+			gpiod_glib_test_chip_request_lines_or_fail(_chip, \
+								   _req_cfg, \
+								   _line_cfg); \
+		_req; \
+	})
+
+#define gpiod_glib_test_check_error_or_fail(_err, _domain, _code) \
+	do { \
+		g_assert_nonnull(_err); \
+		gpiod_test_return_if_failed(); \
+		g_assert_cmpint(_domain, ==, (_err)->domain); \
+		g_assert_cmpint(_code, ==, (_err)->code); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
+GArray *gpiod_glib_test_array_from_const(const gconstpointer data, gsize len,
+					 gsize elem_size);
+
+#endif /* __GPIOD_GLIB_TEST_HELPERS_H__ */
+
diff --git a/bindings/glib/tests/tests-chip-info.c b/bindings/glib/tests/tests-chip-info.c
new file mode 100644
index 0000000..7741ccb
--- /dev/null
+++ b/bindings/glib/tests/tests-chip-info.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODChipInfo) info = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_glib_test_chip_get_info_or_fail(chip);
+
+	g_assert_cmpstr(g_gpiod_chip_info_get_name(info), ==,
+			g_gpiosim_chip_get_name(sim));
+}
+
+GPIOD_TEST_CASE(get_label)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("label", "foobar",
+							NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODChipInfo) info = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_glib_test_chip_get_info_or_fail(chip);
+
+	g_assert_cmpstr(g_gpiod_chip_info_get_label(info), ==, "foobar");
+}
+
+GPIOD_TEST_CASE(get_num_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODChipInfo) info = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_glib_test_chip_get_info_or_fail(chip);
+
+	g_assert_cmpuint(g_gpiod_chip_info_get_num_lines(info), ==, 16);
+}
diff --git a/bindings/glib/tests/tests-chip.c b/bindings/glib/tests/tests-chip.c
new file mode 100644
index 0000000..b7c5aff
--- /dev/null
+++ b/bindings/glib/tests/tests-chip.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = g_gpiod_chip_new(g_gpiosim_chip_get_dev_path(sim), &err);
+	g_assert_nonnull(chip);
+	g_assert_null(err);
+}
+
+GPIOD_TEST_CASE(open_chip_nonexistent)
+{
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = g_gpiod_chip_new("/dev/nonexistent", &err);
+	g_assert_null(chip);
+	gpiod_glib_test_check_error_or_fail(err, G_GPIOD_ERROR,
+					    G_GPIOD_ERR_NOENT);
+}
+
+GPIOD_TEST_CASE(open_chip_not_a_character_device)
+{
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = g_gpiod_chip_new("/tmp", &err);
+	g_assert_null(chip);
+	gpiod_glib_test_check_error_or_fail(err, G_GPIOD_ERROR,
+					    G_GPIOD_ERR_NOTTY);
+}
+
+GPIOD_TEST_CASE(open_chip_not_a_gpio_device)
+{
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = g_gpiod_chip_new("/dev/null", &err);
+	g_assert_null(chip);
+	gpiod_glib_test_check_error_or_fail(err, G_GPIOD_ERROR,
+					    G_GPIOD_ERR_NODEV);
+}
+
+GPIOD_TEST_CASE(get_chip_path)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	const gchar *path = g_gpiosim_chip_get_dev_path(sim);
+
+	chip = gpiod_glib_test_new_chip_or_fail(path);
+
+	g_assert_cmpstr(g_gpiod_chip_get_path(chip), ==, path);
+}
+
+GPIOD_TEST_CASE(closed_chip)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	g_autoptr(GPIODChipInfo) info = NULL;
+	const gchar *path = g_gpiosim_chip_get_dev_path(sim);
+
+	chip = gpiod_glib_test_new_chip_or_fail(path);
+
+	g_gpiod_chip_close(chip);
+
+	info = g_gpiod_chip_get_info(chip, &err);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_CHIP_CLOSED);
+
+	/* Properties still work. */
+	g_assert_cmpstr(g_gpiod_chip_get_path(chip), ==, path);
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_false(g_gpiod_chip_get_line_offset_from_name(chip,
+							      "nonexistent",
+							      &offset, &err));
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_true(g_gpiod_chip_get_line_offset_from_name(chip, "baz",
+							     &offset, &err));
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_true(g_gpiod_chip_get_line_offset_from_name(chip, "baz",
+							     &offset, &err));
+	g_assert_no_error(err);
+	g_assert_cmpuint(offset, ==, 2);
+}
+
+GPIOD_TEST_CASE(find_line_null_name)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_assert_false(g_gpiod_chip_get_line_offset_from_name(chip, NULL,
+							      &offset, &err));
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
diff --git a/bindings/glib/tests/tests-edge-event.c b/bindings/glib/tests/tests-edge-event.c
new file mode 100644
index 0000000..fbebcd3
--- /dev/null
+++ b/bindings/glib/tests/tests-edge-event.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+static void on_edge_event(GPIODLineRequest *request G_GNUC_UNUSED,
+			  GPIODEdgeEvent *event, gpointer data)
+{
+	EdgeEventCallbackData *cb_data = data;
+
+	if (g_gpiod_edge_event_get_event_type(event) ==
+	    G_GPIOD_EDGE_EVENT_FALLING_EDGE) {
+		cb_data->falling = TRUE;
+		cb_data->falling_ts =
+			g_gpiod_edge_event_get_timestamp_ns(event);
+		cb_data->falling_offset =
+			g_gpiod_edge_event_get_line_offset(event);
+	} else {
+		cb_data->rising = TRUE;
+		cb_data->rising_ts =
+			g_gpiod_edge_event_get_timestamp_ns(event);
+		cb_data->rising_offset =
+			g_gpiod_edge_event_get_line_offset(event);
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GThread) thread = NULL;
+	EdgeEventCallbackData cb_data = { };
+	guint timeout_id;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			"edge-detection", G_GPIOD_LINE_EDGE_BOTH, NULL);
+	config = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      settings);
+
+	request = gpiod_glib_test_chip_request_lines_or_fail(chip, NULL,
+							     config);
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
+static void on_seqno_edge_event(GPIODLineRequest *request G_GNUC_UNUSED,
+				GPIODEdgeEvent *event, gpointer data)
+{
+	SeqnoCallbackData *cb_data = data;
+
+	if (!cb_data->first) {
+		cb_data->first_offset =
+			g_gpiod_edge_event_get_line_offset(event);
+		cb_data->first_line_seqno =
+			g_gpiod_edge_event_get_line_seqno(event);
+		cb_data->first_global_seqno =
+			g_gpiod_edge_event_get_global_seqno(event);
+		cb_data->first = TRUE;
+	} else {
+		cb_data->second_offset =
+			g_gpiod_edge_event_get_line_offset(event);
+		cb_data->second_line_seqno =
+			g_gpiod_edge_event_get_line_seqno(event);
+		cb_data->second_global_seqno =
+			g_gpiod_edge_event_get_global_seqno(event);
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GThread) thread = NULL;
+	SeqnoCallbackData cb_data = { };
+	guint timeout_id;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+		g_gpiosim_chip_get_dev_path(sim));
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			"edge-detection", G_GPIOD_LINE_EDGE_BOTH, NULL);
+	config = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 2,
+						   sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      settings);
+
+	request = gpiod_glib_test_chip_request_lines_or_fail(chip, NULL,
+							     config);
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
index 0000000..1884e0b
--- /dev/null
+++ b/bindings/glib/tests/tests-info-event.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	info = gpiod_glib_test_chip_watch_line_info_or_fail(chip, 3);
+	g_assert_cmpuint(g_gpiod_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(try_offset_of_out_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	info = g_gpiod_chip_watch_line_info(chip, 11, &err);
+	g_assert_null(info);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+static void on_bad_info_event(GPIODChip *chip G_GNUC_UNUSED,
+			      GPIODInfoEvent *event G_GNUC_UNUSED,
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+	gboolean done = FALSE;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(on_bad_info_event), NULL);
+	g_timeout_add(100, on_expected_timeout, &done);
+
+	info = gpiod_glib_test_chip_watch_line_info_or_fail(chip, 3);
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
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GError) err = NULL;
+	RequestContext *ctx = data;
+	gboolean ret;
+
+	chip = g_gpiod_chip_new(ctx->chip_path, &err);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	offsets = gpiod_glib_test_array_from_const(&ctx->offset, 1,
+						   sizeof(guint));
+	config = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(NULL);
+
+	ret = g_gpiod_line_config_add_line_settings(config, offsets,
+						    settings, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(1000);
+
+	request = g_gpiod_chip_request_lines(chip, NULL, config, &err);
+	g_assert_nonnull(request);
+	g_assert_no_error(err);
+
+	g_usleep(1000);
+
+	g_gpiod_line_config_reset(config);
+	g_gpiod_line_settings_set_direction(settings,
+					    G_GPIOD_LINE_DIRECTION_OUTPUT);
+	ret = g_gpiod_line_config_add_line_settings(config, offsets,
+						    settings, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	ret = g_gpiod_line_request_reconfigure_lines(request, config, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	if (g_test_failed())
+		return NULL;
+
+	g_usleep(1000);
+
+	g_gpiod_line_request_release(request);
+
+	return NULL;
+}
+
+static void basic_on_info_event(GPIODChip *chip G_GNUC_UNUSED,
+			  GPIODInfoEvent *event, gpointer data)
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+	g_autoptr(GPtrArray) events = NULL;
+	g_autoptr(GThread) thread = NULL;
+	const gchar *chip_path = g_gpiosim_chip_get_dev_path(sim);
+	GPIODInfoEvent *req_ev, *reconf_ev, *rel_ev;
+	guint64 req_ts, reconf_ts, rel_ts;
+	EventContext ev_ctx;
+	RequestContext req_ctx;
+	guint timeout_id;
+
+	events = g_ptr_array_new_full(3, g_object_unref);
+
+	chip = gpiod_glib_test_new_chip_or_fail(chip_path);
+	g_signal_connect(chip, "info-event", G_CALLBACK(basic_on_info_event),
+			 &ev_ctx);
+	timeout_id = g_timeout_add_seconds(5, on_timeout, &ev_ctx.failed);
+
+	info = gpiod_glib_test_chip_watch_line_info_or_fail(chip, 3);
+
+	g_assert_false(g_gpiod_line_info_is_used(info));
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
+	g_assert_cmpint(g_gpiod_info_event_get_event_type(req_ev), ==,
+			G_GPIOD_INFO_EVENT_LINE_REQUESTED);
+	g_assert_cmpint(g_gpiod_info_event_get_event_type(reconf_ev), ==,
+			G_GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED);
+	g_assert_cmpint(g_gpiod_info_event_get_event_type(rel_ev), ==,
+			G_GPIOD_INFO_EVENT_LINE_RELEASED);
+
+	req_ts = g_gpiod_info_event_get_timestamp_ns(req_ev);
+	reconf_ts = g_gpiod_info_event_get_timestamp_ns(reconf_ev);
+	rel_ts = g_gpiod_info_event_get_timestamp_ns(rel_ev);
+
+	g_assert_cmpuint(req_ts, <, reconf_ts);
+	g_assert_cmpuint(reconf_ts, <, rel_ts);
+}
+
+static void unwatch_on_info_event(GPIODChip *chip G_GNUC_UNUSED,
+				  GPIODInfoEvent *event G_GNUC_UNUSED,
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	gboolean got_event = FALSE;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	g_signal_connect(chip, "info-event", G_CALLBACK(unwatch_on_info_event),
+			 &got_event);
+
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+	config = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(NULL);
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      settings);
+
+	info = gpiod_glib_test_chip_watch_line_info_or_fail(chip, offset);
+
+	request = gpiod_glib_test_chip_request_lines_or_fail(chip, NULL,
+							     config);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_true(got_event);
+
+	gpiod_glib_test_chip_unwatch_line_info_or_fail(chip, offset);
+
+	got_event = FALSE;
+	g_gpiod_line_request_release(request);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_false(got_event);
+}
+
+static void check_line_info_on_info_event(GPIODChip *chip G_GNUC_UNUSED,
+					  GPIODInfoEvent *event, gpointer data)
+{
+	GPIODLineInfo **info = data;
+
+	*info = g_gpiod_info_event_get_line_info(event);
+}
+
+GPIOD_TEST_CASE(info_event_contains_new_line_info)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) initial_info = NULL;
+	g_autoptr(GPIODLineInfo) event_info = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	g_signal_connect(chip, "info-event",
+			 G_CALLBACK(check_line_info_on_info_event),
+			 &event_info);
+
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+	config = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(NULL);
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      settings);
+
+	initial_info = gpiod_glib_test_chip_watch_line_info_or_fail(chip,
+								    offset);
+
+	request = gpiod_glib_test_chip_request_lines_or_fail(chip, NULL,
+							     config);
+
+	g_main_context_iteration(NULL, TRUE);
+
+	g_assert_nonnull(event_info);
+}
diff --git a/bindings/glib/tests/tests-line-config.c b/bindings/glib/tests/tests-line-config.c
new file mode 100644
index 0000000..cbdf589
--- /dev/null
+++ b/bindings/glib/tests/tests-line-config.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	settings = g_gpiod_line_settings_new(NULL);
+	config = g_gpiod_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	for (i = 0; i < 65; i++)
+		g_array_append_val(offsets, i);
+
+	ret = g_gpiod_line_config_add_line_settings(config, offsets,
+						    settings, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_E2BIG);
+}
+
+GPIOD_TEST_CASE(get_line_settings)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineSettings) retrieved = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			"bias", G_GPIOD_LINE_BIAS_PULL_DOWN,
+			NULL);
+	config = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 4,
+						   sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      settings);
+
+	retrieved = gpiod_glib_test_line_config_get_line_settings_or_fail(
+								config, 2);
+	g_assert_cmpint(g_gpiod_line_settings_get_direction(retrieved), ==,
+			G_GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(retrieved), ==,
+			G_GPIOD_LINE_BIAS_PULL_DOWN);
+}
+
+GPIOD_TEST_CASE(null_settings)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	config = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 4,
+						   sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      NULL);
+
+	settings = gpiod_glib_test_line_config_get_line_settings_or_fail(config,
+									 2);
+
+	g_assert_cmpint(g_gpiod_line_settings_get_drive(settings), ==,
+			G_GPIOD_LINE_DIRECTION_AS_IS);
+}
+
+GPIOD_TEST_CASE(null_offsets)
+{
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	settings = g_gpiod_line_settings_new(NULL);
+	config = g_gpiod_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	ret = g_gpiod_line_config_add_line_settings(config, NULL, settings,
+						    &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(zero_offsets)
+{
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	settings = g_gpiod_line_settings_new(NULL);
+	config = g_gpiod_line_config_new();
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+
+	ret = g_gpiod_line_config_add_line_settings(config, offsets, settings,
+						    &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_global_output_values)
+{
+	static const guint offset_vals[] = { 0, 1, 2, 3 };
+	static const GPIODLineValue output_values[] = {
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_INACTIVE,
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT, NULL);
+	config = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 4,
+						   sizeof(guint));
+	values = gpiod_glib_test_array_from_const(output_values, 4,
+						  sizeof(GPIODLineValue));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      settings);
+	gpiod_glib_test_line_config_set_output_values_or_fail(config, values);
+
+	request = gpiod_glib_test_chip_request_lines_or_fail(chip, NULL,
+							     config);
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
+	g_autoptr(GPIODLineConfig) config = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) retrieved = NULL;
+
+	config = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 4,
+						   sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(config, offsets,
+							      NULL);
+
+	retrieved = g_gpiod_line_config_get_configured_offsets(config);
+	g_assert_cmpuint(retrieved->len, ==, 3);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 0), ==, 0);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 1), ==, 2);
+	g_assert_cmpuint(g_array_index(retrieved, guint, 2), ==, 3);
+}
diff --git a/bindings/glib/tests/tests-line-info.c b/bindings/glib/tests/tests-line-info.c
new file mode 100644
index 0000000..c132c06
--- /dev/null
+++ b/bindings/glib/tests/tests-line-info.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = gpiod_glib_test_chip_get_line_info_or_fail(chip, 3);
+
+	g_assert_cmpuint(g_gpiod_line_info_get_offset(info), ==, 3);
+}
+
+GPIOD_TEST_CASE(get_line_info_offset_out_of_range)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	info = g_gpiod_chip_get_line_info(chip, 8, &err);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineInfo) info4 = NULL;
+	g_autoptr(GPIODLineInfo) info6 = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+				g_gpiosim_chip_get_dev_path(sim));
+	info4 = gpiod_glib_test_chip_get_line_info_or_fail(chip, 4);
+	info6 = gpiod_glib_test_chip_get_line_info_or_fail(chip, 6);
+
+	g_assert_cmpuint(g_gpiod_line_info_get_offset(info4), ==, 4);
+	g_assert_cmpstr(g_gpiod_line_info_get_name(info4), ==, "baz");
+	g_assert_cmpstr(g_gpiod_line_info_get_consumer(info4), ==, "hog4");
+	g_assert_true(g_gpiod_line_info_is_used(info4));
+	g_assert_cmpint(g_gpiod_line_info_get_direction(info4), ==,
+			G_GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(g_gpiod_line_info_get_edge_detection(info4), ==,
+			G_GPIOD_LINE_EDGE_NONE);
+	g_assert_false(g_gpiod_line_info_is_active_low(info4));
+	g_assert_cmpint(g_gpiod_line_info_get_bias(info4), ==,
+			G_GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(g_gpiod_line_info_get_drive(info4), ==,
+			G_GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(g_gpiod_line_info_get_event_clock(info4), ==,
+			G_GPIOD_LINE_CLOCK_MONOTONIC);
+	g_assert_false(g_gpiod_line_info_is_debounced(info4));
+	g_assert_cmpuint(g_gpiod_line_info_get_debounce_period_us(info4), ==,
+			 0);
+}
diff --git a/bindings/glib/tests/tests-line-request.c b/bindings/glib/tests/tests-line-request.c
new file mode 100644
index 0000000..ae13c38
--- /dev/null
+++ b/bindings/glib/tests/tests-line-request.c
@@ -0,0 +1,704 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GError) err = NULL;
+
+	line_cfg = g_gpiod_line_config_new();
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	request = g_gpiod_chip_request_lines(chip, NULL, line_cfg, &err);
+	g_assert_null(request);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(request_fails_with_no_line_config)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GError) err = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	request = g_gpiod_chip_request_lines(chip, NULL, NULL, &err);
+	g_assert_null(request);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_consumer)
+{
+	static const gchar *const consumer = "foobar";
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODRequestConfig) req_cfg = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	req_cfg = g_gpiod_request_config_new("consumer", consumer, NULL);
+	line_cfg = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_chip_request_lines_or_fail(chip, req_cfg,
+							     line_cfg);
+
+	info = gpiod_glib_test_chip_get_line_info_or_fail(chip, offset);
+	g_assert_cmpstr(g_gpiod_line_info_get_consumer(info), ==, consumer);
+}
+
+GPIOD_TEST_CASE(empty_consumer)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODChip) chip = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GPIODLineInfo) info = NULL;
+
+	chip = gpiod_glib_test_new_chip_or_fail(
+			g_gpiosim_chip_get_dev_path(sim));
+
+	line_cfg = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_chip_request_lines_or_fail(chip, NULL,
+							     line_cfg);
+
+	info = gpiod_glib_test_chip_get_line_info_or_fail(chip, offset);
+	g_assert_cmpstr(g_gpiod_line_info_get_consumer(info), ==, "?");
+}
+
+GPIOD_TEST_CASE(get_requested_offsets)
+{
+	static const guint offset_vals[] = { 2, 1, 6, 4 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) retrieved = NULL;
+
+	line_cfg = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 4,
+						   sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	retrieved = g_gpiod_line_request_get_requested_offsets(request);
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
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_gpiod_line_request_release(request);
+
+	ret = g_gpiod_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_get_value)
+{
+	static const guint offset = 3;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	GPIODLineValue value;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_gpiod_line_request_release(request);
+
+	ret = g_gpiod_line_request_get_value(request, offset, &value, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_REQUEST_RELEASED);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = g_gpiod_line_request_get_values(request, &values, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(released_request_cannot_be_used_set_value)
+{
+	static const guint offset = 3;
+	static const GPIODLineValue value = G_GPIOD_LINE_VALUE_ACTIVE;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_gpiod_line_request_release(request);
+
+	ret = g_gpiod_line_request_set_value(request, offset, value, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_REQUEST_RELEASED);
+
+	g_clear_pointer(&err, g_error_free);
+
+	values = gpiod_glib_test_array_from_const(&value, 1, sizeof(value));
+	ret = g_gpiod_line_request_set_values(request, values, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_REQUEST_RELEASED);
+}
+
+GPIOD_TEST_CASE(reconfigure_lines)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	guint offset_vals[2];
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT,
+			"output-value", G_GPIOD_LINE_VALUE_ACTIVE,
+			NULL);
+
+	offsets = g_array_new(FALSE, TRUE, sizeof(guint));
+	offset_vals[0] = 0;
+	offset_vals[1] = 2;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	g_gpiod_line_settings_set_output_value(settings,
+					       G_GPIOD_LINE_VALUE_INACTIVE);
+	offset_vals[0] = 1;
+	offset_vals[1] = 3;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	request = gpiod_glib_test_request_lines_or_fail(
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
+	g_gpiod_line_config_reset(line_cfg);
+
+	g_gpiod_line_settings_set_output_value(settings,
+					       G_GPIOD_LINE_VALUE_INACTIVE);
+	offset_vals[0] = 0;
+	offset_vals[1] = 2;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+	g_free(g_array_steal(offsets, NULL));
+
+	g_gpiod_line_settings_set_output_value(settings,
+					       G_GPIOD_LINE_VALUE_ACTIVE);
+	offset_vals[0] = 1;
+	offset_vals[1] = 3;
+	g_array_append_vals(offsets, offset_vals, 2);
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	ret = g_gpiod_line_request_reconfigure_lines(request, line_cfg, &err);
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
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = g_gpiod_line_request_reconfigure_lines(request, NULL, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(reconfigure_with_different_offsets)
+{
+	static const guint offsets0[] = { 0, 1, 2, 3 };
+	static const guint offsets1[] = { 2, 4, 5 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(offsets0, 4, sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+	g_free(g_array_steal(offsets, NULL));
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_gpiod_line_config_reset(line_cfg);
+
+	g_array_append_vals(offsets, offsets1, 3);
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	ret = g_gpiod_line_request_reconfigure_lines(request, line_cfg, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(read_one_value)
+{
+	static const guint offset_vals[] = { 0, 2, 4 };
+	static const gint pulls[] = { 0, 1, 0 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	GPIODLineValue value;
+	gboolean ret;
+	guint i;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 3,
+						   sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 3; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	ret = g_gpiod_line_request_get_value(request, 2, &value, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+	g_assert_cmpint(value, ==, G_GPIOD_LINE_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(read_all_values_null_array)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 5,
+						   sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	ret = g_gpiod_line_request_get_values(request, &values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpuint(values->len, ==, 5);
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_array_index(values, GPIODLineValue, i), ==,
+				pulls[i]);
+}
+
+GPIOD_TEST_CASE(read_all_values_preallocated_array)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 7 };
+	static const gint pulls[] = { 0, 1, 0, 1, 1 };
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 5,
+						   sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	for (i = 0; i < 5; i++)
+		g_gpiosim_chip_set_pull(sim, offset_vals[i],
+					pulls[i] ? G_GPIOSIM_PULL_UP :
+						   G_GPIOSIM_PULL_DOWN);
+
+	values = g_array_new(FALSE, TRUE, sizeof(GPIODLineValue));
+	g_array_set_size(values, 5);
+
+	ret = g_gpiod_line_request_get_values(request, &values, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+	gpiod_test_return_if_failed();
+
+	g_assert_cmpuint(values->len, ==, 5);
+
+	for (i = 0; i < 5; i++)
+		g_assert_cmpint(g_array_index(values, GPIODLineValue, i), ==,
+				pulls[i]);
+}
+
+GPIOD_TEST_CASE(set_one_value)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT,
+			"output-value", G_GPIOD_LINE_VALUE_INACTIVE,
+			NULL);
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_assert_cmpuint(g_gpiosim_chip_get_value(sim, offset), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+
+	ret = g_gpiod_line_request_set_value(request, 4,
+					     G_GPIOD_LINE_VALUE_ACTIVE, &err);
+	g_assert_true(ret);
+	g_assert_no_error(err);
+
+	g_assert_cmpuint(g_gpiosim_chip_get_value(sim, offset), ==,
+			G_GPIOSIM_VALUE_ACTIVE);
+}
+
+GPIOD_TEST_CASE(set_all_values)
+{
+	static const guint offset_vals[] = { 0, 2, 4, 5, 6 };
+	static const GPIODLineValue value_vals[] = {
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_INACTIVE,
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_ACTIVE
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
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+	guint i;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(offset_vals, 5, sizeof(guint));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	values = gpiod_glib_test_array_from_const(value_vals, 5,
+						  sizeof(GPIODLineValue));
+
+	ret = g_gpiod_line_request_set_values(request, values, &err);
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
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(offset));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = g_gpiod_line_request_get_values_subset(request, offsets, NULL,
+						     &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = g_gpiod_line_request_get_values_subset(request, NULL, &values,
+						     &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(set_values_invalid_arguments)
+{
+	static const guint offset = 3;
+	static const GPIODLineValue value_vals[] = {
+		G_GPIOD_LINE_VALUE_ACTIVE,
+		G_GPIOD_LINE_VALUE_INACTIVE,
+	};
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineSettings) settings = NULL;
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+	g_autoptr(GArray) values = NULL;
+	g_autoptr(GArray) vals_inval = NULL;
+	g_autoptr(GError) err = NULL;
+	gboolean ret;
+
+	line_cfg = g_gpiod_line_config_new();
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_OUTPUT, NULL);
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(offset));
+	values = gpiod_glib_test_array_from_const(value_vals, 1,
+						  sizeof(GPIODLineValue));
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets,
+							      settings);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	ret = g_gpiod_line_request_set_values_subset(request, offsets, NULL,
+						     &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	ret = g_gpiod_line_request_set_values_subset(request, NULL, values,
+						     &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+
+	g_clear_pointer(&err, g_error_free);
+
+	vals_inval = gpiod_glib_test_array_from_const(value_vals, 2,
+						      sizeof(GPIODLineValue));
+
+	ret = g_gpiod_line_request_set_values_subset(request, offsets,
+						     vals_inval, &err);
+	g_assert_false(ret);
+	g_assert_error(err, G_GPIOD_ERROR, G_GPIOD_ERR_INVAL);
+}
+
+GPIOD_TEST_CASE(get_chip_name)
+{
+	static const guint offset = 4;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(GPIODLineConfig) line_cfg = NULL;
+	g_autoptr(GPIODLineRequest) request = NULL;
+	g_autoptr(GArray) offsets = NULL;
+
+	line_cfg = g_gpiod_line_config_new();
+	offsets = gpiod_glib_test_array_from_const(&offset, 1, sizeof(guint));
+
+	gpiod_glib_test_line_config_add_line_settings_or_fail(line_cfg,
+							      offsets, NULL);
+
+	request = gpiod_glib_test_request_lines_or_fail(
+			g_gpiosim_chip_get_dev_path(sim), NULL, line_cfg);
+
+	g_assert_cmpstr(g_gpiosim_chip_get_name(sim), ==,
+			g_gpiod_line_request_get_chip_name(request));
+}
diff --git a/bindings/glib/tests/tests-line-settings.c b/bindings/glib/tests/tests-line-settings.c
new file mode 100644
index 0000000..ad195ba
--- /dev/null
+++ b/bindings/glib/tests/tests-line-settings.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_assert_cmpint(g_gpiod_line_settings_get_direction(settings), ==,
+			G_GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(g_gpiod_line_settings_get_edge_detection(settings),
+			==, G_GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(settings), ==,
+			G_GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(g_gpiod_line_settings_get_drive(settings), ==,
+			G_GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(g_gpiod_line_settings_get_active_low(settings));
+	g_assert_cmpint(g_gpiod_line_settings_get_debounce_period_us(settings),
+			==, 0);
+	g_assert_cmpint(g_gpiod_line_settings_get_event_clock(settings), ==,
+			G_GPIOD_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(g_gpiod_line_settings_get_output_value(settings), ==,
+			G_GPIOD_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(set_direction)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_direction(settings,
+					    G_GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(g_gpiod_line_settings_get_direction(settings), ==,
+			G_GPIOD_LINE_DIRECTION_INPUT);
+
+	g_gpiod_line_settings_set_direction(settings,
+					    G_GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(g_gpiod_line_settings_get_direction(settings), ==,
+			G_GPIOD_LINE_DIRECTION_AS_IS);
+
+	g_gpiod_line_settings_set_direction(settings,
+					    G_GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(g_gpiod_line_settings_get_direction(settings), ==,
+			G_GPIOD_LINE_DIRECTION_OUTPUT);
+}
+
+GPIOD_TEST_CASE(set_edge_detection)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_edge_detection(settings,
+						 G_GPIOD_LINE_EDGE_BOTH);
+	g_assert_cmpint(g_gpiod_line_settings_get_edge_detection(settings), ==,
+			G_GPIOD_LINE_EDGE_BOTH);
+
+	g_gpiod_line_settings_set_edge_detection(settings,
+						 G_GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(g_gpiod_line_settings_get_edge_detection(settings), ==,
+			G_GPIOD_LINE_EDGE_NONE);
+
+	g_gpiod_line_settings_set_edge_detection(settings,
+						 G_GPIOD_LINE_EDGE_FALLING);
+	g_assert_cmpint(g_gpiod_line_settings_get_edge_detection(settings), ==,
+			G_GPIOD_LINE_EDGE_FALLING);
+
+	g_gpiod_line_settings_set_edge_detection(settings,
+						 G_GPIOD_LINE_EDGE_RISING);
+	g_assert_cmpint(g_gpiod_line_settings_get_edge_detection(settings), ==,
+			G_GPIOD_LINE_EDGE_RISING);
+}
+
+GPIOD_TEST_CASE(set_bias)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_bias(settings, G_GPIOD_LINE_BIAS_DISABLED);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(settings), ==,
+			G_GPIOD_LINE_BIAS_DISABLED);
+
+	g_gpiod_line_settings_set_bias(settings, G_GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(settings), ==,
+			G_GPIOD_LINE_BIAS_AS_IS);
+
+	g_gpiod_line_settings_set_bias(settings, G_GPIOD_LINE_BIAS_PULL_DOWN);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(settings), ==,
+			G_GPIOD_LINE_BIAS_PULL_DOWN);
+
+	g_gpiod_line_settings_set_bias(settings, G_GPIOD_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(settings), ==,
+			G_GPIOD_LINE_BIAS_PULL_UP);
+}
+
+GPIOD_TEST_CASE(set_drive)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_drive(settings,
+					G_GPIOD_LINE_DRIVE_OPEN_DRAIN);
+	g_assert_cmpint(g_gpiod_line_settings_get_drive(settings), ==,
+			G_GPIOD_LINE_DRIVE_OPEN_DRAIN);
+
+	g_gpiod_line_settings_set_drive(settings,
+					G_GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(g_gpiod_line_settings_get_drive(settings), ==,
+			G_GPIOD_LINE_DRIVE_PUSH_PULL);
+
+	g_gpiod_line_settings_set_drive(settings,
+					G_GPIOD_LINE_DRIVE_OPEN_SOURCE);
+	g_assert_cmpint(g_gpiod_line_settings_get_drive(settings), ==,
+			G_GPIOD_LINE_DRIVE_OPEN_SOURCE);
+}
+
+GPIOD_TEST_CASE(set_active_low)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_active_low(settings, TRUE);
+	g_assert_true(g_gpiod_line_settings_get_active_low(settings));
+
+	g_gpiod_line_settings_set_active_low(settings, FALSE);
+	g_assert_false(g_gpiod_line_settings_get_active_low(settings));
+}
+
+GPIOD_TEST_CASE(set_debounce_period)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_debounce_period_us(settings, 4000);
+	g_assert_cmpint(g_gpiod_line_settings_get_debounce_period_us(settings),
+			==, 4000);
+}
+
+GPIOD_TEST_CASE(set_event_clock)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_event_clock(settings,
+					       G_GPIOD_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(g_gpiod_line_settings_get_event_clock(settings), ==,
+			G_GPIOD_LINE_CLOCK_MONOTONIC);
+
+	g_gpiod_line_settings_set_event_clock(settings,
+					      G_GPIOD_LINE_CLOCK_REALTIME);
+	g_assert_cmpint(g_gpiod_line_settings_get_event_clock(settings), ==,
+			G_GPIOD_LINE_CLOCK_REALTIME);
+
+	g_gpiod_line_settings_set_event_clock(settings,
+					      G_GPIOD_LINE_CLOCK_HTE);
+	g_assert_cmpint(g_gpiod_line_settings_get_event_clock(settings), ==,
+			G_GPIOD_LINE_CLOCK_HTE);
+}
+
+GPIOD_TEST_CASE(set_output_value)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_output_value(settings,
+					       G_GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(g_gpiod_line_settings_get_output_value(settings), ==,
+			G_GPIOD_LINE_VALUE_ACTIVE);
+
+	g_gpiod_line_settings_set_output_value(settings,
+					       G_GPIOD_LINE_VALUE_INACTIVE);
+	g_assert_cmpint(g_gpiod_line_settings_get_output_value(settings), ==,
+			G_GPIOD_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(reset_settings)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(NULL);
+
+	g_gpiod_line_settings_set_direction(settings,
+					    G_GPIOD_LINE_DIRECTION_INPUT);
+	g_gpiod_line_settings_set_edge_detection(settings,
+						 G_GPIOD_LINE_EDGE_BOTH);
+	g_gpiod_line_settings_set_debounce_period_us(settings, 2000);
+	g_gpiod_line_settings_set_event_clock(settings,
+					      G_GPIOD_LINE_CLOCK_REALTIME);
+
+	g_gpiod_line_settings_reset(settings);
+
+	g_assert_cmpint(g_gpiod_line_settings_get_direction(settings), ==,
+			G_GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(g_gpiod_line_settings_get_edge_detection(settings), ==,
+			G_GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(settings), ==,
+			G_GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(g_gpiod_line_settings_get_drive(settings), ==,
+			G_GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(g_gpiod_line_settings_get_active_low(settings));
+	g_assert_cmpint(g_gpiod_line_settings_get_debounce_period_us(settings),
+			==, 0);
+	g_assert_cmpint(g_gpiod_line_settings_get_event_clock(settings), ==,
+			G_GPIOD_LINE_CLOCK_MONOTONIC);
+	g_assert_cmpint(g_gpiod_line_settings_get_output_value(settings), ==,
+			G_GPIOD_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(set_props_in_constructor)
+{
+	g_autoptr(GPIODLineSettings) settings = NULL;
+
+	settings = g_gpiod_line_settings_new(
+			"direction", G_GPIOD_LINE_DIRECTION_INPUT,
+			"edge-detection", G_GPIOD_LINE_EDGE_BOTH,
+			"active-low", TRUE,
+			"debounce-period-us", (GTimeSpan)3000,
+			"bias", G_GPIOD_LINE_BIAS_PULL_UP,
+			"event-clock", G_GPIOD_LINE_CLOCK_REALTIME,
+			NULL);
+
+	g_assert_cmpint(g_gpiod_line_settings_get_direction(settings), ==,
+			G_GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(g_gpiod_line_settings_get_edge_detection(settings), ==,
+			G_GPIOD_LINE_EDGE_BOTH);
+	g_assert_cmpint(g_gpiod_line_settings_get_bias(settings), ==,
+			G_GPIOD_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(g_gpiod_line_settings_get_drive(settings), ==,
+			G_GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_true(g_gpiod_line_settings_get_active_low(settings));
+	g_assert_cmpint(g_gpiod_line_settings_get_debounce_period_us(settings),
+			==, 3000);
+	g_assert_cmpint(g_gpiod_line_settings_get_event_clock(settings), ==,
+			G_GPIOD_LINE_CLOCK_REALTIME);
+	g_assert_cmpint(g_gpiod_line_settings_get_output_value(settings), ==,
+			G_GPIOD_LINE_VALUE_INACTIVE);
+}
diff --git a/bindings/glib/tests/tests-misc.c b/bindings/glib/tests/tests-misc.c
new file mode 100644
index 0000000..7db9ec2
--- /dev/null
+++ b/bindings/glib/tests/tests-misc.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022-2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_assert_false(g_gpiod_is_gpiochip_device("/dev/null"));
+	g_assert_false(g_gpiod_is_gpiochip_device("/dev/nonexistent"));
+}
+
+GPIOD_TEST_CASE(is_gpiochip_good)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new(NULL);
+
+	g_assert_true(g_gpiod_is_gpiochip_device(
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
+	g_assert_false(g_gpiod_is_gpiochip_device(link));
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
+	g_assert_true(g_gpiod_is_gpiochip_device(link));
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
+	ver = g_gpiod_api_version();
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
index 0000000..665f2a4
--- /dev/null
+++ b/bindings/glib/tests/tests-request-config.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+	g_autoptr(GPIODRequestConfig) config = NULL;
+
+	config = g_gpiod_request_config_new(NULL);
+
+	g_assert_null(g_gpiod_request_config_get_consumer(config));
+	g_assert_cmpuint(g_gpiod_request_config_get_event_buffer_size(config),
+			 ==, 0);
+}
+
+GPIOD_TEST_CASE(set_consumer)
+{
+	g_autoptr(GPIODRequestConfig) config = NULL;
+
+	config = g_gpiod_request_config_new(NULL);
+
+	g_gpiod_request_config_set_consumer(config, "foobar");
+	g_assert_cmpstr(g_gpiod_request_config_get_consumer(config), ==,
+			"foobar");
+
+	g_gpiod_request_config_set_consumer(config, NULL);
+	g_assert_null(g_gpiod_request_config_get_consumer(config));
+}
+
+GPIOD_TEST_CASE(set_event_buffer_size)
+{
+	g_autoptr(GPIODRequestConfig) config = NULL;
+
+	config = g_gpiod_request_config_new(NULL);
+
+	g_gpiod_request_config_set_event_buffer_size(config, 128);
+	g_assert_cmpuint(g_gpiod_request_config_get_event_buffer_size(config),
+			 ==, 128);
+}
+
+GPIOD_TEST_CASE(set_properties_in_constructor)
+{
+	g_autoptr(GPIODRequestConfig) config = NULL;
+
+	config = g_gpiod_request_config_new("consumer", "foobar",
+					    "event-buffer-size", 64, NULL);
+	g_assert_cmpstr(g_gpiod_request_config_get_consumer(config), ==,
+			"foobar");
+	g_assert_cmpuint(g_gpiod_request_config_get_event_buffer_size(config),
+			 ==, 64);
+}

-- 
2.43.0


