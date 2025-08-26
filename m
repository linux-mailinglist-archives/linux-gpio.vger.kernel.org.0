Return-Path: <linux-gpio+bounces-24991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBAEB3717A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 19:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C3017C0036
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 17:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAC72D3A7B;
	Tue, 26 Aug 2025 17:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QqKepXIP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB030FC35
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 17:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756230091; cv=none; b=asDzgvEL7gZk+vnlV/fZifzW0X32uVPJUOrAI+9n0H8Cwr8CtcGhQEYgZhJf40twoMt1AHdhMsxl4yjnX9wcUfSn+YctoChOOvsViS5TqB71bwvyFWy2Jt8NxoB2TQdoLaF9qgyNClWVSJJo+x5wqbNOkf4W01/OFeKIeCJNq7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756230091; c=relaxed/simple;
	bh=f1qxlCijfDBRYgRzruliBw82t29Lz1PLscG1Z922H6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxkgsFaCKFJdTE6qHEdiCzQiCqMB5NxicOTpd6T/Y61MS8SouibExJhWZCsD5x33TIdYg7Xj2Us+RLFWDqd0LdPSnbAWCxR1xH5eQAa8f7C+dPaQbP7ZAq1XFxF1sjr85wWub6D6XU+zLV5ijIp/1aV6EVsyT6urhIofIdB7L24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QqKepXIP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c79f0a5fe0so1943653f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756230087; x=1756834887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYqIyh5QKvFdymMz1ef1uQto6RERJffQ4wVRwKonUgM=;
        b=QqKepXIPPHZLZXqJBp1VtjQ+VtAhOJKZiOe6GoGTG+qrXJ0moqqhMbYcvxFDmqefzK
         33QhGy5XBZo5KssoPA+nyNQl7AQJd618UxEB4sCnPHr0w0UQC3MX1XwApKDsCi7oWU8i
         //iNneI7Llb0bUR4gNYzvnVbceGIcKlc9FeL1RWYiNRHjccfLX1Olb5bS+atwQORndAJ
         Hxvry43AmGrK3RqMLcgp2ZhGC91o8lmzGiCZVVURB1qnnoUrWVLMvlNyIYAiODBGPwuI
         99/xPhfBF9+WjTa8Tu9e7CKUdDEvJWY8FENB2Qmxa2eoIuOhdhVMjqMy2txMIKnaikgh
         CUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756230087; x=1756834887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYqIyh5QKvFdymMz1ef1uQto6RERJffQ4wVRwKonUgM=;
        b=tn7UoVjEo8YcgBK9te7xeq8Iw1CdN1/XSvJhO3ti/wdpZkP4Q6HeRL7EGSiz7vk+U9
         89xCvEy4huU1T5EZkfWaGuBy/rgJwjAUv4m7XfGKaW8ySbiKgSLu0zVMcfQ+G3WsS28f
         DHhQkeRUdlFHLoQrB2hAARwFOeWgM1D8p4hblS4CN0td6g2saGSmrMXMBndzwPX0ouFR
         4yvnQNs0E5X9QFgviuzJKH80xyNRYzyHsPTJHkwF4sP5oInqMOwhw6IJyNhtfcL/Xudj
         N1zfIAlUz6hSXbJCLOfT482CqqtNJ95ee5g/XBSSNkI2dHYJwu8QIYM+soqfmRLtxJ2t
         EcJw==
X-Gm-Message-State: AOJu0YwB+7ft6OZg7klkGrm2IQzb87kzI93sVo6Biuf5n75Iianno0J+
	HiZ4TWUD6BBkvS3ivgq25enFpt77kfDjZcSNOPo1UgrK9/1QHakHPY4vaOgz/339ZXs=
X-Gm-Gg: ASbGncuR/2UAm40ge8HHC+tjfG2+VakTa61R5RWvVT9IFEQX9VZnBemOWnSZ0tvzs+W
	cYtxkjBLwdtNdbKAkYO53QzBMC4gtP/aGVuBw7mv1TmDjpEzX82ActQmzIJ0yaIj4BDaBnks/Is
	5gIR0KPiCwtm95Um+Cki52gGMnWlVdPFKd4Lr8FZyZjOHfoZ2oZTXnscHm9eFaq8gr9zb21v7ug
	Mlro7bq0njQ0YUQ8bwfRSG9TSISArYA1gIyY5mMlume7uf0kCXPPgxOt8N4R3pHxsNc3MDU3+cQ
	XO5Lq7RU7i8uSsKioFQScHP6uXLQ5qFsmd1FFEJI4NKsW/h2LJs5A9EgeiHAiDOHUym3w27527g
	6mcfIfAXXw/XiF3yC29lozBwAoAvIWeczhcE=
X-Google-Smtp-Source: AGHT+IFjJMWTkRj/gY4TGS50a/2gp6uIyMQwCulhIe6rYp1wa3S6aHH8AWqHtg6MxmCJZYRDud7sdA==
X-Received: by 2002:a05:6000:4181:b0:3c6:cb4:e07a with SMTP id ffacd0b85a97d-3c60cb4e5f4mr9436309f8f.30.1756230087444;
        Tue, 26 Aug 2025 10:41:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6b1cdf05sm3300465e9.1.2025.08.26.10.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 10:41:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH libgpiod] build: bump required GLib version for tests to 2.74
Date: Tue, 26 Aug 2025 19:41:23 +0200
Message-ID: <20250826174123.56862-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Since commit c116b6f6f118 ("tests: add a test-case checking line-config
memory usage") we're using a symbol - G_TEST_SUBPROCESS_DEFAULT - that's
only available in GLib v2.74 and later. This version is already almost
three years old so should be widely available. Bump the required version
in configure.ac.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 9b6c862..fe96739 100644
--- a/configure.ac
+++ b/configure.ac
@@ -157,8 +157,8 @@ then
 	PKG_CHECK_MODULES([MOUNT], [mount >= 2.33.1])
 
 	# For core library tests
-	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.50])
-	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.50])
+	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.74])
+	PKG_CHECK_MODULES([GIO], [gio-2.0 >= 2.74])
 
 	AC_CHECK_FUNC([atexit], [], [FUNC_NOT_FOUND_LIB([atexit])])
 	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
-- 
2.48.1


