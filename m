Return-Path: <linux-gpio+bounces-21691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A680ADCB45
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83537188E1AD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784D32DBF7E;
	Tue, 17 Jun 2025 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gEXioIFq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7122FF2D
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163087; cv=none; b=dkRambN4+rtn1YkXWPoRVB0mzqgAsmaBi10oBYkNhAaUyvYvwUPvkbz2tX8X7e9iIWIwtxUuNG89BqGF8P96oq8SJ4tCHkVGI5FijKaraBxVp2FFBF1M8HfieDkCiGF50Etns8dTf3nx+K2oFiY4+hDwAPeF1qDgIKNOE1p6blQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163087; c=relaxed/simple;
	bh=r8YR0XSxpNQwUjB1snBTCh+aO57h/fzpJl+JXwgznDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NLfX4Ju322oOYr4VBKlV/eu55VJoEZ6CfYwYuYR73B69d18D7N4VkfaO3fVVDz3GJBRD9x6cOBlgVQAbEMrhoJbS7HP+DAMOJNY5RCrPhfu1ZNzUnD6ObKOjl5UzWXKPYqU/tKnNzGsK7Da7ETsmqwLaGdG/RJLbEFSWHbchOhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gEXioIFq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so48459125e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163084; x=1750767884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoNSIKbOdd485smFmBnHl/Mm0pNj2Y6zx1eXoO1wxPA=;
        b=gEXioIFq9DT2/5k2J6doqNSlMSseFgijgOteALk5SlzJMWxJ39uSzHEu2IYKCTmGHx
         UGVGWdHlMILM4gOPSQf8Uo5RVIr4BzivKibWtShBLpOemr2x4jLQD4aJU53Qb3TbKooM
         Zi+r35beYXPuHpyDgPOVTyRf53Y5eeaYYjg1xuZ20sPhwykH2dmsaYPkYpf5kZ+Kfl1W
         xI1GF+FnY371Yrtqwcjz9gGTKmkMeUZ85dc062Y7XBNxF3c0BQUJbQJfPLMFLO2xijio
         Ri+Ko6/FpvIBClbQJwDlPEZY6Nk25eH1HGUU8GfjAZspcx0Yp6np1+9qXii2HRQMS7TZ
         ZjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163084; x=1750767884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoNSIKbOdd485smFmBnHl/Mm0pNj2Y6zx1eXoO1wxPA=;
        b=KjghBjf6WQerBA96VUAU6MAYEl8V+dvABcnGkP/9qhNI1Q2db39cTeo8ZCKwNuKQpr
         KiCf6bBfxkAecwGRIigqUCj8gXSJdvToXcsW73QuQhl4mW6WikImPsyv7daXerqU1kGN
         Xm308UwLPQfDbQK6cctcJYAYYkvk8pJiBohiN3NNWroAnOalpwxu9Ij0WZAXnvy36fnV
         MQIWVuPOPPdX/NTJRQ0chJxnjuuLfDis+kHHDyvL4hPca+EDySXRHxOafCuJXAXhpdhD
         SMCqNVEkFTIEW3YRzxUG/0d5gLiOVFZIasNiOMY/oot1qfFg7An9WEs5SvJrj28a75Rc
         0TTw==
X-Gm-Message-State: AOJu0YxzNSzPosBO7gHnSHRTCL0hYtejUUBKSLhi9Ez0cN+tKKWcFUbk
	CnuJV/ShdIDdXg+xjxB2tH4CG6vGj9Mnr8pj5JjQe9ho3judSacxQVJnUqQ/tdH7R3Q=
X-Gm-Gg: ASbGnctF7COwB+E8i68koCp7wtIXrgne3Xxd5qsUMKwvKKqHcwh+LQWDgXfUdo0/mU5
	0vEP2G0NkYQQ4yfDg4QB4ppKCGfYQoB45axVJXxzwa/3Y6t+CMmRonrB1KU5MA39qPnK7bf+Chv
	Nk+pXRzlWEnNbyL63XKeehs3z7fO3iM/ulQiqjJ5BSbNzBRWz39sBYHCvDSLChOnCVUIgEGlRRA
	LRC+0QCBozn8QNauOC2bsGFNG1fD2M5SB5xa0F9RlbnfF+jZsNxTn7uPEKK8mp2yN2G8ivmwWHA
	hglmb8kniJ/b3q0F8rvO71s5S+is4pMdAyTIdHIlvi7t9f7llfq+66kj
