Return-Path: <linux-gpio+bounces-31310-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMA2CM+be2nOGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31310-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:41:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8930B31C1
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83C4630364EF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042C33542CC;
	Thu, 29 Jan 2026 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0P7aJBS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92AC340DA7;
	Thu, 29 Jan 2026 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708455; cv=none; b=UHWfhJAOJBjRgfcEZ3AC3nam9Iidy+5wNLZMRMtvQFooLo60BFtvjfRotHYr8OkG6I4uSoDOAt8jInmOMMHj5cupRnn3QHOaH9jaamYeigjHfmYq73w3/GxacI8FNB18S9xYHMe99N/YtR7jO4YDNlTvO8iUeo69gasuXndOBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708455; c=relaxed/simple;
	bh=riaehu2K+qypHcxcuQkXj3bj/V280EGgJlo0DMCt0Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNSmQxgLMn4fI4d2G6e3UYiD0xC9CkY1am4JUBrQfd++/iDGG3+hxSsike5dNwR6zQCccC10KiAnb+8I0MzsIYeN66pjqnC8jz0Z6n9pGxvIPwbPBDtyEp/tk3bHO6jHOmsTZaHtoOrwMG+ROy80PYgtvuLBsrTs5CJ3tKJ3Cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0P7aJBS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B714C4CEF7;
	Thu, 29 Jan 2026 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708455;
	bh=riaehu2K+qypHcxcuQkXj3bj/V280EGgJlo0DMCt0Uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0P7aJBST8Yfbt3CSM622oHnQAsIRysoJ2nKLJYBpm5bnBjcor6ISWEVH29fXjfKT
	 Zb5dP09LKnc8mgkQt7L1cxWaTuNxtR23YhWMf1bP6HJtWO7PacoFzwlsy8j6uclhB0
	 vhPIN6OjxRxUm/PT3cC1INr9Y4PhtVg6TzNnh4gMhCyNP0/pXp4wdfxIZ/V2TWxJBE
	 KFJcRrLsPtBLoqIJH6eJIbNQXabulJNn26pDzEyFvGFeeKDH2KZatW+qucDarH1mxj
	 J6VZm4KxaAuuNCxiWyOx56kmFVdZPs9jMO57/2BlLI5EPr9LjCcNCMSPk6lFKCtYtG
	 ec3wSz+I8P5vQ==
Date: Thu, 29 Jan 2026 17:40:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 2/9] dt-bindings: pinctrl: renesas: Document
 RZ/G3L SoC
Message-ID: <20260129-underpay-emphasis-1b24619b3d66@spud>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
 <a040f07000220605875775161b51f34bebed8a67.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TzYFgJkBV8dQFHnU"
Content-Disposition: inline
In-Reply-To: <a040f07000220605875775161b51f34bebed8a67.1769681553.git.biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31310-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8930B31C1
X-Rspamd-Action: no action


--TzYFgJkBV8dQFHnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TzYFgJkBV8dQFHnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuboQAKCRB4tDGHoIJi
0njXAQDSVLO549O9CBP+z2vZ7uYYEcgo8aLk1J3adxqyIfDCQgEApgehG3606jQ4
ALI79949/qpvmv8XiDPl3acpGIQYngc=
=+LVe
-----END PGP SIGNATURE-----

--TzYFgJkBV8dQFHnU--

