Return-Path: <linux-gpio+bounces-13323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FC9DA9E3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 15:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EB45B21969
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 14:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B651FF7A6;
	Wed, 27 Nov 2024 14:32:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C726AD0;
	Wed, 27 Nov 2024 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732717941; cv=none; b=ckAF7DAIh12pUokGbzpKcO/JVx3pqS8cl793MetRJQQlicK96pJvkWY0Wexoovc8Tnb3Tkd3a/EnvopZFKd6MBm2UUrDy0aO0E+v8gyqhPQWe4HMhZjDTRpFYyOo3/Mk5zWhLH2x+V2rm9Ep+wv587akfxzcLuXo6XXPR2ZaHxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732717941; c=relaxed/simple;
	bh=0HvpP03fJIa9VL9yIjXyCxKkTPSv+tDsMAhrVsQoK2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6U9AalTzXtAXynZjsGcOfxKqfTF46FZysdZM5TOCGikp7/3lJCO7tG58c3mebu+3PjJ5NQWGW0TTw0dAYphLKarNc44jZcZ3rW1s2RSUcr9CQ2POUdZ28Ex4UiCIA+o6WztHRT4NUYFk4z1MiRvC/RwPOyjLcQbSH3dTd8dP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b66ea49407so81184885a.0;
        Wed, 27 Nov 2024 06:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732717938; x=1733322738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j2ZUq6xu9t3wTv8Cm7N7UCfA0pG8EHAdf2AYMgtddQ=;
        b=mbd5WEk1miTX+Op/WVf9xXPI/W6wYXYXcqzkRXOnkZs4ohVuv6oxAVUpTT/3xfSV4p
         RG4WBZ8XbeBilPj9WELWrmHrnNGXCnAnH4J+WCbG0kxYno5czyL3T6uDnuQFD8Xh8np7
         oB/1cP7oSj0kvpQPzE/TO5RZb09pg+fshzcec/GCVwoJdLm3f5vEFq26ZI28hy7ANgEe
         TVUnJEkS5dozBjYuhnLOZ1JrgrI+EVoywt9Y+M8O4+Q5AIs/aBi2WLD8aD+wyZAnXzQj
         Nr36gzPHD2omVtaIDskGAo5nVgycy7AHffBacikwvt+1LIx3MNuSoFEbKSP7C0QjnO2q
         U3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUTrJIcNdX+nq3HMWeDwouOb8jjXKfzUi+JWVCQFG6nav5Fny0pqIheW+LQd+CkZ1DD76aubRUgjfGg4mgg@vger.kernel.org, AJvYcCVGZv7QQR4NcQxBnMNsoQbv8rhOgKZt8zbcH79fKNGs5PM6FpdGYYElJNPgS4WUAoq4zmaBv6biyeUdFg==@vger.kernel.org, AJvYcCWBPqH1JS+TUfjezcVSaS6uSos+cB+54XSffHja8mI5Pd1L43afMhUbWKS9O4kFhfe5i9sFaP2dvYigGUI=@vger.kernel.org, AJvYcCWZqbe/nmGd+NCx9fa13ZpZ97KKkl6xFdrX7v0TM0hyWM/iXl7vZgrd2f81MFWfreynPgoSVTrjvK3V@vger.kernel.org, AJvYcCWdltFfXlVAj464H9DYswcWD/+isHW85qMk0Oj4yyDpn039bds/w7q4Y3SXIMHJ5nUu8n3p3/JWEKJtFHwfqCqhvl8=@vger.kernel.org, AJvYcCXoccJ+ytW3p1jY71fEIiqJQ7zYOie3cgIwkTeKQMKVWXDVAmRIYfE1OGP0DkA/B67iYrV8OhDVLh/N@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvo51aLMhmLWo7YiJueUIXAw8gl/rKVpPwVZrdO/l4ocTgUOy
	BE89wNrxs9M0URzGfrMUuCWDTu/jSKs/D4rP2NaKEv3aZ3hqoKRxnFLSRgA2Qug=
