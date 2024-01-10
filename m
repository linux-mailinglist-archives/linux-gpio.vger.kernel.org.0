Return-Path: <linux-gpio+bounces-2124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F782A24C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jan 2024 21:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C1DF1C21B9F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jan 2024 20:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D26C4177C;
	Wed, 10 Jan 2024 20:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vs9z/HE+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB55B4F200
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jan 2024 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e43fb2659so41534015e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jan 2024 12:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704918750; x=1705523550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4/ezTEXd/AGBE5ik3GQsGbwKaC7ixzvP0QmPnIVxHs=;
        b=Vs9z/HE+Iml7oygN16KpVcLUD5nh3xPNOH4zCK/oqxz+gbqVU9g1d2F/JZLszjYYet
         xiPC99nhFAcUDyq5M0+3zmH3LbTUDGkaZZPukzeWY+vcLskJxvC5b/YfX+3NXqOKLFBS
         JHk3jvW/XGam28Fz6YY0V9GCah8zB4QDBgCI/gqaBvwtlqVtgCAU3i8LinYCIBtdP3Gy
         L22NFuyW6CPCi/0mOwH92amTrcjiqQUq2IBzFxVQVpfn1yVrRJ9SsDPIcGThMI13qZZN
         +3ZWz6xNuz7N3ctV8xbOeAGJiL2nMLXBQbUpvjOLFxjYwvy08qt8BcYIwwWkqmOl5o4U
         zxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704918750; x=1705523550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4/ezTEXd/AGBE5ik3GQsGbwKaC7ixzvP0QmPnIVxHs=;
        b=ef0rUXrNJr4xOdl+il+1lj3gxr2C+X2p3R0dMtiZEhV4L//QY2SLptffEgDPMTrcT3
         mM+uxm1ylk1jBrqPmMFq1xgegvlbdI2adPX69ntnDA577ybWk06v86H5WeQGm74L3m9k
         uhc9AQWo0fkwsww+s2bTmdDF9LALA80tUiguL0BMS6MA0tRLBnVXSeQDGoSvtCfWTdun
         KuiEm2ySmSPqh+yFjr3Ud0SeF6MEBl05/GphVtSFslw6pr1a8iGBA31a7wizYHQokV8A
         vPB84iqKcGq34TSGYzB2+0YFn2tpny27xcm7dZyd3VV2HSqilTrw4ILH7tJuna8EaNpo
         /MBw==
X-Gm-Message-State: AOJu0Yyr/0hqp3HHzEd3dOzH/Vv/gwkJ6IOo6LbDlezW8QlD1HDxxrVh
	V1Eoz5FydUdtZnCzE8kMCXAhTdN7RWfkYg==
X-Google-Smtp-Source: AGHT+IG+Jh12VyGYmoVwBM+LMkw8YhuNMET4WndcS7w4Xu8ew7js3y1dau1a7gKopoa/qzRbjPgQ4w==
X-Received: by 2002:a05:6000:372:b0:337:4758:43ef with SMTP id f18-20020a056000037200b00337475843efmr29206wrf.66.1704918750199;
        Wed, 10 Jan 2024 12:32:30 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3342:1411:3dd8:cb70])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d44d1000000b003377e22ffdcsm2072172wrr.85.2024.01.10.12.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 12:32:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] cleanup: provide DEFINE_LOCK_GUARD_ARGS()
Date: Wed, 10 Jan 2024 21:32:13 +0100
Message-Id: <20240110203215.36396-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240110203215.36396-1-brgl@bgdev.pl>
References: <20240110203215.36396-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This macro allows defining lock guard with additional arguments that
can be passed to the locking function. This is useful for implementing
guards for nested locking.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/cleanup.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index c2d09bc4f976..921db45023bb 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -246,5 +246,11 @@ __DEFINE_LOCK_GUARD_0(_name, _lock)
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *_T) \
 	{ return class_##_name##_lock_ptr(_T); }
 
+/*
+ * Helper for implementing guard locks with additional arguments passed to
+ * the locking function.
+ */
+#define DEFINE_LOCK_GUARD_ARGS(_name, _type, _lock, _unlock, _args...)	\
+DEFINE_CLASS(_name, _type, _unlock, ({ _lock; _T; }), _type _T, _args)
 
 #endif /* __LINUX_GUARDS_H */
-- 
2.40.1


