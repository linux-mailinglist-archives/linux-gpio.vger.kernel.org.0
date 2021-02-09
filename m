Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D8A314624
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 03:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhBICV2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 21:21:28 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:35694 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhBICV0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 21:21:26 -0500
Received: by mail-ot1-f51.google.com with SMTP id k10so13811349otl.2;
        Mon, 08 Feb 2021 18:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UmmwTop39blNXLF74F+dxA9iOmxcNSdWDGQ1tjiiL7s=;
        b=qXN2P4X6n3Izs+rqjMA6hB67E+KXEG2x/nSFHNNzjakd+Z72wXiOq27zZMVEZ6NRLG
         4QI51i0bq6NwsmpLoiLTeqoZsIXcahUtAlbxr/y6S3vmgGj0JxlhLoG2gvL7DNH8aQ3K
         UgBaSCP2tYVSAfenlJkzalFsa0ttZzYvkQEVi1qbzVWRbwQhvhb916rWYERHPIQkQCri
         zaymA38BuYp7E8BLjqb5ZZW2DU5PxTyzhyXRKsWa9fTRIgZe6z7PssDfsJMBhcmlFXYz
         Q9Wf79SY3thv/DY74x0IsHmYnemi5741Wcr/gQvCIOhDTj6saOjtto0JjpxR21WMwMOr
         iCPw==
X-Gm-Message-State: AOAM531Wg2RYWyz4Z3fWOYHQOxpYqdmkbrF8PcExiJ7J1DKQsmyRwDl+
        V/aK+xpZeLnsoF10oVqtxQ==
X-Google-Smtp-Source: ABdhPJzX917vi1P159kW8nmzrXA8IFTb5DXhWBNpM4jbNyITfYA/QW+x/R8A18umW0QrDOfNht1Dxg==
X-Received: by 2002:a05:6830:233a:: with SMTP id q26mr13861573otg.151.1612837243882;
        Mon, 08 Feb 2021 18:20:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s189sm4023913oif.19.2021.02.08.18.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 18:20:42 -0800 (PST)
Received: (nullmailer pid 2542498 invoked by uid 1000);
        Tue, 09 Feb 2021 02:20:41 -0000
Date:   Mon, 8 Feb 2021 20:20:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        git@xilinx.com, saikrishna12468@gmail.com
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Message-ID: <20210209022041.GA2527041@robh.at.kernel.org>
References: <1611034054-63867-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1611034054-63867-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611034054-63867-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 19, 2021 at 10:57:33AM +0530, Sai Krishna Potthuri wrote:
> Added documentation and dt-bindings file which contains MIO pin
> configuration defines for Xilinx ZynqMP pinctrl driver.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 337 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |  23 ++
>  2 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> new file mode 100644
> index 000000000000..9f2efbafcaa4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> @@ -0,0 +1,337 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx ZynqMP Pinctrl
> +
> +maintainers:
> +  - Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> +  - Rajan Vaja <rajan.vaja@xilinx.com>
> +
> +description: |
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  ZynqMP's pin configuration nodes act as a container for an arbitrary number of
> +  subnodes. Each of these subnodes represents some desired configuration for a
> +  pin, a group, or a list of pins or groups. This configuration can include the
> +  mux function to select on those pin(s)/group(s), and various pin configuration
> +  parameters, such as pull-up, slew rate, etc.
> +
> +  Each configuration node can consist of multiple nodes describing the pinmux and
> +  pinconf options. Those nodes can be pinmux nodes or pinconf nodes.
> +
> +  The name of each subnode is not important; all subnodes should be enumerated
> +  and processed purely based on their content.
> +
> +properties:
> +  compatible:
> +    const: xlnx,zynqmp-pinctrl
> +
> +patternProperties:
> +  '^(.*-)?(default|gpio)$':
> +    type: object
> +    patternProperties:
> +      '^mux(.*)$':

'^mux' is equivalent.

> +        type: object
> +        description:
> +          Pinctrl node's client devices use subnodes for pin muxes,
> +          which in turn use below standard properties.
> +        $ref: pinmux-node.yaml#
> +
> +        properties:
> +          groups:
> +            description:
> +              List of groups to select (either this or "pins" must be
> +              specified), available groups for this subnode.
> +            items:
> +              oneOf:
> +                - enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,

Don't need 'oneOf' for a single item.

