Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6907B20B066
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 13:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgFZL05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 07:26:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:29451 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728381AbgFZL05 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Jun 2020 07:26:57 -0400
IronPort-SDR: KyWkFoCLoK+W+IuBD191WFsqvaQnJ00kOI2EgKKfyv8uTO3VM2BavN37ycFDJLf6Phegc0p76M
 5ppttBMvQKdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="132718061"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="132718061"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 04:26:54 -0700
IronPort-SDR: lbkSCFj1ANnAOVvINE0k8TDqwLUv32fTxtDMg/axNZM8XfkHONA6+xGd6niyGdO8Wka8TnaZ5g
 sHcvdb4IqsrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="276340329"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 26 Jun 2020 04:26:52 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1jomVR-00G4g5-UQ; Fri, 26 Jun 2020 14:26:53 +0300
Date:   Fri, 26 Jun 2020 14:26:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: tigerlake: Add support for Tiger Lake-H
Message-ID: <20200626112653.GS3703480@smile.fi.intel.com>
References: <20200625132053.44492-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625132053.44492-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 04:20:53PM +0300, Mika Westerberg wrote:
> Intel Tiger Lake-H has different pin layout than the -LP variant
> so add support for this to the existing Tiger Lake driver.

Pushed to my review and testing queue, thanks!

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-tigerlake.c | 358 ++++++++++++++++++++++
>  1 file changed, 358 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
> index bcfd7548e282..8c162dd5f5a1 100644
> --- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
> +++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
> @@ -380,8 +380,366 @@ static const struct intel_pinctrl_soc_data tgllp_soc_data = {
>  	.ncommunities = ARRAY_SIZE(tgllp_communities),
>  };
>  
> +/* Tiger Lake-H */
> +static const struct pinctrl_pin_desc tglh_pins[] = {
> +	/* GPP_A */
> +	PINCTRL_PIN(0, "SPI0_IO_2"),
> +	PINCTRL_PIN(1, "SPI0_IO_3"),
> +	PINCTRL_PIN(2, "SPI0_MOSI_IO_0"),
> +	PINCTRL_PIN(3, "SPI0_MISO_IO_1"),
> +	PINCTRL_PIN(4, "SPI0_TPM_CSB"),
> +	PINCTRL_PIN(5, "SPI0_FLASH_0_CSB"),
> +	PINCTRL_PIN(6, "SPI0_FLASH_1_CSB"),
> +	PINCTRL_PIN(7, "SPI0_CLK"),
> +	PINCTRL_PIN(8, "ESPI_IO_0"),
> +	PINCTRL_PIN(9, "ESPI_IO_1"),
> +	PINCTRL_PIN(10, "ESPI_IO_2"),
> +	PINCTRL_PIN(11, "ESPI_IO_3"),
> +	PINCTRL_PIN(12, "ESPI_CS0B"),
> +	PINCTRL_PIN(13, "ESPI_CLK"),
> +	PINCTRL_PIN(14, "ESPI_RESETB"),
> +	PINCTRL_PIN(15, "ESPI_CS1B"),
> +	PINCTRL_PIN(16, "ESPI_CS2B"),
> +	PINCTRL_PIN(17, "ESPI_CS3B"),
> +	PINCTRL_PIN(18, "ESPI_ALERT0B"),
> +	PINCTRL_PIN(19, "ESPI_ALERT1B"),
> +	PINCTRL_PIN(20, "ESPI_ALERT2B"),
> +	PINCTRL_PIN(21, "ESPI_ALERT3B"),
> +	PINCTRL_PIN(22, "GPPC_A_14"),
> +	PINCTRL_PIN(23, "SPI0_CLK_LOOPBK"),
> +	PINCTRL_PIN(24, "ESPI_CLK_LOOPBK"),
> +	/* GPP_R */
> +	PINCTRL_PIN(25, "HDA_BCLK"),
> +	PINCTRL_PIN(26, "HDA_SYNC"),
> +	PINCTRL_PIN(27, "HDA_SDO"),
> +	PINCTRL_PIN(28, "HDA_SDI_0"),
> +	PINCTRL_PIN(29, "HDA_RSTB"),
> +	PINCTRL_PIN(30, "HDA_SDI_1"),
> +	PINCTRL_PIN(31, "GPP_R_6"),
> +	PINCTRL_PIN(32, "GPP_R_7"),
> +	PINCTRL_PIN(33, "GPP_R_8"),
> +	PINCTRL_PIN(34, "PCIE_LNK_DOWN"),
> +	PINCTRL_PIN(35, "ISH_UART0_RTSB"),
> +	PINCTRL_PIN(36, "SX_EXIT_HOLDOFFB"),
> +	PINCTRL_PIN(37, "CLKOUT_48"),
> +	PINCTRL_PIN(38, "ISH_GP_7"),
> +	PINCTRL_PIN(39, "ISH_GP_0"),
> +	PINCTRL_PIN(40, "ISH_GP_1"),
> +	PINCTRL_PIN(41, "ISH_GP_2"),
> +	PINCTRL_PIN(42, "ISH_GP_3"),
> +	PINCTRL_PIN(43, "ISH_GP_4"),
> +	PINCTRL_PIN(44, "ISH_GP_5"),
> +	/* GPP_B */
> +	PINCTRL_PIN(45, "GSPI0_CS1B"),
> +	PINCTRL_PIN(46, "GSPI1_CS1B"),
> +	PINCTRL_PIN(47, "VRALERTB"),
> +	PINCTRL_PIN(48, "CPU_GP_2"),
> +	PINCTRL_PIN(49, "CPU_GP_3"),
> +	PINCTRL_PIN(50, "SRCCLKREQB_0"),
> +	PINCTRL_PIN(51, "SRCCLKREQB_1"),
> +	PINCTRL_PIN(52, "SRCCLKREQB_2"),
> +	PINCTRL_PIN(53, "SRCCLKREQB_3"),
> +	PINCTRL_PIN(54, "SRCCLKREQB_4"),
> +	PINCTRL_PIN(55, "SRCCLKREQB_5"),
> +	PINCTRL_PIN(56, "I2S_MCLK"),
> +	PINCTRL_PIN(57, "SLP_S0B"),
> +	PINCTRL_PIN(58, "PLTRSTB"),
> +	PINCTRL_PIN(59, "SPKR"),
> +	PINCTRL_PIN(60, "GSPI0_CS0B"),
> +	PINCTRL_PIN(61, "GSPI0_CLK"),
> +	PINCTRL_PIN(62, "GSPI0_MISO"),
> +	PINCTRL_PIN(63, "GSPI0_MOSI"),
> +	PINCTRL_PIN(64, "GSPI1_CS0B"),
> +	PINCTRL_PIN(65, "GSPI1_CLK"),
> +	PINCTRL_PIN(66, "GSPI1_MISO"),
> +	PINCTRL_PIN(67, "GSPI1_MOSI"),
> +	PINCTRL_PIN(68, "SML1ALERTB"),
> +	PINCTRL_PIN(69, "GSPI0_CLK_LOOPBK"),
> +	PINCTRL_PIN(70, "GSPI1_CLK_LOOPBK"),
> +	/* vGPIO_0 */
> +	PINCTRL_PIN(71, "ESPI_USB_OCB_0"),
> +	PINCTRL_PIN(72, "ESPI_USB_OCB_1"),
> +	PINCTRL_PIN(73, "ESPI_USB_OCB_2"),
> +	PINCTRL_PIN(74, "ESPI_USB_OCB_3"),
> +	PINCTRL_PIN(75, "USB_CPU_OCB_0"),
> +	PINCTRL_PIN(76, "USB_CPU_OCB_1"),
> +	PINCTRL_PIN(77, "USB_CPU_OCB_2"),
> +	PINCTRL_PIN(78, "USB_CPU_OCB_3"),
> +	/* GPP_D */
> +	PINCTRL_PIN(79, "SPI1_CSB"),
> +	PINCTRL_PIN(80, "SPI1_CLK"),
> +	PINCTRL_PIN(81, "SPI1_MISO_IO_1"),
> +	PINCTRL_PIN(82, "SPI1_MOSI_IO_0"),
> +	PINCTRL_PIN(83, "SML1CLK"),
> +	PINCTRL_PIN(84, "I2S2_SFRM"),
> +	PINCTRL_PIN(85, "I2S2_TXD"),
> +	PINCTRL_PIN(86, "I2S2_RXD"),
> +	PINCTRL_PIN(87, "I2S2_SCLK"),
> +	PINCTRL_PIN(88, "SML0CLK"),
> +	PINCTRL_PIN(89, "SML0DATA"),
> +	PINCTRL_PIN(90, "GPP_D_11"),
> +	PINCTRL_PIN(91, "ISH_UART0_CTSB"),
> +	PINCTRL_PIN(92, "SPI1_IO_2"),
> +	PINCTRL_PIN(93, "SPI1_IO_3"),
> +	PINCTRL_PIN(94, "SML1DATA"),
> +	PINCTRL_PIN(95, "GSPI3_CS0B"),
> +	PINCTRL_PIN(96, "GSPI3_CLK"),
> +	PINCTRL_PIN(97, "GSPI3_MISO"),
> +	PINCTRL_PIN(98, "GSPI3_MOSI"),
> +	PINCTRL_PIN(99, "UART3_RXD"),
> +	PINCTRL_PIN(100, "UART3_TXD"),
> +	PINCTRL_PIN(101, "UART3_RTSB"),
> +	PINCTRL_PIN(102, "UART3_CTSB"),
> +	PINCTRL_PIN(103, "SPI1_CLK_LOOPBK"),
> +	PINCTRL_PIN(104, "GSPI3_CLK_LOOPBK"),
> +	/* GPP_C */
> +	PINCTRL_PIN(105, "SMBCLK"),
> +	PINCTRL_PIN(106, "SMBDATA"),
> +	PINCTRL_PIN(107, "SMBALERTB"),
> +	PINCTRL_PIN(108, "ISH_UART0_RXD"),
> +	PINCTRL_PIN(109, "ISH_UART0_TXD"),
> +	PINCTRL_PIN(110, "SML0ALERTB"),
> +	PINCTRL_PIN(111, "ISH_I2C2_SDA"),
> +	PINCTRL_PIN(112, "ISH_I2C2_SCL"),
> +	PINCTRL_PIN(113, "UART0_RXD"),
> +	PINCTRL_PIN(114, "UART0_TXD"),
> +	PINCTRL_PIN(115, "UART0_RTSB"),
> +	PINCTRL_PIN(116, "UART0_CTSB"),
> +	PINCTRL_PIN(117, "UART1_RXD"),
> +	PINCTRL_PIN(118, "UART1_TXD"),
> +	PINCTRL_PIN(119, "UART1_RTSB"),
> +	PINCTRL_PIN(120, "UART1_CTSB"),
> +	PINCTRL_PIN(121, "I2C0_SDA"),
> +	PINCTRL_PIN(122, "I2C0_SCL"),
> +	PINCTRL_PIN(123, "I2C1_SDA"),
> +	PINCTRL_PIN(124, "I2C1_SCL"),
> +	PINCTRL_PIN(125, "UART2_RXD"),
> +	PINCTRL_PIN(126, "UART2_TXD"),
> +	PINCTRL_PIN(127, "UART2_RTSB"),
> +	PINCTRL_PIN(128, "UART2_CTSB"),
> +	/* GPP_S */
> +	PINCTRL_PIN(129, "SNDW1_CLK"),
> +	PINCTRL_PIN(130, "SNDW1_DATA"),
> +	PINCTRL_PIN(131, "SNDW2_CLK"),
> +	PINCTRL_PIN(132, "SNDW2_DATA"),
> +	PINCTRL_PIN(133, "SNDW3_CLK"),
> +	PINCTRL_PIN(134, "SNDW3_DATA"),
> +	PINCTRL_PIN(135, "SNDW4_CLK"),
> +	PINCTRL_PIN(136, "SNDW4_DATA"),
> +	/* GPP_G */
> +	PINCTRL_PIN(137, "DDPA_CTRLCLK"),
> +	PINCTRL_PIN(138, "DDPA_CTRLDATA"),
> +	PINCTRL_PIN(139, "DNX_FORCE_RELOAD"),
> +	PINCTRL_PIN(140, "GMII_MDC_0"),
> +	PINCTRL_PIN(141, "GMII_MDIO_0"),
> +	PINCTRL_PIN(142, "SLP_DRAMB"),
> +	PINCTRL_PIN(143, "GPPC_G_6"),
> +	PINCTRL_PIN(144, "GPPC_G_7"),
> +	PINCTRL_PIN(145, "ISH_SPI_CSB"),
> +	PINCTRL_PIN(146, "ISH_SPI_CLK"),
> +	PINCTRL_PIN(147, "ISH_SPI_MISO"),
> +	PINCTRL_PIN(148, "ISH_SPI_MOSI"),
> +	PINCTRL_PIN(149, "DDP1_CTRLCLK"),
> +	PINCTRL_PIN(150, "DDP1_CTRLDATA"),
> +	PINCTRL_PIN(151, "DDP2_CTRLCLK"),
> +	PINCTRL_PIN(152, "DDP2_CTRLDATA"),
> +	PINCTRL_PIN(153, "GSPI2_CLK_LOOPBK"),
> +	/* vGPIO */
> +	PINCTRL_PIN(154, "CNV_BTEN"),
> +	PINCTRL_PIN(155, "CNV_BT_HOST_WAKEB"),
> +	PINCTRL_PIN(156, "CNV_BT_IF_SELECT"),
> +	PINCTRL_PIN(157, "vCNV_BT_UART_TXD"),
> +	PINCTRL_PIN(158, "vCNV_BT_UART_RXD"),
> +	PINCTRL_PIN(159, "vCNV_BT_UART_CTS_B"),
> +	PINCTRL_PIN(160, "vCNV_BT_UART_RTS_B"),
> +	PINCTRL_PIN(161, "vCNV_MFUART1_TXD"),
> +	PINCTRL_PIN(162, "vCNV_MFUART1_RXD"),
> +	PINCTRL_PIN(163, "vCNV_MFUART1_CTS_B"),
> +	PINCTRL_PIN(164, "vCNV_MFUART1_RTS_B"),
> +	PINCTRL_PIN(165, "vUART0_TXD"),
> +	PINCTRL_PIN(166, "vUART0_RXD"),
> +	PINCTRL_PIN(167, "vUART0_CTS_B"),
> +	PINCTRL_PIN(168, "vUART0_RTS_B"),
> +	PINCTRL_PIN(169, "vISH_UART0_TXD"),
> +	PINCTRL_PIN(170, "vISH_UART0_RXD"),
> +	PINCTRL_PIN(171, "vISH_UART0_CTS_B"),
> +	PINCTRL_PIN(172, "vISH_UART0_RTS_B"),
> +	PINCTRL_PIN(173, "vCNV_BT_I2S_BCLK"),
> +	PINCTRL_PIN(174, "vCNV_BT_I2S_WS_SYNC"),
> +	PINCTRL_PIN(175, "vCNV_BT_I2S_SDO"),
> +	PINCTRL_PIN(176, "vCNV_BT_I2S_SDI"),
> +	PINCTRL_PIN(177, "vI2S2_SCLK"),
> +	PINCTRL_PIN(178, "vI2S2_SFRM"),
> +	PINCTRL_PIN(179, "vI2S2_TXD"),
> +	PINCTRL_PIN(180, "vI2S2_RXD"),
> +	/* GPP_E */
> +	PINCTRL_PIN(181, "SATAXPCIE_0"),
> +	PINCTRL_PIN(182, "SATAXPCIE_1"),
> +	PINCTRL_PIN(183, "SATAXPCIE_2"),
> +	PINCTRL_PIN(184, "CPU_GP_0"),
> +	PINCTRL_PIN(185, "SATA_DEVSLP_0"),
> +	PINCTRL_PIN(186, "SATA_DEVSLP_1"),
> +	PINCTRL_PIN(187, "SATA_DEVSLP_2"),
> +	PINCTRL_PIN(188, "CPU_GP_1"),
> +	PINCTRL_PIN(189, "SATA_LEDB"),
> +	PINCTRL_PIN(190, "USB2_OCB_0"),
> +	PINCTRL_PIN(191, "USB2_OCB_1"),
> +	PINCTRL_PIN(192, "USB2_OCB_2"),
> +	PINCTRL_PIN(193, "USB2_OCB_3"),
> +	/* GPP_F */
> +	PINCTRL_PIN(194, "SATAXPCIE_3"),
> +	PINCTRL_PIN(195, "SATAXPCIE_4"),
> +	PINCTRL_PIN(196, "SATAXPCIE_5"),
> +	PINCTRL_PIN(197, "SATAXPCIE_6"),
> +	PINCTRL_PIN(198, "SATAXPCIE_7"),
> +	PINCTRL_PIN(199, "SATA_DEVSLP_3"),
> +	PINCTRL_PIN(200, "SATA_DEVSLP_4"),
> +	PINCTRL_PIN(201, "SATA_DEVSLP_5"),
> +	PINCTRL_PIN(202, "SATA_DEVSLP_6"),
> +	PINCTRL_PIN(203, "SATA_DEVSLP_7"),
> +	PINCTRL_PIN(204, "SATA_SCLOCK"),
> +	PINCTRL_PIN(205, "SATA_SLOAD"),
> +	PINCTRL_PIN(206, "SATA_SDATAOUT1"),
> +	PINCTRL_PIN(207, "SATA_SDATAOUT0"),
> +	PINCTRL_PIN(208, "PS_ONB"),
> +	PINCTRL_PIN(209, "M2_SKT2_CFG_0"),
> +	PINCTRL_PIN(210, "M2_SKT2_CFG_1"),
> +	PINCTRL_PIN(211, "M2_SKT2_CFG_2"),
> +	PINCTRL_PIN(212, "M2_SKT2_CFG_3"),
> +	PINCTRL_PIN(213, "L_VDDEN"),
> +	PINCTRL_PIN(214, "L_BKLTEN"),
> +	PINCTRL_PIN(215, "L_BKLTCTL"),
> +	PINCTRL_PIN(216, "VNN_CTRL"),
> +	PINCTRL_PIN(217, "GPP_F_23"),
> +	/* GPP_H */
> +	PINCTRL_PIN(218, "SRCCLKREQB_6"),
> +	PINCTRL_PIN(219, "SRCCLKREQB_7"),
> +	PINCTRL_PIN(220, "SRCCLKREQB_8"),
> +	PINCTRL_PIN(221, "SRCCLKREQB_9"),
> +	PINCTRL_PIN(222, "SRCCLKREQB_10"),
> +	PINCTRL_PIN(223, "SRCCLKREQB_11"),
> +	PINCTRL_PIN(224, "SRCCLKREQB_12"),
> +	PINCTRL_PIN(225, "SRCCLKREQB_13"),
> +	PINCTRL_PIN(226, "SRCCLKREQB_14"),
> +	PINCTRL_PIN(227, "SRCCLKREQB_15"),
> +	PINCTRL_PIN(228, "SML2CLK"),
> +	PINCTRL_PIN(229, "SML2DATA"),
> +	PINCTRL_PIN(230, "SML2ALERTB"),
> +	PINCTRL_PIN(231, "SML3CLK"),
> +	PINCTRL_PIN(232, "SML3DATA"),
> +	PINCTRL_PIN(233, "SML3ALERTB"),
> +	PINCTRL_PIN(234, "SML4CLK"),
> +	PINCTRL_PIN(235, "SML4DATA"),
> +	PINCTRL_PIN(236, "SML4ALERTB"),
> +	PINCTRL_PIN(237, "ISH_I2C0_SDA"),
> +	PINCTRL_PIN(238, "ISH_I2C0_SCL"),
> +	PINCTRL_PIN(239, "ISH_I2C1_SDA"),
> +	PINCTRL_PIN(240, "ISH_I2C1_SCL"),
> +	PINCTRL_PIN(241, "TIME_SYNC_0"),
> +	/* GPP_J */
> +	PINCTRL_PIN(242, "CNV_PA_BLANKING"),
> +	PINCTRL_PIN(243, "CPU_C10_GATEB"),
> +	PINCTRL_PIN(244, "CNV_BRI_DT"),
> +	PINCTRL_PIN(245, "CNV_BRI_RSP"),
> +	PINCTRL_PIN(246, "CNV_RGI_DT"),
> +	PINCTRL_PIN(247, "CNV_RGI_RSP"),
> +	PINCTRL_PIN(248, "CNV_MFUART2_RXD"),
> +	PINCTRL_PIN(249, "CNV_MFUART2_TXD"),
> +	PINCTRL_PIN(250, "GPP_J_8"),
> +	PINCTRL_PIN(251, "GPP_J_9"),
> +	/* GPP_K */
> +	PINCTRL_PIN(252, "GSXDOUT"),
> +	PINCTRL_PIN(253, "GSXSLOAD"),
> +	PINCTRL_PIN(254, "GSXDIN"),
> +	PINCTRL_PIN(255, "GSXSRESETB"),
> +	PINCTRL_PIN(256, "GSXCLK"),
> +	PINCTRL_PIN(257, "ADR_COMPLETE"),
> +	PINCTRL_PIN(258, "DDSP_HPD_A"),
> +	PINCTRL_PIN(259, "DDSP_HPD_B"),
> +	PINCTRL_PIN(260, "CORE_VID_0"),
> +	PINCTRL_PIN(261, "CORE_VID_1"),
> +	PINCTRL_PIN(262, "DDSP_HPD_C"),
> +	PINCTRL_PIN(263, "GPP_K_11"),
> +	PINCTRL_PIN(264, "SYS_PWROK"),
> +	PINCTRL_PIN(265, "SYS_RESETB"),
> +	PINCTRL_PIN(266, "MLK_RSTB"),
> +	/* GPP_I */
> +	PINCTRL_PIN(267, "PMCALERTB"),
> +	PINCTRL_PIN(268, "DDSP_HPD_1"),
> +	PINCTRL_PIN(269, "DDSP_HPD_2"),
> +	PINCTRL_PIN(270, "DDSP_HPD_3"),
> +	PINCTRL_PIN(271, "DDSP_HPD_4"),
> +	PINCTRL_PIN(272, "DDPB_CTRLCLK"),
> +	PINCTRL_PIN(273, "DDPB_CTRLDATA"),
> +	PINCTRL_PIN(274, "DDPC_CTRLCLK"),
> +	PINCTRL_PIN(275, "DDPC_CTRLDATA"),
> +	PINCTRL_PIN(276, "FUSA_DIAGTEST_EN"),
> +	PINCTRL_PIN(277, "FUSA_DIAGTEST_MODE"),
> +	PINCTRL_PIN(278, "USB2_OCB_4"),
> +	PINCTRL_PIN(279, "USB2_OCB_5"),
> +	PINCTRL_PIN(280, "USB2_OCB_6"),
> +	PINCTRL_PIN(281, "USB2_OCB_7"),
> +	/* JTAG */
> +	PINCTRL_PIN(282, "JTAG_TDO"),
> +	PINCTRL_PIN(283, "JTAGX"),
> +	PINCTRL_PIN(284, "PRDYB"),
> +	PINCTRL_PIN(285, "PREQB"),
> +	PINCTRL_PIN(286, "JTAG_TDI"),
> +	PINCTRL_PIN(287, "JTAG_TMS"),
> +	PINCTRL_PIN(288, "JTAG_TCK"),
> +	PINCTRL_PIN(289, "DBG_PMODE"),
> +	PINCTRL_PIN(290, "CPU_TRSTB"),
> +};
> +
> +static const struct intel_padgroup tglh_community0_gpps[] = {
> +	TGL_GPP(0, 0, 24, 0),				/* GPP_A */
> +	TGL_GPP(1, 25, 44, 128),			/* GPP_R */
> +	TGL_GPP(2, 45, 70, 32),				/* GPP_B */
> +	TGL_GPP(3, 71, 78, INTEL_GPIO_BASE_NOMAP),	/* vGPIO_0 */
> +};
> +
> +static const struct intel_padgroup tglh_community1_gpps[] = {
> +	TGL_GPP(0, 79, 104, 96),			/* GPP_D */
> +	TGL_GPP(1, 105, 128, 64),			/* GPP_C */
> +	TGL_GPP(2, 129, 136, 160),			/* GPP_S */
> +	TGL_GPP(3, 137, 153, 192),			/* GPP_G */
> +	TGL_GPP(4, 154, 180, 224),			/* vGPIO */
> +};
> +
> +static const struct intel_padgroup tglh_community3_gpps[] = {
> +	TGL_GPP(0, 181, 193, 256),			/* GPP_E */
> +	TGL_GPP(1, 194, 217, 288),			/* GPP_F */
> +};
> +
> +static const struct intel_padgroup tglh_community4_gpps[] = {
> +	TGL_GPP(0, 218, 241, 320),			/* GPP_H */
> +	TGL_GPP(1, 242, 251, 384),			/* GPP_J */
> +	TGL_GPP(2, 252, 266, 352),			/* GPP_K */
> +};
> +
> +static const struct intel_padgroup tglh_community5_gpps[] = {
> +	TGL_GPP(0, 267, 281, 416),			/* GPP_I */
> +	TGL_GPP(1, 282, 290, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
> +};
> +
> +static const struct intel_community tglh_communities[] = {
> +	TGL_COMMUNITY(0, 0, 78, tglh_community0_gpps),
> +	TGL_COMMUNITY(1, 79, 180, tglh_community1_gpps),
> +	TGL_COMMUNITY(2, 181, 217, tglh_community3_gpps),
> +	TGL_COMMUNITY(3, 218, 266, tglh_community4_gpps),
> +	TGL_COMMUNITY(4, 267, 290, tglh_community5_gpps),
> +};
> +
> +static const struct intel_pinctrl_soc_data tglh_soc_data = {
> +	.pins = tglh_pins,
> +	.npins = ARRAY_SIZE(tglh_pins),
> +	.communities = tglh_communities,
> +	.ncommunities = ARRAY_SIZE(tglh_communities),
> +};
> +
>  static const struct acpi_device_id tgl_pinctrl_acpi_match[] = {
>  	{ "INT34C5", (kernel_ulong_t)&tgllp_soc_data },
> +	{ "INT34C6", (kernel_ulong_t)&tglh_soc_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, tgl_pinctrl_acpi_match);
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


