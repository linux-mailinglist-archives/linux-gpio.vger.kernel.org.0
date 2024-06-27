Return-Path: <linux-gpio+bounces-7755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D363E91A8A2
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 16:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 020501C209D3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 14:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B1F195965;
	Thu, 27 Jun 2024 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xk0gH3zQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3219C19580E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719497197; cv=none; b=TeCU+OBDp8j3bGONV5/2CRYpX3nNfUweivn5jSQGYYc5c4qRfrtRRwpZSFg93e5Yuv8ujbP+JRbcQ4jEebbg+jMH1M3+rA2TOSLLnGOsWBtcPiHXDZi+86vfRXVgVCL8uSh9GX8CTSxFE22SQGw7p2/lG05oqVygFF1iSS6jAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719497197; c=relaxed/simple;
	bh=RlvuKtnodVotE/sgidgtvjxL3hFEI9HhR35x08Y1yAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrQ5ErftksP5hN9OUCnKGos6j+IoT8B1LOItHqTqUQrso2Du6jUhRQu9FuGGiepTQtAMa7i2glM14RqXnjwWuyys+lI6+wGMGM701Pcl3z6MK9IeN64VbAOku5Rc6kUnj0cPYZcCT/VDRfqwAJ+QwrIXqiw9+s2GtdXu3icI1aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xk0gH3zQ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec10324791so94587671fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719497193; x=1720101993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6HXA8iUxr5F2Q4zRp9RuzrUdSAsgWSQKf5LAkYREKA=;
        b=Xk0gH3zQKqW4/Dom48Byh3ABX9Y6oiS8TyjMi0GlHgK8KJKYiIvhAEHteoKKOM+A23
         zHdcJSLgtJRFnvYM2vDMTpD0kpkcwA8KNRkvNqEB4nRBmEYx1HoQARALjqLbiJ/3qq0d
         R6BHLS/gH1mjVp+J1e9RFA38XWVCeUEdNGRg57SfMhwKipMTXBwsRYd9bd1C8yOryoGX
         yGEm8KeZFL0gYsVvD41u3Zqi7N0TmhBpscuA+BxzKChjsfOzJ71BHW5c2+F8vga+BajP
         IJWdApDXM/97yNdrzTebAWnsJSRQifxyK7FyWWEDXFSZ3qWeUmbhaTHcfP3X9VUjpLES
         RgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719497193; x=1720101993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6HXA8iUxr5F2Q4zRp9RuzrUdSAsgWSQKf5LAkYREKA=;
        b=qoQvZrR5HLxC4vZQwXuLu/qOb3qoAVXAUvKaC8Tg6XfiUKOeQHbN/A8T9EPVHcUMph
         Sa2jDIB5SZGMWFvjigOuLviQl/7iixSr3SRnrocm529sDCuPNDEq0tM6sl5uP9uu48SB
         IokktiZV96wzG7Kupdborud2ZE17vv90kXAb1wQxRln6T0JTqffG2DTzNkpf+1GU5n0y
         q2sUVU+YmD3IE4ii7vVHn6n6erkXlaGliJkMrDKAFwWizAoVwN6UWiH3pRedM6BER6a9
         LCFGJ6NPha+K+aCUwMObkNFGXbyDMWuwkZoozOLdVf91ld023BRiMQTGymL0ypMdTszs
         oeBA==
X-Forwarded-Encrypted: i=1; AJvYcCUuzPQzQmQX7N8DCV3Ul1nUe1QPar1vI4osc6c2I9bmUTpmDTiDmxlN95z5vFDXM8Xlse3RzSigiITtLOvVOPEZ/UiJidV28WRKGw==
X-Gm-Message-State: AOJu0YxGj1V5PpNYCoCGB9vI+CiUKdWlUH64QmwWoZmaiF0z4AxUX7/t
	iv9ezkIsxPrYqLe52d2Tb09+eq3DuAEmw9wynhXXAgRBjpHRFlt+oi8Q1edhN/IqbKV44IaiNam
	nwlXMHORE+8ht7hOEzazqqz2E1w5SgjptW+QT2+E2H8Hp5dFK
X-Google-Smtp-Source: AGHT+IGM9f32zYnAOO2F38ElwCLaWs4cdHw9g9lDgJqhPORq0oyjMSyzQumz17o1DpqpZ9rFr3Z9pmpcX/Rs/UYuOd4=
X-Received: by 2002:a2e:6808:0:b0:2ec:588d:7ecc with SMTP id
 38308e7fff4ca-2ec5b27a875mr87405521fa.12.1719497193094; Thu, 27 Jun 2024
 07:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626052925.174272-1-warthog618@gmail.com> <20240626052925.174272-3-warthog618@gmail.com>
In-Reply-To: <20240626052925.174272-3-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Jun 2024 16:06:21 +0200
Message-ID: <CAMRc=Me1_4xjbt51j+gFVzR71VUwMSAm+dT=UtgOY-1xYoAF5g@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpiolib: cdev: Ignore reconfiguration without direction
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:29=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> linereq_set_config() behaves badly when direction is not set.
> The configuration validation is borrowed from linereq_create(), where,
> to verify the intent of the user, the direction must be set to in order t=
o
> effect a change to the electrical configuration of a line. But, when
> applied to reconfiguration, that validation does not allow for the unset
> direction case, making it possible to clear flags set previously without
> specifying the line direction.
>
> Adding to the inconsistency, those changes are not immediately applied by
> linereq_set_config(), but will take effect when the line value is next ge=
t
> or set.
>
> For example, by requesting a configuration with no flags set, an output
> line with GPIO_V2_LINE_FLAG_ACTIVE_LOW and GPIO_V2_LINE_FLAG_OPEN_DRAIN
> set could have those flags cleared, inverting the sense of the line and
> changing the line drive to push-pull on the next line value set.
>
> Skip the reconfiguration of lines for which the direction is not set, and
> only reconfigure the lines for which direction is set.
>
> Fixes: a54756cb24ea ("gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCT=
L")
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f7a129d67b7d..ef08b23a56e2 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1534,12 +1534,14 @@ static long linereq_set_config(struct linereq *lr=
, void __user *ip)
>                 line =3D &lr->lines[i];
>                 desc =3D lr->lines[i].desc;
>                 flags =3D gpio_v2_line_config_flags(&lc, i);
> +               /*
> +                * Lines not explicitly reconfigured as input or output
> +                * are left unchanged.
> +                */
> +               if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
> +                       continue;

Series looks good, thanks. I'd say that this bit here calls for at
least a debug-level message since we don't return an error unlike v1.
What do you think?

Bart

>                 gpio_v2_line_config_flags_to_desc_flags(flags, &desc->fla=
gs);
>                 edflags =3D flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
> -               /*
> -                * Lines have to be requested explicitly for input
> -                * or output, else the line will be treated "as is".
> -                */
>                 if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
>                         int val =3D gpio_v2_line_config_output_value(&lc,=
 i);
>
> @@ -1547,7 +1549,7 @@ static long linereq_set_config(struct linereq *lr, =
void __user *ip)
>                         ret =3D gpiod_direction_output(desc, val);
>                         if (ret)
>                                 return ret;
> -               } else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
> +               } else {
>                         ret =3D gpiod_direction_input(desc);
>                         if (ret)
>                                 return ret;
> --
> 2.39.2
>

