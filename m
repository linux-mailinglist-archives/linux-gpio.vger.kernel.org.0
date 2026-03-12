Return-Path: <linux-gpio+bounces-33279-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GERAHTj7smmLRAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33279-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:43:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30B276B5F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8B61304D64A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51693FE36D;
	Thu, 12 Mar 2026 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qE+QJhIP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931E93FE34C;
	Thu, 12 Mar 2026 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337376; cv=none; b=K3D2EbJjn23yZAvOGnmpoA0Z42E1+6OPOEdlJO6NIJj+usFMIqgFNXkiv51Dof7ZmoMw2TWngNE4K3y1b2UvegS7JIWxFzd7MLdnuj3jLeOw3Ew9FcmNeFGLY0NqR50NBxMhMtteRbsujiOJah9Tuud8GQWyJMGQaKLKMXDkdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337376; c=relaxed/simple;
	bh=a17cA5BnD/c/myM6EVYfTaLwJihQ7JAnaqKyd3OHDOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so15o1ZHhImWQSwmz2drY9TZM0rdZSys0Mj6fbEaYoptH14hIbyn3hoh1LULn0gFhpJJmAyo0c0rTlctuvS0G3nG8K1symRRvpl+fvd909fpXpB03CLDNM9l4ODpetlY7nh7KUJl/PP+pe57JDo/ZMmXzDiV4hUm/XO8o5hoN1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qE+QJhIP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E396C4CEF7;
	Thu, 12 Mar 2026 17:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337376;
	bh=a17cA5BnD/c/myM6EVYfTaLwJihQ7JAnaqKyd3OHDOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qE+QJhIPGwVuj8pyJK3IkDMtJ54E3VXeQ/fEQWdqRplA5fDdfIgPdAERQ1cGjH9LX
	 nuWsWy6T173gi6eMz2X6hPUl+CQ4lSmn/SRmEI3dV6BSbcspSf73BEMUMrbl3Ef4O9
	 oyb77tbz8woMCSES3r3c6fPNY4JrArkvz99TihfpNktT2lWWQ110UQd4/VGokVasxg
	 DpzKOxlQf0J8duGhlutGQ4MqEP/ZF+fBPjzIEEDEKrHi9gFIToCjFpa5dcR8qEaU7g
	 QarO4ep8FQNp+T4ACNwu7Z1410nbQ/kLYKshBIRJ0UeYMCdN5l+Lw33P1frRJFH4NP
	 krQMmfmkoXCTw==
Date: Thu, 12 Mar 2026 17:42:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v3 3/7] dt-bindings: pinctrl: realtek: Improve
 'realtek,duty-cycle' description
Message-ID: <20260312-bleach-olive-2e4c9bafb439@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ic8L765LhWJyXXqe"
Content-Disposition: inline
In-Reply-To: <20260312113040.68189-4-eleanor.lin@realtek.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33279-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD30B276B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Ic8L765LhWJyXXqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ic8L765LhWJyXXqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL7GwAKCRB4tDGHoIJi
0g0DAP9A/A42ZqvKHU++vZOJOu/JYfPBWdqsQzgTz9tK8qUTngEA818TZ13rL9Y5
UKt4fPNRJmmCIRgSZEZF+ctSxb9GNQM=
=VfKw
-----END PGP SIGNATURE-----

--Ic8L765LhWJyXXqe--

