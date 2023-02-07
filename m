Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865EA68DD14
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 16:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjBGPdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 10:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbjBGPdP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 10:33:15 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF7F36FF7
        for <linux-gpio@vger.kernel.org>; Tue,  7 Feb 2023 07:33:11 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so11793414wms.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2023 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSiggrkp162RHj0Np55rqISGkA3pY7ij+35zMTiNWnw=;
        b=nq1VWXcfSgOmsMFR05LQyGg2t/umK5zfQI/4iHZMJsxwIGpCi70Slo+HlMevOvYUuG
         a4wKMwZTbTQm71olnqbHxnYTIi2fGzDFP7t3hmzoY10GI+vYJevVZpafD0sL/+gHfAqC
         WFpc8wxIflEd0wportbXkwtI588/XA7GAXgBaKPSgUxlnhfFHWlh0mQzhsFVGgqNQAIW
         sP2qRcoSXdDA9SUc2aobIbh3z3ucAZp9xF/tH9OBrYfYByERukgAHiC9mzwk+nincvgm
         loSM6rnlPYp1WBfddVQ6p+AO6Z0OdJOt/0kRKMOcMPQn1HPxWbr59IuWB9pC0GxiJ8t4
         YKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSiggrkp162RHj0Np55rqISGkA3pY7ij+35zMTiNWnw=;
        b=mHUvtAYHQroydCUw6Yo3bBHiytDXTshTGJppjMNsiz5MjrJF3kgWnG+Xk2s3JZ6UUQ
         A/Uwu022psKnWgnx6Rc+yBPi7TJg7GgmQz81M0TCzgJwJmqfKl34jeo/eD8L8ppx/Mo0
         faKqsHovUwucDsmO393u4G4VrlpAf89FdZHpexbNJrGa9HQ8z53OeexNF7tS0jks0zAh
         ejK7QSYcrwJaEuRTaZhtX4A5PKaq6c1EGTx+XZcwjGzLsJkhS9vEa2Eflnid61rj1k/2
         VfLZRD8Lq/D5QmdfDqR+Tfvgz+5erK724aq5h72ofOZP6XVNKBnjKVY2brQom1Uc+rPn
         Fldw==
X-Gm-Message-State: AO0yUKU63hQY6pHs/3KlU1dLLW+U0tbbK6WG2iOA3yp0FMVBthsbopaH
        7qezhZJKchEbbZvvfTN1GDqW8Q==
X-Google-Smtp-Source: AK7set+hEvOWTZTaJVlzFxqdksMyuXQ9W601IlBbqSSxgeFfXwm0QVJec8Fxqp0ggtkhMHVU6QI86w==
X-Received: by 2002:a05:600c:4b16:b0:3dc:47f4:a022 with SMTP id i22-20020a05600c4b1600b003dc47f4a022mr2144270wmp.25.1675783990145;
        Tue, 07 Feb 2023 07:33:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm18341748wmk.25.2023.02.07.07.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 07:33:09 -0800 (PST)
Message-ID: <a1395eb2-da3a-e080-fa6b-50f20d879655@linaro.org>
Date:   Tue, 7 Feb 2023 16:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Content-Language: en-US
To:     Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     smangipudi@nvidia.com
References: <20230207115617.12088-1-pshete@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207115617.12088-1-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/02/2023 12:56, Prathamesh Shete wrote:
> Add DT binding doc for Tegra234 pinmux driver.

Subject: drop second/last, redundant "DT binding doc". The "dt-bindings"
prefix is already stating that these are bindings. Which basically means
your subject is quite empty...

> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> new file mode 100644
> index 000000000000..56b8d364c605
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> @@ -0,0 +1,232 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra234-pinmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra234 Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra234-pinmux
> +      - nvidia,tegra234-pinmux-aon
> +
> +  reg:
> +    items:
> +      - description: pinmux registers
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-_]+)?$":

Underscore is not a valid character

