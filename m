Return-Path: <linux-gpio+bounces-36234-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD+AE+4c+mkJJgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36234-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:38:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A474D1706
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04B103062966
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 16:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A52449219B;
	Tue,  5 May 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4XvgNZB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A748C8D4;
	Tue,  5 May 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998888; cv=none; b=Rnpqsldm+LcT4asIRzVbvdX1aqBLuwX+maUNUpUQkrAtfOh5/7cV4ZN4dm4dglWAAZZYYPe82IPsHBuw3UGUDd1BI8hX1tpqcawJ/wQIQP+ZxjsZMCMMS1yPPEWad3V5FelVjadMCvBqiv8jjL6m+EQQyE3UAtwIPzDREVV/jos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998888; c=relaxed/simple;
	bh=qc984VXNHHvC32RbVpZciAuAa/2I+jDJaKhXFjRVIoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgehlKa/GLJvDHtzC8He9cWFkOlVxyXbmJub2uzLwzCEE+eVF46XtaWXl8jCs+FQhOH1ZivGlmfb09GdYSmGtG7RQOTKAznB29+zIxVOY6PD8Rf31jY7TLteledJQ12DY0UbmD6ZqEuDMyPGK39kLOEeLdJViu3xgAWxeR3g5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4XvgNZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8365CC2BCB4;
	Tue,  5 May 2026 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998887;
	bh=qc984VXNHHvC32RbVpZciAuAa/2I+jDJaKhXFjRVIoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4XvgNZBsgCRfI+PCO7pm1+0tcFxLJEShRVaxqaEwJ4YewLMTdPdfJInXjgq17mkn
	 DGFKbFuvmgSbp9BVVGMKssOjtjrguhyK5wEE3BKT+QNr7QZNqMdy8ueFYRv/x5/ZW/
	 fV6iWw7Njq9sFtKat6sQ87zbHdE/iqX+eAxWEcV4wZ+/HkIQR3ZI9X54xK9hIjOkdL
	 d1WGnjkVMXMdxwJtI+Lcq+y+KB4JsCXg2l7V6fRL6LZgDoMuU/p/+4bunjW6wnJYLN
	 YmCA+FPdAS9O/xJEtox8NHcaNYMaDk88A84BaP+wwg1685BzErBCXwqMRTf+M0ee/P
	 R3lpwodI/gGsw==
Date: Tue, 5 May 2026 17:34:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hui Liu <hui.liu@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: mt8188: allow gpio
 hogs
Message-ID: <20260505-entrap-overlabor-15836ee436fc@spud>
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DIsZuHi93grM9P+H"
Content-Disposition: inline
In-Reply-To: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
X-Rspamd-Queue-Id: E7A474D1706
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36234-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]


--DIsZuHi93grM9P+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 03:27:47PM +0800, Icenowy Zheng wrote:
> Add gpio hogs subnode rules to the MT8188 pinctrl binding.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DIsZuHi93grM9P+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafocIgAKCRB4tDGHoIJi
0oWrAP9ygttj0OCwT6Kkpp4slmIox190glu7Na3GGLYJU7155gEAnwtli15+pvtJ
d2IHidMAeYSwm4RxD/ajJKUli4W65Q4=
=iZ4S
-----END PGP SIGNATURE-----

--DIsZuHi93grM9P+H--

