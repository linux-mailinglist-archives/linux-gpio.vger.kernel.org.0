Return-Path: <linux-gpio+bounces-10935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B099262A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 09:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FB121F22E56
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 07:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA78F17C234;
	Mon,  7 Oct 2024 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbtRvHFM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0C11711;
	Mon,  7 Oct 2024 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286799; cv=none; b=FRDIhEg+47GvUdEDmA5sa4SOjMdIVWEn6J0CYKgPcyX20N0A2v2XFhT2gUhK4at1M2ckcPKP5IJpN+cjnZALWG2M7upx194nQaG/sQRAWvDmoyhek/uBDcIpP0R2BB6AfTzYyb/x83gXqjO9OuiXx2Qr6H/N1EHTGbEiHGexmgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286799; c=relaxed/simple;
	bh=bTmie54cI30m+xKd9oaWbpum5lFsp36D2tVWa0a6DBQ=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=kdPoR0PEi3NOMIrI4N2aiSswhIagzOwwyaIL03BlcMbo5C3Ygyy2BbIyRSgXR14m1cEnF6lXmvgfvG5rduefMPi/jTggOHf41utf2Vqw3wzJPWcnbhktwjPXjrukEOxsU0P1oJpI/1evvD7/VeXJuO7uq2oloc/SXV1UVvKqrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbtRvHFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F86C4CEC6;
	Mon,  7 Oct 2024 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728286799;
	bh=bTmie54cI30m+xKd9oaWbpum5lFsp36D2tVWa0a6DBQ=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=qbtRvHFM248aSQTwSyTVGFo3ydeUuoKJvCJFEPoa5qblod8+6D/owGfYeUCSQPZp+
	 jpxKXKle+PNButencRtPwT62KBuuJzOp1/NHDsyuX+MmHT4favZC3l+fwkg7947OVx
	 +REIf0GZIEfXWPZX4sIKdHNJHkyj6hkaXtViNi8lDyIVvQrZfxS0Sgl9qtT5QPTs7o
	 NeDM96pYuMdLCM+ClpalnCg0iEwfAstjNnBtkNsXeQY9xXN3U5P8OqIY2KJnJerA2N
	 +/gqmzsvP6s9szuytIAokIxYhhiqoW6n3J8dJlHf92Yximn2NbuFOzWmQLY3iV0/na
	 sv1SZKDjqvfSA==
Content-Type: multipart/signed;
 boundary=ac486b24ec534bb94d483347c152c9961eee2b3fbe7dcf492ee331510431;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 07 Oct 2024 09:39:55 +0200
Message-Id: <D4PEJCX4VW41.1JU0KDKMX9J23@kernel.org>
Cc: <stable@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Heiko Thiery" <heiko.thiery@gmail.com>, "Vaibhaav Ram T . L"
 <vaibhaavram.tl@microchip.com>, "Kumaravel Thiagarajan"
 <kumaravel.thiagarajan@microchip.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Tharun Kumar P"
 <tharunkumar.pasumarthi@microchip.com>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] misc: microchip: pci1xxxx: add support for
 NVMEM_DEVID_AUTO for EEPROM device
X-Mailer: aerc 0.16.0
References: <20241007071120.9522-1-heiko.thiery@gmail.com>
In-Reply-To: <20241007071120.9522-1-heiko.thiery@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--ac486b24ec534bb94d483347c152c9961eee2b3fbe7dcf492ee331510431
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Oct 7, 2024 at 9:11 AM CEST, Heiko Thiery wrote:
> By using NVMEM_DEVID_AUTO we support more than 1 device and
> automatically enumerate.
>
> Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and =
write into PCI1XXXX EEPROM via NVMEM sysfs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--ac486b24ec534bb94d483347c152c9961eee2b3fbe7dcf492ee331510431
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZwOQSxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hf5AGAm1qTuHwMl+3VdvXzJoBXxgFj2d8cbPHM
GQI3lYB52jQfMrhux6TmuV4idMJLeAizAXwI3trWkajZ0Z17qibvi005AAp/vllS
K31OtT5UOdnSCR+mwlf1GbdUvbYXWwGkndI=
=8pZs
-----END PGP SIGNATURE-----

--ac486b24ec534bb94d483347c152c9961eee2b3fbe7dcf492ee331510431--

