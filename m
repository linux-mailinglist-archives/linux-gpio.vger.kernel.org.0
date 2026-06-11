Return-Path: <linux-gpio+bounces-38355-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BThKBfDyKmqazwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38355-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 19:40:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C44B67412B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 19:39:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Tgf95f7o;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38355-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38355-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B9473073B37
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 17:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71503E1D0B;
	Thu, 11 Jun 2026 17:39:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519527380A;
	Thu, 11 Jun 2026 17:39:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199567; cv=none; b=CCsexsc614zwlOO0TupWQ+cJ5T7JwVPD4l2rO/gJnidDIUdK1TyxIrLFmC6QmfUWp6RW+UjuVP3Q8NiEBllT01MCvPAyjfB+UX6MWPdlumRXydGb5UJoCFHrkVhLIr2yBnGz0fC54/APtOiqF59n5dLHzH/RoU38+cRjKi2RxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199567; c=relaxed/simple;
	bh=FMNsqxa5yfbSDypz5Gq4f5IE6X4crxLSQ+REFu3hw14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQWMBFgpGNPXYIWkJeVifcGhm+/n6oaJlKyraEW28VIgPnCSTOE0x5HR+LNI3DePS/kFHSpljHLGDAySgPeh8l8fc5SMLOadsFJJupvjtLjVwEbKI0hx9MLCADpqniYjYTQweQu5JQPl9U39rvcy+8RCyJ/+v9Wh75fWD6Y+Qtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tgf95f7o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB501F00898;
	Thu, 11 Jun 2026 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781199564;
	bh=zecCFZ8Srn7GiJ4aEDliOVYKyOCo+jfQkMceICQfEXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tgf95f7oTSS3MaNiLsaHbRgvzIf0S9ca7hX2UT6P0d9HTH1KyIQsLIUwZ0uB4A3dR
	 K3rAOgo8Omp6Mi8GyxItsEKwz7uQOgF2gODKWfHyKhTsgxjj5eNzj2WSI355eSWmuA
	 4wkoA90TjXf+w3IF6Lwn2bitk2TpIydg00SuG71SK6dkf6peyXQM32ZnYg2azcJQTA
	 uknqvGfXCPZZiEU3nJdGYf9tSEuJVLHXVEMmGEMe32+UrER386OdKZs69GtyH1c364
	 qAOIhSdrAsUsVvyRuBGM378Y5/NxdN1CztJ9G0P0axYmXOLyURJQzck/KrKXR0RT2d
	 WmZ8QInRUgAsw==
Date: Thu, 11 Jun 2026 18:39:19 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 gpio irq property
Message-ID: <20260611-ungloved-snowplow-522e7c0b7a51@spud>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VEw7ILEoyX+SpPI8"
Content-Disposition: inline
In-Reply-To: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:xianwei.zhao@amlogic.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38355-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C44B67412B


--VEw7ILEoyX+SpPI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 07:54:33AM +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add the hw-irq property for each GPIO bank and enable interrupt-parent
> for pinctrl so that gpiod_to_irq() can translate GPIO lines to IRQs.

Uhhhhh, what? Why can't you just use the normal interrupts property?

>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml | 5 ++=
+++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4=
=2Eyaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> index b69db1b95345..65ec9121300e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -37,6 +37,8 @@ properties:
> =20
>    ranges: true
> =20
> +  interrupt-parent: true
> +
>  patternProperties:
>    "^gpio@[0-9a-f]+$":
>      type: object
> @@ -65,6 +67,9 @@ patternProperties:
>        gpio-ranges:
>          maxItems: 1
> =20
> +      hw-irq:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
>      required:
>        - reg
>        - reg-names
>=20
> --=20
> 2.52.0
>=20
>=20

--VEw7ILEoyX+SpPI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairyxwAKCRB4tDGHoIJi
0m/hAQCp/1LdXn73XJ882JgpI44MDQ6+BcDG0bj2pr1l/UPp1gEAgr7myM1tdKUn
TGrp5V8PbizLw4otN8AaIarajA+ocwM=
=e3OE
-----END PGP SIGNATURE-----

--VEw7ILEoyX+SpPI8--

