Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1E468EDDD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 12:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjBHLYm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 06:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBHLYm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 06:24:42 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C45F9;
        Wed,  8 Feb 2023 03:24:40 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id gr7so50382541ejb.5;
        Wed, 08 Feb 2023 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYGxaid16OewPp7JYX2IfQpS/lVIAsZabHKaBKr1xCQ=;
        b=jCii1MjJQT7QsqY9KMoeOBivR94ys4fYXdm22Jyb9QOMHiljc/hQqW9Wj9sxLOE1aS
         4Fz7Xgj5wCbFKvlVSmwspfjBX2iK0PRvQxvbBhybDzXM1Iqd6zFa8uoeAOUg6K9eHOti
         41xafyv3r3JCBEK0xcfhppgkSc9HRB2vWwMMUQi1onjrqtUH7SUNuL9+qGwABnAqpxjv
         WmWoinevqLAIkKADTQsrAyhbeZSqYRVPqn9Z2yOpSpvrJZlBEMruRfhHx0YSjzoU96hS
         o7WARhQG8AmuOnVFN3SOf+hS/ShINRxtS4VPEtJDI4Mtho4hzYHENcqc7kioErHOtMeu
         LgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYGxaid16OewPp7JYX2IfQpS/lVIAsZabHKaBKr1xCQ=;
        b=SpakvU/qqYxF7PukD6RZcOCOiF3N+zKi4ubPRQzs3tpg+526gjZYH/5gYSvQPRGTfB
         zihaHB4JpBaY4z52VhvtKsnzrewg1YSssmGlKhNvspx/rgf9CZ/j/LmxWtigM0sz4H1P
         lzQGMMT3U4vyQ988CzD9nnCnFztU47YpX7qXdyF9jSM7MX8dlaVE+8h0CqxCfGyJJW9E
         yh8MVaKo9sKmxkIvFm0LxRb48by9kI7drHA9U+UiL1woxwM+Z68jAO1ypCrPdeCqEFgZ
         E7Aw4Q5L1IGndewRnYQ90fdIIm/QvEeDyXNZ3FGJcpuRvlscUKe86hllz3AjZsjfjF4r
         5IZw==
X-Gm-Message-State: AO0yUKW+NqcglpvzJ91FTSGHktDZhgo1BqQZhPYi4KtoFJEbGruK2ux7
        O32qLa/cV1kiJWPcSSUvoSaGOQI2ZCo=
X-Google-Smtp-Source: AK7set+k4HOfLuwMt2PbaWFj7qWK0Zl7Ouex3DVO1A2bN9ivMFhstLrseJRt7Kf0FwYgGBkFttyCNA==
X-Received: by 2002:a17:907:8b8b:b0:8aa:f2f2:7543 with SMTP id tb11-20020a1709078b8b00b008aaf2f27543mr3623306ejc.29.1675855478546;
        Wed, 08 Feb 2023 03:24:38 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906609500b008a58c3b8daesm3577835ejj.164.2023.02.08.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 03:24:38 -0800 (PST)
Date:   Wed, 8 Feb 2023 12:24:36 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Prathamesh Shete <pshete@nvidia.com>, jonathanh@nvidia.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Message-ID: <Y+OGdMFQkL9Dtaq/@orome>
References: <20230207115617.12088-1-pshete@nvidia.com>
 <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hi0dF3tmrcP5Kur0"
Content-Disposition: inline
In-Reply-To: <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--hi0dF3tmrcP5Kur0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 04:33:08PM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2023 12:56, Prathamesh Shete wrote:
> > Add DT binding doc for Tegra234 pinmux driver.
>=20
> Subject: drop second/last, redundant "DT binding doc". The "dt-bindings"
> prefix is already stating that these are bindings. Which basically means
> your subject is quite empty...
>=20
> >=20
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > ---
> >  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
> >  1 file changed, 232 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,te=
gra234-pinmux.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-=
pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pin=
mux.yaml
> > new file mode 100644
> > index 000000000000..56b8d364c605
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.=
yaml
> > @@ -0,0 +1,232 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra234 Pinmux Controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra234-pinmux
> > +      - nvidia,tegra234-pinmux-aon
> > +
> > +  reg:
> > +    items:
> > +      - description: pinmux registers
> > +
> > +patternProperties:
> > +  "^pinmux(-[a-z0-9-_]+)?$":
>=20
> Underscore is not a valid character

