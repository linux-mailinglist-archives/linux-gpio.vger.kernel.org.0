Return-Path: <linux-gpio+bounces-14784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A1BA10919
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 15:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B0416788C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313E1126C0D;
	Tue, 14 Jan 2025 14:21:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB880034;
	Tue, 14 Jan 2025 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864495; cv=none; b=RRZuUYVMO1y33k2rHVrWOCgWre+t8TAedzJgpEcKIM6TN4chWqx4m+bQ8jXjJ5hs0S2dXfeKx7cHbrLJfwTsDb75XYUuUloJaXATm26Jwm+4GGkRL5j4i+8j6OCmo+/yQLDP6LWOOZSeEAeOAQIWmyAJO1r5K19atFk7gsa/eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864495; c=relaxed/simple;
	bh=X4YFjJxoY0/tFZnk6gz+MxCSdJE4jpqj/CYBPrpBSdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FC7fLBDAFlTEtt3owmaNLX85K0vs4rWMp6Rv8A9LjVFyLYKzCXL39Q5LWrDmI83W5OE56o0Pln4ZxxtfoBPC4JlTvp+k6nmre6qjv6+vbad61RSdlJaxC314sFG5mtvqMlSxumkoc3NF+vgU5KRlOdQVbgU6PdxbSYL2DUlxcK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54263b52b5aso5624355e87.1;
        Tue, 14 Jan 2025 06:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864488; x=1737469288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VF7CpgGuraPOcVgWtPEXcXDSHFkLVsj9pxOgmyyHmQg=;
        b=lVlAOqUZHWotE05Wba80JPM3RRnaL4uPFwq82kdradwTA2+JkWn8PMs4/tqEXbUGoE
         U1Xpqu+wc7gb4+6G9vtEahzwy4guyMZPnfoKJASrRWTz2+nSfZMMI0/lT86aajXPktxY
         7Gac0ktXVtxAPffVj4cLMpCPAtAisz5HZcoiMjEcPy5fTKsRsZzcXPgwaJJmQoOHUMut
         RsmEtnEj0p4hgDUdoqppnGfUrM5L3OHT7a4fdGgDo10yFgH9FOqX7/I676S7vr8f/6AX
         q8QknpdLC/pwh5luXO8WdW2HfpCHhU63n7qXp53sBUYK9AO+eoX6UusRaxuR9TesH6uQ
         Hzkw==
X-Forwarded-Encrypted: i=1; AJvYcCUu5Jl1YVqpPVHWQUvpywshvb2XSHBt6QuTWm1neKQbEvlosViDqUGxt/B5vfg0pOZc8RMDIK3x84sr@vger.kernel.org, AJvYcCVIOY+jcMuPVTecGJAp13b0MBNe5B35VMKRdCDD/4XyUua+NrvAC4179Sm8wBC5rtknnuSL0bCiGq0iow==@vger.kernel.org, AJvYcCXseu/lMuuqdhVjzq3hiw7RiauOAfGh9SY2Gpisb1eHFd9bgjtK9kc8mnFcaQ/Y16Hnk38qUYPSNe5zrjnV@vger.kernel.org
X-Gm-Message-State: AOJu0YzauZLS3bC+aMRznsYbLJVWKSWsoS9Be8ZLCxYjTA0YerxKfpol
	42CsSz9Of1uz/4dY9vdx6v2uegPb4+/R30aFP04xzoGp7TJItbLDAbILS6Ly
X-Gm-Gg: ASbGnctaJpL902k7dBcOo5oWfQq+ByU1ZuqanuvQqcEd+cnbPZ/A4xmZUa7F48xSS+d
	qHAfnYqdyBM3/fWeRhN10jquA2CCEIyKyiIoJvCmU2zqMp7NbGPfEfeImtfFDsrNyS6CDaCcTRV
	AMv0+HEg+XBfoPu7lDwEhCpGTEznF2eBqkS0wz3N/Kl/xozRF/gFW+2IljJXHWACN5Az8nofO9f
	dpVIGNvRaLf268VeP/bD8ak0KnpJ4vzvnP51tH+Lmh7I3ezaIytprM3+2rdN7nBtySye3VdMNtr
	FP/4OTpgJubEPg==
X-Google-Smtp-Source: AGHT+IFcVBEtaR0d1rORPN59hLUBll1Q7hCeTiAcY0KksSqCR73Vgc+KFYNc34TGE9A9R2AcEgn/qQ==
X-Received: by 2002:a05:6512:2826:b0:540:1e5e:3876 with SMTP id 2adb3069b0e04-54284817b78mr8419672e87.52.1736864487964;
        Tue, 14 Jan 2025 06:21:27 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6b0esm1696190e87.115.2025.01.14.06.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 06:21:26 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3043e84c687so42627171fa.1;
        Tue, 14 Jan 2025 06:21:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8MNe7gbO6Ai/s2O1ISVhV1XhKpmuMdccXtdJTW4ZPZySItYKTtgWK6cCcj5XpCSB1AH1fHPDpR2GYS9Ds@vger.kernel.org, AJvYcCVKoex2jugzRnmkhsxOWR5mTfpa2fu9lXao3pCmmFutA7gu/non7bt+WMxgajDVtNorHeIht0mhV8ob+A==@vger.kernel.org, AJvYcCX+vKPTjerZE8B2sKKKR8NpNXZt+jIDbqAIfKldjutO5vCk4gw9lgMurxamUzQrS9QJl/Y2ePhG161p@vger.kernel.org
