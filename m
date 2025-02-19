Return-Path: <linux-gpio+bounces-16238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D95FAA3C476
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 17:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B42E01893BC6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 16:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B461FDA8E;
	Wed, 19 Feb 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyYlpOst"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3135D1FF1C9
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981267; cv=none; b=u0dEiGab9l7S/tOwsnfwPOWZ9LJtt73pAgUySBPHgVwUENpIEMR2Qib4rtjbTeYPqdQPUt7C71M16WDqVq2r5pEmDL7DpigXkQCqUfkdceEwj7okwyCl03EGaXmeNYMikrADZ2urGCfYab7wXC9bQJUV59Z3XaYDYiDEqf7y1NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981267; c=relaxed/simple;
	bh=89lZXX7UtUy4dXruaT9C/m9QlMFAfaaetDqss4qz67Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jIZ8isINJI9FtuLJW9shGJgJNu4vO0E1r6DZNTOxq9hVmSr1rolLUPpxYY7ZWnF9EBFVdinkthOpcX38dqgdHNm09Hy1f9IvADX3Caqv0Yjf7JkcRRMqAbizujVy6O2SDPRsyUl4jktGAOzTlT/YUkxxpF/P7mRU2YFDvzI6VMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyYlpOst; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220bfdfb3f4so141304095ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 08:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739981265; x=1740586065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uIfivSy9LTT2fTPW9/VVixOpomuXwOv0l7ZVWMzLQnk=;
        b=WyYlpOstTGK7gBLM0HuKDeGqbl7PvaO1I8eH/vVBcIfVn3wHIHKQlpQQW/wPLOE0RI
         LUjKlH0F9BBaPwgVHXxUyKqr8x5ja/KO57e9ere3pDzz3ZPCiSaQl22pBUoMj+BhO0+I
         DJ99HK3jAXHBxt786ZK9+uarwanuLvF3gqvV+DWhaU3mINN+4HAJX9AsCpLMAcmhiXTJ
         sGPeRLoEVvPhCTVaxkRRSUjeZIEEYwVMc6ctGreC5S1dBGDuvYF+tAQk+EMXEDyvGCUa
         48ls35bEikqPVBa0CvusXuoFOA0bLDCeZzQiAK4fCTIBaBjstdEREFSPefuVrV2cbRej
         3csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981265; x=1740586065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIfivSy9LTT2fTPW9/VVixOpomuXwOv0l7ZVWMzLQnk=;
        b=qzoHuYmsghfMBdUdql0A+3pWisoPiEiV+wgUvaysqXdT9KFR/c88vaP+XRg+U61Zu1
         OKW3Ps82wJ48+Qz47oXWdDFQAQquiZdsZ6KCVt3Dgsme4BJ0ocylZPlOhSZrIvlUwYWN
         ieDcHWYSzU5IYTmAMDxnJSgZn7SCN2NxlHD09FzmEyichtam1dGzambeUOfzhtl497mb
         kx0ULoC32TIGyDAaYxecxWylDhSCkLSsFpFqGrIfhJJEB/2Bs02/uzs1xHKet1wAgQRl
         D2DckUOpXBBtFk5jE2Vjf/O4IPL4K90/P2VU73d32UT/Xse1vpVeCW0vvpCY1RqkO/4C
         hdDA==
X-Gm-Message-State: AOJu0YxZzn9wscFMKI3kx7WCSRzdj//hpUKmrVpROp7QwNiU3ENovZ/1
	9CNqNFbyZ2L+4JPanJd+VVVZI/DoqfDcrzlyYiqiT6WVwnbwdhHThHilEn7T
X-Gm-Gg: ASbGnctGtrqi3+T6r0vcw07CK59kqAM1JdKzGVP/w1yHDtvO3jrjOOIRcKCRsckETD6
	F9efxW5tCCHuqesnth6rtMZyyfM0Kau89LJp1gfJhSrqr8NXoofTE2fy60Z7pF8RUqqyZg4DGYK
	ky99ifxKfT+JCSTf8b+LZQtVYdAYcPPvVqFPJWGz4x61jqFEiAZU117V9JyP7oHg+3BApFbgsDd
	kskCGyiftMFDKX86CZGShuF1AYTHgO8D+1NIhu39qKQ92mgrolKHdh30M3ExcGm4uYdpbpJ1KUV
	+ObR9SBNu8/eWXlgTlGvWluB/09UqOsKm//jjP/O8JBo19hUnY4Cp3PoQGSOhNGGsY+2ld0Unc/
	axCWoyiCJ
X-Google-Smtp-Source: AGHT+IFEjiX4+Rm9MxhwY9KwsgMNcZRJuv9dj3lpAOcZiO8yU+6ddruSZGBCVTBq7w8E4t3VfXJ8AQ==
X-Received: by 2002:a17:903:1cc:b0:220:d272:534d with SMTP id d9443c01a7336-221709651fdmr62725445ad.22.1739981265099;
        Wed, 19 Feb 2025 08:07:45 -0800 (PST)
Received: from test-suraj.qjz2hk5f2gku1a3adsvczrat5c.xx.internal.cloudapp.net ([20.9.134.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d558527dsm107196275ad.219.2025.02.19.08.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:07:44 -0800 (PST)
From: Suraj Patil <surajpatil522@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Suraj Patil <surajpatil522@gmail.com>
Subject: [PATCH] gpio: gpiolib: Use sysfs_emit() and improve sysfs handling
Date: Wed, 19 Feb 2025 16:07:42 +0000
Message-ID: <20250219160742.162054-1-surajpatil522@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Suraj Patil <surajpatil522@gmail.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index ca2f58a2cd45..caca5dcac6ac 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1160,7 +1160,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
 
-	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
+/* sysfs handling has been improved with sysfs_emit() and should align with gpio_device */
 	gpiochip_sysfs_unregister(gdev);
 	gpiochip_free_hogs(gc);
 	gpiochip_free_remaining_irqs(gc);
-- 
2.43.0


