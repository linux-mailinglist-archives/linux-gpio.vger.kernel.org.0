Return-Path: <linux-gpio+bounces-26915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD771BC6AB7
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 23:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A01EF34F2CD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 21:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153002C0267;
	Wed,  8 Oct 2025 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssiRsTA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A61F4C8E;
	Wed,  8 Oct 2025 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958475; cv=none; b=JqAdN+efI0ECnuREGj7bs9rlHq86uP7uMGMYGL8ypdLt5CYz+p/hzQ6hRs347LtGl+BmyDx3NRDHsOR2MJk/uNZJhHx38um8jSwCcG78ts+qaAQEWfDYqq3Vrv1Ank1dHy1p/LTYU6Vs6TveEt8P6Q+O3LSvROeyoDtqLuRF0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958475; c=relaxed/simple;
	bh=ln8HHBUI7heLGpcj0iVWdGUezYcZlGgybRlfo3uh2Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hsj+JsytnYhaCik08li4bog0M5QgfHIps/CejBJHUxMcI+1rfn06kU/MNWiaNyGHzFl9+QThl5JYHdfej3vjEELBt9lMOSInNlSYDK9HKWRB+H8uXlsOhuhbnbo/OhkuVKEHnzU3BwWaKgJBQ/DrHSHMcPIPRO0xr2xynAml+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssiRsTA4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6E8C4CEE7;
	Wed,  8 Oct 2025 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759958475;
	bh=ln8HHBUI7heLGpcj0iVWdGUezYcZlGgybRlfo3uh2Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssiRsTA4VuLLYmFaoH6ROgqiBc4LjnGphQRgIx4AHlSiMX1q9MNiNsCpSu6uUmXwR
	 75T+Knup5XINXUNAE2SY1TOrHWZbxXowXyb8YlQO+5edC2XoojJipVrlGQDs62iE+Y
	 EEAbbvdm45NhrlLcDmjNJtunIqLUBcc0D4/iPEXrVwdn4y9snmRdYbS35NB7b7e/uB
	 3QRVVOgBdLnTdJ7M+awdJfpnyxN+5IOU8wS9np0/6HM/iHQ16usKKDe88vIWJFFTxp
	 lUO7Hb/A4UPxpWgUA2VrqaeNwEQXyJLriLnWfM3IyO9ybgnAFdv1l2LscmE9lMuAmC
	 Q9wJBs6+bR3kA==
Date: Wed, 8 Oct 2025 22:21:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20251008-canopener-marsupial-a92355b656ef@spud>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-23-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w7XBs/c3VdtOFJXE"
Content-Disposition: inline
In-Reply-To: <20251008073046.23231-23-clamor95@gmail.com>


--w7XBs/c3VdtOFJXE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 10:30:44AM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
>=20
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-csi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-csi.yaml
> new file mode 100644
> index 000000000000..817b3097846b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.=
yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 CSI controller
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-csi
> +      - nvidia,tegra30-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks: true
> +  clock-names: true
> +
> +  avdd-dsi-csi-supply:
> +    description: DSI/CSI power supply. Must supply 1.2 V.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#nvidia,mipi-calibrate-cells":
> +    description:
> +      The number of cells in a MIPI calibration specifier. Should be 1.
> +      The single cell specifies an id of the pad that need to be
> +      calibrated for a given device. Valid pad ids for receiver would be
> +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: channel 0 represents CSI-A and 1 represents CSI-B
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 1
> +
> +      nvidia,mipi-calibrate:
> +        description: Should contain a phandle and a specifier specifying
> +          which pad is used by this CSI channel and needs to be calibrat=
ed.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: port receiving the video stream from the sensor
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: port sending the video stream to the VI
> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra30-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +            - description: PAD A clock
> +            - description: PAD B clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +            - const: csia-pad
> +            - const: csib-pad

This clocks section seems like it could get simpler. Since the clock
descriptions are shared, and tegra20 has no clock-names, you could just
move the detail of the properties out to where you have the ": true"
stuff (we prefer that properties are defined outside of if/then/else
blocks) and just restrict them here. For tegra20 that'd be

if:
  properties:
    compatible:
      contains:
        enum:
          - nvidia,tegra20-csi
then:
  properties:
    clocks:
      maxItems: 1

    clock-names: false

(although it could easily be maxItems: 1 ?)
and for tegra30

if:
  properties:
    compatible:
      contains:
        enum:
          - nvidia,tegra30-csi
then:
  properties:
    clocks:
      minItems: 3

    clock-names:
      maxItems: 3

Of course you'd then have to add minItems: 1 and maxItems: 3 to the
extracted definitions.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +# see nvidia,tegra20-vi.yaml for an example
> --=20
> 2.48.1
>=20

--w7XBs/c3VdtOFJXE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaObVwgAKCRB4tDGHoIJi
0kNFAQDuxiZMnOEuJoNqnj2+6h0BkTID7nLWEXyaieIcY4+2xAD+MNiDwPqrp/mx
TMzEDtndN/BP7mtT02Tw6K4AX0B9TwQ=
=IK3r
-----END PGP SIGNATURE-----

--w7XBs/c3VdtOFJXE--