X-Received: by 2002:a2e:a543:0:b0:302:4a4a:b6d1 with SMTP id
 38308e7fff4ca-305f45745c7mr78694601fa.14.1736864486493; Tue, 14 Jan 2025
 06:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-6-andre.przywara@arm.com> <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
 <20241120101228.26bbf100@donnerap.manchester.arm.com> <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
 <20250114112149.5448baae@donnerap.manchester.arm.com>
In-Reply-To: <20250114112149.5448baae@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 14 Jan 2025 22:21:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v67b4q3T31vLc8Q56KADtRUAcyHk13KUJ_aO1LqTCYSsMA@mail.gmail.com>
X-Gm-Features: AbW1kvYOX-F14DRBUu8Ms1IljUt4d39ndzmhL2m2-zk0YvABvyR_SSL_OJ1rqh0
Message-ID: <CAGb2v67b4q3T31vLc8Q56KADtRUAcyHk13KUJ_aO1LqTCYSsMA@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 7:21=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 14 Jan 2025 15:01:31 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi Chen-Yu,
>
> before I get to your specific question below: what do you think in
> general of the idea of getting rid of that table based approach we use so
> far? Is that something worthwhile? I definitely think yes, but wanted to
> hear the maintainers' opinion about this. Happy to present some arguments
> if need be.

Seems OK to me. The other platforms I've worked on don't have the tables.

OOTH, would we have headers alongside the dts files for macros that
give the function IDs a bit more meaning? I mean sure we can always
go back to the datasheets, it's just a bit of a hassle.

> ...
>
> > On Wed, Nov 20, 2024 at 6:12=E2=80=AFPM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > On Wed, 13 Nov 2024 16:50:19 +0800
> > > Chen-Yu Tsai <wens@csie.org> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > sorry for the late reply, I was away for a week.
> > >
> > > > On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przyw=
ara@arm.com> wrote:
> > > > >
> > > > > The A523 contains a pin controller similar to previous SoCs, alth=
ough
> > > > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > > > This introduces a new style of binding, where the pinmux values f=
or each
> > > > > pin group is stored in the new "allwinner,pinmux" property in the=
 DT
> > > > > node, instead of requiring every driver to store a mapping betwee=
n the
> > > > > function names and the required pinmux.
> > > > >
> > > > > Add the new name to the list of compatible strings, and required =
it to
> > > > > have 10 interrupts described. Also add the new pinmux property.
> > > > >
> > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > > ---
> > > > >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++=
++++--
> > > > >  1 file changed, 21 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,=
sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinne=
r,sun4i-a10-pinctrl.yaml
> > > > > index 4502405703145..6fc18e92e1e94 100644
> > > > > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a=
10-pinctrl.yaml
> > > > > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a=
10-pinctrl.yaml
> > > > > @@ -56,6 +56,8 @@ properties:
> > > > >        - allwinner,sun50i-h6-r-pinctrl
> > > > >        - allwinner,sun50i-h616-pinctrl
> > > > >        - allwinner,sun50i-h616-r-pinctrl
> > > > > +      - allwinner,sun55i-a523-pinctrl
> > > > > +      - allwinner,sun55i-a523-r-pinctrl
> > > > >        - allwinner,suniv-f1c100s-pinctrl
> > > > >        - nextthing,gr8-pinctrl
> > > > >
> > > > > @@ -64,7 +66,7 @@ properties:
> > > > >
> > > > >    interrupts:
> > > > >      minItems: 1
> > > > > -    maxItems: 8
> > > > > +    maxItems: 10
> > > > >      description:
> > > > >        One interrupt per external interrupt bank supported on the
> > > > >        controller, sorted by bank number ascending order.
> > > > > @@ -119,13 +121,17 @@ patternProperties:
> > > > >          $ref: /schemas/types.yaml#/definitions/uint32
> > > > >          enum: [10, 20, 30, 40]
> > > > >
> > > > > +      allwinner,pinmux:
> > > > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +        description: pinmux selector for each pin
> > > > > +
> > > >
> > > > Why not just the standard "pinmux" property, as given in
> > > > Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> > >
> > > I had it like this in my last post two years ago, but learned from
> > > LinusW [1] that the generic pinmux property has a slightly different
> > > meaning, and abusing it for just the pinmux index values would not ma=
tch
> > > the generic definition.
> > > We *could* use the generic definition, but then this would include wh=
at's
> > > in the "pins" property, like I sketched out in the cover letter, as a=
n
> > > alternative to this approach:
> > >         pinmux =3D <SUNXI_PIN(PB, 9, 2)>, <SUNXI_PIN(PB, 10, 2)>;
> > > Where the SUNXI_PIN macro would combine the pin number and the pinmux=
 into
