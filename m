Return-Path: <linux-gpio+bounces-18641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7229A83E73
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA6B54C4558
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49576218AA3;
	Thu, 10 Apr 2025 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="01Z7jEVN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9B52165E4
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276678; cv=none; b=pd2k68QeoNKk1cb0C7pUBfT2ToqT69StGZncIIipV2xkjCj9MxznDmO9fqen0ET2WoGezhvsvfus3/4hUw50aPJtGciiQ49NzIgaxPJC2cLmJdax9q4FwYyc9jRphwjW31MTa1pQ9kT7nWH0aWjFp5BHMwzfGdUG6E9yw32H1qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276678; c=relaxed/simple;
	bh=XnlpoEvjZACCU7kpAe6QEtknnxIso+q3oj4cR/PurvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qr1MTqpX8FxsvQfJKKFJa3Skx6aw1aYnSAKImLh7E3AUCi289raBNQ5t32dnhlnzbH+5vdvEOqI7g3pgydm9moVeeVB12o2mOzuun0T2YuMe0c4sKqJ+PyB7RwgDIRVR6xgIzXiPEwhWmbLDoz8R11wdZ2MH78wfo1zmm89zHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=01Z7jEVN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so6568115e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744276674; x=1744881474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oN437SAl97gTTDmFe5aRM3ujBrLmqPWFhjIY3mJqkpQ=;
        b=01Z7jEVNKqWel0u0EpcYSoFQ3Su8xnu/UrRXQiGDG8fkp3mSuGBceQs1qb2sLFQMGK
         BewTeVvvZtBVx9SNLFlfcNR9/sVoc4HHQazwTjl0TAnWFAa82+d2X6CTb5yZgVJGqfaP
         7dxMkL0XUEYJEPGgVI/+e3cPKWPdWeO/bXwyQN1407SO+vetZbiZolLhs5Dqay0cJonH
         h+gqwo2lO2jVJ45QOUGgTosNFZbYtLLxChucebyNHNmn9FuTgEOCQWNapHtgMLDBlWVw
         g81CEdtXaOUwdvdPOUCgpbbMHeXwlwyaz4jiClqUZGh8yJoEoa0QxlaYvlxNLeeXMijc
         Tccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276674; x=1744881474;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oN437SAl97gTTDmFe5aRM3ujBrLmqPWFhjIY3mJqkpQ=;
        b=Yr/Mt3iQ8HDvxwai0mRaiHyEjjuWBQ5cYuIqaYFrEKwGI9xpi7dBhFcz3evkaM6ZyH
         TaxMCSTNBf8EfD4pnqScAUHC8YqKnTAT1hF8sT79pZDf/vbGVcqaW5zqzi27YaySdjFW
         HtHpZJiYu44s2DwvfvwJmOx1DJ8ZqHQTsNSwNTmrwEXRr5RWOviGIYjWDaOkLIg3AIb/
         ulYmWm7kYU3wVnFmArefss4vn1lhMSjViCdVSQcHYwHKF5daW4BQ/RL0Qd5GIlw2huKJ
         yb8UE6qhmaIL/Mwp1CK9A4IfndBDwnYEb5bORJ89DtHt36+aOv1DOclwjXYmKyXyQeVr
         v8fQ==
X-Gm-Message-State: AOJu0YzMd1/pg4zYmaJx/mPdDHxPydYnHH2/5EG14iJSIbv+W6mxSuLJ
	R4LXFwab0gTLxp+BW3amTlMDgPlLcyKntXK/MScpPT/BHwbgU3OrATeenyGCx9s=
X-Gm-Gg: ASbGncsmhK5mfyklSM7vut6WVHLJ7bV/MBoSvQ1mSlf1TaAy4c28f8M9t1Gxd4MHhRj
	88owEZ17f9jM53bdoIcKAWCQ5gFpohHOKXlSqDyOU/fP9Nae1aZe0Q0T5jSaAnhbMK2KRcshyG9
	CwS9dqOQifJMHumN3vi+8RVsdMrsjHMt44LY7SZIqTCcwmLs089IJgYkMuj9ATG/HDyl6kc1OlS
	7/P2noZHkMNl6e+gBgBUpDR5hCn8Ml7J4tBzmHeSnfP58tNh+WRnc4liJLgG2DXWTXFqyRON8YX
	ChZ+Psso0AH6BJ0EJSuz2YSrvQB1opg/tA==
X-Google-Smtp-Source: AGHT+IGVtg0EG0GnAaAtb1XCvPKN9twmYa1EbmJZcY+xhs+VPrxvE8Qs46ZvZ46XvPsPCfTLIYb03A==
X-Received: by 2002:a05:600c:3b19:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-43f2fedc137mr13571585e9.9.1744276673863;
        Thu, 10 Apr 2025 02:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206332d9sm47738515e9.13.2025.04.10.02.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:17:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:17:47 +0200
