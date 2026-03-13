Return-Path: <linux-gpio+bounces-33393-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC7kEjdHtGk4kAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33393-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 18:19:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B618287FF5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 18:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 279DF300A5A0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 17:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A503CAE6F;
	Fri, 13 Mar 2026 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIjWhwC3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B7035F188;
	Fri, 13 Mar 2026 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422196; cv=none; b=fu5VroIl1WO1kVhJ3mxkZB0Ch0EU4PcYm3Lsb+66M89b6REKIwjfkb051MxxSpuWNtr8XHIWfd6k8t0X76GBEWgPuOme9uizt1/tIoUiMyr/m9DRSMpe4I/mglOcQ9eO4QhaQH4oVATFjQuFJJH+t80Hi8TsDHUblfboHyrTegY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422196; c=relaxed/simple;
	bh=p+BRIsxATMuX2kLWrXUvKdnbah3+9qBGFp11c/r816I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+8cEdmynl2bySZRg/BxZ3hqzx3NB/1u61U5+l8AYZOXBLeezqqnIbno+LrZ00d/Y/WN5l/d8nkbatHKHiknC+Z7LBOCvR1V6ck9yHOcVSM4BkwQa6wyhOmyJpNeJICixlMbGjmTiEfwU3REYL04Or2DovkmsDboKfMTi/jegRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rIjWhwC3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E23DC19421;
	Fri, 13 Mar 2026 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422196;
	bh=p+BRIsxATMuX2kLWrXUvKdnbah3+9qBGFp11c/r816I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIjWhwC3+DEHc0GYh1XpDO1fC8gDEZRqDEzZ5r4HWlfdoKUzwugwpUoKOj4SVmr8N
	 yQtvHDRMUP9zPsf+t1ZqvaxT+XBrUTYz0eBqinvMcWFRnSZu5eoSH92kw+xaPswtJa
	 zVxZfzPv0KRn9AI0oIPUdMsVeXI+bJW3ntwyD96SRUTTCVjM2JO4bn0Ak2h8TKRcyI
	 U5fls478otNQOWHVLExVHms+0F5CzZi7UDb7kgHbAxt28A1Z875Wz01qZMTFUf2rWy
	 iafUV050/edLonDb/ItmcwMZzVVqzqHY+VMGcoXt1vY2N2/eUlepf775not3CxASmt
	 flHXasRWrFK7A==
Date: Fri, 13 Mar 2026 17:16:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH v4 1/6] dt-bindings: pinctrl: add NXP MC33978/MC34978 MSDI
Message-ID: <20260313-shortwave-baguette-5914f1af60f8@spud>
References: <20260313140218.1213393-1-o.rempel@pengutronix.de>
 <20260313140218.1213393-2-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mpVRK4fNYQy4w4wP"
Content-Disposition: inline
In-Reply-To: <20260313140218.1213393-2-o.rempel@pengutronix.de>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33393-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,protonic.nl:email]
X-Rspamd-Queue-Id: 4B618287FF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--mpVRK4fNYQy4w4wP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 03:02:12PM +0100, Oleksij Rempel wrote:
> Add device tree binding documentation for the NXP MC33978 and MC34978
> Multiple Switch Detection Interface (MSDI) devices.
>=20
> These ICs monitor up to 22 mechanical switch contacts in automotive and
> industrial environments. They provide configurable wetting currents to
> break through contact oxidation and feature extensive hardware
> protection against thermal overload and voltage transients (load
> dumps/brown-outs).
>=20
> The device interfaces via SPI. While it provides multiple functions, its
> primary hardware purpose is pin/switch control. To accurately represent
> the hardware as a single physical integrated circuit without unnecessary
> DT overhead, all functions are flattened into a single pinctrl node:
> - pinctrl: Exposing the 22 switch inputs (SG/SP pins) as a GPIO controller
>   and managing their pin configurations.
> - hwmon: Exposing critical hardware faults (OT, OV, UV) and static
>   voltage/temperature thresholds.
> - mux: Controlling the 24-to-1 analog multiplexer to route pin voltages,
>   internal temperature, or battery voltage to an external SoC ADC.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

