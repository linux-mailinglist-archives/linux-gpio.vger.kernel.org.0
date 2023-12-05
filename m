Return-Path: <linux-gpio+bounces-1022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C0780592A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 16:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487D2281EA7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Dec 2023 15:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113B568EB3;
	Tue,  5 Dec 2023 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bAjpRaiV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F56C0
	for <linux-gpio@vger.kernel.org>; Tue,  5 Dec 2023 07:54:35 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40bd5ea84d6so20423995e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Dec 2023 07:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701791673; x=1702396473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqo9Y6wByno136zo48BkFSxhAKPxHUv7Wp3L8ZrdTEM=;
        b=bAjpRaiVhmzYD7gkdz40m6XIt+2FQrzmq7tdZDufU9onna4t3YaRDLMk28JcGYMW01
         R47sadeZrz+YJ+84GCxIztkJqpJBeJdQJ1DfV1xAHug72Y4/gaRxPzzlk5bXhxciCjLT
         1kjB+hX7/3ng/5pSCxOxddVljomw/4XVc/Mvh/dNYZLYWPqPae0ArtBy2ROZF2Je4reM
         FC81xo304R15DuzU4/GD0fhUx4qZKClSUO/WoStrjkyO/iJpnRMe9aCPB+vo8clgrCy+
         U+H2T4GgKNcYIe/LNI2yIlxBJb8Dwy9lBPN+46HW7ywdKPwGgMm4r68sQK5ud2N/wgYa
         q4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791673; x=1702396473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqo9Y6wByno136zo48BkFSxhAKPxHUv7Wp3L8ZrdTEM=;
        b=h2xC3pLXX3GjYf4LO1EabbrMtqRdUgPeJu1NCKxCUwhHa+rzIhKOjCAcWL95H9wsjX
         T+iKDzLtybk7M2Bc/YE9ItwgBdZYKGhQILw2KAQtOl2Te7GHKFgCjxbenMmMt7OdimA/
         R++Xtt0G8KoQvops9LKVWbDRjvRKcog6rgQJ4IqxB4DU8xF2QtxeP/twJKB8Srb+mzDw
         sKYTMm+jEDPB+z/iyuMA5j+T4pqGqRtQ9p5h8hgjP13xg1NaDUNhFvDivZm116zoQxY6
         bxeGeQEPo/mUSOt8ejntSDpNzEmVku4hbYq7Y2gg5Aat9/I4MzjquZhteVxt8f/JOYSC
         br2g==
X-Gm-Message-State: AOJu0Yw2xR+AKclTHB8XZskp0V/WIkyJ9dNyGNJZ0kdCi48DwtzqH2Pl
	Cs3aU0Guis8VSeYAF/kYE42dTQ==
X-Google-Smtp-Source: AGHT+IECqsfgRq8K6R184xNf+VSY/KGmg5NZsm3ozjh8A6tYGdUwKPJiHKqBa8dbr4M88/Gm61uUug==
X-Received: by 2002:a05:600c:4a83:b0:40b:5e56:7b70 with SMTP id b3-20020a05600c4a8300b0040b5e567b70mr734511wmp.185.1701791673497;
        Tue, 05 Dec 2023 07:54:33 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2dd9:dce:96c5:9e9a])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b0040b4b2a15ebsm18948318wmq.28.2023.12.05.07.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 07:54:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: fix the email address in MODULE_AUTHOR()
Date: Tue,  5 Dec 2023 16:54:30 +0100
Message-Id: <20231205155430.31761-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fix unterminated angle brackets in the email address in MODULE_AUTHOR().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 1928209491e1..1e8b92e9df80 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1546,6 +1546,6 @@ static void __exit gpio_sim_exit(void)
 }
 module_exit(gpio_sim_exit);
 
-MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl");
+MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl>");
 MODULE_DESCRIPTION("GPIO Simulator Module");
 MODULE_LICENSE("GPL");
-- 
2.40.1