This is again the same as for Tegra194. I don't think we use underscores
in any pinmux node names at the moment, so we should be able to remove
that one.

>=20
> > +    type: object
> > +    properties:
> > +      phandle: true
> > +
> > +    # pin groups
> > +    additionalProperties:
> > +      $ref: nvidia,tegra-pinmux-common.yaml
> > +      unevaluatedProperties: false
> > +      properties:
> > +        nvidia,function:
> > +          enum: [ gp, uartc, i2c8, spi2, i2c2, can1, can0, rsvd0, eth0=
, eth2,
> > +                  eth1, dp, eth3, i2c4, i2c7, i2c9, eqos, pe2, pe1, pe=
0, pe3,
> > +                  pe4, pe5, pe6, pe7, pe8, pe9, pe10, qspi0, qspi1, qp=
si,
> > +                  sdmmc1, sce, soc, gpio, hdmi, ufs0, spi3, spi1, uart=
b, uarte,
> > +                  usb, extperiph2, extperiph1, i2c3, vi0, i2c5, uarta,=
 uartd,
> > +                  i2c1, i2s4, i2s6, aud, spi5, touch, uartj, rsvd1, wd=
t, tsc,
> > +                  dmic3, led, vi0_alt, i2s5, nv, extperiph3, extperiph=
4, spi4,
> > +                  ccla, i2s1, i2s2, i2s3, i2s8, rsvd2, dmic5, dca, dis=
playb,
> > +                  displaya, vi1, dcb, dmic1, dmic4, i2s7, dmic2, dspk0=
, rsvd3,
> > +                  tsc_alt, istctrl, vi1_alt, dspk1, igpu ]
> > +
> > +        nvidia,pull: true
> > +        nvidia,tristate: true
> > +        nvidia,schmitt: true
> > +        nvidia,enable-input: true
> > +        nvidia,open-drain: true
> > +        nvidia,lock: true
> > +        nvidia,drive-type: true
> > +        nvidia,io-hv: true
> > +
> > +      required:
> > +        - nvidia,pins
> > +
> > +additionalProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: nvidia,tegra234-pinmux
> > +    then:
> > +      patternProperties:
> > +        "^pinmux(-[a-z0-9-_]+)?$":
>=20
> Underscore is not a valid character
>=20
> > +          type: object
> > +          additionalProperties:
> > +            properties:
> > +              nvidia,pins:
> > +                description: An array of strings. Each string contains=
 the name
> > +                  of a pin or group. Valid values for these names are =
listed
> > +                  below.
>=20
> Define properties in top level, which points to the complexity of your
> if-else, thus probably this should be split into two bindings. Dunno,
> your other bindings repeat this pattern :(

The property itself is already defined in the common schema found in
nvidia,tegra-pinmux-common.yaml and we're overriding this here for each
instance since each has its own set of pins.

This was a compromise to avoid too many bindings. Originally I attempted
to roll all Tegra pinctrl bindings into a single dt-schema, but that
turned out truly horrible =3D) Splitting this into per-SoC bindings is
already causing a lot of duplication in these files, though splitting
off the common bits into nvidi,tegra-pinmux-common.yaml helps a bit with
that already. Splitting this into per-instance bindings would
effectively duplicate everything but the pin array here, so we kind of
settled on this compromise for Tegra194.

We're taking a bit of a shortcut here already, since technically not all
pins support all the functions listed above. On the other hand, fully
accurately describing per-pin functions would make this a total mess, so
again, we use this simplified representation as a compromise.

