Return-Path: <linux-gpio+bounces-29038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A08C81DBE
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 18:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 808C24E5CED
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 17:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726C9231A30;
	Mon, 24 Nov 2025 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAzQHK2U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E615ADB4;
	Mon, 24 Nov 2025 17:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004602; cv=none; b=lddn+1btqsudd74Ghsx+McUlQQ5vjdvHOu8DQcyhbe/eQGgEVVnDuqoGkkg8dWyfhJVp9Jx3ft6ZD4khA1YJ2xlMMK8NzciFOBJ4T6d2ulNDI+36+ZFwgtVAhM6QmqoYOY8MYYX9Jz41vRN5yA40VqKwTVNIue6Sml6OmVob7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004602; c=relaxed/simple;
	bh=g4eWhAp9HX+kQJw2WW/3S/ngjyOTry/n3XlGsvQMXgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfatFbaBuafKLqO975bwBgdPyyU8QFm3EV01fXY8XLFy7+VWIMNCbJ2e64WM/w8HX+Uw5kro2AZZqYkjvEJjFJKVRhglqCHbcL+rZOpx0U85f2j41nP1kZObIyFPivRBV2TlvTdORH/KWFJL21fUfD0DfQ3caiRubA6rzI8z34g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAzQHK2U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4675C4CEF1;
	Mon, 24 Nov 2025 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764004601;
	bh=g4eWhAp9HX+kQJw2WW/3S/ngjyOTry/n3XlGsvQMXgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAzQHK2UlPtzDP1fRmodh+M3ijNlTn+mFdGII5NrpWc85vHiUxSxriluzk5PWZPGy
	 U7XXsHAgdIl3Ho4VKe9hTVf/DhIi036XlrFHBoXN05rZptMh/SLBAr+zJNb3moWB6d
	 fbC2PljXYlPFyoBkokPJuSSv6XPlnkDUw+gt786DIsTn86gM5tSOY6OT8Z1TPxj8gY
	 qsW9O8lO6XkK57rPJwBUof/EAGnBQnsCArhgv9orK75abm0EjFamZhcNA+7yxXJ6Cq
	 uiBtbASwJEYP5xmxhBPl+b9trnfxKfsICeZtoifJBM8r3xHxxCbbA4i/gOQdoH6JqA
	 3OaRxeC79S7dA==
Date: Mon, 24 Nov 2025 17:16:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251124-operative-elephant-16c2c18aebde@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud>
 <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud>
 <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
 <20251121-epidermis-overdue-1ebb1bb85e36@spud>
 <20251121-skimpily-flagstone-8b96711443df@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0n8QaJ6pQmd+fkeP"
Content-Disposition: inline
In-Reply-To: <20251121-skimpily-flagstone-8b96711443df@spud>


--0n8QaJ6pQmd+fkeP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 11:21:38AM +0000, Conor Dooley wrote:
> On Fri, Nov 21, 2025 at 10:46:54AM +0000, Conor Dooley wrote:
> > On Fri, Nov 21, 2025 at 12:13:21AM +0100, Linus Walleij wrote:
> > > On Thu, Nov 20, 2025 at 1:26=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> > > > On Wed, Nov 19, 2025 at 10:48:07PM +0100, Linus Walleij wrote:
> > > > > On Wed, Nov 19, 2025 at 7:23=E2=80=AFPM Conor Dooley <conor@kerne=
l.org> wrote:
> > >=20
> > > > > I looked at the bindings that look like this and are not 1:1 to t=
he
> > > > > in-kernel configs:
> > > > >
> > > > >   input-schmitt-enable:
> > > > >     type: boolean
> > > > >     description: enable schmitt-trigger mode
> > > > >
> > > > >   input-schmitt-disable:
> > > > >     type: boolean
> > > > >     description: disable schmitt-trigger mode
> > > > >
> > > > >   input-schmitt-microvolt:
> > > > >     description: threshold strength for schmitt-trigger
> > > > >
> > > > > 1. input-schmitt is missing! But it is right there in
> > > > > drivers/pinctrl/pinconf-generic.c ... All DTS files appear to be
> > > > > using input-schmitt-enable/disable and -microvolt.
> > > > >
> > > > > 2. input-schmitt-microvolt should probably be used separately
> > > > > to set the voltage threshold and can be used in conjunction
> > > > > with input-schmitt-enable in the same node. In your case
> > > > > you probably don't want to use it at all and disallow it.
> > > > >
> > > > > They are all treated individually in the parser.
> > > > >
> > > > > Maybe we could patch the docs in pinconf-generic.h to make it cle=
ar that
> > > > > they are all mutually exclusive.
> > > > >
> > > > > The DT parser is a bit primitive for these.
> > > > > For example right now it is fine with the schema
> > > > > to set input-schmitt-enable and input-schmitt-disable at the same=
 time, and
