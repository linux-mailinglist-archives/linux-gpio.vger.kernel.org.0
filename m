Return-Path: <linux-gpio+bounces-8164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696A92D122
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 13:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A78E5B2755A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 11:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E7B191493;
	Wed, 10 Jul 2024 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jHbGRvZw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D0190674
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720612626; cv=none; b=nMJrnHBxDJWL5/CdqstuLR34KlcaR0Roi1Vn1Mp8hjtOtOmC6BHyl1lqjoGcUesdeBPdhhztkFckBMnJrnmfUsdKwrgdFiNETZS0qVk7Yq+GlaJ+SFsr4/JAVwZO/Xbq3b+qbK1N+dg3Uw06BMAGtHxwXahyDISh8tK5idn7hfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720612626; c=relaxed/simple;
	bh=WsDlAVZcBSC+PHsEZqH18u+wQ7q/gzTehoBiGRVxn5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiIU9uMLb9vzoeUzo+VEKyf8LbUiDu7gH1VlPRqwKuOSCNKL3frJc47OCCLJsFfaBGdkVq2L85zdk8M/3xeYSu2s4nFYX8TsCNuOmPexdafnpjbA7OTJQpn86sCMMJhqmyT+HHgTuhHBQO8MIjJV2kTw1JGA3Rsz/iMxTN2Lc/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jHbGRvZw; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso74440571fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720612622; x=1721217422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwfoyeupSwjDIeqWgElN6yiHYZ67SywUBwzOBWbpi4M=;
        b=jHbGRvZw4Q4ynOGgQz5WTsPB0uAl0xSKqNdp4EclEJ4rX0Q9N6neiAushlS1yAhmIE
         UnvHPXeUqj1BM1juCQyB25y/JULYpZ06PDQGSO3jspn8TTBktX+nBakp9HjOBW4uB2+0
         FlILHHUHdDfc8Ku7NwG5V+fssYO5WP7KrSBL9JmRq784OhEClSjDNccUwjMpqqmsE47i
         AJRZ4bbspk+DtXPYDpJ0hqPxBF+djWGZe3Xdaj+kcyP8xj6qwmmQIp9AigtyGjHACW3/
         T6gG7IxpIE0ThbG3rnoa/A2h5ElJp1GBZKsiBIRx+C8JNy0cuaRjDS0gfKxUR6eCOORO
         UFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720612622; x=1721217422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwfoyeupSwjDIeqWgElN6yiHYZ67SywUBwzOBWbpi4M=;
        b=joURGSRkRJu/JSJoQy/ups1Li7UNMRVSJFjB1awcYWMvrWBIP5KDDji+kRI/4bN2iI
         C0J33dLnfGDIVpdMKT3uTf+DKgKK6FHwq2Qnqh7MTkUgDBXnMve74z9EMe1PUtfOi/dw
         a+mRWCEgXLTjHHIUVJfhhKAgdLf6SAurM99SSYUXZR8gJYS6U2z2PIKaXN1kpd9XVwXy
         lxC+5tJNzt+41/sc2Nal7XtI6pdx7cWxA7d/rwKtXGGvkcBF//MA6/cq/U1urQjGg0R0
         zQPkxB8SqkWVm7sdjIUByRyb5fpqHkanMNywHwPETJlTlTVsRBaadBhrZWDlAo8R9AP3
         gRkw==
X-Forwarded-Encrypted: i=1; AJvYcCW+tKMSa0QPaN1qe+tJzYDTuxs4Fez0EOQVBh8M3OYVOAfPJlm62O/7ajBDrJAXrRNWLgCCp73belWMOv3ME2H27UnHCg14XFLBqA==
X-Gm-Message-State: AOJu0YxvjCpjrYWugRRmUTLXuxfH/k34qP9ScgdWL7Oh3RvQPJOcnfD5
	JHiISPoPvxwxldaMeLIa44S55MOKFdHgXkkj6D8P0EDzAkCyLxCZ/MtexUOY13t8ftPpIeQoQdM
	vSmPEUnaextWcrL7ch45fVDDoXwoZshOXY4Nr3w==
X-Google-Smtp-Source: AGHT+IHJGswK2Y+OebO2SiwrHVLpVQDHaAegDJkVw5rzzL9UruW2bK24KpA95w5gRrAvh8NQOgUtDeLzV9pkwgRp238=
X-Received: by 2002:a05:651c:b23:b0:2ee:8736:6c19 with SMTP id
 38308e7fff4ca-2eeb3102b5bmr42639441fa.30.1720612622161; Wed, 10 Jul 2024
 04:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710082813.2287329-1-nichen@iscas.ac.cn>
In-Reply-To: <20240710082813.2287329-1-nichen@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 13:56:51 +0200
Message-ID: <CAMRc=Mc=0LgyH432JWCfdTwty1sYPX=ZViuoL6u3K_1SW5RnDw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mc33880: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 10:28=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote=
:
>
> Replace a comma between expression statements by a semicolon.
>
> Fixes: c103de240439 ("gpio: reorganize drivers")

This is not correct. The commit that introduced that issue is
1e5db00687c1 ("gpio: add MC33880 driver"). I'll fix it when applying.

Bart

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
> Changelog:
>
> v1 -> v2:
>
> 1. Add Fixes tag.
> ---
>  drivers/gpio/gpio-mc33880.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
> index 94f6fefc011b..5fb357d7b78a 100644
> --- a/drivers/gpio/gpio-mc33880.c
> +++ b/drivers/gpio/gpio-mc33880.c
> @@ -99,7 +99,7 @@ static int mc33880_probe(struct spi_device *spi)
>
>         mc->spi =3D spi;
>
> -       mc->chip.label =3D DRIVER_NAME,
> +       mc->chip.label =3D DRIVER_NAME;
>         mc->chip.set =3D mc33880_set;
>         mc->chip.base =3D pdata->base;
>         mc->chip.ngpio =3D PIN_NUMBER;
> --
> 2.25.1
>

