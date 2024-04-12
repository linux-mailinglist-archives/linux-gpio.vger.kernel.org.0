Return-Path: <linux-gpio+bounces-5423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F68A2E38
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1031F229D8
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A9F56B6C;
	Fri, 12 Apr 2024 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0QAm5c4e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537E56B68
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924909; cv=none; b=BiAznBW5AyNv74YUrOa4+2xUYpXxWi5gakeM8sByUPoEZuFoIJjL+lAeebgd6YDCksLWIcxTEvDl8oBv0Vhb25ZYo91JNW2PsPhhe1gHLKIizmnHSn9J8o9tDAaIH1/J+ko+zifcFFC+ooPbvE0K7Tbaa9/0OBggIB4uPoZr6zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924909; c=relaxed/simple;
	bh=cKove1UURjCwhTMnx0slcFsBYdss4GJiRfyd/7cWb/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L+gByZfJmeVUFD2jpUh9MbwxIEeWyXMTmqnCa70woF7chf7FM9+F6mVIH8kWc20KHrsuJgYt0nVBK+Ci7ehdJxCPL0wnUiMuOQw8OVg93oGmwv/pStLUen6HUGY3f9bgql0wZQhlIbBYuydkmqQ6SG2qS62jvRau4eRvlGes8ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0QAm5c4e; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so981687e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924906; x=1713529706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RczXTTLfVEzn08QNKNIXVe9h7czyyPMsPBQIV3Gb91U=;
        b=0QAm5c4e55Gc7XLrL7l8B+Zy0gx7JOQ6HZN+wTwzzc+bRLMwOp7jdMrhqZy/mp3DZn
         19Jcnjzql3E4puAlMH312CBN9o/rwHJZvJb6mJ7abrs8I6tlG5dUty9kp2iJ4zMrbWQY
         qhE1c8G6CakZDFr2aLf5Dkq2rMlQt6DziwHTfQJ7wp6rzaiB1Hq3NROqWUg3wrKhfICg
         bxxJCD3Ovn5KNhSrjp7037qFiyNySZ4cZ+oxX1ZfKXEduHHJKNZsiGyA3s89kcrJuleq
         tTdO5C5g3Qz672xPbrIPwlZ94B8Y2WH8PdBUeEX4PXh0WwsqfcmX7Tq7dlvC++8Zj+r/
         fomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924906; x=1713529706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RczXTTLfVEzn08QNKNIXVe9h7czyyPMsPBQIV3Gb91U=;
        b=Ah6PixJAIQEEuQ9cI9//tk5D5xVTqPekEYyO8KeVqh/OqkxVv7kaZCurs8fQnJ4Y0f
         NA1A8GgH+9T2cQX7E5Z240CrR1rMaGK/RviATNIqUuBb65RyheK4LQy2ts8jiCkuxmUR
         5hpw68bF7x7f+qooHuHXR67JbHtYAUCih+vT7caFlLG5+d+9PMwm1Kz7mV2ar5s+swuF
         bDddvFhaePOsWWcuSUphTFHVJ2zdF8TgH0XY+t2rumv8uD4jXkkyDmBsmZ2AEHc82IGB
         j/+2MGTRZTs98MR3fHP19JaRaLhopSIYA2dr5b1TZyx9xt0gVi/qJqGKhKCHwLc58cAO
         Ugkg==
X-Gm-Message-State: AOJu0YyG2AG2fnvR4L+I9TqKytVqnO8KRgPNFohLs4WqjD399tJiX7YA
	lk/ALWhqHPmsgRA5JRZBtdaTB9PNJqwMFYQUwQP0h5MxPD9zLudslUbbGMefdKU=
X-Google-Smtp-Source: AGHT+IEDh3VY+fTt0cSBjepgam2uSHW178AsNThG6h2pXhHYgfpOE4g+rqG2HThPAok+eRinuH9zQA==
X-Received: by 2002:ac2:4c14:0:b0:516:ace0:9a75 with SMTP id t20-20020ac24c14000000b00516ace09a75mr1665692lfq.23.1712924906568;
        Fri, 12 Apr 2024 05:28:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 11/18] dbus: add a wrapper around the gdbus-codegen generated header
Date: Fri, 12 Apr 2024 14:27:57 +0200
Message-Id: <20240412122804.109323-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a header that will be included by all the code using the automatically
generated GLib layer for the DBus interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/gpiodbus.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 dbus/lib/gpiodbus.h

diff --git a/dbus/lib/gpiodbus.h b/dbus/lib/gpiodbus.h
new file mode 100644
index 0000000..69362f0
--- /dev/null
+++ b/dbus/lib/gpiodbus.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_H__
+#define __GPIODBUS_H__
+
+#include "generated-gpiodbus.h"
+
+#endif /* __GPIODBUS_H__ */
-- 
2.40.1


