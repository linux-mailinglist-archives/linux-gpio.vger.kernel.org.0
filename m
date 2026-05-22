Return-Path: <linux-gpio+bounces-37375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAA7JtiBEGoHYgYAu9opvQ
	(envelope-from <linux-gpio+bounces-37375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 18:18:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263A5B7801
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 18:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF786303AF09
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 16:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A211C421EE8;
	Fri, 22 May 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1v/paEF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8091525B0B8;
	Fri, 22 May 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466285; cv=none; b=fWJtxiT+w8SobH3DFW52vv2HiyVL8brUgkKyLodW7Oex0UWT5ysWcwS507bBxiOEugra8Oc0WjIkGeyllbpajL8LmA7DmWSRjN6UfT3dqFjzTeeHy7CfTIUuLYypE2lTbqxD4zsnR3k6GU/AqOIoKz1nGnOtTnUcA+99odj5DcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466285; c=relaxed/simple;
	bh=l/0ph60wK1b/8hBnU0zo7I9suFDL3YU4gSyQBbL6jOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ+eiExhiqvM5x6fRMQzoMzi26+a+b5bnxOzHb+8py0QqICgKS+RBBgr3ooGKHPSwU5/n8oY60uiDDjJud/0dp0gVs/mdG01rM5sRauvAGcsUAS7gULS7waO1n7I81ndYSdzSTTyou6AR8RVG0j26lysGG3JKA4KZwHbfDN2HVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1v/paEF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9861F000E9;
	Fri, 22 May 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779466282;
	bh=l/0ph60wK1b/8hBnU0zo7I9suFDL3YU4gSyQBbL6jOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G1v/paEFnQDWmWr7592Vaqg7lJJ2ZKHzb94Emkxs16TR7eJAIrtlgTeZ1GPF2+no7
	 2BlFG1DeAbVEHxVluwNjjpM+4vOrCoetL5T8Ths7J5fsztE/332B3PyfZ+YLH8qJKH
	 wMayQ8XO2RabaghegUEjjaeSKSbAOK6KUA2CqXbNu+tDrT+XXFTKFpGLqn5yfFmcmi
	 7ANpOIkRvQfFG4aY4844RzSQOssphqn6b/54k60NyxiyLx15zZDEl0iGqYgG2buy11
	 MK/HYQKIvoKMFIXYV1d9G0S/d/NvpwBFVaeJZSE6wDZ5RHx+2IT3w1n/CPM/N6psK6
	 cAOkLrK7nKMtw==
Date: Fri, 22 May 2026 17:11:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	wsa+renesas@sang-engineering.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 5/9] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
Message-ID: <20260522-scorecard-acclaim-64c71da9c134@spud>
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org>
 <20260522102251.1723392-6-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/H13k7LZd+GcPpfi"
Content-Disposition: inline
In-Reply-To: <20260522102251.1723392-6-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-37375-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,sang-engineering.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0263A5B7801
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--/H13k7LZd+GcPpfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/H13k7LZd+GcPpfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahCAJQAKCRB4tDGHoIJi
0u7NAP97YZhrh+Jj6OlKfx33P+yxv5JrCQPh4BfqSrQ/kEBscgD/UoqRkzW89bSW
5V8oNpyEx9KJ07iaWsRCvbOj8oEpIQ8=
=C7TB
-----END PGP SIGNATURE-----

--/H13k7LZd+GcPpfi--

