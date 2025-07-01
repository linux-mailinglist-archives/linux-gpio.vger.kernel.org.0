Return-Path: <linux-gpio+bounces-22461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49349AEF14C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 10:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BBD416DBAF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 08:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7E625F7A9;
	Tue,  1 Jul 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bBdZVLUa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F71FDD
	for <linux-gpio@vger.kernel.org>; Tue,  1 Jul 2025 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359056; cv=none; b=I3JVkp6WyqoY5I05KI4eCdFcHRZFdKfoZqeDedk1nvCHe0hfSfXPlhu7mDRAa7JlWTg5ENB49ZvpBEl0Vjpb7B7CexHQ+nBezuDagZn1Z2trhbingjONqc5V85N2l7G9RnnDbdgcCOHphDUFgdU7Lj3V8dOR2N8aITt1A1x84vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359056; c=relaxed/simple;
	bh=0FAQK4GPNLp7W/8Va2XXXtiOSv4J9N3di4b6rvDBSl0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pDjEBv+bDXih1hsQO+q9e2eCTKDrvUDoeydLq/SLcBLdUiT9uqcDwie2jpoPX8taIZ1WwQlHc+4Q44OormmWyi0F4NScXo0VelbuqJKFPylEy+BrT/NgtJ5dWgeJ+0BP8nS3bHbcSZgZwlepHKw2v4DIc6ZOUIA+NxVeDAuLJ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bBdZVLUa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b6a349ccso3352624e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jul 2025 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751359052; x=1751963852; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=07KmsBxLr70WlDJaoogJ4I1ZjRZHxPbMAX4KMX+Pp+U=;
        b=bBdZVLUaMyiK72MMAovrpuvyI3JjrD7thKbdSQ5uWd7JlyHo0jcI6bRc+uWAQZZBgf
         4vBnkap2JZX2tyvN9Bz1TcuLNL9SVqbrFQcy1bgf6vKifAgaXSed/0Gwd5dA2IKI9Yjm
         1UCrOfl+sXMkO1huUPM6kEadEejhDjdzO7uEG2lIFWLUBCloYU6JJMYaE24gUD+SNAcP
         3xDA3ZGxJe0plDCk6qzKA6MV69eeii1ZXwSxBLN9gJ3XnYuCZdF6dc66u/cBIa6UUVq2
         7Np4sEh6f9fQF+5LYpp2VjP/Lqmk7Asys6+NQs9NRlyDf87DKMai3P5BcWmpmg+X6Z0h
         AR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359052; x=1751963852;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07KmsBxLr70WlDJaoogJ4I1ZjRZHxPbMAX4KMX+Pp+U=;
        b=FBxjnBsVG2OOOmIzj1o2E4OorpFS7aXoLP8bwpC+yKcsiH+kaAa2tDu8gMDp7YeEdC
         2SetZQzVVfq02sUCoMw9EAdwvu/KJdf7J3F1j7uo5SzcLryZOKhGazIoIvNLFC0h1z2i
         tUDgnvKKCW0RNMLBklH/eHgJZ261/1sIhgEbp+q4NHisT2v7hPUFjIw2w5ES/p3OOAhT
         MKHRrAhEbcgSuKFSIDJ0XQr4sYCVMgNQdktKDDVLWdn6aq7HGjzU5PfFq8PRKwdX358O
         gnXexmidPS3IG8NpTAOJf0n4RB6fPFMgUIeCIBQxh8V9d2hYVAqRqkM5YLUe14KhTd03
         CTiw==
X-Forwarded-Encrypted: i=1; AJvYcCV/GMavmzhM1qUREg3t//7OBFOfZ70r1CHpNrYTtPANY2I7ZgbwmV7FS6C318/vRXWFge9vtCE7RP7x@vger.kernel.org
X-Gm-Message-State: AOJu0YxVkQDkP4hMnDxba6NcBBT0lpo4GVoAtTzGEniIY6KnZ9fpsGBn
	+NLj/+2r84G1v3URFM9sdbhJWZambMvyRVSbpSf+Eou6ZohPMFmNESbSWZXEfUyTDo73nrzRGWL
	hvSVXJzKFZYO8OJvKSGaOiXjATJA0xzYv1RW5loz+4CChmx9w+msOS9c=
