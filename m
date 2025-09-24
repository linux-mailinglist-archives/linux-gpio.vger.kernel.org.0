Return-Path: <linux-gpio+bounces-26560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D3B9C362
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 22:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA551BC0D10
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Sep 2025 20:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129A0284669;
	Wed, 24 Sep 2025 20:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b7D76bCp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B928F54
	for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2025 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758747399; cv=none; b=RChg+7fULk/99fNCWtpbfJ3FBUaxlt4FiF7pS9AJLcV9bPhkLbTrFxEq1/janejoXyJ/ZqqjUbtzpupBoRNhlI74eyt6rJm0EucwWO4GFjQnGgnoYT0NkkCKuvzfWDkbIZMox2E6zgN5qBoQQI2JzWKMrKdi66+uXZmTaojyHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758747399; c=relaxed/simple;
	bh=AxeAYjgCnWF/4SRty7vYUnSNf3j+jR+tQguIy98L6gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKkFChpAPEQadMs/EJvDqPFbgJP7IS4ToRajhZ0Znc0ziqFD78yA8iqfQrsVSevUFKvJBzt7WT4dcu8RFo+Z+yufYE+iMdQfWKWuIeQ2Nqp9C6QU97UwUIEzNI9zK/wIISs+82zPe6lqh+KzNWkdEGrjdh6Pw/XLIMUxkoCrOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b7D76bCp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AxeA
	YjgCnWF/4SRty7vYUnSNf3j+jR+tQguIy98L6gA=; b=b7D76bCpAQf9OQsaHfu1
	UMvWwb4bl+BN1YGMJ+NK/slKd9iE10cj0iq3iPvpncYHieRaAx+ysLvk34/ieZMe
	3AHSb7g1ScRxfLyCJ5DI/UEcarQ73rJAXUHotGYlACGmuy4PMq3XPOknntr8EQPp
	/+K93bfiWX2kmokJdQy2IGsTr9DNCcHcIlCKz8+GIfEqX/fEZYaKtagwTtE4RJNJ
	XgoIy+m5VNStPGu/TRVZZR5BuVu2Dz2E7G4eM+diPqTCjnnqcU2u3hSahy7FJEGF
	gvckqls/JAiRzoO+wsH+MBNbzSuqbQ230HZF02FgKJShvWFgl90ef2v1Tg8Q8sXK
	/A==
Received: (qmail 1618814 invoked from network); 24 Sep 2025 22:56:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Sep 2025 22:56:33 +0200
X-UD-Smtp-Session: l3s3148p1@B36cSZI/GIcujntL
Date: Wed, 24 Sep 2025 22:56:32 +0200
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
Message-ID: <aNRbAHMnjgnoBJIH@ninjato>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-7-herve.codina@bootlin.com>
 <aNOm3-NxKfjXLsSV@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="etzmLkPvIboA1Stg"
Content-Disposition: inline
In-Reply-To: <aNOm3-NxKfjXLsSV@ninjato>


--etzmLkPvIboA1Stg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Looks good from the technical side. No comment on the syntax because my
> DT check invocation fails again after some update, sigh...

Got it fixed, bindings-check passes here as well...


--etzmLkPvIboA1Stg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjUWvwACgkQFA3kzBSg
Kba/5xAAgdYCDDKk7PYCssHVg3nfJRGYhC4yi5S7dyByqI3BytZJROSx+9EZY2xi
tlXTTpskF3OWv37kEH8ose08z8ajpPbCYc8OskQvJQMlI90gioL3X/8vHGJxAiq0
Ych5CcizM1UYcM3QD65pN6DkDv//WCj7IH5oQ5BO4mPzJnvXt2FvXU2Fws4z1mWM
yQVx1TweoGXdg7npDntrtC0+vJH2HB9XTonJnerC1SreZ1Sn83P7eRRmdNWQQsN4
Td0sbPDf95XGXmAmoTItg4nukl1wqLtoq/BilMeTwEj/buej4bEBtOY54JpKoeVY
ebGiqNdf4vuln8Q2+MDVsb4cpC9TsudV1AjZ/WC4FdWh7b0PNuVJas1ZizA1LcOy
f4XBNO8ESGiBglTqJIGlue0E1GRoTEK89abrRIHugApR6M54w/cRUcqI0vW7fR08
y//JSrBp3c03C9TwX/GLptWjL4On8/2aENODn6OGoE8rQPixI1ybAh9xTQXK/eI3
HtImr9cyOQhkmrMYwL0qeEqaLxVln6Du9FBvtoJ3Ld5umvIujU0xF7eXbWzTxfvR
mi11rJ+vxKfPJlj2tBqS+tmhyeF6WAjhOuCa44DMLdFHX2JPe7uU/Hpcsy4vxs3N
+RgJhujslz085Gbq/ECeKNUeJUx/AT3+Vp7P7pTLCoKzTLYb9Xs=
=mpgf
-----END PGP SIGNATURE-----

--etzmLkPvIboA1Stg--

