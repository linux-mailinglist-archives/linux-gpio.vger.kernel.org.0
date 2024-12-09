Return-Path: <linux-gpio+bounces-13683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CEA9E9AE0
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 16:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDACC188830D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 15:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0760D12BF02;
	Mon,  9 Dec 2024 15:49:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C2C25777;
	Mon,  9 Dec 2024 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759370; cv=none; b=dAKaYWfAMolhxDLsqkswf3OPwuIwD+Efsx9IWrwI/syav9SKoPcBYqxqwRTH2anvGaFmY3EMrZLaEWgsyOSTl8pah/C3u4YNBkPyQSHeDumMKeSrXZuB8QRCXlPEZ1IGznME6+tgUlycMj+Qsedwbsc/aeM7RIwKhhm+bOYGII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759370; c=relaxed/simple;
	bh=LjMNUFQMHLJCY4P1HKwbqDBINnhwCB3WKXmNB65YJmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5FV2Kxp9FaUEsxq6/ZXdbN8cfW4rSeaZQyg7LIxxMCM34Sn9oiUyMoU0CnroEThfnOeocZNtcBxI4/G3HFHU2Ao6704NFRXUZB6fr/Cqttuq8hZ0iiC+lNsFiyePS/uIdqxGps+rntuZTJd1S546y7m9Ij6W9AeyaCThZpDEBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85b8c94a6b4so887703241.0;
        Mon, 09 Dec 2024 07:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733759365; x=1734364165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aTRQnkUNKVUbImYBxHqUKoieNHc96HYQ9+Ue9BP2LI=;
        b=DWaNx+iJdA4nmI6FrUxutX4n8Dv7o83QnU4xrlkTOSUa/9XPxBy2CVbZQl5orZtFGD
         s/ffNwsZ2/KiDXaAQ6bMFKQAmaRKExFQiDe6Rf8C79mkjkTu4QuqCd4ILWnJIBkZO43O
         otdY2myI5Vil4QFklemLvq3YThOBpsOtClXMSd5XmpENi1XAh8jUxN7TSgqqx210dTG2
         T647ohDhZ/fiQFY5d9FQYT9EsJ2tiGNW5XRQh96q8nJP9JVubKJ6PcU+hZp1ZFYBOUPM
         re+SjImisQiPYz+0ITphA6bDAtTcavd7TogDkKBBOYRAIblM8rqBs4RtfdQbHgMjTAoh
         Vsnw==
X-Forwarded-Encrypted: i=1; AJvYcCUyDcgT8TzEFCDqE4IkYKoGjXT8ZQMvki+7bGuxdiUrQjrf8DWnjlhSDwLuuWED/dRlbDEJ166UnCQEAg==@vger.kernel.org, AJvYcCV5oyQVree2xG/SSHl/he5aoP7wpF3XYtjQxbpVHj/p5p3ATEbJlDxiEvzxnz1S4AduEh/vtbrPl0s2tJXzGlvIOY8=@vger.kernel.org, AJvYcCWceaDcnrAZOIOj7B6Mpmtt+EuM18wXXy2rbrTgq1IWXUiy9O3tBVFC51mUoqa8ZngCr8K4UI9QBkljuTJw@vger.kernel.org, AJvYcCWpZXk4QvlWU2UBfrfX4atmU7sV6xEfA+k3Bdg5r+Ap4BXkjLG2y9NuGPKCJE7uVcIrDwB6SAyqmshx@vger.kernel.org, AJvYcCWsDXu9HT3Deue0Syx+Dk84UoedUy+bulLaiyDdGdO/ECPb5/f5eKgDWRE2m+LBA92v3xuJr3DvPTIU@vger.kernel.org, AJvYcCXKLnDUWxExLJ06OwFhkRlLS83BbX+xUcGUWZcllupIcwc/7kXpXqEOVtf98+PsCQ4gPwkb77q4EYSTZJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkOcQKb2MqPWEVhF5FyFXknugdEHp6Q5t8giXhL40RWWGu8r4q
	0MYhGIQHKk/x9F5haYpgTG4tVpVvsjlbBWOFsjkKzov+qgTynpZTYmjkRBcQGes=
