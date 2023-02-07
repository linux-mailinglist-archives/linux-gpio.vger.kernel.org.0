Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2F568DBD1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 15:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjBGOkl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 09:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjBGOkL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 09:40:11 -0500
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED3E3E08F;
        Tue,  7 Feb 2023 06:38:49 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-142b72a728fso19197107fac.9;
        Tue, 07 Feb 2023 06:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgcU7yDHXi9BXC6ozPQIrIwts9zYTn8nAQMUgUABjn4=;
        b=Uf/7lRdHFOnobGhXfaZnw6WvZ0+GRrZEVCVcLDmzDGyirbOO0Nx+ioadQA+ou+gpOz
         IlLj/k1R+W+X7XyafEdDpKL6Dc1DMiGCtcGzRSSQ9ZNhMKn+QDCk21jc5vD7tfTgYjmq
         BlJ58cGzqHhsudzab6QKrTxuNpPqE43bcPCApJcgYM+SW0oeUdWF/B7jS3lazcueWnpE
         qWgMSfHbhXKexw8IZDzh7Kij1Ga7BYksQ0hzMBxtQWW3Zdt0T2R8a/m/tCg5Z8kkCVTj
         vkoYOqpOzCcxp4sP5fuLGS10Y3SDyDZGkm6eV5W/+AOtyB0MwwtNUWuSb+VVslvKbSL6
         TeIA==
X-Gm-Message-State: AO0yUKU5Fza1N3uUCrdRqanpi8S07Zg7iRlNGtQI/uBhUu4P57lkEOc1
        tCENlJQoO0SeH++TfQTj+FOj9PdbGw==
X-Google-Smtp-Source: AK7set8vHVlBgyLz6lmIFJvWqBktiqqBn6qmd0qz74bunzfoHFF48nlHzUkFcagrfu9wfjdotNH1rQ==
X-Received: by 2002:a05:6870:5487:b0:143:6254:7e6b with SMTP id f7-20020a056870548700b0014362547e6bmr1625242oan.11.1675780672142;
        Tue, 07 Feb 2023 06:37:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dy50-20020a056870c7b200b0016a25cfe5a3sm3862988oab.19.2023.02.07.06.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 06:37:51 -0800 (PST)
Received: (nullmailer pid 3482433 invoked by uid 1000);
        Tue, 07 Feb 2023 14:37:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     thierry.reding@gmail.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        smangipudi@nvidia.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com
