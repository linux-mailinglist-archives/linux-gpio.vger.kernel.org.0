Return-Path: <linux-gpio+bounces-26728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603EBB12B3
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 17:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07EE616A323
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B261927FD43;
	Wed,  1 Oct 2025 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUT6gmV/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ADE25484B;
	Wed,  1 Oct 2025 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333636; cv=none; b=gas3NBYO0wR15AJQ76L1ZqW2KCouRppDCwXrnZoBTMRuh9nerld2mT0TJ7R1+SbROpPUb2UBZ7a3tBRI70HjjarchsPJpR9hVxZsybuYMXUlQDNQD8G+ova/aUk6BxvgSskGapbiI/lzMOk0G5TB99LyNvvQpatZVSJss04oJq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333636; c=relaxed/simple;
	bh=NjW3kska/Uq+inmxvoWI0aPOX9KLbT5E2CZBOBPzilI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpV6fJ4mef2z51wVICM+DAWg1fNNai0EqTyqT877DsJKjsBVZzvNNt53b5a/zSAZ+JdbwDHVXqJ2NcqgY70TKE+HemJL/DYV9hS4UelPaqsDLDrI9OPO/FwZ9LHoOaCGf8TPZ1nRSbXjlqYY6CyScaXK5ReX1h/r2sPwUDo0gYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUT6gmV/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4A9C4CEF1;
	Wed,  1 Oct 2025 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759333636;
	bh=NjW3kska/Uq+inmxvoWI0aPOX9KLbT5E2CZBOBPzilI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUT6gmV/QKIgrqsrOF2Q1C9xWXS+a2d1A/arnF4ojhnpSEu31ezovmtaN7nKUTre9
	 9+u6fY3bskaH0euvOsYffpxmRx2hHBXSIV3b2+7O7fFGFELtBC+kLr9H7bHFKOYpXW
	 Hk5lW7ZueJuZGsi2MutNUNGypJE6boSZFodcSikKZMsXB89u3HaDkrv6w+T+WybFx1
	 CNsgTg6WtnOqyMCJSCJzc7kggzmUZY0t9Qvc7SWT7C6mYV+Psfc52OfOzNnP5biR3J
	 4bhSb+xRwdRw6zOROQmD2OZD5wyRDcheZWz1e7h35GjfyKzcy7ff8WQx5b/Gu++RCE
	 2a807wnIHPyFw==
Date: Wed, 1 Oct 2025 16:47:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 2/5] dt-bindings: pinctrl: add pic64gx "gpio2" pinmux
Message-ID: <20251001-grunge-unroll-d7a48294570a@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <20250926-gilled-muppet-6ac08937cea6@spud>
 <CACRpkdYoECsAGwUno0b_nz-iBB=iwO0Js_6k4O5k+xhig2NYkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AH55XWIVqMGAByzb"
Content-Disposition: inline
In-Reply-To: <CACRpkdYoECsAGwUno0b_nz-iBB=iwO0Js_6k4O5k+xhig2NYkg@mail.gmail.com>


--AH55XWIVqMGAByzb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 01:32:37PM +0200, Linus Walleij wrote:
> On Fri, Sep 26, 2025 at 4:33=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > pin     role (1/0)
> > ---     ----------
> > E14     MAC_0_MDC/GPIO_2_0
> > E15     MAC_0_MDIO/GPIO_2_1
> > F16     MAC_1_MDC/GPIO_2_2
> > F17     MAC_1_MDIO/GPIO_2_3
>=20
> So this is a group you can name "mac_grp" and a function
> you can name "mac".
>=20
> > D19     SPI_0_CLK/GPIO_2_4
> > B18     SPI_0_SS0/GPIO_2_5
> (...)
> > E19     SPI_0_DO/GPIO_2_10
> > C7      SPI_0_DI/GPIO_2_11
>=20
> These pins would be "spi0_grp", function "spi0".
>=20
> etc. No need for "pinmux" properties just use classix
> group and function strings.

tbh, I found it hard to understand the "line" between using a pinmux
property and where stuff should be described in groups or functions in a
driver. What is that line?

--AH55XWIVqMGAByzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN1NAAAKCRB4tDGHoIJi
0sqBAP4i3U4tZDfeeiZSYod7V9gfVIy15bm/aaFK8wAoHw1+OQEAnbmJgtVTFNOA
jdwWfVgCKEzExwZX9em1+lTlvBRXmQc=
=v4Gv
-----END PGP SIGNATURE-----

--AH55XWIVqMGAByzb--

