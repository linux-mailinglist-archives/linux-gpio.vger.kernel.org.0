Return-Path: <linux-gpio+bounces-31069-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHZuFj9Zd2lneQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31069-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 13:08:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8848802C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 13:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F5493014139
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 12:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1157333420;
	Mon, 26 Jan 2026 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOZXB0gB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656A5405F7
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429306; cv=none; b=Wi1AMSy24VzJ8l7FTGrREcP71AZbGiXq9WRrx6ZuLSNYFnW/5N9szTjmg0d6r9Y2MUeonurf5LCfxLaFu9fpqrN0kk2hceT8nNm59ceuaFD4Jos61lHe3Ah5Xpz0Jme5qmx00QkIwi0SsJ3BvAq70qMta2sEFlRGLRhQ4Aym7M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429306; c=relaxed/simple;
	bh=D9lwCuMhz9yB+Wyzqe+4BIFq9F09xjiWWebgXDwqgFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKMXSL79Pu/zpuvo282LqdGgsUvDSm1oA5AhuteFDZSic+aLraT6yFdBU7N86gOSypLjlrJkNFDBNX4kmJ+8hoHK4B9UcRikyylMB7ZFpmWn90KHcpNWoSSB/BV8dc5dDNhDovLSQ1S6RD67oqLypbMoTltRwi4pl8nwkim9F4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOZXB0gB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664FDC116C6;
	Mon, 26 Jan 2026 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429306;
	bh=D9lwCuMhz9yB+Wyzqe+4BIFq9F09xjiWWebgXDwqgFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOZXB0gBnzUu2555v/CRHqZUDEAQ373CwsC3JrMqRRr5RFOVrtK/m8fDrxXngaE2R
	 9HbGiaO29irYgVTuU7bQZaeFXOcUtIshYIZaaYo9KuEFNy082zhZEYa0xAWMSvow/v
	 4zvy0JMhSpfY/G+5dkXLTR3w1zCVPkiY7OaeNOwWkwOOzSXUYhL4Wy2yoDtzAaIY3A
	 r+kykN1L/0HxwcDuYXB614Fi3Alf4FZVd0UuxO81JIMK1VqhiZxhHT4Snd2MQPuSBI
	 3AcTMiX7tNQfCiqZIa6PuDCO5UXES3ljAL5sJJeLxz8FhAIXvT8USApMcuN9HooSEr
	 zuBRdrF/Yz8mQ==
Date: Mon, 26 Jan 2026 12:08:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 2/2] regulator: bd71815: switch to
 devm_fwnode_gpiod_get_optional
Message-ID: <7b007fd2-953c-4655-a3fa-58834f3e56f6@sirena.org.uk>
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-2-fb49905452a6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rv9mooj1deJMthU0"
Content-Disposition: inline
In-Reply-To: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-2-fb49905452a6@pengutronix.de>
X-Cookie: Haste makes waste.
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31069-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,pengutronix.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA8848802C
X-Rspamd-Action: no action


--Rv9mooj1deJMthU0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 10:51:06AM +0100, Michael Tretter wrote:
> Use the devm_fwnode_gpiod_get_optional variant to simplify the error
> handling code.

Acked-by: Mark Brown <broonie@kernel.org>

--Rv9mooj1deJMthU0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3WTQACgkQJNaLcl1U
h9AlYgf/Te2yik5SRFxqbUXTHxiDWwUZXbi804vJar+GjlwkkxlX3x+wbR5wJYjd
GQuaxYdaa5qQde9id4+TyXsbhAZ9GvX+Ar8AXMti9XFPo8M+FJH2XqRiETcwLLil
63nDd0qm8Ow0c0Yd4Cja48VAp8S0BEVIw3ChTyVoNubmNTQRYZURuuLep3MVrlP2
fzQ5bPK5CCtebZchuw4DBLySXCEF4cI0mukppgAlQQSudbAQqaS7mUtP24sHw9LQ
c74hHL5XcCYpYnostEdTyG+URRO8Xs6IQMFDkh5zaKzudg0igEllWBIbKXJuo+bQ
tHbBph7m8D75BIUhXi6jSwXpYlBelA==
=ojQe
-----END PGP SIGNATURE-----

--Rv9mooj1deJMthU0--

