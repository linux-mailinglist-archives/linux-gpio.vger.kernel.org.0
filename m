Return-Path: <linux-gpio+bounces-13671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49219E97D3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4407016427D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15571A23B0;
	Mon,  9 Dec 2024 13:52:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC9523313C;
	Mon,  9 Dec 2024 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752330; cv=none; b=eUQOZYBjwq0/XxBxDEaL51l9FNEPchrWBW1yxs1t9hsz1SsqtvkENecSzkM5cHDWKBFGdICDwMHRMqchFvj+tZR/yfj0HCy1qKebBXgaSdCfmf4VMbL5lROEQ+ii5cnu3KfyXKzDbA5rJhcug+2kU5UnfI4cOyF3JD8hcHHpsOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752330; c=relaxed/simple;
	bh=KVSzxO4n3eVIi2k+dY9vAMYddcYqXvIROSatSRHDyAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIR15aOktExbdM0ioAGvKD2JnwRJ/V3hKdvaFf0mu03Kmeg49wZrneQr21Nx2zNipiwmENkq0tBg1qbpENFcBgYPuIausY5hvm6V0RpFiqPSqi/xEbrenOKFiEaf1bVzWOF9/l3bFlMTvUowNS2Sp25p+YJWv8c4zO7Okjiu+3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4affbc4dc74so315630137.0;
        Mon, 09 Dec 2024 05:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733752325; x=1734357125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHnG1lQA5ML9HkTzWoGAcGw6cp3gHA+KA94RyrtUoYE=;
        b=UuMJnNKy6NWas75Ncuvz7szgrW/bNaEjYN4ftaARDd7UGKwBAIETsEiXVQxLHUJdIF
         MeY1IZKoBy+kjVD2O6Vs9kMx1tbKgeTaZE070F3rr92y8rMrg6wmyroOGg/pfO5a/Ptj
         kod7zpcHUmjRXA/sZrE8Qv9T96Mw4RtYOR+/eRg7h/vi5qSulGcoQBO+mMZFAWOIdDIb
         UwOBDbeMUso/Bl9GRXoB1UBIsfTy5VIYalbLGdB65yAfTlJ56D20M0kXarSCQQ3rPcUD
         Zgf9GMajph5WEH/dK2wNlLe0gwCCZDTO9vs9ZYApWVA9RgOx2cWxyQeu6j+5uZOAMwtM
         Zfcw==
X-Forwarded-Encrypted: i=1; AJvYcCUcuiwqAfs9rZ9chd72e3KQ3HeD/q/5U8pWFhWP5k18cve0obEXl22d86PmgN3mYdZZBz9QQcpZNign@vger.kernel.org, AJvYcCVMImxEQU7UQWBNNr1+rGEFzCpD7jASeaan2e4q9mXatM4hitWrjEGSB9RyzM+Qd1ioyLSkw+LcFjJ7vcc=@vger.kernel.org, AJvYcCVRhO1IZbolat+5zbgz/o5CCkTN++qxrMwkW41sdPaOpKUxV6XhHjoNJGGIgU+f8Wf3cgGYdW5lZatzZw==@vger.kernel.org, AJvYcCXWqDLlByqJORaCbqLjkxheq8KOJWB49HEaVEuciNUVe517gFkGdX3BHILO85DbXt8sCNhvlDidb3Sp@vger.kernel.org, AJvYcCXilZatpuqvHGsvp82ZT+UP5NfMgRQCKs38mlAlR1t7bRm/0Q30W9+KpkT9N8MmJ6xRh54Yg0AZdKpkEbVe7RqhQBE=@vger.kernel.org, AJvYcCXj3TuYWuh2RGz2kRIntzGodHCW+zh5DqGT3SV4oQAz0HJwLHvtKm8S/ucjiJpeTOl3Km41a6u2Dw4qpocX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ouJlgYFaYkQWwUzpFQhX8FT8+5aR5X8pqm0m3EcChcZDt53/
	4KXJH15arRJCmbWx5G/GF5+nml1ybs8BUGaEp4gyPhqz2uEjFtUgdfSTplE6Cfo=
