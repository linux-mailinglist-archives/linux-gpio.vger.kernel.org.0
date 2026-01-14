Return-Path: <linux-gpio+bounces-30514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AD0D1D1F4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 09:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29546300B92A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 08:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F165037F105;
	Wed, 14 Jan 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ee+sV9zb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE89925783C;
	Wed, 14 Jan 2026 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379504; cv=none; b=m1yd1MyzRvNWwF908w3kWv7fwJoqrxVbrt6FnORhcONqBffX4LcsXGIAP7VIA6VCQTYyjgwKpAcD7n68VRGLdqAC14AUIsxSjdmLaaN9aPkfg96c46lXBGrL8nksWHxecfhCIz0gXwtCl3//fMaRyBfeY1+XEBp9TZv7wKEoGdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379504; c=relaxed/simple;
	bh=U+JLtEWNFWd8pdq6Y1+Ny0DYt8hQf922ub5HxMyZakA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/MD6ByGX3kHAq0wLSkbemFIoLJJQ1g3lvby8594JhPWRX0TOj5RvdExgR0Os/PWW4rb04ARPHHQy9MbbRYy7G8EFdgA6zxjjRyKQyh1OyWYy8ouWhfiqBnYaxbNce003/B6eGhSCy7vXs2mmn1Xe2pou2s8p4yZCjvuwExKfCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ee+sV9zb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE85C4CEF7;
	Wed, 14 Jan 2026 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379504;
	bh=U+JLtEWNFWd8pdq6Y1+Ny0DYt8hQf922ub5HxMyZakA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ee+sV9zbFQVx7b5qrRagWIF3vaxGYdXIA2HECvDSRUcgnES6RHpliguLs8qUnMYKV
	 bkZj4vKriMrLpMPpmzmXo8XUgIZqS2CgIyViRL5KMvHDFlnLeNwchtHCzZX1xghmEp
	 Z6/byQlqrFOPoVrFX/Yo9/VCC2L2qNWEcNpfgUI0FXGSvhkV3ObSmG4aIknnpzA530
	 rBZfp2MD5dDogU1cBQBxJkt+GNuzXWfsANVJ3G073Kq6/20FVY+C5QAyAuEH3Bm9Ma
	 /aIrtWV/hotWHOpTDkr+l3W89Y2PTRDl1AJTonZ7yPv4xCnNgWE2Fut8zWRNrL5osW
	 Kez3BVK/8fD9Q==
Date: Wed, 14 Jan 2026 09:31:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Linux OpenRISC <linux-openrisc@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: gpio-mmio: Add opencores GPIO
Message-ID: <20260114-agile-kangaroo-of-honor-963dc6@quoll>
References: <20260113161152.3688309-1-shorne@gmail.com>
 <20260113161152.3688309-2-shorne@gmail.com>
 <CAMRc=MfLqoPvCiEtunvfidaRGAfZFbGM98y8vjj8R187ziUtdg@mail.gmail.com>
 <aWZzZWTjctHasCHh@antec>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aWZzZWTjctHasCHh@antec>

On Tue, Jan 13, 2026 at 04:31:33PM +0000, Stafford Horne wrote:
> On Tue, Jan 13, 2026 at 05:20:28PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Jan 13, 2026 at 5:15=E2=80=AFPM Stafford Horne <shorne@gmail.co=
m> wrote:
> > >
> > > Add a device tree binding for the opencores GPIO controller.
> > >
> > > On FPGA Development boards with GPIOs the OpenRISC architecture uses =
the
> > > opencores gpio verilog rtl which is compatible with the MMIO GPIO dri=
ver.
> > >
> > > Link: https://opencores.org/projects/gpio
> > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Since v3:
> > >  - Removed example.
> > >  - Re-order this patch to be before adding compatible string to drive=
r as per
> > >    device tree binding patch rules.
> > >  - Add Reviewed-by's.
> > > Since v2:
> > >  - Fixup (replace) patch to simply add opencores,gpio and add an exam=
ple.
> > >    (It was incorrect to specifying opencores,gpio with brcm,bcm6345-g=
pio
> > >     as opencores,gpio is not the same hardware, its 8-bit vs 32-bit)
> > > Since v1:
> > >  - Fix schema to actually match the example.
> > >
> > >  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/=
Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > index ee5d5d25ae82..a8823ca65e78 100644
> > > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > > @@ -23,6 +23,7 @@ properties:
> > >        - ni,169445-nand-gpio
> > >        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO=
 controller
> > >        - intel,ixp4xx-expansion-bus-mmio-gpio
> > > +      - opencores,gpio
> > >
> > >    big-endian: true
> > >
> > > --
> > > 2.51.0
> > >
> >=20
> > This is not a follow-up patch. Please rebase your fix on top of
> > linux-next. I already have the previous patch in my tree and will not
> > be rebasing the entire for-next branch.
>=20
> OK, understood, I wasn't aware you would not rebase. I will rework this r=
ebasing
> on linux-next reberting my previous dt-binding: patch first.

No, you need to rebase, not revert.

Best regards,
Krzysztof