> +                         ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
> +                         gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
> +                         mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
> +                         qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
> +                         spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
> +                         spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
> +                         spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
> +                         spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
> +                         spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
> +                         spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
> +                         spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
> +                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
> +                         spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
> +                         spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
> +                         spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
> +                         spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
> +                         spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
> +                         spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
> +                         spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
> +                         spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
> +                         sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
> +                         sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
> +                         sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
> +                         sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
> +                         sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
> +                         sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
> +                         sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
> +                         sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
> +                         sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
> +                         sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
> +                         sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
> +                         sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
> +                         sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
> +                         sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
> +                         sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
> +                         sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
> +                         sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
> +                         sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
> +                         sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
> +                         sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
> +                         sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
> +                         sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
> +                         nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
> +                         nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
> +                         can0_1_grp, can0_2_grp, can0_3_grp,
> +                         can0_4_grp, can0_5_grp, can0_6_grp,
> +                         can0_7_grp, can0_8_grp, can0_9_grp,
> +                         can0_10_grp, can0_11_grp, can0_12_grp,
> +                         can0_13_grp, can0_14_grp, can0_15_grp,
> +                         can0_16_grp, can0_17_grp, can0_18_grp,
> +                         can1_0_grp, can1_1_grp, can1_2_grp,
> +                         can1_3_grp, can1_4_grp, can1_5_grp,
> +                         can1_6_grp, can1_7_grp, can1_8_grp,
> +                         can1_9_grp, can1_10_grp, can1_11_grp,
> +                         can1_12_grp, can1_13_grp, can1_14_grp,
> +                         can1_15_grp, can1_16_grp, can1_17_grp,
> +                         can1_18_grp, can1_19_grp, uart0_0_grp,
> +                         uart0_1_grp, uart0_2_grp, uart0_3_grp,
> +                         uart0_4_grp, uart0_5_grp, uart0_6_grp,
> +                         uart0_7_grp, uart0_8_grp, uart0_9_grp,
> +                         uart0_10_grp, uart0_11_grp, uart0_12_grp,
> +                         uart0_13_grp, uart0_14_grp, uart0_15_grp,
> +                         uart0_16_grp, uart0_17_grp, uart0_18_grp,
> +                         uart1_0_grp, uart1_1_grp, uart1_2_grp,
> +                         uart1_3_grp, uart1_4_grp, uart1_5_grp,
> +                         uart1_6_grp, uart1_7_grp, uart1_8_grp,
> +                         uart1_9_grp, uart1_10_grp, uart1_11_grp,
> +                         uart1_12_grp, uart1_13_grp, uart1_14_grp,
> +                         uart1_15_grp, uart1_16_grp, uart1_17_grp,
> +                         uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
> +                         i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
> +                         i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
> +                         i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
> +                         i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
> +                         i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
> +                         i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
> +                         i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
> +                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
> +                         i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
> +                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
> +                         i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
> +                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
> +                         i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
> +                         ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
> +                         ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
> +                         ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
> +                         ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
> +                         ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
> +                         ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
> +                         ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
> +                         ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
> +                         ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
> +                         ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
> +                         ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
> +                         ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
> +                         ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
> +                         ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
> +                         ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
> +                         ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
> +                         ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
> +                         ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
> +                         ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
> +                         ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
> +                         ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
> +                         ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
> +                         ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
> +                         ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
> +                         swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
> +                         swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
> +                         swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
> +                         swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
> +                         swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
> +                         swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
> +                         swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
> +                         swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
> +                         swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
> +                         swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
> +                         swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
> +                         swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
> +                         swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
> +                         swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
> +                         swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
> +                         swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
> +                         swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
> +                         gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
> +                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
> +                         gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
> +                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
> +                         gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
> +                         gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
> +                         gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
> +                         gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
> +                         gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
> +                         gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
> +                         gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
> +                         gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
> +                         gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
> +                         gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
> +                         gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
> +                         gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
> +                         gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
> +                         gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
> +                         gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
> +                         gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
> +                         gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
> +                         gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
> +                         gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
> +                         gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
> +                         gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
> +                         gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
> +                         usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
> +                         pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
> +                         pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
> +                         pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
> +                         pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
> +                         pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
> +                         pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
> +                         csu0_0_grp, csu0_1_grp, csu0_2_grp,
> +                         csu0_3_grp, csu0_4_grp, csu0_5_grp,
> +                         csu0_6_grp, csu0_7_grp, csu0_8_grp,
> +                         csu0_9_grp, csu0_10_grp, csu0_11_grp,
> +                         dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
> +                         dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
> +                         pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
> +                         pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
> +                         trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
> +                         trace0_clk_2_grp, testscan0_0_grp]
> +
> +          function:
> +            description:
> +              Specify the alternative function to be configured for the
> +              given pin groups.
> +            enum: [ethernet0, ethernet1, ethernet2, ethernet3, gemtsu0, usb0, usb1, mdio0,
> +                   mdio1, mdio2, mdio3, qspi0, qspi_fbclk, qspi_ss, spi0, spi1, spi0_ss,
> +                   spi1_ss, sdio0, sdio0_pc, sdio0_wp, sdio0_cd, sdio1, sdio1_pc, sdio1_wp,
> +                   sdio1_cd, nand0, nand0_ce, nand0_rb, nand0_dqs, can0, can1, uart0, uart1,
> +                   i2c0, i2c1, ttc0_clk, ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav,
> +                   ttc3_clk, ttc3_wav, swdt0_clk, swdt0_rst, swdt1_clk, swdt1_rst, gpio0, pmu0,
> +                   pcie0, csu0, dpaux0, pjtag0, trace0, trace0_clk, testscan0]
> +
> +        required:
> +          - groups
> +          - function
> +
> +        additionalProperties: false
> +
> +      '^conf(.*)$':

