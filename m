Return-Path: <linux-gpio+bounces-1768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0981B5B2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 13:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 674B21C236FB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 12:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D4F6EB75;
	Thu, 21 Dec 2023 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="UrlAekeh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3912206F
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 883BB3F15B
	for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703161296;
	bh=5yOM88UnN2btzDcnsPnqzcK3v085hMK5F/zsjhGZgro=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=UrlAekehBWXVm8o5Ck3NhS03DpNn88aMDuLo2aMDgzztwJFKEk15971ozrYbO4Fjm
	 jLaZ+tS79HsdwdxrqNcjsPT+9wiGz+eprDKRRKGCDb+iTwZWXVrnqEGuWWT3Hsd9Yh
	 bir8dynXQjtmcI1Hl6LxksYlsEP87k0DjBVVl2vApODtuN+AMUOfYgqyH4YTQRXtCe
	 t5+bN4ps6JXj6znmOg4NTd2HPvZx4P4g9GXs2eZpv2VRofGLiREIwDMAw1Jv4oAYxe
	 IpbDuO9I+eSpS5LFH8Lkktvzb+dYEyWCjQJh34hl9lXKdgDj8pofjqDSZ9iBY6ujFV
	 8KxGk1/1Yjjug==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-423dfab246cso9847581cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2023 04:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703161295; x=1703766095;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5yOM88UnN2btzDcnsPnqzcK3v085hMK5F/zsjhGZgro=;
        b=riXzdeO7R0rcZXFQznnWFdqxXD7bIC+ich6I8tk6mglMaiZ2g5iVuPT+qBxvnwnyLa
         f0fDMHpIwzl/tp2EnoJqAVvvJ0x3yMy1AkwhHsVvF2cP5psDzQpJaEU4sM3gdeAESJBr
         V9BGakLmK2vwlXPxQFVqrKxteXk9KOGDGLwnmpbGrfQHq4z6rvlKHReOxjjZbvXNWO86
         /FlpAeLo+AlJJPLjXbAee1LbaokWn/E4UiApIQ4cG3Lt9lBz49NhkFIb4b/vCq+uHL3V
         vMQk0P63zPa2mgWacJg6FEOE+tOIIdaCjq40Dptry4iVIdBJ+TY6PPiNpFzki0MmYycg
         qupw==
X-Gm-Message-State: AOJu0YyVvZsgNtA2IRmnzxmUm1k0KRfaYUKmY6oGs53xq381jm5f46XI
	6iZWzcd5WdF7u9cLfncA26PuQhRN+PKNNpdmxDpjC2VPGjAby8kdmaeD2t/aDiZLR4mEKwSOp5I
	71hAqAiCJCKeGfAnxyJoWCY3gNpcqkWHxqUKji15HzOmBpJilp5a8G4U=
X-Received: by 2002:a05:622a:14c6:b0:425:917c:7536 with SMTP id u6-20020a05622a14c600b00425917c7536mr6534462qtx.119.1703161295575;
        Thu, 21 Dec 2023 04:21:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpMGKr/Zb4NKcCnJdLXeBdkeSOCI9GetmOSTchFTZuRlYVVuqcu2glq8Xby4HmQ5C3aTmS9z58/3PgkaRgvH0=
X-Received: by 2002:a05:622a:14c6:b0:425:917c:7536 with SMTP id
 u6-20020a05622a14c600b00425917c7536mr6534438qtx.119.1703161295305; Thu, 21
 Dec 2023 04:21:35 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Dec 2023 04:21:34 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CACRpkdZf09uKr+ka0_rsw5kHMjjQbaGypn2fx2-QobLFBKYrtQ@mail.gmail.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com> <CACRpkdZf09uKr+ka0_rsw5kHMjjQbaGypn2fx2-QobLFBKYrtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 21 Dec 2023 04:21:34 -0800
Message-ID: <CAJM55Z8hT_fUAjzNR=7aoWJPU8MMumjdFy74MDD85Yic2Gjg-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Linus Walleij <linus.walleij@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Drew Fustini <dfustini@baylibre.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij wrote:
> Hi Emil,
>
> thanks for your patch!
>
> On Fri, Dec 15, 2023 at 3:39=E2=80=AFPM Emil Renner Berthing
> <emil.renner.berthing@canonical.com> wrote:
>
> > +  The TH1520 has 3 groups of pads each controlled from different memor=
y ranges.
> > +  Confusingly the memory ranges are named
> > +    PADCTRL_AOSYS  -> PAD Group 1
> > +    PADCTRL1_APSYS -> PAD Group 2
> > +    PADCTRL0_APSYS -> PAD Group 3
>
> Really, even in the documentation? If you look at the layout on the actua=
l
> chip, does a pattern emerge?

Yes, the documentation is where I got this from:
https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH=
1520%20System%20User%20Manual.pdf

The pinmux chapter starting on page 31 only talks about the 3 pad groups, b=
ut
if you match the base addresses, table 3-8 page 46, with the memory map, ta=
ble
1-2 page 1, they same base addresses have the PADCTRL names above.

> I think some use the north/south/east/west as group names with the BGA
> chip facing up with the package text correctly readable then it is a bit
> like a map.

I don't know if or where such documentation is available.
Jisheng, Guo or Drew, do you know?

> > +          function:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            enum: [ "0", "1", "2", "3", "4", "5" ]
> > +            description: The mux function to select for the given pins=
.
>
> So why is the opaque names "0", "1" etc used, and they will be the same f=
or
> all pins I bet. Most drivers use a string identifying the actual function=
 here.
> Such as "i2c", "gpio", etc.
>
> Names that are just figures are *impossible* to understand without access
> to a datasheet.
>
> The point of device trees sources are to be human readable, strings of
> magic numbers are not human readable at all.
>
> > +          bias-disable: true
> > +
> > +          bias-pull-up:
> > +            type: boolean
> > +
> > +          bias-pull-down:
> > +            type: boolean
> > +
> > +          drive-strength:
> > +            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, =
23, 25 ]
>
> milliamperes? Then use drive-strength-microamp.
>
> If not, explain what each setting means, i.e. the number of max microamps=
.

It *is* the number of mA. I can change it uA if that's better.

> At which point using drive-strength-microamp and a translation table in t=
he
> driver may be a better idea.

That's what it does, just with mA.

> The only reason to use opaque numbers is if 1, 2 (etc) mean something lik=
e
> "number of driver stages" with a current output that varies with technolo=
gy.
>
> > +          thead,strong-pull-up:
> > +            oneOf:
> > +              - type: boolean
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +                enum: [ 0, 2100 ]
> > +            description: Enable or disable strong 2.1kOhm pull-up.
>
> Just use bias-pull-up with an argument.
>
> bias-pull-up =3D <2100000>;
>
> No argument would be the default setting.
>
> No need for custom bindings.
>
> > +        uart0_pins: uart0-0 {
> > +            tx-pins {
> > +                pins =3D "UART0_TXD";
>
> Pins have reasonable names, but...
>
> > +                function =3D "0";
>
> What about function =3D "uart_0" hmmm?
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

