Return-Path: <linux-gpio+bounces-2899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EFA847135
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 14:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89E41C26AD5
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Feb 2024 13:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C74E46549;
	Fri,  2 Feb 2024 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="keirWl+F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D9347774
	for <linux-gpio@vger.kernel.org>; Fri,  2 Feb 2024 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706880800; cv=none; b=gBsBV8q1ulf0V9s7BAyk8zQKdgzMwYjwupL6PQLKRnJT37x03Vdel12Od8Y8T4oQjlHDqPbmGX5uXfcfIZEoiz5ceTMfQIvtRWwKCeS9p7ziflK3NMHEocyZBGS7lP+bNsX4gwIN9HaTmaKT7E7Q/WW60VnXocnB+deoPFqRnxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706880800; c=relaxed/simple;
	bh=h5FvZM4vvQNNPHEA7xoOPdnJcfL/NdwEA3OTpamvKW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K31QdM2hiQ7qXkin+JYNFjewGjbBckLYhX/Xez+aoc9gKeiu4dOOTkiBFrGN+SGuBtDsuBFgAVm7j3I7shycUNFmleo6oVqF2IC5DgUR9vrILjptT22MGZSJ1nNZ3CkjI5HHRk6SqFhOhbqbxrcKWbUgJupC+arForBRCS8+4fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=keirWl+F; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7d625a3ace6so962411241.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Feb 2024 05:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706880798; x=1707485598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABHcyEAdLWO2TnDu9cSX+H4Lljr3MzHerdVctwbmSHg=;
        b=keirWl+FQrSsKZDAyhskKT2mrlhXk/mth2+t6U2ARDaL0MmKW8sILwaFIHYt8YuwhK
         a3ioAlHGYHHbcZ3zgIlCpEI7IeNfxrLj80eLMd5FKLvGALxz1F9wqXCbD5aGP6Lh3pgg
         1Hyy7+1UZA+WGQbwJntRctqusMjVsh1DeQJrLtlHLAy3KZC8koXNeD0zcRB1PuCJnbB6
         7+ZR5BTklPMulGnLy9DzArbSOtZ0QNCf4rG0kmyRGYrRuNRLGO0XM88vkiuLXDR9n7kq
         cVBWtwAfLBWY8NmZe9euIhWEimrvBkV1TSCFMrSUh/HJc9NzA1gqRlEIjiEfkHCYR1Zv
         Y2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706880798; x=1707485598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABHcyEAdLWO2TnDu9cSX+H4Lljr3MzHerdVctwbmSHg=;
        b=S+FXZL5stWFxUH9kwUGzD46EnNvkKhOm6+sxnUuueSKA0IIVkqvFavOm/5OVoBquhE
         qMDMNfGmR1G1/ef6wo3/Lt2Qqqu3j40cLMGa20FXOWthlw6sIPEWMj+lhBB4VPvxmWlx
         iPv5OIpPosZLBYTYy8IA7QD4434X3iovYmXP56p1A6v83v/Z/IEnhgTKMv7Z15jPuJ7H
         gwQRllWiX2/KqYUzTpJD3PXVpehb+nEQqB7Cb+4qg2Mtu6Lo1H7APSUOEW971z7L5Hp+
         H8lZ33H87ED6B0ZBO64nL7f18VWYpOMFb+NY8WN3HW8tFcUHkcNJL3iBiRH9MOtZHGuq
         Uy/w==
X-Gm-Message-State: AOJu0YwhlMgeElc7B8bToG7JcUIOMBEyRP3HqNJse8A/6c/HV0NTbvEX
	op2hTBvXBv0k5qd9fvXzXcI6Rgv/FYmziOLBwsWqLKRnhtbbLGAVhab+DUIM8IHvXYxK0RJb8k8
	0xhipTr78HgiHKYdF8F4FbV6zYhS5l5b1gwzxXQ==
X-Google-Smtp-Source: AGHT+IE2t4sCo6S1CYz+g6JONlHPeGsLsX8UkTO1nPLRyZWTmqGx0L//XrviSyo8YUB/6Z1H702/5yuZWNn3whWLSNI=
X-Received: by 2002:a1f:7208:0:b0:4b6:be22:cfc3 with SMTP id
 n8-20020a1f7208000000b004b6be22cfc3mr1417232vkc.8.1706880798417; Fri, 02 Feb
 2024 05:33:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124205900.14791-1-martin@kaiser.cx> <20240124205900.14791-3-martin@kaiser.cx>
In-Reply-To: <20240124205900.14791-3-martin@kaiser.cx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Feb 2024 14:33:07 +0100
Message-ID: <CAMRc=MeRjV_Nec1CCb-S5q2HW7d_TFFbbRkhFSXFweaaCQ5uZg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] gpio: vf610: enable COMPILE_TEST
To: Martin Kaiser <martin@kaiser.cx>
Cc: Shawn Guo <shawnguo@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Peng Fan <peng.fan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 9:59=E2=80=AFPM Martin Kaiser <martin@kaiser.cx> wr=
ote:
>
> Enable COMPILE_TEST for the vf610 gpio driver to support test builds on
> systems without this hardware.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v4:
>  - add a new patch to enable COMPILE_TEST
>
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 353af1a4d0ac..3081406ff57a 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -713,7 +713,7 @@ config GPIO_UNIPHIER
>  config GPIO_VF610
>         bool "VF610 GPIO support"
>         default y if SOC_VF610
> -       depends on ARCH_MXC
> +       depends on ARCH_MXC || COMPILE_TEST
>         select GPIOLIB_IRQCHIP
>         help
>           Say yes here to support i.MX or Vybrid vf610 GPIOs.
> --
> 2.39.2
>

Applied, thanks!

Bart

