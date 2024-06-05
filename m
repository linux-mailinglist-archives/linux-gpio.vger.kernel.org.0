Return-Path: <linux-gpio+bounces-7158-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A58FC81A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 11:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40BB81C222D7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 09:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D039E19149D;
	Wed,  5 Jun 2024 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFkzOiC+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00C18FC92;
	Wed,  5 Jun 2024 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717580376; cv=none; b=MOAODEvNu42J001Ff/40sBDWTw/ZwWeikhv7xsZBdrXqH+54L9PEkbPXY6rC7wd7+hFIP1fAjCXdnsfX5CAhlVz4YajGdhLA5VGWsGUudWqZkSN2weZPazNAlSTdckEDW2fYUH9HiSMtQNURnt72PYpivQTXgBFcY76OnKjcxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717580376; c=relaxed/simple;
	bh=nD56f68PCLOYxyLOXE35qjDHSDWC7yB5yTQqIGFjuZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xd95/ZaapMbqw4sxvioUI9G9UET0Ns92F2oAf/VpKODBuE7C6KusyXj+Ju1dVG+a/1pSpfT7Ia4z99GrcMs/WAqfDTFT19WYPm4cLJ0Tt1xFV4JUWh3DKlUj6YCTi1KqKDrfi3ihrfFrA6A40YjqPyteWJD91zpR7dKUBREPsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFkzOiC+; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4eb076bec24so838950e0c.1;
        Wed, 05 Jun 2024 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717580374; x=1718185174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puyOGqVsp6EcirumspQfyKcZNWl80Nyr2MnUIFboX5E=;
        b=mFkzOiC+mJs0Zm8AknXO9mgrN3/wDBoOAOpzVGbwd7/TkG/0NLoD7xb5ht3Sxy0vBw
         xZPy6OLDmkIHi/6i2REo9ix2bVLco4KCs1N0bq9btuCHZf05fcZZQKLv98h8211QankG
         ZQHDeKDCvysEvTQasYhworvySuiPvPTMHE27Jiz2+s6nB7iGTX1/0G8/orcwbtusUjsi
         V6phKjQkl1TIEq3nLFMdo2avxA4oU7eCzPb7v5CXX1oQwHRLz3XQJTdU3nQblbfEBAaa
         LEJYGKg7RPNg04mJUAMvwNKO2LA9plg1IzmBXL8SLvxop/MBkMGQMz2QoHwb/VhJwY3U
         Z8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580374; x=1718185174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puyOGqVsp6EcirumspQfyKcZNWl80Nyr2MnUIFboX5E=;
        b=BdznCRQlwGJW88tp5tzw+ITQbrqsooY1yQn5oGioYDADOWVutPBxEwwRp7YPlW7E49
         BLfxWwtjgDSK9xJoc63guOGvaKXXu1/iQTy6pM19iMsOllWel42oY0hb0fT5ftuJ2tdk
         P4ySpZlbL23TkQ12jgF0me7JnVSsr+uuWEPUAVTbqC03dgTrC/ATDUnqb0oqTfMtfUev
         wzC6FroOe15n2m8mXpR0KSrOGoAGWCGpyTsIDueNOcRZMHfijMRAfsh4ALzX4Ty33WOD
         Osp/c4IY+urh8BjZL1rbnlza3Sho2iz7aO82GEWcpFoW17qBtMPKGL7r669nfUmok5CJ
         Tq9g==
X-Forwarded-Encrypted: i=1; AJvYcCWLZIgFpJT2rCHT4a7Is+C+WLzHLX9NakuSR3irKKgtNO4nQNZjsGhblaXu7MYRxAAns81m3yK/FyGAKmJSj47mjZFQFTxunkfLX+LB2NohVofKEGRJDbBx/AMGGq1aiUppGM7nXMOAWRulJdxglQUOhnvKUHzz8hc7vVo4CLakgj78Ur0jQzClLWCFOZ9troHHMcsN38+z5W5uvz/QRKspioR0MtIlBA==
X-Gm-Message-State: AOJu0YxHFph+2WHb+uSb2z56DKeTykiaowNkq2EkYeUSR/br+GEOnAwW
	TCes0sEswGFhK1jdzZ9fUyBuGeeilUtJsJPAM2DFQ2YACai994EjC2BDyszGdSgWiJbOAcbyBvq
	T2eoE4Kte2GBmgtJF7Tdc1qYCpJs=
X-Google-Smtp-Source: AGHT+IHKVZbron77oXwx1ZkFPJkIlhOanhnzVnxce6/3ktf3Rrup3CLtOeLG7YuQ9X+FL7QjwPjQUpCBV9P3+jXhDFw=
X-Received: by 2002:a05:6122:328e:b0:4e9:7df0:dc7d with SMTP id
 71dfb90a1353d-4eb3a4fe15cmr2216061e0c.15.1717580373635; Wed, 05 Jun 2024
 02:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240604153612.GA839371-robh@kernel.org>
