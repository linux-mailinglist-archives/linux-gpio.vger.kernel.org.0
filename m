Return-Path: <linux-gpio+bounces-14753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B36DFA1011D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 08:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B8CD1888028
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 07:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0189E243357;
	Tue, 14 Jan 2025 07:01:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152B225412;
	Tue, 14 Jan 2025 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736838111; cv=none; b=EQFm6H3x2MKt5j9D7aRmpw8Rn1hrRBEGgkDHRGbYhH6wRex2mz/kMnM0CAvzyLQo6SrPQSnhXCjVKwZUcuhTFhpTgca7B83gBxoK6vVXNyihS8KXaHt3EAC+aIgNHLdH0Qg44pwrKDcpstn6fFiV6NymMj+VltfzXE51QqsWPM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736838111; c=relaxed/simple;
	bh=WnVvCdAyY+XAqWXEr/1FXoer0pDasH5/wCqA5s1r6YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5USpvuCoMVQC73HBBtnd3foRjIzoO88JxgzmOFl/2dCHPRuSCFfBtGHIbEXbE7r/N28uCjF6ldOWaLqzt26aH18FiP+QsAyA06E89H+vH/jrVfTS4L8MOJxLVtdLi14fYWuPYp8q9dbufazTJQ8NDpaLcI6TBBFaxVxRSRE4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54263b52b5aso5173113e87.1;
        Mon, 13 Jan 2025 23:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736838106; x=1737442906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+UcOE3NbQ9slLhfP+gmnwjLdrB9FRRmf5lPYamPvI8=;
        b=JmpIdcfaRFwUyvxFk8NC2cQ5q2rabVd7jcLZmoPqQtGk8cSl7BQqkj8MsyKEZOg9h4
         alHuYXLEI+ho0xugwGa5peG1AnMEaQ/1UYfgl4g59w818A/u0L5fluJS/Wjgj7a2uePS
         xcdYubBjFE0U07Tpi7WeBZ1lZUjx4GsQkjBg6hpt8uHtUKMOgFd4lxxWdtLFrz8pj2w+
         W5RImlhbht5aj1pDRRv0qbRZOU64BIOQRCfj2CjeloGAFpBbTHgySBV01IyDMQvjrHya
         DyDrpKUqHRQv0bXnHHPYVrHmG5lTL+EYDNh6lEc+MxqyTD7bzhudkcln+Iq1jAPJHFa4
         eLuw==
X-Forwarded-Encrypted: i=1; AJvYcCUW9WMMBd7VUAc9uUVHh8OwjM5Sq2Q0LkNsvnUiP2sHJuOY8dbzfXHFfpb9V4ezsKRd7ZG/X6AtGdnV@vger.kernel.org, AJvYcCUoNjnWqKgR1mK5qbVed3nxs/QvXy9e4lihteCGHmXcXeIAvELTy6hhwkuX0gR5nacKy2KcN6MS5RprNg==@vger.kernel.org, AJvYcCVVA+D45q1phrE/L15gyw0gBfJlWjooUXSkmgs6DsPj3H22J1SUCPpzEJdnB9nn/ukBSwpQublh2C0OycAf@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmPHpK8dfcmey5w90ELRZPRAwLty+qPB12xdOrHl1EPiIUQpp
	9BNb+5tIoQ+FXc/6eIVFfIl9k94oJTf9SQdqoSqdafKCV+FZ6wGHx4gn6uuuHKg=
X-Gm-Gg: ASbGncs32Ld9mXYyD4CoH5FnFjfwHzlXdvjZTl+TadpIUFI8q+6ypmnyZpQHWYR4Ei9
	YNc3nH0ZxeswXU8eS1BkIj0oOqai77a8lQdm8La2+4a+55NlWfEE+AtRTNv+ur6dj3/PdndbeEl
	fLOBfSP2U8CWY+2z4H/ipTvfde7I8ztY5MSQAivjEBcAy5Q+thTOk3W3OPReRrTPSnXmG6yQJIs
	1xeV46hGBykURAkEFWqd18iHW0Ef+p69Vcf3MLDVup6JTn7RcAmA/URb/qduC+Iw7FBW16GE6HF
	ViZLvgH1837+Wg==
X-Google-Smtp-Source: AGHT+IHIhxQPecldzeEp48EX8e6ouRDa3O/OYQajCoMKSWJuiy213HLUFFYupxhzJlgNAHEfKIfHTA==
X-Received: by 2002:a05:6512:a8e:b0:542:2990:722e with SMTP id 2adb3069b0e04-542845ba7b6mr7706975e87.15.1736838105316;
        Mon, 13 Jan 2025 23:01:45 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec20absm1606138e87.210.2025.01.13.23.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 23:01:45 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3043e84c687so39367171fa.1;
        Mon, 13 Jan 2025 23:01:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGuxIIflZlcbKqw7kHsoeLZZr9a3vJx0O2U4+nLH5M4oKoBqmgv7QShXj6Kco5Bn5aZ3+Atkw2Z7q8aGCq@vger.kernel.org, AJvYcCW8dg+wOVJpAxySimaatAt3CHcsTrjBr4i0WqK5CAds/evZ0cm8EikNWBpd0zCVagFzoJKZBbAgOt82@vger.kernel.org, AJvYcCXPvnmRrnOnhirMeBNLIYKmOdZF6Ei2sphoLOMBDz7x6ikbFmHp4Xr+cTIugvPxqJvZUp4Y0qUmAYBjCA==@vger.kernel.org
