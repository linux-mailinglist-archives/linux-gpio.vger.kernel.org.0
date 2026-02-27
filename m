Return-Path: <linux-gpio+bounces-32327-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFVMCwzZoWlcwgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32327-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 18:49:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E751BB9E3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 18:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFA553035D51
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 17:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA8A44CACE;
	Fri, 27 Feb 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFlc3WsZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A82144B68C;
	Fri, 27 Feb 2026 17:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214195; cv=none; b=VUDGbYoKzRJV3Q+AMgzkLaH1TupIeKrbpNw77ouB+H9dh0BAZ/7Fxr+elKwFZdMnO0sLXBvGO/8PX19br6CXmK4Mau4hIMAN0SLFHv3l71C1wMC+4flvnnByyO9vxY6l6PTIjV2tQeVkrIwGBnUyaSUWLtWpI5gkMZdpzgnC6EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214195; c=relaxed/simple;
	bh=nK5MybJn/XvDpajqRRToeWC1XErQ1cBYZqWZ3L55jIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDjC57BUl/HdOOFt14r6b14fvBynitXEAmx8fGpRA7KF6rJ+0wVXvKmNw/Mmz2wL8wjE2Vx5vuhRgM60KgMRpQAKwIYHEjMOLedFdMFfPHKiZJbXMBCnJPR8mF56/cVDRu+RX6YZV5d24s4EDGqKSPWDWy5kU4ny2ekoceQ+dtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFlc3WsZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07EEC116C6;
	Fri, 27 Feb 2026 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772214194;
	bh=nK5MybJn/XvDpajqRRToeWC1XErQ1cBYZqWZ3L55jIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFlc3WsZCFn7wxvkkE6nVyurfXEdP194XRm4ohkbVDAsskyFtWeGO/PXhWI54reyq
	 A1R2KkazcmNN69o7DkH3aKOLIJd9HLsk8W0Se9+xQt33GqykTgFBnjSQa55YkEQtR8
	 qINBB0lvTjZMUHn+DagtwoeAa1ZqOvJ8K4UqIjVzkGqbAkj9TXP9CEpkpZ3ePV2KrY
	 qZlxLm4/uIrxR3F2wJtM4TxyAd4c/4vQOEsEBbtjLyCjRLxTT2akotktNuefTml+ti
	 lak0WXV6sppqyEDO8Bnjp6S1Rm4cfd5G8BoqrEK4y67i1+WRc0HMmsE86NtqqePqDt
	 RSzQA4FNSCfkg==
Date: Fri, 27 Feb 2026 17:43:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: marvell,armada3710-xb-pinctrl: add
 missing items keyword
Message-ID: <20260227-baggy-blinker-049989803a36@spud>
References: <20260227-a3720-pinctlr-missing-items-v1-1-e476e4df1ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6YJUzQ+JEhq2LKUP"
Content-Disposition: inline
In-Reply-To: <20260227-a3720-pinctlr-missing-items-v1-1-e476e4df1ad6@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32327-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bootlin.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,0.0.53.232:email]
X-Rspamd-Queue-Id: C0E751BB9E3
X-Rspamd-Action: no action


--6YJUzQ+JEhq2LKUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 03:15:54PM +0100, Gabor Juhos wrote:
> Even though the type of the 'groups' property of a pinmux node is
> specified as string-array in pinmux-node.yaml, but trying to use
> multiple strings causes dtbs_check warnings.
>=20
> For example, checking the following dts ...
>=20
>   $ cat arch/arm64/boot/dts/marvell/armada-3720-test.dts
>   /dts-v1/;
>=20
>   #include "armada-372x.dtsi"
>=20
>   &pinctrl_nb {
>           pwm-gpio-pins {
>                   groups =3D "pwm0", "pwm1", "pwm2", "pwm3";
>                   function =3D "gpio";
>           };
>   };
>=20
> ... results in this warning:
>=20
>   arch/arm64/boot/dts/marvell/armada-3720-test.dtb: pinctrl@13800 (marvel=
l,armada3710-nb-pinctrl): pwm-gpio-pins:groups: ['pwm0', 'pwm1', 'pwm2', 'p=
wm3'] is too long
> 	  from schema $id: http://devicetree.org/schemas/pinctrl/marvell,armada3=
710-xb-pinctrl.yaml
>=20
> Add the missing 'items' keyword to the schema to allow using multiple
> strings without such warnings. Also adjust the indentation of the next
> statements accordingly.
>=20
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: c1c9641a04e83 ("dt-bindings: pinctrl: Convert marvell,armada-3710-(s=
b|nb)-pinctrl to DT schema")
pw-bot: not-applicable

--6YJUzQ+JEhq2LKUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHXrQAKCRB4tDGHoIJi
0vv9AQDKh/I4FbujKH6JgScXHVGKSkwuqogOuVHDUnt9bSyFeAD/XK+1OQC92k6C
8Pk7BLlg9HBnVTH1H+71AzHkM+h8tA8=
=wgpI
-----END PGP SIGNATURE-----

--6YJUzQ+JEhq2LKUP--

