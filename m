Return-Path: <linux-gpio+bounces-8780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 177EC955CEE
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 16:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBA9528156C
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 14:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8666E7581F;
	Sun, 18 Aug 2024 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sY9gJSbt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ADF1FDA;
	Sun, 18 Aug 2024 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723990815; cv=none; b=B6JXVgSi6G6jWgp5DhJIUdEAxGheBe8w3GuP+qMLG2o2zi85K14OWTYwUf8TufxA7li9v20JYXiE7yNtfOfMdoFroehaopbFNhr1KLYFDn+hdeo0RrVQahYevQuR0Pj+lE2cmy2Xg18zQbxLf/2hEUMGmuak3kl4O2H65TgDbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723990815; c=relaxed/simple;
	bh=sAOn73EHTA3Pw+k+UQhVjB82c6gnTxA/ffM9mQANkLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLU3Q2Kdd20BEzjDwOaw/yuVmftVkGXiQX4KFzTivHPgHqvCFdgy13yiVIrVco4WutOhSVn5ugJoQf+waw39TZIwglW4dvJmBfL6kggatWRh8cZ1xHfPSYdyDyyhlaLFG78+NrKK6/wcJCrznxHKwxD95rIycxZXXEIE5DwSEFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sY9gJSbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204EEC32786;
	Sun, 18 Aug 2024 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723990814;
	bh=sAOn73EHTA3Pw+k+UQhVjB82c6gnTxA/ffM9mQANkLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sY9gJSbtpyAge8zyoyLUxdErO/I74vEHTtg1Id3yqbKFLFYSgxQKl3qIWFRz5a8iQ
	 c7YMtJ5nuS6itcGJcGx02U261c1aTfFKYlEz9OmE9MSciVrOm6jUNvXJnca7omfUBP
	 0UCtXvhg5NkBVe0u1SKRBYN0hYGJSi+E8EE1bm8WXmdP5IgcTdYYourXAtZuVXJeOp
	 uVXhJ9qzAs+BhdQU9SpHrzo34AHUnadVSwBODaYp622qcgIL08Z1E6r8/cR8i7quXw
	 k/9d5cAbr29v3uN1XPsCXu18gUO3/QLdG/AGGsBxhf7pWwde3/7HtBE6n859AyYh0f
	 NoYfo2a9b4sLQ==
Date: Sun, 18 Aug 2024 16:20:08 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, krzk+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZsIDGP7WxvvzVUp4@lore-rh-laptop>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5IqXVcUnvmAicu1l"
Content-Disposition: inline
In-Reply-To: <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>


--5IqXVcUnvmAicu1l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +
> > +patternProperties:
>=20
> Keep it after properties: block.

ack, I will fix it in v2

>=20
> > +  '-pins$':
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    patternProperties:
> > +      '^.*mux.*$':
> > +        type: object
> > +        additionalProperties: false
> > +        description: |
>=20
> Do not need '|' unless you need to preserve formatting.

ack, I will fix it in v2

>=20
> > +          pinmux configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > +        properties:
> > +          function:
> > +            description:
> > +              A string containing the name of the function to mux to t=
he group.
> > +            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, sp=
i,
> > +                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_le=
d0,
> > +                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_le=
d1,
> > +                   phy3_led1, phy4_led1]
> > +          groups:
>=20
> minItems: 1
> maxItems: 32 (or whatever is sensible)

I was assuming the default values are minIems =3D maxItems =3D 1 and we can
overwrite maxItems if required (e.g. for "uart" or for "pcm_spi" blocks).
Am I missing something?

