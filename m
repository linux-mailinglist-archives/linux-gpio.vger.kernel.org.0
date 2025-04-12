Return-Path: <linux-gpio+bounces-18749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAFAA86F25
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 21:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F0717AE4DB
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 19:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFC6219A7E;
	Sat, 12 Apr 2025 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/7si5VN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07102149E16;
	Sat, 12 Apr 2025 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744486318; cv=none; b=TjWBJpdP6OIcnv9VArSk0EvAEmaWmJuPvmXhIG69YUDlh5rGiQ5n6wQB+Myx166qPk9VEX8xDBdOXZifPKEE01n98D12Dz/7COjR2d0UwmJZhBTb1iDzLf2yY2RPawYmerB97Vw38U/74YRw6K8AjGZY1o/j9mjN5t+Oe/BpvYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744486318; c=relaxed/simple;
	bh=NhS5vb/tQJFQ/jjj7UdNjo+5MgaJ9eG2Jnss57DCYUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MaMtqqHS4T2rhNUB+YthH9ZZ0fPEYfOIhKRUgR2y9jEMao6Qkh+9ZCsNKGUfaeJFbJKTfId6VEOQnC5dVBjAjbdRlRoKjmz9UnYkunsqf7TPjY9vAGENbl8qHiuvReGCBdfcSXmL+rUe1lT2e+gUhLvlSHtxULb4Z3FpWEsi4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/7si5VN; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c548db0aa0so51527185a.0;
        Sat, 12 Apr 2025 12:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744486316; x=1745091116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGbdQ7HwZ6HfRq5afBeoyIwhWt20XJHmLncrgBwuDwU=;
        b=f/7si5VN8s0ZpqI7wn34vIcB7gPmwYbMyMUeYkrC3Ny5/rEMlLmZHU0HhFxWvDbYRJ
         sstB7EZY2clZAx050JCzJA8PxwBGiqhdmK8GzueFMQsn8w057YEaHiipojrqiYzSEGDw
         pz9uTiYom6I1ZYV+Gfjm5ZknQeiDOysjHSUke/DqaRdJJqE+//rvRI68nvEythuri3wB
         N64+GdOpNHnRn9xsn9+LqakYsOd81vhzQADQcmowInPNjwdFVzt7RDZRVYmURKwVHXmA
         nQnQmHMDCrPezKpYQ9hAHy730iSIakk3LlhnzhsMjof4t1qcFsbGBNdEHqpmkwSypb5c
         bkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744486316; x=1745091116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGbdQ7HwZ6HfRq5afBeoyIwhWt20XJHmLncrgBwuDwU=;
        b=THjm3MY3Y2aPI9Rm5RXajXoixstZ3DUl70YBt7UsLv3xT9Uld/E39y6pcY6/TsgK5C
         xPBMWEer/ozp5HVJc3H+gKCb3zFtzw6ZWt8LuoFiOYl5JoatULg1heZ/feT2QN8OMz/5
         hmM/ygUxwyUIM5+sBuhMJ5PH2LSiO2zqHBr2EsQ7PhgXEU+FM7G0DQjs5+CzzElwuo+N
         na3AWVP6AnCUGAqUT/APT3zAIkP1d5ddV5F/iA8dlGw7zoF5lPktpCzfA0jGkst4iozn
         Yx5KLhCeiI8j2P2sNoL+AKK2Ru82Kt1Tt+/cQGAZs8n/iFpEJAKVIZqqaTd1CZSbTzBN
         KAjA==
X-Forwarded-Encrypted: i=1; AJvYcCVWcaat5cjGTAPSLcnIh25bi8nQq4f86AcatzN0KPsfCj13OYmR0Z87GLWR7Hm7AaGRgDobTJGoQ7bZLRmD@vger.kernel.org, AJvYcCW0pkK866HReQD8Ol/ajJBCIxZNGcyx1X2fuY9Yfyp7xhmDmuoiqRTraq14uMMm5MZi7sqdkJoWupwH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj0vmI1/PJov2Vo9ufpW7d+Mn2ua2YCewHkt+B80hCCUGfKvbJ
	UAq+o30CND6Vx/fWjfE5uGkOltyI4AOpS0joMkZqhZx1jvQvU0ZR6wpOAU4=
X-Gm-Gg: ASbGncugb7tFTOoMfenEv1oF+X4cp45MaBFzicdT87lSfpFD0m/RXZ3ovncblQq2eHi
	4qzz28kHIWKYqPYWQi8ldT13uQ+fhMadXdm0/9v2+CrILeVO6xlYch+u6pHKg5w/ezMIMkFsKmN
	kCImxpo6ufPk+ywM31HbQ1QARHQbufkDo35qXkI4qm7W66+q4BiunnMdpiSvmHDP6sHly6trG+f
	p4kGX8GY+rL9FZ0oVMq07z1lVoojuDg8pxk6xjSPxMtX9r3FafekPD16YxezXejwiHNco6TqcYO
	oES9I1mauaToRUASusGTs2QFqOBpa7itZzimqw==
X-Google-Smtp-Source: AGHT+IFwgsYs5JKfro8N+GKqLf/zqrbnDwJzJZWtKxHFomrdJnX8s4fGcuPU5JBg+lXyqUl2hEGWJw==
X-Received: by 2002:a05:620a:29c3:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c7af1cc7aemr400679385a.10.1744486315743;
        Sat, 12 Apr 2025 12:31:55 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0dc9fsm443192485a.96.2025.04.12.12.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 12:31:55 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	theo.lebrun@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] gpio: nomadik: Add check for clk_enable()
Date: Sat, 12 Apr 2025 14:31:53 -0500
Message-Id: <20250412193153.49138-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to catch
the potential error.

This is similar to the commit 8332e6670997
("spi: zynq-qspi: Add check for clk_enable()").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/")
---
 drivers/gpio/gpio-nomadik.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fa19a44943fd..dbc4cdddf4df 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -262,8 +262,11 @@ static unsigned int nmk_gpio_irq_startup(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
+	int ret;
 
-	clk_enable(nmk_chip->clk);
+	ret = clk_enable(nmk_chip->clk);
+	if (ret)
+		return ret;
 	nmk_gpio_irq_unmask(d);
 	return 0;
 }
-- 
2.34.1


