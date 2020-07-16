Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC292222C66
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 21:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgGPT4t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 15:56:49 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36686 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728907AbgGPT4s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 15:56:48 -0400
Received: by mail-io1-f66.google.com with SMTP id y2so7364473ioy.3;
        Thu, 16 Jul 2020 12:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zf00bN2fyNP0TZouO38sQTmVujWd/X0MHNtUSdHB20c=;
        b=mCk38Sc82rl9JqMVRJvia+gosyqJ2cOVwPk+O2E0MPHmS6cH5FGkg+txPn/ReBUT/8
         6CDbtYJUkMgPAx1ZmnJKknaxueXkZGsCjDIfi2ro7yec8pSYZG/ni/+AqMjexS8aLwWJ
         rh/+jqlpmCiTMoWkA5dCzU748P/Elhg/V5p66EuD4nk2NWR/qvYLC3Y8/BbJed2p9hV9
         /1ba6VPoNPHD/FfXbBQZuWeZE3onjEBHgzD0nJumZN91ACuKL/67FdPkjZttAKDFlGa6
         kgvo4BlozLEuIlsuF2G+yW+MGIowm5Y30ictEuJWbbKdZZu2grA9iwmNUK4WwweOT4YG
         7Ogw==
X-Gm-Message-State: AOAM5321xQ5IHEHlHxeNbYDzJqysscAIxfNIJFptw1KADG5x7bmDfAgW
        rHOZRh6+KYPAlY0wKF9VeA==
X-Google-Smtp-Source: ABdhPJyAcOd7P2a9TNsjWhXBFL6FszcZgug9KflGnLE/n+gPhcJ2CMg6ZSa87zxhTCSaH+hOuzwfYQ==
X-Received: by 2002:a6b:6c09:: with SMTP id a9mr6061207ioh.178.1594929407191;
        Thu, 16 Jul 2020 12:56:47 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b6sm3374494iow.35.2020.07.16.12.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 12:56:46 -0700 (PDT)
Received: (nullmailer pid 2743745 invoked by uid 1000);
        Thu, 16 Jul 2020 19:56:45 -0000
Date:   Thu, 16 Jul 2020 13:56:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     TY Chang <tychang@realtek.com>
Cc:     linux-realtek-soc@lists.infradead.org, afaerber@suse.de,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: pinctrl: realtek: Add Realtek DHC
 SoC rtd1295
Message-ID: <20200716195645.GA2742256@bogus>
References: <20200716023338.14922-1-tychang@realtek.com>
 <20200716023338.14922-6-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716023338.14922-6-tychang@realtek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 10:33:35AM +0800, TY Chang wrote:
