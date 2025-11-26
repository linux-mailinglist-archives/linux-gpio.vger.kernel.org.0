Return-Path: <linux-gpio+bounces-29107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E3214C8B0E2
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 17:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B6B0355836
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760E733F37C;
	Wed, 26 Nov 2025 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wF/qpZw1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05533EAE0
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764175761; cv=none; b=XWf/l84+XxYE/2NvhdG44fo8pN4Zg28eIgRRgpXeNT75zEOILgJwnXPV9xWiDvwRcqfdX3tk6ZMW8RicgPbY5YX2E85RyzQmze0VeCnW+FvRLu+BLFzaAZSdd2wKCiSYiR6o3JNJi4RFomquCRoupyV5jbvHAUkK658Y1jUUjB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764175761; c=relaxed/simple;
	bh=EM2RN15y1DzKZl58wqszow9EXL8vzOQRWwXdXGoqqDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPyGXji3GytCgye2CIQ3yfXKOjwXPR7mw+zkm57wRAZGH6VWpWrsA4g7hCBsrGET9TqVfO2KO5l4TXX+9WEHkVjbIeCaxrV42Y9BBFWjA03vCF7kUZ7EgfJRxRbzxwWwXJBsajqkG9T4/M2Oen6vl90Tyva+AAxxtB2OZTuZ23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wF/qpZw1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so40216275e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 08:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764175758; x=1764780558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjiIdcuKSyNU/DOTdJcNi3ZLLftqZambBPmIod1w4Ck=;
        b=wF/qpZw1Oc8ed7dwNBYjPCjUJGareWqvAA4q8C7l9fj4aspBBCG6fg1SrItYuT2Pez
         tjW5mIqobNqqFockbWt0elYGOL52H5ZW82GxH9iosY51w6NQ0AQG1WJPX9ATxzv66kry
         G2KV8XpboXweU/r2JnKUbS0bFJcd3yFM1NNYDT3vrkEmIFFYk5vR+ho2bPB6XiZ1bO0D
         I7aUZmTtyP24ZcBmIW4CE53avK1vQUuif3VBr5Bgozwt7f+vupOPzbExcxZwaJElQ2ht
         7jeFGUUrqcg8XPaFqBzSibMCSrRP1U04VJXWZ/k+pspekMNYIDPW2zz5QH3w/o9wWuE3
         m60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175758; x=1764780558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tjiIdcuKSyNU/DOTdJcNi3ZLLftqZambBPmIod1w4Ck=;
        b=kEj1Bb70TCQKQxKjLdzjh0gZ9uua9MicF1bm8GkmZ2ZDnfHEJjk1sXXCqB3vIzOpEw
         qZgqzijyWHnm9MYMWRn+IqaCtwCtMzz6G7Sqcf+/w4TkfTZyjwG9EbsLuRvcPwECuHBj
         nk5MxJ+Te342eAAPipn0VSQCu/hJ2odWhkk9ynjZnMPJgv52dQevLRe42DseFXBmnrZ6
         X9zeHF5zaIphOTEwdiX6Mrom+PsoQnVNyRCqP/Lyf9/+xHZ370HFy8n2JtzmrRoLqD5B
         vGMnBd4WGwseV7eRj8FF2ncdwjXFIVqI4FhT5pcsxXPZneHKVDfepBYbKEAd/7ZEMHNy
         0q0w==
X-Gm-Message-State: AOJu0YyAY6COki+HQF5KdZsSe2fE+u4JtuelrmRP2VipavssinvhzdyX
	wcJiekkujcRuaAonKq+Z1rJyidlGwqgt8DkRzIxYKRMxxsGqtUr0laaeRkO0Szt3dzk=