> +    type: object
> +    properties:
> +      phandle: true
> +
> +    # pin groups
> +    additionalProperties:
> +      $ref: nvidia,tegra-pinmux-common.yaml
> +      unevaluatedProperties: false
> +      properties:
> +        nvidia,function:
> +          enum: [ gp, uartc, i2c8, spi2, i2c2, can1, can0, rsvd0, eth0, eth2,
> +                  eth1, dp, eth3, i2c4, i2c7, i2c9, eqos, pe2, pe1, pe0, pe3,
> +                  pe4, pe5, pe6, pe7, pe8, pe9, pe10, qspi0, qspi1, qpsi,
> +                  sdmmc1, sce, soc, gpio, hdmi, ufs0, spi3, spi1, uartb, uarte,
> +                  usb, extperiph2, extperiph1, i2c3, vi0, i2c5, uarta, uartd,
> +                  i2c1, i2s4, i2s6, aud, spi5, touch, uartj, rsvd1, wdt, tsc,
> +                  dmic3, led, vi0_alt, i2s5, nv, extperiph3, extperiph4, spi4,
> +                  ccla, i2s1, i2s2, i2s3, i2s8, rsvd2, dmic5, dca, displayb,
> +                  displaya, vi1, dcb, dmic1, dmic4, i2s7, dmic2, dspk0, rsvd3,
> +                  tsc_alt, istctrl, vi1_alt, dspk1, igpu ]
> +
> +        nvidia,pull: true
> +        nvidia,tristate: true
> +        nvidia,schmitt: true
> +        nvidia,enable-input: true
> +        nvidia,open-drain: true
> +        nvidia,lock: true
> +        nvidia,drive-type: true
> +        nvidia,io-hv: true
> +
> +      required:
> +        - nvidia,pins
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: nvidia,tegra234-pinmux
> +    then:
> +      patternProperties:
> +        "^pinmux(-[a-z0-9-_]+)?$":

Underscore is not a valid character

> +          type: object
> +          additionalProperties:
> +            properties:
> +              nvidia,pins:
> +                description: An array of strings. Each string contains the name
> +                  of a pin or group. Valid values for these names are listed
> +                  below.

