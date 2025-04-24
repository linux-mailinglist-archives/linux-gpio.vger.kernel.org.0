Return-Path: <linux-gpio+bounces-19247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E67A9A632
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E871B851A8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2F1221F14;
	Thu, 24 Apr 2025 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MfqqFaqi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2D122069E
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483756; cv=none; b=KSz+Zc0dggVIpcmRMQV1+bXhoc7llPWqaVT5DVjX7/7D0uv04wQO4NZHV1pg2NZP/twuajWU+ZTethix8MllCRyvkAKouXy4JgVab0zcUUiN86fHfw0miIEfua5dDFizetTnYFjHwQvU5dJECFK2wA2JH4PsU+dG1tHQuzFKeqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483756; c=relaxed/simple;
	bh=gr4j3Jwm5V4eo0S2WRVkEBQvxzFKQLytZ1nLPQ/vxUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbQS5jw95nOCcvIdDDVmMdgsu3ghbRY7paM2by/Pqyr72znHSarxjkf4s50Rxh/8GZpi/kMax2mTFk/npbVPMBDjTcklCVXlRtEvnNimS/FNKh3k4ggXcZsRvleJLxR65V8RyX1Batl6DayB2QrqOfmB8wiYRdUSP/m6/MSfKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MfqqFaqi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0dfba946so489524f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483752; x=1746088552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
        b=MfqqFaqi5fI9QBgCHNug1fFjoGj9AcpzNN2DpRqfCF0E3I4conwKy+yhZjvM0G5o2P
         HH+1zSPV7AHWwf91N0LGC72z55eNHpqPqz8nzmTx+H4788xT2FEqUbfofmwOyc6k/qKo
         qVXdLcyLBNqxJFFk7R3SOW+BLztlkVst+cWsQIOYHL/aQ0wuvwefs3PStwRK+ImaNT/y
         FcS17cEoM7OJxXizFGqo/bzKAt2n+Im3JknF7GAJuNKECNJQD0yhn5omc/ifgfMU71t3
         elbULIMlxaKGPaWIx5RVHzP7XgiyQkejDJn/xhx5Ye/WYE8bb918W8Fsy8KP1+pMCirD
         GuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483752; x=1746088552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
        b=Xh2LpZgXHy4MdpIy+1JQSgpD3fGZD49jguIzZ3PtyWGWSdoyXWfctDk8U8Sfp1FdhU
         /W8vSaUdaLg31iv7Ckem9v1julPDqbH+fLM4Jj2QpmSjI6iC+aXlcR8KfmdgpLHTju/4
         EsryjFyL7q81DwGffI//CAHltDYd1u2GXwXrSIN6KNY3AjVENSY6nEJ0Ec1T93rJ84MF
         4Lsumz3anr3MARpOYlWnW6tU5WF7uUjF8awFYBJnwzqXdnOI7xHtrLrmKwQC89ewC0HP
         Iu3zkTk7SU45tZ/pNDbnFa6NohkvsLrLcWddNBdrtn2LbFw5bhaUnWxNWJHFpYntHY/m
         WroA==
X-Gm-Message-State: AOJu0YznN2Bc5uXdB4EYw6+z9Tte0L0DopAu9v8i8FDbN5sXsQSBPxVc
	kI9C6IsLznacgP5Pwv0twx8BsoBk3x3+l9ugc6agMMMkSiG4Fvre5irpZ6at/Fs=
X-Gm-Gg: ASbGncv5fdfjB1uD2yXDN5lllwGdU16iq1ZfI0+lcdl0Z6XeOtBkAXBw6GXM59mAvlI
	9PKjq0fsnfu0r3OvBGEupWBongibjzKupUByjy2ByzHX+224gy3eLtZy/omvh1RB3TqeMYJ/QWV
	nlDQm4P9b9rz6cNQyK6NgKoFGqmOgBDp0N1IlLwsLyqSJeBAu52OUWhlR3nhzDt4XMZRPGGIlkG
	fcxGOqvHOLNUzCIlbyM4+xJpHEUH0dbSW/QvfScE2NWlkzq1uTo4io5xPgLBgEITt7vnIYkViTx
	pus/pe86QIlAGD7y1UFl5kD1i0Go6FHKxA==
X-Google-Smtp-Source: AGHT+IEVNUQ6vip2brhi39nvtk6MkVQTh+2bIVjwhO/bWPyTJvPXnQpR+hxBTWqkmpl4+az5f4M2GQ==
X-Received: by 2002:a05:6000:18a2:b0:391:4ca:490 with SMTP id ffacd0b85a97d-3a06cf61b5bmr1267744f8f.29.1745483751476;
        Thu, 24 Apr 2025 01:35:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:29 +0200
Subject: [PATCH 06/12] pinctrl: ingenic: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EpaHLTvHgujEi7qKfzUhgTml3Oo3ftuzcWIJ8X5naTs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcqRFqMqwDfrINHgXeUxjJc+Heti6mMqltZ
 WXN9WyQbmWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cofZEAC+M87Cf+K0esqTbzfza67g3hY5z0YJwPkX2vXvmZuWICpN8P5imK8RtM9vESiUtCN0ybB
 hTNiizbnx9EY0sYuvoh714dAmY5WntJSjg+lKkHxYaFY6O+kKPcQks2ESZNLsGfxCIwbDjx8UE4
 dnA7N2MMnPS8EHdw7onAjS5gytn0XfnCyma6MvFGEEirp8OC/7UTcsEttr5kLpIOt4qze7JZETn
 c2Yla5eOk3uSZp0IWQDbBkMnxMJvqSA4uUuiD32PERh/cGH6Oi9u9nkcYojNbnhFVUnNgxAow3j
 GIWL6FS33qlbPsXXexga1/6/bHbdKgDL3kcsbJfT7ROdq+AhtedMoKE3uUnu6SID+u7yy1aIrMV
 u1VfeW00/l2wDrmsXSb99WtG8SonrP0w5jQe/uKxq/lUdKqkdDL/K048p/84bM/K2FaTXS5PqMa
 LQYoovAMpXR7KiqLnNlvPkXUcMQbmXmJ9w7sfdj0tIrsds/fklzsW00FLM20w/UWRnBoPwkgcsU
 s5fKhyEWdbM8MraopZYWx0OkbqIL05w24OOAcEymloFAxHQMBJEDkM9JKO0iPMkeECvZ79w/syz
 fjW9mwYO4qG30U3wUD9519EqOnbGP4olbfbcmmkC7HSPkHjZzbmWs+VYwUqCBTxWMAUIsCaLlbk
 hX+zipAXZL6tN2A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a9e48eac15f6..3c660471ec69 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3800,12 +3800,14 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irq_chip, desc);
 }
 
-static void ingenic_gpio_set(struct gpio_chip *gc,
-		unsigned int offset, int value)
+static int ingenic_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 
 	ingenic_gpio_set_value(jzgc, offset, value);
+
+	return 0;
 }
 
 static int ingenic_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -4449,7 +4451,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->gc.fwnode = fwnode;
 	jzgc->gc.owner = THIS_MODULE;
 
-	jzgc->gc.set = ingenic_gpio_set;
+	jzgc->gc.set_rv = ingenic_gpio_set;
 	jzgc->gc.get = ingenic_gpio_get;
 	jzgc->gc.direction_input = pinctrl_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;

-- 
2.45.2


