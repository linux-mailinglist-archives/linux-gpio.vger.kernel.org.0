Return-Path: <linux-gpio+bounces-26819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FEBBDDD8
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 13:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 548DE3B30AE
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 11:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B04526E16F;
	Mon,  6 Oct 2025 11:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HKVitTpX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385626D4E3
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750092; cv=none; b=YZghB62y1VMFIIkMKZWUFwi+zdYnvEXhSBqtPdetZ+Yyq3/rol0QeTzppcZGdpN4ctVyPHI8h6q1wYFgo0O1J4FNVbnjG2dzUb/2nOg2i7+MTBxr0lBd1ua+j6ahuW8Iy8RBrvkJleUkIe7JctqGzPUmiiLf0fRfk6UaOJwWqn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750092; c=relaxed/simple;
	bh=Qvek8Hrq574GED2ZJNaQpIy/bGeBDNzcdJWXs2YjzmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbLcUF27PlNlL61kxFDehu7o/9QuEwdBh8c9cJ5JyQOCd/0Grh1yDAMMbuAtD7mpvlt2vOQxJUN8iHMruP0mgSGWzXLnHtiJGiXe/W8ZznWZbG+mJziGyF2H9fkDOYyTenNH3jUfbKDDxrhj93vsLdfjBXzZs8gCJz8TYeZryrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HKVitTpX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee12807d97so3928956f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 04:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759750089; x=1760354889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNCH2s5L3v+7L2jSmJzkfnpK3ZDGqPCjK4bIWzO5dyw=;
        b=HKVitTpXTLw6WaGFP7qwNz1TDt2/CmST7+C8iPD2R1Aa+6GCQheWLhxU7IiyrKLMtC
         bz42EpAZlxGy06No6gtQwJRY4hf5S/7fJS09+q0cPuGuU2t2otgZuAyyZqmzLgBJvw0O
         3PvVAF06ZO0YNoOHWhnbQ2OsfMH26F5Tm+Xg0KUKQOKM0fV00e2tc4dEn/3MiHi1ogFT
         UxyEfysOhig7toNanbEtEyt3WLAIUbihTo2aq35UTveHD9+Hf8zr9Jmtd9CkGoZvK53I
         2adF/md7nKOr48R/DlUs2HXBlrGRbUL708mgQVSbzxnQtTHlA7MmepHYk5D/X5RKsUao
         6Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750089; x=1760354889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNCH2s5L3v+7L2jSmJzkfnpK3ZDGqPCjK4bIWzO5dyw=;
        b=EK3JqZz9GOvHgLoNjjs47TpmVNGLqI/V52Lnf68FrHcYlQ4n+zSTT7H2HLCgmf/WYC
         4Iy0Cj4z05iKFXfJ1ZRwjq1IXEmtjZpeouJ5EPJBUklZ9rJ9ZqWyj25bFJBbLd+iIyLK
         APmdZLc8DfqlmWiwCzkslqC7RAb2YuMSgOo8ra6waVPrRVUhLzF/qMMQ07RywR3LWhtQ
         5/RA4LftPIwk4TzTyCmd+/bOEiNsNHpfCdFvtRmnrSBoLYGjQGbx8i38LUxWpdj4Mz8k
         B4GZ6mMKDUHOIL7D87nCQ/KJ1p9oPLptIih73dsVA80G9EQPZ6H+suqOywLbYi9B0U4P
         Mefw==
X-Gm-Message-State: AOJu0Yyej4anJJ4nyixPjZoYr5rpZbxhR6noq60vbY5jmZ2omiT0xa2+
	BFmpWo8KneHnXTn3pH+F1hImhiDrK5pbolB/9MvxWzNXplEn55Cx6n26SOg2sDxTlNo=
X-Gm-Gg: ASbGncsyPMon3WNrFlPmgy507PxDGz6+kI+DtAS0WVAb2crZBE5XxLaBxrOGpwkma4T
	6JFfHd9eCtV91YLJqVquNVy4MC5gtGxWXEj+xBqUqrvPKcBDA+kUUgBOcUePjYkcR3CS5gIq3q8
	1QXyb073UBwnaTh3soTsh4cyeZN7TRovNQcT7EqshT+0Nt97kO/X/pYqlRaWLy6M7RnBkviChoq
	3PCyyEuc1dWB9HKSReUQvSfx0u0hzH/L5LNGJHyJuhte4r1NiLpry9TBc21Cv6KB3RLz3xwV55H
	t3hNY3k2/TyejnOxS2PZJTD2qxCCE5UMNmpjezzfcBUZ+yMYMYsgr3A1T9GuBGvjSPdMH/Wd2JQ
	x0iO0YaYtr7m9vLJ6SnY4UUEJ/XsRD8idwa6Vu2hdkQ==
X-Google-Smtp-Source: AGHT+IGK1FCbRlm/pzvXpQ1AbhsHHUfwRQnK+PUFdVetX1qLU24JkkAKB+pmLUDmWF2+5nP2xfJt0A==
X-Received: by 2002:a05:6000:609:b0:3ec:1b42:1f93 with SMTP id ffacd0b85a97d-42567194cfcmr6384827f8f.37.1759750089465;
        Mon, 06 Oct 2025 04:28:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f017esm21078167f8f.47.2025.10.06.04.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:28:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 13:27:52 +0200
