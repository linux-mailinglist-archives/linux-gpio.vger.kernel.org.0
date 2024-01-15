Return-Path: <linux-gpio+bounces-2220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C2382D6EE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 11:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6D2FB21251
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 10:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687FAF9C1;
	Mon, 15 Jan 2024 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xo1i5YEz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B1F51C
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4b739b49349so1556010e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 02:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705313540; x=1705918340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn/IBVOWpMMRpEDU1Op72zgW/plcgEu56p6VAHHMjqg=;
        b=Xo1i5YEzqP0+3DdJ5/ASe/O2PaW2LSM2D6iYN6QiVEtmIR2S4u9/PXfg45zNaQdi2n
         d5hKC527sw/NOJvemuSpzAyWGjaFi30VctRs5GPaMhIR1Nz0uY8luKdJeRvCsYBMoejF
         vZMhUV/XFWbASWxbdFF8YRzGl2MTLGFPhevWwMDz29ymZNRnB7WpNN6s4fAwiMONQF7O
         7uQsb6XeW3jeRfLQSNhMw33YFfPuoi1anWuldQ0glcp58Vpl8eGn4/+5qqChNmtW0f0f
         gOOIhjy5w6t2Ot71uITylYGk1PqDMlou03VGjV721ZOzgUN7+jjGqhRKOzGPpBpuc6l8
         yh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313540; x=1705918340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zn/IBVOWpMMRpEDU1Op72zgW/plcgEu56p6VAHHMjqg=;
        b=mOUS445bRuXdT3belL5JtGN4G1/g1k1QB6evZhfcsQ5Cjwe55io1yplKl+L8TsJGZp
         To2q2US5AJuXH5lTaBr+7F+LXgszIkPcZ4V8ZUeDDtvidhAxapA8ccWnYZtbto0Of+mS
         lRMSJFBb0kMBOuX1D5nHONBEkW+BDgCArhDvLK+hP0fO8kTFyIHEFYb8eFozx/UFpZi4
         4AWi5LW1VY5tUyvbYjG30H9acejk5tEMG5kmBlo9Ogzhy/L/ugDkniRVB/JO21d4nX/u
         E+g/EsQ78bCZ+Xh5QTeGsHTU0rFzV/M43imO+9FK9znK2fgflXzslgqVEhdLFc3oej0U
         vJ2Q==
X-Gm-Message-State: AOJu0YzBvBq8fYadWj3OCLl+XhM9ylx9YKh2Opxb4IMiPv28i27Y6LFB
	ev8HOLXCvCIMMJmh0RmEpqeCxmskZH3N3b5K34Pm1HSF0Z753g==
X-Google-Smtp-Source: AGHT+IG+6FfSJ/63KIfkM4DCBfQbaFiAAhpMVZ3g61Gxu6cr4QzwOSBvdT0o3Zf1lAyRS5xN53QYacrHnUdaf0bd8wM=
X-Received: by 2002:a05:6122:4304:b0:4b7:386:e209 with SMTP id
 cp4-20020a056122430400b004b70386e209mr1919852vkb.14.1705313539903; Mon, 15
 Jan 2024 02:12:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112042403.3940316-1-suhui@nfschina.com>
In-Reply-To: <20240112042403.3940316-1-suhui@nfschina.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 11:12:09 +0100
Message-ID: <CAMRc=Mdx0OcvDN3rjjSe_K69xzEewe+JyR0639R1jOS9uhp1XA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mlxbf3: add an error code check in mlxbf3_gpio_probe
To: Su Hui <suhui@nfschina.com>
Cc: linus.walleij@linaro.org, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 5:24=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Clang static checker warning: Value stored to 'ret' is never read.
> bgpio_init() returns error code if failed, it's better to add this
> check.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpio/gpio-mlxbf3.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
> index 7a3e1760fc5b..d5906d419b0a 100644
> --- a/drivers/gpio/gpio-mlxbf3.c
> +++ b/drivers/gpio/gpio-mlxbf3.c
> @@ -215,6 +215,8 @@ static int mlxbf3_gpio_probe(struct platform_device *=
pdev)
>                         gs->gpio_clr_io + MLXBF_GPIO_FW_DATA_OUT_CLEAR,
>                         gs->gpio_set_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_SET=
,
>                         gs->gpio_clr_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_CLE=
AR, 0);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "%s: bgpio_init() failed",=
 __func__);
>
>         gc->request =3D gpiochip_generic_request;
>         gc->free =3D gpiochip_generic_free;
> --
> 2.30.2
>
>

I added the Fixes: tag and applied it.

Bartosz

