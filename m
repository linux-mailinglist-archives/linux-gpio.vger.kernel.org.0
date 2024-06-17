Return-Path: <linux-gpio+bounces-7500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE990AD8B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 14:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 394AA1C22E2F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 12:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BE8194C69;
	Mon, 17 Jun 2024 12:02:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FE517FAA2;
	Mon, 17 Jun 2024 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625754; cv=none; b=U3vt4K7qxq8vvZGBj6R0GwXxU/BLdZ3H/yGSPrAOCpUovzxM6rb3S3D2Ts6GlsSfAU59ltYeprPVespQqY/8RI9tSV475vcC9u4N8vTBEcnsblqhvzQb8ds4P3GB+tahgQfSf4v4G1GC6gFV9/pRB0m7xdPZsj04LL9IdV/Tp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625754; c=relaxed/simple;
	bh=dtNkuBV2A349eNviC6SuKzrMSB8wD5WUXwBXkHuTxOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyyHcg/LNa/KQB2gWxMUVuYOOXT8SEAbNsBMphVvMEPQfsNRkKgUb+v5jyZjcB93UdFFmpYIHG7wLD8u9dKD6zlW8rnEWyq/rZXwr9eV4bzDKlfVFWUdH/Csx50dEZLcJiKBEtde2uZaHhsa//HN3dJTHrB54pYlsaLUotc+cWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff302847a8so1751644276.0;
        Mon, 17 Jun 2024 05:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625751; x=1719230551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0ex/OBXkM0YaYw4ebPeo5bpa3LK+wkN4LK4vxw7MQc=;
        b=PKh1CCp2WG61YSn5wbyClfyKwldXw+dD7+7tvEk71C7+xLwtCsOf77jNlQC3vUiTjy
         EuSdWFMuBpeqcYdJCcWp955vbUufwv/k8G6AzI5KX0xtxBkQ1AQKu92B57s+6Btth53o
         dwpKrx1FCswevo56duK7ygPwtWTK3BKZY8ejVMwvqenf1a9nlpVYNG7dAnIAKRT6n9gm
         Wl0gmbfU2Gus0vaa8RSNrW0A1z6BEw6OdNZ/gBHC4C2OXwbx7/bbAnIuhL/HprlbNHoT
         BCOD0DpgL2akoSL2EDmy0V+bRrLg+Sk18VuvLuRSXAm/MnuoysWusTE+/HE9co4R00jY
         DvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyjoEWdUbA+ajgcCwOJIzvFRZ+fNYxPEQKriu4eFV87ZiiI4Y2WGPzDZFSpNgv8+q4cSjOPM0f7ypkwLZeNxITFC/5rbeg+wbIYboKhFR9SIHSudaAehfJPIlt3AUaczhAM4AvWfebVNszP6YuM+xmJtyIQFBTKGI0thuYvuq2Sj30siGDrlDxSzCJBa/SjjKILO63ytdkYCbjlLkZmddrbPQ6VhPh9w==
X-Gm-Message-State: AOJu0Yx7+rB+EohnSK4/D15hDDUK1UDBEmzk79pypOiO6ViE1IRis6sO
	DTyTtzeUKaRSTXnJpGOgrI6OkI743ovBbNFHpzk7XfZ+tOt4Ht9vefVpPpK7
X-Google-Smtp-Source: AGHT+IHZaTv+Be3x/sQ8URZD3zng9ZoU2KUE2qdsdzXf5bttFdVaQmYiarXPIAtHrLec72Qaxg+6gA==
X-Received: by 2002:a25:4c81:0:b0:dfa:ac81:38eb with SMTP id 3f1490d57ef6-dff153b1745mr8176615276.27.1718625750837;
        Mon, 17 Jun 2024 05:02:30 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff048bd22csm1880974276.34.2024.06.17.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:02:30 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dff36345041so1246397276.3;
        Mon, 17 Jun 2024 05:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDrCt2qPFZ3NwLkL1AeCvOLDZvIGraaPomTHIXcyJVusQc3ZbMDbKakrg6yLRNhlweQ5BzZB3C7y7gSTbDvyy43SdAOQN3TaQdSlGHtqfTXrFfboLhiNJqqzvulfydDG8KrpgN08Xp+QU+0QfarY22ymrao3FtYlEZJteyZutz8GVv12qKLs8Zm/6l0X4p84r5u9NzfLoIon5uPD7A3+aZX+3o/5Likw==
