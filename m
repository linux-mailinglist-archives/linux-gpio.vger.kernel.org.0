Return-Path: <linux-gpio+bounces-36397-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJkUCeHK/GlhTwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36397-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:24:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9774ECD60
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3003020D5C
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 17:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470C944D6B4;
	Thu,  7 May 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpwAj9kc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF02E1F02;
	Thu,  7 May 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174684; cv=none; b=PcNXXUMtHR09qFQOh1F6gdc3YsszPVT64kMb1ND8RxXWtP2kn02mFrPGptyxVRZCC4vvBWFaAMx7ASpKDMo1mQ4XVodUa/ySnsncM4I4ahaTkRB7Ck1h53SGdVAl2Mpv2POSpYWE3IIwevzlUcd/KFdNl1VA7sEsS4BRnZ6/7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174684; c=relaxed/simple;
	bh=P2uFCtkUNsia+m6fpAEh1XqkuX3NtaugGNibOKloo4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3NtgOkJk35BmiVe49hb0YTWIX3T0v0BhrlV++hv6GQUM+HKed945BosMu3d249NKQl0SI2Mz8gNjtDUcZLKaP5lZ2Mf/JseNuEqUnvRDxF1pGYrkMPWbvNwWz9MqMLlbFHLN7s2/MCGCLC2ao7iGiYr5EWJ6QVQgnCthBCGHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpwAj9kc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F400C2BCB2;
	Thu,  7 May 2026 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174683;
	bh=P2uFCtkUNsia+m6fpAEh1XqkuX3NtaugGNibOKloo4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpwAj9kc8UHoERSQHR0XSVqory3ohRb6FqTA8C81qrIvv/U+4tAaRBmUd5plpauW6
	 O2+JfcJ/rrfXrnYcdDnCt4nXNbQ7v8EyO5n7h3FzT2LaOIxaF7axtWgiCEMU+q6X3A
	 S+SXGhN92RGwwBvB1L4ZrstRVtXNn95gG9/V78z9EnqRy/Bkbjcn9Fbb7RhN/K1eUs
	 LPu0e+wfwM7aZMG9k9BAxL/mgkZkFnHfloGEYsd48Oj1b3Pct2pPAN9xwN8aMIBJbH
	 ZAIPpiwJixuexPRRoCx0FKTdHCo8iikc2sMAFS8fY6VLthtXyBd5rRsqg/1CTTB/sd
	 TsYOru+1Mv6yw==
Date: Thu, 7 May 2026 18:24:39 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Message-ID: <20260507-juice-helpless-b04e31e10778@spud>
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
 <20260507-a9-pinctrl-v2-1-49774feff2ef@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hcasBY/b5pRydqvZ"
Content-Disposition: inline
In-Reply-To: <20260507-a9-pinctrl-v2-1-49774feff2ef@amlogic.com>
X-Rspamd-Queue-Id: 7A9774ECD60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36397-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Action: no action


--hcasBY/b5pRydqvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hcasBY/b5pRydqvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzK1wAKCRB4tDGHoIJi
0lmTAPj2IuWZOzkdHyd1WG3b7KQWEm0yZDOhSvUgbOssnp7HAQCGYO2izgbTLuuW
g6S0C7Z2i/91Jf5RCru9LETDYWvfCw==
=CbFS
-----END PGP SIGNATURE-----

--hcasBY/b5pRydqvZ--

