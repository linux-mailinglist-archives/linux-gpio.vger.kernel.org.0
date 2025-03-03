Return-Path: <linux-gpio+bounces-16927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D98FA4C19F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 14:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 437C07A7724
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6425A21323F;
	Mon,  3 Mar 2025 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0L5A1N6g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411B21147F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007925; cv=none; b=Tvgh3gYBhY7PV4oetXiM0wXKqllzEJza4L4P/kMKsosIwWxgw6yI0gblfmXeCw6FSwlOC7kaQVDs3toDr65h4AjEhM1TYrlHhEvFyIZ+lYNBXLuzWiBGq7yscJHZY4r1BOYD/iUCwfel5cWVdfXobZedrKJ/m+D/0THcNlu+8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007925; c=relaxed/simple;
	bh=C2FD3r9G96fNyZ/7mG5NtCcGXXprvCDkvpsW+gGA0d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLHlBN5cJEvkHP5S4lemNZd6UWUH7odAmnO54Sh/7nF4PRimSj39FC7SrpewHPnpDM5sMW5KvfRIj+UO18+c3d5OzzB6V5yzZifuZ8xDYP7sKc9UxcuwiJT7gstPHl78FPfUpKOXSc2eTM4910y2tE53GQMniJeiCpn8Ww2PRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0L5A1N6g; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43995b907cfso27905415e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741007921; x=1741612721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8hAv7noimuIZZQmeIe3WLO3rZ6iIEPRpuvmg5XIUhY=;
        b=0L5A1N6g/4nIQQvv2TLNEKO9+X3Pm7PaMyhWiSIlWyUZ3nlZgwdpDILlZSALB2mxc5
         Qo96OnHtS5mK8a0YiNozilrvR1O7pMYSuqTg6m5a1hqgys7ButrWYsjJfgmle5KWfuNR
         YLdlzwsWyIl/HfcSb/YP9yhAF/Q1oh2VzZRNV3oootC+OzY6c/ObdpBV1GvPz95tnroK
         kJjbzRUUulzCwRBmmWTQe/WAFEeHkdvGI8XZhvcqiEQR3upVYdXndlhpMOcMybAgxkVG
         m8i7hvkuTmp6dlwRcWjpRFJZfw6W/4OCWy4sQse27ZctW0AmRwK9hACXc78AINdynSg6
         bL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741007921; x=1741612721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8hAv7noimuIZZQmeIe3WLO3rZ6iIEPRpuvmg5XIUhY=;
        b=XVrqsAwKNeCjlB31UFzHZTnXyQ8wREf1w+Zear8NjeAKI1QU74m3viFJUY+m2KPM7x
         69ZM6P1isF/ABf0MW9StudK/KrnPbyhFXQdcigCy248EuNwwv/pgpY5fi2i1HgAiHYL5
         xeJTJWduUU2us2QpK1YtiY/Ngi0YPvXXOGdgKQLciQmKSjwMVNwz07juXHScbif6JH9t
         IR4e4SyrjiPnO0cp6XiF/siv1ZYGeNIVoXqaBQM6pBET8chTykS/x06F/lhXX0H1z/5G
         K6kQxo7AJfb7oB23xHVFkfInvWOBWBnCH2zl2q9mVOgpF8qA5JYFxH0pxwNcJ0MEgLTD
         3NzA==
X-Gm-Message-State: AOJu0Yzb4yj0n2kJUhyhPu1NqS15ocPQP4Q0aj344RTWLx4TBYuV6bYT
	7vQCy7ti9bbd3/LEfPhQjLXB9NiWIPMOyEEf+2fq/Bb7bPOpCZDfeJGvl8pM1vc=
