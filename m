Return-Path: <linux-gpio+bounces-23467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A162B0A666
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 16:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374A71729E6
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 14:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26602DBF43;
	Fri, 18 Jul 2025 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJffmPB2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F713398B;
	Fri, 18 Jul 2025 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752849212; cv=none; b=i+AOEJ3ijTsTEJCbWa1+5u08GL4WjXf7yS/F9G+HgqfXSWjP5LmCRhEYGPldPx4Xq7FZ34Yn7414Yt5LjB465Dnz8Zecl5NnsqnFkzDBqw/7IJSD4GJPzjH2/7BOHRe3ojX9OCavJNdsvh9Rn8mgcJ+3vtIeDGd8vl/yWnVUEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752849212; c=relaxed/simple;
	bh=SbdtMyJ9JxA8AsJ4YM/fM6qLT/wRGON/UjHttSec2Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNgC8NT/6VBbM2TaascuoSzJxK9QeTS5usH6718oAi+jROOfWtOH1CzS3zPmNjiqB1/xhrzgFfcpRx2BncdixkoTXoAyXtjqTDCvo5FPrcPzfEB8ghqEqYgGsrkgNkzmxa1HE9k3vnlE9gqEKQhoPTeoNR7iDJ8dO3LZcmw8ZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJffmPB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90A7C4CEEB;
	Fri, 18 Jul 2025 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752849212;
	bh=SbdtMyJ9JxA8AsJ4YM/fM6qLT/wRGON/UjHttSec2Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJffmPB2XJwBhlxzlZaVqjDqD8wF5O5fRixjUngQmH6g/XnHyCFcMsxOao8ryefhj
	 qdLK76xdGkz0ippL8OBZSJ8jCbZ2CXmHc1DUc1vP/OerQeOnG5rj9lIeOrho58vblp
	 RCw3Wde1mNHamGWB0mquUVMgqtUGBGeT8n6PwmMTTmnz527mK/cdatr4S/22Wr8H1I
	 5B8M79lFDgPq7CbE4OQ2HLCmAkwgZVMQu/jYN5XHV7vvklSMTbedW2xzBJ/CBN6dRs
	 w4SHYUVJ/XfU3+Y24ImyGxcO+VPrEpBIh2+pt8M0yoqqjRpU5UrQkRdLe5UikUxjWZ
	 kCoYTK/Yy/0oA==
Date: Fri, 18 Jul 2025 15:33:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due
 for the v6.17 merge window
Message-ID: <8b77befd-7d45-4f54-a651-33027b46e465@sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250710094906.GG1431498@google.com>
 <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
 <20250718071344.GA11056@google.com>
 <b57e761b-c1f7-46fc-a1bd-c419062ceb18@sirena.org.uk>
 <20250718133846.GE11056@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cp/+AROp+piRiyKv"
Content-Disposition: inline
In-Reply-To: <20250718133846.GE11056@google.com>
X-Cookie: Accordion, n.:


--cp/+AROp+piRiyKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 18, 2025 at 02:38:46PM +0100, Lee Jones wrote:

> For the past decade or so I've been taking cross-subsystem patch-sets
> and submitting pull-requests to all other maintainers, after testing of
> course.  However, more recently you have become increasingly vocal in
> terms of an alternative approach, whereby I apply the set without
> patches that pertain to your AoR (usually Regulators) and submit an
> immutable branch for you to pull from.  I have attempted both recently
> and each has received criticism, showing preference for the other.

> Honestly, I don't mind which strategy we put into place.  Let's just
> agree on one and go with it.

What I'm expecting is that if I've reviewed/acked something then it'd be
applied but that if the MFD stuff is good to go then that gets applied
as is and any remaining patches get handled separately.

This was a weird case where I'd reviewed the patches without realising
there were dependencies, and those deps weren't an issue whenever
someone sent a ping.

--cp/+AROp+piRiyKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh6WzYACgkQJNaLcl1U
h9DbZAf/Zrn/glX+QwWE4AHPMLTHjbEne/X9AU3gHKbN8yDEtUvH85YCSDC1RI7D
lfzGliiilU3L1N1S1uCxiHMj3NE/zAjA3Q239ExqB/g6FVET3Qb8tIZ9o+ZpJvcY
P2FlDjBkuzbTCzFVe8VZJ0LvYC7Cm7ymYeNMD+q81DYte/97QoV6nCxvO7JMg6lA
YSTQZDIz9cO2+kACJMp3BicNBMyFnIY1JaJ81bBZPSKAcLB5jG07r0k3Lb5pmNyx
hwvdkL1VfXejP7SB7rJPCQwhQXoUsZv+LkYlaTVhxn5Fgv4ZW2U4fEML98EsT/U0
IORx4UEo6e71jE1x55JU+k2FRLDkYw==
=mXXE
-----END PGP SIGNATURE-----

--cp/+AROp+piRiyKv--

