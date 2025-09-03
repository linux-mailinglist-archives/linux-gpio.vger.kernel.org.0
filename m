Return-Path: <linux-gpio+bounces-25507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82BB42058
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDC3A56257B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610F730BF58;
	Wed,  3 Sep 2025 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oAOUyUvo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C818302750
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904534; cv=none; b=auWmfol9QHKdgowSZHLIxYd+Luoh2G9oLun6E/Pj/JYLihgMMyypNWUczs2s280eo/cYHM2GLS/n9Rj8lg1LpBA4GzAPb7HBgTyGDvnn0ofirWlPEx8UKA4OV60olFSkivrc/jur1JVBy69l9fl6DFZ6Vz58aICWwLgmjBxyC7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904534; c=relaxed/simple;
	bh=amUSCP4QZCz/Wwy/w++3ooEg9H70c5KXnpoD7y/xeMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=awmRxbbXsHl7eSJgI1i3IiaAv8kVrJ3QF7Q/bSTcmS17gL7P1voA3lwQIeh0rvK3z8iSC8VUV0ZFq2TnfQ3i+cOTHYQHEVmA6xKCfyfwtuFlKhgyH2toc+PFtnR/9Z3NoZMNhzadEYbRCg37LEMX8nZIjmKwnLriKM/EdnIi6w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oAOUyUvo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3df2f4aecc7so325956f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904531; x=1757509331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGdtRB+L+dbo3y753z+bN1oNc5JRoTSJ+PeDRq4m2UQ=;
        b=oAOUyUvo5rwI0dOWRRUauEuSSup+YtDEGF3i4X4l/ZycR+1mtcViQja6Mq/GmXyAIS
         VT7dYbInnVHqETdmnphjYcTU69R2vf2ToyAqUxdUg8uN81aQRiJTO5PAKpGUz/fYKhAy
         Gh4dXihDp4h2AMFi/E3OsxL1mChi+W0kKkidEKbKGyBGIK1/LfqIl1o3oouuywhQLOFK
         tgGnHjXUVdNuLsGeQ0ES636wmm3GYSWdTBAeUkJt34/AmfLtW1woeHsmi6FI1ETdYzw8
         kWqFl+LIS61c/4Fag2LxlsUPDzE+hbMNC5qf5FDWrUjOKd4FC+jOii+Xzazu8qq4S8qp
         4JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904531; x=1757509331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGdtRB+L+dbo3y753z+bN1oNc5JRoTSJ+PeDRq4m2UQ=;
        b=GPrQC2ys0nWeR4xinWu84hqz+WVVkTpHdSA2adXvdBHfp3Aga77qJ1F8MJwXeVizxD
         TC/QxJpNRFzT/pOwzbzFR0Bj2wwMXxozXud5cJlHTvlpx37D7D5YIhKGkGB+Zv9lyBAX
         1YnoJluDy/zFxeKsdqEtxrHmCL/PrJ9iPC720vHGCEDZd6B9+6zaGCmCjWZPrGQH9xGx
         QN7/2fBfBrIC3NFAlnW/OS526L9MPUtIX464P5/c+MlKzoTa51WQTfSU6Qd40kh3rykW
         9x5XwdId++pQv0JGbbVm8CCVxzWwm5zXinu3FUC5vQnlkPdVxOBo5S2BS9jLhvcRoIH0
         L1Ww==
X-Gm-Message-State: AOJu0YyYsWzFPOMm8ywwYroYBeoz+CEpJ22nGbxdWt/Juv/lBxNpVlE9
	kCmykm4l6SjT+QJ/sCt8h681WDHAqM3UflIBkqnCqBqpafnlxcEt0jPEdXIWYsIJEHY=
X-Gm-Gg: ASbGncvfMaM6ysC+intByCuIRLEGt7I6+Ap1HW4M6RORYgVfHk9YUuWOtl3zIIgm5/Z
	ZtovZDD1hZLTcU3D8JfNg6s1f/epJy/NTreHwmChWZNsJzFguK2kR6MiOOUCLUmaeiOiXVnXy5m
	Ao/7RN6aDHMKiRI7m4gB0cRG10Z1Ki3wS93dHUck5hWsYdHrkuLgh4U2FSCv3u1ubQ+5kFo7gi0
	FUhxk3YA8ZlzEd4nGIDSdpFlTgGooWIsa7fl3uqpO0Ip3Erb74OHrU+COSczxSJy7V1ehh8f5qZ
	Yv+U/xUWKtYvmIeQUOFRv9ymeM7hzyBoDQP7s+oHgMkofACSfQqmc9fOCP1J1mOOZlLcAZAaXqt
	mBUhQ/rchEB9Dw2Ef
