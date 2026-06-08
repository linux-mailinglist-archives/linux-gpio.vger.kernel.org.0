Return-Path: <linux-gpio+bounces-38116-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rg3JMFD5JmotpAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38116-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 19:18:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B92AB659275
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 19:18:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nD2mQg0f;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38116-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38116-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C8D930190A2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 17:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4073B3D4132;
	Mon,  8 Jun 2026 17:08:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB59343D66;
	Mon,  8 Jun 2026 17:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938532; cv=none; b=WrcY6IfbDYL8Jmc+9H3YskqOoG7TYiIndXJxeP36rsdocw1RXxULvw9umj5+DrVrZKDgmjMSjDhVBVLdKGQxZtsYw4b+MdGi5BxdMcxRKKTYg/t9P2DyxHsfP+OPBfdl5AqiZvI09jZpdPM+yO9og0lHOC+SFAXAALHsmkWC/oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938532; c=relaxed/simple;
	bh=/0GJTDBh/MD/d14+3u9UGKrowieSpMD+zXmXGmzr+q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEPE8SmbMboqHy0vTpHXfEMeg4WUVuzesJyVq8PjTp+jdbQHrkL3G2eHCw7JxGftrXa1niKiPjINarBfzwVjSoUfk7f7etBOzSVHjjz0w2m/Rb+JW9SmvT+7HAhD75J0VkfZZryOs6l/kymvWZ/v4h/w/3mEveerK3MPDJ+jmPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nD2mQg0f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA2D1F00893;
	Mon,  8 Jun 2026 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780938529;
	bh=/0GJTDBh/MD/d14+3u9UGKrowieSpMD+zXmXGmzr+q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nD2mQg0fhju1dfji0kdWiAQ5giTFzUZoam15hCsbWNoAIXhJ37wCCC1bax+AEpTeF
	 9la3fyn0Fp0SzRWydFxQLCPvecAYmcYYl/5Av4h/KiYoVrkGWUeFwaRc05VAPK63wS
	 SYwm8NuUrL0VSa6/EifTKJYAgDTuWEzX3vxPCKU5M/jzA/2Ey10A0k70VB2nyZ58UT
	 /Fkf9wd7mwlGPjxxULYyJI5m4dZ0imoP1+hutfyq/vc+Dh3G5fMB7R2IIygnUqW2K5
	 0HEKRbmbt3a8wfU036R1gXe44yPKwaR39agmurlaz158OhjpqhrTeKN5zClx5kPcf4
	 Lw+dKc4XwLTew==
Date: Mon, 8 Jun 2026 18:08:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: tegra238: add missing AON pin
 groups
Message-ID: <20260608-superjet-quickly-4f2a9257403b@spud>
References: <20260608094122.1245189-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0Mg1ODc3b8jbJRL"
Content-Disposition: inline
In-Reply-To: <20260608094122.1245189-1-pshete@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pshete@nvidia.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:arnd@arndb.de,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38116-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,microchip.com:email,vger.kernel.org:from_smtp,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B92AB659275


--T0Mg1ODc3b8jbJRL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T0Mg1ODc3b8jbJRL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib3HAAKCRB4tDGHoIJi
0qqRAQCAOu4hYQD70Oko2KJXzZ0mQg5jo7hBcup/ZYf4RYiEeQD/aobV132Qm2kc
FD0aH0cSyhgNUaxkgro3h7IN22ZmMA4=
=p43V
-----END PGP SIGNATURE-----

--T0Mg1ODc3b8jbJRL--

