Return-Path: <linux-gpio+bounces-26367-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04389B889EA
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 11:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C981B27B18
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 09:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097522F6187;
	Fri, 19 Sep 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GX2JIOTp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028652F362E
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274971; cv=none; b=TdXuBSl6f9TatIIG8zdaBMFfSUsHupVucK7f1PY65sb16z4veiHvVikdvrClXwDDqQ7QH7TMCfAukee2v/PwPZXoklcpuU7jDfCjVv+CwDEDwWIPDiyheVXIxIYCwjHpk3t6AiEd5H7yiF4H8nmVcyCWhsoVfV5XvjlhMyJA9+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274971; c=relaxed/simple;
	bh=oLsMF+q2qujm11gWiWjNUd/Uo4+sBAec0hz2knaRaTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN8AZn1pmoVyxfgs40X8YDE+5/9hVBX1R9wn26w3yUKJrWn8lU3/HW0bg2er8OPZxykioSUA5YWROG4Umfh7ZM77lTeiXQDcjQMoef1LVHl/ePu6eEIlYz/UIyDyLQbmL9SJv6h4BmxWVceXvsZg0NWPSKV83YczFsDRsSzlegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GX2JIOTp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=s3Tb
	xiJDztjvRUFzJ8cYuQYKT92l78b01jaafVeaBJo=; b=GX2JIOTpBx4M8wcEf4ry
	uOdcMa4NMsoltz45CzpnAvYi/i+AucnMT7ZFZ1rj3CTdtI9zWqGWRre7qkv5YQSV
	C1LD5JPdH0wKA9KKZcdcuPPAIEpSkkCq2AnCV40cRVg8BjMQZ7lZwCkul/VydCke
	mb7O6wtoVRgYe6gQd/I3JxgS15QHydarWP5PJDxMt1i6H83KH8FF2v0K8VXaZSBz
	/KwjEDuOMM+/+NFOTSLJSHw2YajWlVSNCQpSWDPUzJ9bpL5QQXOchkZbqmGuDmxR
	nQtmhSOTZcR9f7pSNGVPXhW07+Bz8hFkh7sxX2uke5en6E9phnweTmytkEQ+u8Iv
	fg==
Received: (qmail 3865528 invoked from network); 19 Sep 2025 11:42:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 11:42:47 +0200
X-UD-Smtp-Session: l3s3148p1@nd7PSiQ/Yroujns7
Date: Fri, 19 Sep 2025 11:42:46 +0200
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
Subject: Re: [PATCH v3 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <aM0llhn054OI9rA8@ninjato>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bi6m5TpvFPwP7aH/"
Content-Disposition: inline
In-Reply-To: <20250918104009.94754-9-herve.codina@bootlin.com>


--Bi6m5TpvFPwP7aH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +			/*
> +			 * interrupt-map has to be updated according to GPIO
> +			 * usage. The order has to be kept. Only the src irq
> +			 * (0 field) has to be updated with the needed GPIO
> +			 * interrupt number.
> +			 */
> +			interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 &gic GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 &gic GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 &gic GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 &gic GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;

I'd think this should be dropped from the include and added in the board
file instead. I did this with my board and it works fine.


--Bi6m5TpvFPwP7aH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNJZYACgkQFA3kzBSg
KbZYRxAAqmVUBcNfB70YUIdFbXn7zMqf2rRk+ISDeGFLd0jF7QeyJOdIX26CtcvX
79aCDOQJXV2+W1ETGYUJBazPRosvPgcvs+RTuUMQ8sHUrCjbDVqiSzQAIFDR9YUj
XyT4aLtJemTJOJIAmOxKV0oXpkUeqJMFUPeVjTKdLDsdAQ8N5ItOQ9tswmSLDkbQ
cmQobArJbPCYb2shp4qfeiUoUfxqLHA3Ij6WlvJuZCnNwcV0uSxWqNv9ZE07gK05
iw2PUAB3WJi/1PJrFNJxLZqeoBj1195EtM1rY7/LRK+Xl8R/pSChiHcmfk4FQww7
7u5R/J87qFpolXDBgrRCXfLFsfD+1GjyoSKydvnMUjgxbliDm8mUYHof3DrffSqU
4fh957Fn11R0Rd3o0P4+7fyMSoQHYwp0sQmicLfWWJNFTBnyiIXZtPS4QgJWDT8Y
ykCessNwL44kes6vplbrYOTPf0K3xiYH46WdyEAs3XpN5qMjEytxO6W2ie3OgGEq
/DhrzGTvMm5ggFKcyAafnARNXxPkrHZqAcoeVcS7nAaGMfVYSPKoALOH8dZzlqm5
jod/bpTYXNEwwgmDoIQkLgwuILIZz8W7melrk77lr5ZNtvETjpZjLhrRAMn94Awr
MDjUh/8bJtZNbh+QzU2D6GF4VzEOk1beLwWFgCHOhG8yQSVgKI8=
=8EEt
-----END PGP SIGNATURE-----

--Bi6m5TpvFPwP7aH/--

