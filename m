Return-Path: <linux-gpio+bounces-26478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7FAB91BE7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A88F3AB03C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3BD26D4C2;
	Mon, 22 Sep 2025 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lamDD00O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251F1A5BBF;
	Mon, 22 Sep 2025 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551657; cv=none; b=NcjY30XiO6w7Cxt5KR6BCcP5xFSZ4asGFSQlMm4xoCDFLD12r4kZc849JFZitT0gbb2pEfAWNjz5hP3LKKAW0cUJMlEE9GCmKjTRe0HxLhzMenSLYE0trHSlKkqT5Cp1IewT+yqvktN9qH2/h6gtJ7qA1HrYwl++WHnn0uYHrag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551657; c=relaxed/simple;
	bh=i1jBFpNcZcmt60MgXv6Uuk9Ti0/H9cqoAAmxr5bgpw0=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=Mfz4EN3s3JGLq8qwjV4PtGfG1BVuuOHFbFEQRwiS7rPqTthOD+JA8vBbsDTd2fYk+kwq4PJTvuyXo4ohvwzV8VCAN/ib7WeNwcMNOtHCB0sAeke2dFWGxsapYjWA070i7qIGPoZRbiht0QBfqv12kyjxTl39gR+jZsYJ0b/W7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lamDD00O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98A9C4CEF0;
	Mon, 22 Sep 2025 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758551657;
	bh=i1jBFpNcZcmt60MgXv6Uuk9Ti0/H9cqoAAmxr5bgpw0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=lamDD00OiyToFEspk9wWZHDSFl4t1DCDAH7RpfKXp2d61KDyCahfizPCeC0c7jbvE
	 LIikiq8QStBtZMDI8yeSc8QgaWLm6p5X81YPrUypt+2UlqQ7eYM5TzoHpw+5e7QAFA
	 RmcW7dZZuKBLK8K5IeehuvR/31Q43mOdCk7B25DOqP7SrB/C5v4iyXtETd67J1o3Dq
	 i1yEldwRF6VDPhi6W21MeRmNTR3pMtt1CAZRKPMWDapZ4iTiS0X1cYzQKSw8ZwAELm
	 1NyLZmjW2LdNxK5t8AwSCQZpG11wmd9ykhSo+6pDfQ7jWTQnBhYtMNlMydWs8A/kSh
	 tvImIXWOhJCiw==
Content-Type: multipart/signed;
 boundary=0dec87fc2c4734804d3c0ed2cfa682c5db88cd5767a8f875f01fdf8c27c6;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 22 Sep 2025 16:34:13 +0200
Message-Id: <DCZEJ8PE0AGL.6WORKBVKONBK@kernel.org>
Subject: Re: [PATCH v5 08/12] gpio: add QIXIS FPGA GPIO controller
Cc: "Frank Li" <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo" <shawnguo@kernel.org>,
 "Lee Jones" <lee@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
 <20250922142427.3310221-9-ioana.ciornei@nxp.com>
In-Reply-To: <20250922142427.3310221-9-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--0dec87fc2c4734804d3c0ed2cfa682c5db88cd5767a8f875f01fdf8c27c6
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> Add support for the GPIO controller found on some QIXIS FPGAs in
> Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
> using gpio-regmap.
>
> A GPIO controller has a maximum of 8 lines (all found in the same
> register). Even within the same controller, the GPIO lines' direction is
> fixed, which mean that both input and output lines are found in the same
> register. This is why the driver also passed to gpio-regmap the newly
> added .fixed_direction_output bitmap to represent the true direction of
> the lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Michael Walle <mwalle@kernel.org> # for the gpio-regmap part

--0dec87fc2c4734804d3c0ed2cfa682c5db88cd5767a8f875f01fdf8c27c6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNFeZRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ig3wGAvFlcFdHxEaykXa4agxzFC+BzG1nEOQM6
vi2hyGQQ+u2SNcck654wLA1oaVjC5c79AX9P1hD3wnqMaM3bMpgGEGmOQSkYdhaS
fyRmx0PB1yABPPhYFUJ4dc0Be1aY9A+G2bw=
=fwTe
-----END PGP SIGNATURE-----

--0dec87fc2c4734804d3c0ed2cfa682c5db88cd5767a8f875f01fdf8c27c6--

