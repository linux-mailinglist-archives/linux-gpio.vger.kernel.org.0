Return-Path: <linux-gpio+bounces-18762-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D31A879BE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 10:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00DBE7A47E1
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 08:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A013E259C89;
	Mon, 14 Apr 2025 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzFpYuqk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E442077;
	Mon, 14 Apr 2025 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617946; cv=none; b=ReczwLdftcv8/DCbsESv45wo3YxvLOVe+b1QzpkVRWlp6nxQWsKem2eK+0Xm0jnh/S9y4/2e/n3mY6fRx3R6MLA5ZpGP2S0rsToNvw7FXNK6Nw+cCvIJ3iy3aF8sDRbxSCgNULkwR3jMzLqus5PLMQBZRCX7VO2x2PEcGsIsUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617946; c=relaxed/simple;
	bh=ktnWRremh4PlCVgM9PmJj7ZdmtWLOoFQiD5o5kvXX5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eh5GIHOlgZp4Tw3qmkM7CFFpcKiVov4oUOc5wu4ADzd3vq0Tc6bhwGAaP9UHac/cGv/xV6US5JXXp0zd/NsJiRTLNWdsYq14m866+SP93Wnc8c8Jx+by4pebpNExtKNMOW3x588w/N5q/Jr9L+wYANRGFhDD4sLu+Q5XlIR/3xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzFpYuqk; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523de538206so1439909e0c.2;
        Mon, 14 Apr 2025 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744617944; x=1745222744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+VLHUwu2moLQRiFoDs2lVIxZQ3Y1UP6WBvKjCENsm8=;
        b=EzFpYuqkUVahA4VV5sdIxnClVLwy8rrtCgxGfVjHYmPpWPgChh/A7gMuswwF9PcKk6
         jXZIWG6MqMrrurP4R9ITE87NrGnyMwBNzqm79doA0PcmF4YGYP4Jnu/8/BjE69HOo0Vg
         uR4emhipQyRYaMQsZ3kWSbsEpK+yHK2ZGydpdZG6lMj2pmuAk6K/5eLFOlUnTBw+Sy2K
         kDdDv3pLnWDPaMqoCYmK+y7vlkqvGv3G+s9ct9SVrdi+U/5pAdHkPSHjbjltqhjYFqj/
         24EmhnNr34F9TMFyky+GiLqeew77duLEjOydTEFaQl1M2usyWgBFUT5GvAYJsbCS2yvZ
         PhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617944; x=1745222744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+VLHUwu2moLQRiFoDs2lVIxZQ3Y1UP6WBvKjCENsm8=;
        b=VtzjQlpgTSYIdvwNvvM5PWm5n4JQjihfo6tNJZt/ev0AXqwBSqDtdqt4CEPOCq9CKo
         fkUPNlDui0iznSDO+Yb940MfJWN0bm9TWSRmstm9PoRpBn01YBJDgp1QRXSdTD5ScqI3
         VeZR36YV/bMJk89URRDrvlXOG9sIqcgodSiZKxFqiW++AVrGPpIbmRY/UwMkZ/ShpSPU
         TAbYT4EH39WjXjLosMKbC5032prxrng9YFIMaEQr1v9YB9ZccA37DrHdmvsYuh2fOydN
         7ccGLRCX7b2omB5gwGdJIgAzDlT495bqyBMR3IR+kr1vrVwY8LCbg9o1Y7TL9xDFHTuc
         HO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFP7FbvSA1xI7v9RiTgHRC7sXp35Hc+qRkcLlx6ZDaOsFcwLc3qQ7RMtUexfDjhPbM/xHYZblq7GOA@vger.kernel.org, AJvYcCVCnLQGNqFzfRAsGJOpTjmJWWzonJNQr9JipUrlaZRI+pneEdRhyVV+7uP8lf613dPJrmhTEgt82cm6Mg==@vger.kernel.org, AJvYcCVb807Ds7POxxQx9K0x471LuGzaoTd1G9zvaEcGA+055LkHeg4lYglXvPVi7g9wLL6eBAa/OmxhZA2V1MQ4f6ePovw=@vger.kernel.org, AJvYcCW57Q1RBreDQZDfNdI704JZjXNc4o+RpUJzJhxuWkfVq2KXChaVHmRzGtY1gC7ar0LipyPxLho92DTx@vger.kernel.org, AJvYcCXH2Zjrm+OY8aNgVCv7DyAqpOSHRNdxIjWFhp5A+mUAf8B9DCmFawaFyKuQW59IJSgavo2gs9mQlhwSTuNi@vger.kernel.org, AJvYcCXZKGpJMdqUJks5fGHejv+Cyt77zrWejRi3ur8YXoMqibqgOLGDuJpjUtfewymucmRrVagEvO61hkKDzUUT@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPk/5TA9RPme+mH2l8jldAJPh8/hXbH3UHlGaLzabOBG5TQ7I
	sf9LWGKGe5b4u4Oe0H+GnynGiLHFRROueQ/4439tLnynDZwAGvy8MsI6LhWnH+BMhLNgqOTD2IZ
	QILgRyWO8B/xi/TqY58PzyO2HQGE=
