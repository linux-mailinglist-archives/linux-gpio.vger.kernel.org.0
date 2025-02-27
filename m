Return-Path: <linux-gpio+bounces-16705-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FE7A47E2B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA016164031
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8445422D4E4;
	Thu, 27 Feb 2025 12:46:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E22EB11;
	Thu, 27 Feb 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740660415; cv=none; b=mnga0R0zGK4ZDjdjoyg37hYBFZWZkteQpWP57pNbz3a4iSvKC2Dq21TpV71BnhOyx1OVdlP3XfQ0/tKq5ogZq2TPMKED8tIh6AayqR+hO7+RDj74LVL3asP+Mv1DrWJjsoimHihl2vWtXs1G4M08PZ9qwU6qqrqCyreJOxlI8eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740660415; c=relaxed/simple;
	bh=U7PCzUZnVYRvejULBSq6O8X9s2whc0HDjN7qBWSOoYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJR65yDJ1DalgxdSeAvNQtGI2X5SOOlKnzqHa37ShjGyXeqe4inRPTSXHIVIYEg7xuufkMaifZbPXJbTUICekhZDcUAVUn+t8RAN/XDy3sYS1z7/nZsNSO3j886m7ReWHwZvTJHPtzdulfzcdiL6uMmvfmpVXCHyQaGTQhBzuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso10860791fa.2;
        Thu, 27 Feb 2025 04:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740660411; x=1741265211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTt5QbyADMJ+0WvsKLYId9FZQBGxvlR5X8sImHZOIM4=;
        b=B/ceRzhz6Ickyx7fg4XKjE4TnJ2LhcXE28GHNpGaNhRohHA+nlxOffkzeNo+g46XEW
         cgI6CCq7omYr4zj+vaheadxbiytn6arWTIEs4Gw2bGuZPQukQb9oCAuwbMddlOdgLR9J
         U7uZl8BRQDO7bR3CL6NBWz1MXM9n2Q55C1Dv0exnKhfw8eI/9CTy8fkp8Qh1kjF6PTuj
         CwT7j9mCQcKaeI7pDjF84k6859VHBNpoCsNR9BZBIP1KnCTq+Fa1wbqsGNk7O3UBPyau
         a7iliZhM3mXyMen98ZZavxy1TptfTbJoToNzpFekyvDCfWTXm95GOk8B5qZRN+Sp4v0o
         wJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZUMOWfW0X2mtdAeKulkTF22SypV+vg2iAVhkzets8bJfUoVCvt6DLoH5e6P9AsxQ3veqIXKaorW7s4w==@vger.kernel.org, AJvYcCWA54vcKmBKdvWeGBpuU2CIKp8jvMgOOiXN54Wtvr0mLXeIeBOl9aMdMaIM8c/IumehyCx6+E60ogpr@vger.kernel.org, AJvYcCX1Hi5mYBXhgCgxER8u8AyfdczF3EiEx7Hbfi6vzRy+yxHQfCCYaYHerPb3Cs2xPyNivD0MOB8/mKR/R+8L@vger.kernel.org
X-Gm-Message-State: AOJu0YzVoYcpMGyfDepJuiM+7vM8TMR37gveFg9tYCm+1LJ6kCZCwQN2
	JiIxeAUnwfluc/2OQCXcYYf5RPX/hHVcENH5ydVOJ5n+QS0k9FZwn/tugWqX
X-Gm-Gg: ASbGncs5LDroJONOovx3rTRrBmkI5HpDP0plr6+3ToLADl/pT538i9qxjQAJT0n8GW5
	Faq5hHvfCbxZS8fbj3IgzeSxclluQI0VZFhlF2nam78y6Jnlgb7+GAPDqBoEuX0863HTfxsOpno
	bgCWl2J3YE1SgqXRS6lQrx1aQFspyqOnVjKMJ9MnnhNXPKZ17maFAAOjugWm3/ENlC5La1Bt7U8
	6xP3lRg6eMqtuubDoButHfRCfozRAMnjPZXDfB1ObHWq4ujN5UUXLuA6umJCRVTMqTQJKAN7xpk
	WlaueMjsx0qh0i2HdwpnAqNZorac2H/WmIH5ZLZWFqAzRAedz/WfnCfK6uc=
