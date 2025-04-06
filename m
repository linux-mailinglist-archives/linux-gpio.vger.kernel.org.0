Return-Path: <linux-gpio+bounces-18250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B19A7D036
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Apr 2025 22:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4E197A3054
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Apr 2025 20:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F80F1AAE13;
	Sun,  6 Apr 2025 20:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uc12eOas"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF78717A30B
	for <linux-gpio@vger.kernel.org>; Sun,  6 Apr 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970975; cv=none; b=Fmv00UPRZK593habGkB0Y1afIPb14lWaTMjRZ8lEhAObDRPbdop4XQiu3j7mizdNvbnRHhssNTMmUd8ZOOK6MAcH0N6e+37YT/NvjxelUYNdGNVzAt/Ba/xNFrmd/EqncqdhjnzjrjfatXRLNHP1Jl0sV6xF0+lFP/p29yOrlTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970975; c=relaxed/simple;
	bh=t/ClPnFK2Y4tw14RJzsVxyOOTn4d+SRgStXzq4Mnbr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctupJGsrUJ7fbmU8uRAnkiku54pt3kKxXBRYwTv5k9ckxw3iWSpTrRRIqjVR/JdOlxNy/ce8zl91GscUkC/vZHS3F/Q0qB75g0sY4KwMuu9XC6OW5a/okYe1U4qiT+Vc+LTrNl99mj7i02LhGgBkjx2joPrkCC0AsSCWvojTIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uc12eOas; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so2116585e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Apr 2025 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970972; x=1744575772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E458gQJPEDLg7gt5tX3yC9GRB2p54/ySefPjbdFmnAo=;
        b=uc12eOasR2Pg89XyJXTlUSScA3Ykxn5LvbicjmJaWTX0gavu3ji9FUKonPG6h1BItB
         XNS4YT/Uo8vWFd1Ivm1lVB9XVqUDcGTJ53I4BN44ZIqkaBQ3RhXS+jqBTPHiVyawy3Su
         9doJmaH2Ys7U3v6PZRJ7VZLy8NjcYf4nJfJ7Lv+Vqa8WVK5W9e3YN4zDH6ljgj/sLOQw
         ddh5izkwHPn2shdZ/pkI+vLy+VSAvp817Sv+ZUxaBzqCIJjoHy76+Z3KNRUbJZsS6g7T
         7qRx1k1Oa1drrXfrvsWk6ZI20uKZIrfa9lexgoT3y7IIZYJTofrMaau/pvqtif+cj/w5
         n6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970972; x=1744575772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E458gQJPEDLg7gt5tX3yC9GRB2p54/ySefPjbdFmnAo=;
        b=NAUiVvaxadAe8H31tp2HeM3FlTqcwRnGd8H9NOz/2dEmFyPQSEm1HQD/Lb8bHh2qn8
         rTT5q00oHSi3C8W3ZgGupjAwrG3P0jommQo9HVFyc6R/zYE/F6N5ACPk6ptOEDNlsRYr
         ALy/8DJeEYHTxgwq9YI4F1HQZPeWknnAK6ioIgaQZt+hZTDgXys349ibqHLtQHTrcuiN
         5q74cxPjsQXJFd5JCY4BDIrRvN1G5oXm+xsopM+4Ulu3hjgKe6Rlav5kqgMyk66rlX3Z
         nl0hNzPFDkshrRikLoM587IAFJEhmKr/1pjDjgI2vd9ZbXRY1JPQ79dEzfsYZNizAYUp
         oG5A==
X-Forwarded-Encrypted: i=1; AJvYcCWhmx4kyxEf3n8iQ6Aw5yqkToas+8nlUpnSsw2QqYlh4ynkf1mXGldd5TbaCJHjz2BisuFxlfaw+eus@vger.kernel.org
X-Gm-Message-State: AOJu0YzRUF5Zpafbimo2tFGyCZ5Kn3kDnRlGZseBZG97NQotJqR6ZZsN
	mlxTSuHKDLuO+sk3tJClGblHlz5t4rXxoJSALAUDcARUcqCda4yMAlSFnV3VIsc=
X-Gm-Gg: ASbGnctofNa44OqxeMCDHB7eZSwwcoH/mCP73I0fPg/PKkdaxxvNPSkXu8exvfZdZGF
	D5rwhkbO/GUqTbFsyNJficnZ+vW3YfdWCgG8p7FNN03IuXLXIObW4GtuACnpIkBRHxZVCTevhQ5
	LLjoonJmNhIuk5NPL2gQ9tkN7t+SWxkfEwK28zq8dXzz9WmPMsnzc0pDqdxveHUtgVHjR0Now+H
	+eSRBo5W/g/Cd4SlSS0M5Ap9pc7P7VMjfw4VqGa0ZkTkD9D4ydgHYQuVKWxxd4H1uHaAIlDKt7C
	GDHpwQYB5acO7lLIqdOvU2CQH0VyAeVK1BGfCeMKFBh28rZHDDEjyg7jsh4anvq2
X-Google-Smtp-Source: AGHT+IEF8tj7Pq+6DZXgyHyaSB4Mgz8msO3r9oCeK6E+RJBMjaZB+pmLJuJSpG/6Qd5AvxQHxn7QGw==
X-Received: by 2002:a05:600c:3b12:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43ecf86b411mr30682825e9.3.1743970972004;
        Sun, 06 Apr 2025 13:22:52 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec147c9dbsm115304655e9.0.2025.04.06.13.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:22:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] gpio: zynq: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:22:45 +0200
Message-ID: <20250406202245.53854-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
References: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index be81fa2b17ab..3dae63f3ea21 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -1011,6 +1011,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
 		dev_warn(&pdev->dev, "pm_runtime_get_sync() Failed\n");
+	device_init_wakeup(&pdev->dev, 0);
 	gpiochip_remove(&gpio->chip);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	pm_runtime_disable(&pdev->dev);
-- 
2.45.2