X-Gm-Gg: ASbGnctyYDn8tHF/5UVTqGbffGZ1zs8RmHaOiFAk9cmdtSDYFWoiZq75nyllcAIi31Z
	pYxCUYJ+r3Cs7f19ZIGJ1t0vucspdHLqIZiQ57lFe2ByZU0YiVpHdqLqbpZj4QHbki84knVMCYe
	D0wcRHC3emMi/pBu30p6ViHScr+QnqFg7i1iIglJVnLN+4OfQYtnychMwwJltGlbYyFsEulcXBt
	cr8GQ3hSqZuCPUe5z85DbmDuXjPbvkNBuzQ1e6dH1PntU1ptQFJPC8TaRRhsaTzQd/41Bt5g17t
	lOfITXLem59L
X-Google-Smtp-Source: AGHT+IF0MnpEMx3NOBgUS4egQaYxpLHdES8JkO7lz42wTnWK1UmTyhNbO1MKQd5yZll95UhZLCP06w==
X-Received: by 2002:a05:6102:5494:b0:4af:df60:8649 with SMTP id ada2fe7eead31-4b116c6eee3mr673534137.9.1733752325003;
        Mon, 09 Dec 2024 05:52:05 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afe6969140sm553661137.7.2024.12.09.05.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:52:04 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c5a91374cso487340241.3;
        Mon, 09 Dec 2024 05:52:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQR3KBJtVfp5rwtCJpUVo4IxTLcFpslFfbKzxWQBlP0W9xXzDUQ+EAi5Vs652tySijKfjSEXAMR/ZG25Q=@vger.kernel.org, AJvYcCUfaWKfAU+fzw6ddhTsvGYqgpPCWVVsXsgejo9sQeyMMwsqHyX7e/I7iNihCAqrg37tXpJpdj91z6agUg==@vger.kernel.org, AJvYcCVF0aJxX+IQQMOVJ7e6T+c+0lRT1qvWBssP51wYx4s2dvnJFS1clCyxiGIEkSZmZjvF04JvYQEsgp3U@vger.kernel.org, AJvYcCW1VdHQmiUsHTk3ncCjhjwoHwxYPqxYwfc1bcBqY8sQAZSgVlQscbKsKrRhHX63cE/jKOdmWmdo8y8POsYM59ZYNVg=@vger.kernel.org, AJvYcCX/dLmfr/WGZGj5Ocb9xsbiVrn4kn62LPzUpPDld4RZ33UgkA6rcGJ0QaLV37jaxTgZNO7RrzB4d2OQU7ff@vger.kernel.org, AJvYcCXu/peKCbcYb+av4FvlCsknv51gBCFZjYX/lSd/GvhVjkLgSQ4Eeq8n9BA0Jz8CTpNlmBHYwf1NKzUI@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:4b1:11c6:d3d2 with SMTP id
 ada2fe7eead31-4b111c6e527mr1362540137.27.1733752323343; Mon, 09 Dec 2024
 05:52:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-15-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-15-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 14:51:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com>
Message-ID: <CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com>
Subject: Re: [PATCH v3 14/25] ASoC: renesas: rz-ssi: Use goto label names that
 specify their actions
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

On Wed, Nov 13, 2024 at 2:36=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use goto label names that specify their action. In this way we can have
> a better understanding of what is the action associated with the label
> by just reading the label name.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -1084,15 +1084,15 @@ static int rz_ssi_probe(struct platform_device *p=
dev)
>         /* Error Interrupt */
>         ssi->irq_int =3D platform_get_irq_byname(pdev, "int_req");
>         if (ssi->irq_int < 0) {
> -               rz_ssi_release_dma_channels(ssi);
> -               return ssi->irq_int;
> +               ret =3D ssi->irq_int;
> +               goto err_release_dma_chs;
>         }
>
>         ret =3D devm_request_irq(dev, ssi->irq_int, &rz_ssi_interrupt,
>                                0, dev_name(dev), ssi);
>         if (ret < 0) {
> -               rz_ssi_release_dma_channels(ssi);
> -               return dev_err_probe(dev, ret, "irq request error (int_re=
q)\n");
> +               dev_err_probe(dev, ret, "irq request error (int_req)\n");
> +               goto err_release_dma_chs;
>         }
>
>         if (!rz_ssi_is_dma_enabled(ssi)) {

Inside this block there are several return statements.
As we know DMA is not available when we get here, these do not
need to call rz_ssi_release_dma_channels() hence do not use
"goto err_release_dma_chs".
However, this may be missed when making future changes.
So perhaps it may be prudent to make this safer, by moving this inside
the failure branch of the rz_ssi_dma_request() check above?

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

