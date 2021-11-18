Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBCB455B37
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 13:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344504AbhKRMKg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 07:10:36 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38475 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344494AbhKRMKf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 07:10:35 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D541560016;
        Thu, 18 Nov 2021 12:07:33 +0000 (UTC)
Date:   Thu, 18 Nov 2021 13:07:33 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Cc:     nicolas.ferre@microchip.com, quentin.schulz@bootlin.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, UNGLinuxDriver@microchip.com,
        Manohar.Puri@microchip.com
Subject: Re: [PATCH v4 2/2] pinctrl: ocelot: Extend support for lan966x
Message-ID: <YZZCBfB1hi1oFBU5@piout.net>
References: <20211118112548.14582-1-kavyasree.kotagiri@microchip.com>
 <20211118112548.14582-3-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118112548.14582-3-kavyasree.kotagiri@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/11/2021 16:55:48+0530, Kavyasree Kotagiri wrote:
> This patch extends pinctrl-ocelot driver to support also the
> lan966x. Register layout is same as ocelot. It has 78 GPIOs.
> Requires 3 registers ALT0, ALT1, ALT2 to configure ALT mode.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> v3 -> v4:
> - Minor description fix in lan966x_pinmux_set_mux().
> 
> v2 -> v3:
> - Removed extra new lines in pinctrl-ocelot.
> - Reverted sparx5_desc changes which are done by mistake.
> 
> v1 -> v2:
> - Use consistent name lan966x everywhere.
> 
>  drivers/pinctrl/pinctrl-ocelot.c | 416 +++++++++++++++++++++++++++++++
>  1 file changed, 416 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index 0a36ec8775a3..875e3f319d7b 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -57,16 +57,71 @@ enum {
>  #define OCELOT_FUNC_PER_PIN	4
>  
>  enum {
> +	FUNC_CAN0_a,
> +	FUNC_CAN0_b,
> +	FUNC_CAN1,
>  	FUNC_NONE,
> +	FUNC_FC0_a,
> +	FUNC_FC0_b,
> +	FUNC_FC0_c,
> +	FUNC_FC1_a,
> +	FUNC_FC1_b,
> +	FUNC_FC1_c,
> +	FUNC_FC2_a,
> +	FUNC_FC2_b,
> +	FUNC_FC3_a,
> +	FUNC_FC3_b,
> +	FUNC_FC3_c,
> +	FUNC_FC4_a,
> +	FUNC_FC4_b,
> +	FUNC_FC4_c,
> +	FUNC_FC_SHRD0,
> +	FUNC_FC_SHRD1,
> +	FUNC_FC_SHRD2,
> +	FUNC_FC_SHRD3,
> +	FUNC_FC_SHRD4,
> +	FUNC_FC_SHRD5,
> +	FUNC_FC_SHRD6,
> +	FUNC_FC_SHRD7,
> +	FUNC_FC_SHRD8,
> +	FUNC_FC_SHRD9,
> +	FUNC_FC_SHRD10,
> +	FUNC_FC_SHRD11,
> +	FUNC_FC_SHRD12,
> +	FUNC_FC_SHRD13,
> +	FUNC_FC_SHRD14,
> +	FUNC_FC_SHRD15,
> +	FUNC_FC_SHRD16,
> +	FUNC_FC_SHRD17,
> +	FUNC_FC_SHRD18,
> +	FUNC_FC_SHRD19,
> +	FUNC_FC_SHRD20,
>  	FUNC_GPIO,
> +	FUNC_IB_TRG_a,
> +	FUNC_IB_TRG_b,
> +	FUNC_IB_TRG_c,
>  	FUNC_IRQ0,
> +	FUNC_IRQ_IN_a,
> +	FUNC_IRQ_IN_b,
> +	FUNC_IRQ_IN_c,
>  	FUNC_IRQ0_IN,
> +	FUNC_IRQ_OUT_a,
> +	FUNC_IRQ_OUT_b,
> +	FUNC_IRQ_OUT_c,
>  	FUNC_IRQ0_OUT,
>  	FUNC_IRQ1,
>  	FUNC_IRQ1_IN,
>  	FUNC_IRQ1_OUT,
>  	FUNC_EXT_IRQ,
>  	FUNC_MIIM,
> +	FUNC_MIIM_a,
> +	FUNC_MIIM_b,
> +	FUNC_MIIM_c,
> +	FUNC_MIIM_Sa,
> +	FUNC_MIIM_Sb,
> +	FUNC_OB_TRG,
> +	FUNC_OB_TRG_a,
> +	FUNC_OB_TRG_b,
>  	FUNC_PHY_LED,
>  	FUNC_PCI_WAKE,
>  	FUNC_MD,
> @@ -74,65 +129,174 @@ enum {
>  	FUNC_PTP1,
>  	FUNC_PTP2,
>  	FUNC_PTP3,
> +	FUNC_PTPSYNC_1,
> +	FUNC_PTPSYNC_2,
> +	FUNC_PTPSYNC_3,
> +	FUNC_PTPSYNC_4,
> +	FUNC_PTPSYNC_5,
> +	FUNC_PTPSYNC_6,
> +	FUNC_PTPSYNC_7,
>  	FUNC_PWM,
> +	FUNC_QSPI1,
> +	FUNC_QSPI2,
> +	FUNC_R,
> +	FUNC_RECO_a,
> +	FUNC_RECO_b,
>  	FUNC_RECO_CLK,
> +	FUNC_SD,
>  	FUNC_SFP,
> +	FUNC_SFP_SD,
>  	FUNC_SG0,
>  	FUNC_SG1,
>  	FUNC_SG2,
> +	FUNC_SGPIO_a,
> +	FUNC_SGPIO_b,
>  	FUNC_SI,
>  	FUNC_SI2,
>  	FUNC_TACHO,
> +	FUNC_TACHO_a,
> +	FUNC_TACHO_b,
>  	FUNC_TWI,
>  	FUNC_TWI2,
>  	FUNC_TWI3,
>  	FUNC_TWI_SCL_M,
> +	FUNC_TWI_SLC_GATE,
> +	FUNC_TWI_SLC_GATE_AD,
>  	FUNC_UART,
>  	FUNC_UART2,
>  	FUNC_UART3,
> +	FUNC_USB_H_a,
> +	FUNC_USB_H_b,
> +	FUNC_USB_H_c,
> +	FUNC_USB_S_a,
> +	FUNC_USB_S_b,
> +	FUNC_USB_S_c,
>  	FUNC_PLL_STAT,
>  	FUNC_EMMC,
> +	FUNC_EMMC_SD,
>  	FUNC_REF_CLK,
>  	FUNC_RCVRD_CLK,
>  	FUNC_MAX
>  };
>  
>  static const char *const ocelot_function_names[] = {
> +	[FUNC_CAN0_a]		= "can0_a",
> +	[FUNC_CAN0_b]		= "can0_b",
> +	[FUNC_CAN1]		= "can1",
>  	[FUNC_NONE]		= "none",
> +	[FUNC_FC0_a]		= "fc0_a",
> +	[FUNC_FC0_b]		= "fc0_b",
> +	[FUNC_FC0_c]		= "fc0_c",
> +	[FUNC_FC1_a]		= "fc1_a",
> +	[FUNC_FC1_b]		= "fc1_b",
> +	[FUNC_FC1_c]		= "fc1_c",
> +	[FUNC_FC2_a]		= "fc2_a",
> +	[FUNC_FC2_b]		= "fc2_b",
> +	[FUNC_FC3_a]		= "fc3_a",
> +	[FUNC_FC3_b]		= "fc3_b",
> +	[FUNC_FC3_c]		= "fc3_c",
> +	[FUNC_FC4_a]		= "fc4_a",
> +	[FUNC_FC4_b]		= "fc4_b",
> +	[FUNC_FC4_c]		= "fc4_c",
> +	[FUNC_FC_SHRD0]		= "fc_shrd0",
> +	[FUNC_FC_SHRD1]		= "fc_shrd1",
> +	[FUNC_FC_SHRD2]		= "fc_shrd2",
> +	[FUNC_FC_SHRD3]		= "fc_shrd3",
> +	[FUNC_FC_SHRD4]		= "fc_shrd4",
> +	[FUNC_FC_SHRD5]		= "fc_shrd5",
> +	[FUNC_FC_SHRD6]		= "fc_shrd6",
> +	[FUNC_FC_SHRD7]		= "fc_shrd7",
> +	[FUNC_FC_SHRD8]		= "fc_shrd8",
> +	[FUNC_FC_SHRD9]		= "fc_shrd9",
> +	[FUNC_FC_SHRD10]	= "fc_shrd10",
> +	[FUNC_FC_SHRD11]	= "fc_shrd11",
> +	[FUNC_FC_SHRD12]	= "fc_shrd12",
> +	[FUNC_FC_SHRD13]	= "fc_shrd13",
> +	[FUNC_FC_SHRD14]	= "fc_shrd14",
> +	[FUNC_FC_SHRD15]	= "fc_shrd15",
> +	[FUNC_FC_SHRD16]	= "fc_shrd16",
> +	[FUNC_FC_SHRD17]	= "fc_shrd17",
> +	[FUNC_FC_SHRD18]	= "fc_shrd18",
> +	[FUNC_FC_SHRD19]	= "fc_shrd19",
> +	[FUNC_FC_SHRD20]	= "fc_shrd20",
>  	[FUNC_GPIO]		= "gpio",
> +	[FUNC_IB_TRG_a]		= "ib_trig_a",
> +	[FUNC_IB_TRG_b]		= "ib_trig_b",
> +	[FUNC_IB_TRG_c]		= "ib_trig_c",
>  	[FUNC_IRQ0]		= "irq0",
> +	[FUNC_IRQ_IN_a]		= "irq_in_a",
> +	[FUNC_IRQ_IN_b]		= "irq_in_b",
> +	[FUNC_IRQ_IN_c]		= "irq_in_c",
>  	[FUNC_IRQ0_IN]		= "irq0_in",
> +	[FUNC_IRQ_OUT_a]	= "irq_out_a",
> +	[FUNC_IRQ_OUT_b]	= "irq_out_b",
> +	[FUNC_IRQ_OUT_c]	= "irq_out_c",
>  	[FUNC_IRQ0_OUT]		= "irq0_out",
>  	[FUNC_IRQ1]		= "irq1",
>  	[FUNC_IRQ1_IN]		= "irq1_in",
>  	[FUNC_IRQ1_OUT]		= "irq1_out",
>  	[FUNC_EXT_IRQ]		= "ext_irq",
>  	[FUNC_MIIM]		= "miim",
> +	[FUNC_MIIM_a]		= "miim_a",
> +	[FUNC_MIIM_b]		= "miim_b",
> +	[FUNC_MIIM_c]		= "miim_c",
> +	[FUNC_MIIM_Sa]		= "miim_slave_a",
> +	[FUNC_MIIM_Sb]		= "miim_slave_b",
>  	[FUNC_PHY_LED]		= "phy_led",
>  	[FUNC_PCI_WAKE]		= "pci_wake",
>  	[FUNC_MD]		= "md",
> +	[FUNC_OB_TRG]		= "ob_trig",
> +	[FUNC_OB_TRG_a]		= "ob_trig_a",
> +	[FUNC_OB_TRG_b]		= "ob_trig_b",
>  	[FUNC_PTP0]		= "ptp0",
>  	[FUNC_PTP1]		= "ptp1",
>  	[FUNC_PTP2]		= "ptp2",
>  	[FUNC_PTP3]		= "ptp3",
> +	[FUNC_PTPSYNC_1]	= "ptpsync_1",
> +	[FUNC_PTPSYNC_2]	= "ptpsync_2",
> +	[FUNC_PTPSYNC_3]	= "ptpsync_3",
> +	[FUNC_PTPSYNC_4]	= "ptpsync_4",
> +	[FUNC_PTPSYNC_5]	= "ptpsync_5",
> +	[FUNC_PTPSYNC_6]	= "ptpsync_6",
> +	[FUNC_PTPSYNC_7]	= "ptpsync_7",
>  	[FUNC_PWM]		= "pwm",
> +	[FUNC_QSPI1]		= "qspi1",
> +	[FUNC_QSPI2]		= "qspi2",
> +	[FUNC_R]		= "reserved",
> +	[FUNC_RECO_a]		= "reco_a",
> +	[FUNC_RECO_b]		= "reco_b",
>  	[FUNC_RECO_CLK]		= "reco_clk",
> +	[FUNC_SD]		= "sd",
>  	[FUNC_SFP]		= "sfp",
> +	[FUNC_SFP_SD]		= "sfp_sd",
>  	[FUNC_SG0]		= "sg0",
>  	[FUNC_SG1]		= "sg1",
>  	[FUNC_SG2]		= "sg2",
> +	[FUNC_SGPIO_a]		= "sgpio_a",
> +	[FUNC_SGPIO_b]		= "sgpio_b",
>  	[FUNC_SI]		= "si",
>  	[FUNC_SI2]		= "si2",
>  	[FUNC_TACHO]		= "tacho",
> +	[FUNC_TACHO_a]		= "tacho_a",
> +	[FUNC_TACHO_b]		= "tacho_b",
>  	[FUNC_TWI]		= "twi",
>  	[FUNC_TWI2]		= "twi2",
>  	[FUNC_TWI3]		= "twi3",
>  	[FUNC_TWI_SCL_M]	= "twi_scl_m",
> +	[FUNC_TWI_SLC_GATE]	= "twi_slc_gate",
> +	[FUNC_TWI_SLC_GATE_AD]	= "twi_slc_gate_ad",
> +	[FUNC_USB_H_a]		= "usb_host_a",
> +	[FUNC_USB_H_b]		= "usb_host_b",
> +	[FUNC_USB_H_c]		= "usb_host_c",
> +	[FUNC_USB_S_a]		= "usb_slave_a",
> +	[FUNC_USB_S_b]		= "usb_slave_b",
> +	[FUNC_USB_S_c]		= "usb_slave_c",
>  	[FUNC_UART]		= "uart",
>  	[FUNC_UART2]		= "uart2",
>  	[FUNC_UART3]		= "uart3",
>  	[FUNC_PLL_STAT]		= "pll_stat",
>  	[FUNC_EMMC]		= "emmc",
> +	[FUNC_EMMC_SD]		= "emmc_sd",
>  	[FUNC_REF_CLK]		= "ref_clk",
>  	[FUNC_RCVRD_CLK]	= "rcvrd_clk",
>  };
> @@ -145,6 +309,7 @@ struct ocelot_pmx_func {
>  struct ocelot_pin_caps {
>  	unsigned int pin;
>  	unsigned char functions[OCELOT_FUNC_PER_PIN];
> +	unsigned char a_functions[OCELOT_FUNC_PER_PIN];	/* Additional functions */
>  };
>  
>  struct ocelot_pinctrl {
> @@ -676,6 +841,187 @@ static const struct pinctrl_pin_desc sparx5_pins[] = {
>  	SPARX5_PIN(63),
>  };
>  
> +#define LAN966X_P(p, f0, f1, f2, f3, f4, f5, f6, f7)           \
> +static struct ocelot_pin_caps lan966x_pin_##p = {              \
> +	.pin = p,                                              \
> +	.functions = {                                         \
> +		FUNC_##f0, FUNC_##f1, FUNC_##f2,               \
> +		FUNC_##f3                                      \
> +	},                                                     \
> +	.a_functions = {                                       \
> +		FUNC_##f4, FUNC_##f5, FUNC_##f6,               \
> +		FUNC_##f7                                      \
> +	},                                                     \
> +}
> +
> +/* Pinmuxing table taken from data sheet */
> +/*        Pin   FUNC0    FUNC1     FUNC2      FUNC3     FUNC4     FUNC5      FUNC6    FUNC7 */
> +LAN966X_P(0,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(1,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(2,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(3,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(4,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(5,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(6,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(7,    GPIO,    NONE,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(8,    GPIO,   FC0_a,  USB_H_b,      NONE,  USB_S_b,     NONE,      NONE,        R);
> +LAN966X_P(9,    GPIO,   FC0_a,  USB_H_b,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(10,   GPIO,   FC0_a,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(11,   GPIO,   FC1_a,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(12,   GPIO,   FC1_a,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(13,   GPIO,   FC1_a,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(14,   GPIO,   FC2_a,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(15,   GPIO,   FC2_a,     NONE,      NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(16,   GPIO,   FC2_a, IB_TRG_a,      NONE, OB_TRG_a, IRQ_IN_c, IRQ_OUT_c,        R);
> +LAN966X_P(17,   GPIO,   FC3_a, IB_TRG_a,      NONE, OB_TRG_a, IRQ_IN_c, IRQ_OUT_c,        R);
> +LAN966X_P(18,   GPIO,   FC3_a, IB_TRG_a,      NONE, OB_TRG_a, IRQ_IN_c, IRQ_OUT_c,        R);
> +LAN966X_P(19,   GPIO,   FC3_a, IB_TRG_a,      NONE, OB_TRG_a, IRQ_IN_c, IRQ_OUT_c,        R);
> +LAN966X_P(20,   GPIO,   FC4_a, IB_TRG_a,      NONE, OB_TRG_a, IRQ_IN_c,      NONE,        R);
> +LAN966X_P(21,   GPIO,   FC4_a,     NONE,      NONE, OB_TRG_a,     NONE,      NONE,        R);
> +LAN966X_P(22,   GPIO,   FC4_a,     NONE,      NONE, OB_TRG_a,     NONE,      NONE,        R);
> +LAN966X_P(23,   GPIO,    NONE,     NONE,      NONE, OB_TRG_a,     NONE,      NONE,        R);
> +LAN966X_P(24,   GPIO,   FC0_b, IB_TRG_a,   USB_H_c, OB_TRG_a, IRQ_IN_c,   TACHO_a,        R);
> +LAN966X_P(25,   GPIO,   FC0_b, IB_TRG_a,   USB_H_c, OB_TRG_a, IRQ_OUT_c,   SFP_SD,        R);
> +LAN966X_P(26,   GPIO,   FC0_b, IB_TRG_a,   USB_S_c, OB_TRG_a,   CAN0_a,    SFP_SD,        R);
> +LAN966X_P(27,   GPIO,    NONE,     NONE,      NONE, OB_TRG_a,   CAN0_a,      NONE,        R);
> +LAN966X_P(28,   GPIO,  MIIM_a,     NONE,      NONE, OB_TRG_a, IRQ_OUT_c,   SFP_SD,        R);
> +LAN966X_P(29,   GPIO,  MIIM_a,     NONE,      NONE, OB_TRG_a,     NONE,      NONE,        R);
> +LAN966X_P(30,   GPIO,   FC3_c,     CAN1,      NONE,   OB_TRG,   RECO_b,      NONE,        R);
> +LAN966X_P(31,   GPIO,   FC3_c,     CAN1,      NONE,   OB_TRG,   RECO_b,      NONE,        R);
> +LAN966X_P(32,   GPIO,   FC3_c,     NONE,   SGPIO_a,     NONE,  MIIM_Sa,      NONE,        R);
> +LAN966X_P(33,   GPIO,   FC1_b,     NONE,   SGPIO_a,     NONE,  MIIM_Sa,    MIIM_b,        R);
> +LAN966X_P(34,   GPIO,   FC1_b,     NONE,   SGPIO_a,     NONE,  MIIM_Sa,    MIIM_b,        R);
> +LAN966X_P(35,   GPIO,   FC1_b,     NONE,   SGPIO_a,   CAN0_b,     NONE,      NONE,        R);
> +LAN966X_P(36,   GPIO,    NONE,  PTPSYNC_1,    NONE,   CAN0_b,     NONE,      NONE,        R);
> +LAN966X_P(37,   GPIO, FC_SHRD0, PTPSYNC_2, TWI_SLC_GATE_AD, NONE, NONE,      NONE,        R);
> +LAN966X_P(38,   GPIO,    NONE,  PTPSYNC_3,    NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(39,   GPIO,    NONE,  PTPSYNC_4,    NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(40,   GPIO, FC_SHRD1, PTPSYNC_5,    NONE,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(41,   GPIO, FC_SHRD2, PTPSYNC_6, TWI_SLC_GATE_AD, NONE, NONE,      NONE,        R);
> +LAN966X_P(42,   GPIO, FC_SHRD3, PTPSYNC_7, TWI_SLC_GATE_AD, NONE, NONE,      NONE,        R);
> +LAN966X_P(43,   GPIO,   FC2_b,   OB_TRG_b, IB_TRG_b, IRQ_OUT_a,  RECO_a,  IRQ_IN_a,       R);
> +LAN966X_P(44,   GPIO,   FC2_b,   OB_TRG_b, IB_TRG_b, IRQ_OUT_a,  RECO_a,  IRQ_IN_a,       R);
> +LAN966X_P(45,   GPIO,   FC2_b,   OB_TRG_b, IB_TRG_b, IRQ_OUT_a,    NONE,  IRQ_IN_a,       R);
> +LAN966X_P(46,   GPIO,   FC1_c,   OB_TRG_b, IB_TRG_b, IRQ_OUT_a, FC_SHRD4, IRQ_IN_a,       R);
> +LAN966X_P(47,   GPIO,   FC1_c,   OB_TRG_b, IB_TRG_b, IRQ_OUT_a, FC_SHRD5, IRQ_IN_a,       R);
> +LAN966X_P(48,   GPIO,   FC1_c,   OB_TRG_b, IB_TRG_b, IRQ_OUT_a, FC_SHRD6, IRQ_IN_a,       R);
> +LAN966X_P(49,   GPIO, FC_SHRD7,  OB_TRG_b, IB_TRG_b, IRQ_OUT_a, TWI_SLC_GATE, IRQ_IN_a,   R);
> +LAN966X_P(50,   GPIO, FC_SHRD16, OB_TRG_b, IB_TRG_b, IRQ_OUT_a, TWI_SLC_GATE, NONE,       R);
> +LAN966X_P(51,   GPIO,   FC3_b,   OB_TRG_b, IB_TRG_c, IRQ_OUT_b,    NONE,  IRQ_IN_b,       R);
> +LAN966X_P(52,   GPIO,   FC3_b,   OB_TRG_b, IB_TRG_c, IRQ_OUT_b, TACHO_b,  IRQ_IN_b,       R);
> +LAN966X_P(53,   GPIO,   FC3_b,   OB_TRG_b, IB_TRG_c, IRQ_OUT_b,    NONE,  IRQ_IN_b,       R);
> +LAN966X_P(54,   GPIO, FC_SHRD8,  OB_TRG_b, IB_TRG_c, IRQ_OUT_b, TWI_SLC_GATE, IRQ_IN_b,   R);
> +LAN966X_P(55,   GPIO, FC_SHRD9,  OB_TRG_b, IB_TRG_c, IRQ_OUT_b, TWI_SLC_GATE, IRQ_IN_b,   R);
> +LAN966X_P(56,   GPIO,   FC4_b,   OB_TRG_b, IB_TRG_c, IRQ_OUT_b, FC_SHRD10,    IRQ_IN_b,   R);
> +LAN966X_P(57,   GPIO,   FC4_b, TWI_SLC_GATE, IB_TRG_c, IRQ_OUT_b, FC_SHRD11, IRQ_IN_b,    R);
> +LAN966X_P(58,   GPIO,   FC4_b, TWI_SLC_GATE, IB_TRG_c, IRQ_OUT_b, FC_SHRD12, IRQ_IN_b,    R);
> +LAN966X_P(59,   GPIO,   QSPI1,   MIIM_c,      NONE,     NONE,  MIIM_Sb,      NONE,        R);
> +LAN966X_P(60,   GPIO,   QSPI1,   MIIM_c,      NONE,     NONE,  MIIM_Sb,      NONE,        R);
> +LAN966X_P(61,   GPIO,   QSPI1,     NONE,   SGPIO_b,    FC0_c,  MIIM_Sb,      NONE,        R);
> +LAN966X_P(62,   GPIO,   QSPI1, FC_SHRD13,  SGPIO_b,    FC0_c, TWI_SLC_GATE,  SFP_SD,      R);
> +LAN966X_P(63,   GPIO,   QSPI1, FC_SHRD14,  SGPIO_b,    FC0_c, TWI_SLC_GATE,  SFP_SD,      R);
> +LAN966X_P(64,   GPIO,   QSPI1,    FC4_c,   SGPIO_b, FC_SHRD15, TWI_SLC_GATE, SFP_SD,      R);
> +LAN966X_P(65,   GPIO, USB_H_a,    FC4_c,      NONE, IRQ_OUT_c, TWI_SLC_GATE_AD, NONE,     R);
> +LAN966X_P(66,   GPIO, USB_H_a,    FC4_c,   USB_S_a, IRQ_OUT_c, IRQ_IN_c,     NONE,        R);
> +LAN966X_P(67,   GPIO, EMMC_SD,     NONE,     QSPI2,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(68,   GPIO, EMMC_SD,     NONE,     QSPI2,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(69,   GPIO, EMMC_SD,     NONE,     QSPI2,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(70,   GPIO, EMMC_SD,     NONE,     QSPI2,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(71,   GPIO, EMMC_SD,     NONE,     QSPI2,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(72,   GPIO, EMMC_SD,     NONE,     QSPI2,     NONE,     NONE,      NONE,        R);
> +LAN966X_P(73,   GPIO,    EMMC,     NONE,      NONE,       SD,     NONE,      NONE,        R);
> +LAN966X_P(74,   GPIO,    EMMC,     NONE, FC_SHRD17,       SD, TWI_SLC_GATE,  NONE,        R);
> +LAN966X_P(75,   GPIO,    EMMC,     NONE, FC_SHRD18,       SD, TWI_SLC_GATE,  NONE,        R);
> +LAN966X_P(76,   GPIO,    EMMC,     NONE, FC_SHRD19,       SD, TWI_SLC_GATE,  NONE,        R);
> +LAN966X_P(77,   GPIO, EMMC_SD,     NONE, FC_SHRD20,     NONE, TWI_SLC_GATE,  NONE,        R);
> +
> +#define LAN966X_PIN(n) {                                       \
> +	.number = n,                                           \
> +	.name = "GPIO_"#n,                                     \
> +	.drv_data = &lan966x_pin_##n                           \
> +}
> +
> +static const struct pinctrl_pin_desc lan966x_pins[] = {
> +	LAN966X_PIN(0),
> +	LAN966X_PIN(1),
> +	LAN966X_PIN(2),
> +	LAN966X_PIN(3),
> +	LAN966X_PIN(4),
> +	LAN966X_PIN(5),
> +	LAN966X_PIN(6),
> +	LAN966X_PIN(7),
> +	LAN966X_PIN(8),
> +	LAN966X_PIN(9),
> +	LAN966X_PIN(10),
> +	LAN966X_PIN(11),
> +	LAN966X_PIN(12),
> +	LAN966X_PIN(13),
> +	LAN966X_PIN(14),
> +	LAN966X_PIN(15),
> +	LAN966X_PIN(16),
> +	LAN966X_PIN(17),
> +	LAN966X_PIN(18),
> +	LAN966X_PIN(19),
> +	LAN966X_PIN(20),
> +	LAN966X_PIN(21),
> +	LAN966X_PIN(22),
> +	LAN966X_PIN(23),
> +	LAN966X_PIN(24),
> +	LAN966X_PIN(25),
> +	LAN966X_PIN(26),
> +	LAN966X_PIN(27),
> +	LAN966X_PIN(28),
> +	LAN966X_PIN(29),
> +	LAN966X_PIN(30),
> +	LAN966X_PIN(31),
> +	LAN966X_PIN(32),
> +	LAN966X_PIN(33),
> +	LAN966X_PIN(34),
> +	LAN966X_PIN(35),
> +	LAN966X_PIN(36),
> +	LAN966X_PIN(37),
> +	LAN966X_PIN(38),
> +	LAN966X_PIN(39),
> +	LAN966X_PIN(40),
> +	LAN966X_PIN(41),
> +	LAN966X_PIN(42),
> +	LAN966X_PIN(43),
> +	LAN966X_PIN(44),
> +	LAN966X_PIN(45),
> +	LAN966X_PIN(46),
> +	LAN966X_PIN(47),
> +	LAN966X_PIN(48),
> +	LAN966X_PIN(49),
> +	LAN966X_PIN(50),
> +	LAN966X_PIN(51),
> +	LAN966X_PIN(52),
> +	LAN966X_PIN(53),
> +	LAN966X_PIN(54),
> +	LAN966X_PIN(55),
> +	LAN966X_PIN(56),
> +	LAN966X_PIN(57),
> +	LAN966X_PIN(58),
> +	LAN966X_PIN(59),
> +	LAN966X_PIN(60),
> +	LAN966X_PIN(61),
> +	LAN966X_PIN(62),
> +	LAN966X_PIN(63),
> +	LAN966X_PIN(64),
> +	LAN966X_PIN(65),
> +	LAN966X_PIN(66),
> +	LAN966X_PIN(67),
> +	LAN966X_PIN(68),
> +	LAN966X_PIN(69),
> +	LAN966X_PIN(70),
> +	LAN966X_PIN(71),
> +	LAN966X_PIN(72),
> +	LAN966X_PIN(73),
> +	LAN966X_PIN(74),
> +	LAN966X_PIN(75),
> +	LAN966X_PIN(76),
> +	LAN966X_PIN(77),
> +};
> +
>  static int ocelot_get_functions_count(struct pinctrl_dev *pctldev)
>  {
>  	return ARRAY_SIZE(ocelot_function_names);
> @@ -709,6 +1055,9 @@ static int ocelot_pin_function_idx(struct ocelot_pinctrl *info,
>  	for (i = 0; i < OCELOT_FUNC_PER_PIN; i++) {
>  		if (function == p->functions[i])
>  			return i;
> +
> +		if (function == p->a_functions[i])
> +			return i + OCELOT_FUNC_PER_PIN;
>  	}
>  
>  	return -1;
> @@ -744,6 +1093,36 @@ static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static int lan966x_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +				  unsigned int selector, unsigned int group)
> +{
> +	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +	struct ocelot_pin_caps *pin = info->desc->pins[group].drv_data;
> +	unsigned int p = pin->pin % 32;
> +	int f;
> +
> +	f = ocelot_pin_function_idx(info, group, selector);
> +	if (f < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * f is encoded on three bits.
> +	 * bit 0 of f goes in BIT(pin) of ALT[0], bit 1 of f goes in BIT(pin) of
> +	 * ALT[1], bit 2 of f goes in BIT(pin) of ALT[2]
> +	 * This is racy because three registers can't be updated at the same time
> +	 * but it doesn't matter much for now.
> +	 * Note: ALT0/ALT1/ALT2 are organized specially for 78 gpio targets
> +	 */
> +	regmap_update_bits(info->map, REG_ALT(0, info, pin->pin),
> +			   BIT(p), f << p);
> +	regmap_update_bits(info->map, REG_ALT(1, info, pin->pin),
> +			   BIT(p), (f >> 1) << p);
> +	regmap_update_bits(info->map, REG_ALT(2, info, pin->pin),
> +			   BIT(p), (f >> 2) << p);
> +
> +	return 0;
> +}
> +
>  #define REG(r, info, p) ((r) * (info)->stride + (4 * ((p) / 32)))
>  
>  static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
> @@ -774,6 +1153,23 @@ static int ocelot_gpio_request_enable(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static int lan966x_gpio_request_enable(struct pinctrl_dev *pctldev,
> +				       struct pinctrl_gpio_range *range,
> +				       unsigned int offset)
> +{
> +	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int p = offset % 32;
> +
> +	regmap_update_bits(info->map, REG_ALT(0, info, offset),
> +			   BIT(p), 0);
> +	regmap_update_bits(info->map, REG_ALT(1, info, offset),
> +			   BIT(p), 0);
> +	regmap_update_bits(info->map, REG_ALT(2, info, offset),
> +			   BIT(p), 0);
> +
> +	return 0;
> +}
> +
>  static const struct pinmux_ops ocelot_pmx_ops = {
>  	.get_functions_count = ocelot_get_functions_count,
>  	.get_function_name = ocelot_get_function_name,
> @@ -783,6 +1179,15 @@ static const struct pinmux_ops ocelot_pmx_ops = {
>  	.gpio_request_enable = ocelot_gpio_request_enable,
>  };
>  
> +static const struct pinmux_ops lan966x_pmx_ops = {
> +	.get_functions_count = ocelot_get_functions_count,
> +	.get_function_name = ocelot_get_function_name,
> +	.get_function_groups = ocelot_get_function_groups,
> +	.set_mux = lan966x_pinmux_set_mux,
> +	.gpio_set_direction = ocelot_gpio_set_direction,
> +	.gpio_request_enable = lan966x_gpio_request_enable,
> +};
> +
>  static int ocelot_pctl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> @@ -1078,6 +1483,16 @@ static struct pinctrl_desc sparx5_desc = {
>  	.owner = THIS_MODULE,
>  };
>  
> +static struct pinctrl_desc lan966x_desc = {
> +	.name = "lan966x-pinctrl",
> +	.pins = lan966x_pins,
> +	.npins = ARRAY_SIZE(lan966x_pins),
> +	.pctlops = &ocelot_pctl_ops,
> +	.pmxops = &lan966x_pmx_ops,
> +	.confops = &ocelot_confops,
> +	.owner = THIS_MODULE,
> +};
> +
>  static int ocelot_create_group_func_map(struct device *dev,
>  					struct ocelot_pinctrl *info)
>  {
> @@ -1337,6 +1752,7 @@ static const struct of_device_id ocelot_pinctrl_of_match[] = {
>  	{ .compatible = "mscc,ocelot-pinctrl", .data = &ocelot_desc },
>  	{ .compatible = "mscc,jaguar2-pinctrl", .data = &jaguar2_desc },
>  	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
> +	{ .compatible = "microchip,lan966x-pinctrl", .data = &lan966x_desc },
>  	{},
>  };
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
