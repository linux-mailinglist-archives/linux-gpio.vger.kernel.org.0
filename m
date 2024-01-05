Return-Path: <linux-gpio+bounces-2046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFBB82506A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jan 2024 10:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA5E281108
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jan 2024 09:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759C0225A1;
	Fri,  5 Jan 2024 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="az7ZvYP2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8D241F4
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jan 2024 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-467a7a376d5so346093137.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jan 2024 00:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704445147; x=1705049947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yaq0wFGJm8RBV+TNY81vMbYgzuWUak1jB6WJa6TSMnQ=;
        b=az7ZvYP2AqFm8WC5a/i6WK4vd/jVH4rkDJaR/qhPM/nfWBib5uRmO5JLM2YQfVECZr
         Xie47TZxvsKei8xzx7c04/oWpGfdhRJZZa9Mf/ViXRIGE654KmqGkzyLdIe8G97dKc0N
         zDfGp6UPaiuqZzNJHx5H7qJ0JTImSZFV6ZmwD0OK+9LBQPFYdbypTq1QyI/UNAzaiDJo
         wn1APuD2Bi3uh9ujv0c/vMTFF2qBzcB/ETT6Q1Bsi7CyhR9Nfgyxu7huTMCtc3JRs085
         A7takSKm7ozCh2/6u9iPKW5sh3EnX1J5W9A+sMoFuRqJG4EesiB0qppsw1jw2XvKSwc/
         48zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704445147; x=1705049947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yaq0wFGJm8RBV+TNY81vMbYgzuWUak1jB6WJa6TSMnQ=;
        b=NWLnT55z48g0kYlhrnqb01EP7d119Jb3gtb4Zrx7Rj60ETj8I2V6UHDWuKurKf6RSM
         Iz0GNAwLYHfhSuoEUyHLR5uSzBaoAqp2McBNvpwumcmnbBBk8LfnLoZIC1f5KeYbvO9J
         rMH+YFRY6VFU3LzKn/QjPYyFbVcDnrO036R/BJyenT3hmRQUwtFJ69YIdKM7RqE5+//c
         L2sHuAy6Rjw31Ojv3Gofvtf8ZL7zWOoDu/KWKwvunMBHtfHTg33B8ew2Y953pNrMtxox
         5000sQ75ez5Tl2diB2/S+dmBvv5VSEaJ9j4N1/ML+bratAClMi7RzgBsd4tHwlKK0fV8
         cfFg==
X-Gm-Message-State: AOJu0YwzY4p/TnybqGj4NTHCFQoKHtOCCRaiSBTHJlZfAnNVD+s3ljrR
	jsr4pNGA/UGd1xAwLNc61iww7mJPLsaf49SIMqCrE6PuozCx9Q==
X-Google-Smtp-Source: AGHT+IFE10GUfhH4msnA+jhNiHZxIXfWsCedv/eABwd0IuqFWT8nQfak7uq3oYrPam3evyx53/bz2ndfRIQxIVIlJek=
X-Received: by 2002:a05:6102:6688:b0:467:17ca:bef3 with SMTP id
 gw8-20020a056102668800b0046717cabef3mr1826365vsb.8.1704445147002; Fri, 05 Jan
 2024 00:59:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104135058.46703-1-brgl@bgdev.pl>
In-Reply-To: <20240104135058.46703-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 5 Jan 2024 09:58:56 +0100
Message-ID: <CAMRc=Mecrk9Jd_TPNAqTdy4sEpS4tCWOF2f9V5jHi_JAC8vv-A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: remove buggy flags sanitization from line-config
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 2:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We try to drop potentially set output flags from line config if edge
> detection is enabled but we use the library enum instead of the one from
> the uAPI. In any case, we should actually loudly complain if user tries
> to use the output mode with edge-detection (like we do currently) so just
> remove offending lines entirely.
>
> Reported-by: Anne Bezemer <j.a.bezemer@opensourcepartners.nl>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  lib/line-config.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/lib/line-config.c b/lib/line-config.c
> index 2749a2a..9302c1b 100644
> --- a/lib/line-config.c
> +++ b/lib/line-config.c
> @@ -381,18 +381,15 @@ static uint64_t make_kernel_flags(struct gpiod_line=
_settings *settings)
>         case GPIOD_LINE_EDGE_FALLING:
>                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>                           GPIO_V2_LINE_FLAG_INPUT);
> -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
>                 break;
>         case GPIOD_LINE_EDGE_RISING:
>                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_RISING |
>                           GPIO_V2_LINE_FLAG_INPUT);
> -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
>                 break;
>         case GPIOD_LINE_EDGE_BOTH:
>                 flags |=3D (GPIO_V2_LINE_FLAG_EDGE_FALLING |
>                           GPIO_V2_LINE_FLAG_EDGE_RISING |
>                           GPIO_V2_LINE_FLAG_INPUT);
> -               flags &=3D ~GPIOD_LINE_DIRECTION_OUTPUT;
>                 break;
>         default:
>                 break;
> --
> 2.40.1
>

Patch applied.

Bart

