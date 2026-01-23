Return-Path: <linux-gpio+bounces-31008-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAoSLe9ic2luvQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31008-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 13:00:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 549FB757C0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 13:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94CF630252B8
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB83D328623;
	Fri, 23 Jan 2026 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAULQdSB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993D303A15;
	Fri, 23 Jan 2026 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169589; cv=none; b=oCVMbeKCHrT+uVl63RHG/mYr/+UNgV9Nx5TSdLiv8GxsB5LZVgfIC2vD6tt0SmHajqtJ0zM+sMKZGEqxQqFt6MkQ99tGgn8YDNI64m/yv3kdEUqmrWqxegVDqSlIw5hp++hGB3v4Gw/rvJMy++VuZ4AsElBMS8KiFajxkHtlO7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169589; c=relaxed/simple;
	bh=A4yU5TrYF1g+rSaiFx3ogpqfd+jZEPaGonYiVrIwkl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLb//5MeK0r674qDddRCB3LeyU5igT9zRmgAD7RjFMGisNMINrHg28y21nhVkBYM4eW2XOdhGEiwEqAIwPBmM4XKZITp9bWBxWXdFFsKYn8vaCqCMrXznpQj385rFNq+JBGxU3OFghQHaEI00lqxtu38vKygGfr0buV3ABfXMsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAULQdSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233A3C4CEF1;
	Fri, 23 Jan 2026 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769169589;
	bh=A4yU5TrYF1g+rSaiFx3ogpqfd+jZEPaGonYiVrIwkl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAULQdSB3MVZgfIZB09N8pbEsFsRoCGZ2aHiWwNNGbnYSPZU6Ikmw0/2lGejcXg8C
	 wWRaInX5UDLBihxis8ATOLE+w19Tu2aYtfsBE7hLKSSvV8PNxENKdiMZgbYsxLfjfv
	 JcnwipvPjENIg5eATg6efz/XrKuLDPsM85R7dDuC4PbYNtrVmnJym0DyL4CppoeHGY
	 slPdxmQ7aLQowy49MmKRZTHqIpQHI5/4gnFf7mgqxgUcRHYUhqkwU/AJX3+Zs/qFMb
	 urltq5QYZT/OxQ+6OqB7UQa/QhNO+wxLNidy8Kozu5ugdYbOUH9WO/3XeUciIyqWPK
	 iMwNITfPCfV7A==
Date: Fri, 23 Jan 2026 11:59:42 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 00/20] Samsung S2MPG10 regulator and S2MPG11
 PMIC drivers
Message-ID: <1333e1d0-c4f2-4823-834c-df8f6a196d10@sirena.org.uk>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
 <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
 <0b4c5e699ce1d8211314a2bb28d7b6566e577037.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QNH62va6fVfk8GAi"
Content-Disposition: inline
In-Reply-To: <0b4c5e699ce1d8211314a2bb28d7b6566e577037.camel@linaro.org>
X-Cookie: HAIR TONICS, please!!
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31008-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,bgdev.pl,google.com,android.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 549FB757C0
X-Rspamd-Action: no action


--QNH62va6fVfk8GAi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 09:39:00AM +0000, Andr=E9 Draszik wrote:

> Thanks for queuing these, but FYI, I think leaving out patches 1 to 3 will
> give validation errors.

> As mentioned in cover letter, the patches must be applied in order, for
> bindings particularly the mfd-binding patches depend on the regulator-
> binding updates, specifically patches 4 and 5 reference files added in
> patches 2 and 3 respectively.

So long as everything lands in the final release it'll be fine, people
aren't bisecting DT binding validation in the way that they do runtime
issues.

--QNH62va6fVfk8GAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzYq0ACgkQJNaLcl1U
h9Dd5wf/RGBpjqkOJnSPpMRcN2JsWpXJEF3vm9OH5VpaItpuB+jfBYI9N0uMyU9c
SRjw+fbX0CE1ywjKIfultFvBtlk9A8QWcIbZGPDAE9gi1zcWcWI7f0oVAetZxyFw
J0KhtWUbDZ6D4l7jqhI8qKBBE9q2icCOCIUZ0j0Hmqw3GGqK08W86miipVNzybdy
yE1kMm14FNIJIjAhq6w4CTh32c0FDRuuBeDpBd/QA8KEo2De/c/q48gW72EL/m4/
bQLaeOe0BMklbIkEOKRqAS7OVJjYUZT8AP+OGn2xdytxqsSCZx8F5zrVcruhSa2+
pWSFzNqnVXFuVrfmgaG35kSRtuzQIw==
=ip3b
-----END PGP SIGNATURE-----

--QNH62va6fVfk8GAi--

