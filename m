Return-Path: <linux-gpio+bounces-24129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07862B20094
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 135751895A85
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 07:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E0C1F4E4F;
	Mon, 11 Aug 2025 07:46:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480FD376;
	Mon, 11 Aug 2025 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898384; cv=none; b=qDHslWRQqaXLfyJ921I9QWQVqo2L9jG7aINj9tuSAx1N7W74NQTmEL90qPmZmnTDLCWYyZSxspod2izKorNfB/p6J16iuuE3aCOeu0fboL7IYSlBzBibU6xLoCuVuOlkh3jeUWyapm28VABpq5p+xgBOS4OylzLGByC0hrwzQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898384; c=relaxed/simple;
	bh=U3XP+gWmQ4OsMcgVLWaufhUMd13owEe8+q+dUfgqSaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPk0OFwLyr3xBf/H3Q/3qdbdNWodCPKiC1RD46f2dx21FYRa3Wd2cztq4SH/X9w6HfYt0eenIqI5rOGofwrrlnT+6Jx9lDNVsYTMvsCYPpPwxXV3YOpkwlL4IBhd2nt3DF6NwGYsAtVn/W1ZasWQAXGq43JYlgTZlkDIM8PjP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5392c221192so1464076e0c.2;
        Mon, 11 Aug 2025 00:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898381; x=1755503181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjgDqZvIS5PvzVHeByAV8E8Bt3AJXI52a13+Zdbj6iI=;
        b=wBZgwWPHP1dgGHrn42mtAb6Hc9af0DuYdUGAxMtmUCsXx74wIEuYqtgE7FfTCsjVE3
         2G9SNjS5ozv3ko1CMFKguc0HqLM5bRgBS4gJPKgOjaxgeUMWwXfr05wQ0/HcA5dOlBIy
         iOhl4gsRtJ26j1bzjqL3LTg4E4/9+nCLrOHr2o2tX5yTjzzZmyKyzyx3EaoCNu/KnLjf
         5KiDw/IEuTYUDrgZBylsJe3h8gUBLMyfSYJCx3LYrl9PbqQkJt+cJ5IIRAQree2hse9P
         k0wwQRk3AKMzMx01Fsef8CV1EpYfMf3Sks7DgzVJqPtFBRpNxlostNNgWOFn2oqyfszI
         YY5w==
X-Forwarded-Encrypted: i=1; AJvYcCUCBm/E8ON02ERv4euteGK5DsjhmyosMePhxO2PYudlcJ3zz8zscU2niBej+caypOibqSmzvdhia5PvmQ==@vger.kernel.org, AJvYcCUXhAijVzD1xUQ5mLclxZdERVHG8f0MaAnjBshP/MkFwIty982mK2uVikyx/ljGOSpZBnlitHCp2his@vger.kernel.org, AJvYcCV5qts4lbEM6NdLXa893QHiiHEzTpSF1SVL5FQgHbxu57V1RJfL8CczqhAboYVYrPS3rbYoU+S+1pUoOE2P@vger.kernel.org, AJvYcCXmpv1ctiGw0D+oPGZIHOmRS2TyppvnZY07mL7yiT5kswijujDPhUY09AsrxCUvFgF4mKoutyDWWg5vjzjVHwuZ600=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy20hAfrMmCKTshpazrb/jFjRJJl0TeKS8e/Lgi9ZYqVavj6WdK
	lQsxYFDqmTBSisb5UaPcDNdLZ8rrp0kYccuETB1vCo9rhn7XTxT0OlniMRCFkJi8
X-Gm-Gg: ASbGnctF6mEe4ELNuwx+/DDH9QWMYnleKdSGgjGibGP9J24rQl2xM3XPOXWBKf5pSpZ
	ppBvS+l0659CjT5hWll9lfzgpjx8jtHZxKjJjvgFD7EEWEhREjHsA9K8w6idikQiUfKmIkvolID
	UiCBgEfA2Zmif3k3f19KimD+pyHf6UlHGk6le54uLUuSb/GbGMI+EeqgfnJQo69LxBTkecU1Fnv
	VQ/MWyNsHat6+Y8rK8mmfa3a4zPFBc5y4OHdPd2Mo1CEsN29E5yngVJ6PzLcY3FbIWQzL8LobEt
	reLeAj6TLsnRlj+S5eHKbcBATwP9SSEpyr+nrbIZ4gyYEo9mSufiNopc046191TVUUbqVN0LaYn
	C2FqGYmix/vLWm0UoReWOeeMl0eSIYbo0QkOJwakkOlhd/VqQwveaaVsjo0kv
