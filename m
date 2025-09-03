Return-Path: <linux-gpio+bounces-25505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6616B42057
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB2C561151
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5371130BF62;
	Wed,  3 Sep 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kyLZcjuM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA3830274A
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904532; cv=none; b=GlM383VVeVNZrt/HAt8ASgsTi1hwtIo74DxCUFlivM0Wz00gP7NaXREMStJUlVLNEcTtvl3WuOZOKTGh4oqxtLyKdSVFm80HrzFxfKvS4alYFvsjXtPpZtxXbjGaOIxJg2WaMt3OJAvI51IKtY9bcMNkO8oH9vcG0Z7zBI9nlxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904532; c=relaxed/simple;
	bh=0HXkwQrA0TbuDOePZdkXPnM19ifTDWhxRFzjOzAqp1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOwX3Ow8uyFQMsZWLUXIQeXhGhsaZL7y+UQS29LI0tDkSjNdVnLQyyfnhxPLJEet6K8zoC1uslA5ELX+XDL7WL9nCMBi1rVNzB7YY2AJ+bseNWLX2DO7DNql/63t/mjKihZR1Dg+LX4JJ7QW7ZNs6SpNfN/aNe7/pVubQ1DrgBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kyLZcjuM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b8b8d45b3so31433815e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904528; x=1757509328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsAR4bHATJNCX4yihevo11kMN+FfA7V209fhDlNgfBY=;
        b=kyLZcjuMsgpPcONI2o7RW2cxSicE2qGCVfb/CxXoisjm6csrKws4mFoIPEy6N+Zg08
         ibUch/4IIXBVmDlets/T2oY/7lR8KfX/MfxHWG+Q6RT7UkI1obzZIqPfykZo5lk4erVp
         nlbCrBGyqDUueyqrMUI2wUbOIDt+/2u0AmGQOsS7XS2wZLoY7aO/2+Wobd2EToRrh9B9
         owkKcCXAi9vFCB4nL9iLwdlEr/i+GejMHkVIvKfATLFycfexf8lSBjsb3Ft0q3n6bJCg
         MUZRqqQBdWkYurgjqR3c3ECoD66/5YZVlmPoSQ4IsjZBbKEbX0m7ZT+XzN2R1SYxfHT/
         d6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904528; x=1757509328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsAR4bHATJNCX4yihevo11kMN+FfA7V209fhDlNgfBY=;
        b=UHMhE0HyYxL6ZXYuD6Lv1vSJYR/DVARsBBAdoRvl+Tqj/cQeCDRP3cm1d5cF4G9WD+
         sBvkaOaONl4ZMiO7mFjrd4rjs58k+4+Y4ir6PpNl4APa87K4dZVDxuItcIpAvxLRYPWR
         +vOUuGE6PUkDxfeobtFbHt0jNQBrQFE+fBXnwXJocy8eedKzPttGDq6DJL0EQNlgThJI
         OTzfmBKmVZJmtHlB0iPKCPrg8hWKtGQj3J67kKofgveDu8pGpFWGuy6cQYAsvLGD24zR
         awf1DunJ9W8iKmub1zRKG08mbgaEXAzq160+I/2fKObZXeHjMi0UsMdafuvk9QUNSuxv
         1vJg==
X-Gm-Message-State: AOJu0Yzq7/oZqAjzvhNf6p9LghnGvnxumPJ9CBSjO9idcQhAIOJWU73N
	zgeLF8dj0tWwyQep/8fYKv/7myVUzT5Lrhe5Zo29683nrBaADbBpvTZt7ZiqGjLZ3oI=
X-Gm-Gg: ASbGncudwgRwLJL/E0ZthfnV22Yjx6P+pytrgYGECxxRzztrfQKYFqQyq9FpIBqdrpw
	VoEWqBy4haGZ+nWxR5uAUerxBa8CvAV5xL1Uap8OxvAIAyAVn2el43BHDekmaMRaR8hhQ4kMnNX
	MZKzOPmeTKLaFOkGt28+v7l651PmIylRmWrsn1X2oPgUzsiaINY+QfkVVLznXGi30zM2WVKWwZh
	924ww+NyTU0mYFWQPUzSTcEvH9FJquitXSQ/SES1lOHPJCz3dFJ77LHOewOW2cQPKUt5Ak8vlE5
	I9g0TATzp6jAw2ekFqoOSvFCLEF1mTyO9iFj+2zTzhzW2preeCLJNeHGPMGn8M7SbhAjGQdG/+c
	8OzQo/VrK3fEtl2GP
X-Google-Smtp-Source: AGHT+IGNrEzBOMDkDqYnal4CqK1HkrgEgU1BCGBWnNlrVpZqf4vwh4umSaZ4R7lAAnEjKvH2tMr5Ow==
X-Received: by 2002:a05:600c:3f0a:b0:45b:8703:741b with SMTP id 5b1f17b1804b1-45b870374demr119508805e9.32.1756904528425;
        Wed, 03 Sep 2025 06:02:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 15:02:01 +0200
Subject: [PATCH libgpiod 3/7] core: change the behavior of
 gpiod_api_version()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-api-version-detach-v1-3-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=651;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TnAaxAc39yIHkT3YCRbK2/BwZOBpdIMubWsmf334A7g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxLgdre7CuKRMcqB260WHHfZKZ88RrRd5RHr
 XVKzHuGT7uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8SwAKCRARpy6gFHHX
 cji1D/9pRHUWsoG8Vc1y+XcopAJbkuHHcxyV7zCLLCmB2JpdPKVn/r7DKbMw2vifvVnUJNU/eis
 x3YA19FF1jenYmtG0TmkK9WEfECpV21m2wZEzJaPWtxFOoBQXaY0AJFBtj53cecqu5mhLsq1PZM
 J4T8Q/ExoMWQ/nm0J7TCIi+S6ENbv/U7P8MvGicdkMIdD7OasjF3i5CwtIBDVcnaWKUm42J7v4U
 57n5mK/aOnrLzotu0I0CXjbR6ouP8JbtFX/EposhjM/naEnRImAEhcru8fBvUGDqvklyoE8MLct
 b1roi1fVr9SpHsms4WjDwlmanbias/7cIZ2uhGR4nnQjfv2iy0x3PCEfybE/RtWsvV39lygYAcJ
 AS3zFLxSX9vuUGlkbILCXYdHWG7wUDIXm0y1KqyAtA9THwMc+1J58iTf7fmLimHjSEQimPYQNBO
 yl8KVxPsju0X5ADLNp7yJxXAhezmfup2+B/4AvmHJE+bfSavPO1VocPJHhYH2rhFW//GEa9VeiU
 8QC12IcjIXfSOf/VW+BOut0tPGy05LOjrYmfhALgiA8Ddlt99ht19lAM3UZm5aUpjtoeKduba2r
 Ni6FoVHREWPmrlP9E4lB/z3xXoDFiQk2Hzf0n/sUUtMBws40c+pRaq5u9RgfFs/W65YJl7zNr0L
 AUGrdvf45LwQOug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make gpiod_api_version() return the human-readable form of the libgpiod
C API instead of the libgpiod package version.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 lib/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/misc.c b/lib/misc.c
index e109f8086b4c22edccfb5e88b89e4bf2fac4feee..33d68379032f6dfdc17d40c13ac08a5d911dc93f 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -12,5 +12,5 @@ GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 
 GPIOD_API const char *gpiod_api_version(void)
 {
-	return GPIOD_VERSION_STR;
+	return GPIOD_API_VERSION_STR;
 }

-- 
2.48.1