Subject: [PATCH libgpiod 7/7] tests: add a test case for checking invalid
 lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-gpiosim-valid-lines-v1-7-b399373e90a9@linaro.org>
References: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
In-Reply-To: <20251006-gpiosim-valid-lines-v1-0-b399373e90a9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yx4rgKyOEvcTvpm6JH+DEF7lBBD4eLnQtMxy4V4A1dA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo46e/60hdZnv8ErRiEC5UvKcZvd1iIKFJz8s/7
 vvEkExBlsaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOOnvwAKCRARpy6gFHHX
 crx6EACm1TgT8UMAeynwbkkMk5aCeRyj9zXbTLM1bOv4AVB1p0NOoPOjOvRq+1jfeJOijuByrS6
 2+kXq3IoMAu6K5rDhDZi+tx/AWOob2rkmLkwT3dXetjR1nHvo8/CcvE7Bqjnuf/ZEgyNT7NOAen
 B1QmtLsO/2T2BEC9bMY4bkPrOApeLoR2MwgYO9wFI+VBIAeRSKFAUsi9Zrh0QSlU9HA4eN5pg58
 38x1orOPG3zzrOckNREA+ubjL5mVi0pl/tdyez9NhzQiu+RgwgBfHZ/SFstMTkEwZ7GyycXUhXD
 dWMAvOYGLJqrQIpuZl56FxjiQGsZ2wxoa+9JjVUWz2lLaX+vaHGS6+qpeoFZFQPROdKDXod5M5W
 a8Q6/n2mVcCYVcqNd6obbDJ8u0NAXSr2U0uZdqnw0f1mv3nEEFt9FZZSXLzG0jpJXjXXoWYctfn
 wHhgnFp+z2T1LXCiPACSm1FXVzx5bpiTo+ifCwYPSziq4jkCvvQ4JKjG4M3w8HO+Hx98BQ9cIQw
 k2UVWIfFRis1FL7HnzgDDnu1Feuzxa+kpo9eSFsTipDTQZilAyKpGAwvb5OE4JFfQ23dk5PM7Oe
 trxVuxUcqY3Ndgu5L7FgU5arVbT3TUJeRMaqzyo0BNbVvwVxZSkJ+xO2KgAM9HJ98eZDNFEcLdq
 ilZUQXTDe12r1Dw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a test case for validating kernel's behavior when user-space tries
to request an invalid GPIO line.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/harness/gpiod-test.c |  4 ++--
 tests/tests-kernel-uapi.c  | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/tests/harness/gpiod-test.c b/tests/harness/gpiod-test.c
index 4e65ae2d260a0339f881ed7dfe0281b834095588..7fafc030c3712decc3271c72aa8ab789871f764e 100644
--- a/tests/harness/gpiod-test.c
+++ b/tests/harness/gpiod-test.c
@@ -10,8 +10,8 @@
 
 #include "gpiod-test.h"
 
-#define MIN_KERNEL_MAJOR	5
-#define MIN_KERNEL_MINOR	19
+#define MIN_KERNEL_MAJOR	6
+#define MIN_KERNEL_MINOR	17
 #define MIN_KERNEL_RELEASE	0
 #define MIN_KERNEL_VERSION	KERNEL_VERSION(MIN_KERNEL_MAJOR, \
 					       MIN_KERNEL_MINOR, \
diff --git a/tests/tests-kernel-uapi.c b/tests/tests-kernel-uapi.c
index 5955fac59717bb5181e7b6d11ee996b4fb24f588..65f9c50f7e5a0f9186343cec5209c87371ee713d 100644
--- a/tests/tests-kernel-uapi.c
+++ b/tests/tests-kernel-uapi.c
@@ -197,3 +197,32 @@ GPIOD_TEST_CASE(open_source_emulation)
 	g_assert_cmpint(gpiod_line_info_get_drive(info), ==,
 			GPIOD_LINE_DRIVE_OPEN_SOURCE);
 }
+
+GPIOD_TEST_CASE(valid_lines)
+{
+	static const guint invalid_lines[] = { 2, 4 };
+
+	g_autoptr(GPIOSimChip) sim = NULL;
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_info) info0 = NULL;
+	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	g_autoptr(GVariant) vinval = NULL;
+
+	vinval = g_variant_new_fixed_array(G_VARIANT_TYPE_UINT32,
+					   invalid_lines, 2, sizeof(guint));
+	g_variant_ref_sink(vinval);
+
+	sim = g_gpiosim_chip_new("num-lines", 8,
+				 "invalid-lines", vinval,
+				 NULL);
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	info0 = gpiod_chip_get_line_info(chip, 0);
+	info1 = gpiod_chip_get_line_info(chip, 2);
+	g_assert_nonnull(info0);
+	g_assert_nonnull(info1);
+	gpiod_test_return_if_failed();
+
+	g_assert_false(gpiod_line_info_is_used(info0));
+	g_assert_true(gpiod_line_info_is_used(info1));
+}

-- 
2.48.1