In-Reply-To: <20240604153612.GA839371-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Jun 2024 10:39:07 +0100
Message-ID: <CA+V-a8tWxGBkuOY=G3RaB_0NXS3ShE-nL+5t49=_mJGvo6j6yQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: pinctrl: renesas: Document
 RZ/V2H(P) SoC
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Tue, Jun 4, 2024 at 4:36=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 30, 2024 at 06:38:43PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add documentation for the pin controller found on the Renesas RZ/V2H(P)
> > (R9A09G057) SoC. The RZ/V2H PFC varies slightly compared to the RZ/G2L
> > family:
> > - Additional bits need to be set during pinmuxing.
> > - The GPIO pin count is different.
> >
> > Hence, a SoC-specific compatible string, 'renesas,r9a09g057-pinctrl', i=
s
> > added for the RZ/V2H(P) SoC.
> >
> > Also, add the 'renesas,output-impedance' property. The drive strength
> > setting on RZ/V2H(P) depends on the different power rails coming out fr=
om
> > the PMIC (connected via I2C). These power rails (required for drive
> > strength) can be 1.2V, 1.8V, or 3.3V.
> >
> > Pins are grouped into 4 groups:
> >
> > Group 1: Impedance
> > - 150/75/38/25 ohms (at 3.3V)
> > - 130/65/33/22 ohms (at 1.8V)
> >
> > Group 2: Impedance
> > - 50/40/33/25 ohms (at 1.8V)
> >
> > Group 3: Impedance
> > - 150/75/37.5/25 ohms (at 3.3V)
> > - 130/65/33/22 ohms (at 1.8V)
> >
> > Group 4: Impedance
> > - 110/55/30/20 ohms (at 1.8V)
> > - 150/75/38/25 ohms (at 1.2V)
> >
> > The 'renesas,output-impedance' property, as documented, can be
> > [0, 1, 2, 3], these correspond to register bit values that can
> > be set in the PFC_IOLH_mn register, which adjusts the drive
> > strength value and is pin-dependent.
> >
> > As power rail information may not be available very early in the boot
> > process, the 'renesas,output-impedance' property is added instead of
> > reusing the 'output-impedance-ohms' property.
> >
> > Also, allow bias-disable, bias-pull-down and bias-pull-up properties
> > as these can be used to configure the pins.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Updated description for renesas,output-impedance property
> > - Updated commit description
> >
> > RFC->v2
> > - Renamed renesas-rzv2h,output-impedance -> renesas,output-impedance
> > - Updated values for renesas,output-impedance
> > - Added bias properties
> > ---
> >  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 23 +++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctr=
l.yaml
> > index 881e992adca3..957b9f7e7de5 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.y=
aml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.y=
aml
> > @@ -26,6 +26,7 @@ properties:
> >                - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2} and=
 RZ/Five
> >                - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
> >                - renesas,r9a08g045-pinctrl # RZ/G3S
> > +              - renesas,r9a09g057-pinctrl # RZ/V2H(P)
> >
> >        - items:
> >            - enum:
> > @@ -66,10 +67,14 @@ properties:
> >      maxItems: 1
> >
> >    resets:
> > -    items:
> > -      - description: GPIO_RSTN signal
> > -      - description: GPIO_PORT_RESETN signal
> > -      - description: GPIO_SPARE_RESETN signal
> > +    oneOf:
> > +      - items:
> > +          - description: GPIO_RSTN signal
> > +          - description: GPIO_PORT_RESETN signal
> > +          - description: GPIO_SPARE_RESETN signal
> > +      - items:
> > +          - description: PFC main reset
> > +          - description: Reset for the control register related to WDT=
UDFCA and WDTUDFFCM pins
>
> You need a conditional schema for ensuring the length is 2 for RZ/V2H
> and 3 otherwise.
>
Ok, I will add a conditional schema.

> >
> >  additionalProperties:
> >    anyOf:
> > @@ -111,6 +116,16 @@ additionalProperties:
> >          output-high: true
> >          output-low: true
> >          line-name: true
> > +        bias-disable: true
> > +        bias-pull-down: true
> > +        bias-pull-up: true
> > +        renesas,output-impedance:
> > +          description: |
>
> Don't need '|'.
>
Agreed, I will drop it.

> > +            Output impedance for pins on the RZ/V2H(P) SoC. Values 0, =
1, 2, and 3
>
> Don't repeat values in free form text.
>
OK, I will fix the above and send a v6 series.

Cheers,
Prabhakar

