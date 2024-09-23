Return-Path: <linux-gpio+bounces-10390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBB983921
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 23:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442361F22640
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 21:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B5883CC7;
	Mon, 23 Sep 2024 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B69oEG9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311D176F1B;
	Mon, 23 Sep 2024 21:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727127251; cv=none; b=Ah7OTZGrFEUS7+3c4HgCgci6GiNLhVOK8NSUt4t8ZEQndYXMSE3/DSwz2TrOB6Zudyu2hNQcwHIC0x7UbxxgWVzkpQ56P4UFLUiYv7mFnGks4d6KiHmWYaEGZfw3YEDtPbWLKV7LxQc0uHrPXwyoaTS1Z8+QguB/ArZC9LdL8uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727127251; c=relaxed/simple;
	bh=vVPOUctwnyfB+YD2bNXn8oVlRQeRez4f3tU2z/4oPAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgwHHhcIkWplVc5/lZhB2b2+sXpFJ5BO6yxAmgoOKUl8Bu+a6X+d9N9cidN6k7H4mQ5LocMyuiu1zxdqPZp9CX67kxkWNKiRgAV43mLd867AVt9w5jWhZbZn1ttewkkF4tw+DNRL/u/JDlIV083KI+I3RRmqWSAuhfWMKoJJGz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B69oEG9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAE3C4CEC4;
	Mon, 23 Sep 2024 21:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727127250;
	bh=vVPOUctwnyfB+YD2bNXn8oVlRQeRez4f3tU2z/4oPAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B69oEG9iR2lkgbaavaQIF+rGFjkOhAxIFSb0gLR/US8dDlU1t8itdFNSvLN4acSWA
	 uezOSixDb4nZ2qizKSmVEHl/IMoat2cNQHh7Gzad5EwtM1/xgfzt10u8K2QbMaao0L
	 kczydm+8kjvJEHutG8lKOn3DIvS9fWlk2UEoUU3EcovPOOqtgKGXlb7VsALziJSGom
	 kFb4E1a8b57vx9oP9Drip8Qa6rwlMpEsVTB2p19364RtE40O0KsvlKLLI4Kw3YwICn
	 pKQENBXWRVORwjwV7gMn3fzyBKIqtVnqv6CpprlMDRlz0jb8oijEvymnwBBpLRuK/d
	 1CcAHKmZAjuFQ==
Date: Mon, 23 Sep 2024 22:34:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <20240923-rentable-okay-922af44b66c8@spud>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
 <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
 <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>
 <20240921-party-glass-bfb7099c7ded@spud>
 <e6u3kui5md4km5xvjzlq5cfgwvtb73c763uep4j5ysaokmmucr@gz5nxiebg7gu>
 <20240922-plug-legible-74f56d898123@spud>
 <3b51ff7b-ab9b-431c-a43a-49b5a5e74dff@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D4I/hfqMmYR9lhb8"
Content-Disposition: inline
In-Reply-To: <3b51ff7b-ab9b-431c-a43a-49b5a5e74dff@oss.nxp.com>


--D4I/hfqMmYR9lhb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 01:47:25PM +0300, Andrei Stefanescu wrote:
> Hi,
>=20
> On 23/09/2024 00:07, Conor Dooley wrote:
> > On Sun, Sep 22, 2024 at 11:04:22PM +0200, Krzysztof Kozlowski wrote:
> >> On Sat, Sep 21, 2024 at 10:58:46PM +0100, Conor Dooley wrote:
> >>> On Fri, Sep 20, 2024 at 03:40:31PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 20/09/2024 15:33, Andrei Stefanescu wrote:
> >=20
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    items:
> >>>>>>> +      - const: nxp,s32g2-siul2-gpio
> >>>>>>
> >>>>>> Commit message and binding description say s32g2 and s32g3, but th=
ere's
> >>>>>> only a compatible here for g2.
> >>>>>
> >>>>> Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3 S=
oCs. I plan
> >>>>> to reuse the same compatible when I add the SIUL2 GPIO device tree =
node for
> >>>>> the S32G3 boards. Would that be ok?
> >>>>
> >>>> There are only few exceptions where re-using compatible is allowed. =
Was
> >>>> S32G on them? Please consult existing practice/maintainers and past =
reviews.
>=20
> I will add another compatible: "nxp,s32g3-siul2-gpio" for the S32G3 SoC. =
We currently
> also have the SIUL2 pinctrl driver in upstream with only one compatible:
> "nxp,s32g2-siul2-pinctrl". Should I also send a separate patch to add an =
S32G3 compatible
> to it?
>=20

That would be great, thanks.

--D4I/hfqMmYR9lhb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvHezQAKCRB4tDGHoIJi
0pCmAQC1egpDgRJ3lx7CnNAI1DfohfH3FYOvN94njKldOAyNOgEAjqcWytfOQc+G
sRWY+YJMcy6ZEW7clxmqi0OwPbJBmws=
=R/oF
-----END PGP SIGNATURE-----

--D4I/hfqMmYR9lhb8--