X-Google-Smtp-Source: AGHT+IH/TbUuTK566vWhxF15bp6nFz2gE52GHN85DStmE4iVQlV87kNNgIsyqNczRtMJsnsCMh84OA==
X-Received: by 2002:a2e:b386:0:b0:308:e803:1175 with SMTP id 38308e7fff4ca-30a59777b35mr103031201fa.0.1740660410378;
        Thu, 27 Feb 2025 04:46:50 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867a74c4sm1570121fa.19.2025.02.27.04.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 04:46:49 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso10860391fa.2;
        Thu, 27 Feb 2025 04:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZKG1YK37945gsD7pbKKTsfWiE6BEOvKKcwOtPyoq1vDqzBSJdQjBA6bvN3gYYZEhOOvpyGuVnou857g==@vger.kernel.org, AJvYcCWwhdsbRT2LwbcNTmzhjowap4WE8qvZnN2jE5wzewtaWn5yS1M9qTaiVgEBJqKYUK2wxa5oTuK46RAY@vger.kernel.org, AJvYcCXL3lqjoqmXnj1NqmYN9LwAlu1sfsE2s3zr+nWQmUvOs4AMzL+X2cT75cIGSYOFY1F9BWn4SnoutL98xQX5@vger.kernel.org
X-Received: by 2002:a2e:8743:0:b0:308:eb34:1037 with SMTP id
 38308e7fff4ca-30a599702f2mr99762991fa.23.1740660409212; Thu, 27 Feb 2025
 04:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-7-andre.przywara@arm.com> <173949598874.895319.6861900349653451498.robh@kernel.org>
 <20250227114611.67a1ba00@donnerap.manchester.arm.com>
In-Reply-To: <20250227114611.67a1ba00@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 27 Feb 2025 20:46:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v66eOuT+0n71OEPUky_rLd37_msT4b1+QC+8Nyhwtqarng@mail.gmail.com>
X-Gm-Features: AQ5f1Jrl692zM4GeD3auZTYmCOG5P6JcCZDXCDM_tdSURnSO6l5VyT64A9SuHe4
Message-ID: <CAGb2v66eOuT+0n71OEPUky_rLd37_msT4b1+QC+8Nyhwtqarng@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 7:46=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 13 Feb 2025 19:19:48 -0600
> "Rob Herring (Arm)" <robh@kernel.org> wrote:
>
> Hi Rob,
>
> > On Fri, 14 Feb 2025 00:37:32 +0000, Andre Przywara wrote:
> > > The A523 contains a pin controller similar to previous SoCs, although
> > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > With this SoC we introduce a new style of binding, where the pinmux v=
alues
> > > for each pin group are stored in the new "allwinner,pinmux" property =
in
> > > the DT node, instead of requiring every driver to store a mapping bet=
ween
> > > the function names and the required pinmux.
> > >
> > > Add a new binding file, since all the different variants of the old
> > > binding are making the file a bit unwieldy to handle already, and the=
 new
> > > property would make the situation worse.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../allwinner,sun55i-a523-pinctrl.yaml        | 177 ++++++++++++++++=
++
> > >  1 file changed, 177 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinn=
er,sun55i-a523-pinctrl.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl=
.example.dts:24:18: fatal error: dt-bindings/clock/sun55i-a523-r-ccu.h: No =
such file or directory
> >    24 |         #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Ah yeah, of course, that's in another series. What's the best approach
> here? I could cheekily import an existing header file, the symbol names i=
n
> there are often the same (ccu-sun20i-d1-r.h defines the same symbol, even
> with the same number).
> Or I just replace it below with the number "1"?

This, or just drop in a random number.

ChenYu

> Or let git format-patch append the patch-id of the clock binding header
> patch?
>
> Cheers,
> Andre
>
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindi=
ngs/pinctrl/allwinner,sun55i-a523-pinctrl.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_b=
inding_check] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2025=
0214003734.14944-7-andre.przywara@arm.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checkin=
g
> > your schema. However, it must be unset to test all examples with your s=
chema.
> >
>
>