Subject: [PATCH libgpiod] tests: uapi: add test-cases for open-drain and
 open-source emulation
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-open-drain-source-tests-v1-1-a062d2280cc5@linaro.org>
X-B4-Tracking: v=1; b=H4sIALqM92cC/x3MQQqDMBBG4avIrDsQxYD1KqWLmPy1A5KEGVsK4
 t0NXX6L9w4yqMBo7g5SfMWk5Ib+1lF8h7yCJTXT4Abvxt5xqcicNEhmKx+N4B22G9/dBO9DnBZ
 EanVVvOT3Pz9ok2WtUhI9z/MCTNKDanMAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andy@kernel.org>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4570;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=seneONRSiVbEEKliCOc0m85tIR3gfsVHGtUYPrREKPM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn94y9kqEemBQLWY7ZdGt0Ma2KClawxYRfHEGQD
 7a+cdtg7v+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eMvQAKCRARpy6gFHHX
 co1lD/45Tbn6LyZ32wmSM6s6Al5/e29mUwJsCso3pYy1mXJiORAy/LYH7jrsPdW9kJjw2voLFZy
 mRlmgvB0l+obCDBSwql80r85OB2gD4HaCSHL3qAuZb46BNY0jiTSf9cC1pkzBaoijy+qErv3fqo
 nBMYKTzAU1N5Y1BdSXwR2jIybiaJ3T+19/9GyGgN+2/uDQJ5L8EKYxIGZ/RTSVi88WH0icNMqEz
 WLKZCY80eNsRLntusK04t/JmOOPvG4STEKshZIYx85SEaKIbcrBwlHvHBHy/nkhYT9YTXLkYnn2
 A/aHrYAe5whteEP63dFoaIH6In7je2NBwu6UAv2/Jhjv2yxMq/JeXSYp6NUGVDtPmiYE1pTK/9e
 ePdkj/UF2Q3wxqsKA3qyisizQBnACu0xYT7NtU9AQSlY6Iy8nxqkLxRPMT113wykdAlzTU33cEN
 gi7BF4MXOSQbjUSBXcX91XRhKY+It6pA6A/oQGXaCA6XTuZvr4bIAl4+dauVNLiArbXU3PbWgpl
 AUFk44ntB6TfoRo+7Q6cBg7bcOSWfP8A6KhHnCKQPs3iT3xnMFHdQb+yTwiHWw3DWbx9ea3BjJb
 68n/tBEE1zGkqYQCNZyeTBgGw10P7tEK+jKXfVe/PpPhr0rBBDHes8PYq8X0C8QpCkVKZEnVjGK
 HT3iOed3JQhHoFw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The kernel GPIO subsystem can emulate open-drain and open-source by not
actively driving the line for active and inactive output values
respectively. The kernel does it by setting the line to input in these
cases but this still must be reported as output to user-space. Add new
test-cases that verify this behavior.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Andy's comment on a GPIOLIB patch made me realize it's a good idea to
add tests for open-drain and open-source emulation in the kernel where
we don't actively drive the line for active and inactive values
respectively.
---
 tests/tests-kernel-uapi.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tests/tests-kernel-uapi.c b/tests/tests-kernel-uapi.c
index ff220fc..5955fac 100644
--- a/tests/tests-kernel-uapi.c
+++ b/tests/tests-kernel-uapi.c
@@ -110,3 +110,90 @@ GPIOD_TEST_CASE(enable_debounce_then_edge_detection)
 
 	g_assert_cmpuint(ts_falling, >, ts_rising);
 }
+
+GPIOD_TEST_CASE(open_drain_emulation)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_drive(settings, GPIOD_LINE_DRIVE_OPEN_DRAIN);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	request = gpiod_test_chip_request_lines_or_fail(chip, NULL, line_cfg);
+
+	ret = gpiod_line_request_set_value(request, offset,
+					   GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	/*
+	 * The open-drain emulation in the kernel will set the line's direction
+	 * to input but NOT set FLAG_IS_OUT. Let's verify the direction is
+	 * still reported as output.
+	 */
+	info = gpiod_test_chip_get_line_info_or_fail(chip, offset);
+	g_assert_cmpint(gpiod_line_info_get_direction(info), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_info_get_drive(info), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
+
+	/*
+	 * The actual line is not being actively driven, so check that too on
+	 * the gpio-sim end.
+	 */
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offset), ==,
+			G_GPIOSIM_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(open_source_emulation)
+{
+	static const guint offset = 2;
+
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info = NULL;
+	gint ret;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_drive(settings, GPIOD_LINE_DRIVE_OPEN_SOURCE);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	request = gpiod_test_chip_request_lines_or_fail(chip, NULL, line_cfg);
+
+	ret = gpiod_line_request_set_value(request, offset,
+					   GPIOD_LINE_VALUE_INACTIVE);
+	g_assert_cmpint(ret, ==, 0);
+	gpiod_test_return_if_failed();
+
+	/*
+	 * The open-source emulation in the kernel will set the line's direction
+	 * to input but NOT set FLAG_IS_OUT. Let's verify the direction is
+	 * still reported as output.
+	 */
+	info = gpiod_test_chip_get_line_info_or_fail(chip, offset);
+	g_assert_cmpint(gpiod_line_info_get_direction(info), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_info_get_drive(info), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
+}

---
base-commit: 9f0eca2d7260de1ae22fed3795280bdb14b62e57
change-id: 20250410-open-drain-source-tests-908e55ac8bec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