>=20
> > +            description:
> > +              An array of strings. Each string contains the name of a =
group.
> > +        required:
> > +          - function
> > +          - groups
> > +
> > +        allOf:
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: pon
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [pon]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: tod_1pps
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [pon_tod_1pps, gsw_tod_1pps]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: sipo
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [sipo, sipo_rclk]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: mdio
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [mdio]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: uart
> > +            then:
> > +              properties:
> > +                groups:
> > +                  items:
> > +                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rt=
s, uart4,
> > +                           uart5]
> > +                  maxItems: 2
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: i2c
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [i2c1]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: jtag
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [jtag_udi, jtag_dfd]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: pcm
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [pcm1, pcm2]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: spi
> > +            then:
> > +              properties:
> > +                groups:
> > +                  items:
> > +                    enum: [spi_quad, spi_cs1]
> > +                  maxItems: 2
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: pcm_spi
> > +            then:
> > +              properties:
> > +                groups:
> > +                  items:
> > +                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_=
cs1,
> > +                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi=
_cs3,
> > +                           pcm_spi_cs4]
> > +                  maxItems: 7
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: i2c
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [i2s]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: emmc
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [emmc]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: pnand
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [pnand]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: pcie_reset
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [pcie_reset0, pcie_reset1, pcie_reset2]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: pwm
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpi=
o6,
> > +                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, =
gpio13,
> > +                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio1=
9,
> > +                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio2=
5,
> > +                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio3=
1,
> > +                         gpio36, gpio37, gpio38, gpio39, gpio40, gpio4=
1,
> > +                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio4=
7]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy1_led0
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio33, gpio34, gpio35, gpio42]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy2_led0
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio33, gpio34, gpio35, gpio42]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy3_led0
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio33, gpio34, gpio35, gpio42]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy4_led0
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio33, gpio34, gpio35, gpio42]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy1_led1
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio43, gpio44, gpio45, gpio46]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy2_led1
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio43, gpio44, gpio45, gpio46]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy3_led1
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio43, gpio44, gpio45, gpio46]
> > +          - if:
> > +              properties:
> > +                function:
> > +                  const: phy4_led1
> > +            then:
> > +              properties:
> > +                groups:
> > +                  enum: [gpio43, gpio44, gpio45, gpio46]
> > +
> > +      '^.*conf.*$':
> > +        type: object
> > +        additionalProperties: false
> > +        description:
> > +          pinconf configuration nodes.
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > +
> > +        properties:
> > +          pins:
> > +            description:
> > +              An array of strings. Each string contains the name of a =
pin.
> > +            items:
> > +              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, =
spi_clk,
> > +                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, g=
pio4,
> > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11=
, gpio12,
> > +                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, g=
pio19,
> > +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, g=
pio26,
> > +                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, g=
pio33,
> > +                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, g=
pio40,
> > +                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
> > +                     pcie_reset0, pcie_reset1, pcie_reset2]
>=20
> minItems

ack, I will fix it in v2.

>=20
> > +            maxItems: 58
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          input-enable: true
> > +
> > +          output-enable: true
> > +
> > +          output-low: true
> > +
> > +          output-high: true
> > +
> > +          drive-open-drain: true
>=20
> Drop blank lines between these.

ack, I will fix it in v2.

> > +
> > +          drive-strength:
>=20
> What are the units? Shouldn't this be drive-strength-microamp?

nope, it is in mA. I will add a description to specify it.

