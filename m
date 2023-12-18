Return-Path: <linux-gpio+bounces-1596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2D8168D4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 09:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC79A1C22243
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 08:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA06810959;
	Mon, 18 Dec 2023 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JXjl4cAI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B1711188
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7cbdd011627so126716241.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 00:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702889693; x=1703494493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcy4Qs/F8NZOKre+BKtAjIT9nwGwO4y66Sp2H2m3iBE=;
        b=JXjl4cAI7nN7/IRj2h72po246CciLmd0O0YvatKql4XtkV3BaE0zkW3X4XZu/XCqqJ
         XuFa7+Q7HQfVuVgoz2DJVVYEDZKidvhUBFJcv1jd8+cmy9+vRJPO2BJ82kWKHh4Bwvvf
         7EU1yE5JcENhWdbvM5E31PJ1PkB2kUbJwi3jnu6jLEKnzDrh6hChOAc/OXSXWoSkoJkR
         ggpqkKxuyn9EWuYyKkGg3kFyqjYzyGhTGRft40pmc1Z/AlLvdwmm7D831Ug5p3onO5St
         33ISEjkTWQDd9dfUDR8jNJddColoHgk5jIWYxEjFVP54+SACOzUulIjkDZUaFLO6rJ7V
         kkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889693; x=1703494493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zcy4Qs/F8NZOKre+BKtAjIT9nwGwO4y66Sp2H2m3iBE=;
        b=dy4bX89QyEX/5OEN983WRtPDLiDd2ign651mW5UnUdZO1e5HFtSvZF5+GtML3ITqen
         iIbt7kZ3ym9QV7lqdEu0oXiArPQBZ2FrCMSoUA29Bx9BWV815n1pMtsc/RNkofRD6ZBs
         DQOyII+CWJll36KQb5NlN0Ppntk7gcGlpfOX3k94Ei3QdQ2YYmeonfcWvSSVghm30cKm
         V+O3fJ/UrTh90zLT44ODy8Vu3vF+RFplyMKZ4jZGZKlCvl37n/QG+BLFt1EgIk0QgBqI
         YFQh1og/vEmIIm5w5A2UXfqmGk+RF2Cuka3Xe5g1um5v1aBpLWlIXd06XlUhCjZQ6XlD
         eM3A==
X-Gm-Message-State: AOJu0Yw+rmtNub/ABSw46GvKoHPWzImjgYEvT1W/aqRVLRmRBuJDN8v8
	w4N5rdaMwV1sfg2exdJFaHeKBB1rAgdjM1auIxiFXQ==
X-Google-Smtp-Source: AGHT+IEd+o68wmUpyG+J7UjiDt2djCJTwff101JpGUud0EelGzhHfUSZ4qLWXzX9dq0fpdbr60RDEy8NiE6oVOuO4cc=
X-Received: by 2002:a05:6102:3d10:b0:466:9d70:6f03 with SMTP id
 i16-20020a0561023d1000b004669d706f03mr250157vsv.14.1702889693302; Mon, 18 Dec
 2023 00:54:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202312181513+0800-wangjinchao@xfusion.com>
In-Reply-To: <202312181513+0800-wangjinchao@xfusion.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 09:54:42 +0100
Message-ID: <CAMRc=Me+wQroZhnVhwvdfFeOhFQ+1ACr1cLu2Pu8TQDpvyKpOA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: cleanup for duplicated including
To: Wang Jinchao <wangjinchao@xfusion.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stone.xulei@xfusion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 8:16=E2=80=AFAM Wang Jinchao <wangjinchao@xfusion.c=
om> wrote:
>
> Remove second `#include <linux/err.h>`.
> Remove `#include <asm/errno.h>`.
> As they are guaranteed by the global `err.h`.
>
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
> ---
> V2:
>     Revise the comment per Andy's suggestion.
> V1: https://lore.kernel.org/all/202312151645+0800-wangjinchao@xfusion.com=
/
>
>  include/linux/gpio/driver.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 0aed62f0c633..df6857e579a1 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -701,7 +701,6 @@ int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
>  #else
>
>  #include <asm/bug.h>
> -#include <asm/errno.h>
>
>  static inline int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
>                                               struct irq_domain *domain)
> @@ -789,8 +788,6 @@ int gpio_device_get_base(struct gpio_device *gdev);
>
>  #else /* CONFIG_GPIOLIB */
>
> -#include <linux/err.h>
> -
>  #include <asm/bug.h>
>
>  static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *de=
sc)
> --
> 2.40.0
>

Applied, thanks!

Bart

