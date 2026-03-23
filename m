Return-Path: <linux-gpio+bounces-34012-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCx8OHgawWn5QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34012-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:48:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E75732F0763
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C51E630523BA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C402D9ECB;
	Mon, 23 Mar 2026 10:41:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8458E390215
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262515; cv=none; b=CUUtX7ki7BdWJ7IsJ6PWQZE1ogvayEjy+A2wkJg88MPuohLiuO+RL58hqJWWjwuNCaoLFcKUXwMLHf5jzcysomyZ+VdQOzyhZLm8IB7/uRRAAsRDHs33gEIWbTqqK8NhmSkOcVSuULzHTkLb2rKmwauYlUfNssg23eCzl5Iyj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262515; c=relaxed/simple;
	bh=Z6GcXlGT7FKbncFELrN6EUuqe1RbllaJTGYxbiWsiQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ch89OSdw7auuL25xgW6f2wsu+0Wkqv9rgoxrA0LpxOdIIiePSjT1RwpGvYsMXHfN6yVwhdEsU4F593k1LCr3dFA+X8DvlZoS296oVy84m1HuEEE8c1sx6hjB5pfWWisY1Zr8PCXUdFjrxKoPb8iO6D708tuzD8IlmvTMaMo02TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w4ciw-0001Ls-1M; Mon, 23 Mar 2026 11:41:30 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w4civ-001iBA-2O;
	Mon, 23 Mar 2026 11:41:29 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 5965450A81A;
	Mon, 23 Mar 2026 10:41:29 +0000 (UTC)
Date: Mon, 23 Mar 2026 11:41:29 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add
 microchip,xstbyen property
Message-ID: <20260323-noble-mysterious-hippogriff-340f73-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
 <20260321135031.3107408-2-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="acu6kjxbnxtaftpm"
Content-Disposition: inline
In-Reply-To: <20260321135031.3107408-2-viken.dadhaniya@oss.qualcomm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34012-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkl@pengutronix.de,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E75732F0763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--acu6kjxbnxtaftpm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add
 microchip,xstbyen property
MIME-Version: 1.0

On 21.03.2026 19:20:30, Viken Dadhaniya wrote:
> Add the boolean property 'microchip,xstbyen' to enable the dedicated
> transceiver standby control function on the INT0/GPIO0/XSTBY pin of
> the MCP251xFD family.
>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

This series looks good to me, I think we need an Acked by the DT people.

regards,
Marc

> ---
> v2 -> v3:
>
> - No change.
>
> v2 Link: https://lore.kernel.org/all/20260316131950.859748-2-viken.dadhan=
iya@oss.qualcomm.com/
>
> v1 -> v2:
>
> - Drop the gpio-hog approach as suggested by Dmitry.
> - Add the microchip,xstbyen property to enable transceiver standby contro=
l.
>
> v1 Link: https://lore.kernel.org/all/20260108125200.2803112-2-viken.dadha=
niya@oss.qualcomm.com/
> ---
>  .../devicetree/bindings/net/can/microchip,mcp251xfd.yaml  | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251xf=
d.yaml b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
> index 2d13638ebc6a..28e494262cd9 100644
> --- a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
> @@ -44,6 +44,14 @@ properties:
>        signals a pending RX interrupt.
>      maxItems: 1
>
> +  microchip,xstbyen:
> +    type: boolean
> +    description:
> +      If present, configure the INT0/GPIO0/XSTBY pin as transceiver stan=
dby
> +      control. The pin is driven low when the controller is active and h=
igh
> +      when it enters Sleep mode, allowing automatic standby control of an
> +      external CAN transceiver connected to this pin.
> +
>    spi-max-frequency:
>      description:
>        Must be half or less of "clocks" frequency.
> --
> 2.34.1
>
>
>

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--acu6kjxbnxtaftpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCacEY1wAKCRDMOmT6rpmt
0kmlAQCNELR5JUwWlmN5Z24i7Xj/tpKV+XPWrS9q2fn0iE2hLwEAvx+Q7vop5d52
z+zV1UqbjBCe5rYx+bqEhZyZ5KAd4wE=
=SepY
-----END PGP SIGNATURE-----

--acu6kjxbnxtaftpm--

