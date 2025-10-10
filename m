Return-Path: <linux-gpio+bounces-26987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112FBCEABC
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 00:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F5413B5260
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 22:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B660C271468;
	Fri, 10 Oct 2025 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXFvQZDf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7198E270EBC
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760133923; cv=none; b=PFLpRTgIR/q97QER6eluo4DRteJOlbAt5ntKSJkh/dICt8d7N82AEzzxvIT1o/eKrtCNNCO+asgEX6eeX3koiqYy6FlVgXFFO+NULnenxJPDF8N83LqpvmZUhiSabL+gK7F4IxwiXRn1M4HXM8vOov5abB8sSYw0+7bw6l0wX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760133923; c=relaxed/simple;
	bh=ULkcu+ErWUDnM+0yG/yzCIlYRGPz4NooEguavSIe4VI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk/4Zse/CTa1XTMYDGlABdjNFyAllWqaf7wUcTAE50EDN5a+DVuGUFsocqGXKloGDvEvX9vdrIv+wagEohchpvsaqelgi/Zz2vbczncyCn/pZTQ8rjZL0IKqVcEfuzFFibBBvnct8R/mwtQ4hgxvcSJWO7ntNMITSrC+K4617XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXFvQZDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3025C4CEF1
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 22:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760133923;
	bh=ULkcu+ErWUDnM+0yG/yzCIlYRGPz4NooEguavSIe4VI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cXFvQZDfKZKuMOWPXWwo5sAbHsXRngQx4XelvT4OStXTta54VjWlGwArne+mKJRWq
	 swRkt8p0BVB3LdauXXYmtKD9XT7T1IAeqGirAJkiLqJm3vol5B0T04D7oxu7T+6z4C
	 RLWJVNTVmQXEnIkFeRNIDm/dI1VQi58YEtpHJPkBJ0vGNuCxjTLKOPVmiJObgaRawq
	 Qqj4RtheXUoL9kgI93wg37Ng3a5HMBiuPO8VDFxOrHGGoUD5MZ+UXsb2MmS2eRPJ3N
	 cBlmnh9ibZ9x97xWPvvw8IYQtRr5Tn4/63J9nAOxhB6nHGMhQL2hLOLXTugJ8pdLov
	 Zsawn9t7yJWwg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3d80891c6cso543702366b.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 15:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvNjNAt44w/EB6QV3On2C7lnvzqVPQc9HZItjUOOPRrUJJHUrjuG2iUnlIVoNoKoqXfFaFiJrYfALm@vger.kernel.org
X-Gm-Message-State: AOJu0YyB8cT0YbO0pDE35BYyDIdgKSClW3hFyi7gNCOq5aPYpN9nW8Wz
	8WUYOq+n3/Bz0yJVy553ycPQRWL6a932bD+C1dgoyOgzZAuwiLkFu5QmBxDdZeoGq4DNHRVLLq5
	2uXUHao8aLMJFiQmq5bVuh3P3MqFohw==
X-Google-Smtp-Source: AGHT+IFuxZcfGuyDGnYvmRipLMVeDwsutLoA5afsi1To0UHAb/F8Wkp4QQcADLcPiJYb4k/lngw3miLIFLMhQgfvXPY=
X-Received: by 2002:a17:907:7213:b0:b38:49a6:583a with SMTP id
 a640c23a62f3a-b50bf2bcc2amr1295183566b.23.1760133920590; Fri, 10 Oct 2025
 15:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811163749.47028-2-ziyao@disroot.org> <20250811163749.47028-3-ziyao@disroot.org>
 <20250818175827.GA1507697-robh@kernel.org> <aKRh8M0szWKfpPF9@pie>