>>  .../bindings/pinctrl/nxp,mc33978.yaml         | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978=
=2Eyaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml b=
/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
> new file mode 100644
> index 000000000000..58a641a7c615
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,mc33978.yaml
> @@ -0,0 +1,148 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nxp,mc33978.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP MC33978/MC34978 Multiple Switch Detection Interface
> +
> +maintainers:
> +  - David Jander <david@protonic.nl>
> +  - Oleksij Rempel <o.rempel@pengutronix.de>
> +
> +description: |
> +  The MC33978 and MC34978 are Multiple Switch Detection Interface (MSDI)
> +  devices with 22 switch inputs, integrated fault detection, and analog
> +  multiplexer (AMUX) for voltage/temperature monitoring.
> +
> +  Pin numbering:
> +  - Pins 0-13: SG0-SG13 (Switch-to-Ground inputs). These pins monitor
> +    contacts closed to ground and typically require GPIO_ACTIVE_LOW
> +    flags when used as digital inputs.
> +  - Pins 14-21: SP0-SP7 (Programmable inputs). These can be configured
> +    as SG (Switch-to-Ground) or SB (Switch-to-Battery) inputs. SB
> +    inputs monitor contacts closed to the battery voltage and typically
> +    require GPIO_ACTIVE_HIGH flags when used as digital inputs.
> +
> +  Output Emulation:
> +  The hardware lacks standard push-pull output drivers. Outputs are emul=
ated
> +  by toggling the programmable wetting current sources (acting as pull-u=
ps
> +  or pull-downs) and the hardware tri-state registers. Because of this
> +  physical constraint:
> +  - Consumers using pins as outputs MUST flag them with GPIO_OPEN_DRAIN =
or
> +    GPIO_OPEN_SOURCE in the device tree.
> +  - Push-pull configurations are physically unsupported.
> +  - The active polarity depends entirely on the external circuit (e.g., =
how
> +    an LED is wired) and must be flagged accordingly by the consumer.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,mc33978
> +      - nxp,mc34978

What's different about these that a fallback is not suitable?

> +
> +  reg:
> +    maxItems: 1
> +    description: SPI chip select number
> +
> +  spi-max-frequency:
> +    maximum: 8000000
> +    description: Maximum SPI clock frequency (up to 8 MHz)
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      INT_B pin interrupt. Active-low, indicates pin state changes or
> +      fault conditions.
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      First cell is the IRQ number (0-21 for pins, 22 for faults).
> +      Second cell is the trigger type (IRQ_TYPE_* from interrupt-control=
ler.h).
> +
> +  '#mux-control-cells':
> +    const: 0
> +    description:
> +      Present if the device AMUX selector is used as a mux provider.
> +      Consumers (e.g. io-channel-mux) must provide settle-time-us for the
> +      external ADC sampling path.
> +
> +  vddq-supply:
> +    description: Digital supply voltage
> +
> +  vbatp-supply:
> +    description: Battery/power supply
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  ngpios:
> +    const: 22
> +
> +patternProperties:
> +  '^.*-grp$':
> +    type: object
> +    $ref: /schemas/pinctrl/pincfg-node.yaml#
> +    additionalProperties: false
> +    description: Pin configuration subnodes.
> +    properties:
> +      pins: true

This seems overly permissive, think it should only allow the couple of
options that your hardware has. Probably just make it an enum? Shouldn't
have to check the driver to know what the acceptable pin names are.

Cheers,
Conor.

pw-bot: changes-requested


--mpVRK4fNYQy4w4wP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRGbgAKCRB4tDGHoIJi
0p75AP0aFQoEjAP1KDnrdD6k7X9NOCRjCBHILhewmZ+uzJxrmwEAs0iC4M9HTbRO
fY99FIdhCjrgRoYu29pTjAV7fVlmcAM=
=Mj7z
-----END PGP SIGNATURE-----

--mpVRK4fNYQy4w4wP--

