Return-Path: <linux-gpio+bounces-26558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A8B9B8AA
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 20:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F5B4E1F21
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 18:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724AC3191D0;
	Wed, 24 Sep 2025 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PATM6Mun"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C8931771B
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739294; cv=none; b=AxC2ufEdoUsFwmbXYJMBheAANrIj14OuWn3A22Q8RJzetAWNY7XD5o8b4eG/WO+0TUs9phWI3Cpbm4r6bGO94AiKJ8f6cInsGQXfRVesFCRykmwU9oNTG0RjStZy4p6+FNgZXLvT4/cbOcnp45NkaDCiSJ3AX9+gzuEIVQHhXR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739294; c=relaxed/simple;
	bh=AmtVRRJ1jDNsgzknhAmzKa0wOzllfT760U23kBlxD+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxvAvr/9lgVmYBnSmQ/1eocxvZB3uIPUDQhz0ePpC7S7Thb/PEjOcx6dRQgNiLAHBmZXxASiZqVj9qOn1iYlLndN6QU/9sd+aKTgiKLGxueDd2oKwSUbAZOdp1Kjh4LBqj/7cIFiww/yNWiAOvYbqJr5tMpGDQ5oMSLe4ifMw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PATM6Mun; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+/I1
	ab4olDmDZGHkFb/TQwI1UB8ySlew2Es2bhyLFxc=; b=PATM6MunPPhQrDkXlA25
	6VcLtNz5L6k6gV4cHOpLAqoYi324j5/ewZlnrXU3FSQ5AnzLu/aKcTuw8juOZ1I6
	UqhizFzH3f7WitkIJhx9OGq2vBfe6efaUzCMamNCDIn945n41H7Cub1LVbpfmhN7
	3pJ/CEv1xOo81DrULWfegDEHWxurwj5ZfRPutZhirkMsRbUXaFuUyckFdoqtaYmW
	pkSuvpXzrM2nQzuqtah9mv7RZFWlpUmRGvjw59XD0Q9nAhQE8WFyGUOQvsN1nflh
	3YPLpEbhlC5H0A1QJ3rD11xTs0jQfwC2WLkZeZ/sIqw0xbd5TCTlKvIU3nfrNgmN
	EA==
Received: (qmail 1587696 invoked from network); 24 Sep 2025 20:41:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2025 20:41:21 +0200
X-UD-Smtp-Session: l3s3148p1@TSMiZpA/OIoujntL
Date: Wed, 24 Sep 2025 20:41:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <aNQ7UOniYss92EIS@ninjato>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sPDzEL5A/+tREXwg"
Content-Disposition: inline
In-Reply-To: <20250922152640.154092-8-herve.codina@bootlin.com>


--sPDzEL5A/+tREXwg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herve,

On Mon, Sep 22, 2025 at 05:26:38PM +0200, Herve Codina (Schneider Electric)=
 wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>=20
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Thanks for improving the driver and removing the requirement of a fixed
ordering!

> +static u32 rzn1_irqmux_output_lines[] =3D {

const?

> +	103, 104, 105, 106, 107, 108, 109, 110
> +};

=2E..

> +	for (i =3D 0; i < ARRAY_SIZE(rzn1_irqmux_output_lines); i++) {
> +		if (parent_args->args[1] =3D=3D rzn1_irqmux_output_lines[i])
> +			return i;
> +	}

Do we want a check here if the index has already been used in cases of
an improper 'interrupt-map'? I'd think it would be nice to have but I
would also not really require it.

=2E..

> +	ret =3D rzn1_irqmux_setup(dev, np, regs);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to setup mux\n");
> +
> +	return 0;

Maybe just

	return rzn1_irqmux_setup(dev, np, regs);

The driver core will report a failed probe already.

It still works, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Happy hacking,

   Wolfram


--sPDzEL5A/+tREXwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjUO0wACgkQFA3kzBSg
Kbb7sg/9FlraWenace/wEziJTaN0z5SDtlFavT/tff2xkVPYo/YHX2RD+UF+eP3v
7KsuMhwUUnLUsY5I1m76gFwa7iwZpY7ADInuWm3oyR79pUvsCUkdK6bCzHyqGZow
3ITIkEPIVBAjDnGO+tmaXk9WdbpfxwUTbPYhKDxa1f/szLqf0uvDWmmSb3RoQZE5
r9EBKV9modMar30ppBO6rk1F268MNB/mNGNNS6hqfGYROzHirS7trjP7+8+zSuMX
idjZzgLdfO2QyWYwcfBCqz6i3LbqWk7HnG02vm4r1MhgMv3Nzi2WKu9MV7NRPh6w
12JgK8xECSKisTYDJ+paD/ALarKM9tvZ4PI63MMzscCatrLvILLW9nH7EouSjnKc
RDBhRElN6LSwQidhRLcF1KgKKMmL3AvPvbk8L0Ywjq+ziJ2qpaDWKMr+f2pLylS4
Wy0X1Owdu/1fTSrjmgrksEqA1nIEAOvjjtJQW/MyjF+KzrnrlpBXlWUtjzinf893
CeHqKzRiWue0rbjsPfW5CLmbfuqkn5k5+TnjPclMNnFmZAv3hIYdeGYxZ/JwaaVm
eKoCp9FYTemfmqdeLjZp0FGBcnsvHx+wyzxb+YCI/ypJJyB94x7ikmawUgLmFPfm
FR93LoSrFnEV8wg9hrPKn/RTwb3U9k4j9pRuAkSZQe4KnzhLWkg=
=mmQN
-----END PGP SIGNATURE-----

--sPDzEL5A/+tREXwg--

