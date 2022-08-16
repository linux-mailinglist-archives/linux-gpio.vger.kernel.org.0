Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B41595AF4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 13:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiHPLzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 07:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbiHPLy4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 07:54:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC42F2BB2C;
        Tue, 16 Aug 2022 04:33:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x19so14508396lfq.7;
        Tue, 16 Aug 2022 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=FF4CjJny/QRdHCfx5bAKwT8z67ihdorkdLkACcx9eVI=;
        b=bOEalsMKGR0p2JVGfMqOyykwWZhpGYaHvbfCBp2HeanaHwWHNTnY2Mg1omJm0DUZxW
         tywtvjDNjXi+hGQyJxVT3pro7K6icD7F7bcxHJpfBRcRSkyV+hFEWMOYF4KsJubcE0T5
         6gDuky/5AyIK78gr5K1jLHYMtpWxP/duAnvoWfYzmpBQRRjqmTs+GqLj5ikU8fzOzhr4
         OEsH+jn/vNdnrCbgdf6WKpJDQWeg/Ctxjmcst6Q2hG3R4l3MR/tLybu/2kTEqLzuSojT
         PKik3InkbekHUyQ3NVYjCtRUPt56tXCKpoUzFviyBrumW+mit4pm1NvUIfGFJvke8lIu
         /L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=FF4CjJny/QRdHCfx5bAKwT8z67ihdorkdLkACcx9eVI=;
        b=g+r9jfs6b1Ufj5whcfLEwhsNsMA3bpZcK9dXHceUp5yshjyVKcJ1iKBtzsq6wvOZCn
         ouYHxJtVCvbkn3pEyOEj5qFIiTfTKYH6B5j1Ztq1pJVLZIwiybm7geCEPrHmESTCYur9
         FkdDZ1nQVzo2qyBquAMle2iSBgQX8mxzD9csC/QiDu5w+2XvfO32WTtLF/inatZ0MaHe
         unEEal3hihcCdXV5TjwuLoRfpIk1rI+78V4v24Dry7ZrsKCUw2l/+TvHaZ4Ct4xW98ib
         zrIhi19xsKSsvUdfNpSwXlqthN8BQEzRze/OQyf9wGQA2cPFrvYDM/oxQ7/tmIG22Pl7
         3YTw==
X-Gm-Message-State: ACgBeo3JqKy/zXj11OLiFkQ+l+b1rPWErKzeGTK7NtgqbxcJm+sd3HG7
        w3dcDosaVxW5MWdTNzrLYRmCngsB0GE=
X-Google-Smtp-Source: AA6agR4OQecV3Ot83Cw9HOafj2fuYFpDvW8ezgF0KI/MQptawo0PFMt3wkpxuS6+41c5QLqTTBTJGg==
X-Received: by 2002:a05:6512:108f:b0:48b:a169:d291 with SMTP id j15-20020a056512108f00b0048ba169d291mr7626357lfg.198.1660649605729;
        Tue, 16 Aug 2022 04:33:25 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f9-20020a056512360900b0048af379957asm1360496lfs.72.2022.08.16.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 04:33:24 -0700 (PDT)
Date:   Tue, 16 Aug 2022 13:33:22 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: tegra: Convert to
 json-schema
Message-ID: <YvuAgsC6+Ew0SjiH@orome>
References: <20220704165802.129717-1-thierry.reding@gmail.com>
 <20220704165802.129717-2-thierry.reding@gmail.com>
 <20220706153822.GA54439-robh@kernel.org>
 <YsXwchhxAdSRPFzD@orome>
 <20220712214504.GR1823936-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gxdgfDYnBKlVGq73"
Content-Disposition: inline
In-Reply-To: <20220712214504.GR1823936-robh@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--gxdgfDYnBKlVGq73
Content-Type: multipart/mixed; boundary="SB/VaAYkhqQmozBq"
Content-Disposition: inline