X-Gm-Gg: ASbGncvSA1efGC04oCL4iI5syPh/No2FohkfOj/PAMo2HpdjdOe8A+X04kAAa7Mu5g4
	Fck2VQ2igZiUntiBysUqbFtFM7paV0H+ekZQsfU6URJ2JWL5dzZ9DhvPqrFWwy8I9blN2mKDMrv
	dgYuAodXooH5Hq5a0OBJLg1kdNuWdW/RvurjQIVrf2Br5U2TeTKph6LU/DN/Wh0FX0NEPX5JUP5
	gWkMgGgAmgqH/QevhCboOrCKWSrWUf8AifnoKLL5nFlOYIci1F40Xo82fcfSZ5wXudUYNG9Z//B
	/6p+QY2hdGwP+aIz4TJjf928IKmRpK9Q2rbtsA==
X-Google-Smtp-Source: AGHT+IENjU5auSW6uBydmqpRlN4cRim5e7ftx75e07xHAIh+YvS9KyaVM39ESiF/66tXbphMfz7i4g==
X-Received: by 2002:a05:600c:3112:b0:439:99d1:d4a4 with SMTP id 5b1f17b1804b1-43ba670a870mr109103405e9.18.1741007921076;
        Mon, 03 Mar 2025 05:18:41 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba538b9fsm194821915e9.17.2025.03.03.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 05:18:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Mar 2025 14:18:28 +0100
Subject: [PATCH 03/15] gpio: adnp: use devm_mutex_init()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-gpiochip-set-conversion-v1-3-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
In-Reply-To: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mun Yew Tham <mun.yew.tham@intel.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rVvnRkyDf21RjdggCKIxDxEyQFvc1fgcMj5lcOy+gbw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnxawp7Yvsyrv6sI169Lp9L4rRvfe6m5SnbOO8v
 UqoONS7cQOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ8WsKQAKCRARpy6gFHHX
 ctf9EACVXYJIoLFFThB1bopDzr4Y6565Nv71gHd7ciywfLXPYQ6yTBNpZh/2RSmBQB+e+ja86PH
 CUip+9SBF9kzpxZiGkp6FhfuDN54tAmirDRWrtRODLUV3iHyzK9uH0jo1tXljQOt1NYRquUBhgN
 bGB/C2ihy4oE6qHKnMakBSbtacDEQp6fbBYxfNGH84kysXmJQV43Mv1NUjNnf/aHFKvNkgWDtin
 vHcT2e6jtYK1G5qPaEchHbyTOloRaGL4KXF+r87jQrAvoJFh5Qt7IswZ/Fmv1p+Er+tsRg1Dn4Y
 yYvnyN2mVheduT8LzO4AzsbzrjhkjYvz+vNbkfnZ450m15iY9yEiaCFyFc9WzGuR4PWA4+Vqbtb
 79F2tyV/LUQcR35Okda9wZAqhOGnH1EsdPjzfoAjV9UaqS3Dl7KloSMDvc1a5nEL4sX4JzhZgHf
 9ZF2kvH0tk3HMIpOQQR/ZbQ1CTCAxX6av1Qdbniwf08+kv/DyzDulxnlVG/qXDQ5LhC5fF3iUpM
 hdZiVTFUbzMvEXFScb9AF/4l3uK9w2PgNEZjDZ7aIzESl4APeYcOLcMK+vKAIPJUlaOYbOwMBZo
 lfhFveb81B6cBFCYG0aoXsPcfnT2rUfb4+52AfSHbC6d5HEiyQpdiT+5q5UoentxBKekBIrFEPc
 Y0M8FNdhHVNmC2g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The mutex initialized in probe() is never cleaned up. Use
devm_mutex_init() to do it automatically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-adnp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index dc87768276ec..d6ae9cf1eb54 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
@@ -482,7 +483,10 @@ static int adnp_i2c_probe(struct i2c_client *client)
 	if (!adnp)
 		return -ENOMEM;
 
-	mutex_init(&adnp->i2c_lock);
+	err = devm_mutex_init(&client->dev, &adnp->i2c_lock);
+	if (err)
+		return err;
+
 	adnp->client = client;
 
 	err = adnp_gpio_setup(adnp, num_gpios, device_property_read_bool(dev, "interrupt-controller"));

-- 
2.45.2


