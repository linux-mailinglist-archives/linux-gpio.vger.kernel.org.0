Return-Path: <linux-gpio+bounces-27428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E011CBFB069
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 11:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BEFC5864A2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 09:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285A33101B8;
	Wed, 22 Oct 2025 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fEMx8uIM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E430C35F
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123614; cv=none; b=YInkXKbGDxG8Him/vBneW3b7Jwig+3r6hx5yu2gQFMnXXxkDyBbH5WzKTYKbaP1VYwc8u1cqIAoNNKnBeqUG4ijqgYuQmvbhrF2Vi6VLRBf1uaxu7r1JO4UTVFIXcYcLxoDavpaP1dAZ4LPIxIATTw+iEqmyIu3w6g91nTAla/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123614; c=relaxed/simple;
	bh=nyHMc68wsGGwLDug/tIHbcAo1CB08oUJBliYMKzONHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4upUcWG0ZrY63FOcQHCa046RbeQcnW4WbzSslqq51l9svCEhZSSaHqoXb8ZyQF4ifxISPhkpDQbL9F3gFp064g2c8d2bZlcmW1ZmOnS7p2qDnRuUAAlzNn1dnaUVKYCLesZQBlU4H2vWlR0Ea0I5Pc2IKKALakB/YSjtydywUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fEMx8uIM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nyHM
	c68wsGGwLDug/tIHbcAo1CB08oUJBliYMKzONHI=; b=fEMx8uIMpiTZEBIeYB0c
	l1qs0tu979S2+e8KbLdfW/ZPdfDPVMB8eEN7nRFvKoLDGlF6yXgZe3Bf6qRGSMA2
	fkObS2ScDsi4o8S28nWeWfngH0q11zXv9KESrbImb1ZOAkXEhTaEHdCIL1G7NQWu
	F47fpfnTlS9GmOVp+E/T0AiLNyiEbdGjd42NBxk3M38YeGaBa+OvHsoyypQQhk8r
	ShJL25QJgg+wcFt7FP9LgzgVbkk5KuR89Q6KNL24b6lxg8udf781U/gHReMgqFG9
	nEwSQfjjB/D2qTy8MHPWx02OQwMhvf5VihIUne6i1fINmtgrCdR85B8VjftOvBFt
	ag==
Received: (qmail 1759633 invoked from network); 22 Oct 2025 11:00:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2025 11:00:10 +0200
X-UD-Smtp-Session: l3s3148p1@Jfowi7tBLBJtKPGR
Date: Wed, 22 Oct 2025 11:00:09 +0200
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
Subject: Re: [PATCH v5 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aPidGU_4NattHKKG@shikoro>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0AwDRnA12mcMm4ja"
Content-Disposition: inline
In-Reply-To: <20251020080648.13452-1-herve.codina@bootlin.com>


--0AwDRnA12mcMm4ja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 20, 2025 at 10:06:36AM +0200, Herve Codina (Schneider Electric) wrote:

> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.

I definitely want to review and test this series. But I can do this on
Friday earliest, more likely next Monday.


--0AwDRnA12mcMm4ja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj4nRkACgkQFA3kzBSg
KbYW0g/+NG2O5U/YAwoYvkAQdUeheX+WSMqYJFXS8N+FL8/cnvU1sNI1CB6M250P
dEvvUKicMpNX4+KQ6Kf1ofQ0h6e4nbNRtwLTP8Ztqh7u8ZpNsn96lcRiw7p3Mc7V
VzeIMAY5kPugu251q6iale3EX2OQiSQmezybDxftGZeHc/PmjhJyllbi9QStbgLB
f/IVKO2HS9g2jhC+rzRhfpuO7/fpWMkY2fiF5pQPHO7BbO2AhhwkeXaPEqS/OXwl
FPaYyFyrWLrBIngRLO93xQsqePENC02T1AwY3u5/D2e3XQHhR2hQ04rqvdFydTzN
A8ogtE/yh8AI191TDAkqcCZFtUhdkIg/1F2u7o4m9jCvkQTo1KZX2oS1OMuvoql+
xQzCZVxMdYJ4y0uiPmCf7J65E5A9S8JpSMjr5zs4F/fTe2cqoAVJe5YGLKUytDtp
aBBS0iO30iE+PYZEfvLr7Ola872oevzZJ9xaY2dhDV9FQZxYquza+axVddsaV6nu
2+VneRPvqr0BPGhFbCN0BGZO0oHy4kH7FlKp0v0ie5PVZuOjrIvQXo/4ZTbJvRM4
2KnxdS/z4ERRoStCST1gKFGfoKE/EZWAZdfnGdMQqUb1+1UDvpe7pI/8CJR7vWmS
zFOAhsj1sZZUrENfCCgJGR5I1+rTiXSCer2rFajCN3sa9nrs/sU=
=3GeV
-----END PGP SIGNATURE-----

--0AwDRnA12mcMm4ja--

