Return-Path: <linux-gpio+bounces-27489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A559ABFDAB3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 19:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652BA1A60BE2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B392D838A;
	Wed, 22 Oct 2025 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+rdPsNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5AD2D7818;
	Wed, 22 Oct 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155094; cv=none; b=QKVjMHb+lEAg0kKa0zGc28yoy6bcrVAAncKzGuf0eVA2CgcKRImQ5X1qdsKiTNgVsU9uz2AFqYoCw2VC6dwD+Jmo8oePieTpTMJFrSuTSvzwLss1XJYCQudeWWWeE/S95hk7bvHrRzEPKjkMyo836c1JKDDfIlPXov/2wCWqwLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155094; c=relaxed/simple;
	bh=W+Zl8ejinEPVx7KvbwfEUBHq8Gh29eQma2UCTEn6VCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6b3MrvoHIChUwQ2+86la3Btlzbt91MX3mn5bVlSrbagJxxZhlzJo2NfeJlf9cF8lYUdWxnUliBMJzYeAS9xRu7z1nCDUCjcrDP4aaWt9YHR1hhF9lq47+ehO4GWsBMCCMWHquBxn+fxc0+Vb3SdCYT1ae4HyLsyJQQ3a/WeK8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+rdPsNd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688F3C4CEE7;
	Wed, 22 Oct 2025 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155094;
	bh=W+Zl8ejinEPVx7KvbwfEUBHq8Gh29eQma2UCTEn6VCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+rdPsNdkSUD+O/huDpptmt6jYlXJsEflfnExbc/V0T20aZU2IoENwrTMPza8ENcL
	 Zmc3teUEgqthrozg/tgJAt8o56rw94SRRNmiGI9AeIRT7bSssRDakSiJLAzU511jlU
	 uOtAImLPh+9h3B5kL6h5yg38cYqxiNgNeQSztfR5UrX7sEIQRSccfcRyYml0F7Tj4k
	 zbJK6WbbZ8TBApgp2jQC3oVXqsp21vbA0dTvSbBhdgb5IDqdeeZKvitqXkYY0MIbgi
	 zj3AtFe2UpYZs69tmiuFHU+Z4zQnUEhqVATtjRysI8U3dNUmzUUiuka9UTBHOqH2Sq
	 L0dEluffPuA/w==
Date: Wed, 22 Oct 2025 18:44:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20251022-flammable-mockup-4965b730e86b@spud>
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
 <20251021070410.3585997-2-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Aslcfr6pZqhuksvL"
Content-Disposition: inline
In-Reply-To: <20251021070410.3585997-2-gary.yang@cixtech.com>


--Aslcfr6pZqhuksvL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 03:04:08PM +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S0 and S5 state.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Aslcfr6pZqhuksvL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkYEgAKCRB4tDGHoIJi
0sYAAP9O+QBhPMKlVXgWxSSjkvMDNX/EKzPmh2SGi+q0jIXBNwD/dYGDW5Iyv4n8
LUGkY0fQrp1kfczldh5l67AUCywPSQk=
=69W1
-----END PGP SIGNATURE-----

--Aslcfr6pZqhuksvL--