X-Gm-Gg: ASbGncu88KFabqwrOxypa7BqgKxGoC+Ms87nh8OtH0Oipj8Lwix2AL1mc5f9TD9J2hT
	yO4JU/ZEYfhJLNHKRYNwfcoc+cxDBf8WtU6YZrKWurz9GLsYv+buiiorsL9/krMdP4e6rV0H698
	9DERFXNc0mV4w2bRtDeZoVGFnPgxouDhDhFC456EIj8DRI2YCoFUb2RlFKEbECM/N1JLzyd6KFz
	GPHSQfkIPeM2YQx48wYy7VXZpp85srECqpZepclQiimvv5nxVV0MGnCPue6+njGPm5MMQAZEZI7
	MVM1NYRkPYL7uATL1pHVq1L6Fsmet4iPcMN6u3wP22tiWE/VqI7gnqeeoqb6XkEVeVAzBXayCV7
	kF3JdEJWaQMoIMNTAbuyrW1hYPSRSsP+OhGHHrdgIiv+zgd4dxr4xhbK54h7pVBLAilm0E07W9i
	Mc2krMew==
X-Google-Smtp-Source: AGHT+IFLFIp4rXYqncJ5PiKN9DXKSF6vGXjTTcnHtXIFQwX+/8CJoAemLXnHMqg8Fyojw9u2OpnPHw==
X-Received: by 2002:a05:600c:1f0f:b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-47904b2484amr73871435e9.30.1764175757785;
        Wed, 26 Nov 2025 08:49:17 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:544e:b6f5:116d:4a8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add5b80sm55848625e9.6.2025.11.26.08.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:49:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 17:49:06 +0100
Subject: [PATCH 2/2] gpio: shared: ignore GPIO hogs when traversing the
 device tree
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gpio-shared-fixes-v1-2-18309c0e87b5@linaro.org>
References: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
In-Reply-To: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aLk7gGw7Zbgd/Rv8WfK/EFjs17ikj14sohVHKwuKtqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpJy+J2TDZvp/aArDOCh4jvFlgMx7pU/EOsFFH/
 Aa2GGTNF2OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaScviQAKCRAFnS7L/zaE
 w4ohEAC2o0SODFFN4bAtpavkz9E/CiBXrY7evcXKkbbcBbiQ0fJAenFO3v0u/1MzFyulun/VxPU
 5ypCqeVfw/Rl7Z5EVONM1V5zal4NLw3Cgqq7JWJP1Y7Br2V8qmyjx0LmgqkbMfY0L509kNghKhG
 ORuMN+QD8hucn/6hx7yGsI9O1p3E9O4t45gOwz4aO1cj+guhXw3wS4MGLZHp4sy5StHA5xk6l4u
 iEcZEaEmKsL9Ql05ByHZyuWlpQtqfbA8BVIS99cHfOLDfpj6MftH8HqS9gE6ajvj4M8zX8JNpBu
 p4bX/TVi1Bb+oOhilvrEzIohFBOmMzPnKNdFscwCgUP/AUj8wEVj8HnCZy5f1OcnummY4jdsgjs
 YqbYYc8m25p0t7sDF4Dk/i3scp0MyOO6utQ/aPd7TVh5ibM9DxnhSMPc5lpfWS8kXsAreNfioQN
 5rsn8rvb7uRB9eZ+zI9wexRQM3vGmo/9AAm+Yw6PGjZbNESjshCyhBido64S5rhh9pKfJliELxL
 SyjxqOGBvqS+PiNl4hn0bihZnzJU8LxtouOBnO8ZIGdNAxC1p23PDbSf91zgCXVsFSValLhKVvT
 /Z432wNm700p6gYpSvxiEeaZyB0qIhPcDo8JO7zpfvTcnpvhK0IP6xEdJh3vnsbW9+qDva6+cJ3
 iiWlvOTN7EhSruw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO hogs have a "gpios" property but it's not a phandle to a remote
node - it references the parent GPIO controller. We must not try to
parse it as a phandle.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Cosmin Tanislav <demonsingur@gmail.com>
Closes: https://lore.kernel.org/all/2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 62f32489a8a6f70c567ed93645f1e36a81612def..7e049f2153a3fcc51803dd185fe5db60daea789f 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -83,6 +83,13 @@ static bool gpio_shared_of_node_ignore(struct device_node *node)
 	if (of_node_name_eq(node, "__symbols__"))
 		return true;
 
+	/*
+	 * GPIO hogs have a "gpios" property which is not a phandle and can't
+	 * possibly refer to a shared GPIO.
+	 */
+	if (of_property_present(node, "gpio-hog"))
+		return true;
+
 	return false;
 }
 

-- 
2.51.0