In-Reply-To: <20230207115617.12088-1-pshete@nvidia.com>
References: <20230207115617.12088-1-pshete@nvidia.com>
Message-Id: <167577954273.3457850.16805281654046177833.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: tegra234: Add DT binding doc
Date:   Tue, 07 Feb 2023 08:37:51 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Tue, 07 Feb 2023 17:26:15 +0530, Prathamesh Shete wrote:
> Add DT binding doc for Tegra234 pinmux driver.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra234-pinmux.yaml       | 232 ++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.example.dtb: pinmux@2430000: pinmux-pex-rst-c5-out:pex_rst:nvidia,pins:0: 'pex_l5_rst_n_pgg1' is not one of ['dap6_sclk_pa0', 'dap6_dout_pa1', 'dap6_din_pa2', 'dap6_fs_pa3', 'dap4_sclk_pa4', 'dap4_dout_pa5', 'dap4_din_pa6', 'dap4_fs_pa7', 'soc_gpio08_pb0', 'qspi0_sck_pc0', 'qspi0_cs_n_pc1', 'qspi0_io0_pc2', 'qspi0_io1_pc3', 'qspi0_io2_pc4', 'qspi0_io3_pc5', 'qspi1_sck_pc6', 'qspi1_cs_n_pc7', 'qspi1_io0_pd0', 'qspi1_io1_pd1', 'qspi1_io2_pd2', 'qspi1_io3_pd3', 'eqos_txc_pe0', 'eqos_td0_pe1', 'eqos_td1_pe2', 'eqos_td2_pe3', 'eqos_td3_pe4', 'eqos_tx_ctl_pe5', 'eqos_rd0_pe6', 'eqos_rd1_pe7', 'eqos_rd2_pf0', 'eqos_rd3_pf1', 'eqos_rx_ctl_pf2', 'eqos_rxc_pf3', 'eqos_sma_mdio_pf4', 'eqos_sma_mdc_pf5', 'soc_gpio13_pg0', 'soc_gpio14_pg1', 'soc_gpio15_pg2', 'soc_gpio16_pg3', 'soc_gpio17_pg4', 'soc_gpio18_pg5', 'soc_gpio19_pg6', 'soc_gpio20_pg7', 'soc_gpio21_ph0', 'soc_gpio22_ph1', 'soc_gpio06_p
 h2', 'uart4_tx_ph3', 'uart4_rx_ph4', 'uart4_rts_ph5', 'uart4_cts_ph6', 'soc_gpio41_ph7', 'soc_gpio42_pi0', 'soc_gpio43_pi1', 'soc_gpio44_pi2', 'gen1_i2c_scl_pi3', 'gen1_i2c_sda_pi4', 'cpu_pwr_req_pi5', 'soc_gpio07_pi6', 'sdmmc1_clk_pj0', 'sdmmc1_cmd_pj1', 'sdmmc1_dat0_pj2', 'sdmmc1_dat1_pj3', 'sdmmc1_dat2_pj4', 'sdmmc1_dat3_pj5', 'pex_l0_clkreq_n_pk0', 'pex_l0_rst_n_pk1', 'pex_l1_clkreq_n_pk2', 'pex_l1_rst_n_pk3', 'pex_l2_clkreq_n_pk4', 'pex_l2_rst_n_pk5', 'pex_l3_clkreq_n_pk6', 'pex_l3_rst_n_pk7', 'pex_l4_clkreq_n_pl0', 'pex_l4_rst_n_pl1', 'pex_wake_n_pl2', 'soc_gpio34_pl3', 'dp_aux_ch0_hpd_pm0', 'dp_aux_ch1_hpd_pm1', 'dp_aux_ch2_hpd_pm2', 'dp_aux_ch3_hpd_pm3', 'soc_gpio55_pm4', 'soc_gpio36_pm5', 'soc_gpio53_pm6', 'soc_gpio38_pm7', 'dp_aux_ch3_n_pn0', 'soc_gpio39_pn1', 'soc_gpio40_pn2', 'dp_aux_ch1_p_pn3', 'dp_aux_ch1_n_pn4', 'dp_aux_ch2_p_pn5', 'dp_aux_ch2_n_pn6', 'dp_aux_ch3_p_pn7', 'extperiph1_clk_pp0', 'extperiph2_clk_pp1', 'cam_i2c_scl_pp2', 'cam_i2c_sda_pp3', 'soc_gpio23_pp4'
 , 'soc_gpio24_pp5', 'soc_gpio25_pp6', 'pwr_i2c_scl_pp7', 'pwr_i2c_sda_pq0', 'soc_gpio28_pq1', 'soc_gpio29_pq2', 'soc_gpio30_pq3', 'soc_gpio31_pq4', 'soc_gpio32_pq5', 'soc_gpio33_pq6', 'soc_gpio35_pq7', 'soc_gpio37_pr0', 'soc_gpio56_pr1', 'uart1_tx_pr2', 'uart1_rx_pr3', 'uart1_rts_pr4', 'uart1_cts_pr5', 'soc_gpio61_pw0', 'soc_gpio62_pw1', 'gpu_pwr_req_px0', 'cv_pwr_req_px1', 'gp_pwm2_px2', 'gp_pwm3_px3', 'uart2_tx_px4', 'uart2_rx_px5', 'uart2_rts_px6', 'uart2_cts_px7', 'spi3_sck_py0', 'spi3_miso_py1', 'spi3_mosi_py2', 'spi3_cs0_py3', 'spi3_cs1_py4', 'uart5_tx_py5', 'uart5_rx_py6', 'uart5_rts_py7', 'uart5_cts_pz0', 'usb_vbus_en0_pz1', 'usb_vbus_en1_pz2', 'spi1_sck_pz3', 'spi1_miso_pz4', 'spi1_mosi_pz5', 'spi1_cs0_pz6', 'spi1_cs1_pz7', 'spi5_sck_pac0', 'spi5_miso_pac1', 'spi5_mosi_pac2', 'spi5_cs0_pac3', 'soc_gpio57_pac4', 'soc_gpio58_pac5', 'soc_gpio59_pac6', 'soc_gpio60_pac7', 'soc_gpio45_pad0', 'soc_gpio46_pad1', 'soc_gpio47_pad2', 'soc_gpio48_pad3', 'ufs0_ref_clk_pae0', 'ufs0_rst_n
 _pae1', 'pex_l5_clkreq_n_paf0', 'pex_l5_rst_n_paf1', 'pex_l6_clkreq_n_paf2', 'pex_l6_rst_n_paf3', 'pex_l7_clkreq_n_pag0', 'pex_l7_rst_n_pag1', 'pex_l8_clkreq_n_pag2', 'pex_l8_rst_n_pag3', 'pex_l9_clkreq_n_pag4', 'pex_l9_rst_n_pag5', 'pex_l10_clkreq_n_pag6', 'pex_l10_rst_n_pag7', 'sdmmc1_comp', 'eqos_comp', 'qspi_comp', 'drive_soc_gpio08_pb0', 'drive_soc_gpio36_pm5', 'drive_soc_gpio53_pm6', 'drive_soc_gpio55_pm4', 'drive_soc_gpio38_pm7', 'drive_soc_gpio39_pn1', 'drive_soc_gpio40_pn2', 'drive_dp_aux_ch0_hpd_pm0', 'drive_dp_aux_ch1_hpd_pm1', 'drive_dp_aux_ch2_hpd_pm2', 'drive_dp_aux_ch3_hpd_pm3', 'drive_dp_aux_ch1_p_pn3', 'drive_dp_aux_ch1_n_pn4', 'drive_dp_aux_ch2_p_pn5', 'drive_dp_aux_ch2_n_pn6', 'drive_dp_aux_ch3_p_pn7', 'drive_dp_aux_ch3_n_pn0', 'drive_pex_l2_clkreq_n_pk4', 'drive_pex_wake_n_pl2', 'drive_pex_l1_clkreq_n_pk2', 'drive_pex_l1_rst_n_pk3', 'drive_pex_l0_clkreq_n_pk0', 'drive_pex_l0_rst_n_pk1', 'drive_pex_l2_rst_n_pk5', 'drive_pex_l3_clkreq_n_pk6', 'drive_pex_l3_rst_n_pk
 7', 'drive_pex_l4_clkreq_n_pl0', 'drive_pex_l4_rst_n_pl1', 'drive_soc_gpio34_pl3', 'drive_pex_l5_clkreq_n_paf0', 'drive_pex_l5_rst_n_paf1', 'drive_pex_l6_clkreq_n_paf2', 'drive_pex_l6_rst_n_paf3', 'drive_pex_l10_clkreq_n_pag6', 'drive_pex_l10_rst_n_pag7', 'drive_pex_l7_clkreq_n_pag0', 'drive_pex_l7_rst_n_pag1', 'drive_pex_l8_clkreq_n_pag2', 'drive_pex_l8_rst_n_pag3', 'drive_pex_l9_clkreq_n_pag4', 'drive_pex_l9_rst_n_pag5', 'drive_sdmmc1_clk_pj0', 'drive_sdmmc1_cmd_pj1', 'drive_sdmmc1_dat3_pj5', 'drive_sdmmc1_dat2_pj4', 'drive_sdmmc1_dat1_pj3', 'drive_sdmmc1_dat0_pj2']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nvidia,tegra234-pinmux.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230207115617.12088-1-pshete@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

