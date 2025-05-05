Return-Path: <linux-gpio+bounces-19591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EAEAA8C73
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 08:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4948A18903B6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 06:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B7A1C3039;
	Mon,  5 May 2025 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cnCr3Up5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA52AF12
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746427855; cv=none; b=M8A5jqZ2iqgk+pa6nFkM9eCbtbxyMBZzA3eaqXfw6+WNS1zsZqrXn6elrtqyByd+rZGObngT4mHh2o0d+yyQ+NSE5zHC+obKZAJbU/kQqe/G0FWt7d6iXwU0lAC9pMnXbFDfk/YSHmTo28jg6PliNkRR9ckwPXqP2HudWUIDi8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746427855; c=relaxed/simple;
	bh=c4ZQBUMn/VoUO8vRN2n+APMsy1PkJH7Jfr08u+sr8QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnfs4VZDcuulVgM+TAelSr7AnbwSMEcakqd2FmMMNEecIpEjxs1ACGQMbxs++rzWWV6t94FKe50g9XkdY1w16XWDLlONeifHEOQYT/nGXdsJcILRat9yMpOYM8NQKZc4W7DRla8ue4tGM6PRFJIXBzsqDzhDjsghSgbJL/Q3z0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cnCr3Up5; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso42645891fa.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 May 2025 23:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746427852; x=1747032652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbyxFb/dxGAzdjot1cWRldqEt9Sh5+xovy8mV3fvyjA=;
        b=cnCr3Up5CAWbXCmcUvmV5j480dPRjcMcBxHAKB8tNLtENYlm/C03V+k7feolnSbtmV
         lAaO6xK+R/xxa3XyZA2vdPFyUk2M9Nx6gxYQMS/7Q1fDWP/jbro1ff+YO5St1S/7a7+0
         V0CrcKHiALwycnAPw1FVe+RzLM6LA6g09BfD1z3xdbKT3fQVDdd1AF9PDTKkYqIKPSo8
         MWBt9p1ithW5WYKp802Rl/pmR7NauQSfyQg+yDJV9mz2o0yf13jzMrxhisY8I6wr7Szm
         qbo7iu4bhNbtvgn340bvsCHIoZkb0sElY78iR05OOqZq7aGGA5QjSxrj+20sAjDrguzd
         0bVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746427852; x=1747032652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbyxFb/dxGAzdjot1cWRldqEt9Sh5+xovy8mV3fvyjA=;
        b=ORErxTcWsS/PEqYabrJ7lUel5PD2rKN13t4N0hhg5bKitkY854aQ0PvQN2gJM2CLLS
         7z9qdc0VNjXuqlwX8oCpCxzLbwsD4AZQO04uiEaa6Mkkaykho39noE078DZIfCFBXz9M
         oj13BygSV9eFUipLgeSArtQhkUMiFcPUetAFEADQY/m7BzogCtzQg+QdR3CNX5j82CT2
         MAklOV0oXZ0BkRA1uHi/BXCpzQzKjYQYPTQNbo8gMPYv+4U0/0lNQJtJKLjkJgtSVcjQ
         KN+Hr4lnCbtIMPvdgFhp6FMg9DuxYMu2CJSMJJRUrhuvEMOtD9QNInFjmlAjij6CgsYl
         SOCA==
X-Forwarded-Encrypted: i=1; AJvYcCUzskt21soP/y9u1y0yPY7qaecm9KVDsAPrRhQEr3EwSwpJxSb6v/8rNoOCiE9hu1A4jcw4OL6HpEPq@vger.kernel.org
X-Gm-Message-State: AOJu0YwzwCCanQQREo7/97aemFQDcmuWVjNabrUr6HYEhiL00Bu89NJF
	E10PjUJBhaB+q9j6YLmPoSvsD4vsd7N38DaXZnyRUT4V7U0o0oGg+FsqPD9sIrBg9j06J+nUGFA
	LTe2zj1p8maAfT8PgxRo5pxje4m3s5Pk9fUk/Jg==
X-Gm-Gg: ASbGnctPFeTVcxLAERmhwHJBkveRna1rj8PeG3cXywghdPm7WAxFOfCaH2nYG4nT1W2
	bTMRHVoAqdSlzSqXScnvHAS+ANHoW9EifJGO+DP/X+JiymAGTZG+ei3SKKt3l9jy3SLITfSgpKF
	ZhKSgwYjR2Me7zK1tGzz660evzu8uiV0YNZJb8tAwpl7lJpEsRuJH6q7ylH8lgkl0=
X-Google-Smtp-Source: AGHT+IHgYvw6fOkyyiCKq4QfxnEdORJfhCwnB/NruKqs6eztGmVUrh49LXjtpm9TvPQMpypwr1TCoSuqdcH0yffsPCg=
X-Received: by 2002:a2e:a542:0:b0:30d:6270:a3b4 with SMTP id
 38308e7fff4ca-31fbcf4c9ddmr38559731fa.15.1746427851905; Sun, 04 May 2025
 23:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502203550.2053573-1-arnd@kernel.org>
In-Reply-To: <20250502203550.2053573-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 May 2025 08:50:40 +0200
X-Gm-Features: ATxdqUF6f7nwepgbCqjlbAglbnMNGYO0fPR5ZRr0fWiNruz-evCms6ksgSoPbUA
Message-ID: <CAMRc=McmsV-igk6MuvghJCuM5oThjYGqKV+dYn3=b1J0ar7fgw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: fix CONFIG_OF dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:36=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Selecting OF_GPIO is not allowed when CONFIG_OF is disabled:
>
> WARNING: unmet direct dependencies detected for OF_GPIO
>   Depends on [n]: GPIOLIB [=3Dy] && OF [=3Dn] && HAS_IOMEM [=3Dy]
>   Selected by [y]:
>   - PINCTRL_AT91 [=3Dy] && PINCTRL [=3Dy] && (OF [=3Dn] && ARCH_AT91 || C=
OMPILE_TEST [=3Dy])
>
> WARNING: unmet direct dependencies detected for MFD_STMFX
>   Depends on [n]: HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - PINCTRL_STMFX [=3Dy] && PINCTRL [=3Dy] && I2C [=3Dy] && OF_GPIO [=3Dy=
]
>
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD_SYSCON [=3Dy]=
 && OF [=3Dn]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MF=
D_SYSCON [=3Dy] && OF_GPIO [=3Dy] && (ARCH_AT91 || COMPILE_TEST [=3Dy])
>
> Add back the unconditional CONFIG_OF dependency, but leave COMPILE_TEST
> as an option when that is enabled.
>
> Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPI=
LE_TEST=3Dy")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index db84d80b7e7d..5d368fb66115 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -103,7 +103,8 @@ config PINCTRL_AS3722
>
>  config PINCTRL_AT91
>         bool "AT91 pinctrl driver"
> -       depends on (OF && ARCH_AT91) || COMPILE_TEST
> +       depends on ARCH_AT91 || COMPILE_TEST
> +       depends on OF
>         select PINMUX
>         select PINCONF
>         select GPIOLIB
> --
> 2.39.5
>
>

Hi!

I sent an alternative patch[1] which simply removes the OF_GPIO
selection as this driver doesn't really need it at build-time.

Bart

[1] https://lore.kernel.org/all/20250502100841.113091-1-brgl@bgdev.pl/

