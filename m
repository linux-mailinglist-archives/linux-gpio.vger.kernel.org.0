Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991F247C101
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Dec 2021 14:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhLUNvO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 08:51:14 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]:37720 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbhLUNvO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 08:51:14 -0500
Received: by mail-qk1-f182.google.com with SMTP id m186so12560441qkb.4;
        Tue, 21 Dec 2021 05:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+yVLZqyWIW05llWw3WbvyfhusKT++PUlMNaOxY171As=;
        b=KjI97Tj8XLiDt2VBJqV5OGI8grNSVlFK6diqv3+/gWfo15d5U1Ck7JSKyyU5Y+UJx3
         LfRlRjlhl66PRKaYrM1d5bNCNaHNC+q1PlukwTDBMwmQanhJVCdjcmV1/SJWFTWd3tNJ
         7r739shM4JIkcDeRmIAVX++cEd1l9d/bsvgQq2+ZJQT9BK3jyqxFpoDoDA/ao5HtNUJo
         5AgZZqQyfnBcqAOTURYEYteacvSdHQdmzLMdp85dwSm8ZZKzWMMd6C0sPsNMbeSBjs+x
         A7gYSgmb8VAKpB6pIZqMVi+ZXaATwN7ALUySG79RMQV87D3tTlyvr4HT2HMqLmNYJl4F
         VGtQ==
X-Gm-Message-State: AOAM532orqUB+CybZ5ZsybhZM+o9d43Jve3utWsbvzwEAQy6WBKeVSqj
        zhBK2ZgqJ6p5faZJrNt8CQ==
X-Google-Smtp-Source: ABdhPJxgW/4qGk9bQKpRVLmzWcobUYNF0X2YOssNEnejbB7XMntpCtLHfTer0m73fVLKvwF9+Abhnw==
X-Received: by 2002:a05:620a:2239:: with SMTP id n25mr1905898qkh.758.1640094672922;
        Tue, 21 Dec 2021 05:51:12 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id k9sm17473962qta.48.2021.12.21.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 05:51:11 -0800 (PST)
Received: (nullmailer pid 1293221 invoked by uid 1000);
        Tue, 21 Dec 2021 13:51:10 -0000
Date:   Tue, 21 Dec 2021 09:51:10 -0400
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: tegra: Convert to json-schema
Message-ID: <YcHbzrUNDaqjTNtN@robh.at.kernel.org>
References: <20211217165342.2572021-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217165342.2572021-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 05:53:42PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra pinmux controller bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra114-pinmux.txt        | 131 --------
>  .../pinctrl/nvidia,tegra114-pinmux.yaml       | 264 ++++++++++++++++
>  .../pinctrl/nvidia,tegra124-pinmux.txt        | 153 ----------
>  .../pinctrl/nvidia,tegra124-pinmux.yaml       | 287 ++++++++++++++++++
>  .../pinctrl/nvidia,tegra194-pinmux.txt        | 107 -------
>  .../pinctrl/nvidia,tegra194-pinmux.yaml       | 175 +++++++++++
>  .../pinctrl/nvidia,tegra20-pinmux.txt         | 143 ---------
>  .../pinctrl/nvidia,tegra20-pinmux.yaml        | 203 +++++++++++++
>  .../pinctrl/nvidia,tegra210-pinmux.txt        | 166 ----------
>  .../pinctrl/nvidia,tegra210-pinmux.yaml       | 232 ++++++++++++++
>  .../pinctrl/nvidia,tegra30-pinmux.txt         | 144 ---------
>  .../pinctrl/nvidia,tegra30-pinmux.yaml        | 268 ++++++++++++++++
>  12 files changed, 1429 insertions(+), 844 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
> new file mode 100644
> index 000000000000..fa95d0bd6fe4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
> @@ -0,0 +1,264 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)

GPL-2.0-only please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra114 pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra114-pinmux
> +
> +  reg:
> +    items:
> +      - description: pad control registers
> +      - description: mux registers
> +
> +additionalProperties:
> +  type: object

     additionalProperties: false

That will cause the example to fail.

Similar issues on the rest.