X-Gm-Gg: ASbGncuPJyMPDkDoiFc9+hNruEqbwGbwiliR/sF9nxHbMGh2Nh+tryE/P4rC7WTdb8t
	hrONN0N5W7GVqcf1Q25er3VMwzw1qdzY7Zr4NeBDBHGIgDq1yqTztyDOBdEEZOT8rFza6UC4cvG
	LzRdQrIgq5AoJTo6Bm3RscPc2Op8o+aVmde08PPWU2givTlg9W2sj1jtJ6M+GiQ1kwCNTFvQNec
	B71ZlwLzy9NhqswNtRc2ra8yEzDqSoZghgQA8loftF/ONblOnyXaasEu6vUBFpPD7CBBSzp1Qer
	iqUf+zbhaBbQfz2V
X-Google-Smtp-Source: AGHT+IHPmQWdd5kenGSHMPBppEIql98ObTNtrv4YVg7ZVWyjoB7kE5vbX+CT/cwEKn/RnQPepr6AXQ==
X-Received: by 2002:a05:620a:371a:b0:7b6:740f:a535 with SMTP id af79cd13be357-7b67442f42fmr1350350585a.0.1732717938600;
        Wed, 27 Nov 2024 06:32:18 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6767bace4sm157814185a.40.2024.11.27.06.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 06:32:16 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b66d08d529so76678985a.1;
        Wed, 27 Nov 2024 06:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNzRBm7BItlOFowfiujdfO0aM04W6RvGYF14PObrZdH39exqCznhLB8iLkCL/Y8b3f6C/5LeGc0QHY@vger.kernel.org, AJvYcCVYzvcSBVRou6KsaC4UcY+uaR/L9mqoiMFPf7kIeTAXqg2NQqxTUb5VoX0l61y3d/jDcZSuKNBfzIaXOajCXJ/Zz6Y=@vger.kernel.org, AJvYcCW5qgrL6h0pO2ihWGnyTtpxunMP3Ka+Br3+D73NkYJdLG/vjYU6YMt/H/+JBpDpLtoiur/sJGFJD1CskZ3c@vger.kernel.org, AJvYcCXFs+FecWzMxQI+vXaofKuexnm8mr52gtUU87+DizqbkS4Sa7JU1+mQliMQ2y7JVsP8wF5+6tNu73+2@vger.kernel.org, AJvYcCXRqgyTg438KKdF9YALkFNTE5N3tthTcclg+Q7Wt0D4JfGsDi1Kf6R/ITj71MkuUdtzKt0crQSvAeJUDQY=@vger.kernel.org, AJvYcCXpypu9MkKqFLJZkVgUadiHWNQ+x8YyPF9egePKXUnEkyn9ChwWXFZRdWmiIHEETWuOdi1oW2bEcDJ7oQ==@vger.kernel.org
X-Received: by 2002:a05:620a:3186:b0:7a9:b2f4:42e0 with SMTP id
 af79cd13be357-7b67452f309mr1359261885a.15.1732717935088; Wed, 27 Nov 2024
 06:32:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 15:32:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhBUwWB=8T3TW8osEG+=MaW5bykqZ77V40MVf9GKeCgw@mail.gmail.com>
Message-ID: <CAMuHMdWhBUwWB=8T3TW8osEG+=MaW5bykqZ77V40MVf9GKeCgw@mail.gmail.com>
Subject: Re: [PATCH v3 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add audio clock pins. These are used by audio IPs as input pins to feed
> them with audio clocks.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - collected tags

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2086,6 +2086,8 @@ static const struct rzg2l_dedicated_configs rzg3s_d=
edicated_pins[] =3D {
>                                                       PIN_CFG_SOFT_PS)) }=
,
>         { "TDO", RZG2L_SINGLE_PIN_PACK(0x1, 1, (PIN_CFG_IOLH_A | PIN_CFG_=
SOFT_PS)) },
>         { "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A=
 | PIN_CFG_SOFT_PS) },
> +       { "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
> +       { "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },

I'll move these before WDTOVF_PERROUT# while applying, to preserve
sort order (by port/pin number).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.14.

>         { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN=
_CFG_IO_VMC_SD0)) },
>         { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN=
_CFG_IEN |
>                                                      PIN_CFG_IO_VMC_SD0))=
 },

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

