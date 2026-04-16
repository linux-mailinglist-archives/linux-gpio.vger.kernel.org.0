Return-Path: <linux-gpio+bounces-35200-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFYnHC0G4Wl0ogAAu9opvQ
	(envelope-from <linux-gpio+bounces-35200-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 17:54:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E314411430
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 17:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC1C030036D4
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 15:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D02D2ED846;
	Thu, 16 Apr 2026 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oj41PPQr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D46C257423;
	Thu, 16 Apr 2026 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776354851; cv=none; b=kwiw4l0inw/HN+YUs0SyKHHZAMKA5Kh3KRagjGDkS+EsWAdDSRroLqaH7CD6uUbDI2/Ic5JT6v9niL6Au0p65hLqpRfMT/Vvyx9WbAM99oSWEkBsG5QR4FG2XpoPRoPgE//Q3WxN6iMzWy96VEWi1ZOPgQ+iolueTQxNORG+tl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776354851; c=relaxed/simple;
	bh=A6PmtdwoxMFwfTIxnTYwHoYQS2S6o0smJnblGS/cOiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYO/dVfzEVSos3q6EDIVQll94Omjv0EgaPjjJ0dPN26h6pA3DqaMzqGjXPNY9DJCA7NuaruED1EOkpTGUd/pJ6eOGxkrH8EqEY22+40k7+Jvu5Q3nA3fnMkCtXPVdgDJlstoz+55CDdCsEpVFkFE54C49SnJBPhUJYrf4KdwXWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oj41PPQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DF5C2BCAF;
	Thu, 16 Apr 2026 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776354850;
	bh=A6PmtdwoxMFwfTIxnTYwHoYQS2S6o0smJnblGS/cOiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oj41PPQr4urm3jmdEHQld+x/hq5vcKf+0oRYTBilCdX6ioul/2rHuuqOaI588SFkM
	 j63PF99F+bmFIw8RsSLouiYzz4N25hKzx+inOkOCc0GrTulum2nJXqU8JbIGg/4Oqj
	 sG6MuwQq3eidTpb+kJQvX+jjv00YMyDSdDBab1cD5wYIxYs2B1e/0Nl9tbxVAwTsgs
	 FQfV7cq0V2yJEUjRvwY0IcIbsrLwAyDTSYNvJfUkt+/dNzy4AK5nUt0OcfIEwE3tqE
	 8imsmrb5NLeLor0VoNqTTmgBTjB8oYu+SCl25g4HiLjkUFe8xvXSKS9LLNUp4gylcE
	 VndHwdRKDCdlA==
Date: Thu, 16 Apr 2026 16:54:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260416-brutishly-saga-ba7168a4cd14@spud>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F+crD9IVk8CdCT4u"
Content-Disposition: inline
In-Reply-To: <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35200-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.1.144:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 2E314411430
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F+crD9IVk8CdCT4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 03:29:43PM +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
>=20
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
>=20
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 162 +++++++++++++++=
++++++
>  1 file changed, 162 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc=
0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-s=
oc0-pinctrl.yaml
> new file mode 100644
> index 000000000000..947f3cd09fcc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinct=
rl.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 SoC0 Pin Controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description:
> +  The AST2700 features a dual-SoC architecture with two interconnected S=
oCs,
> +  each having its own System Control Unit (SCU) for independent pin cont=
rol.
> +  This pin controller manages the pin multiplexing for SoC0.
> +
> +  The SoC0 pin controller manages pin functions including eMMC, VGA DDC,
> +  dual USB3/USB2 ports (A and B), JTAG, and PCIe root complex interfaces.
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-soc0-pinctrl
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-state$':
> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum:
> +          - EMMC
> +          - JTAGDDR
> +          - JTAGM0
> +          - JTAGPCIEA
> +          - JTAGPCIEB
> +          - JTAGPSP
> +          - JTAGSSP
> +          - JTAGTSP
> +          - JTAGUSB3A
> +          - JTAGUSB3B
> +          - PCIERC0PERST
> +          - PCIERC1PERST
> +          - TSPRSTN
> +          - UFSCLKI
> +          - USB2AD0
> +          - USB2AD1
> +          - USB2AH
> +          - USB2AHP
> +          - USB2AHPD0
> +          - USB2AXH
> +          - USB2AXH2B
> +          - USB2AXHD1
> +          - USB2AXHP
> +          - USB2AXHP2B
> +          - USB2AXHPD1
> +          - USB2BD0
> +          - USB2BD1
> +          - USB2BH
> +          - USB2BHP
> +          - USB2BHPD0
> +          - USB2BXH
> +          - USB2BXH2A
> +          - USB2BXHD1
> +          - USB2BXHP
> +          - USB2BXHP2A
> +          - USB2BXHPD1
> +          - USB3AXH
> +          - USB3AXH2B
> +          - USB3AXHD
> +          - USB3AXHP
> +          - USB3AXHP2B
> +          - USB3AXHPD
> +          - USB3BXH
> +          - USB3BXH2A
> +          - USB3BXHD
> +          - USB3BXHP
> +          - USB3BXHP2A
> +          - USB3BXHPD
> +          - VB
> +          - VGADDC
> +
> +      groups:
> +        enum:
> +          - EMMCCDN
> +          - EMMCG1
> +          - EMMCG4
> +          - EMMCG8
> +          - EMMCWPN
> +          - JTAG0
> +          - PCIERC0PERST
> +          - PCIERC1PERST
> +          - TSPRSTN
> +          - UFSCLKI
> +          - USB2A
> +          - USB2AAP
> +          - USB2ABP
> +          - USB2ADAP
> +          - USB2AH
> +          - USB2AHAP
> +          - USB2B
> +          - USB2BAP
> +          - USB2BBP
> +          - USB2BDBP
> +          - USB2BH
> +          - USB2BHBP
> +          - USB3A
> +          - USB3AAP
> +          - USB3ABP
> +          - USB3B
> +          - USB3BAP
> +          - USB3BBP
> +          - VB0
> +          - VB1
> +          - VGADDC
> +      pins:
> +        enum:
> +          - AB13
> +          - AB14
> +          - AC13
> +          - AC14
> +          - AD13
> +          - AD14
> +          - AE13
> +          - AE14
> +          - AE15
> +          - AF13
> +          - AF14
> +          - AF15

Why do you have groups and pins?

Is it valid in your device to have groups and pins in the same node?

> +
> +      drive-strength:
> +        enum: [3, 6, 8, 11, 16, 18, 20, 23, 30, 32, 33, 35, 37, 38, 39, =
41]
> +
> +      bias-disable: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@400 {
> +        compatible =3D "aspeed,ast2700-soc0-pinctrl";
> +        reg =3D <0x400 0x318>;
> +        emmc-state {
> +            function =3D "EMMC";
> +            groups =3D "EMMCG1";
> +        };
> +    };
>=20
> --=20
> 2.34.1
>=20

--F+crD9IVk8CdCT4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeEGHQAKCRB4tDGHoIJi
0hrJAQCL/qPAeh9PhP0f+9cy9zlA9Di9yMRwuiovxWHDxpgp2QEAzMKci8tRvglD
bIbgOLVyP2ugZhGFkQQHHd7o6vRTLQg=
=QgdD
-----END PGP SIGNATURE-----

--F+crD9IVk8CdCT4u--

