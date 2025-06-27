Return-Path: <linux-gpio+bounces-22327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551AAEB1AC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 10:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6619D5640C6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 08:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB7027F002;
	Fri, 27 Jun 2025 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0X1vnDU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844227F00C;
	Fri, 27 Jun 2025 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014363; cv=none; b=cPV09yhEieut0b2CTyubl/m2H0E5zB2JkURW928v1NKHB0oubA++63iSCwM+7XFrfvzyVJllSSCyjRsYL3HbMgF804/GgpFHsc5mFTfBaj/mg8puvfbApTYw94HIPSrfMrTBQO/+HbIDRN6AaYHRTXYjCO8Y/iTtxLHzII+jfXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014363; c=relaxed/simple;
	bh=MVi8yWxtFhXoKsglCyvLg0uvnEuEB32/G55NLIq1SuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODZfGtTKw25kYR38Q8ECi72beVU5qkW9/yBJF64lIzoKwYwl94Vb3DT98GRCLweaTbatChJ9S6DYvNPRvWatu6TKjPK1HpDsM0VwjBjYYCcJ3aD7Qor2tLQIGYCsEdlde8WP5vbsUUm6Uy2b5hoQB4kYUnYroOXJrpuM0sh2tfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0X1vnDU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4537deebb01so10041995e9.0;
        Fri, 27 Jun 2025 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751014359; x=1751619159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPYhSssyoo10A9+7dWN2Lf8KR49WV8MfSc/Fso5u7Ak=;
        b=d0X1vnDUIIgozPCoDAM/8c6CVK/Y9JJru1pn+MK0CwvCxMxEnM5n7xU+0twXh0TFyv
         pp0vNhS9Gw8ujIUjxkBEsaC5SZPlJiXNRqDSWkhVXOZTAJy+fl7158iNVqV7QVfX5W7b
         Uvsg6eIAubuDxL5XJdnKSu9t+WFm2Db/GIgq2M8Vxv5Pzk90IhSN2zak8wSJ8pVK0Gmp
         Y+/7CkpVJlxqKXZ/EHHAYuITXqnXJ5DliJSKs1vhEHmHJBFwuHJi/QC9miIlXhN63zmp
         IYweASc4MDAf6vd+nvj1VlTcbpJXcpcKl8CnZPrMOuK8zBbcC+d8XDkzcOFM+GmlyQed
         Q3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014359; x=1751619159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPYhSssyoo10A9+7dWN2Lf8KR49WV8MfSc/Fso5u7Ak=;
        b=MYH33AZb3zanZel+6sPtLpIxWydUQrkNzyJwXMgTuPRNx5Mqk8Taa6LBF7nx9cTJwX
         fRDnC37bJ1FUAyuC8t6CrFI9paWlywl8Zn4rvS3TC+yi0fHG8/ipTqtPDKFIJXUftft4
         jmQDed+2O4GDa/YSVoD9mQYCrDBSKFUvMI8lcKnymTNG0HpEbUTILMai0pOkXVIJcPkH
         e1RMzZ8y4W/DbbCrN/lPLuQ7tYiyt1QzJVKaaWGmiHFLroNQ097a8Jyfs3npI9a2eNQB
         0eXNKhveFiNAuPT1xPtCboFWPWfi6kYzgmh0gFgM2f56fMJhimRwyB2WJoBP86aoT26f
         j40A==
X-Forwarded-Encrypted: i=1; AJvYcCU6dAH0PBl/GjyymABY77W+g1oNASQcNvil3iPl4gy5I//Ro0TKdkpErQEgQFVg+ygvF7WHKFLqkjfq@vger.kernel.org, AJvYcCVzdALx/I+BkLoOzjENgkixOt+/tvANXkQFiaSvENvDm90s4/LiyGxaQjovEmNJvIDMqG8LWAFJ18cihBJqeW97wVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlfaHV1JMb2m2CKIAUqFyc+ncZOrsr2ZRPMTUzJP87yDNJ3Umg
	FsfiFLmkPADk0x+O1ceaFDcul+lpNXWI4vzI+YFkFbeNrb/QQoaC2dwiQ/EjAK+hKuYCQNwPQw2
	srUbYv5ksPE5DuWMxdFj1uzrKqrsFW5w=
X-Gm-Gg: ASbGncs8BFu681eHKRJkSo+Dmdg3KzmXZ92wUN4LDXm1oocnKMDl67G2aNFuSnPsIFe
	fE6JID3ZB+DFHVnq9zuebVRaXCwCckMklJUX2nK6qtgv72UJyfI7o1BVmQdyycTx+iUyj7ps8hD
	6ICynwABvVXar9G14WH9QpI+uDIaSa9mIX0AYmYnxUVZtyplbvs4k7Mr1NbNbVDe+qNIV5bWSiQ
	lE=
X-Google-Smtp-Source: AGHT+IFdxDruX766IIoz313iJZ6+nZNOXIuDixEpUMFx3gkBtbofLXCFEuAN6ICw1b3b8B2wPim+s3CjYGJeU8R6JOY=
X-Received: by 2002:a05:600c:8b06:b0:442:f4a3:8c5c with SMTP id
 5b1f17b1804b1-4538ee3b85amr29504475e9.10.1751014359204; Fri, 27 Jun 2025
 01:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d74843e06f73cd4c6e822d65f606e6042a50a0b7.1750945516.git.geert+renesas@glider.be>
In-Reply-To: <d74843e06f73cd4c6e822d65f606e6042a50a0b7.1750945516.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Jun 2025 09:52:13 +0100
X-Gm-Features: Ac12FXxFAq3oRp3cM7Ig6eKoVj6x-DIxBVtkuYZHESB5chmrfEXPgDYZ48hTJU8
Message-ID: <CA+V-a8tDQWcoHk0x+kjxLFYEg45R--Tew8byGN47g-f_pMh9Dg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Simplify PINCTRL_RZV2M logic
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 2:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> PINCTRL_RZV2M is selected by ARCH_R9A09G011, hence there is no need to
> depend on the latter.  Move the dependency on COMPILE_TEST to the symbol
> prompt, like is done for all other auto-selected pin control symbols.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-pinctrol for v6.17.
>
>  drivers/pinctrl/renesas/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kc=
onfig
> index 5d7e6d5dbfa90e3e..bbcbb9f33f71d6a6 100644
> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -250,9 +250,8 @@ config PINCTRL_RZN1
>           This selects pinctrl driver for Renesas RZ/N1 devices.
>
>  config PINCTRL_RZV2M
> -       bool "pin control support for RZ/V2M"
> +       bool "pin control support for RZ/V2M" if COMPILE_TEST
>         depends on OF
> -       depends on ARCH_R9A09G011 || COMPILE_TEST
>         select GPIOLIB
>         select GENERIC_PINCTRL_GROUPS
>         select GENERIC_PINMUX_FUNCTIONS
> --
> 2.43.0
>
>