X-Gm-Gg: ASbGncvabtXm6Q7hJVortvhJHKmbhTGejfNpriKEOzjNE6ZeNPoewHOXpHP0i79gDCa
	VNRrNZMET9AEPOKDEu7FEyiPoICMjunW7b05P23WSkqczO1Wv7rKcj8s5X5YqRTDsJoWlUO6Oqc
	GHrixQVb/Udx5XS9yREWEiRyTK1tfVhV1yVIBJnr+96NSbOVpjLKS0T4MOjterWVSF6oS9aJFmi
	M2UnwpWl61N+EyVO07NWOPDz+igjIVvqJ0hMQj9hVkO7HrvLWiwNfZosvlAVRjIWtdRgPooj3hd
	igmqXfgedE5e
X-Google-Smtp-Source: AGHT+IEt70oVAjOZug8nZYNXKcFzpzT7aPP023b4YfeR/u48ImT0UyP5usSDkyZ31PflPQQXg3YJdw==
X-Received: by 2002:a05:6102:d8a:b0:4af:f6e5:2b46 with SMTP id ada2fe7eead31-4b11608bc29mr1725441137.9.1733759365231;
        Mon, 09 Dec 2024 07:49:25 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd719eb3fsm816816137.27.2024.12.09.07.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:49:24 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85b8c94a6b4so887691241.0;
        Mon, 09 Dec 2024 07:49:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6GajfDJgQBihPSuhIlTlVusxhFDtKW70/RpcvET2WWXonx9whexZtXQIKbC22S2FDc5TuaxYOaJhw5STL@vger.kernel.org, AJvYcCUJAzWXgqCfONgUqiuRl1KKpg/GQrlbvwcDbBBvjCuyacVkgovjC71oDwoA412gTcFWVStk/b0vpdCWBnQ=@vger.kernel.org, AJvYcCUibGnB990/OX1n6n4xO5BzpwtVgy48oGH+eUOfylJw0zvRgn+fSuPuQn24q3EWY4LAY/ecgs36TENB@vger.kernel.org, AJvYcCV6Zg869nf2a+PIevFxfkUI61kf1OHTovU8bg4Hak+5lB6TE/BJECxTIZ7/NyA05Zax2HapuHMF16Dweg==@vger.kernel.org, AJvYcCWXCBpcR+kg5FNkULYn1OIeF+4PiDA5QxXJl/fVmNWTdQ0bjR9gDoWz69bxcm5it2PaNwKrmurImEIiHzxCGGSgA9M=@vger.kernel.org, AJvYcCXEjT2SW13QavE43+Mx9uDHaSVLUSUNc742NilZ14wcQRT7w9IdRu0/45am0wpDKa5o/VSgMIg4jwwp@vger.kernel.org
X-Received: by 2002:a05:6122:a0a:b0:518:865e:d177 with SMTP id
 71dfb90a1353d-51888560690mr1285238e0c.9.1733759364092; Mon, 09 Dec 2024
 07:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-24-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-24-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 16:49:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0adApx2uGvM=xnY-rBd9UNYQiEouzvwhq6Oupyy0S3w@mail.gmail.com>
Message-ID: <CAMuHMdV0adApx2uGvM=xnY-rBd9UNYQiEouzvwhq6Oupyy0S3w@mail.gmail.com>
Subject: Re: [PATCH v3 23/25] arm64: dts: renesas: Add da7212 audio codec node
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
> Add the da7212 audio codec node. Along with it regulators nodes were
> reworked to be able to re-use them on da7212.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -63,7 +63,6 @@ vcc_sdhi0: regulator0 {
>                 enable-active-high;
>         };
>
> -#if SW_CONFIG2 =3D=3D SW_ON
>         vccq_sdhi0: regulator1 {
>                 compatible =3D "regulator-gpio";
>                 regulator-name =3D "SDHI0 VccQ";
> @@ -73,8 +72,8 @@ vccq_sdhi0: regulator1 {
>                 gpios-states =3D <1>;
>                 states =3D <3300000 1>, <1800000 0>;
>         };
> -#else
> -       reg_1p8v: regulator1 {
> +
> +       reg_1p8v: regulator2 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "fixed-1.8V";
>                 regulator-min-microvolt =3D <1800000>;
> @@ -82,9 +81,17 @@ reg_1p8v: regulator1 {
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> -#endif
>
> -       vcc_sdhi2: regulator2 {
> +       reg_3p3v: regulator3 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "fixed-3.3V";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       vcc_sdhi2: regulator4 {

So that's why it's better to prefer named over numbered regulators...

>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "SDHI2 Vcc";
>                 regulator-min-microvolt =3D <3300000>;

LGTM, so
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

