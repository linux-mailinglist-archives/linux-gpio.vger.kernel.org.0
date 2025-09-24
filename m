Return-Path: <linux-gpio+bounces-26561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFCB9C4CD
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 23:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AA491BC2E55
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 21:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C052F286D76;
	Wed, 24 Sep 2025 21:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H1LgXzaN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019D26CE17
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758750525; cv=none; b=EKReYCBJNLSgyNxeT9WchR2xMaW/V2hwYLV6XhBh9Gj5Za/ntMyFRKq6RDypP7YEzGTOsD05fH+WZBFpfcD63LVMsWkgY8NZ4gqJMbR+/ez1Hs22rl3NqeGovvT8mRA3cti/O2bWManGU9JajBf/r6rEJHBLAnEWy+1yYxXhYyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758750525; c=relaxed/simple;
	bh=aE05OVLTPmqhXmuWSJP7DGx8docC8xqiHGoDzUsPDyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbu5WUn1VCT6WAjbStc4veI1fthfNGPGTauPjQiT7JfqhK4bh/rvEuXCPaQJNYG+P2AWr9MgXJBdJC68O8j2nrJj4hqWU1YNVVJeHq2dcwFXJWOXmA+3i8EvTXYHzX58Ct6v3QLExmQaMU0qdMymcCzM+LFckxxYnwGIiyQ+itA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H1LgXzaN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Sd+w
	mIZ22PON20TAEBc1B2ghCmV0byKiM0bDhr9fIoA=; b=H1LgXzaN0Gla79rJu83C
	1ULDX42H6uWXMkzrD2+evEaZykaKTEv2tl/+33dqdWOygqY7J42e9/kZViV0hBbk
	C1/7Y0v5eE8l2udX0J+owfxIcmepS1ipdPfDVLNoQXipYvsDH4dQ8tqnoLEtwViU
	dhIP1ODk6hCdKywo72ON0SDarPx/GmsR+cc58GJDdLRanS3c8RKJfnkRZytcOpHy
	ydkiv6Nif87GaH5GeZWXndg1AQRXus+wwztArU5tXSeoq86oANz/J4IG7JbYlH14
	5Te3lLG4qwHpH2geyPmsO/PuqIk2H0Znj9NmdMly1R8ASXb0O5CWms3X2l+SOdPq
	VA==
Received: (qmail 1627587 invoked from network); 24 Sep 2025 23:48:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2025 23:48:41 +0200
X-UD-Smtp-Session: l3s3148p1@UXkNBJM/VLAujntL
Date: Wed, 24 Sep 2025 23:48:40 +0200
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
Subject: Re: [PATCH v4 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <aNRnOFTvaThW-CJE@shikoro>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oA4k4Hyef5iRiZPB"
Content-Disposition: inline
In-Reply-To: <20250922152640.154092-9-herve.codina@bootlin.com>


--oA4k4Hyef5iRiZPB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			/*
> +			 * interrupt-map has to be updated according to GPIO
> +			 * usage. The src irq (0 field) has to be updated with
> +			 * the needed GPIO interrupt number.
> +			 * More items can be added (up to 8). Those items must
> +			 * define one GIC interrupt line among 103 to 110.
> +			 */
> +			interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;

Okay, so my main concern here was that we setup some "random" default
mapping for each board. Which is not true because this node is disabled
by default. So, maybe we could rephrase the paragraph like

/*
 * Example mapping entry. Board DTs need to overwrite 'interrupt-map'
 * with their specific mapping. Check the irqmux binding documentation
 * for details.
 */

? I will see if I can provide a useful board addition for the DB400
boards...


--oA4k4Hyef5iRiZPB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjUZzMACgkQFA3kzBSg
KbZDWw/+LIaZhl2ByaLjrNPnnLEpJsF6SPa2bCt/qWEa+M+GcWNL1EEi4e1wQBiR
17inwvsmdCWn89uISn7xnbZiSOwGleG0czZZuJ8C6cdJr5Fja8uyG6xmmDFrsry+
3lvewd2LoyWjvpH4lgflQNgyEmdrX4eOAbCerjpWNj8VwVJoyR1M0ocgA6eYB7c9
MFb8eZhFw1i94IPvu0quRllCTU4bLLR/V2EAGNtKIIgnDtTULA17Uy8/V0coLxVI
bM+wa5LHu+AsK1cmmj6IMEtgS0Y85icRuasZKydP5GFcbKIlQjSACAi6LwMLOpJi
AiODOhnW7O/VKEMfuxquz4vEjJq5EmBoNv8WvBfzuhKwUClRYAWVFet3nZDF5knj
BbXyd+nxx95o1QhCikrCgUns2XgCcLQotv4aLkAhGdpWvw13yJEbcm2VpVgvXRJ7
z0+SyP5ocEMFMZDPZkdEirj3yEwDIqWn3gxMkEFCvQ8fpZ+yU910A5Oapby0iKX5
FCPHAW1bgi5udUpewhnavxzJuKCDP8H+89OrnZ5uRyHvoZrUOez56c+Fj81HZH2+
bmGc9SJSCJNerb0o3VvMkygH5EEmqHtTtwVQl4p8iXNktH7c5efPUd2fJxvsZ0ew
5VYePdwIK5f40wkupqLJLW7pE5KwgbHKY4tUF58HK3vWAeiy24w=
=v8Q/
-----END PGP SIGNATURE-----

--oA4k4Hyef5iRiZPB--