>=20
> > +            enum: [2, 4, 6, 8]
> > +
> > +        required:
> > +          - pins
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      pio: pinctrl@1fa20214 {
> > +        compatible =3D "airoha,en7581-pinctrl";
> > +        reg =3D <0x0 0x1fa20214 0x0 0x30>,
> > +              <0x0 0x1fa2027c 0x0 0x8>,
> > +              <0x0 0x1fbf0234 0x0 0x4>,
> > +              <0x0 0x1fbf0268 0x0 0x4>,
> > +              <0x0 0x1fa2001c 0x0 0x50>,
> > +              <0x0 0x1fa2018c 0x0 0x4>,
> > +              <0x0 0x1fbf0204 0x0 0x4>,
> > +              <0x0 0x1fbf0270 0x0 0x4>,
> > +              <0x0 0x1fbf0200 0x0 0x4>,
> > +              <0x0 0x1fbf0220 0x0 0x4>,
> > +              <0x0 0x1fbf0260 0x0 0x4>,
> > +              <0x0 0x1fbf0264 0x0 0x4>,
> > +              <0x0 0x1fbf0214 0x0 0x4>,
> > +              <0x0 0x1fbf0278 0x0 0x4>,
> > +              <0x0 0x1fbf0208 0x0 0x4>,
> > +              <0x0 0x1fbf027c 0x0 0x4>,
> > +              <0x0 0x1fbf0210 0x0 0x4>,
> > +              <0x0 0x1fbf028c 0x0 0x4>,
> > +              <0x0 0x1fbf0290 0x0 0x4>,
> > +              <0x0 0x1fbf0294 0x0 0x4>,
> > +              <0x0 0x1fbf020c 0x0 0x4>,
> > +              <0x0 0x1fbf0280 0x0 0x4>,
> > +              <0x0 0x1fbf0284 0x0 0x4>,
> > +              <0x0 0x1fbf0288 0x0 0x4>;
>=20
> Why are you mapping individual registers? At least half of these are
> continuous.
>=20
> > +
> > +        gpio-controller;
> > +        #gpio-cells =3D <2>;
> > +        gpio-ranges =3D <&pio 0 13 47>;
> > +
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <2>;
> > +        interrupt-parent =3D <&gic>;
> > +        interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        pcie1-rst-pins {
> > +          conf {
> > +            pins =3D "pcie_reset1";
> > +            drive-open-drain =3D <1>;
> > +          };
> > +        };
> > +
> > +        pwm-pins {
> > +          mux {
> > +            function =3D "pwm";
> > +            groups =3D "gpio18";
> > +          };
> > +        };
> > +
> > +        spi-pins {
> > +          mux {
> > +            function =3D "spi";
> > +            groups =3D "spi_quad", "spi_cs1";
> > +          };
> > +        };
> > +
> > +        uuart2-pins {
> > +          mux {
> > +            function =3D "uart";
> > +            groups =3D "uart2", "uart2_cts_rts";
> > +          };
> > +        };
> > +
> > +        uar5-pins {
> > +          mux {
> > +            function =3D "uart";
> > +            groups =3D "uart5";
> > +          };
> > +        };
> > +
> > +        mmc-pins {
> > +          mux {
> > +            function =3D "emmc";
> > +            groups =3D "emmc";
> > +          };
> > +        };
> > +
> > +        mdio-pins {
> > +          mux {
> > +            function =3D "mdio";
> > +            groups =3D "mdio";
> > +          };
> > +
> > +          conf {
> > +            pins =3D "gpio2";
>=20
> What is the point of having both groups and pins?

"pins" is specific for "conf" block and it is used to specify the pins where
we need to apply the configuration while "group" is just used in the "mux"
block. Am I missing something?

>=20
> > +            output-enable;
> > +          };
> > +        };
> > +
> > +        gswp1-led0-pins {
> > +          mux {
> > +            function =3D "phy1_led0";
> > +            groups =3D "gpio33";
> > +          };
> > +        };
> > +
> > +        gswp2-led1-pins {
> > +          mux {
> > +            function =3D "phy2_led1";
> > +            groups =3D "gpio44";
>=20
> That's not a group but pin name.

Looking at the patch 2/2, "gpio44" is actually a group used to specify a si=
ngle
pin group.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--5IqXVcUnvmAicu1l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsIDFQAKCRA6cBh0uS2t
rD7QAP9griG5oK63GIqaCizretTBcPbaFKD55AMSnZJZJT8VMwD9Fl/tReIrrRsj
+bZMcx47+6eST8Yo0v2Ep91skL6RlgU=
=zyHk
-----END PGP SIGNATURE-----

--5IqXVcUnvmAicu1l--

