Return-Path: <linux-gpio+bounces-26966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E05BCC6F8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 11:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D3864E237A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95EE2ED161;
	Fri, 10 Oct 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hO4xoOJL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A32ECE9A
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089798; cv=none; b=BPbOj+t+jnWYHkE93UxoKNiDbFSSVsTVpK3XLvWAEoDJDkjYiXfYeRdeaii1q1lgPjrWIpvN2eEDSXbZsHgCwc9AKHHO+SVXXTFCtTvcF9KYuyNaI4GFH7p2r9J+Wtx2N2on++IRIHPx2wRUP/NK+wyVFEjhrHoMVBL9C4Iw0CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089798; c=relaxed/simple;
	bh=5GymtkM45oHIV0WjFahj7ss/IavDFdPPMM/8OfQYuBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtsIpoRSzyMx1HSrbv2+BfHTDn9viP+t7pt6LbdBpGeLwJ+qjOHp5v3oFSAWMQ6y3W7wT3uz1bR26lnp4GE4nP9WIxc6hRjJexo1oGUu8ZtU+hqUCYGpb/sZWZtVrAVOBZNRg5pS4nms0+mSCQwOke48nm//zedpbdz53q7SMBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hO4xoOJL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so18539005e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760089795; x=1760694595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1878e2qm+M3xSoED0XQ/A+N2QJY9QZbPdyRDb1mj3GE=;
        b=hO4xoOJLKmFiOQJ0yljGEvfWFzifW18WnhFUasA8FE5ZWhmEqY1dmOi99zKmShPsel
         5nw/xgQowIpL3Ll4NAGnTj/M+qB08x8cQHVoMwvHsNc6Bw2TGSD1g/ne/hKTogy2oYFh
         a5NGylZBQ0+3wJ5UHMaoF3nmERHGe8JlmYL2GSx8BCIlN0tNlFuvJSHirHIQPq8gEOXd
         eNUURBv9UBW3rGIlk+d/qWhedreIJP1EHfk2sPmglE+7I6W5u4vTp7e0RsjTr/+aCnJR
         w4KsbPE1/dr2X6nmYYr4ndhJul2/0SsK4592c/WVV9IyyCqpxJRMY+sfLpQ4rzsiHzup
         DvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760089795; x=1760694595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1878e2qm+M3xSoED0XQ/A+N2QJY9QZbPdyRDb1mj3GE=;
        b=wYioG/NRDodHDYL1fMUg6KylR62EA9muy936cq0mjGPcSoAfcX3+40MkLFYqYjn9/J
         yfXkk9MphYdIolvFyX/qu5ePHzGW6aa21ikSiVMrGqc9Rsg+IjQuqfpbrp0B/GW86Ids
         2s9K1LjcN6LM5A+QplgRuapgBR2MiYrMctIxRFaKh6Q7LqsWVnSI8IEy4Q5s6T/tUnZN
         zGCfjLhaZwnu3GpGb5oa4GEt7UR+LVJxuPT47fPi6TkT0qmhYE9iHDOU/VF/+CsnnPam
         3s+CKOLbo0Vf8jhmNld1UsnHvPdXquLzKhzvMHiRVBY537A4XEoJlzV1E/qptrIt7d1V
         cCAw==
X-Gm-Message-State: AOJu0YzA1f2FnRtPzCvFwbDTPB2NjDxCwRjXBa1+0xl92FvB8kVhQ6Rm
	C5ndbneNDZxX/eccnSzOPJO39mA3fXlbTPauKrtQvakClTht63H3rAeRJ4dS4XDvtv/m5W9Pdq3
	rqS12asSG9Q==
X-Gm-Gg: ASbGncuAXpsJCXIiahKF5OfW2sY4g4Tl+gN9qnSuZh7tkhWefj7YVrHusFtnr4pCROa
	6dps+aEYK/AtHyJjv9APzZRYyptLNXJOGM0CULQ7spwuOYScp0lTyRIR+AgZCXb33Psj3IHu/GA
	b4mI1B5BaH7SYp8cbFPuGFzOcRywmr4PRTS8ug2+uZN/psg2mgMYvvLjudO64khVajbj0TFBIZP
	oRqRhE7SLFAJa30Yrh20DGQOEnSBruU1wu8fMHd5wIBasoUwuFhksEVnZbnOwmOSfr/CYbnOKep
	PiXCv1Laj828AnsqfJGPPhrC/VcH+fivCUto9GPUMiXE0ZkZPHph8KlbeObi//iHUKiBheLWizO
	T93t8cSzWSwxJ0KwksHCEqmKvpkO1HjaGfhinh0n6/RxVznFds8nW
X-Google-Smtp-Source: AGHT+IF9TX+zSFUGkCzJWV8htWP0V7wbnNV9yUmTViaEaZIhfv7aOIkz51eWLXmJZPjFatumO1VkMw==
X-Received: by 2002:a05:600c:3acb:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-46fa9a21caamr62365755e9.0.1760089794488;
        Fri, 10 Oct 2025 02:49:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d1c1:43d4:ab99:c8a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm57436035e9.1.2025.10.10.02.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 02:49:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vincent Fazio <vfazio@gmail.com>
Subject: [PATCH] tests: gpiosim: revert minimum kernel version back to v5.17.4
Date: Fri, 10 Oct 2025 11:49:51 +0200
Message-ID: <20251010094951.18927-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit b4009e2e6715 ("tests: gpiosim: provide
gpiosim_bank_set_line_valid()") added support for marking simulated GPIO
lines as valid/invalid using a new attribute of the kernel configfs
interface of the gpio-sim module. In the process it bumped the minimum
kernel version required to use it to v6.17 where this feature first
appeared. The test cases we added later only appear in gpiod-test which
is the test suite for the core C library. However with the kernel
version change in libgpiosim other test suites have also seen their
minimum kernel versions implicitly increase.

Since the libgpiosim library will simply return an error in the event
that the attribute in question doesn't exist when the new function is
called, we can revert the required kernel version to what it was before
and allow just the individual test suites to bump their respective
minimums separately.

Reported-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 0d7859f..449dfbe 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -24,7 +24,7 @@
 
 #define GPIOSIM_API		__attribute__((visibility("default")))
 #define UNUSED			__attribute__((unused))
-#define MIN_KERNEL_VERSION	KERNEL_VERSION(6, 17, 0)
+#define MIN_KERNEL_VERSION	KERNEL_VERSION(5, 17, 4)
 
 static pthread_mutex_t id_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_once_t id_init_once = PTHREAD_ONCE_INIT;
-- 
2.48.1


