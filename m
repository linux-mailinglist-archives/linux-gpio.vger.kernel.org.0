Return-Path: <linux-gpio+bounces-8273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C469F934AEE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 11:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFE52817EE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 09:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7142E824BF;
	Thu, 18 Jul 2024 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0ecbnZL0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3928175F
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721294943; cv=none; b=nJmO9wZrI/mhrDNi6aOvyFn+/xjrms6ioQ3sD8R06FgSHPYZL24PlIx0lQNVlYDbuPVyOnsm3QAMw2vCy2PuLRgJWQphw+W7jhfA9ohLRGUV3nLzY9YAa1HaS567wVjeUINxnmK0a1uxOXncBXqyAalF8pIk7Mi2Pn2CqkTsP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721294943; c=relaxed/simple;
	bh=cKZGrYTO1B+5ZM1byDwrEV++EQVNLlUOyKBh1zx5B4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuAF4R1j+Ww+lBqri0sVkcV8QTB9eHGNX+rrygFyq3rAG9mWUP7Fn3tSBI5qUHGIjQGT9LicC1YTixB+rVJGM8HIcSp7289bB7PzlmbZ/1GhqHzIRt5QfG3XxnxYA4+UxiVAtOwhB0yQpo1L9YgLF/2T876pjMj6T2RiiUBlAMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0ecbnZL0; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-36798779d75so560123f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jul 2024 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721294940; x=1721899740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUbQKwssYICDEm/Dx0g9d2o0je/YbN4psjkIGP6L5Fk=;
        b=0ecbnZL01K0pctiHSonv4RrMEb8RqgALy0saivhWcNeTSFKIRcnfz9FmeY6pcJL/ju
         eeXSCOjGu8ERcpIu90xGhO0m42t9C5FdgMS+JxZwM+8LZV2m51w7iozWQw4GMCdI3wRS
         vwKrs51uvdKWyCHEVGkGwsm1Z7pvGH7MMohjgWz70RgELfU4jeiU7MqJRFys1DrP7Khm
         wIWcT1pbtWgyRDu7NkhgB0FyG54xQprAcBhKLan8JwKAuFWAAdegI5K/XiR9EGCUDcQr
         cqbcTd7pcSrH9S9R9T+0WXWCCcBUyOu3IJ+y2d5AI3nOocc1sz469XAt01kSQYVUN+sm
         lQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294940; x=1721899740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUbQKwssYICDEm/Dx0g9d2o0je/YbN4psjkIGP6L5Fk=;
        b=TqrO6xeTd/d6BQ5G9CBXeuE2rSZXGCjwI3uKlbB5ViWbgKZ3HtCUouafRNw+YsdiCJ
         93OOmPVb/gaFGKRvaIuJxXFwTTy1ray+HAeDeOsXeArs8abYTtBupdT3kQoGExe4NbWh
         vMwkOos43zCcCUlZ8utzw5WUCGC2XGPazikSV+fcpeYCk6EcedWtCrj4je4dNj4PXSK6
         TTkaVovdQo4z1WRZWcMYu1ipmp7bJXpPevpTmUCv8lLMw5NlKDs9nKxAHtEieJ/s2JuW
         47ThCWSwAxI2qx76XsWTZ972Zfx7nmxpb5B3/wH4rTmkMr3iPUpZU+Sye19a5z+8C4go
         +YQw==
X-Gm-Message-State: AOJu0YzdYhSPsSOVvStBa0fbqND18uG0LEE6iHLVU+RQGZj7A38JNEcK
	QxKdimezBJZogNmLKs0TjpWHfU9R++F0768Xzj8hN6GpygKzqPjIeJimjUD3E+M=
X-Google-Smtp-Source: AGHT+IGFSx1iSKhnX0a1/Lc54hhVf0GW76KZ5KKzGGS47dQEunUrIy16T8GWPav1XvqDo3hDqRUnLQ==
X-Received: by 2002:a5d:5b88:0:b0:368:5042:25f3 with SMTP id ffacd0b85a97d-3685042268emr898507f8f.34.1721294940033;
        Thu, 18 Jul 2024 02:29:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:58d4:2f84:5fcd:8259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm13792849f8f.104.2024.07.18.02.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:28:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jul 2024 11:28:05 +0200
Subject: [PATCH libgpiod v3 11/18] dbus: add a wrapper around the
 gdbus-codegen generated header
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-dbus-v3-11-c9ea2604f082@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=E7xfc0OoO8rCmrbuafNaSaM0N/X8NsOSUm8udR2uWxY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmmOBAPGy5WnWCSC20ha8GiUKK18sv2FJbXZx+A
 u+oLdTsU5OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZpjgQAAKCRARpy6gFHHX
 cnz4D/9vVKZRwxMs0Flmly4Bt3pFn2Ij7UjrhfYeoR5ReOaIhSBARxqQlwA/q9GEyAHmzDLyHaJ
 +fn8qCGW+WrTSh4Ok/WN546mguyFrg5ingRVH1MvGEGskA5loaawuFIUoHwoSIDHSkHM92gP/lH
 azYKhJGoHaMJBaUlOz9wa0Cuf1H0lCcA8iVV+a47WwWj7U9+IKfyGne0YIlrcxymKf+Hy0eSTHC
 KpX7YOVCC0vyPB7k1aG5oWyGJZUJzjvJStlv2dRLhP/46SbHVCamrqwxOtsO1CPNjV3b1JUCsrf
 86BFnxB3GsH7Tci/YHPL0x4pehvO2NtYQTX4Zlm+wY4nm/NDfiU2+jnwgXpbYI3H/KidlCCrriq
 Lb7jJeDH2UzsBXnFS46qPuj6htNguM/IH8Eu9LSkgzJ0CBn2ZHzAgw65PG5hgsKNvOOuNhmez58
 0/IghBOqCppXTtrtt4Y1/m2WhuGK2XgFPl5YLCe2SXAD/OJLsrH2zk3SIQnDP5Ex6Zo3aS/kytX
 02a0EivWtZnUh8YnIrpSW3N6YAu9zZfH9ZZV5Nz1PH6UCLrTAoG+8Tqe+TcSxFP+QtpZq8mYOLw
 14IT2FeFHGdn9OdFQCJ4FZf78yOYwqy2hDclOdyvd3zfUjOBCPnoWzM4R3gmSQccjtarNT8wRZq
 6a4eaqoa0LRmJGQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a header that will be included by all the code using the automatically
generated GLib layer for the DBus interface.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/gpiodbus.h | 9 +++++++++
 1 file changed, 9 insertions(+)

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
2.43.0


