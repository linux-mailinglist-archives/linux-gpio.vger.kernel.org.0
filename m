Return-Path: <linux-gpio+bounces-8938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B1E959B5F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4CA7B2221B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F337C192B81;
	Wed, 21 Aug 2024 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mjBKei64"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27032185E6E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724242284; cv=none; b=thj0cmXFAgPyd6b3R8v6cP3oHjQESmRfqmQ4LQGplvFoQ4b16/hpwVmnbVxD97RpV8c3TIrNn/Cmeg7nNSxEww1jUEZgTvLtDDe4bENSKcemq3ypCVuUWXhyUJ72gSZeyUGUa4vt6zFddbIl952z28l8SQ9KU+rgL67QPhMO2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724242284; c=relaxed/simple;
	bh=eDHCv76R5g3t0RY3miMCCvHXtbx64in4W2qssQUnwvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAWi94M+wbbDyvqylvkcre3lsFcH3Eb0aqf6s+yxj6uG7Hmv5kFlSXEKYHOKfs3NH2i08e2uqV4jO+0ciCuDpAL7VZd/7iZdViLYEmN0wRRbITJl70nK5qnKGM59eCUzS9B8lL4j+QGX/Ma4gZxknKoE8ugDt+QttvZVQrXD6aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mjBKei64; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53349d3071eso595917e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724242281; x=1724847081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X87UoSnpqDGZmUSBfNbhS1vo1dgY9nFMgetWnRGh/dw=;
        b=mjBKei64CVHPSsCClL5SJiZ6gXxml4oJoLAyh3/d8Lxe2wNeqxHzYx1YzkhUQYiAHY
         dPL7AcX5s3gZyctpiSowUfpUHnGrSuZHTSYyMOT0mEmys/CQcVHPWc686iXbvZ/FiJkc
         h2Dp8I8jWV3jN/3Vrw9Nl7Um9N+Mg+nW6HuEvihxtnWPaw1WLis3pGzb28nKiVHMZTdn
         uERZ5KW62+wRKLplE1mnwcQzXHgULjP9lA1CeIB5UNwLfLFVJ6knrVo2xMrjvO1M68xO
         KafDchZcge5DR9tpKaksNlhUIteJWnO3pPASsmak82QzltmHZnsXNxXi7DCSlQSsA2lG
         yLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724242281; x=1724847081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X87UoSnpqDGZmUSBfNbhS1vo1dgY9nFMgetWnRGh/dw=;
        b=SwUfVXOtia4/aPD/FCs19xZVtrGP9VDJpPwQlNxoAajtGUMKJynvBw9iT+uCs8fw7C
         bgOCbW9m8od3kauWOeF1XM1xmnLQvMSrZdxM+KPI3zCPNfYVBOSlg+RAgm1hD8lDTtwC
         cmX1aKAyQyvp+eWrMjnjzVOgXbWEkivTvK2CS3jdaLapneHFzL23y1szSWof2CnDWu/1
         54CgUk+8EE/yo8HMiT9/l6/UW01MFGClrYkpnUVn1obu/rQusYzf4nn2DygKppBaIG+M
         7jLqeDUOsugY6fxyy9DwDIqMYWTH8SUd57k+Fx7Xn5oz7CAcuivW2s14dVVJ/APn4e9a
         FgMg==
X-Forwarded-Encrypted: i=1; AJvYcCVSS+j/ETGQIkZTq5va5L5Onvh5qR/WvY5G2dpe37nfJI+Ruwb9pL+POs2YnEIAPxcRCEkyoQwCl3Bo@vger.kernel.org
X-Gm-Message-State: AOJu0YxeELlXFPnrPK+SQX/EbAaan91khQofAqYhF5kMvI9k62fGVk0V
	Xhatzy5wywC0kiFxip0/g/2uviLXYrxoRR0FlNc9K1APzMbwrsZwj8YCoVaWnLW1Mt+NeZnpR/l
	fhYZ5jizq48hTa/Xy022WLH/r2pzmDkI+jyrm9g==
X-Google-Smtp-Source: AGHT+IFjzONjWQY41NXEYfllHV4VjY7WhQri8rEk8j1Br6nqDipqGWHTbjiAJPFpyUYjas18bQUGnaX7lT78ZFVClQo=
X-Received: by 2002:a05:6512:131a:b0:52c:de29:9ff with SMTP id
 2adb3069b0e04-533485501b9mr1295677e87.2.1724242280426; Wed, 21 Aug 2024
 05:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821114202.2072220-1-festevam@gmail.com>
In-Reply-To: <20240821114202.2072220-1-festevam@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 Aug 2024 14:11:09 +0200
Message-ID: <CAMRc=MfNOKhnn1hE7_Ue8nNkVNHrDsyLQqz3ON39C2zfLmkOWw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Print the error code on read/write failures
To: Fabio Estevam <festevam@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux@armlinux.org.uk, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 1:42=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Print the error code in the pca953x_write_regs() and pca953x_read_regs()
> functions to help debugging.
>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/gpio/gpio-pca953x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 8baf3edd5274..3f2d33ee20cc 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -498,7 +498,7 @@ static int pca953x_write_regs(struct pca953x_chip *ch=
ip, int reg, unsigned long
>
>         ret =3D regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chi=
p));
>         if (ret < 0) {
> -               dev_err(&chip->client->dev, "failed writing register\n");
> +               dev_err(&chip->client->dev, "failed writing register: %d\=
n", ret);
>                 return ret;
>         }
>
> @@ -513,7 +513,7 @@ static int pca953x_read_regs(struct pca953x_chip *chi=
p, int reg, unsigned long *
>
>         ret =3D regmap_bulk_read(chip->regmap, regaddr, value, NBANK(chip=
));
>         if (ret < 0) {
> -               dev_err(&chip->client->dev, "failed reading register\n");
> +               dev_err(&chip->client->dev, "failed reading register: %d\=
n", ret);
>                 return ret;
>         }
>
> --
> 2.34.1
>

How about using dev_err_probe() instead?

Bart

