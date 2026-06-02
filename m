Return-Path: <linux-gpio+bounces-37839-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E6x/JgpDH2pQjQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37839-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 22:54:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B989631EAF
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 22:54:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="EwbirL4/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37839-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37839-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BC0D301947E
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 20:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E429B3921EC;
	Tue,  2 Jun 2026 20:51:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450AE3859D9
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 20:51:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433463; cv=none; b=F24OgTE1UNRj/rG9cZqnIKYPFWltfBqxiVmOn6Dsw+2+3GecTj6vtO9tlXk+26qGp35zXlhZ31xuABFt+mscQU8dxNhOyRhDcS9PkyW9FmYMlTFltFwcZepgvNcq+c3YPMlqxdiCLTTLoO2AQ/1+wJMM5Q0hwF7Lay6AK5a/b8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433463; c=relaxed/simple;
	bh=t0XhOPPzbBBjRUYZlPIVdjtdSD7UwN/nSJ/GWX223zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujPsmOkU1ieDPFaXA/RBGQgM078xa27fXKkw6U4L5A+RcS9oUSnC3PzZUUbgtFnmqGFtWlgj3zjuXsb/hkUrNzS7g2k2tdgkCjbQgLEM0nbaMna/gkECexXgYZcujOIt8SBttZyOeQVoZGqj0laxzZ0OznZC13aIGoWoSC9vQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EwbirL4/; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=t0Xh
	OPPzbBBjRUYZlPIVdjtdSD7UwN/nSJ/GWX223zY=; b=EwbirL4/E/LMUEqYs5MC
	6GJqZiSm7DByKw3SeKwV89eAzSJE+iB/kWeoBxqSmNJq0OSGWZFevIGtZY9xu+gU
	0Q58OGabcdGMLcl82xOVtbxVPjd6ugoOv5oIh7q646XY2O5/wdr0ouowSxrMvcfX
	+D+mnglUDnIYdpMhA+ThL/XoDK5Y0n6gkA2e3HmrZL2NnllifPQS0xgwooprlabh
	GET+zjQcBUcXl9KjXIF0AO9oiujZAK72pa64Ixh458+IMJXq7wp54qqNV+4hgDZ1
	zYPek4kzwESDaB15CDyAfwnhAzs/7WM6hazhnlszpzALA1tDn8oyop+Kvhfi0XYy
	4Q==
Received: (qmail 3020255 invoked from network); 2 Jun 2026 22:51:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 22:51:00 +0200
X-UD-Smtp-Session: l3s3148p1@+uHud0tTItkujnv7
Date: Tue, 2 Jun 2026 22:50:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 6/7] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Message-ID: <ah9CMwvwU-5-xGxx@ninjato>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-7-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQeUdzF8kAPxjjhC"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-7-claudiu.beznea@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37839-lists,linux-gpio=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,sang-engineering.com:dkim,sang-engineering.com:from_mime,sang-engineering.com:email,ninjato:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B989631EAF


--qQeUdzF8kAPxjjhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:38AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I don't have 1.2V targets here, but my 1.8V setup works fine.


--qQeUdzF8kAPxjjhC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofQjMACgkQFA3kzBSg
Kbb/xg//a8+JvrsX08NvY6X6rc5nFsZd8qfjokKYeieark5f6L5XhWBqPbMDxTX6
7CdGJJ/lga2n4SiiO+l/rq8e97khKXix2psIdhOx8x+5KlMNySD1ZDiEBiHr9pSc
jtxx6jTUHSvuhchZI7oEL3WVZcJo/yiTCiuNx7pZas1xvGQlOMONANkaajNqmHTf
jHgxi2YS0biE25h2AvgmQaoVWCQFse6o+FsqsuGfmw7t9NsHDyBBj+DpW16gs9P3
chAWyniV8zyjQbMdiVl3mEkOBxB4TrdbVUciKzW37qB3MVfvmuop2rHDy16oGDGz
r8f6g5AzK/ogwtG9FwKfq1QVuGxjUDeAYz6UShkls7xAhqpMwO0Y0qJ2rs6nl44m
4fsrxN4TZFttbgK6MdkR2ha9IJdgVFyo0L78QddLBCu/UzL8L673qY4mSk1Z/HWD
pu2a0HRSRugtjpNl6/sLV1ntkkDnFTmzd30TxWgv6RMlKvMIqB3X1CNxPeYuJd7C
yUcVc5YXmhBiUPH4/kYKwrgs4m3bU62By5JyPOQNMeNgAAH1uyFtMdbtKTCS1QkX
NTik/iLPqs32gJdaqE62J18E/JIGmf+gpVbNNYcBjWPT3eT5IPgEDF/1u7oNq48k
VcoraWXlpTsCf/7BmWZtxX7xLOZU+/usMA9d5OqiPSISPJ3D4G4=
=RDpf
-----END PGP SIGNATURE-----

--qQeUdzF8kAPxjjhC--