X-Google-Smtp-Source: AGHT+IFjGWRgGD99OMAPMoLYwAIsTODZ+U2Af+jbgXlHRtQDLpU4RqEiIpXtgD7kFvIv8VVNBRGMcQ==
X-Received: by 2002:a05:600c:4e87:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-4533cac57efmr142885005e9.31.1750163083958;
        Tue, 17 Jun 2025 05:24:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:24 +0200
Subject: [PATCH 02/12] gpio: pcf857x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-2-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UjdVhHBdj/MT105x/Q2pFxBb2AP6k98PFv96j+C3ycI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GFFklv2v6R87MrAXNHZyNzFP4WjIs26eeM
 jaLuHbEIROJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 cp0pD/4jqSNOj2xQtdCVE8aUY/oYvVBdI0smTuI1wV5vjnOYk/XOkXPxvKf8cxCKJepJiLLS75O
 9uEpobTggd4GQR20kr2zy6RaQ1C/oR5/3lZ1XIMmdei4517WPUhe04bBOwP66+tx9x2+QCUOfxb
 OiDQPg7BqqU9Ze4mcCV6OzO2wd20MX85sbGuxWFYNnKNLPiJECCNX0MUGR6ktbXHJbtHmeoT+1S
 WeKPV3ZTVNqqeEpizUAc0KyDaquEVYil9JFsAr9MbXMwKtT/v95oJEaMoQe38czxMsnTmnhclZR
 PpVpK2jejmCrdCpG8IS55/a1qyLTuE3SNcfHnxBZeyEeHhStByjQ6V7xLyJlZGeyM20g+oojNAy
 d5Q9OHc7sWW19ebIZdW1MJtHbpv4FEQ+h4M2lyLVqVMs6G9YagQgkFrJgQI1VhVXqYJu4H5fjoe
 nBbzp8EnwzOoqu/qNJW8eL4Vov1WkldJYd7Rr0dHWxsESRABq9OEeqRL0MdnMEUJUmtQcsrG/kW
 f5aKK2U+oh9dXNTgl2ZydapCMP/mB8LSMlIwR4cxuFbdTE+W393h3xmAAcARFBX42BeiJszBJg8
 M4B52HDLRDWzhV7N9lrLgjf6FPQNmi4aM8vrs0vDtJLHo3t0dRpXziFICkKDKqTy+7NuyG8sBue
 U03dII3k8j0I+uA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pcf857x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 2e5f5d7f886598318b753304e7e0efca54ff8b69..a042036803336439d8e164fcfbd0263b0e84f3a4 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -171,21 +171,24 @@ static int pcf857x_output(struct gpio_chip *chip, unsigned int offset, int value
 	return status;
 }
 
-static void pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int pcf857x_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	pcf857x_output(chip, offset, value);
+	return pcf857x_output(chip, offset, value);
 }
 
-static void pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				 unsigned long *bits)
+static int pcf857x_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				unsigned long *bits)
 {
 	struct pcf857x *gpio = gpiochip_get_data(chip);
+	int status;
 
 	mutex_lock(&gpio->lock);
 	gpio->out &= ~*mask;
 	gpio->out |= *bits & *mask;
-	gpio->write(gpio->client, gpio->out);
+	status = gpio->write(gpio->client, gpio->out);
 	mutex_unlock(&gpio->lock);
+
+	return status;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -292,8 +295,8 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.owner		= THIS_MODULE;
 	gpio->chip.get			= pcf857x_get;
 	gpio->chip.get_multiple		= pcf857x_get_multiple;
-	gpio->chip.set			= pcf857x_set;
-	gpio->chip.set_multiple		= pcf857x_set_multiple;
+	gpio->chip.set_rv		= pcf857x_set;
+	gpio->chip.set_multiple_rv	= pcf857x_set_multiple;
 	gpio->chip.direction_input	= pcf857x_input;
 	gpio->chip.direction_output	= pcf857x_output;
 	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);

-- 
2.48.1