> Add device tree binding Documentation for rtd1295
> pinctrl driver.
> 
> Signed-off-by: TY Chang <tychang@realtek.com>
> ---
>  .../pinctrl/realtek,rtd1295-pinctrl.yaml      | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml
> new file mode 100644
> index 000000000000..8cd6cfa2282e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1295-pinctrl.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/realtek,rtd1295-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek DHC RTD1295 pin control
> +
> +maintainers:
> +  - Andreas Farber <afaerber@suse.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1295-iso-pinctrl
> +      - realtek,rtd1295-sb2-pinctrl
> +      - realtek,rtd1295-disp-pinctrl
> +      - realtek,rtd1295-cr-pinctrl
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    allOf:
> +      - $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +    properties:
> +      groups:
> +        items:
> +          enum: [ iso_gpio_0, iso_gpio_1, iso_gpio_2, iso_gpio_3, iso_gpio_4,
> +          iso_gpio_5, hdmi_hpd, iso_gpio_7, ir_rx, ir_tx, ur0_rx,
> +          ur0_tx, ur1_rx, ur1_tx, ur1_cts_n, ur1_rts_n, i2c_scl_0,
> +          i2c_sda_0, i2c_scl_1, i2c_sda_1, i2c_scl_6, iso_gpio_21,
> +          iso_gpio_22, iso_gpio_23, iso_gpio_24, iso_gpio_25,
> +          i2c_sda_6, etn_led_link, etn_led_rxtx, nat_led_0,
> +          nat_led_1, nat_led_2, nat_led_3, iso_gpio_33,
> +          iso_gpio_34, pwm_23_loc0, pwm_01_loc0, pwm_23_loc1,
> +          pwm_01_loc1, ejtag_avcpu_loc, ur2_loc, i2c0, i2c1,
> +          i2c6, uart0, uart1, uart2_0, uart2_1, gpio_0, gpio_1,
> +          gpio_2, gpio_3, gpio_4, gpio_5, gpio_6, gpio_7, gpio_8,
> +          gpio_9, tp1_sync, i2c_scl_4, i2c_sda_4, i2c_scl_5,
> +          i2c_sda_5, usb_id, sensor_cko_0, sensor_cko_1, sensor_rst,
> +          sensor_stb_0, sensor_stb_1, tp0_data, tp0_clk, tp0_valid,
> +          tp0_sync, tp1_data, tp1_clk, tp1_valid, rgmii0_txc,
> +          rgmii0_tx_ctl,rgmii0_txd_0, rgmii0_txd_1, rgmii0_txd_2,
> +          rgmii0_txd_3, rgmii0_rxc, rgmii0_rx_ctl, rgmii0_rxd_0,
> +          rgmii0_rxd_1, rgmii0_rxd_2, rgmii0_rxd_3, rgmii0_mdio,
> +          rgmii0_mdc, rgmii1_txc, rgmii1_tx_ctl, rgmii1_txd_0,
> +          rgmii1_txd_1, rgmii1_txd_2, rgmii1_txd_3, rgmii1_rxc,
> +          rgmii1_rx_ctl, rgmii1_rxd_0, rgmii1_rxd_1, rgmii1_rxd_2,
> +          rgmii1_rxd_3, hif_loc, ejtag_scpu_loc, sf_en, tp0_loc,
> +          tp1_loc, spdif, dmic_clk, dmic_data, ao_lrck, ao_bck,
> +          aock, ao_sd_0, ao_sd_1, ao_sd_2, ao_sd_3, nf_cle,
> +          nf_ale, nf_rd_n, nf_wr_n, nf_rdy, nf_dd_7, nf_dd_6,
> +          nf_dd_5, nf_dd_4, nf_dd_3, nf_dd_2, nf_dd_1, nf_dd_0,
> +          nf_dqs, nf_ce_n_0, nf_ce_n_1, emmc_dd_sb, mmc_cmd,
> +          mmc_clk, mmc_wp, mmc_cd, mmc_data_0, mmc_data_1,
> +          mmc_data_2, mmc_data_3, sdio_cmd, sdio_clk, sdio_data_0,
> +          sdio_data_1, sdio_data_2, sdio_data_3, pcie_clkreq_0,
> +          pcie_clkreq_1, prob_0, prob_1, prob_2, prob_3, sdio_loc ]
> +        minItems: 1
> +
> +      function:
> +        enum: [ gpio, acpu_ejtag_loc_iso, edp_hpd, etn_led, i2c0, i2c1, i2c6,
> +        ir_rx, ir_tx, nat_led, pwm_0, pwm_1, rtc, sc, standby_dbg,
> +        uart0, uart1, uart2_0, uart2_1, pwm_01_loc0_normal,
> +        pwm_23_loc0_normal, pwm_01_loc0_open_drain, pwm_23_loc0_open_drain,
> +        pwm_01_loc1_normal, pwm_23_loc1_normal, pwm_01_loc1_open_drain,
> +        pwm_23_loc1_open_drain, acpu_ejtag_loc_nf, ai, dc_fan_sensor,
> +        eth_gpy, gspi, i2c2, i2c3, i2c4, i2c5, nand, rgmii, scpu_ejtag_loc_gpio,
> +        sensor_cko_output, spi, test_loop_dis, tp0_loc_rgmii0_tx, tp0_loc_tp0,
> +        tp0_loc_tp1, tp1_loc_rgmii0_rx, tp1_loc_tp0, tp1_loc_tp1,
> +        usb_clock_output, hif_loc_misc, hif_loc_nf, scpu_ejtag_loc_cr, ao,
> +        dmic, spdif_out, avcpu_ej, emmc, hif, nand, p2s, pcie, pll_test,
> +        scpu_ejtag_loc_cr, sd_card, sdio_0, sdio_1 ]
> +
> +      drive-strength:
> +        enum: [2, 4, 8]
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      input-schmitt-disable: true
> +
> +      input-schmitt-enable: true
> +
> +    required:
> +      - groups
> +      - function
> +
> +    additionalProperties: false

Also need top-level 'additionalProperties: false'.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
