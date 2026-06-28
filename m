Return-Path: <linux-gpio+bounces-39077-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 54vRHmVzQWrEqwkAu9opvQ
	(envelope-from <linux-gpio+bounces-39077-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 21:17:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E7A6D4BEC
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 21:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iIzqZVXQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39077-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39077-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB7803013693
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 19:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC5C31328C;
	Sun, 28 Jun 2026 19:15:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5783C2135C5;
	Sun, 28 Jun 2026 19:15:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674131; cv=none; b=j8Z3qZSKssPXU+7XsmNw0Cdyiau1K7slmBgAtJwxvFJTmzueeKV4ctWPROSUkE0teEjsJcJlMbtP7XN6/YmD+TK9Ln9AdOCV243hzQpnjS5cbV/AAZ411Slg+VwVMGxG0PhcF/pWILYFZfHCPKxRQPcFz4aPyHWevAO0LyryEOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674131; c=relaxed/simple;
	bh=vNBfH7pgd+8imyLJXcUqHGAV490VNS2A7UsIcU0kC+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YV4zoW7rs4zAiOmADwsVzxFX7uPzDCvp3bmjc+3+6k5lz6/qW7ycdDf8WcWXJasI0JM2GkTn/5FbjiD/pF5Tkf6+EwixoKmm+kA7JMMJBejSj3+P8wUepAA8qpzEY64Yv0BK1dTIK0ZwmZZmnA0syXQ7IdXaaTMRe2guBFP97aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIzqZVXQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504BB1F000E9;
	Sun, 28 Jun 2026 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782674130;
	bh=XxvgHWh0eQuIndRLsQaT1KKb6oiwdrh7l2i05NrIeJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iIzqZVXQIcHzIves2M+OO318TWw//MONsNcnEmnJN2AUPvn1LUAGO5cyOcZJDuZ2u
	 mwSi4uQPIVvUcJuTxcC4RVerKXEC4gd+CpxiE7HOHPJ1MTXCb1tHeyZO8iGgNGdlFR
	 Eq8t7QtzoXOjBFgab7OHQvWv0WoiMmXRyu0/oDEanbFvgzr5aVZfZMGAC5vL+Nmvnl
	 T4hb9/OWG1zkbrtK2nwv37pLchSkS9OtqE7zp8iXLUEXOR8UFISrRwHbp4ACihKlHX
	 HlWzrmvGFgDOZL/oGwNfiAyec7Q0kfZWxYsiNbv6Pr0Gs4q6GmofsovHXEdy84Ts+D
	 UUuLbsyx5R/gg==
Date: Sun, 28 Jun 2026 20:15:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 01/17] dt-bindings: pinctrl: airoha: update/fix device
 tree binding schemas
Message-ID: <20260628-pronto-stash-ea7ff79bd0d3@spud>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-2-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lPGuEethiyCynXtY"
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-2-mikhail.kshevetskiy@iopsys.eu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39077-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,iopsys.eu:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0E7A6D4BEC

--lPGuEethiyCynXtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 05:37:17PM +0300, Mikhail Kshevetskiy wrote:
> This patch fix several misprints and sync device tree binding schemas
> with actual driver code.

Please split this up and provide some explanation for why each thing is
incorrect.

pw-bot: changes-requested

>=20

Missing a Fixes: tag.

Thanks,
Conor.

> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7583-pinctrl.yaml        | 37 +++++++------------
>  .../pinctrl/airoha,en7581-pinctrl.yaml        |  4 +-
>  2 files changed, 16 insertions(+), 25 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.=
yaml
> index 79910214d9b5..f52802a3ad79 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
> @@ -61,7 +61,7 @@ patternProperties:
>              description:
>                A string containing the name of the function to mux to the=
 group.
>              enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
> -                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
> +                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
>                     phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
>                     phy3_led1, phy4_led1]
> =20
> @@ -159,17 +159,8 @@ patternProperties:
>                properties:
>                  groups:
>                    items:
> -                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs=
1,
> -                           pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
> -                  maxItems: 7
> -          - if:
> -              properties:
> -                function:
> -                  const: i2c
> -            then:
> -              properties:
> -                groups:
> -                  enum: [i2s]
> +                    enum: [pcm_spi, pcm_spi_rst, pcm_spi_cs1]
> +                  maxItems: 3
>            - if:
>                properties:
>                  function:
> @@ -207,7 +198,8 @@ patternProperties:
>                           gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
>                           gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
>                           gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> -                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
> +                         gpio48]
>            - if:
>                properties:
>                  function:
> @@ -288,17 +280,16 @@ patternProperties:
>              description:
>                An array of strings. Each string contains the name of a pi=
n.
>              items:
> -              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, sp=
i_clk,
> -                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpi=
o4,
> -                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, =
gpio12,
> -                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpi=
o19,
> -                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpi=
o26,
> -                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpi=
o33,
> -                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpi=
o40,
> -                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
> -                     pcie_reset0, pcie_reset1, pcie_reset2]
> +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gp=
io7,
> +                     gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio1=
4,
> +                     gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpi=
o21,
> +                     gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpi=
o28,
> +                     gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpi=
o35,
> +                     gpio36, gpio37, gpio38, i2c0_scl, i2c0_sda, i2c1_sc=
l,
> +                     i2c1_sda, spi_clk, spi_cs, spi_mosi, spi_miso, uart=
_txd,
> +                     uart_rxd, pcie_reset0, pcie_reset1, mdc_0, mdio_0]
>              minItems: 1
> -            maxItems: 58
> +            maxItems: 53
> =20
>            bias-disable: true
> =20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.=
yaml
> index 21fd4f1ba78b..12dd85b5b410 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -166,7 +166,7 @@ patternProperties:
>            - if:
>                properties:
>                  function:
> -                  const: i2c
> +                  const: i2s
>              then:
>                properties:
>                  groups:
> @@ -208,7 +208,7 @@ patternProperties:
>                           gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
>                           gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
>                           gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> -                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +                         gpio42, gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> --=20
> 2.53.0
>=20

--lPGuEethiyCynXtY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakFyxgAKCRB4tDGHoIJi
0g6dAQD9tb4JAvk+3o+T9mnLzjVVmU+dF8yfrer/nFDzCEl+KgD/fvB+Le8z8O7A
aGEIjdyyNk8gIeUK6sG087pH7fwRLAg=
=Qf7e
-----END PGP SIGNATURE-----

--lPGuEethiyCynXtY--

