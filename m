Return-Path: <linux-gpio+bounces-17135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4A2A50D7D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 22:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29154171A32
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 21:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6DC201110;
	Wed,  5 Mar 2025 21:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b59HpxEt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA139FD9;
	Wed,  5 Mar 2025 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210239; cv=none; b=BdqF2EIu5UdzshPL8QNxnWM6AUsGT1L2N7V/n3hY9W6Rq+w8R5UcNV07UOq0jNEBburvBAYr2jdGZEpO6rGISZlRQKjzurLtqhsFizDs8WtBa2cun9tfx8u1Lwvhcc5OQP4RSBndklzklvbNpsmbjVhTsGhBf4Mn1U+B4voPSZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210239; c=relaxed/simple;
	bh=I/yKx9JL/tzOuTg4yOCmGyjn3+iHRbZJO4AabMMzHeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6BKRF4Mey9M3GcOjn6T67EGiOZzX+ZYCfspBNF91+62UlnDyp4YW4+/bvF9eL4+aCj7nDNCp9pY9ojoTZwznv4vIPqejRvfRcHtBnt7NfBaPT3Mk8QXHfu4rPgCJGvjPfWinwKS/Es5w+hJWqFLVbneaa1RCkQdqnW9ejzE4wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b59HpxEt; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523a5dbe070so1286222e0c.1;
        Wed, 05 Mar 2025 13:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741210236; x=1741815036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CXZ2QaYYcqkzI+SwPfsBRy7pFezDqwVQ1z41MmbxU8=;
        b=b59HpxEtWmsZHNxTEqyFfHcuJ5DsF4tShE+ySBq0dbV00fEruKsDjzoOzvkQ4/m2Rb
         aQXu/sz59VL/XMtMPMGJ1RmtRHIgez8+dDHmitSLg2hg7R8EFg859YtS7XBuTRuv8XMk
         EKCK0PrGcJ/AFregzAOMtH/b77bwze86agiiY/PCBeAkhZ8vvZyX8U7MgVg5d04FVGi1
         g7ZprMHZJHhWqKsMS3Ees0HLJ6H6Gi4o5tVXmT3M3tb5UrjI7CLq3S2p9WsWjxXF4pKY
         AQpZlqyZaOlyaZGS72KPe1xZ2EUbcoqiGeO2FUFVQNIrD70PibNWaZzYvsrWw22yKZ6k
         AZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210236; x=1741815036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CXZ2QaYYcqkzI+SwPfsBRy7pFezDqwVQ1z41MmbxU8=;
        b=OiWzAyfKS16Z9vLTCpcRorl4fJl3hWZ8mJ1nyRvxddoeMBV12laSeo+NS7jCUiiPb0
         JAacLZKQpMV47ApNtF2hra6OW+yJrVb22/0Oq7RZbO2qUwbku4YjexEaSBvq1hFSI9hN
         KnuO4M95pUzXpccs+fo0TqhYf7uPC2uUhUphm7gxSzpCVtNq3Coweu95nz2Lk30r3srW
         /d/9UQ5IMFVbKUlRto7Ru9Wc+IMHXVyc2aQxaT78PgQsYj1RPYf3FPxuud00ID4eKeSE
         ag3qslJuVaCAUQvc+Gz5uh364qGha96BLB0vgC+zK6chmIBCS2j8uWRwKdRahsK9kEgA
         Z4zA==
X-Forwarded-Encrypted: i=1; AJvYcCU5wJsgiWJZ3yTT/N+W4AM71NHkxWnzI1iVEsKyXgfSfQbW43CYxBfSWfysV4bi1hluIYt2l4ZzCPH/6tmK@vger.kernel.org, AJvYcCV9D70nXmC7IduIV/+isepp2l6V3h5EJUHmPOSaIhUTbasQph6kAPEoe+Mr8TC0tDeFIEwEIsJvHner@vger.kernel.org, AJvYcCXZoBakvGscB5KNY7ueEZfvJUC/uvR3r23A2XFJbUxqVqia1TVL11b/AgAUF4dBNbNWnm53/tjBmRoM/KXU7xtEcFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY759EaNhm4TeBajpQiatBxrBDRBgBYuz55uKCUkmnR5VYKAhf
	kioqAK+BnohfFsXycICSAwpp4nHg2Onq7oRrYOg0oR4PP+GYOeYUu2E0WzUz9EJyu0+QPZtZbc/
	0gQxz3vm+ZqogU+EZa6s+8ShHmYRNViumo14=
X-Gm-Gg: ASbGncuOmirCR0t1nCDyB/p9xtD9BBcF8C+t6Kv73ClqfGTzEnp3eNKUc+JFh28w4dZ
	lingzqlVshTvNotkOwbdPSxAMh43hzZ44H9lrLRybo1d1Q5/Akn3h2nj0aDcGvuMtceSpDDZB7y
	Jb1B3WPHdCuMhJzjORQbcB9FzYzTezZbm0s4SUrDMzQZh0bV0DtFOtg3ZQ
X-Google-Smtp-Source: AGHT+IErpMA6p87XjlQUnqlCC0aADwpesS5YcM+8Uu0YdO/fp5VrZasIKwclQLBPwHgckl9vieYaAKKyuH+aAJ3pP/U=
X-Received: by 2002:a05:6122:308b:b0:51f:3eee:89f4 with SMTP id
 71dfb90a1353d-523c62b72d6mr2800945e0c.9.1741210236631; Wed, 05 Mar 2025
 13:30:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-2-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Mar 2025 21:30:10 +0000
X-Gm-Features: AQ5f1JrexJbcZtvWVnHBsVT-i4KSluDJep2XVmJDj5Ws-pcnDBUsP5F1EiRudvE
Message-ID: <CA+V-a8ujLRRBDLi+E1UVfq3Kx1Ukr5dLPs=kH=F_RT_-MLN8=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: rcar: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 4:39=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: 159f8a0209af ("gpio-rcar: Add DT support")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/gpio/gpio-rcar.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 2ecee3269a0c..7208739cd2d4 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -468,7 +468,12 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv =
*p, unsigned int *npins)
>         p->info =3D *info;
>
>         ret =3D of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0,=
 &args);
> -       *npins =3D ret =3D=3D 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
> +       if (ret) {
> +               *npins =3D RCAR_MAX_GPIO_PER_BANK;
> +       } else {
> +               *npins =3D args.args[2];
> +               of_node_put(args.np);
> +       }
>
>         if (*npins =3D=3D 0 || *npins > RCAR_MAX_GPIO_PER_BANK) {
>                 dev_warn(p->dev, "Invalid number of gpio lines %u, using =
%u\n",
> --
> 2.34.1
>
>