X-Google-Smtp-Source: AGHT+IHJrotbfabmqV243m90w2tEw2c4wfG2MvlMxltnMqH0KC2wolEGwyvMVEDxLokWb6SafuUdlg==
X-Received: by 2002:a05:6000:4202:b0:3d1:c805:822 with SMTP id ffacd0b85a97d-3d1e0b8edd8mr9536815f8f.57.1756904530660;
        Wed, 03 Sep 2025 06:02:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d6cf485eb7sm13280178f8f.3.2025.09.03.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:02:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 15:02:03 +0200
Subject: [PATCH libgpiod 5/7] tools: display C API *and* libgpiod package
 version for '-v'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-api-version-detach-v1-5-027ca5928518@linaro.org>
References: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
In-Reply-To: <20250903-api-version-detach-v1-0-027ca5928518@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>, 
 Erik Wierich <erik@riscstar.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KS3+njbPRJbcEu4oTo8CU3nT9O7YNaNR0KVXlhLikJI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBouDxMhwgbGaCv5BJdK0z3sgDuE8B9sa8wWlv0L
 9S1vjWEI2GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLg8TAAKCRARpy6gFHHX
 chiwD/9mxadmZKDjeyHl3dbIuaLmbb6UlOlzu6kHHuEUYBgUt3NrL9N8gMIhB8uwARf6kmMmA0t
 XCqOXIyUXULqH/AQyeFnR2FdMmLlgenncqSVg96hCKMbW0Jp8v9jWZV9VjfDYXfSAUvygJanXBf
 dUza49Z5rM9A/QiV6hod7vR4+/IvPn+SIUissIbx5nxLPMk6YbprrfmforFW2UX9b7iIDmk02CW
 C6LsoZR6jyNbVkddde+A8Ek+Luj72nFlFfag6S8FIIY7sUpOtaEkj07SdYJBoThwV6lQMvGrLp5
 n1AQt2B75ImxMsc5ZFrk2GajL+tkMY3IZ8yctfSDNuF8ZOxYv563DSPEaha2qF1GGUjeQ1/b/VZ
 aDOHa+hk50UFYHau3TW9Ez6RUdLbdJCaRiISzn7fL6bxc/m08neTaQI8hLCXZdU19f9OtlqSGs4
 NagiQuP8h3dyvb/KIQ31+npXFbehDX03Wg5smXrYxy77pu9rZtnVFira++pp2FOGqJ0Nfz1daex
 rZDNT5D1difoUuUbMhVSN1NU6ULf/MEhbrQxxllH3cbzfYNT00sDgvkI1mm+x6d2hw/pJxk3Mw6
 WlnME59oDV1NSZY6lZ/Za8/yBvCLs321rHSlXos5z/M8aAWmDHJlMDHyQohj2jfSctXbwfOAcnz
 9rQbDPkU3Ws/1WQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the recent changes to the versioning scheme and the disassociation
of the core C API from the libgpiod package version, it now makes sense
to display both in the output of '<tool> --version' for all gpio-tools.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/tools-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index a684fcbd22eb32ccc822b83d5bf96fa9b976a9e9..8c2d5bc055ce48982d45d667aa975ec14cffc925 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -93,7 +93,8 @@ void die_perror(const char *fmt, ...)
 
 void print_version(void)
 {
-	printf("%s (libgpiod) v%s\n", get_prog_short_name(), gpiod_api_version());
+	printf("%s v%s (libgpiod v%s)\n",
+	       get_prog_short_name(), GPIOD_VERSION_STR, gpiod_api_version());
 	printf("Copyright (C) 2017-2023 Bartosz Golaszewski\n");
 	printf("License: GPL-2.0-or-later\n");
 	printf("This is free software: you are free to change and redistribute it.\n");

-- 
2.48.1