> > > > > the result will be enabled because of parse order :/
> > > >
> > > > > The real trick would be to also make the
> > > > > schema in Documentation/devicetree/bindings/pinctrl/pincfg-node.y=
aml
> > > > > make them at least mutually exclusive and deprecate the
> > > > > input-schmitt that noone is using, maybe that is simpler than I t=
hink?
> > > >
> > > > I think that this is probably what to do. Mutual exclusion isn't
> > > > difficult to set up there and if there's no property for "input-sch=
mitt"
> > > > then deprecating it sounds pretty reasonable?
> > >=20
> > > Yeah I agree.
> > >=20
> > > Do you want to look into it?
> > >=20
> > > Otherwise it becomes my problem now that I've noticed it :D
> >=20
> > Yeah, it's just a binding patch here I think, so yeah I'll do it.
>=20
> ngl, I forget if there's a shorthand for the bias part, so I just want
> to know if is this an accurate summary of what's exclusive?
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index cbfcf215e571..6865472ac124 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -153,4 +153,66 @@ properties:
>        pin. Typically indicates how many double-inverters are
>        used to delay the signal.
> =20
> +allOf:
> +  - if:
> +      required:
> +        - output-disable
> +    then:
> +      properties:
> +        output-enable: false
> +        output-impedance-ohms: false
> +  - if:
> +      required:
> +        - output-low
> +    then:
> +      properties:
> +        output-high: false
> +  - if:
> +      required:
> +        - low-power-enable
> +    then:
> +      properties:
> +        low-power-disable: false
> +  - if:
> +      required:
> +        - input-schmitt-disable
> +    then:
> +      properties:
> +        input-schmitt-enable: false
> +        input-schmitt-microvolt: false
> +  - if:
> +      required:
> +        - drive-open-source
> +    then:
> +      properties:
> +        drive-open-drain: false
> +  - if:
> +      anyOf:
> +        - required:
> +            - bias-disable
> +        - required:
> +            - bias-high-impedance
> +        - required:
> +            - bias-hold
> +        - required:
> +            - bias-up
> +        - required:
> +            - bias-down
> +        - required:
> +            - bias-pull-pin-default
> +    then:
> +      oneOf:
> +        - required:
> +            - bias-disable
> +        - required:
> +            - bias-high-impedance
> +        - required:
> +            - bias-hold
> +        - required:
> +            - bias-up
> +        - required:
> +            - bias-down
> +        - required:
> +            - bias-pull-pin-default
> +
>  additionalProperties: true

I was looking at the kernel part of this today, trying to figure out
where it would make sense to actually check this, but I'm not super keen
on what has to be done. I think doing it in parse_dt_cfg() makes the
most sense, setting flags if the property is one we care about during
the loop and then checking mutual exclusion at the end based on the
flags? The gpio example you gave has it easy, since they already appear
to have these things stored in flag properties.
Is there somewhere else, in addition to creating the config from dt that
this would have to be checked?

--0n8QaJ6pQmd+fkeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSSS8gAKCRB4tDGHoIJi
0qmDAQC7uFm5QpYkHzqrotV6/cDtUzpAqUUw/M/hy/KzyX+VigEA5iyXZAwL4H6d
pCq3j972J8QOBRiCEk6qjBdJF2UOug4=
=3SCa
-----END PGP SIGNATURE-----

--0n8QaJ6pQmd+fkeP--

