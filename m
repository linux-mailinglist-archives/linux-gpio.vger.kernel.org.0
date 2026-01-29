Return-Path: <linux-gpio+bounces-31309-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGerBLWbe2m5HAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31309-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:41:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A44B3173
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C68630234F5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9381E3542C0;
	Thu, 29 Jan 2026 17:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf+22fm2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544E5279DCD;
	Thu, 29 Jan 2026 17:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708439; cv=none; b=fG8LMLmLZrCsc3JKSrJDO5gnKnWlpb8hVULx4jyodMqEgJxIvIeOoObVu+Fl2W10nuhL6saN1SWgEsBwuIZv8aYepj2Rgb9AnGJrz1Ng8u4ILts69+8xA78ILGBrnCKEXWLfwJ0QbbVNGx9e/LqF6080Xjs/czX93M2nzJPy/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708439; c=relaxed/simple;
	bh=gCjwA3hE/GnvpZ10EZBDQacrzRoWrpJ+prNQ7EUtPrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mv+/Ep+qb9wA+Lsa72Xy12U0ImaN+RCUGrIDNcAHvzTL/pMaHaW7jGpYRueNkQXT4n6dgEw4eWCmnVttCQusS7Eih7epcX6KEx9zkGEzpgezdo+fZKrepAtZoB6SMsdGQa+EWeT4EEX/PLiPX6tksw/3zjDdS1BgL1uUeG1XeDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf+22fm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8152C4CEF7;
	Thu, 29 Jan 2026 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708438;
	bh=gCjwA3hE/GnvpZ10EZBDQacrzRoWrpJ+prNQ7EUtPrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uf+22fm2XSK0YryLMKf5yTP3f7H1Y4rrCbsVCsZV5KS946E2ib8MmzC9xVVgVxuAO
	 k3AdHwexgWmGgLrYQ0ZBLzEkCWwXKtuBNLEUnb93zD0h91LVblInbr59hnl8la/MBP
	 OdP5n1nBC4Y/V0mhrIBOk9elKaDsr2odGFritBtuEosFkpdnWJVBWMyftJ09GQveeH
	 wPBdUfbaEnPcAED5kB/jI2aAT2e1/bbRH7yERem1pFS+seCLzh0kRO0D0MrodnGdpr
	 XLvzcSHwGIhBlsyT/9HY52nYFqorQYf392ojNMQNLu1QKYE/AoMvQI0CpqLfnJPvKa
	 hRe7yBdSpRcAw==
Date: Thu, 29 Jan 2026 17:40:33 +0000
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
Subject: Re: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document
 reset-names
Message-ID: <20260129-skyline-romp-e81f8ec9ae1f@spud>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
 <e70c010cb8c599d342807af146bd5c2a6d6cb4c5.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ELZqKEquqy7vHuA"
Content-Disposition: inline
In-Reply-To: <e70c010cb8c599d342807af146bd5c2a6d6cb4c5.1769681553.git.biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31309-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5A44B3173
X-Rspamd-Action: no action


--2ELZqKEquqy7vHuA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 10:16:36AM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> All SoCs has multiple resets. Document reset-names property.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++++++++
>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi        |  1 +
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi        |  1 +
>  arch/arm64/boot/dts/renesas/r9a07g054.dtsi        |  1 +
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi        |  1 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi        |  1 +
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi        |  1 +
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi        |  1 +
>  8 files changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.=
yaml
> index 00c05243b9a4..fbbba53cde9b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> @@ -78,6 +78,16 @@ properties:
>            - description: PFC main reset
>            - description: Reset for the control register related to WDTUD=
FCA and WDTUDFFCM pins
> =20
> +  reset-names:
> +    oneOf:
> +      - items:
> +          - const: rstn
> +          - const: port
> +          - const: spare
> +      - items:
> +          - const: main
> +          - const: error
> +
>  additionalProperties:
>    anyOf:
>      - type: object
> @@ -152,10 +162,14 @@ allOf:
>        properties:
>          resets:
>            maxItems: 2
> +        reset-names:
> +          maxItems: 2
>      else:
>        properties:
>          resets:
>            minItems: 3
> +        reset-names:
> +          maxItems: 3

This is minItems, no?

--2ELZqKEquqy7vHuA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXubkQAKCRB4tDGHoIJi
0vXVAQCgVC2FzAAm9cgjpn+Zq3lguj4voCYomAaRBfQa+BIT+QD5AaFUgkOYoCXx
dBvCZTsoYC/c5UjWubiSVut3QkslGgQ=
=IG6/
-----END PGP SIGNATURE-----

--2ELZqKEquqy7vHuA--

