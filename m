Return-Path: <linux-gpio+bounces-18498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFBA80BEA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 754675026AF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 13:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1164E27E1AA;
	Tue,  8 Apr 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WY9R1BnV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF2927D777
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117153; cv=none; b=MlCXSKw+xmstALfFNatRccaTC8PMLmY0/iAjq8TE1qEChP4CfkK973jv8cSdpc7ICzqeADjdx03QQHTqkWSsu7juFPej4RwCA3j6e63PQocA9O6OB2G+sOLW45iogw9fLjKzvhAiGp0Z7Ns17ji4cpSx862wYOu+MUNyfWxO1Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117153; c=relaxed/simple;
	bh=b1GccGk7WftkXTvUTNJ2Q3Ec5jd5fc8ZT4j8URBPawg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NlBFLHbl+RcnYz0ips4lknQBm2nXveHUTzyJWRhTCtFwliVHj2NNcSpINX5wX27scvWGygj5Y1yW3p645wInPCljgOSpv6BUh24betXUPtatFX5b30OcFx5odwM8/R4Ek3fUDtbFsVAf2inE6Gkm9+s0bJjip+2S1QfJnL5/4mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WY9R1BnV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso59645605e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 05:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117150; x=1744721950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/MRXdQzZRac3hpBDhgWgvpILVfPyeGSqqvITE57hjE=;
        b=WY9R1BnVq6vH08QqU0LgE1zGJOgsVuUs1PAqY/b0QQpyS4EiUpbPh8iktxpQu34qJl
         CwNVtfsADL3g0Z748vKLl7I3+NVvu1+DD9yPytEhqvGihVduB3WdPJZPD6DNASPPDQR6
         QK59k2lQPINa36K04ugA0qBgV58NqliZEyqJ3iWJrzd6KRabuXtvZvc23svpssKQr5q5
         7PQa9zUSw2Dz5tyD8ywEoPTSom8rektuP0NlJMF3zVxsKrAJmTyWQSolbfJ3oT5Or9po
         JOxD1BMV+ViIrK6mQDfru6L5myMUyMiLhCnQPjwjAdNE3xqtqcM+pzmXDp57Y0cxRDdt
         KUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117150; x=1744721950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/MRXdQzZRac3hpBDhgWgvpILVfPyeGSqqvITE57hjE=;
        b=kksaf9UlUwrJMTnNJ+Ua7J/zAzxunCnhSbrpuoULej2WW1zeW7Xi/gQqHFsDJwwA+L
         s9jbJtZC1GOlDTEeZSY75vfa64BwtqGhvQ30aUowSZPfdWVfQGQhzFwV60GfqcqDd3kF
         GINov7YCkqX+gy89/h+Ha7wEZEk8SZwVqg2EBi45jK4dChegBCy4cnm3PMXVmflpwl9q
         Etxw/L5QgjUzfsh2or0AAeuTQeCdYFDDy688Vvw0TBwp7RvktO0G9NDt09UpTzYohXj1
         3P5uq0pHAa2B2gXnrUjP6PkP/9mXcfozTs72nR4HoZAP6YRiPrcdABkB6tZ/Lq9JSzay
         oUPA==
X-Gm-Message-State: AOJu0YySuXKWfxG8Oimd/zofRwfFok86FJNLZEA9mINO87m6zOQwpB5T
	93Mbt5d0NyrJRhCUrqdPwsm2I3TFeN5xA+hZJYv9MYfTYBS+1liapfYeNZGE6HI=
X-Gm-Gg: ASbGnct38XH09rGrz8Lf8eIPTAzZsecS1I1VvWvKVMfLEtii/O98suKA2REoHvGbsGL
	HUVAXmhL0uzYKlToNkaNJ42L6uKENCUUKZslHinaPuO38i8O+tcKePiGF5IFh3Myrl075AW3ryD
	lOAOp6kKR+zDUb5AbuwyufwNIIiDIXf7BxbIY5aKpADp0CJBMNITpxYTsO4zZ/agWsthcv7cs+A
	4mwltaeyy71KsrOZC06uyS7Xt9tXs0l0csBJY5KLHuQAmk+ZHyBGJYf+NONSKze6n44wLrI58gy
	DFdXpmp6UgkbUnp+41HwsYedH3Bhi5UmktL3Kw==
X-Google-Smtp-Source: AGHT+IHcY98g3+iOezGpwKfr0e91O7CXIaBikT1++VcAiMP288pQOtdFd42dYyLyAStiQkH8KpiqfQ==
X-Received: by 2002:a05:600c:a016:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43ee0613661mr159305625e9.3.1744117150365;
        Tue, 08 Apr 2025 05:59:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 14:59:02 +0200
Subject: [PATCH 2/6] gpio: msc313: enable building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-compile-test-v1-2-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=665;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jJGj/UO9ofAOpfUWFcAo7LG6XQJt8cKSPJtXtsUopCQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2auOatfy1tI6NrPddXzGeOnX4ZswQcnkRZO
 No2cPdgVe+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdmgAKCRARpy6gFHHX
 cnE3D/9LHWQT7OPMVc3yfLvkvxp6odi4iotDzR9UhH6k3TqRgWn51c/8egDq4uZuX0OCIbRySA/
 Nh1ROAa00w55mKyxamNCb3spcxDYfBmm1re+ID9g3GJRyTqP0qiBdooeOR1xYlaZY4OItk+7nsY
 o0Qob0YBo29SSx3xmoIK3aQQ8emXaDHZ3OU0167aDKLFhCOdLQbgCytEHKV07izveT+z1kdcEZw
 5VVSVyfMNCRcuvrenpHf/frUfbFtiY0j2M7Q//wZZ2C41Va3NYCJUBhKwz6YT15Wq4eOwTBvX7E
 L3UpDQIi2gsYMlDWd1i10wOR4ijZHb7pfYZS1aCi3+2qofgvSK2OcwKCwSelnpiJn37dvnsRAJo
 Rb3Y+bclZl1TDanVpg/GSayDbiMsCWCJ8gK9Vq4eiNFuirXIIopBD7GM5zXbKKmMUF5D9Bgv6FN
 llaMwBTeQfMi85lHKQfIWNAHAAtol1zugXOxlgIiU37AKAXh9ELEZfKGGGFgjCXmIdF+FOH0Jh3
 BN5gwHeXUGR2x0wOjpuoG4O22QCXOy6SffDxlAGl1QAvEhwLeTCMJgO0K4PRd6SyYqc2v2n3ZVl
 jBGsqgTzwUzvV/pkAfH3qVHLM/ZeoPnQAWDniEAHvBtdXj0AEp2HZHDSW8sqdANvc+la8SHrbfj
 oZCW6MLlyFHZb4Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f76d08880fe5..9b25bd667b76 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -866,7 +866,7 @@ config GPIO_AMD_FCH
 
 config GPIO_MSC313
 	bool "MStar MSC313 GPIO support"
-	depends on ARCH_MSTARV7
+	depends on ARCH_MSTARV7 || COMPILE_TEST
 	default ARCH_MSTARV7
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY

-- 
2.45.2


