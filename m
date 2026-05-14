Return-Path: <linux-gpio+bounces-36861-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFkAIVUQBmoFegIAu9opvQ
	(envelope-from <linux-gpio+bounces-36861-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:11:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F9545BCE
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86EF03027333
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5322A39021F;
	Thu, 14 May 2026 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVMT1O4X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14783332EAC;
	Thu, 14 May 2026 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782287; cv=none; b=P7Xoyz/ET7nq+rSjfj/mmY67MT7d8Xz7B8gFAlRVXn22mAPXOKXROst4isEbukxoQLM3fjxLGkcW5lAcg1Was45qoZzJ+zriwrTcseG6bQZEYvgDyY9jynPgeY1U9bx1Q+r5Lo5BxEof3KeFLfl8lPd1Kf5mwKy8gXYVfVGqTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782287; c=relaxed/simple;
	bh=2HTCI05MSUVQvNLNK3ddjhBLnCigyqWHLaWSd69Plu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7QlzWZ/5uIGtSebANo33+P0N507IMgD2fjmJk95yEjMTQjx77DKZjTMj6GBzuzHzAfjPtW16lGpabya2FXwKqjCwdZfpaRsIiLMojBS+h9wmb+hP61jCl6GREMwrDkIoRA/szSmvg2uXCsM/cs/lKdhaHV5JJqUJNYn4eGJnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVMT1O4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC40C2BCB3;
	Thu, 14 May 2026 18:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782286;
	bh=2HTCI05MSUVQvNLNK3ddjhBLnCigyqWHLaWSd69Plu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVMT1O4XPEL76VAZLeRrc7Ly6riiAPd2w/qLowmXvCPWwmOtrdTkVE48PncTXzC49
	 XHSiPSMJj93LQW5Hz9ce3sgznFK78kcGKnygeq0gW+lA0+o0rDXdTFCyvL8oohBSvc
	 A3Qwi1YmAY2e0pm3D8tHxa4S5Ibtm/QqGuqRWFP6D1W4Yp5GA7CdJCKE8OivfFGtYZ
	 XjR52Z66Etv8emqHSC+EjSQb2X9usehdCxNkdUzQ3HLwusYesYdMysQzGpwqOqmdIn
	 pyKbatDaPM6Ov5IY/8L8OslFTT/AJtZI1titxSLy7sh85wYktxntOnDam/dOkQl/0T
	 nFdcK/IZJolXA==
Date: Thu, 14 May 2026 19:11:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra238 support
Message-ID: <20260514-compound-rubble-33def8d298d1@spud>
References: <20260514124835.108532-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9vp8H5uXrVXn9W5P"
Content-Disposition: inline
In-Reply-To: <20260514124835.108532-1-pshete@nvidia.com>
X-Rspamd-Queue-Id: 2C6F9545BCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36861-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
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
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Action: no action


--9vp8H5uXrVXn9W5P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9vp8H5uXrVXn9W5P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYQSgAKCRB4tDGHoIJi
0uwDAPwIIazClz88bsL6vSy5Di9ZoEBiiRslZYjI5QDX8sVZKAEAzKg66b/FbOds
kZHqe/pPMD0CpWLKhuZBi8NaY0X7UAQ=
=DbgO
-----END PGP SIGNATURE-----

--9vp8H5uXrVXn9W5P--