X-Received: by 2002:a25:a285:0:b0:dff:2d99:9c3c with SMTP id
 3f1490d57ef6-dff2d99a245mr5109438276.57.1718625750352; Mon, 17 Jun 2024
 05:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611113204.3004-1-paul.barker.ct@bp.renesas.com> <20240611113204.3004-3-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240611113204.3004-3-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 14:02:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe8aaweQJ2=V7ksKTqcJCnqewKhSrrO4h7X924Vbk-_Q@mail.gmail.com>
Message-ID: <CAMuHMdXe8aaweQJ2=V7ksKTqcJCnqewKhSrrO4h7X924Vbk-_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] pinctrl: renesas: rzg2l: Clean up and refactor OEN
 read/write functions
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Jun 11, 2024 at 1:33=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> The variable naming in the various OEN functions has been confusing. We
> were passing the _pin & bit variables from rzg2l_pinctrl_pinconf_get()
> and rzg2l_pinctrl_pinconf_set() as the offset & pin argument to the
> read_oen() and write_oen() functions. This doesn't make sense, the first
> of these isn't actually an offset and the second is not needed for
> RZ/V2H but leads to confusion with the bit variable used within these
> functions.
>
> To tidy this up, instead pass the _pin variable directly to the
> read_oen() and write_oen() functions with consistent naming. Then
> rzg3s_read_oen() and rzg3s_write_oen() can use macros to get the port
> and pin numbers it needs.
>
> Also, merge rzg3s_oen_is_supported() into rzg3s_pin_to_oen_bit() to give
> a single translation function which returns an error if the pin doesn't
> support OEN. While we're here, remove an unnecessary branch and clarify
> the variable naming.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> ---
> Changes v1->v2:
>   * Merged patches 1 & 2 from the previous series, updated to be
>     compatible with recent patches adding RZ/V2H support.

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -994,53 +994,43 @@ static bool rzg2l_ds_is_supported(struct rzg2l_pinc=
trl *pctrl, u32 caps,
>         return false;
>  }
>
> -static bool rzg3s_oen_is_supported(u32 caps, u8 pin, u8 max_pin)
> +static int rzg3s_pin_to_oen_bit(const struct rzg2l_hwcfg *hwcfg, u32 cap=
s, u32 port, u8 pin)
>  {
> -       if (!(caps & PIN_CFG_OEN))
> -               return false;
> +       u8 bit =3D pin * 2;
>
> -       if (pin > max_pin)
> -               return false;
> +       if (!(caps & PIN_CFG_OEN) || pin > hwcfg->oen_max_pin)
> +               return -EINVAL;
>
> -       return true;
> +       if (port =3D=3D hwcfg->oen_max_port)
> +               bit +=3D 1;
> +
> +       return bit;
>  }
>
> -static u8 rzg3s_pin_to_oen_bit(u32 offset, u8 pin, u8 max_port)
> +static u32 rzg3s_read_oen(struct rzg2l_pinctrl *pctrl, u32 caps, unsigne=
d int _pin)
>  {
> -       if (pin)
> -               pin *=3D 2;
> +       u32 port =3D RZG2L_PIN_ID_TO_PORT(_pin);
> +       u8 pin =3D RZG2L_PIN_ID_TO_PIN(_pin);

It's OK to use RZG2L_PIN_ID_TO_PIN() unconditionally, as RZ/G3S does
not have any dedicated pins with the OEN capability, right?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

