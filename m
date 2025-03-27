Return-Path: <linux-gpio+bounces-18070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE77FA7373C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 17:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 761F517E024
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 16:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031CF1CB51F;
	Thu, 27 Mar 2025 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PibiQl0U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905891C6889
	for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093874; cv=none; b=qXTbeZq7uLGebcVS/5Xq6Zwt/lKn+rOe8AgVeIXfTxGfpWn39VVkaAm93L9Hol/h1zKr7fnJJLcH9YnRPXidl6aro0cZe0DxNifp0AIClAbuNg6VIA9cHO5QJiv4RGWGdSXfM7oVXF2PNW3xUEqQSc4W0X+MumJZjzQa4VrG+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093874; c=relaxed/simple;
	bh=zvcbSyO9PwWfz46UMsJf4c401+BJRbxXhYnxCIV0uZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui1A72y+E+WnuJsdczmPeQw0WSBUJZQHzSpphOFu6SI+ZtK6O+/kcKgbz9E32eIu+8GLF79FuKtoZiOCLigx9R/OHaJnopNtTLKM1DN4K1mqjqaP/Y7IOPVKPJmBDq/zbvWFoc7tMEpku7QwtoRF16A6qSqz/hP17UFEGPGgYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PibiQl0U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hbwx
	FimHjuyQqZmQbnUDmSjTT9QuBUrE9kGrrCegsl8=; b=PibiQl0UGvs02bQfzYYI
	pkF7He1ovGQgWonPfhrXuPMoW8iOuyZLOUpnHNzzREGLMqHvW9XP70wFtIvAEX5e
	cFMngdPs6iBpu2m3iNe0EQf14Dm/7XsPgTFm/9PzHVh0zJukwfDvxasKDPupxuS7
	OshgLMyM9K0/YzNRomYpV2u/njpqUVhCNLZLcW048GCFkMNU9gMgxytwmKBfQP3u
	f11qEJsnNOOOEEJI/HwrQrzrM57urM8B6hdwZbHXWxcmbpiLJzpKkSMkGJPonHLd
	p8GwEP7/Wg1nVPgGGjJWuwq7xGWLheHbOmzrTo6QTZO17nrAkPe8w1Grbzwf1Vab
	YA==
Received: (qmail 4083466 invoked from network); 27 Mar 2025 17:44:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2025 17:44:24 +0100
X-UD-Smtp-Session: l3s3148p1@gtWOqlUxgJEujnsv
Date: Thu, 27 Mar 2025 17:44:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
Message-ID: <Z-WAZ_IlMBB3XbTN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
 <Z-VETFWFT5NksD7J@ninjato>
 <6fa375d2-5ba8-4b2b-8a54-f28b3cbedcfb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c/EJiR+H9xTHY3mL"
Content-Disposition: inline
In-Reply-To: <6fa375d2-5ba8-4b2b-8a54-f28b3cbedcfb@kernel.org>


--c/EJiR+H9xTHY3mL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You did not object to last discussion about this (a month ago) - neither
> to my comments nor to resolution - so this patchset repeating the same

Because I cannot follow every Renesas patch series there is. You are
long enough around to know that large companies have different entities,
groups whatsoever. It is quite a challenge to streamline this via one
group, we need to share work. We do try hard, though, and have a
ARM/RISC-V/RENESAS ARCHITECTURE maintainer. Geert does a *hell of a job*
getting all these submission into shape, and he surely does not accept
code thrown over the wall. And geez, the patch series was just sent
yesterday, you didn't give us even time to raise the issue internally.

> pattern from the same folks while ignoring previous talk is
> contradicting "not too bad at fixing stuff".

First, being a maintainer myself, I do understand the frustration of
patch review not being honored. I can also agree that this series did
not work out perfectly. But that does not mean that we don't care, in
general.  Despite all imperfection and possibly different opinions, we
try hard to be a good citizen and spend considerable time on doing
things right. Accusing us of throwing just "code over the wall" because
there is an issue somewhere which hasn't been worked on in one month is
plain unfair.

That all being said, we will fix it eventually.


--c/EJiR+H9xTHY3mL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmflgGMACgkQFA3kzBSg
KbZxSA/9Gqszzc/JQdPg5lFILYUjNMR2rLsA7Uc53vk3WyEcVSWmUaBjeGLU+ZkO
2OkaPe6x+ULk1vXzpJYmHK8J93cMHK7/tXR8YBFXno9cL1s+/XdwWuLWq0xlMfc5
weFwNN/e3mz8emxJWhi8AJ0sMhC6OTBL4qghprYH6ElZfxgpliuGWw59ei1gKnsX
/p5mOmGEETy4DIbiJEYth/Jypl4NrhfZdMmTUWBTqAj7/HuaBvY1psifuwDtAe5F
mY3FY3ES+6Hfzl76tsBQ6JEmRW9E+rZFR4Dv3M8XXaEYsZZ8fR1cwgQ1WXNbdmz/
1QOmex7GF5ceEJWdhEqAVJhz+aN6+Ot0Zxv0BCpxJzEoIGg7SXYpfkVBrTSL66a5
1trcWPmelNgqCRc65t+mvUmAfsELLXUE7h96hKtqDCQ0GNokdbqS0PuRCief56/b
VwXftmqvTstdTB7zMf9qfg9uTCeQycuzAsZQOdNynvDKML9olp6di/+curLvv5BW
M45znbdpzss7Ilwj3qbgIkFT2O0v8PGdqsn+1gQ8mgahnCe9OAtZl1hd8o0WDmnJ
2sbZcCcYMLgZVa+bI8/20Vba8uOnMMLVWZ/jk8c8LiRu8mqtYNAFGM8ClHFfh31u
hLSV0vYp+GarLkjMqXezTYhnugy344QNVLOm2atmMGI69u8dtWA=
=0lVg
-----END PGP SIGNATURE-----

--c/EJiR+H9xTHY3mL--

