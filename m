Return-Path: <linux-gpio+bounces-6929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB488D485D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4D011F210DF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049DD176AC7;
	Thu, 30 May 2024 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PTJpiTIS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D715278D
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060937; cv=none; b=pwikcXC3yCl5HQfnal6i5OGuwTwa6t9OZ+4nowrMxMjX3N5VGmxyON75fWpY4V83ldlCmfMBgYnB/wzDmC42THdZ51XcNz/52bvzsKNoyA0BKH3PZkGZs3/P1HjhjoSaeX8+AMMR2n96DcuOuswYNDSyTK5raV3dd2hVCZWzx6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060937; c=relaxed/simple;
	bh=qOALaBFtiFKu1Kyw1uTvIGvPyHrAyxbJXFr9phnkPyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocbhb/kbQGtkgnH2pRMbuh/9dXhtaQnyumAyMMHi6vsLOMdO/pfmrAOb87ByxTNqpYluRq7LNVpIpQeNmNG2n32YRMMuBnnGz8K8OUtk/76dqvBSb6slO8IMu7/RgTGlEH6zP0mJA7mwmQTaDHsNM9Gpfbs+GZHloADkT/GMF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PTJpiTIS; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so6645181fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717060935; x=1717665735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/z6JrsczbGlJdeagCzokQ7NOChpkizM9tHLk7nwYHc=;
        b=PTJpiTISayIe2cIHPvwAxRZOwUQ5rkNCEInN9p+19wmMPxnbq6OBTG0g0eJXQtGbnn
         4AvcP1I/AzY42xE+n5m1gt/3WxNhm7s3MMrFPohjlc2Z7DUzndveWQPK40UpLP067bvU
         DlOiWujvhVL1GeVakV2R/UX2i+YviaSdnVx7kFJISjaaDAm6MwdzkTg9uHhLjLn8IQfh
         fzA1wvohqU9Lh4pHLFET5rQLwragHVmHrJBnh7cRy7ogMJul+8jhmgBUspidCXOPbiRy
         3ktGE6talZD5zOXXbXoeMtjqlGx7TzrYgabxguJEO5JJPrF3Jg1IFZlR93JF7IVJTxE6
         E0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060935; x=1717665735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/z6JrsczbGlJdeagCzokQ7NOChpkizM9tHLk7nwYHc=;
        b=oAkmGQqBaNfjmlEoN8q24m+NgLTAWgXq++4TCgHwSUZomfAQBKy9aDFRnwH50YDb6b
         /S97hpua04iOycuQxxxWzaO8GxTD+1S7sAbzdfagvqI/n4i9Nf3DjjtTgf9BJJOmzMLV
         0+AGfb8Svlg3samx1U919MYluPT32wSAOe0yxMcILFJfKdITLU9eyfwAh/7V2ZeSM2Ap
         X11idC9cc1HuL1gqz35mogQCh43rYrjQxPg8P7O9HWlk6rQfWccbZQY10YQNvjPNg5tY
         wf3p2H1Hm+i6olq/scbTZDrjUE3+emViqTlYYT/fPUgfvLYy1SQh1W2tjBES25SMRROg
         Rorg==
X-Forwarded-Encrypted: i=1; AJvYcCV5afuhq78WKuoXOGK3d6RHw+so19FdPQu8Jn6LTW4sCMe8JT8md7lTkHfqesmm5MeESrCVTaVNTg6qX0QSmxS7wqTeY+cHBvabsQ==
X-Gm-Message-State: AOJu0YxE8MxmH0jddTcBnero5qS6gBXwbknoii6CWVZ1q02t5uQpRPJs
	YaifdHqxm2ado9Jf5sCWv8ENaZ6e5JR+eHWmIYmImuQGN0copKvMNUQ9fgFbi77EJIVTf1A1ybj
	jjqdYoAEFqYclQITHwNwQqNmQw6SnLuUlo+5SpvgLnL/2VA8W
X-Google-Smtp-Source: AGHT+IGRJ3Rf6Gezxv9hcamuYQlhVWVAgV+Pbef78MTY3m0hnhXDE53keEkjqkBHl1Toem6mykR6y8+l+5Vju2z3wBI=
X-Received: by 2002:a2e:87d4:0:b0:2ea:8027:a6a7 with SMTP id
 38308e7fff4ca-2ea8488ac29mr6544131fa.50.1717060933982; Thu, 30 May 2024
 02:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20240527132345.13956-1-ilpo.jarvinen@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 May 2024 11:22:02 +0200
Message-ID: <CAMRc=MdWLzA=PYJg_6pq-doZ807S2w4Lo6SyLMkbVi41zdzzTg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: amd8111: Convert PCIBIOS_* return codes to errnos
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 3:23=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> amd_gpio_init() uses pci_read_config_dword() that returns PCIBIOS_*
> codes. The return code is then returned as is but amd_gpio_init() is
> a module init function that should return normal errnos.
>
> Convert PCIBIOS_* returns code using pcibios_err_to_errno() into normal
> errno before returning it from amd_gpio_init().
>
> Fixes: f942a7de047d ("gpio: add a driver for GPIO pins found on AMD-8111 =
south bridge chips")
> Cc: stable@vger.kernel.org

I dropped these.

Bart

> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/gpio/gpio-amd8111.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> index 6f3ded619c8b..3377667a28de 100644
> --- a/drivers/gpio/gpio-amd8111.c
> +++ b/drivers/gpio/gpio-amd8111.c
> @@ -195,8 +195,10 @@ static int __init amd_gpio_init(void)
>
>  found:
>         err =3D pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> -       if (err)
> +       if (err) {
> +               err =3D pcibios_err_to_errno(err);
>                 goto out;
> +       }
>         err =3D -EIO;
>         gp.pmbase &=3D 0x0000FF00;
>         if (gp.pmbase =3D=3D 0)
> --
> 2.39.2
>

