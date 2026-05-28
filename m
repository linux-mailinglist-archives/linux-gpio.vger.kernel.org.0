Return-Path: <linux-gpio+bounces-37636-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMBrAmkmGGqZeQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37636-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:26:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8595F1429
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 13:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F7823019F1E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FDD3E314F;
	Thu, 28 May 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Nt5pHjo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535BC3E315F
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779967416; cv=none; b=o951z1A75ZR7koiw+WZkjhrPXfqwMZoNvs79KMemnwm3vAzpj6x9kxXROid5AUcjXcz2ivU+xO9M+xi/+I7qGGTxq630z7oHjtMbwgkNZQdSWn6uZvbvNeD1WZ1y2oj3VxWC1a1JZGIdXJYL556F+H3yCoETlg9gSuTJcGw5cgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779967416; c=relaxed/simple;
	bh=l5FsbVUeeQ6Z8104p9jzlTHOFbAQdAtKndUBCvJN6oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPeiXngN4FYWtNfDk16kW9IeXCrY2oC4NnG0+qJPnIRWnmQvnpHgRqeCRBv7pDeUxyALfx1wTJ8eg9F9dFXD5aGJWIXGiTi04bZk3ljPK0wgwQAhRKy+V5h6a4XF5RhyRYYAq/WkdgawCDE120iFoh5HwKKmg9I6TSrqSryZEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Nt5pHjo4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=l5Fs
	bVUeeQ6Z8104p9jzlTHOFbAQdAtKndUBCvJN6oY=; b=Nt5pHjo4NFXN5aiABN33
	GeQl8fkTGbT2Y34YD0km2SWu7rwia3AEG4a1T1EfbN6SaX04FkuFeppPPUrnjlBM
	wCO4F+gboRJt+dI3nAx69PWMX4TJtyPyb40bn3nMfB/ZVdBPVuIL8fmBaoCxPY26
	Q8pHrmXuV/wSZskXeRbxo7e/RX6fHG5Ff6jeOGSnW52BpH+kW3/PPy9cVNNeut0k
	BAsc7wL2um1iLN6v6Y2bVQ1vIw69icajX4uTTQynnaaohI4HTbn++FfyTw+hh1Rd
	CGv+6mem4dsLvu7Ids/kFn6fScWCy3cqcqzcUkKy/R2q0aR33FFuXPKQzuPNe4fy
	BA==
Received: (qmail 1010704 invoked from network); 28 May 2026 13:23:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2026 13:23:32 +0200
X-UD-Smtp-Session: l3s3148p1@uCZG9d5SJKxtKLEa
Date: Thu, 28 May 2026 13:23:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 4/7] pinctrl: renesas: rzg2l: Use tab instead of spaces
Message-ID: <ahgls0GHZ3Bz8nI_@shikoro>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-5-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rOOYGDQuanJlicCi"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-5-claudiu.beznea@kernel.org>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37636-lists,linux-gpio=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 9B8595F1429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--rOOYGDQuanJlicCi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:36AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Use tab instead of spaces to follow the same coding style.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Despite me being a member of "one space only" fanclub, for consistency:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rOOYGDQuanJlicCi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoYJbMACgkQFA3kzBSg
KbZamxAAqlpKBJ2d/EaK7vnssNbAaRFXBDAb0W2qaFNuvhSOebqXeD8piXusLym+
hVGlMxjpTR3dZmJKkYfqTCMb1Ov4uDH2EBMg8mAkr999xa45aio0NTpUJNRjyuip
htxw3TjFqga5h/WSPkWp9mzJQqPFMJb/w9v9HggK/DnqW9YRwm171VshC8T/uPlz
EZCFK/dPe0tF4KVxBe2ocoQHecIY7eI7JGbkNdX65v26G3C88Vc0/CfNbCAkEZUf
9RRuFu2VUUV+1bQLb4zL1QvqszWDYq/HjrCsF3c61YEiPdsURowrAmWjy6vH0WWT
JTpIqB/RFRxI8fdq8slmRg5+8niUCQkM6eSqL2SNBEhJaUg4O9RN4M0/zhdKcp/L
txhw1mxfJA58zbkgKRGLvU9Mc/GwzzAjfqu/tHieY8fu22QOYqUqkXoemg3uH6Ao
mOxoWkCrEJOboKefjid5nDryY2YsDjZ088fQI7Uah3sapHpkKVPu4H8GczxH61Ww
DwHkRw1ZXQeWo4Lv/W38QFRdT8wZva6u6OyWlvRBUgX6EEbhnlFb1OJ2LlNBqyqN
C5OPEF7GmGm6CrY+GN1/CneB/7It204w/Dk0PngWflfAaQrpTw2l7NO6KGp6la68
pzxd+cOrsnYBt7a2kNLq+9lB4wyMOAysGOQRTrUzH8UzfzcwOVA=
=UI8O
-----END PGP SIGNATURE-----

--rOOYGDQuanJlicCi--

