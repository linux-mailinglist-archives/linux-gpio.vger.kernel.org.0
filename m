Return-Path: <linux-gpio+bounces-19270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC75FA9ACD5
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 14:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3293E4437F2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 12:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B4B22B590;
	Thu, 24 Apr 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QTuLnxeL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0696221FCC
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496392; cv=none; b=cbTzFBFrNTzSumwmwkFw21x5QLxSSmLljboygplBWf9+w37bMc397vN54sOmv5oQl4BOhzkU+4NLff1iq/OEPpUqZKOGrBDK3vh7lXrEwNbg4LI15i9kdbjgabm1LpiDDWz20srCySGEhs/KzsxqyDyl0vlE3T1Tqfh7BzRujp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496392; c=relaxed/simple;
	bh=fZPyM+t+8g32uOJLovcOdzH0PaxIlPmC8Vhht+AXf+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnoN+dSA2onkytTapqRgIMBudgUXReJx5TnVMZUFdKxSVfI3cupjRbNk0QVm6YJH+VoRPs6Hc609i1Hdlwv6hEW8BU2rP20H3cJ+qLVt9V9Q2PyUgOTgwXJG/JtBRQe5GlrbXDXup9cXCVXM1Y+QN4pYlDx0LebY/LaOxGeddbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QTuLnxeL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1428636f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745496389; x=1746101189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmBfepC1ocfC4zLY8rWZfc6OY5eKgwPba73i3bJDtkU=;
        b=QTuLnxeLORl0wmOTvLphxiZCls6/RxuVdeuzEq37k/ffWpF40BLH6DYe2t7PjeuhWJ
         XM7rzG58yYy6aYI82UUSYZVNpAFEBtrhBjKTB9kEDtO0qPlXcB9YA1CH06EYrhhGF4I3
         RHf0n80/vH59fJbTwxIt6yS7947trd8e8U3cYAKuAtUhEI8hawG0EyUiSdgV7k0XDrF3
         NRKgLJHdpGDlR1NpvCUMcETItzIg4Zl0z+c4ggwJGBAn40BMB/dB+jj+yRT9K58o4jGZ
         ztfm+oGNS8SpEMSiQ0nJxQfLJZ/dAJbFs3doUQ22F5Kd5/MNDgwrNpx15TLb9VIZARyE
         MdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496389; x=1746101189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmBfepC1ocfC4zLY8rWZfc6OY5eKgwPba73i3bJDtkU=;
        b=DgcTFb57TpPjqJ9zhDS/v/VdWIxtWhOkoCddRMANpCWbLmbo7Qbx9G6hVzSvvBaF/b
         KqLFQ8uPcCsbg5uxMyhmb24zP6c8KjBJ7C/Pj+0fCj843Vb/twYaUT+xSUhmIW1FKkGj
         dBh/b6nrZWi2cDnc8bPRKiMGsP0x2PeHliRRyIyjYYQeu8Vahr0L0CIe9OODEfb4IkgM
         jzoCvYf4PmoCquPw/2Aw34prbk7XTc94iHlNuAZ1JjKK5HCp7KWIU1VPRWLfJZ73SYAj
         KxW5LjECrCxuCSpLs6CJHxZr1MUCobqtb696dGWyYDWWFGOqZDNQWjEC32PQJ7gssqi5
         20Qw==
X-Gm-Message-State: AOJu0YxdW75Sp1wbkCXy53t6O+dQBlp29WJlXipcM9yvMVyNKMPZNMgR
	MuTXVLPLt925k4kAKn3fTd6Pmr2w5pSCp97bfrAvoz/b/GrONDxZFBHmrBNjBEM=
X-Gm-Gg: ASbGncvvc76D1esUqc3RW+kj23Z3wzR3HxUBsmlKlu1tRL2+Idu4P1HWrOu6XfNP1Rf
	XM0LSm50pLMZ5u+FMhWk1xLMGYNOI3e0X07nXyXyfh/OekR1XZvo/6BE1JFGlzd1VjYpSZ99VhZ
	jNKISjMT9yZYeYuNnWDSUlb1ZVKSZ+PSaJceU+nEcFOyGwXzuXC1YVfFUhwDRvZ6j9+LYM7kLGO
	MHzip6cfAklFWdR8i3AeiW0remPwvuAmycSAiYgcLlXYCGlfO6i62LzUr0ul0GyLdFEWEsb9xO+
	atzSsduCb4o9H1CUE1iDRoB06PcbtlQP4g==
X-Google-Smtp-Source: AGHT+IFox1VUSgU/q9Vx6891P6KlOnQiiX9b7DUasucUXkg7XX/1HCJB9DC3kj5S7UsebUQ0eOubJg==
X-Received: by 2002:a5d:648a:0:b0:39f:d0a:5b23 with SMTP id ffacd0b85a97d-3a06d674accmr2099066f8f.17.1745496388937;
        Thu, 24 Apr 2025 05:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c108esm1881793f8f.40.2025.04.24.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:06:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 14:06:17 +0200