Define properties in top level, which points to the complexity of your
if-else, thus probably this should be split into two bindings. Dunno,
your other bindings repeat this pattern :(

> +
> +                items:
> +                  enum: [ dap6_sclk_pa0, dap6_dout_pa1, dap6_din_pa2,
> +                          dap6_fs_pa3, dap4_sclk_pa4, dap4_dout_pa5,
> +                          dap4_din_pa6, dap4_fs_pa7, soc_gpio08_pb0,
> +                          qspi0_sck_pc0, qspi0_cs_n_pc1,
> +                          qspi0_io0_pc2, qspi0_io1_pc3, qspi0_io2_pc4,
> +                          qspi0_io3_pc5, qspi1_sck_pc6, qspi1_cs_n_pc7,
> +                          qspi1_io0_pd0, qspi1_io1_pd1, qspi1_io2_pd2,
> +                          qspi1_io3_pd3, eqos_txc_pe0, eqos_td0_pe1,
> +                          eqos_td1_pe2, eqos_td2_pe3, eqos_td3_pe4,
> +                          eqos_tx_ctl_pe5, eqos_rd0_pe6, eqos_rd1_pe7,
> +                          eqos_rd2_pf0, eqos_rd3_pf1, eqos_rx_ctl_pf2,
> +                          eqos_rxc_pf3, eqos_sma_mdio_pf4, eqos_sma_mdc_pf5,
> +                          soc_gpio13_pg0, soc_gpio14_pg1, soc_gpio15_pg2,
> +                          soc_gpio16_pg3, soc_gpio17_pg4, soc_gpio18_pg5,
> +                          soc_gpio19_pg6, soc_gpio20_pg7, soc_gpio21_ph0,
> +                          soc_gpio22_ph1, soc_gpio06_ph2, uart4_tx_ph3,
> +                          uart4_rx_ph4, uart4_rts_ph5, uart4_cts_ph6,
> +                          soc_gpio41_ph7, soc_gpio42_pi0, soc_gpio43_pi1,
> +                          soc_gpio44_pi2, gen1_i2c_scl_pi3, gen1_i2c_sda_pi4,
> +                          cpu_pwr_req_pi5, soc_gpio07_pi6,
> +                          sdmmc1_clk_pj0, sdmmc1_cmd_pj1, sdmmc1_dat0_pj2,
> +                          sdmmc1_dat1_pj3, sdmmc1_dat2_pj4, sdmmc1_dat3_pj5,
> +                          pex_l0_clkreq_n_pk0, pex_l0_rst_n_pk1,
> +                          pex_l1_clkreq_n_pk2, pex_l1_rst_n_pk3,
> +                          pex_l2_clkreq_n_pk4, pex_l2_rst_n_pk5,
> +                          pex_l3_clkreq_n_pk6, pex_l3_rst_n_pk7,
> +                          pex_l4_clkreq_n_pl0, pex_l4_rst_n_pl1,
> +                          pex_wake_n_pl2, soc_gpio34_pl3, dp_aux_ch0_hpd_pm0,
> +                          dp_aux_ch1_hpd_pm1, dp_aux_ch2_hpd_pm2,
> +                          dp_aux_ch3_hpd_pm3, soc_gpio55_pm4, soc_gpio36_pm5,
> +                          soc_gpio53_pm6, soc_gpio38_pm7, dp_aux_ch3_n_pn0,
> +                          soc_gpio39_pn1, soc_gpio40_pn2, dp_aux_ch1_p_pn3,
> +                          dp_aux_ch1_n_pn4, dp_aux_ch2_p_pn5, dp_aux_ch2_n_pn6,
> +                          dp_aux_ch3_p_pn7, extperiph1_clk_pp0,
> +                          extperiph2_clk_pp1, cam_i2c_scl_pp2, cam_i2c_sda_pp3,
> +                          soc_gpio23_pp4, soc_gpio24_pp5, soc_gpio25_pp6,
> +                          pwr_i2c_scl_pp7, pwr_i2c_sda_pq0, soc_gpio28_pq1,
> +                          soc_gpio29_pq2, soc_gpio30_pq3, soc_gpio31_pq4,
> +                          soc_gpio32_pq5, soc_gpio33_pq6, soc_gpio35_pq7,
> +                          soc_gpio37_pr0, soc_gpio56_pr1, uart1_tx_pr2,
> +                          uart1_rx_pr3, uart1_rts_pr4, uart1_cts_pr5,
> +                          soc_gpio61_pw0, soc_gpio62_pw1, gpu_pwr_req_px0, cv_pwr_req_px1,
> +                          gp_pwm2_px2, gp_pwm3_px3, uart2_tx_px4, uart2_rx_px5,
> +                          uart2_rts_px6, uart2_cts_px7, spi3_sck_py0,
> +                          spi3_miso_py1, spi3_mosi_py2, spi3_cs0_py3,
> +                          spi3_cs1_py4, uart5_tx_py5, uart5_rx_py6,
> +                          uart5_rts_py7, uart5_cts_pz0, usb_vbus_en0_pz1,
> +                          usb_vbus_en1_pz2, spi1_sck_pz3, spi1_miso_pz4,
> +                          spi1_mosi_pz5, spi1_cs0_pz6, spi1_cs1_pz7,
> +                          spi5_sck_pac0, spi5_miso_pac1, spi5_mosi_pac2,
> +                          spi5_cs0_pac3, soc_gpio57_pac4, soc_gpio58_pac5,
> +                          soc_gpio59_pac6, soc_gpio60_pac7, soc_gpio45_pad0,
> +                          soc_gpio46_pad1, soc_gpio47_pad2, soc_gpio48_pad3,
> +                          ufs0_ref_clk_pae0, ufs0_rst_n_pae1,
> +                          pex_l5_clkreq_n_paf0, pex_l5_rst_n_paf1,
> +                          pex_l6_clkreq_n_paf2, pex_l6_rst_n_paf3,
> +                          pex_l7_clkreq_n_pag0, pex_l7_rst_n_pag1,
> +                          pex_l8_clkreq_n_pag2, pex_l8_rst_n_pag3,
> +                          pex_l9_clkreq_n_pag4, pex_l9_rst_n_pag5,
> +                          pex_l10_clkreq_n_pag6, pex_l10_rst_n_pag7,
> +                          sdmmc1_comp, eqos_comp, qspi_comp,
> +                          # drive groups
> +                          drive_soc_gpio08_pb0, drive_soc_gpio36_pm5,
> +                          drive_soc_gpio53_pm6, drive_soc_gpio55_pm4,
> +                          drive_soc_gpio38_pm7, drive_soc_gpio39_pn1,
> +                          drive_soc_gpio40_pn2, drive_dp_aux_ch0_hpd_pm0,
> +                          drive_dp_aux_ch1_hpd_pm1, drive_dp_aux_ch2_hpd_pm2,
> +                          drive_dp_aux_ch3_hpd_pm3, drive_dp_aux_ch1_p_pn3,
> +                          drive_dp_aux_ch1_n_pn4, drive_dp_aux_ch2_p_pn5,
> +                          drive_dp_aux_ch2_n_pn6, drive_dp_aux_ch3_p_pn7,
> +                          drive_dp_aux_ch3_n_pn0, drive_pex_l2_clkreq_n_pk4,
> +                          drive_pex_wake_n_pl2, drive_pex_l1_clkreq_n_pk2,
> +                          drive_pex_l1_rst_n_pk3, drive_pex_l0_clkreq_n_pk0,
> +                          drive_pex_l0_rst_n_pk1, drive_pex_l2_rst_n_pk5,
> +                          drive_pex_l3_clkreq_n_pk6, drive_pex_l3_rst_n_pk7,
> +                          drive_pex_l4_clkreq_n_pl0, drive_pex_l4_rst_n_pl1,
> +                          drive_soc_gpio34_pl3, drive_pex_l5_clkreq_n_paf0,
> +                          drive_pex_l5_rst_n_paf1, drive_pex_l6_clkreq_n_paf2,
> +                          drive_pex_l6_rst_n_paf3, drive_pex_l10_clkreq_n_pag6,
> +                          drive_pex_l10_rst_n_pag7, drive_pex_l7_clkreq_n_pag0,
> +                          drive_pex_l7_rst_n_pag1, drive_pex_l8_clkreq_n_pag2,
> +                          drive_pex_l8_rst_n_pag3, drive_pex_l9_clkreq_n_pag4,
> +                          drive_pex_l9_rst_n_pag5, drive_sdmmc1_clk_pj0,
> +                          drive_sdmmc1_cmd_pj1, drive_sdmmc1_dat3_pj5,
> +                          drive_sdmmc1_dat2_pj4, drive_sdmmc1_dat1_pj3,
> +                          drive_sdmmc1_dat0_pj2 ]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: nvidia,tegra234-pinmux-aon
> +    then:
> +      patternProperties:
> +        "^pinmux(-[a-z0-9-_]+)?$":

No underscores

> +          type: object
> +          additionalProperties:
> +            properties:
> +              nvidia,pins:
> +                items:
> +                  enum: [ can0_dout_paa0, can0_din_paa1, can1_dout_paa2,
> +                          can1_din_paa3, can0_stb_paa4, can0_en_paa5,
> +                          soc_gpio49_paa6, can0_err_paa7, can1_stb_pbb0,
> +                          can1_en_pbb1, soc_gpio50_pbb2, can1_err_pbb3,
> +                          spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
> +                          spi2_cs0_pcc3, touch_clk_pcc4, uart3_tx_pcc5,
> +                          uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
> +                          gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2,
> +                          sce_error_pee0, vcomp_alert_pee1,
> +                          ao_retention_n_pee2, batt_oc_pee3, power_on_pee4,
> +                          soc_gpio26_pee5, soc_gpio27_pee6, bootv_ctl_n_pee7,
> +                          hdmi_cec_pgg0,
> +                          # drive groups
> +                          drive_touch_clk_pcc4, drive_uart3_rx_pcc6,
> +                          drive_uart3_tx_pcc5, drive_gen8_i2c_sda_pdd2,
> +                          drive_gen8_i2c_scl_pdd1, drive_spi2_mosi_pcc2,
> +                          drive_gen2_i2c_scl_pcc7, drive_spi2_cs0_pcc3,
> +                          drive_gen2_i2c_sda_pdd0, drive_spi2_sck_pcc0,
> +                          drive_spi2_miso_pcc1, drive_can1_dout_paa2,
> +                          drive_can1_din_paa3, drive_can0_dout_paa0,
> +                          drive_can0_din_paa1, drive_can0_stb_paa4,
> +                          drive_can0_en_paa5, drive_soc_gpio49_paa6,
> +                          drive_can0_err_paa7, drive_can1_stb_pbb0,
> +                          drive_can1_en_pbb1, drive_soc_gpio50_pbb2,
> +                          drive_can1_err_pbb3, drive_sce_error_pee0,
> +                          drive_batt_oc_pee3, drive_bootv_ctl_n_pee7,
> +                          drive_power_on_pee4, drive_soc_gpio26_pee5,
> +                          drive_soc_gpio27_pee6, drive_ao_retention_n_pee2,
> +                          drive_vcomp_alert_pee1, drive_hdmi_cec_pgg0 ]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
> +
> +    pinmux@2430000 {
> +        compatible = "nvidia,tegra234-pinmux";
> +        reg = <0x2430000 0x17000>;
> +
> +        pinctrl-names = "pex_rst";
> +        pinctrl-0 = <&pex_rst_c5_out_state>;
> +
> +        pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
> +            pex_rst {

Underscores are not valid in node names.


Best regards,
Krzysztof

