Return-Path: <linux-gpio+bounces-13541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DF49E54FA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54C1B166713
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7A7217F3E;
	Thu,  5 Dec 2024 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r+XJP+7Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A186B21773C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Dec 2024 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400383; cv=none; b=e4togo41Il2bMgas2wzxF135GziZAwj4wKV4ytgzAe0mC4WPyf/QBp9B69LvyfLL6kYkvMTiVIXYN2Tr7VHQAFimiFvWICZEYgOipOSKp895cFGxbfS4mw7t/iT0FsEXeR5TeylxM34AmZL3JVoCC8KLGzcVK0YDzNB3pBQQiOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400383; c=relaxed/simple;
	bh=Bn5nh3l4ebh5/olUofQ4qdBb2ptYnUXgTMoMswxG7Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rw39j5JMPPyEijgzQcISaa4Ty6fb2p0zzutV53+W9tbT+OokgXwlisWkLLXVsx4ZbIVccKWdfXNtsiwUOxabVcQN0wFdK+u7EMje35vowILlXhvjZEx528SA7Vk9bxSPG8K8VW6YtRCAWz2iW9M+BWQ0NRR2kh8dicicm3zGvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r+XJP+7Q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e3621518so685824f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Dec 2024 04:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733400380; x=1734005180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUEfRaEMpC37FH4e73tDnuIDcsomn+OI0n1MlB9szUo=;
        b=r+XJP+7QXzi2npInt0NWAwuYM2oUIaBnB6FjrkJYZvmRk31ygCtrV7k/BeeJUO4EfC
         rXixwztz7T7Y8nFZvY6d+RlzvAVtw/B8TIfyIk5KbkfHFf5uBdzr7zr+F88N8XiauQwJ
         RQioPk5T7pptwxQTQBn2blsxdiutb1oyffqqNgGhFwhpYmmdnwAllBZyMf9kt1U9OsS3
         DS1E/oNP9WAdmDwwlgIeLi0m5PCpz4enbYlQpkepTWIbF36ApTD04Y100NbvqbzeRRpp
         LZcREr+70eRGJie6ToPLPM2VpbqnyetpuFThN7Vt6Cfmoax4qKr3hnQ5blcXR5s98kGk
         7Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733400380; x=1734005180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUEfRaEMpC37FH4e73tDnuIDcsomn+OI0n1MlB9szUo=;
        b=pUOAmt4WKI33I1YSy+CuaC3FRoNtC0yR8mK2FUhk8HoM2J/HY8ucNZ9rCDbGdBghox
         gis6DfgJ17T/z8vPjWJItMjgz2CpaIJHakOCV057/MJYNrKnDa3GMFqM6xMTIw4Ifz2X
         LmtmSqrJNTTdHBA0E+mLnezxwG1BmeVIXK1C0hIFM8L6HhmkuadnjWoN9/sUlb56w62F
         huEiGEwf7oSj7Y2kiskUfDtV6EuK/mEHfK52XL+n0T6RsBokP7YLnf9kCRxI3DI6oIMb
         LjA8wMoCBq2iMl19Jdt3I91l8l140HH1EXH33l5Nf4DGumu1FX/fYnJ+LWNP+U/UDLZE
         Hc1Q==
X-Gm-Message-State: AOJu0Yz4QOC0/pBLrmc7pj6UOHSZyXGTqQFXFwLA3MrcSI09XSPOGVXB
	TmUhoWJ7n7l1oOeprYuj777Yi7b+FGAV3rGQRfP6oDRw8I9JiE7HNXaHzgkUSEM=
X-Gm-Gg: ASbGncsdYn9mj1PD5U9L2pQfLuhQUm/m0lXSH+DHQjlOSUWtQ6fkKotUD0bIvN2rgcj
	kQCqR9o8S/4ZIcyBs+TgPkZKCXyuS3ajWhj0lIKMtKL/6lD2843Ij1foNhoUoDcWcee91MkUz+S
	b0cu//ipT1RX1R2pwt9KSp9O7xPcPZ0HYc/8aQviG1jCfp+ZgVJmNSMttycaMz45QHmMYtDq4vd
	j26A0/HZ3QAvdDB4IkW4tZHwNep+RgA8arVdYqJFQn1wZNB
X-Google-Smtp-Source: AGHT+IF+ZQJT8y1BDmiiQQKVW9pOPfo74S02/fDg2OSwbblovWA/gnmYx8QoRpzq3stAqcTA8YOZ3A==
X-Received: by 2002:a5d:5f45:0:b0:385:fa26:f0d8 with SMTP id ffacd0b85a97d-385fd3f20b9mr7586700f8f.8.1733400379667;
        Thu, 05 Dec 2024 04:06:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:c2c8:33f:e860])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113508sm21934095e9.35.2024.12.05.04.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:06:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Davis <afd@ti.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v2 2/2] gpio: omap: save two lines by using devm_clk_get_prepared()
Date: Thu,  5 Dec 2024 13:06:10 +0100
Message-ID: <20241205120610.40644-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205120610.40644-1-brgl@bgdev.pl>
References: <20241205120610.40644-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We can drop the else branch if we get the clock already prepared using
the relevant helper.

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-omap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 54c4bfdccf568..57d299d5d0b16 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1449,13 +1449,11 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	}
 
 	if (bank->dbck_flag) {
-		bank->dbck = devm_clk_get(dev, "dbclk");
+		bank->dbck = devm_clk_get_prepared(dev, "dbclk");
 		if (IS_ERR(bank->dbck)) {
 			dev_err(dev,
 				"Could not get gpio dbck. Disable debounce\n");
 			bank->dbck_flag = false;
-		} else {
-			clk_prepare(bank->dbck);
 		}
 	}
 
-- 
2.45.2


