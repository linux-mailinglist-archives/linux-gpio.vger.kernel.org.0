Return-Path: <linux-gpio+bounces-12813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837D9C3ACB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5625D281484
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 09:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F981684B4;
	Mon, 11 Nov 2024 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE4QYeiT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CFC146A6B;
	Mon, 11 Nov 2024 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731317103; cv=none; b=A4CJxQVw3UxHY8oHiU+pFBfJcp+ZNAeEeX6fyYlL8Ii/PVAHI9wK5/Q+pr5zPnrtbErYWPo4IK5MedLZdhPB1mH6pnIU9JriATh/ft+EpM00733alv7INiVEoLbSg2AII5g1vfh9VhVu0yJWjrE0BTGTDfGLJY2cP3eNn8O6UXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731317103; c=relaxed/simple;
	bh=S7s97lzo+XdEmdf5Lbtj2H4z4ONEwt7JmzHyK0hxtOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3Fw+Qfb/e2cOnq34PVBJCRPK+c1zo8GenhbZO4ceEFi+2jnSXlPrLmE6+qkP7qoylvnvDxCZg2w0K8Ncc/yugEHAE4q3Z/01JNVK9O5iImZ/R2LulcJ3kUC2/VCo57zFojnNhvlRVVGgzscaqwaBRV7WKP55s6SOTAaKCw3z80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE4QYeiT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8785C4CED0;
	Mon, 11 Nov 2024 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731317103;
	bh=S7s97lzo+XdEmdf5Lbtj2H4z4ONEwt7JmzHyK0hxtOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JE4QYeiTVdKOecyfLfkeRbd2C9gxzLbSdlXsA9PIC9rr/9Xrj6qY/lz4Wn+UqwMTX
	 3b/5TEE1PfI6nX3vNCMcAstb0Mc+wchB8OgQhqf7iZNskqRH+e5sjr8Hv/GVL5oqiy
	 Cx3SY/ryUktZ9w+SxOxHPQBckwYIRbg+NYpeRxRFy0WwEN56JCyhVFknVN5X0ELrga
	 On0zAr1BwjblSvqMi0CMD/xgZreKMvdDifF3fVJD0GY7HDRzE19VNpLW4ew+5SO5NH
	 YfiutVFriYpM9RcegV/Iwvpxc8IeLtLvgNz6SRZNKhmd/H3nSMtZguH3DuBk7qUjjL
	 sIvHCsQpffvQQ==
Date: Mon, 11 Nov 2024 09:24:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/2] polarfire gpio driver follow-ups
Message-ID: <20241111-antennae-gab-2866754984ad@spud>
References: <20241107-avatar-clapper-93eb34ad0e0c@spud>
 <173126574727.7785.4094963648273280544.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C+JVyLTuudP0h00m"
Content-Disposition: inline
In-Reply-To: <173126574727.7785.4094963648273280544.b4-ty@linaro.org>


--C+JVyLTuudP0h00m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 08:10:31PM +0100, Bartosz Golaszewski wrote:
=20
> I must admit I like your b4 topic names. :)

Heh, no credit to me - they're not b4 topic names. The branch was
actually called "gpio-noirq-core". It's a sendemail-validate hook in
git that generates it using diceware that came out of a conversation
between Brauner/Greg/Konstantin. Beats the usual send-email message-ids
given it is more human readable.

--C+JVyLTuudP0h00m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzHNawAKCRB4tDGHoIJi
0u4xAP0Xf/OEz8iIOKpj9ssDOXUlHKxW/ZCw1P8QpM5vvnz98wD+M0hpvO5x5klj
Lcw7xqyXMfmjthzK2HJ/s674nkxnaQI=
=zHag
-----END PGP SIGNATURE-----

--C+JVyLTuudP0h00m--

