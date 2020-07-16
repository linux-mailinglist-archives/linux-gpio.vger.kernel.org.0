Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B32222C62
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 21:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbgGPTzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 15:55:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39154 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbgGPTzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 15:55:03 -0400
Received: by mail-io1-f67.google.com with SMTP id f23so7328086iof.6;
        Thu, 16 Jul 2020 12:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nXAv12lsNUjEh9VtLZRz3N/2gO0AvNkM24VsJjOyNps=;
        b=URfzoAUg3BtWotHVMkml297hWyX3dxcwkuoNhoC5U48SvtqwnXVvfkMTtyag1GePM5
         bQr9yqt+gJVkaGB7csXS6Gxk/bAxVXp3bA7wFdqqQauXR+un078LDkdTwtG07ttK/lv1
         +pORZQiHgo0gEEQWNB0eqEZSadvLiYY52FrGIAwbos6eRtIkJUKCB4awBJsF84yH91qs
         b9TRUW2zhPA1XImQBeFU6gCVpCMK4YKGCXdnXICmRp9Y8HXvUz+X0A21hRnf6F/yPlZr
         vG5AMJkhU1lo4Dy0ZKp6C1IkNTujpieyz74q88WVBx2klx8QJ7y319PGpgvvDl9yxqKO
         5U5w==
X-Gm-Message-State: AOAM532F6mMuD7+8e0718BPyvJqZJxxmiLpaJG3+jG3omVtwLUGqBPWu
        2XV7w0IoRhbh5e5UOtuFvQ==
X-Google-Smtp-Source: ABdhPJxDdEADH+lIj8Gx8yPjmLIDjelAxfwU43qG9iwH7ON+nAWCvxhMvw8eR1tYlwzlId4U8LUmOQ==
X-Received: by 2002:a05:6602:2184:: with SMTP id b4mr6260684iob.156.1594929302136;
        Thu, 16 Jul 2020 12:55:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a10sm3124861iln.20.2020.07.16.12.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 12:55:01 -0700 (PDT)
Received: (nullmailer pid 2741371 invoked by uid 1000);
        Thu, 16 Jul 2020 19:54:58 -0000
Date:   Thu, 16 Jul 2020 13:54:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     TY Chang <tychang@realtek.com>
Cc:     linux-realtek-soc@lists.infradead.org, afaerber@suse.de,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: pinctrl: realtek: Add Realtek DHC
 SoC rtd1195
Message-ID: <20200716195458.GA2739358@bogus>
References: <20200716023338.14922-1-tychang@realtek.com>
 <20200716023338.14922-5-tychang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716023338.14922-5-tychang@realtek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 10:33:34AM +0800, TY Chang wrote:
> Add device tree binding Documentation for rtd1195
> pinctrl driver.
> 
> Signed-off-by: TY Chang <tychang@realtek.com>
> ---
>  .../pinctrl/realtek,rtd1195-pinctrl.yaml      | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml
> new file mode 100644
> index 000000000000..50a95bc46e2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1195-pinctrl.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/realtek,rtd1195-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek DHC RTD1195 pin control
> +
> +maintainers:
> +  - Andreas Farber <afaerber@suse.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1195-iso-pinctrl
> +      - realtek,rtd1195-crt-pinctrl
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
> +          enum: [ iso_gpio_0, iso_gpio_1, usb0, usb1, vfd_cs_n,
> +          vfd_clk, vfd_d, ir_rx, ir_tx, ur0_rx, ur0_tx,
> +          ur1_rx, ur1_tx, ur1_cts_n, ur1_rts_n, i2c_scl_0,
> +          i2c_sda_0, etn_led_link, etn_led_rxtx,
> +          i2c_scl_6, i2c_sda_6, ai_loc, ejtag_avcpu_loc,
> +          ur1_loc, pwm_01_open_drain, pwm_23_open_drain,
> +          gpio_0, gpio_1, gpio_2, gpio_3, gpio_4, gpio_5,
> +          gpio_6, gpio_7, gpio_8, nf_dd_0, nf_dd_1,
> +          nf_dd_2, nf_dd_3, nf_dd_4, nf_dd_5, nf_dd_6,
> +          nf_dd_7, nf_rdy, nf_rd_n, nf_wr_n, nf_ale,
> +          nf_cle, nf_ce_n_0, nf_ce_n_1, mmc_data_0,
> +          mmc_data_1, mmc_data_2, mmc_data_3, mmc_clk,
> +          mmc_cmd, mmc_wp, mmc_cd, sdio_clk, sdio_data_0,
> +          sdio_data_1, sdio_data_2, sdio_data_3, sdio_cmd,
> +          i2c_scl_5, i2c_sda_5, tp1_data, tp1_clk,
> +          tp1_valid, tp1_sync, tp0_data, tp0_clk,
> +          tp0_valid, tp0_sync, usb_id, hdmi_hpd, spdif,
> +          i2c_scl_1, i2c_sda_1, i2c_scl_4, i2c_sda_4,
> +          sensor_cko_0, sensor_cko_1, sensor_rst,
> +          sensor_stb_0, sensor_stb_1, ejtag_scpu_loc,
> +          hif_loc, ao_loc ]
> +        minItems: 1
> +
> +      function:
> +        enum: [ gpio, ai_ur1, ai_vfd, avcpu_ejtag_iso,
> +        avcpu_ejtag_misc_loc, etn_led, i2c0, i2c2,
> +        i2c3, i2c6, ir_rx, ir_tx, pwm, standby_dbg,
> +        uart0, uart1, ur1_misc, vfd, pwm_01_normal,
> +        pwm_23_normal, pwm_01_open_drain, pwm_23_open_drain,
> +        ao_tp0, ao_gpio, avcpu_ejtag_misc, cpu_loop, emmc,
> +        gspi, hif_misc, hif_nf, i2c1, i2c2, i2c3,
> +        i2c4, i2c5, mmc, nand, scpu_ejtag_gpio,
> +        scpu_ejtag_cr, sdio, sensor, spdif, tp0, tp1,
> +        uart1, usb ]
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

Also need a top-level 'additionalProperties: false'

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