X-Google-Smtp-Source: AGHT+IGANYthSXjwFZfMDX6lWVomhANCeW4hGsIRG7TOEh6VzLJsTXOqY/ikliCxDcHX1Z3vDD0K0g==
X-Received: by 2002:a05:6122:a13:b0:518:6286:87a4 with SMTP id 71dfb90a1353d-53a52d6878cmr3886838e0c.4.1754898380807;
        Mon, 11 Aug 2025 00:46:20 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b018941bsm2565638e0c.1.2025.08.11.00.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 00:46:20 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4fec0d6fe30so608772137.0;
        Mon, 11 Aug 2025 00:46:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR8hT2acdXy8br60BlCvzz48eBKKg/Ssx1D6ojOahOIlgvL6lnlGW0Ar/VOu3bQNQHObQGYHf4idsIWQ==@vger.kernel.org, AJvYcCVo7RjkxNg66IIEgxZTFBy54mPn7mBirLveS3NBewMjiCaWs6P1QL52tMhD5WjZihQNt+/Nwuycuz/vWKwM@vger.kernel.org, AJvYcCVtH/3IGzgdbVpxhczjohrvOzZ6O3z1SBU0LZpnkH5+XRf18UK9AoqwaRda4QDGsGcx1B7wUnPqaH38@vger.kernel.org, AJvYcCX7AT9kM8ZMnR1yAtVQBNyaK1EOPrzcYqkA//dqT7eqRwLV+IYMUAwDK3a4R9flBDDvmiXDsl3ENAz2Q2yxhLpouto=@vger.kernel.org
X-Received: by 2002:a05:6102:304e:b0:4fd:35ca:6df5 with SMTP id
 ada2fe7eead31-5060d1a07abmr3979002137.7.1754898379820; Mon, 11 Aug 2025
 00:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250801154550.3898494-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWApWhAzjJ9K9-SFvZYtPArZ9aFQJvMdMyW=ke+1sj5CA@mail.gmail.com> <CA+V-a8u0GkeFS+t_GDj1ku9rqjH_oGhJ19=EkNGP0m-vzAD=fg@mail.gmail.com>
In-Reply-To: <CA+V-a8u0GkeFS+t_GDj1ku9rqjH_oGhJ19=EkNGP0m-vzAD=fg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 09:46:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_w6aOAnTqZg+=OqKAk_xVPLHFZU9+VAVsh04y186ArA@mail.gmail.com>
X-Gm-Features: Ac12FXxY8Dbu7XYUfweftTgqyaBZbqhqhu1O3UqM1JFLjNAHHGFB0HOvqn6Eo5M
Message-ID: <CAMuHMdX_w6aOAnTqZg+=OqKAk_xVPLHFZU9+VAVsh04y186ArA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H and
 RZ/N2H SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, 8 Aug 2025 at 23:13, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Fri, Aug 8, 2025 at 8:51=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, 1 Aug 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document the pin and GPIO controller IP for the Renesas RZ/T2H
> > > (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> > > header file used by both the bindings and the driver.
> > >
> > > The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> > > Both share the same controller architecture; separate compatible
> > > strings are added for each SoC to distinguish them.
> > >
> > > Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v3->v4:
> > > - Used patternProperties for pin configuration nodes
> > > - Expanded example nodes

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl=
.yaml

> > > +                pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_=
CLK */
> > > +                         <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CM=
D */
> > > +            };
> > > +
> > > +            sd0-sd-tmp-pins {
> > > +                pins =3D "RIIC0_SDA", "RIIC0_SCL";
> > > +                input-enable;
> > > +            };
> >
> > Please drop this subnode? It totally confuses me ;-)
> >
> I did drop this in the v5 series [0].
>
> https://lore.kernel.org/all/20250808133017.2053637-2-prabhakar.mahadev-la=
d.rj@bp.renesas.com/

My bad; I had reviewed v4, but forgot to send them.
When I discovered my old draft, I just sent it out...

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