> +  description: |
> +    Please refer to pinctrl-bindings.txt in this directory for details of the common pinctrl
> +    bindings used by client devices, including the meaning of the phrase "pin configuration
> +    node".
> +
> +    Tegra's pin configuration nodes act as a container for an arbitrary number of subnodes. Each
> +    of these subnodes represents some desired configuration for a pin, a group, or a list of
> +    pins or groups. This configuration can include the mux function to select on those pin(s)/
> +    group(s), and various pin configuration parameters, such as pull-up, tristate, drive
> +    strength, etc.
> +
> +    The name of each subnode is not important; all subnodes should be enumerated and processed
> +    purely based on their content.
> +
> +    Each subnode only affects those parameters that are explicitly listed. In other words, a
> +    subnode that lists a mux function but no pin configuration parameters implies no information
> +    about any pin configuration parameters.
> +
> +    Similarly, a pin subnode that describes a pullup parameter implies no information about e.g.
> +    the mux function or tristate parameter. For this reason, even seemingly boolean values are
> +    actually tristates in this binding: unspecified, off, or on. Unspecified is represented as
> +    an absent property, and off/on are represented as integer values 0 and 1.
> +
> +    Note that many of these properties are only valid for certain specific pins or groups. See
> +    the Tegra TRM and various pinmux spreadsheets for complete details regarding which groups
> +    support which functionality. The Linux pinctrl driver may also be a useful reference, since
> +    it consolidates, disambiguates, and corrects data from all those sources.
> +
> +  patternProperties:
> +    "^pinmux(-[a-z0-9-_]+)?$":
> +      type: object
> +      properties:
> +        nvidia,pins:
> +          $ref: /schemas/types.yaml#/definitions/string-array
> +          description: An array of strings. Each string contains the name of a pin or group.
> +            Valid values for these names are listed below.
> +          items:
> +            enum: [ ulpi_data0_po1, ulpi_data1_po2, ulpi_data2_po3, ulpi_data3_po4, ulpi_data4_po5,
> +                    ulpi_data5_po6, ulpi_data6_po7, ulpi_data7_po0, ulpi_clk_py0, ulpi_dir_py1,
> +                    ulpi_nxt_py2, ulpi_stp_py3, dap3_fs_pp0, dap3_din_pp1, dap3_dout_pp2,
> +                    dap3_sclk_pp3, pv0, pv1, sdmmc1_clk_pz0, sdmmc1_cmd_pz1, sdmmc1_dat3_py4,
> +                    sdmmc1_dat2_py5, sdmmc1_dat1_py6, sdmmc1_dat0_py7, clk2_out_pw5, clk2_req_pcc5,
> +                    hdmi_int_pn7, ddc_scl_pv4, ddc_sda_pv5, uart2_rxd_pc3, uart2_txd_pc2,
> +                    uart2_rts_n_pj6, uart2_cts_n_pj5, uart3_txd_pw6, uart3_rxd_pw7,
> +                    uart3_cts_n_pa1, uart3_rts_n_pc0, pu0, pu1, pu2, pu3, pu4, pu5, pu6,
> +                    gen1_i2c_sda_pc5, gen1_i2c_scl_pc4, dap4_fs_pp4, dap4_din_pp5, dap4_dout_pp6,
> +                    dap4_sclk_pp7, clk3_out_pee0, clk3_req_pee1, gmi_wp_n_pc7, gmi_iordy_pi5,
> +                    gmi_wait_pi7, gmi_adv_n_pk0, gmi_clk_pk1, gmi_cs0_n_pj0, gmi_cs1_n_pj2,
> +                    gmi_cs2_n_pk3, gmi_cs3_n_pk4, gmi_cs4_n_pk2, gmi_cs6_n_pi3, gmi_cs7_n_pi6,
> +                    gmi_ad0_pg0, gmi_ad1_pg1, gmi_ad2_pg2, gmi_ad3_pg3, gmi_ad4_pg4, gmi_ad5_pg5,
> +                    gmi_ad6_pg6, gmi_ad7_pg7, gmi_ad8_ph0, gmi_ad9_ph1, gmi_ad10_ph2, gmi_ad11_ph3,
> +                    gmi_ad12_ph4, gmi_ad13_ph5, gmi_ad14_ph6, gmi_ad15_ph7, gmi_a16_pj7,
> +                    gmi_a17_pb0, gmi_a18_pb1, gmi_a19_pk7, gmi_wr_n_pi0, gmi_oe_n_pi1,
> +                    gmi_dqs_p_pj3, gmi_rst_n_pi4, gen2_i2c_scl_pt5, gen2_i2c_sda_pt6,
> +                    sdmmc4_clk_pcc4, sdmmc4_cmd_pt7, sdmmc4_dat0_paa0, sdmmc4_dat1_paa1,
> +                    sdmmc4_dat2_paa2, sdmmc4_dat3_paa3, sdmmc4_dat4_paa4, sdmmc4_dat5_paa5,
> +                    sdmmc4_dat6_paa6, sdmmc4_dat7_paa7, cam_mclk_pcc0, pcc1, pbb0,
> +                    cam_i2c_scl_pbb1, cam_i2c_sda_pbb2, pbb3, pbb4, pbb5, pbb6, pbb7, pcc2,
> +                    pwr_i2c_scl_pz6, pwr_i2c_sda_pz7, kb_row0_pr0, kb_row1_pr1, kb_row2_pr2,
> +                    kb_row3_pr3, kb_row4_pr4, kb_row5_pr5, kb_row6_pr6, kb_row7_pr7, kb_row8_ps0,
> +                    kb_row9_ps1, kb_row10_ps2, kb_col0_pq0, kb_col1_pq1, kb_col2_pq2, kb_col3_pq3,
> +                    kb_col4_pq4, kb_col5_pq5, kb_col6_pq6, kb_col7_pq7, clk_32k_out_pa0,
> +                    sys_clk_req_pz5, core_pwr_req, cpu_pwr_req, pwr_int_n, owr, dap1_fs_pn0,
> +                    dap1_din_pn1, dap1_dout_pn2, dap1_sclk_pn3, clk1_req_pee2, clk1_out_pw4,
> +                    spdif_in_pk6, spdif_out_pk5, dap2_fs_pa2, dap2_din_pa4, dap2_dout_pa5,
> +                    dap2_sclk_pa3, dvfs_pwm_px0, gpio_x1_aud_px1, gpio_x3_aud_px3, dvfs_clk_px2,
> +                    gpio_x4_aud_px4, gpio_x5_aud_px5, gpio_x6_aud_px6, gpio_x7_aud_px7,
> +                    sdmmc3_clk_pa6, sdmmc3_cmd_pa7, sdmmc3_dat0_pb7, sdmmc3_dat1_pb6,
> +                    sdmmc3_dat2_pb5, sdmmc3_dat3_pb4, hdmi_cec_pee3, sdmmc1_wp_n_pv3,
> +                    sdmmc3_cd_n_pv2, gpio_w2_aud_pw2, gpio_w3_aud_pw3, usb_vbus_en0_pn4,
> +                    usb_vbus_en1_pn5, sdmmc3_clk_lb_in_pee5, sdmmc3_clk_lb_out_pee4, reset_out_n,
> +                    # drive groups
> +                    drive_ao1, drive_ao2, drive_at1, drive_at2, drive_at3, drive_at4, drive_at5,
> +                    drive_cdev1, drive_cdev2, drive_dap1, drive_dap2, drive_dap3, drive_dap4,
> +                    drive_dbg, drive_sdio3, drive_spi, drive_uaa, drive_uab, drive_uart2,
> +                    drive_uart3, drive_sdio1, drive_ddc, drive_gma, drive_gme, drive_gmf,
> +                    drive_gmg, drive_gmh, drive_owr, drive_uda ]
> +
> +        nvidia,function:
> +          $ref: /schemas/types.yaml#/definitions/string
> +          description: A string containing the name of the function to mux to the pin or group.
> +            Valid values for function names are listed below. See the Tegra TRM to determine
> +            which are valid for each pin or group.
> +          enum: [ blink, cec, cldvfs, clk12, cpu, dap, dap1, dap2, dev3, displaya, displaya_alt,
> +                  displayb, dtv, emc_dll, extperiph1, extperiph2, extperiph3, gmi, gmi_alt, hda,
> +                  hsi, i2c1, i2c2, i2c3, i2c4, i2cpwr, i2s0, i2s1, i2s2, i2s3, i2s4, irda, kbc,
> +                  nand, nand_alt, owr, pmi, pwm0, pwm1, pwm2, pwm3, pwron, reset_out_n, rsvd1,
> +                  rsvd2, rsvd3, rsvd4, sdmmc1, sdmmc2, sdmmc3, sdmmc4, soc, spdif, spi1, spi2,
> +                  spi3, spi4, spi5, spi6, sysclk, trace, uarta, uartb, uartc, uartd, ulpi, usb,
> +                  vgp1, vgp2, vgp3, vgp4, vgp5, vgp6, vi, vi_alt1, vi_alt3 ]
> +
> +        nvidia,pull:
> +          description: Pull-down/up setting to apply to the pin.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: none
> +              const: 0
> +            - description: down
> +              const: 1
> +            - description: up
> +              const: 2
> +
> +        nvidia,tristate:
> +          description: Tristate setting to apply to the pin.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: drive
> +              const: 0
> +            - description: tristate
> +              const: 1
> +
> +        nvidia,enable-input:
> +          description: Enable the pin's input path.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: disable input (i.e. output only)
> +              const: 0
> +            - description: enable input
> +              const: 1
> +
> +        nvidia,open-drain:
> +          description: Open-drain configuration for the pin.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: disable open-drain
> +              const: 0
> +            - description: enable open-drain
> +              const: 1
> +
> +        nvidia,lock:
> +          description: Lock the pin configuration against further changes until reset.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: disable pin configuration lock
> +              const: 0
> +            - description: enable pin configuration lock
> +              const: 1
> +
> +        nvidia,io-reset:
> +          description: reset the I/O path
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [ 0, 1 ]
> +
> +        nvidia,rcv-sel:
> +          description: select VIL/VIH receivers
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: normal receivers
> +              const: 0
> +            - description: high-voltage receivers
> +              const: 1
> +
> +        nvidia,high-speed-mode:
> +          description: Enable high speed mode the pins.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: normal speed mode
> +              const: 0
> +            - description: high speed mode
> +              const: 1
> +
> +        nvidia,schmitt:
> +          description: Enable Schmitt trigger on the input.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          oneOf:
> +            - description: disable Schmitt trigger on the input
> +              const: 0
> +            - description: enable Schmitt trigger on the input
> +              const: 1
> +
> +        nvidia,low-power-mode:
> +          description: Controls the drive power or current. Valid values are from 0 through 3,
> +            where 0 specifies the least power and 3 specifies the most power. See "Low Power
> +            Mode" or "LPMD1" and "LPMD0" in the Tegra TRM.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [ 0, 1, 2, 3 ]
> +
> +        nvidia,drive-type:
> +          description: Drive type to configure for the pin.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +          enum: [ 0, 1, 2, 3 ]
> +
> +        nvidia,pull-down-strength:
> +          description: Controls drive strength. 0 is weakest. The range of valid values depends
> +            on the pingroup. See "CAL_DRVDN" in the Tegra TRM.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        nvidia,pull-up-strength:
> +          description: Controls drive strength. 0 is weakest. The range of valid values depends
> +            on the pingroup. See "CAL_DRVUP" in the Tegra TRM.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        nvidia,slew-rate-rising:
> +          description: Controls rising signal slew rate. 0 is fastest. The range of valid values
> +            depends on the pingroup. See "DRVDN_SLWR" in the Tegra TRM.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        nvidia,slew-rate-falling:
> +          description: Controls falling signal slew rate. 0 is fastest. The range of valid
> +            values depends on the pingroup. See "DRVUP_SLWF" in the Tegra TRM.
> +          $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      additionalProperties: false
> +
> +      required:
> +        - nvidia,pins
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    pinmux@70000868 {
> +      compatible = "nvidia,tegra114-pinmux";
> +      reg = <0x70000868 0x148>, /* Pad control registers */
> +            <0x70003000 0x40c>; /* PinMux registers */
> +
> +      pinmux {
> +        sdmmc4_clk_pcc4 {
> +          nvidia,pins = "sdmmc4_clk_pcc4";
> +          nvidia,function = "sdmmc4";
> +          nvidia,pull = <0>;
> +          nvidia,tristate = <0>;
> +        };
> +
> +        sdmmc4_dat0_paa0 {
> +          nvidia,pins = "sdmmc4_dat0_paa0",
> +                        "sdmmc4_dat1_paa1",
> +                        "sdmmc4_dat2_paa2",
> +                        "sdmmc4_dat3_paa3",
> +                        "sdmmc4_dat4_paa4",
> +                        "sdmmc4_dat5_paa5",
> +                        "sdmmc4_dat6_paa6",
> +                        "sdmmc4_dat7_paa7";
> +          nvidia,function = "sdmmc4";
> +          nvidia,pull = <2>;
> +          nvidia,tristate = <0>;
> +        };
> +      };
> +    };
