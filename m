Return-Path: <linux-gpio+bounces-4918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E351D892D6C
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Mar 2024 22:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 985AF1F216B4
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Mar 2024 21:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCE2482E5;
	Sat, 30 Mar 2024 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDYRHKqH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62443AC2
	for <linux-gpio@vger.kernel.org>; Sat, 30 Mar 2024 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711833001; cv=none; b=FEUhOCow8iQXsn12ppxNRTK/GUrwJZKwPBhl9AYt9Pw2UR5eu+E9oQfkGF+wZZKmZH24L4GgZmHw+/teEtzWyXIErpFTNBEyXUZrmrvj9OYWZWdfSIEgVMtSsDPNvQl9vAQiUVWbcj2xkZv/YB27SbAm0uYNX4ssi5It6r062Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711833001; c=relaxed/simple;
	bh=jpeN1Yqiy86IASrMw5IJ3mejJAeGCwK9WF/sWpjQR4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jyUQkafrbiSh0F0PqpmTOVqvTnZ5pfr0hSyDuHH93DsML4FEKI+u6471o0wO6GYhMywdVe/dkO9x9n6h/2EpZAFonBQXMsHL1XocLot9zAd1CgXdcwdoQWzxdVBRfLGgWlZUA/8L8/L/4gfHtAE1CFkSWbx4wwJX/F1Sj6FQpAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDYRHKqH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4155f5b8cefso753925e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 Mar 2024 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711832997; x=1712437797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFZ6AvemSHHbcptkzhx+Eo5vulQUyGFEmtEeYrKTAdw=;
        b=SDYRHKqHgC8sVL3OuWEyFHNfmVwVLU2DiDCA6TS8+9qshlNe6rE9veV3ziGHMMl0/q
         10KaSpr57Ochd33Li73lI+QqB8ZDDwqA6lQ4FPgv+qPMkHjLEleWtZbeYD4IRgvJK+Vc
         Ktxfye+CWgeX98pyBHbrydYN5WiDYKbCEc9vnvFmkiqBHWqDW0ZLrD6LKi+qvAUP51my
         ZdNFPkjapRRpjmW4+sFO+BMh/KZZtF9YufL7msB+ILKL94znr0TsclsYbHsZ5mjZlFxx
         QNgSM1ZTP8TkXQU0SQQLm5fcIBblTo95SCPAosN4SMu6l8CDZl9iYpRFy6CZQzAg2A05
         CZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711832997; x=1712437797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFZ6AvemSHHbcptkzhx+Eo5vulQUyGFEmtEeYrKTAdw=;
        b=d9NgYESiWGYWzPGdQYEO7AmBJvRD34dsn3nslvEBh8shzZ1sCwSx2vNaXeRoF5e2JK
         X1qYwUxwThtjhPRo3VnT7Sj+enV+mD180Y/9We720Evm8cCvsqkWhSMF6asS4GRErDKs
         1lyNVjKYQ/c/FQCSbXSQPHsJouZSuYHj8SlBTQBFkifWs/ksarbv1S+HQY5GP9YBKbmG
         PctGHPxENjY+UiQDThWfE21gx3f1BLku7zoGR8zk1M0DLFyZuL29ufsEBDu6fpEK4z+Y
         WQuixYcHjfr+M/Q8hrZWloojR5XzG4JtHfSk++sKQKUoy3ACeMM8i2uENSNhBb8US8aX
         83xQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8fQWdmafbHepLH/Vcd5IPKO4BJXllak0xkADV9RfK+AYy4rTHJdxJQXXn9y1vlvbAS91I251rkMAJfZkmtd7MwyKFRnwudX8xfw==
X-Gm-Message-State: AOJu0Yy/eiu4kWdytHnnkE/6V2NSbdvSLayujONJ32uRStXLz4r6Tr8Y
	iylnUJV56+7R9CuBvTGZkDu1+zTHZfl+mR5rTGW17b6YmkzOQ8RIiIFrWxUTeF4=
X-Google-Smtp-Source: AGHT+IGdfuyJzSIxSkkcrfLi5TlHT2+g+ykSm6cJanYYnEITTKeGYlCFJjitdO5Wziu0DGC7W0P2jw==
X-Received: by 2002:a05:600c:5114:b0:414:1eb:301a with SMTP id o20-20020a05600c511400b0041401eb301amr3461429wms.28.1711832997494;
        Sat, 30 Mar 2024 14:09:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id je4-20020a05600c1f8400b0041496734318sm11500465wmb.24.2024.03.30.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 14:09:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: sunxi: sun9i-a80-r: drop driver owner assignment
Date: Sat, 30 Mar 2024 22:09:54 +0100
Message-Id: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core in platform_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
index 919b6a20af83..5b4822f77d2a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c
@@ -169,7 +169,6 @@ static struct platform_driver sun9i_a80_r_pinctrl_driver = {
 	.probe	= sun9i_a80_r_pinctrl_probe,
 	.driver	= {
 		.name		= "sun9i-a80-r-pinctrl",
-		.owner		= THIS_MODULE,
 		.of_match_table	= sun9i_a80_r_pinctrl_match,
 	},
 };
-- 
2.34.1