X-Gm-Gg: ASbGncuQkMV0SgysmArqFGlRzTpIv6QXCpitkMPuUPW/JjkjMhi28rpLMjLUt9GSRvD
	BCSgDXqgpLi8scoSF6hIgGGdIixNIs6W7yIC91Ocw6nTXwntpr7L1JdPLHzHMM6erB/77+couQH
	xufGq4xeV25m95D5VpwHECHg==
X-Google-Smtp-Source: AGHT+IGCuud+Irbj69epGrU5bI9UHnAGW5z8Rh63mS+v+tdlhSzX3+RYnZruxoaSI9aRjH+6eIkClJCAuUSCoSOFb/s=
X-Received: by 2002:a05:6122:1d8a:b0:527:8771:2d39 with SMTP id
 71dfb90a1353d-527c359f576mr6787965e0c.7.1744617943428; Mon, 14 Apr 2025
 01:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407191628.323613-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU0ee30MCXSdW=hho42qFHeT5fpNv0_aNSAv-5wXk2g2A@mail.gmail.com>
In-Reply-To: <CAMuHMdU0ee30MCXSdW=hho42qFHeT5fpNv0_aNSAv-5wXk2g2A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 09:05:17 +0100
X-Gm-Features: ATxdqUHgM77RmTUJPhf3exniWzHJ4NsZqQHYq4gV97TCNKEqiGfMBLPyBJ15mBg
Message-ID: <CA+V-a8uD=n5-1fS4N4CBygT=vbdnAO9+-5Tv+GL+6Y27KmsEXA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: renesas: Document Renesas
 RZ/V2N SoC variants and EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Apr 10, 2025 at 10:07=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Renesas RZ/V2N (R9A09G056) SoC variants, distinguishing
> > between configurations with and without specific hardware features such
> > as GPU, ISP, and cryptographic extensions. Also, document the
> > "renesas,rzv2n-evk" compatible string for the RZ/V2N EVK board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.16.
>
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -551,6 +551,21 @@ properties:
> >                - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + =
Ethos-U55 (21mm BGA)
> >            - const: renesas,r9a09g047
> >
> > +      - description: RZ/V2N (R9A09G056)
> > +        items:
> > +          - enum:
> > +              - renesas,rzv2n-evk # RZ/V2N EVK
>
> Shall I add the board part number while applying?
>
Yes please. Thank you for taking care of it.

> -              - renesas,rzv2n-evk # RZ/V2N EVK
> +              - renesas,rzv2n-evk # RZ/V2N EVK (RTK0EF0186C03000BJ)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Cheers,
Prabhakar

