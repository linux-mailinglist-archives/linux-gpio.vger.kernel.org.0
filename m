Return-Path: <linux-gpio+bounces-7614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4EA91271A
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 15:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E9911F21502
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 13:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF3863B9;
	Fri, 21 Jun 2024 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XHsI+mre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632FD1C14
	for <linux-gpio@vger.kernel.org>; Fri, 21 Jun 2024 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978388; cv=none; b=IZQpn1Z4R+e37TUD2NbGdWGml8mTr5UXYeCDq7ZAVNnqbNDZERHaJk4fejkzat1oewsZiTlu3L3Uvz2RlPlhCBTJwCTYWlpRi4xjIeRbBsysC2mN/RQk/Zwd1bwa+kyDXZoF/0EdwlviTFaLD4LoupEypVnOc0uNrkmyXncwN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978388; c=relaxed/simple;
	bh=FZYuR10D3WxYTlWhA72cyRk2pMy6zS8D3yx7lj0lctw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekLC/bDxVK2uBOMF4OUWjUnYgbFzQPzHZZN2wpDkMm808rnxTgSst8JTwER1ym5Ia6Sp7qeP2kxdfUZI6mclW/0zXlFDCI7aZuCHJGtY2xVf6VVOFdCf+7op+9MJaf2g9ikCxt6whEdqhAtE258KJTpJXsq4wBfKBTBExR/pkTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XHsI+mre; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso1625482e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Jun 2024 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718978384; x=1719583184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9o75QltN1QiHAAa6uL1Tv0SbyB0F3wn6OTH/+H2NLk=;
        b=XHsI+mrea6CkAzeapGubED2x4YTCN4JljbHp0L/1f7ExpOSXKlpSm7C5upB6HKjYU7
         lMv+Yl7/aeMjO2B0SkzWsgRBZLFdVavTfNFW0Es88bX++hKpGulyI8P1wsNqsknVt1cx
         e9Iw3E9MHo1IW/aLpzhaD8KUjNG28S053sVANHPHRhqXcmvq17M1N+h2jCIK4lwr5R8N
         BVrk784Iei5BpMPlEYOFdj9qdUUNDnI+L+KDozTEDaSQJLN5UvufUvpg6Ix6J17L2uJK
         xIoMGd4wpMzRW+D6PwO7ZVIbEfE8Hm6YFEz+ilW2HK8fKyQgYfi13T+FdODH3h8erftP
         efmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978384; x=1719583184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9o75QltN1QiHAAa6uL1Tv0SbyB0F3wn6OTH/+H2NLk=;
        b=gQfHITNeLGeYAdkUQ0GO06nESBmCKROQbwUdZbY5gVFpyT0uzi0qyIPDSKEJ1+/Q7l
         sexZ6HPi94OE8cOrqoCWDyPG8GhO2IbYME7oWToV/y6kkI5+LBcVUa/MCehv8285/2L5
         mt1dWkUD9qaSX8jU293zIikWxx4Ty8q2txFoIjVVpOc7gzAIscpcc4NtllxkisFeXhG9
         HhB9fvFsyY84vzt7DYZqdSyJJ+7oy8CY6AG1X1MU37HGSwPr8CFDrqMsAs5+x5YwO61R
         NyCycTzPgblyRSeLlEX17KyD+qzIg5JZGsMXKVPu2ga1DOiJotwDEQp/f+HuiSjlLNkw
         x01A==
X-Forwarded-Encrypted: i=1; AJvYcCWKiIt4T1wIdmz90tW6rJYpd/zu2mq911PWu9aEPSyZOZ78kU+9x+6biQBtTVb3LV4LzpWI45l4QhjdV/P6O7KpO1piz6gN278rjw==
X-Gm-Message-State: AOJu0Yyl/TmE61xogEVbUhfgCXAwsORrXNMq7LBqfBGhEMmNJYNqr1iC
	sLScVgL2eATPMhZ/WuZoTzPDqi62BNzJDN8yRa2GNmXU05DlELZSE1O75Lh1EdNXcLseY39V/pt
	M49GKKEOkN0KU0CjEVLkv5EFgQpUeysDi52iqYw==
X-Google-Smtp-Source: AGHT+IEoK/OVfXsccAiGXwUvTPgQ52p+TiJ9oX6eFqWuApRKUphFPSrr58bci/V9aJZ459iRSeF82xV5dmH+pw6OQH4=
X-Received: by 2002:a05:6512:3988:b0:52c:cb8d:6374 with SMTP id
 2adb3069b0e04-52ccb8d6456mr7618391e87.11.1718978384534; Fri, 21 Jun 2024
 06:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618144344.16943-1-amishin@t-argos.ru>
In-Reply-To: <20240618144344.16943-1-amishin@t-argos.ru>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Jun 2024 15:59:33 +0200
Message-ID: <CAMRc=Me5R+YLmx6mh_mfszRj7TKx25cL9Vx3J-7mvRTuat8Puw@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: Validate the obtained number of IRQs
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 4:45=E2=80=AFPM Aleksandr Mishin <amishin@t-argos.r=
u> wrote:
>
> Value of pdata->gpio_unbanked is taken from Device Tree. In case of broke=
n
> DT due to any error this value can be any. Without this value validation
> there can be out of chips->irqs array boundaries access in
> davinci_gpio_probe().
>
> Validate the obtained nirq value so that it won't exceed the maximum
> number of IRQs per bank.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>

Why not Reported-by: ?

Bart

> Fixes: eb3744a2dd01 ("gpio: davinci: Do not assume continuous IRQ numberi=
ng")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/gpio/gpio-davinci.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index bb499e362912..1d0175d6350b 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -225,6 +225,11 @@ static int davinci_gpio_probe(struct platform_device=
 *pdev)
>         else
>                 nirq =3D DIV_ROUND_UP(ngpio, 16);
>
> +       if (nirq > MAX_INT_PER_BANK) {
> +               dev_err(dev, "Too many IRQs!\n");
> +               return -EINVAL;
> +       }
> +
>         chips =3D devm_kzalloc(dev, sizeof(*chips), GFP_KERNEL);
>         if (!chips)
>                 return -ENOMEM;
> --
> 2.30.2
>