>=20
> > +
> > +                items:
> > +                  enum: [ dap6_sclk_pa0, dap6_dout_pa1, dap6_din_pa2,
> > +                          dap6_fs_pa3, dap4_sclk_pa4, dap4_dout_pa5,
> > +                          dap4_din_pa6, dap4_fs_pa7, soc_gpio08_pb0,
> > +                          qspi0_sck_pc0, qspi0_cs_n_pc1,
> > +                          qspi0_io0_pc2, qspi0_io1_pc3, qspi0_io2_pc4,
> > +                          qspi0_io3_pc5, qspi1_sck_pc6, qspi1_cs_n_pc7,
> > +                          qspi1_io0_pd0, qspi1_io1_pd1, qspi1_io2_pd2,
> > +                          qspi1_io3_pd3, eqos_txc_pe0, eqos_td0_pe1,
> > +                          eqos_td1_pe2, eqos_td2_pe3, eqos_td3_pe4,
> > +                          eqos_tx_ctl_pe5, eqos_rd0_pe6, eqos_rd1_pe7,
> > +                          eqos_rd2_pf0, eqos_rd3_pf1, eqos_rx_ctl_pf2,
> > +                          eqos_rxc_pf3, eqos_sma_mdio_pf4, eqos_sma_md=
c_pf5,
> > +                          soc_gpio13_pg0, soc_gpio14_pg1, soc_gpio15_p=
g2,
> > +                          soc_gpio16_pg3, soc_gpio17_pg4, soc_gpio18_p=
g5,
> > +                          soc_gpio19_pg6, soc_gpio20_pg7, soc_gpio21_p=
h0,
> > +                          soc_gpio22_ph1, soc_gpio06_ph2, uart4_tx_ph3,
> > +                          uart4_rx_ph4, uart4_rts_ph5, uart4_cts_ph6,
> > +                          soc_gpio41_ph7, soc_gpio42_pi0, soc_gpio43_p=
i1,
> > +                          soc_gpio44_pi2, gen1_i2c_scl_pi3, gen1_i2c_s=
da_pi4,
> > +                          cpu_pwr_req_pi5, soc_gpio07_pi6,
> > +                          sdmmc1_clk_pj0, sdmmc1_cmd_pj1, sdmmc1_dat0_=
pj2,
> > +                          sdmmc1_dat1_pj3, sdmmc1_dat2_pj4, sdmmc1_dat=
3_pj5,
> > +                          pex_l0_clkreq_n_pk0, pex_l0_rst_n_pk1,
> > +                          pex_l1_clkreq_n_pk2, pex_l1_rst_n_pk3,
> > +                          pex_l2_clkreq_n_pk4, pex_l2_rst_n_pk5,
> > +                          pex_l3_clkreq_n_pk6, pex_l3_rst_n_pk7,
> > +                          pex_l4_clkreq_n_pl0, pex_l4_rst_n_pl1,
> > +                          pex_wake_n_pl2, soc_gpio34_pl3, dp_aux_ch0_h=
pd_pm0,
> > +                          dp_aux_ch1_hpd_pm1, dp_aux_ch2_hpd_pm2,
> > +                          dp_aux_ch3_hpd_pm3, soc_gpio55_pm4, soc_gpio=
36_pm5,
> > +                          soc_gpio53_pm6, soc_gpio38_pm7, dp_aux_ch3_n=
_pn0,
> > +                          soc_gpio39_pn1, soc_gpio40_pn2, dp_aux_ch1_p=
_pn3,
> > +                          dp_aux_ch1_n_pn4, dp_aux_ch2_p_pn5, dp_aux_c=
h2_n_pn6,
> > +                          dp_aux_ch3_p_pn7, extperiph1_clk_pp0,
> > +                          extperiph2_clk_pp1, cam_i2c_scl_pp2, cam_i2c=
_sda_pp3,
> > +                          soc_gpio23_pp4, soc_gpio24_pp5, soc_gpio25_p=
p6,
> > +                          pwr_i2c_scl_pp7, pwr_i2c_sda_pq0, soc_gpio28=
_pq1,
> > +                          soc_gpio29_pq2, soc_gpio30_pq3, soc_gpio31_p=
q4,
> > +                          soc_gpio32_pq5, soc_gpio33_pq6, soc_gpio35_p=
q7,
> > +                          soc_gpio37_pr0, soc_gpio56_pr1, uart1_tx_pr2,
> > +                          uart1_rx_pr3, uart1_rts_pr4, uart1_cts_pr5,
> > +                          soc_gpio61_pw0, soc_gpio62_pw1, gpu_pwr_req_=
px0, cv_pwr_req_px1,
> > +                          gp_pwm2_px2, gp_pwm3_px3, uart2_tx_px4, uart=
2_rx_px5,
> > +                          uart2_rts_px6, uart2_cts_px7, spi3_sck_py0,
> > +                          spi3_miso_py1, spi3_mosi_py2, spi3_cs0_py3,
> > +                          spi3_cs1_py4, uart5_tx_py5, uart5_rx_py6,
> > +                          uart5_rts_py7, uart5_cts_pz0, usb_vbus_en0_p=
z1,
> > +                          usb_vbus_en1_pz2, spi1_sck_pz3, spi1_miso_pz=
4,
> > +                          spi1_mosi_pz5, spi1_cs0_pz6, spi1_cs1_pz7,
> > +                          spi5_sck_pac0, spi5_miso_pac1, spi5_mosi_pac=
2,
> > +                          spi5_cs0_pac3, soc_gpio57_pac4, soc_gpio58_p=
ac5,
> > +                          soc_gpio59_pac6, soc_gpio60_pac7, soc_gpio45=
_pad0,
> > +                          soc_gpio46_pad1, soc_gpio47_pad2, soc_gpio48=
_pad3,
> > +                          ufs0_ref_clk_pae0, ufs0_rst_n_pae1,
> > +                          pex_l5_clkreq_n_paf0, pex_l5_rst_n_paf1,
> > +                          pex_l6_clkreq_n_paf2, pex_l6_rst_n_paf3,
> > +                          pex_l7_clkreq_n_pag0, pex_l7_rst_n_pag1,
> > +                          pex_l8_clkreq_n_pag2, pex_l8_rst_n_pag3,
> > +                          pex_l9_clkreq_n_pag4, pex_l9_rst_n_pag5,
> > +                          pex_l10_clkreq_n_pag6, pex_l10_rst_n_pag7,
> > +                          sdmmc1_comp, eqos_comp, qspi_comp,
> > +                          # drive groups
> > +                          drive_soc_gpio08_pb0, drive_soc_gpio36_pm5,
> > +                          drive_soc_gpio53_pm6, drive_soc_gpio55_pm4,
> > +                          drive_soc_gpio38_pm7, drive_soc_gpio39_pn1,
> > +                          drive_soc_gpio40_pn2, drive_dp_aux_ch0_hpd_p=
m0,
> > +                          drive_dp_aux_ch1_hpd_pm1, drive_dp_aux_ch2_h=
pd_pm2,
> > +                          drive_dp_aux_ch3_hpd_pm3, drive_dp_aux_ch1_p=
_pn3,
> > +                          drive_dp_aux_ch1_n_pn4, drive_dp_aux_ch2_p_p=
n5,
> > +                          drive_dp_aux_ch2_n_pn6, drive_dp_aux_ch3_p_p=
n7,
> > +                          drive_dp_aux_ch3_n_pn0, drive_pex_l2_clkreq_=
n_pk4,
> > +                          drive_pex_wake_n_pl2, drive_pex_l1_clkreq_n_=
pk2,
> > +                          drive_pex_l1_rst_n_pk3, drive_pex_l0_clkreq_=
n_pk0,
> > +                          drive_pex_l0_rst_n_pk1, drive_pex_l2_rst_n_p=
k5,
> > +                          drive_pex_l3_clkreq_n_pk6, drive_pex_l3_rst_=
n_pk7,
> > +                          drive_pex_l4_clkreq_n_pl0, drive_pex_l4_rst_=
n_pl1,
> > +                          drive_soc_gpio34_pl3, drive_pex_l5_clkreq_n_=
paf0,
> > +                          drive_pex_l5_rst_n_paf1, drive_pex_l6_clkreq=
_n_paf2,
> > +                          drive_pex_l6_rst_n_paf3, drive_pex_l10_clkre=
q_n_pag6,
> > +                          drive_pex_l10_rst_n_pag7, drive_pex_l7_clkre=
q_n_pag0,
> > +                          drive_pex_l7_rst_n_pag1, drive_pex_l8_clkreq=
_n_pag2,
> > +                          drive_pex_l8_rst_n_pag3, drive_pex_l9_clkreq=
_n_pag4,
> > +                          drive_pex_l9_rst_n_pag5, drive_sdmmc1_clk_pj=
0,
> > +                          drive_sdmmc1_cmd_pj1, drive_sdmmc1_dat3_pj5,
> > +                          drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
> > +                          drive_sdmmc1_dat0_pj2 ]
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: nvidia,tegra234-pinmux-aon
> > +    then:
> > +      patternProperties:
> > +        "^pinmux(-[a-z0-9-_]+)?$":
>=20
> No underscores
>=20
> > +          type: object
> > +          additionalProperties:
> > +            properties:
> > +              nvidia,pins:
> > +                items:
> > +                  enum: [ can0_dout_paa0, can0_din_paa1, can1_dout_paa=
2,
> > +                          can1_din_paa3, can0_stb_paa4, can0_en_paa5,
> > +                          soc_gpio49_paa6, can0_err_paa7, can1_stb_pbb=
0,
> > +                          can1_en_pbb1, soc_gpio50_pbb2, can1_err_pbb3,
> > +                          spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc=
2,
> > +                          spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
> > +                          uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_s=
da_pdd0,
> > +                          gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
> > +                          sce_error_pee0, vcomp_alert_pee1,
> > +                          ao_retention_n_pee2, batt_oc_pee3, power_on_=
pee4,
> > +                          soc_gpio26_pee5, soc_gpio27_pee6, bootv_ctl_=
n_pee7,
> > +                          hdmi_cec_pgg0,
> > +                          # drive groups
> > +                          drive_touch_clk_pcc4, drive_uart3_rx_pcc6,
> > +                          drive_uart3_tx_pcc5, drive_gen8_i2c_sda_pdd2,
> > +                          drive_gen8_i2c_scl_pdd1, drive_spi2_mosi_pcc=
2,
> > +                          drive_gen2_i2c_scl_pcc7, drive_spi2_cs0_pcc3,
> > +                          drive_gen2_i2c_sda_pdd0, drive_spi2_sck_pcc0,
> > +                          drive_spi2_miso_pcc1, drive_can1_dout_paa2,
> > +                          drive_can1_din_paa3, drive_can0_dout_paa0,
> > +                          drive_can0_din_paa1, drive_can0_stb_paa4,
> > +                          drive_can0_en_paa5, drive_soc_gpio49_paa6,
> > +                          drive_can0_err_paa7, drive_can1_stb_pbb0,
> > +                          drive_can1_en_pbb1, drive_soc_gpio50_pbb2,
> > +                          drive_can1_err_pbb3, drive_sce_error_pee0,
> > +                          drive_batt_oc_pee3, drive_bootv_ctl_n_pee7,
> > +                          drive_power_on_pee4, drive_soc_gpio26_pee5,
> > +                          drive_soc_gpio27_pee6, drive_ao_retention_n_=
pee2,
> > +                          drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
> > +
> > +    pinmux@2430000 {
> > +        compatible =3D "nvidia,tegra234-pinmux";
> > +        reg =3D <0x2430000 0x17000>;
> > +
> > +        pinctrl-names =3D "pex_rst";
> > +        pinctrl-0 =3D <&pex_rst_c5_out_state>;
> > +
> > +        pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
> > +            pex_rst {
>=20
> Underscores are not valid in node names.

We have supported underscore in older bindings for historical reasons.
But I suppose for these newer bindings we could disallow them.

Some of the older DTs have a large number of underscores, so I'm not
sure it makes sense to go back and fix those. Maybe something to keep in
mind for when we're done with all the conversions...

Thierry

--hi0dF3tmrcP5Kur0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjhnEACgkQ3SOs138+
s6ExDA//RFz+wK9dgYzAKeHPsEkUmMJtfrd0NXTx/QmpnYXtKmqeE1Ljv45dMKnK
ZZZffWgu2iKEhpZdKigp8XKZfXGq9uPDehTqFklDISegY8X4qz2ykVMX216uEsBZ
GTubb4/RuDkFduAGe4VOejq8XBw+cfz+NtkpHT1qKSgHiEiADRoVYBFLVqqGy08X
FQULFiqhAzUACmVjLcZLVch7uaeU1y8qn5WQKrZxSoJ+au4w5nSR8J/hyz4QxxPO
DPzNnbUp7gi08/1UYEd6rjhhIz5pPlnUdMuIz6UshYUWn0bJhI0pKpY0e+OSioKq
Zqjx70shvTeNDWzAYkXXLxg4oasctLiKcmUq1rMvVTljfMOaCnYmUzYqtihWmLO6
BZVoRnAr0Yn/6zGwvFrqToubqBfbRfZgX8yirbF4QZwjwnvvIxrqX92lt7SyN7rM
BdLZ58nmyp2AA+Z7redFoT/1JS8ilqmDvMZ12ItiLRY9Fm+2XZj6dk8phZjaBCmA
DgN17dJHjsO+LwIk8u0ZJKhTe7toEXddUi99waDC+7MMGUjj4KMIuJy0E+GHyO4I
H38X/LhIlZpOl92lWDp7aZnY+pJMbtvVsI1jSAueLyA+c6BGp8nIWBsNOPAqh+Os
e7cRlqsLSfmiKELDBw+L9fDbIs1ZL2WikAlvrK/CUawKI1F3V68=
=f+8n
-----END PGP SIGNATURE-----

--hi0dF3tmrcP5Kur0--