'^conf':

> +        type: object
> +        description:
> +          Pinctrl node's client devices use subnodes for pin configurations,
> +          which in turn use the standard properties below.
> +        $ref: pincfg-node.yaml#
> +
> +        properties:
> +          groups:
> +            description:
> +              List of pin groups as mentioned above (either this or "pins" must
> +              be specified).
> +
> +          pins:
> +            description:
> +              List of pin names to select in this subnode (either this or "groups" must
> +              be specified)

This can be expressed as:

oneOf:
  - required: [ groups ]
  - required: [ pins ]

> +            items:
> +              oneOf:

Can drop oneOf.

> +                - pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          bias-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          bias-high-impedance: true
> +
> +          low-power-enable: true
> +
> +          low-power-disable: true
> +
> +          slew-rate:
> +            enum: [0, 1]
> +
> +          drive-strength:
> +            description:
> +              Selects the drive strength for MIO pins, in mA.
> +            enum: [2, 4, 8, 12]
> +
> +          io-standard:
> +            description:
> +              Selects the IO standard for MIO pins, this is driver specific.
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [0, 1]
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
> +    zynqmp_firmware: zynqmp-firmware {
> +        pinctrl0: pinctrl {
> +          compatible = "xlnx,zynqmp-pinctrl";
> +
> +          pinctrl_uart1_default: uart1-default {
> +             mux {
> +                 groups = "uart0_4_grp", "uart0_5_grp";
> +                 function = "uart0";
> +             };
> +
> +             conf {
> +                groups = "uart0_4_grp";
> +                slew-rate = <SLEW_RATE_SLOW>;
> +                io-standard = <IO_STANDARD_LVCMOS18>;
> +             };
> +
> +             conf-rx {
> +                pins = "MIO18";
> +                bias-pull-up;
> +             };
> +
> +             conf-tx {
> +                pins = "MIO19";
> +                bias-disable;
> +                input-schmitt-disable;
> +             };
> +          };
> +        };
> +    };
> +
> +    uart1 {
> +         pinctrl-names = "default";
> +         pinctrl-0 = <&pinctrl_uart1_default>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/pinctrl/pinctrl-zynqmp.h b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> new file mode 100644
> index 000000000000..b73b0ae2f90b
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * MIO pin configuration defines for Xilinx ZynqMP
> + *
> + * Copyright (C) 2020 Xilinx, Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_ZYNQMP_H
> +#define _DT_BINDINGS_PINCTRL_ZYNQMP_H
> +
> +/* Bit value for IO standards */
> +#define IO_STANDARD_LVCMOS33	0
> +#define IO_STANDARD_LVCMOS18	1
> +
> +/* Bit values for Slew Rates */
> +#define SLEW_RATE_FAST		0
> +#define SLEW_RATE_SLOW		1
> +
> +/* Bit values for Pin inputs */
> +#define PIN_INPUT_TYPE_CMOS	0
> +#define PIN_INPUT_TYPE_SCHMITT	1

Still used?

> +
> +#endif /* _DT_BINDINGS_PINCTRL_ZYNQMP_H */
> -- 
> 2.17.1
> 
