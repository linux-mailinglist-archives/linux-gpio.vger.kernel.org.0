Return-Path: <linux-gpio+bounces-30515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E83D1D27B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 09:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB1E53014DBB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 08:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD5437F751;
	Wed, 14 Jan 2026 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhcD4IcY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F1437BE77
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379830; cv=none; b=XQ4mK1FdywmUgUGX6nzJv6MqL3JdMgD2puhyKXERB9yPHLAwK2gb87yOdeQQ926BjnRSksG83vQoKlsuy3PVgxX+sloW8N+xJ9KA0A+PGNPP4iG76YHkjMUdiCtOjKzStdWKGDC786B9sWsfyEpB8D3Z4FrV6CmuOYrekoZGfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379830; c=relaxed/simple;
	bh=RRIJRG5Pvsqy92X+cKBrGTIyYEPHbNu+BVuReetdu48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaAe7Cy1yqHdLOMqrJnDVqVRaim67A/GIxDfFTg7PeOSNZJBfGYw7UM6yuZipOsH0RtAmBy4spMCAetr/N+pTOD1SndqR+phOyT/Q+v5CWEg9sWsDa6nwFBPV2Cb9p6TAUuBVCT39KIxY7rvv+NuHiNuLPUdczdQeLFs0e+TqC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhcD4IcY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F8BC19425
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379828;
	bh=RRIJRG5Pvsqy92X+cKBrGTIyYEPHbNu+BVuReetdu48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qhcD4IcY3e3mEwVH63yGFMvRPNYJlcemRqqDTa7Qjt5DIQB3jOUu6QEbi3jJ9vput
	 vXuVWUogtTbOOWNiEZSks6Gb0o6al3AovQ2V3h7Armg2fk0vxCgJmhMlHtZhBE+zbV
	 InyXkwi6tPcoLmWs1aNNHgzRt8w4ri3yCOof44W0wk0FY16iSznPWRWm+XLQXmvera
	 e9byu7dwdHveT5R+5E5GStDJqLm86WPZsmbIInMDCB2aTElGGJEHLo33xJHTPj7KuA
	 MfS84uLgCdt+tyiy4OvZN0EZ7mVs2R4mNRYvOgO/aAywkaQy8RhXZxyjo2m3bmmhkj
	 gJbprwqPTgtXA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b7be7496dso6994053e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 00:37:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMmeIE/ww+Enhp62LRHqInP1PTpg6q0NfacJBc1g7S7IF6KekD2olRsZWhjazJYTJfdsegcn4lhDNy@vger.kernel.org
X-Gm-Message-State: AOJu0YzBRcGlr4J7SFIAaZGGyPaINtrX7hpp/5BuPrpd7N0+R5fP/KM9
	mO0RQVWEepFD+o+6TlkgYbKN8CVbJs8AC8JR7MwHhpbQ2GaoqyAgUgGqYIRdIjzKygHfHwicl4x
	gkC9FJ5BzUgh1N7twXU92ueuEDDaP4YZpNzd941yU0Q==
X-Received: by 2002:a05:6512:2213:b0:59b:78ad:fb9e with SMTP id
 2adb3069b0e04-59ba0f5df7dmr550456e87.10.1768379826948; Wed, 14 Jan 2026
 00:37:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113161152.3688309-1-shorne@gmail.com> <20260113161152.3688309-2-shorne@gmail.com>
 <CAMRc=MfLqoPvCiEtunvfidaRGAfZFbGM98y8vjj8R187ziUtdg@mail.gmail.com>
 <aWZzZWTjctHasCHh@antec> <20260114-agile-kangaroo-of-honor-963dc6@quoll>
In-Reply-To: <20260114-agile-kangaroo-of-honor-963dc6@quoll>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 14 Jan 2026 09:36:55 +0100
X-Gmail-Original-Message-ID: <CAMRc=Meicads1OAYM+bRN3B8P2Jt9=D=VNSL-KQytsUiBLaAbg@mail.gmail.com>
X-Gm-Features: AZwV_QicL-NMGKpWgpsji24MIWu6hu9pD8ISWG5CiwXSXP6Yg_kdXxH0cqrxqwI
Message-ID: <CAMRc=Meicads1OAYM+bRN3B8P2Jt9=D=VNSL-KQytsUiBLaAbg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: gpio-mmio: Add opencores GPIO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stafford Horne <shorne@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 9:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jan 13, 2026 at 04:31:33PM +0000, Stafford Horne wrote:
> > On Tue, Jan 13, 2026 at 05:20:28PM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Jan 13, 2026 at 5:15=E2=80=AFPM Stafford Horne <shorne@gmail.=
com> wrote:
> > > >
> > > > Add a device tree binding for the opencores GPIO controller.
> > > >
> > > > On FPGA Development boards with GPIOs the OpenRISC architecture use=
s the
> > > > opencores gpio verilog rtl which is compatible with the MMIO GPIO d=
river.
> > > >
> > > > Link: https://opencores.org/projects/gpio
> > > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > > > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Since v3:
> > > >  - Removed example.
> > > >  - Re-order this patch to be before adding compatible string to dri=
ver as per
> > > >    device tree binding patch rules.
> > > >  - Add Reviewed-by's.
> > > > Since v2:
> > > >  - Fixup (replace) patch to simply add opencores,gpio and add an ex=
ample.
> > > >    (It was incorrect to specifying opencores,gpio with brcm,bcm6345=
-gpio
> > > >     as opencores,gpio is not the same hardware, its 8-bit vs 32-bit=
)
> > > > Since v1:
> > > >  - Fix schema to actually match the example.
> > > >
> > > >  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml =
b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > > index ee5d5d25ae82..a8823ca65e78 100644
> > > > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > > @@ -23,6 +23,7 @@ properties:
> > > >        - ni,169445-nand-gpio
> > > >        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GP=
IO controller
> > > >        - intel,ixp4xx-expansion-bus-mmio-gpio
> > > > +      - opencores,gpio
> > > >
> > > >    big-endian: true
> > > >
> > > > --
> > > > 2.51.0
> > > >
> > >
> > > This is not a follow-up patch. Please rebase your fix on top of
> > > linux-next. I already have the previous patch in my tree and will not
> > > be rebasing the entire for-next branch.
> >
> > OK, understood, I wasn't aware you would not rebase. I will rework this=
 rebasing
> > on linux-next reberting my previous dt-binding: patch first.
>
> No, you need to rebase, not revert.
>

Just to be extra-clear: take current linux-next (next-20260114) and -
on top of it - create a patch that fixes the issues in an incremental
way. No reverts. Also: add the Fixes: tag to your commit before your
SoB.

Bartosz