--SB/VaAYkhqQmozBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 12, 2022 at 03:45:04PM -0600, Rob Herring wrote:
> On Wed, Jul 06, 2022 at 10:28:34PM +0200, Thierry Reding wrote:
> > All of the ones that are separate definitions are properties that appear
> > for only a subset of the IP generations. So the idea was to create a
> > definition and then derived bindings could cherry-pick these as
> > necessary to complement the pinconf-node definition.
> >=20
> > If I move these definitions to the top level, then they'll end up
> > validating properly on devices where they shouldn't exist. Alternatively
> > I'd have to duplicate all of these across various derivative bindings
> > which gets us mostly back to the previous version of the patch (i.e. we
> > don't save very much by only factoring out the truly common properties).
>=20
> Not if you use 'additionalProperties: false'. Since it doesn't see into=
=20
> $ref's like unevaluatedProperties does, you have to list out which=20
> properties you are using in the derived binding:
>=20
> $ref: list-of-common-props.yaml#
>=20
> properties:
>   high-speed-mode: true
>=20
> additionalProperties: false
>=20
> list-of-common-props.yaml could have a gazillion properties in=20
> it, but anything not listed locally will be disallowed.

I tried to restructure as you suggested and things do look better.
Unfortunately I can't find a way to get the result to validate properly.
The problem I'm running into is that these are vendor-specific
properties (with the "nvidia," prefix) and therefore the tools complain
when I list them as above, like so:

	.../Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml:=
 patternProperties:^pinmux(-[a-z0-9-_]+)?$:properties:nvidia,drive-type: Tr=
ue is not of type 'object'
	hint: Vendor specific properties must have a type and description unless t=
hey have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	.../Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml:=
 patternProperties:^pinmux(-[a-z0-9-_]+)?$:properties:nvidia,drive-type: Mo=
re than one condition true in oneOf schema:
	{'description': 'Vendor specific properties must have a type and '
	                'description unless they have a defined, common '
	                'suffix.',
	 'oneOf': [{'additionalProperties': False,
	            'description': 'A vendor boolean property can use "type: '
	                           'boolean"',
	            'properties': {'deprecated': True,
	                           'description': True,
	                           'type': {'const': 'boolean'}},
	            'required': ['type', 'description']},
	           {'additionalProperties': False,
	            'description': 'A vendor string property with exact values '
	                           'has an implicit type',
	            'oneOf': [{'required': ['enum']}, {'required': ['const']}],
	            'properties': {'const': {'type': 'string'},
	                           'deprecated': True,
	                           'description': True,
	                           'enum': {'items': {'type': 'string'}}},
	            'required': ['description']},
	           {'description': 'A vendor property needs a $ref to '
	                           'types.yaml',
	            'oneOf': [{'required': ['$ref']}, {'required': ['allOf']}],
	            'properties': {'$ref': {'pattern': 'types.yaml#/definitions/'},
	                           'allOf': {'items': [{'properties': {'$ref': {'p=
attern': 'types.yaml#/definitions/'}},
	                                                'required': ['$ref']}]}},
	            'required': ['description']},
	           {'description': 'A vendor property can have a $ref to a a '
	                           '$defs schema',
	            'properties': {'$ref': {'pattern': '^#/(definitions|\\$defs)/'=
}},
	            'required': ['$ref']}],
	 'type': 'object'}
	hint: Vendor specific properties must have a type and description unless t=
hey have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

I'm attaching two example files (not the actual patch, because that'd
make this a bit more difficult to review) but this happens for all the
derivatives.

I've been scratching my head for a while now and tried different
combinations, but I can't think of a way to make this work. I'm also not
sure if I'm reading that error report right, but it sounds like the
tooling wants the vendor properties to be fully defined, even for the
simple cases where I just want to mark them as valid (i.e. cancel out
the effect of 'additionalProperties: false'). Is there some special
mechanism that I could somehow enable regular behaviour for these
vendor-specific properties?

Any other ideas on how to fix this?

Thierry

--SB/VaAYkhqQmozBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="nvidia,tegra-pinmux-common.yaml"

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra-pinmux-common.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: NVIDIA Tegra Pinmux Controller

maintainers:
  - Thierry Reding <thierry.reding@gmail.com>
  - Jonathan Hunter <jonathanh@nvidia.com>

description: |
  Please refer to pinctrl-bindings.txt in this directory for details of the
  common pinctrl bindings used by client devices, including the meaning of
  the phrase "pin configuration node".

  Tegra's pin configuration nodes act as a container for an arbitrary number
  of subnodes. Each of these subnodes represents some desired configuration
  for a pin, a group, or a list of pins or groups. This configuration can
  include the mux function to select on those pin(s)/ group(s), and various
  pin configuration parameters, such as pull-up, tristate, drive strength,
  etc.

  The name of each subnode is not important; all subnodes should be
  enumerated and processed purely based on their content.

  Each subnode only affects those parameters that are explicitly listed. In
  other words, a subnode that lists a mux function but no pin configuration
  parameters implies no information about any pin configuration parameters.

  Similarly, a pin subnode that describes a pullup parameter implies no
  information about e.g.  the mux function or tristate parameter. For this
  reason, even seemingly boolean values are actually tristates in this
  binding: unspecified, off, or on. Unspecified is represented as an absent
  property, and off/on are represented as integer values 0 and 1.

  Note that many of these properties are only valid for certain specific pins
  or groups. See the Tegra TRM and various pinmux spreadsheets for complete
  details regarding which groups support which functionality. The Linux
  pinctrl driver may also be a useful reference, since it consolidates,
  disambiguates, and corrects data from all those sources.

properties:
  nvidia,pins:
    $ref: /schemas/types.yaml#/definitions/string-array
    description: An array of strings. Each string contains the name of a pin
      or group.  Valid values for these names are listed below.

  nvidia,function:
    $ref: /schemas/types.yaml#/definitions/string
    description: A string containing the name of the function to mux to the
      pin or group. Valid values for function names are listed below. See the
      Tegra TRM to determine which are valid for each pin or group.

  nvidia,pull:
    description: Pull-down/up setting to apply to the pin.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: none
        const: 0
      - description: down
        const: 1
      - description: up
        const: 2

  nvidia,tristate:
    description: Tristate setting to apply to the pin.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: drive
        const: 0
      - description: tristate
        const: 1

  nvidia,schmitt:
    description: Enable Schmitt trigger on the input.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: disable Schmitt trigger on the input
        const: 0
      - description: enable Schmitt trigger on the input
        const: 1

  nvidia,pull-down-strength:
    description: Controls drive strength. 0 is weakest. The range of valid
      values depends on the pingroup. See "CAL_DRVDN" in the Tegra TRM.
    $ref: /schemas/types.yaml#/definitions/uint32

  nvidia,pull-up-strength:
    description: Controls drive strength. 0 is weakest. The range of valid
      values depends on the pingroup. See "CAL_DRVUP" in the Tegra TRM.
    $ref: /schemas/types.yaml#/definitions/uint32

  nvidia,high-speed-mode:
    description: Enable high speed mode the pins.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: normal speed mode
        const: 0
      - description: high speed mode
        const: 1

  nvidia,low-power-mode:
    description: Controls the drive power or current. Valid values are from 0
      through 3, where 0 specifies the least power and 3 specifies the most
      power. See "Low Power Mode" or "LPMD1" and "LPMD0" in the Tegra TRM.
    $ref: /schemas/types.yaml#/definitions/uint32
    enum: [ 0, 1, 2, 3 ]

  nvidia,enable-input:
    description: Enable the pin's input path.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: disable input (i.e. output only)
        const: 0
      - description: enable input
        const: 1

  nvidia,open-drain:
    description: Open-drain configuration for the pin.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: disable open-drain
        const: 0
      - description: enable open-drain
        const: 1

  nvidia,lock:
    description: Lock the pin configuration against further changes until
      reset.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: disable pin configuration lock
        const: 0
      - description: enable pin configuration lock
        const: 1

  nvidia,io-reset:
    description: reset the I/O path
    $ref: /schemas/types.yaml#/definitions/uint32
    enum: [ 0, 1 ]

  nvidia,rcv-sel:
    description: select VIL/VIH receivers
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: normal receivers
        const: 0
      - description: high-voltage receivers
        const: 1

  nvidia,drive-type:
    description: Drive type to configure for the pin.
    $ref: /schemas/types.yaml#/definitions/uint32
    enum: [ 0, 1, 2, 3 ]

  nvidia,io-hv:
    description: Select high-voltage receivers.
    $ref: /schemas/types.yaml#/definitions/uint32
    oneOf:
      - description: Use normal receivers.
        const: 0
      - description: Use high-voltage receivers.
        const: 1

  nvidia,slew-rate-rising:
    description: Controls rising signal slew rate. 0 is fastest. The range of
      valid values depends on the pingroup. See "DRVDN_SLWR" in the Tegra TRM.
    $ref: /schemas/types.yaml#/definitions/uint32

  nvidia,slew-rate-falling:
    description: Controls falling signal slew rate. 0 is fastest. The range of
      valid values depends on the pingroup. See "DRVUP_SLWF" in the Tegra TRM.
    $ref: /schemas/types.yaml#/definitions/uint32

additionalProperties: true
...

--SB/VaAYkhqQmozBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline; filename="nvidia,tegra194-pinmux.yaml"

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra194-pinmux.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: NVIDIA Tegra194 Pinmux Controller

maintainers:
  - Thierry Reding <thierry.reding@gmail.com>
  - Jon Hunter <jonathanh@nvidia.com>

properties:
  compatible:
    enum:
      - nvidia,tegra194-pinmux
      - nvidia,tegra194-pinmux-aon

  reg:
    items:
      - description: pinmux registers

patternProperties:
  "^pinmux(-[a-z0-9-_]+)?$":
    $ref: nvidia,tegra-pinmux-common.yaml
    additionalProperties: false
    properties:
      nvidia,function:
        enum: [ aud, can0, can1, ccla, dca, dcb, dgpu, directdc, directdc1,
                displaya, displayb, dmic1, dmic2, dmic3, dmic4, dmic5, dp,
                dspk0, dspk1, eqos, extperiph1, extperiph2, extperiph3,
                extperiph4, gp, gpio, hdmi, i2c1, i2c2, i2c3, i2c5, i2c8,
                i2s1, i2s2, i2s3, i2s4, i2s5, i2s6, igpu, iqc1, iqc2, mipi,
                nv, pe0, pe1, pe2, pe3, pe4, pe5, qspi, qspi0, qspi1, rsvd0,
                rsvd1, rsvd2, rsvd3, sata, sce, sdmmc1, sdmmc3, sdmmc4, slvs,
                soc, spdif, spi1, spi2, spi3, touch, uarta, uartb, uartc,
                uartd, uarte, uartg, ufs0, usb, vgp1, vgp2, vgp3, vgp4, vgp5,
                vgp6, wdt ]

      nvidia,enable-input: true
      nvidia,open-drain: true
      nvidia,lock: true
      nvidia,io-hv: true
      nvidia,drive-type: true

    required:
      - nvidia,pins

additionalProperties: false

allOf:
  - if:
      properties:
        compatible:
          const: nvidia,tegra194-pinmux
    then:
      patternProperties:
        "^pinmux(-[a-z0-9-_]+)?$":
          type: object
          properties:
            nvidia,pins:
              description: An array of strings. Each string contains the name
                of a pin or group. Valid values for these names are listed
                below.

                Note that the pex_l5_clkreq_n_pgg0 and pex_l5_rst_n_pgg1 pins
                are part of PCIE C5 power partition. Client devices must
                enable this partition before accessing the configuration for
                these pins.
              items:
                enum: [ dap6_sclk_pa0, dap6_dout_pa1, dap6_din_pa2,
                        dap6_fs_pa3, dap4_sclk_pa4, dap4_dout_pa5,
                        dap4_din_pa6, dap4_fs_pa7, cpu_pwr_req_0_pb0,
                        cpu_pwr_req_1_pb1, qspi0_sck_pc0, qspi0_cs_n_pc1,
                        qspi0_io0_pc2, qspi0_io1_pc3, qspi0_io2_pc4,
                        qspi0_io3_pc5, qspi1_sck_pc6, qspi1_cs_n_pc7,
                        qspi1_io0_pd0, qspi1_io1_pd1, qspi1_io2_pd2,
                        qspi1_io3_pd3, eqos_txc_pe0, eqos_td0_pe1,
                        eqos_td1_pe2, eqos_td2_pe3, eqos_td3_pe4,
                        eqos_tx_ctl_pe5, eqos_rd0_pe6, eqos_rd1_pe7,
                        eqos_rd2_pf0, eqos_rd3_pf1, eqos_rx_ctl_pf2,
                        eqos_rxc_pf3, eqos_sma_mdio_pf4, eqos_sma_mdc_pf5,
                        soc_gpio00_pg0, soc_gpio01_pg1, soc_gpio02_pg2,
                        soc_gpio03_pg3, soc_gpio08_pg4, soc_gpio09_pg5,
                        soc_gpio10_pg6, soc_gpio11_pg7, soc_gpio12_ph0,
                        soc_gpio13_ph1, soc_gpio14_ph2, uart4_tx_ph3,
                        uart4_rx_ph4, uart4_rts_ph5, uart4_cts_ph6,
                        dap2_sclk_ph7, dap2_dout_pi0, dap2_din_pi1,
                        dap2_fs_pi2, gen1_i2c_scl_pi3, gen1_i2c_sda_pi4,
                        sdmmc1_clk_pj0, sdmmc1_cmd_pj1, sdmmc1_dat0_pj2,
                        sdmmc1_dat1_pj3, sdmmc1_dat2_pj4, sdmmc1_dat3_pj5,
                        pex_l0_clkreq_n_pk0, pex_l0_rst_n_pk1,
                        pex_l1_clkreq_n_pk2, pex_l1_rst_n_pk3,
                        pex_l2_clkreq_n_pk4, pex_l2_rst_n_pk5,
                        pex_l3_clkreq_n_pk6, pex_l3_rst_n_pk7,
                        pex_l4_clkreq_n_pl0, pex_l4_rst_n_pl1,
                        pex_wake_n_pl2, sata_dev_slp_pl3, dp_aux_ch0_hpd_pm0,
                        dp_aux_ch1_hpd_pm1, dp_aux_ch2_hpd_pm2,
                        dp_aux_ch3_hpd_pm3, hdmi_cec_pm4, soc_gpio50_pm5,
                        soc_gpio51_pm6, soc_gpio52_pm7, soc_gpio53_pn0,
                        soc_gpio54_pn1, soc_gpio55_pn2, sdmmc3_clk_po0,
                        sdmmc3_cmd_po1, sdmmc3_dat0_po2, sdmmc3_dat1_po3,
                        sdmmc3_dat2_po4, sdmmc3_dat3_po5, extperiph1_clk_pp0,
                        extperiph2_clk_pp1, cam_i2c_scl_pp2, cam_i2c_sda_pp3,
                        soc_gpio04_pp4, soc_gpio05_pp5, soc_gpio06_pp6,
                        soc_gpio07_pp7, soc_gpio20_pq0, soc_gpio21_pq1,
                        soc_gpio22_pq2, soc_gpio23_pq3, soc_gpio40_pq4,
                        soc_gpio41_pq5, soc_gpio42_pq6, soc_gpio43_pq7,
                        soc_gpio44_pr0, soc_gpio45_pr1, uart1_tx_pr2,
                        uart1_rx_pr3, uart1_rts_pr4, uart1_cts_pr5,
                        dap1_sclk_ps0, dap1_dout_ps1, dap1_din_ps2,
                        dap1_fs_ps3, aud_mclk_ps4, soc_gpio30_ps5,
                        soc_gpio31_ps6, soc_gpio32_ps7, soc_gpio33_pt0,
                        dap3_sclk_pt1, dap3_dout_pt2, dap3_din_pt3,
                        dap3_fs_pt4, dap5_sclk_pt5, dap5_dout_pt6,
                        dap5_din_pt7, dap5_fs_pu0, directdc1_clk_pv0,
                        directdc1_in_pv1, directdc1_out0_pv2,
                        directdc1_out1_pv3, directdc1_out2_pv4,
                        directdc1_out3_pv5, directdc1_out4_pv6,
                        directdc1_out5_pv7, directdc1_out6_pw0,
                        directdc1_out7_pw1, gpu_pwr_req_px0, cv_pwr_req_px1,
                        gp_pwm2_px2, gp_pwm3_px3, uart2_tx_px4, uart2_rx_px5,
                        uart2_rts_px6, uart2_cts_px7, spi3_sck_py0,
                        spi3_miso_py1, spi3_mosi_py2, spi3_cs0_py3,
                        spi3_cs1_py4, uart5_tx_py5, uart5_rx_py6,
                        uart5_rts_py7, uart5_cts_pz0, usb_vbus_en0_pz1,
                        usb_vbus_en1_pz2, spi1_sck_pz3, spi1_miso_pz4,
                        spi1_mosi_pz5, spi1_cs0_pz6, spi1_cs1_pz7,
                        ufs0_ref_clk_pff0, ufs0_rst_pff1,
                        pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1,
                        directdc_comp, sdmmc4_clk, sdmmc4_cmd, sdmmc4_dqs,
                        sdmmc4_dat7, sdmmc4_dat6, sdmmc4_dat5, sdmmc4_dat4,
                        sdmmc4_dat3, sdmmc4_dat2, sdmmc4_dat1, sdmmc4_dat0,
                        sdmmc1_comp, sdmmc1_hv_trim, sdmmc3_comp,
                        sdmmc3_hv_trim, eqos_comp, qspi_comp,
                        # drive groups
                        drive_soc_gpio33_pt0, drive_soc_gpio32_ps7,
                        drive_soc_gpio31_ps6, drive_soc_gpio30_ps5,
                        drive_aud_mclk_ps4, drive_dap1_fs_ps3,
                        drive_dap1_din_ps2, drive_dap1_dout_ps1,
                        drive_dap1_sclk_ps0, drive_dap3_fs_pt4,
                        drive_dap3_din_pt3, drive_dap3_dout_pt2,
                        drive_dap3_sclk_pt1, drive_dap5_fs_pu0,
                        drive_dap5_din_pt7, drive_dap5_dout_pt6,
                        drive_dap5_sclk_pt5, drive_dap6_fs_pa3,
                        drive_dap6_din_pa2, drive_dap6_dout_pa1,
                        drive_dap6_sclk_pa0, drive_dap4_fs_pa7,
                        drive_dap4_din_pa6, drive_dap4_dout_pa5,
                        drive_dap4_sclk_pa4, drive_extperiph2_clk_pp1,
                        drive_extperiph1_clk_pp0, drive_cam_i2c_sda_pp3,
                        drive_cam_i2c_scl_pp2, drive_soc_gpio40_pq4,
                        drive_soc_gpio41_pq5, drive_soc_gpio42_pq6,
                        drive_soc_gpio43_pq7, drive_soc_gpio44_pr0,
                        drive_soc_gpio45_pr1, drive_soc_gpio20_pq0,
                        drive_soc_gpio21_pq1, drive_soc_gpio22_pq2,
                        drive_soc_gpio23_pq3, drive_soc_gpio04_pp4,
                        drive_soc_gpio05_pp5, drive_soc_gpio06_pp6,
                        drive_soc_gpio07_pp7, drive_uart1_cts_pr5,
                        drive_uart1_rts_pr4, drive_uart1_rx_pr3,
                        drive_uart1_tx_pr2, drive_dap2_din_pi1,
                        drive_dap2_dout_pi0, drive_dap2_fs_pi2,
                        drive_dap2_sclk_ph7, drive_uart4_cts_ph6,
                        drive_uart4_rts_ph5, drive_uart4_rx_ph4,
                        drive_uart4_tx_ph3, drive_soc_gpio03_pg3,
                        drive_soc_gpio02_pg2, drive_soc_gpio01_pg1,
                        drive_soc_gpio00_pg0, drive_gen1_i2c_scl_pi3,
                        drive_gen1_i2c_sda_pi4, drive_soc_gpio08_pg4,
                        drive_soc_gpio09_pg5, drive_soc_gpio10_pg6,
                        drive_soc_gpio11_pg7, drive_soc_gpio12_ph0,
                        drive_soc_gpio13_ph1, drive_soc_gpio14_ph2,
                        drive_soc_gpio50_pm5, drive_soc_gpio51_pm6,
                        drive_soc_gpio52_pm7, drive_soc_gpio53_pn0,
                        drive_soc_gpio54_pn1, drive_soc_gpio55_pn2,
                        drive_dp_aux_ch0_hpd_pm0, drive_dp_aux_ch1_hpd_pm1,
                        drive_dp_aux_ch2_hpd_pm2, drive_dp_aux_ch3_hpd_pm3,
                        drive_hdmi_cec_pm4, drive_pex_l2_clkreq_n_pk4,
                        drive_pex_wake_n_pl2, drive_pex_l1_clkreq_n_pk2,
                        drive_pex_l1_rst_n_pk3, drive_pex_l0_clkreq_n_pk0,
                        drive_pex_l0_rst_n_pk1, drive_pex_l2_rst_n_pk5,
                        drive_pex_l3_clkreq_n_pk6, drive_pex_l3_rst_n_pk7,
                        drive_pex_l4_clkreq_n_pl0, drive_pex_l4_rst_n_pl1,
                        drive_sata_dev_slp_pl3, drive_pex_l5_clkreq_n_pgg0,
                        drive_pex_l5_rst_n_pgg1, drive_cpu_pwr_req_1_pb1,
                        drive_cpu_pwr_req_0_pb0, drive_sdmmc1_clk_pj0,
                        drive_sdmmc1_cmd_pj1, drive_sdmmc1_dat3_pj5,
                        drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
                        drive_sdmmc1_dat0_pj2, drive_sdmmc3_dat3_po5,
                        drive_sdmmc3_dat2_po4, drive_sdmmc3_dat1_po3,
                        drive_sdmmc3_dat0_po2, drive_sdmmc3_cmd_po1,
                        drive_sdmmc3_clk_po0, drive_gpu_pwr_req_px0,
                        drive_spi3_miso_py1, drive_spi1_cs0_pz6,
                        drive_spi3_cs0_py3, drive_spi1_miso_pz4,
                        drive_spi3_cs1_py4, drive_gp_pwm3_px3,
                        drive_gp_pwm2_px2, drive_spi1_sck_pz3,
                        drive_spi3_sck_py0, drive_spi1_cs1_pz7,
                        drive_spi1_mosi_pz5, drive_spi3_mosi_py2,
                        drive_cv_pwr_req_px1, drive_uart2_tx_px4,
                        drive_uart2_rx_px5, drive_uart2_rts_px6,
                        drive_uart2_cts_px7, drive_uart5_rx_py6,
                        drive_uart5_tx_py5, drive_uart5_rts_py7,
                        drive_uart5_cts_pz0, drive_usb_vbus_en0_pz1,
                        drive_usb_vbus_en1_pz2, drive_ufs0_rst_pff1,
                        drive_ufs0_ref_clk_pff0 ]

  - if:
      properties:
        compatible:
          const: nvidia,tegra194-pinmux-aon
    then:
      patternProperties:
        "^pinmux(-[a-z0-9-_]+)?$":
          type: object
          properties:
            nvidia,pins:
              items:
                enum: [ can1_dout_paa0, can1_din_paa1, can0_dout_paa2,
                        can0_din_paa3, can0_stb_paa4, can0_en_paa5,
                        can0_wake_paa6, can0_err_paa7, can1_stb_pbb0,
                        can1_en_pbb1, can1_wake_pbb2, can1_err_pbb3,
                        spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
                        spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
                        uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
                        gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
                        safe_state_pee0, vcomp_alert_pee1,
                        ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
                        pwr_i2c_scl_pee5, pwr_i2c_sda_pee6, sys_reset_n,
                        shutdown_n, pmu_int_n, soc_pwr_req, clk_32k_in,
                        # drive groups
                        drive_shutdown_n, drive_pmu_int_n,
                        drive_safe_state_pee0, drive_vcomp_alert_pee1,
                        drive_soc_pwr_req, drive_batt_oc_pee3,
                        drive_clk_32k_in, drive_power_on_pee4,
                        drive_pwr_i2c_scl_pee5, drive_pwr_i2c_sda_pee6,
                        drive_ao_retention_n_pee2, drive_touch_clk_pcc4,
                        drive_uart3_rx_pcc6, drive_uart3_tx_pcc5,
                        drive_gen8_i2c_sda_pdd2, drive_gen8_i2c_scl_pdd1,
                        drive_spi2_mosi_pcc2, drive_gen2_i2c_scl_pcc7,
                        drive_spi2_cs0_pcc3, drive_gen2_i2c_sda_pdd0,
                        drive_spi2_sck_pcc0, drive_spi2_miso_pcc1,
                        drive_can1_dout_paa0, drive_can1_din_paa1,
                        drive_can0_dout_paa2, drive_can0_din_paa3,
                        drive_can0_stb_paa4, drive_can0_en_paa5,
                        drive_can0_wake_paa6, drive_can0_err_paa7,
                        drive_can1_stb_pbb0, drive_can1_en_pbb1,
                        drive_can1_wake_pbb2, drive_can1_err_pbb3 ]

required:
  - compatible
  - reg

examples:
  - |
    #include <dt-bindings/pinctrl/pinctrl-tegra.h>

    pinmux@2430000 {
      compatible = "nvidia,tegra194-pinmux";
      reg = <0x2430000 0x17000>;

      pinctrl-names = "pex_rst";
      pinctrl-0 = <&pex_rst_c5_out_state>;

      pex_rst_c5_out_state: pex_rst_c5_out {
        pex_rst {
          nvidia,pins = "pex_l5_rst_n_pgg1";
          nvidia,schmitt = <TEGRA_PIN_DISABLE>;
          nvidia,enable-input = <TEGRA_PIN_DISABLE>;
          nvidia,io-hv = <TEGRA_PIN_ENABLE>;
          nvidia,tristate = <TEGRA_PIN_DISABLE>;
          nvidia,pull = <TEGRA_PIN_PULL_NONE>;
        };
      };
    };
...

--SB/VaAYkhqQmozBq--

--gxdgfDYnBKlVGq73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmL7gH8ACgkQ3SOs138+
s6HoHQ/+KuIPiOsKB+DhkthCaNjoyxg1ygzKK9H9+a76Jsyl4iCKaeDjLnT0o9xe
BHP1+D0cLs5p6SSLL2naqhFvUpMJkZ6cJUOIgf+OZenCcyLnnqSwqfgP4ALoVMyn
zEnnCrZ7+iOs4XYUOP/vfHoTKRAGN7KrluhC6TYHksJm5wZzuVBh0g37pEyG17mB
71mFCku0pNLrzoYpHm24X8diGsA40hHkdi23Bh8APZnPkhS6z+epHjFHkR7TjaV7
D3aZfhIM3t9PDD0lsuRvIJPJtA+VwZr89Csm3c5NGmpip+QYO1YXTwTH+OeU/pDN
bhMunLnMTk5STvDnMy39ZXUsyGkO2yqqLYx8z5mQizjKonnBnTOMjinJFboHJ9ea
K/iddDyyfswy7LE7l72bhyvgKXvwLuyTTrrSsE0hbQUXeu7aH8x4+oMaWGzBSUTG
rycNsmgx+gmeiIfmfjwbdFIp4FJu/AVWcwXq4XpU2qBwAuuhTvhB7hhRdOwt1776
EU9ucvEEQ+W5UKBY4y7cLYOUBVGb9SKxPZZf/GiMkOP4aDIOy/mOl+wWwNCDAxM8
PbShaJ9z8i/x/3Cvfkkr9cZ3JZkU8ZWJL7WAnY/1Runryt4XUOMQnb+gBvu7oOQM
CewM56v5S26Leke7qOP45pM0BwWsaFsPwhKeLYkBah8untVOi84=
=/XT4
-----END PGP SIGNATURE-----

--gxdgfDYnBKlVGq73--
