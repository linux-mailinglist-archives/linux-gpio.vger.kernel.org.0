Return-Path: <linux-gpio+bounces-39534-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vq00L4jlS2pHcQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39534-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 19:27:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1268713DA3
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 19:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VJFrGpJJ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39534-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39534-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 702403013C63
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 17:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4FE3806DD;
	Mon,  6 Jul 2026 17:15:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1B137C11E;
	Mon,  6 Jul 2026 17:15:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358103; cv=none; b=C/5e1SBWRv4DhC6sANmdhPKZe9DeGrBUA61uSzqj6FbDUKVwMOxbVS7uKnqaIGXphzIqVK4iDZ/bDhYXgbnMBv9NLGEQNunjYhNhH/VRFvRE15Dsk1QQwoUJxIVdyVIUj40W781vnVDBFFuG6os+2QYKN5kKvCJFyBHbhXF4G0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358103; c=relaxed/simple;
	bh=Cyrg0grsaRMPFMVwBK5PCRBknfGqtG3jJSiGJhjJh10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBvUM7zHwdpaZQe+DCYR2pZRNgHqDdXmT3w1RP2UmBCiK5c7iMuCh5/fcJeptWyI3pCqMpFdEJ4uC9rTEfW5o4BFvXIlMDdlERuL5KkzSCluZSQITmu4rxK09IrAY5NRG2j1tLClnc3wnkHYEKLFV1nFUiq+xOWgT7lhJq3i3Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJFrGpJJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C1D1F000E9;
	Mon,  6 Jul 2026 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783358101;
	bh=FLCkRFY/xZawZM4IfpyQEQBqFJQifdjTe2UFwHN+pbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VJFrGpJJi0WdJNBZtw4v4b+k6Zqo9dKSW5u3hd7vNaqe7DRoSA3roX+lo8tzwWPFZ
	 K1TViY4xZvQQiOF8+PF4HjiGkJfplG5LjYwmIzsFKVRG+XxlGYomGz5Vkwq95amvdx
	 4zKPi5OQvVVaTlisaZtCHrIUvXLxnkqOzbxAnmv8h9TVZgfseJbA5cDFYpTDEV+ySc
	 5VBBboakFE94TO9Hs6IKFdMnD6xRpVR7ac94ZnKkZ1pzArVTbiuCwyb/j5aliMrWeY
	 b7Zsl7te9dxAspf/EMLA7iwGhksS8dopDR+/KyNe1c+kH8K7eK3tQ/NojTG/Iq6BMT
	 7oMlJvppDzAnQ==
Date: Mon, 6 Jul 2026 18:14:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: phy: motorola,cpcap-usb: add
 chrg_det interrupt
Message-ID: <20260706-visitor-calorie-b805ac5af970@spud>
References: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
 <20260705101105.1798069-2-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EHPotJN9Y/7sp6ZZ"
Content-Disposition: inline
In-Reply-To: <20260705101105.1798069-2-ivo.g.dimitrov.75@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ivo.g.dimitrov.75@gmail.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ivogdimitrov75@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39534-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1268713DA3

--EHPotJN9Y/7sp6ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 05, 2026 at 01:11:02PM +0300, Ivaylo Dimitrov wrote:
> The CPCAP USB PHY driver uses the CPCAP charger detection interrupt
> for DCP detection.

This is not currently true, the driver does not look for this interrupt
at the time of this patch.

> Update the binding and example DTS to use the corresponding
> "chrg_det" interrupt name.

Sounds to me like this new interrupt is optional, since until now it has
not been needed? The patch however makes it mandatory. I think your
driver patch also makes it mandatory, which will break older
devicetrees.

What makes this ABI break okay?

Thanks,
Conor.

>=20
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>  .../devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml     | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy=
=2Eyaml b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> index 0febd04a61f4..523a8f8480d0 100644
> --- a/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/motorola,cpcap-usb-phy.yaml
> @@ -30,6 +30,7 @@ properties:
>        - description: se1 interrupt
>        - description: dm interrupt
>        - description: dp interrupt
> +      - description: charger detection interrupt
> =20
>    interrupt-names:
>      description: Interrupt names
> @@ -43,6 +44,7 @@ properties:
>        - const: se1
>        - const: dm
>        - const: dp
> +      - const: chrg_det
> =20
>    io-channels:
>      description: IIO ADC channels used by the USB PHY
> @@ -91,10 +93,10 @@ examples:
>          interrupts-extended =3D <
>              &cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
>              &cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
> -            &cpcap 48 1
> +            &cpcap 48 1 &cpcap 13 0
>          >;
>          interrupt-names =3D "id_ground", "id_float", "se0conn", "vbusvld=
",
> -                          "sessvld", "sessend", "se1", "dm", "dp";
> +                          "sessvld", "sessend", "se1", "dm", "dp", "chrg=
_det";
>          io-channels =3D <&cpcap_adc 2>, <&cpcap_adc 7>;
>          io-channel-names =3D "vbus", "id";
>          vusb-supply =3D <&vusb>;
> --=20
> 2.39.5
>=20

--EHPotJN9Y/7sp6ZZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakvikAAKCRB4tDGHoIJi
0v+aAP9LtdSSmr/h68scZGIFlgV6ysH5j3UmXqH1E2gDLiQUNwEA3nVaHeU2gU7A
6DvEFs8Okg6Y6JMPXLUM2uDUSeiDOwY=
=kZwB
-----END PGP SIGNATURE-----

--EHPotJN9Y/7sp6ZZ--

