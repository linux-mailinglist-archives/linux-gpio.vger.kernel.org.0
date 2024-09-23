Return-Path: <linux-gpio+bounces-10391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E25983924
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 23:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534DF2820F0
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 21:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DFD83CC7;
	Mon, 23 Sep 2024 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3fCKQe5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C684A39;
	Mon, 23 Sep 2024 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727127328; cv=none; b=mbV4vUYy2Ym4TkrT/FGKnkNXjUxxRdmO0JP8UvwKBS6hSdbcGL+H7zpAoe+ybHjDe7aJvkMoRQTE5I7/ac4xaACttEr9zjYNiJHJREKM66PtxmrNi/Myn7jtMqfOCooIVrIB1AGWF8sDb3DIEzB1mCUGNCs5xzo74vrKC3oQT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727127328; c=relaxed/simple;
	bh=WFTUDl44zGhYUZJMB+uystwayMKCAqI/vQQ2xHtr7dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6tD7r5dtpxV4NuU0Vry4BZAIZbAoF8pBV7hOqBySvoZlDrPFmt8j3fXvKQZrEjEw8LCat1adyqpKtij1bPVknsrvNB9jjHz794aQh8X8yqq4CqLmApCucOxrfPotiO8BH9N6lNoQFhUKTF1cRaotkws71kIHKuQ4v2TwVri/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3fCKQe5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26033C4CEC4;
	Mon, 23 Sep 2024 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727127328;
	bh=WFTUDl44zGhYUZJMB+uystwayMKCAqI/vQQ2xHtr7dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3fCKQe5Y7yhiKcP5KgmAEIMhqvz3/fJS1G0HFowOyMdCIuyuZvNyqU+eEwY24FBv
	 S03kHhxSzSlfYA7NEzi5MUNimnl9XrCFpvGumT9iSf9Iqx0qa1XUKG+5BxNklQeD/J
	 7WVhwR3k+bsSEAvr1CmWKzY1r735KyoVuHBFhUHbXg39GdrjA1JnKUDPvPbuh/loVB
	 pJNNiM6oYmB2IBEU70ZkH5TzyE1zhfgsP6ITOWgFGQAZUE2rsdUv7Wy2iHULhKH8Lm
	 U6Oi/oZMkW6sViQSG61wRukMR/OkY928NoD9bhTqX6zA5Rrxk3iaASAWOm2bifxryp
	 qFB0FyEZ3CXgg==
Date: Mon, 23 Sep 2024 22:35:23 +0100
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
Message-ID: <20240923-clatter-barometer-102125af2de3@spud>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
 <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
 <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>
 <20240921-party-glass-bfb7099c7ded@spud>
 <e6u3kui5md4km5xvjzlq5cfgwvtb73c763uep4j5ysaokmmucr@gz5nxiebg7gu>
 <20240922-plug-legible-74f56d898123@spud>
 <3b51ff7b-ab9b-431c-a43a-49b5a5e74dff@oss.nxp.com>
 <20240923-rentable-okay-922af44b66c8@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CEFQZhZu0M/q00MG"
Content-Disposition: inline
In-Reply-To: <20240923-rentable-okay-922af44b66c8@spud>


--CEFQZhZu0M/q00MG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 10:34:05PM +0100, Conor Dooley wrote:
> On Mon, Sep 23, 2024 at 01:47:25PM +0300, Andrei Stefanescu wrote:
> > Hi,
> >=20
> > On 23/09/2024 00:07, Conor Dooley wrote:
> > > On Sun, Sep 22, 2024 at 11:04:22PM +0200, Krzysztof Kozlowski wrote:
> > >> On Sat, Sep 21, 2024 at 10:58:46PM +0100, Conor Dooley wrote:
> > >>> On Fri, Sep 20, 2024 at 03:40:31PM +0200, Krzysztof Kozlowski wrote:
> > >>>> On 20/09/2024 15:33, Andrei Stefanescu wrote:
> > >=20
> > >>>>>>> +properties:
> > >>>>>>> +  compatible:
> > >>>>>>> +    items:
> > >>>>>>> +      - const: nxp,s32g2-siul2-gpio
> > >>>>>>
> > >>>>>> Commit message and binding description say s32g2 and s32g3, but =
there's
> > >>>>>> only a compatible here for g2.
> > >>>>>
> > >>>>> Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3=
 SoCs. I plan
> > >>>>> to reuse the same compatible when I add the SIUL2 GPIO device tre=
e node for
> > >>>>> the S32G3 boards. Would that be ok?
> > >>>>
> > >>>> There are only few exceptions where re-using compatible is allowed=
=2E Was
> > >>>> S32G on them? Please consult existing practice/maintainers and pas=
t reviews.
> >=20
> > I will add another compatible: "nxp,s32g3-siul2-gpio" for the S32G3 SoC=
=2E We currently
> > also have the SIUL2 pinctrl driver in upstream with only one compatible:
> > "nxp,s32g2-siul2-pinctrl". Should I also send a separate patch to add a=
n S32G3 compatible
> > to it?
> >=20
>=20
> That would be great, thanks.

Wait, the driver doesn't need to have 2 compatibles, only the binding
does. Make the g3 compatible fall back to the g2 one, and the driver
doesn't need to change.

--CEFQZhZu0M/q00MG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvHfGgAKCRB4tDGHoIJi
0tAaAP92LyBZgD1JxGH46B1wIjokDf3LXzerrGAFp8aq/1sHFAD9EhgmXmOeQh+6
cGA4MM57MldiZ0Xxx2k+tXjLCyUftw0=
=crvz
-----END PGP SIGNATURE-----

--CEFQZhZu0M/q00MG--