Subject: [PATCH libgpiod 2/2] tests: add a test-case checking line-config
 memory usage
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-line_config_mem_use-v1-2-fa0abdcf0cdf@linaro.org>
References: <20250424-line_config_mem_use-v1-0-fa0abdcf0cdf@linaro.org>
In-Reply-To: <20250424-line_config_mem_use-v1-0-fa0abdcf0cdf@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WHEXTrJML2n86+yPEpXIRKRki8p0tCWD5RkbP3HBkhk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCilCsvj1Kg67WxXVUmnq03wYmDGvMvU+wbEgF
 okvsPzYGK6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAopQgAKCRARpy6gFHHX
 cnX/D/sF9iloOJeoRLwlxWWI5oy2uVCnX2iwHLmIoHV2K/4Atx75J0rNz02RRQz1JSL96gMbDOR
 HAzsXgoIIyjeDHQP3k4VQHdK5HWatyFuwsrfmNXygnZxvuaUfCjCC/Hac0VZVy2Uzt3mpCTl/Wo
 nQ+K36ZiZmpt8/Ne/bi/mSplIUti68JqETV8AsaPlXBX03E1KZPQXhYyypdyHVQIOgm3k1NJ48F
 Gm8w5rpKSraDHnipk5OxziPd7KG1DsXjtKFNtpMGvxFSCpfrCUnBoApziEwjkyIZfINoXoCVo87
 quRstI79MLyIVE4hKMyQoGvttAZV+YzPjvwT6V6hA3gqsGx8nREs98i8yo4H3XPeFt5/dagSU0O
 3aeSa+zSrVqn71gb+aduDRbi2PB/GIuplNSgVizDvlYryzae7GVoOANRcMSJggheIg304qebQvZ
 93U0WiTnauPso37vqIg5k1E2YINVBim4czvAXhkcPOmgO4yqwvh3/5JXnzIH/BIxTkNgOiyQmYZ
 zO88ZhRiJnCqZlnWeFOLkjobFfxMLqpVEJtbg5/bTp0Sf4uviqmoQ8or1nGBEILp0zju+vaUMsp
 dRibJDo7p30wGwUM2lAquqC1HH4K8t9UbEonMmmo8ohKa4XwzFhUGKk7+rgsvnLWhZXhSdGTvra
 247BN15BQ0WQavA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a test case making sure that repeatedly adding line settings to a
line-config object doesn't continuously inflate its size until OOM.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac              |  1 +
 tests/tests-line-config.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/configure.ac b/configure.ac
index af5d53d..416ae28 100644
--- a/configure.ac
+++ b/configure.ac
@@ -172,6 +172,7 @@ then
 	AC_CHECK_FUNC([tsearch], [], [FUNC_NOT_FOUND_LIB([tsearch])])
 	AC_CHECK_FUNC([tdestroy], [], [FUNC_NOT_FOUND_LIB([tdestroy])])
 	AC_CHECK_FUNC([tdelete], [], [FUNC_NOT_FOUND_LIB([tdelete])])
+	AC_CHECK_FUNC([setrlimit], [], [FUNC_NOT_FOUND_LIB([setrlimit])])
 	AC_CHECK_HEADERS([sys/utsname.h], [], [HEADER_NOT_FOUND_LIB([sys/utsname.h])])
 	AC_CHECK_HEADERS([sys/mount.h], [], [HEADER_NOT_FOUND_LIB([sys/mount.h])])
 	AC_CHECK_HEADERS([sys/prctl.h], [], [HEADER_NOT_FOUND_LIB([sys/prctl.h])])
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index b61a445..b510e0f 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -7,6 +7,8 @@
 #include <gpiod-test.h>
 #include <gpiod-test-common.h>
 #include <gpiosim-glib.h>
+#include <sys/resource.h>
+#include <unistd.h>
 
 #include "helpers.h"
 
@@ -469,3 +471,44 @@ GPIOD_TEST_CASE(handle_duplicate_offsets)
 	g_assert_cmpuint(retrieved[1], ==, 2);
 	g_assert_cmpuint(retrieved[2], ==, 3);
 }
+
+GPIOD_TEST_CASE(dont_allow_line_config_to_balloon_out_of_control)
+{
+	static const guint offsets[] = { 0, 2 };
+
+	g_autoptr(struct_gpiod_line_config) config = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	struct rlimit rlim;
+	guint counter;
+	gint ret;
+
+	/*
+	 * Severly limit the available virtual memory and make sure that
+	 * adding settings for the same offsets repeatedly does not trigger
+	 * the OOM killer.
+	 */
+
+	if (g_test_subprocess()) {
+		config = gpiod_test_create_line_config_or_fail();
+		settings = gpiod_test_create_line_settings_or_fail();
+
+		rlim.rlim_cur = rlim.rlim_max = sysconf(_SC_PAGESIZE) * 100;
+		ret = setrlimit(RLIMIT_AS, &rlim);
+		g_assert_cmpint(ret, ==, 0);
+		gpiod_test_return_if_failed();
+
+		for (counter = 1000000; counter; counter--) {
+			gpiod_line_settings_set_direction(settings,
+					counter % 2 ?
+						GPIOD_LINE_DIRECTION_OUTPUT :
+						GPIOD_LINE_DIRECTION_INPUT);
+			gpiod_test_line_config_add_line_settings_or_fail(
+						config, offsets, 2, settings);
+		}
+
+		return;
+	}
+
+	g_test_trap_subprocess(NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
+	g_test_trap_assert_passed();
+}

-- 
2.45.2


