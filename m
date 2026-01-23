Return-Path: <linux-gpio+bounces-31022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ+UCfWsc2nOxwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 18:16:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D878E47
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 18:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1CEB301C943
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 17:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80268221578;
	Fri, 23 Jan 2026 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLJ7RYJb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0481A9F90;
	Fri, 23 Jan 2026 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188564; cv=none; b=IufJUTcoFswodciCYB1B1TEoqEmlEWk49ZnyYTBihnnCWjQhNFDbel0JVul/UEPk6uEFc5TXlGCTf4SAqnsqlVoPv3ITSzlYKm+S8Cfb8E2BeSpAF6LGbW5TQGmDRhuwMkbk7dW8faKELLs64+ewI5lOLmF9EDBbJhq4+QoUPAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188564; c=relaxed/simple;
	bh=UJeaACACnw2W6qBc+2rEWefBPoPPj8lzmmpmPgBVuiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgP42EpkRE0YQLFFyMZYF1NImpNBCFa7gRFQ+grdVJHp1gpvvlIoDrPCjJgAVtZXGsPXY3SyKWy6/nCi6V73POeY6YS8HDaikLDX/KhN3yhAawJ9/Aq+v8TzOX3VWVzzVi6e6jr0lY1OyyMhAFRMSf0SwRPoSSJ9fsok+YPAKDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLJ7RYJb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658B8C4CEF1;
	Fri, 23 Jan 2026 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188563;
	bh=UJeaACACnw2W6qBc+2rEWefBPoPPj8lzmmpmPgBVuiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLJ7RYJbF0HIqIRKIqQNli+hcZlGT2+po8P0nLyFpg/n55pSPniusAh6nSfrEEcKF
	 pRXnv6YzHAy9IBwhnUXE9aosDscIrdos4vrPAF6EQ3BLN7B5gyKc9QOb1oad1AhMel
	 i6O5rBGNRRXgTTwyVUrpp+eivcWJygBSFIkJUtFauJQmIrTEoysAVuuwq4DbjwY2us
	 JtPlqy0BdOwLI5agax0dXyeF2czDEO2os2Qx1mii6KJqJjIhbk87j81ZFHaCaqgvd4
	 jg5WX9eh9Uj9EBRnyhQKWsm3QruGJ6elx2PSknnNkA0XBWP7XjqlJlgXbFSDpLYbym
	 KOeDA4IjVhQnw==
Date: Fri, 23 Jan 2026 17:15:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	robh@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: Add Tegra264 support
Message-ID: <20260123-value-marsupial-98e2322db2f6@spud>
References: <20260123100824.1109150-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JoixOS6VL0SqOcW8"
Content-Disposition: inline
In-Reply-To: <20260123100824.1109150-1-pshete@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31022-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 6C5D878E47
X-Rspamd-Action: no action


--JoixOS6VL0SqOcW8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 10:08:22AM +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra264. The number of pins
> is slightly different, but the programming model remains the same.
>=20
> Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,
> that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin.
>=20
> On Tegra, GPIO wake events are latched and routed via the PMC.
> Document the standard DT property, wakeup-parent, which is a phandle to
> the PMC interrupt controller that provides the parent wake interrupt
> domain for the GPIO controller. If the property is absent the driver
> falls back to a compatible-based lookup.
>=20
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v3:
>   * Fix DT binding SPDX license to GPL-2.0-only OR BSD-2-Clause
>=20
> Changes in v2:
>   * Update DT binding to use =E2=80=9Cwakeup-parent=E2=80=9D (drop custom=
 nvidia,pmc).
>   * Require =E2=80=9Cwakeup-parent=E2=80=9D for Tegra264 compatibles in t=
he binding.
>   * Rename header file to "nvidia,tegra264-gpio.h".
> ---
>  .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 24 +++++++
>  .../dt-bindings/gpio/nvidia,tegra264-gpio.h   | 62 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/nvidia,tegra264-gpio.h
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
> index 2bd620a1099b..b74fc3a8d80d 100644
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
> @@ -86,6 +86,9 @@ properties:
>        - nvidia,tegra234-gpio
>        - nvidia,tegra234-gpio-aon
>        - nvidia,tegra256-gpio
> +      - nvidia,tegra264-gpio
> +      - nvidia,tegra264-gpio-uphy
> +      - nvidia,tegra264-gpio-aon
> =20
>    reg-names:
>      items:
> @@ -110,6 +113,12 @@ properties:
>        ports, in the order the HW manual describes them. The number of en=
tries
>        required varies depending on compatible value.
> =20
> +  wakeup-parent:
> +    $ref: /schemas/types.yaml#/definitions/phandle

This type should not be needed, wakeup-parent is defined in dt-shema for
interrupt-controllers.

> +    description: |

Drop the | from here, there's no formatting to preserve.


pw-bot: changes-requested

Cheers,
Conor.

> +      Phandle to the parent interrupt controller used for wake-up.
> +      On Tegra, this typically references the PMC interrupt controller.

--JoixOS6VL0SqOcW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXOszwAKCRB4tDGHoIJi
0uOWAP4yGS/Su0lTcne4L4Xg/k4Tm7jN1/de6QgIHbCwDI7bSQEAmm2q+v9V1hWF
+3p2JvXh9ghzXgR2QqbTUWSe1uITbwk=
=2Kxr
-----END PGP SIGNATURE-----

--JoixOS6VL0SqOcW8--