X-Received: by 2002:a05:651c:501:b0:2ff:e6fb:b10 with SMTP id
 38308e7fff4ca-305f45db1a9mr82180361fa.26.1736838104539; Mon, 13 Jan 2025
 23:01:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-6-andre.przywara@arm.com> <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
 <20241120101228.26bbf100@donnerap.manchester.arm.com>
In-Reply-To: <20241120101228.26bbf100@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 14 Jan 2025 15:01:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
X-Gm-Features: AbW1kvY5ioH0ofguoIZCmg867-6-rz1ALLpjN9guXZRF83auvJZgI7_L4pl8dSY
Message-ID: <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
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

On Wed, Nov 20, 2024 at 6:12=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Wed, 13 Nov 2024 16:50:19 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi Chen-Yu,
>
> sorry for the late reply, I was away for a week.
>
> > On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > The A523 contains a pin controller similar to previous SoCs, although
> > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > This introduces a new style of binding, where the pinmux values for e=
ach
> > > pin group is stored in the new "allwinner,pinmux" property in the DT
> > > node, instead of requiring every driver to store a mapping between th=
e
> > > function names and the required pinmux.
> > >
> > > Add the new name to the list of compatible strings, and required it t=
o
> > > have 10 interrupts described. Also add the new pinmux property.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++=
--
> > >  1 file changed, 21 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,su=
n4i-a10-pinctrl.yaml
> > > index 4502405703145..6fc18e92e1e94 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-p=
inctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-p=
inctrl.yaml
> > > @@ -56,6 +56,8 @@ properties:
> > >        - allwinner,sun50i-h6-r-pinctrl
> > >        - allwinner,sun50i-h616-pinctrl
> > >        - allwinner,sun50i-h616-r-pinctrl
> > > +      - allwinner,sun55i-a523-pinctrl
> > > +      - allwinner,sun55i-a523-r-pinctrl
> > >        - allwinner,suniv-f1c100s-pinctrl
> > >        - nextthing,gr8-pinctrl
> > >
> > > @@ -64,7 +66,7 @@ properties:
> > >
> > >    interrupts:
> > >      minItems: 1
> > > -    maxItems: 8
> > > +    maxItems: 10
> > >      description:
> > >        One interrupt per external interrupt bank supported on the
> > >        controller, sorted by bank number ascending order.
> > > @@ -119,13 +121,17 @@ patternProperties:
> > >          $ref: /schemas/types.yaml#/definitions/uint32
> > >          enum: [10, 20, 30, 40]
> > >
> > > +      allwinner,pinmux:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: pinmux selector for each pin
> > > +
> >
> > Why not just the standard "pinmux" property, as given in
> > Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
>
> I had it like this in my last post two years ago, but learned from
> LinusW [1] that the generic pinmux property has a slightly different
> meaning, and abusing it for just the pinmux index values would not match
> the generic definition.
> We *could* use the generic definition, but then this would include what's
> in the "pins" property, like I sketched out in the cover letter, as an
> alternative to this approach:
>         pinmux =3D <SUNXI_PIN(PB, 9, 2)>, <SUNXI_PIN(PB, 10, 2)>;
> Where the SUNXI_PIN macro would combine the pin number and the pinmux int=
o
> one 32-bit cell. See the Apple GPIO DT nodes for an example.
> This looks indeed nicer, but requires quite some rewrite of the existing
> pinctrl driver, AFAICS.

Sorry for taking so long to get back to this.

Could we maybe add a generic replacement of the existing "function"
property, which takes a string? Like "function-id" or "function-selector"
that takes u32 (or u8). Then it could be one or the other. Not sure
if the binding maintainers would accept this or not.

I understand that we probably don't want the mux value combined with
the pin number.

ChenYu

> [1] Previous reply from LinusW:
> https://lore.kernel.org/linux-sunxi/CACRpkdbMc-Q6wjgsiddu6-tWC1dt2uFk+4Ly=
erMdgFk2KRGK4w@mail.gmail.com/
>
> >
> > >      required:
> > >        - pins
> > >        - function
> >
> > This section should be made to apply only to the existing
> > compatibles? Maybe we could just split the files and have
> > a clean slate for sun55i?
>
> Yeah, I couldn't find a good example how to make it *required* for one
> compatible and *not allowed* for all the others. But creating a whole new
> file is actually a good idea, as this also avoids adding another case to
> the already quite indented if-else cascade.
>
> Cheers,
> Andre
>
> > ChenYu
> >
> > >      additionalProperties: false
> > >
> > > -  "^vcc-p[a-ilm]-supply$":
> > > +  "^vcc-p[a-klm]-supply$":
> > >      description:
> > >        Power supplies for pin banks.
> > >
> > > @@ -156,6 +162,17 @@ allOf:
> > >          - interrupts
> > >          - interrupt-controller
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          enum:
> > > +            - allwinner,sun55i-a523-pinctrl
> > > +
> > > +    then:
> > > +      properties:
> > > +        interrupts:
> > > +          minItems: 10
> > > +
> > >    - if:
> > >        properties:
> > >          compatible:
> > > @@ -166,6 +183,7 @@ allOf:
> > >        properties:
> > >          interrupts:
> > >            minItems: 8
> > > +          maxItems: 8
> > >
> > >    - if:
> > >        properties:
> > > @@ -244,6 +262,7 @@ allOf:
> > >              - allwinner,sun8i-v3s-pinctrl
> > >              - allwinner,sun9i-a80-r-pinctrl
> > >              - allwinner,sun50i-h6-r-pinctrl
> > > +            - allwinner,sun55i-a523-r-pinctrl
> > >
> > >      then:
> > >        properties:
> > > --
> > > 2.46.2
> > >
>

