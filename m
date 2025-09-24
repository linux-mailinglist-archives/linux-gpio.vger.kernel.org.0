Return-Path: <linux-gpio+bounces-26537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52916B98C15
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 10:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998E6189CA68
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 08:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78A280CF6;
	Wed, 24 Sep 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FnHE2anQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753027FD5B
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758701287; cv=none; b=g6gFS42n+0op1KdT3UnbSmSSBUJtH64bVM7opIJ3syQ971wqs3Ub5vbuWB9b41Bof2O8ssZ6NrOe6Sp4YBeGSU8VBxJQWkanS82qcOxHf05DX10b56Stvvwje8OSX8iYEr3dPrw8beXPAz1iczg/oZ+HDQLSyn0VtWoKJhSLjEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758701287; c=relaxed/simple;
	bh=6HP7WS33RyuhHq10ONakzPJU/Wc265faZwnsYhZjIZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpLf587C8Z5g1tkIeQzBd6szl7l5IxkD8n+LfNlElWv9E3dYrEiCA2Z77/CMaznuapqvXu5GqRDPIqy4TGGcvsyat9iKd5ZMQHUcDGlfwv/8W9tFHaQRcVi3lK5/3tbpUdJvWXO20TIC6RvGVlfE6AKr8Tphm2aEKPsa82yLyh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FnHE2anQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6HP7
	WS33RyuhHq10ONakzPJU/Wc265faZwnsYhZjIZU=; b=FnHE2anQqFYVXls/UmZy
	YrQmBFJl8lz7rjfOaPHXiT4rOY7Q93aSFhaVKkjEBYfcGNp+/Sn564zOaxOeC37Z
	y2Vu26IalgtVQds2tAzDx9sDkcjO6pFn8Op/U2IVNpvwL54DrbueHClA/HFPgJAh
	kGXowapirRYNlYX1YxMwziZ3gQqz9rCLP+4D407eOJHb5lKjutnkTqhI+4pgk/BZ
	XVzVldK7aC0clwQ0pfJINLHpLQlzM0ipB2ndhYqZq9xqhwGFnkl6rvebk3Msc7Q7
	27XZONzLCTw7uUHhf2SNvTHWDBvtbfb4TPegUBK+BcnaSdsFmW9rIJ5mFMIMolwM
	6A==
Received: (qmail 1410440 invoked from network); 24 Sep 2025 10:07:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2025 10:07:59 +0200
X-UD-Smtp-Session: l3s3148p1@01sIjYc/0tsujntL
Date: Wed, 24 Sep 2025 10:07:59 +0200
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
Subject: Re: [PATCH v4 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <aNOm3-NxKfjXLsSV@ninjato>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FOgGMUw30W40DZAr"
Content-Disposition: inline
In-Reply-To: <20250922152640.154092-7-herve.codina@bootlin.com>


--FOgGMUw30W40DZAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 05:26:37PM +0200, Herve Codina (Schneider Electric)=
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

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Looks good from the technical side. No comment on the syntax because my
DT check invocation fails again after some update, sigh...


--FOgGMUw30W40DZAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjTptsACgkQFA3kzBSg
KbbUMQ//R4uahw+mh6cHSRJmsbHQeEMbaHXdeiqM2Ezw/8GZn3xhRRz8qFR3AHH+
5k3pZCffvHtYAxjVCe7gaTcRT3sDtKTiHrvPRtzEZzlOxVtFJqRJC4lueftWS0eW
i8rLdwy4rf+fq7nczU/dXAcnw902tQp2zzom05wWaekOaTuGWYoBuE0FWtP7mJ9D
B9rCJV9mfzh7dIxvTbaqKU3AwwlmGAlX7XuNk3GnRKsNEMzYgbSI8s4lbSYrqAmm
K+zsTmsXlCxG8Eft3siYtSBz5hfnZ/jIEbHw1gXXOrute9ATqhD6MZzRbOFbyy+2
UqYuOlLReS/fNcxGXpte3XMP059Ixk6LD9JhNTvSy7Z99XAloV79waxPo8kLp5ns
vBISCYCr8d3eTGVcteoj//X0razRlzJ1Aacx7/UH1tKLqhy1iU2YtY7wJianxwhm
YNGimNgsnFNMC48UHfzaeQJDFL69fikSluCH+V7gOtAp334mDjzn6cWT83xD8om4
TXUunrt6VUg6o/csg1Kb50kNqwto34ida/HSUISwm3VnEijK+wJAy1zhxoDC1FWx
1bsNhc2SpzhQ1n5LvXlqk0SyjtGMryCwf4916OonDLtcbR/5QC+/NEsLrhgW1YWa
Rcgw09I9B11iqZaXdbdDLQjidkXCE7J7fj5MH96zKMvKwjuFW2E=
=4j6V
-----END PGP SIGNATURE-----

--FOgGMUw30W40DZAr--