X-Gm-Gg: ASbGncupWn52FNdt1J6FFkJrU0i31ifA2nFrgw5PsiovR3loso9sMFVeW0Kpb2G2wsY
	AAfaEqsg6bKft3yPnCoiWPm9Dfp29VW6z7ct+MvcSd8XwFB9tcpBqSwEBomC/F6X+XmA4DPndvi
	Lp+MeoJ96GSjX5aNWODJG9aN1xrKFfIlj1ZKqXLlynop5kh75Un97gRywnisdkEmsiU9U3saRYK
	g==
X-Google-Smtp-Source: AGHT+IHI+BlPWVIVeSUferI+4juudgIPFbsu7Mq/0L1LWp/ijJzb065XhAcQqVoKO66kJN+8+P9SqNPQhANAveA/LTM=
X-Received: by 2002:a05:6512:3b9c:b0:554:f79d:ce48 with SMTP id
 2adb3069b0e04-5550b8c304dmr5148800e87.47.1751359052201; Tue, 01 Jul 2025
 01:37:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Jul 2025 01:37:30 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CALHNRZ9=u9hrXZ79N3VzMwdFuJO75TomOzRzgDxzmcTEeatzAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com>
 <CAMRc=Mdwa=DuubA6P+EnjUAQE8XupYsbo=3LuH-jYEBttREGqg@mail.gmail.com> <CALHNRZ9=u9hrXZ79N3VzMwdFuJO75TomOzRzgDxzmcTEeatzAQ@mail.gmail.com>
Date: Tue, 1 Jul 2025 01:37:30 -0700
X-Gm-Features: Ac12FXylvYFEitG_7hQXaffk-th4yp6esDahQWSImhvWXKWNauTlEjyR2VMePZI
Message-ID: <CAMRc=MdefqMEaiE9NAACzBp+UDgoLe7B=JGe8KQe5tCnHYzWLw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: palmas: Allow building as a module
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 21:33:07 +0200, Aaron Kling <webgeek1234@gmail.com> said:
>>
>> This being put into an earlier initcall than device_initcall() makes
>> me think, someone had a reason for it and this change can break this.
>> I'm Cc'ing the original author who seems to still be active in the
>> kernel.
>>
>> Laxman: can you verify that this can be safely moved to module_initcall()?
>>
>
> Reminder about this patch/question. It's well into the 6.16 cycle now.
> If Laxman doesn't respond, is this mergeable? I didn't see any issues
> in my basic boot tests on a tegra124 device using a tps65913. But I
> didn't do anything close to full functionality tests.
>

Why not do the following?

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 44f922e10db2..dcea3c1bb31c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1501,7 +1501,7 @@ config GPIO_MAX77759
          called gpio-max77759.

 config GPIO_PALMAS
-       bool "TI PALMAS series PMICs GPIO"
+       tristate "TI PALMAS series PMICs GPIO"
        depends on MFD_PALMAS
        help
          Select this option to enable GPIO driver for the TI PALMAS
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index a076daee0065..ec503b008d0d 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -139,6 +139,7 @@ static const struct of_device_id of_palmas_gpio_match[] = {
        { .compatible = "ti,tps80036-gpio", .data = &tps80036_dev_data,},
        { },
 };
+MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);

 static int palmas_gpio_probe(struct platform_device *pdev)
 {
@@ -196,3 +197,7 @@ static int __init palmas_gpio_init(void)
        return platform_driver_register(&palmas_gpio_driver);
 }
 subsys_initcall(palmas_gpio_init);
+
+MODULE_DESCRIPTION("TI PALMAS series GPIO driver");
+MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
+MODULE_LICENSE("GPL");

This would keep the initcall level when the module is built-in.

Bartosz

