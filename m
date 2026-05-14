Return-Path: <linux-gpio+bounces-36862-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yInUOC8WBmp3egIAu9opvQ
	(envelope-from <linux-gpio+bounces-36862-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:36:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 867C1545ED0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BA3F305B582
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C30239C63E;
	Thu, 14 May 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rlj98AlD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E77439935E;
	Thu, 14 May 2026 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783753; cv=none; b=jRnsGsHqwcUMSQPZloUE1TtH1BK1XOCWbAHefjZMiTf3ejHKrv6icO5o4sy9sUHKtDAzAcwIFI7M5z8N6mlE9bw91zSMNBp/OdsGzllRfjR+Hx978Nc1CWU32vuKVABy/JfTNPToJMyjjPrvQ/ZxVMkRjPMyqTy5KhcI79LBh/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783753; c=relaxed/simple;
	bh=LpfA4YJLp82nKZ7j8ERgicnB0lfPbUUdobv0xO2bWZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8ZkcRnMZEYIBm38th4bCDGalZDAv+FgDXuXxI2sgIpqxKOGEKwdf12mijx8HeKuAxlvYNJ7CcqrnPSsnbzJNgVwyxvj5k0KoKaT3NkuAHqGX1X8llCOXoOkzOF4J7Un3yBB3eEas074+L7YEOP1fKDmnF9waqO1Lx2bAdTLISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rlj98AlD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5989C2BCB7;
	Thu, 14 May 2026 18:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778783753;
	bh=LpfA4YJLp82nKZ7j8ERgicnB0lfPbUUdobv0xO2bWZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rlj98AlDQyTeX12JFgkt/ly0N1n9zIuDvPKybIPVZV+gTnzr92YhV/WrC0y+W9XG0
	 TxPVEtSqK55DC9fVH/X2H5It9iRxxz7g+6JVykf4k3iVBtY6F9OJ/jq2hw/uMnWTda
	 EKQB6r8olDKz1si9FcAnQ9+8hOnZ38AYpp+Oh50hVMVbTDg6pj63qJVlSMU41Ld9zI
	 4WDlfk1PxECkRORw7/Bah9ag/IamZ774oZkfPNVbJ+TssAlDoP46GOdsC2luZgqNXr
	 RKzp1Um7JQPXc8gJV5qWIl0He2UMvbNe21rH2A27SrHYUXaoLj086hWkx/uYudyaj+
	 jGi+GaYj0+phw==
Date: Thu, 14 May 2026 19:35:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 01/22] dt-bindings: pincfg-node: Add property
 'input-debounce-nanoseconds'
Message-ID: <20260514-petted-onscreen-0e588a2d1023@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pWLjzhTOBnTrZUGw"
Content-Disposition: inline
In-Reply-To: <20260514111218.94519-2-changhuang.liang@starfivetech.com>
X-Rspamd-Queue-Id: 867C1545ED0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36862-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--pWLjzhTOBnTrZUGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 04:11:57AM -0700, Changhuang Liang wrote:
> Add the property 'input-debounce-nanoseconds' to specify debounce time
> in nanoseconds as an alternative to the existing 'input-debounce' which
> uses microseconds. Make the new property unavailable when the existing
> property 'input-debounce' is selected to prevent conflicting definitions.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../devicetree/bindings/pinctrl/pincfg-node.yaml     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index 97dbce8a261f..4db66cdf438c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -104,6 +104,11 @@ properties:
>      description: Takes the debounce time in usec as argument or 0 to dis=
able
>        debouncing
> =20
> +  input-debounce-nanoseconds:

-ns is the standard suffix here, and if you use it you can drop the ref
below.
pw-bot: changes-requested

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Takes the debounce time in nsec as argument or 0 to dis=
able
> +      debouncing
> +
>    power-source:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: select between different power supplies
> @@ -214,6 +219,13 @@ allOf:
>          input-schmitt-enable: false
>          input-schmitt-microvolt: false
> =20
> +  - if:
> +      required:
> +        - input-debounce
> +    then:
> +      properties:
> +        input-debounce-nanoseconds: false
> +
>    - if:
>        required:
>          - drive-strength
> --=20
> 2.25.1
>=20
>=20

--pWLjzhTOBnTrZUGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYWAwAKCRB4tDGHoIJi
0rIOAQCBZn1RMJo851Cn3cOWdtjpvbrU87prJ18Ys3d0fR3dMQD/UMn0zfMmTLW1
R5NuaVy2a1l4qhNVvCtgC33sqC0w3ww=
=GXnu
-----END PGP SIGNATURE-----

--pWLjzhTOBnTrZUGw--