> > > one 32-bit cell. See the Apple GPIO DT nodes for an example.
> > > This looks indeed nicer, but requires quite some rewrite of the exist=
ing
> > > pinctrl driver, AFAICS.
> >
> > Sorry for taking so long to get back to this.
> >
> > Could we maybe add a generic replacement of the existing "function"
> > property, which takes a string? Like "function-id" or "function-selecto=
r"
> > that takes u32 (or u8). Then it could be one or the other. Not sure
> > if the binding maintainers would accept this or not.
>
> Do you mean specifically a *generic* property, as opposed to something
> prefixed with a vendor string, and coded up in just the sunxi driver?
>
> Because otherwise "allwinner,pinmux" is that numeric equivalent to
> "function". I kept "function", as a string, because the GPIO framework
> still needs a string at places, for instance for sysfs. We could create
> those strings, based on the node name, by sprintf'ing something, but I
> figured we might as well keep "function".

That seems to be what other drivers are doing.

> In my U-Boot patches [1] I actually ignore the new pinmux property, and
> still use the function name, as it was easier to integrate into the
> existing code. U-Boot uses a very limited subset of our current table,
> so each new SoC doesn't add much to the code.
>
> [1] https://github.com/apritzel/u-boot/commit/ab4f7ed0879022357646
>
> Code-wise I think we would still need our own driver code, so whether we
> use "function-id" or "allwinner,pinmux" in there doesn't make much of a
> difference, I think.

I guess it simply affects whether the bindings and subsequent helper
code can be generalized or not.

> > I understand that we probably don't want the mux value combined with
> > the pin number.
>
> You mean like the Apple GPIO does? I wonder why not, actually? I find thi=
s
> actually quite clever and compact. Again the "pins" property atm is quite
> string-heavy, so the code has to translate this back into a bank and pin
> number, then lookup the function string in our table to get the pinmux
> value. We could fit all of this information easily into this new
> generic "pinmux" property, and the code just needs to mask and shift that
> number. Each pin occupies a cell, I don't think we can get much better
> than that?

Mostly because it prevents one from having pin config options without
muxing, for example set drive strength without setting the mux to GPIO,
the latter on sunxi is done exclusively using GPIO bindings.

I talked about this at my talk at ELCE last year, and afterwards was
talking to Heiko and Quentin, and it seems at least Rockchip can't
separate this. Rockchip goes even further with their "rockchip,pins"
property by also including a reference to the pin config node phandle.

I believe MediaTek, which uses "pinmux" as you described, can't either.

That's my main concern.

Also, the "pins" property can be integers. The question then becomes
how do you want to handle the numbering, i.e. what to do with the
holes in between the different banks.


ChenYu


> Cheers,
> Andre
>
> > ChenYu
> >
> > > [1] Previous reply from LinusW:
> > > https://lore.kernel.org/linux-sunxi/CACRpkdbMc-Q6wjgsiddu6-tWC1dt2uFk=
+4LyerMdgFk2KRGK4w@mail.gmail.com/
> > >
> > > >
> > > > >      required:
> > > > >        - pins
> > > > >        - function
> > > >
> > > > This section should be made to apply only to the existing
> > > > compatibles? Maybe we could just split the files and have
> > > > a clean slate for sun55i?
> > >
> > > Yeah, I couldn't find a good example how to make it *required* for on=
e
> > > compatible and *not allowed* for all the others. But creating a whole=
 new
> > > file is actually a good idea, as this also avoids adding another case=
 to
> > > the already quite indented if-else cascade.
> > >
> > > Cheers,
> > > Andre
> > >
> > > > ChenYu
> > > >
> > > > >      additionalProperties: false
> > > > >
> > > > > -  "^vcc-p[a-ilm]-supply$":
> > > > > +  "^vcc-p[a-klm]-supply$":
> > > > >      description:
> > > > >        Power supplies for pin banks.
> > > > >
> > > > > @@ -156,6 +162,17 @@ allOf:
> > > > >          - interrupts
> > > > >          - interrupt-controller
> > > > >
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          enum:
> > > > > +            - allwinner,sun55i-a523-pinctrl
> > > > > +
> > > > > +    then:
> > > > > +      properties:
> > > > > +        interrupts:
> > > > > +          minItems: 10
> > > > > +
> > > > >    - if:
> > > > >        properties:
> > > > >          compatible:
> > > > > @@ -166,6 +183,7 @@ allOf:
> > > > >        properties:
> > > > >          interrupts:
> > > > >            minItems: 8
> > > > > +          maxItems: 8
> > > > >
> > > > >    - if:
> > > > >        properties:
> > > > > @@ -244,6 +262,7 @@ allOf:
> > > > >              - allwinner,sun8i-v3s-pinctrl
> > > > >              - allwinner,sun9i-a80-r-pinctrl
> > > > >              - allwinner,sun50i-h6-r-pinctrl
> > > > > +            - allwinner,sun55i-a523-r-pinctrl
> > > > >
> > > > >      then:
> > > > >        properties:
> > > > > --
> > > > > 2.46.2
> > > > >
> > >
>
>