In-Reply-To: <aKRh8M0szWKfpPF9@pie>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 17:05:09 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+8U75kYFADTNnMONxrLy9H7YHukXNdtPpp20yG-HEyng@mail.gmail.com>
X-Gm-Features: AS18NWBAJg1X1PNJxas_Z_phPDWL6QAMLHfZflRShgSUFengE_WoLreRmG5ombg
Message-ID: <CAL_Jsq+8U75kYFADTNnMONxrLy9H7YHukXNdtPpp20yG-HEyng@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-binding: pinctrl: Document Loongson 2K0300 pin controller
To: Yao Zi <ziyao@disroot.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 6:37=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> On Mon, Aug 18, 2025 at 12:58:27PM -0500, Rob Herring wrote:
> > On Mon, Aug 11, 2025 at 04:37:48PM +0000, Yao Zi wrote:
> > > The pincontroller integarted in Loongson 2K0300 is able to configure
> > > function multiplexing for all the pins. It could also configure drive
> > > strength on basis of functions, which means all pins set to the same
> > > function share drive-strength setting. Drive-strength configuration
> > > isn't available for all functions, either.
> > >
> > > This binding utilizes two levels of subnodes, where the outer represe=
nts
> > > function and the inner represents groups. Drive-strength is allowed i=
n
> > > the outer since it's shared among all groups configured to the functi=
on.
> > >
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  .../pinctrl/loongson,ls2k0300-pinctrl.yaml    | 92 +++++++++++++++++=
++
> > >  MAINTAINERS                                   |  6 ++
> > >  2 files changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/loongso=
n,ls2k0300-pinctrl.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0=
300-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0=
300-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..cbd74cb45342
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/loongson,ls2k0300-pin=
ctrl.yaml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/loongson,ls2k0300-pinctrl=
.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson-2K0300 SoC Pinctrl Controller
> > > +
> > > +maintainers:
> > > +  - Yao Zi <ziyao@disroot.org>
> > > +
> > > +allOf:
> > > +  - $ref: pinctrl.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: loongson,ls2k0300-pinctrl
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: Pin function-multiplexing configuration registe=
rs
> > > +      - description: Pin drive-strength configuration registers
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: mux
> > > +      - const: drive
> > > +
> > > +patternProperties:
> > > +  '^func-':
> > > +    type: object
> > > +
> > > +    $ref: pincfg-node.yaml#
> > > +
> > > +    properties:
> > > +      drive-strength:
> > > +        description:
> > > +          Maximum sink or source current as defined in pincfg-node.y=
aml. Note
> > > +          that drive strength could only be configured on function b=
asis, i.e.,
> > > +          all pins multiplexed to the same function share the same
> > > +          configuration.
> > > +
> > > +          This could only be configured for several functions, inclu=
ding jtag,
> > > +          dvo, uart, gmac, sdio, spi, i2s, timer, usb and emmc.
> > > +        enum: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
> >
> > How do you know what pin this drive strength corresponds to without any
> > other properties? Node names generally aren't important, so you
> > shouldn't be using that.
>
> Thanks for the hint... yes I'm matching the node name to identify
> functions in this revision of driver. Could I introduce a "function"
> property to the outer node for identification of the function?

Yes, that should be defined somewhere.

> > > +
> > > +    additionalProperties: false
> > > +
> > > +    patternProperties:
> > > +      '-pins$':
> > > +        type: object
> > > +        $ref: pinmux-node.yaml#
> >
> > Generally the pin config and muxing are in 1 node if you can control
> > both.
>
> On 2K0300, drive-strength could only be configured for each function,
> not each pin, i.e. all pins configured to the same function share the
> same drive-strength configuration.
>
> Putting the driver-strength property in the outer node describes the
> situation: a property in the outer node is function-specific and shared
> between all groups (represented by inner nodes) configured to this
> function.
>
> Do you think it's better to move pin config (the driver-strength
> property) to the inner node in this case? If so, should the new
> "function" property for identifying functions reliably be in the inner
> node or the outer node? Thanks for your explanation,

I don't know. I'll defer to Linus on this one who is more familiar
with the variations of h/w out there.

Rob

