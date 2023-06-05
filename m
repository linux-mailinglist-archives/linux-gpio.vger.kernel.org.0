Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55519722CF4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 18:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234915AbjFEQuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 12:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234799AbjFEQty (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 12:49:54 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135D7EE;
        Mon,  5 Jun 2023 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685983787; x=1717519787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FGFHy13HA+ucouUijEWPZrMvJlpnJwATUFEKhuF4GUg=;
  b=T9Km0tSSt65pSA8p9soUxrpux6lleWNhrW21QdOkXqdhBFkotGpaFjqF
   C34WKJIrQ1HJOCz7w0Qs0OwCjCC29zNABqKtrJqEmu7E4CIW9ph4suFBG
   CKbfiko5whPv/hcgmM205x8v522GI+NGdBTrHD6M35uQ96yzv4mC1CzI2
   V9Vq00bdQZXA4PPPmfQIyTfJ9LSMSdyGUzf1f2o1AanQ+JAMsHap2zZBK
   cQdKbBocnwzZLGzKytNfMR7xtto9bSRcs3J2yYxdEn+OQeqMMLOpshZ29
   woIPYl/csfdbEW1Vc/I6FE/prsYb13FjPgRC/RriRJEFPw/HU1X65x75N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384725396"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="384725396"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 09:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821259400"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="821259400"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2023 09:49:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3EABB2A6; Mon,  5 Jun 2023 19:49:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Add Intel Meteor Lake-S pin controller support
Date:   Mon,  5 Jun 2023 19:49:43 +0300
Message-Id: <20230605164943.3641-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver adds pinctrl/GPIO support for Intel Meteor Lake-S.
The GPIO controller is based on the next generation GPIO hardware
but still compatible with the one supported by the Intel pinctrl
and GPIO core driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-meteorlake.c | 212 ++++++++++++++++++++-
 1 file changed, 206 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
index 56296eee11c4..f2604b59bbd0 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorlake.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -20,6 +20,12 @@
 #define MTL_P_GPI_IS		0x200
 #define MTL_P_GPI_IE		0x210
 
+#define MTL_S_PAD_OWN		0x0b0
+#define MTL_S_PADCFGLOCK	0x0f0
+#define MTL_S_HOSTSW_OWN	0x110
+#define MTL_S_GPI_IS		0x200
+#define MTL_S_GPI_IE		0x210
+
 #define MTL_GPP(r, s, e, g)				\
 	{						\
 		.reg_num = (r),				\
@@ -28,9 +34,12 @@
 		.gpio_base = (g),			\
 	}
 
-#define MTL_COMMUNITY(b, s, e, g)			\
+#define MTL_P_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, MTL_P)
 
+#define MTL_S_COMMUNITY(b, s, e, g)			\
+	INTEL_COMMUNITY_GPPS(b, s, e, g, MTL_S)
+
 /* Meteor Lake-P */
 static const struct pinctrl_pin_desc mtlp_pins[] = {
 	/* CPU */
@@ -369,11 +378,11 @@ static const struct intel_padgroup mtlp_community5_gpps[] = {
 };
 
 static const struct intel_community mtlp_communities[] = {
-	MTL_COMMUNITY(0, 0, 52, mtlp_community0_gpps),
-	MTL_COMMUNITY(1, 53, 102, mtlp_community1_gpps),
-	MTL_COMMUNITY(2, 103, 183, mtlp_community3_gpps),
-	MTL_COMMUNITY(3, 184, 203, mtlp_community4_gpps),
-	MTL_COMMUNITY(4, 204, 288, mtlp_community5_gpps),
+	MTL_P_COMMUNITY(0, 0, 52, mtlp_community0_gpps),
+	MTL_P_COMMUNITY(1, 53, 102, mtlp_community1_gpps),
+	MTL_P_COMMUNITY(2, 103, 183, mtlp_community3_gpps),
+	MTL_P_COMMUNITY(3, 184, 203, mtlp_community4_gpps),
+	MTL_P_COMMUNITY(4, 204, 288, mtlp_community5_gpps),
 };
 
 static const struct intel_pinctrl_soc_data mtlp_soc_data = {
@@ -383,8 +392,199 @@ static const struct intel_pinctrl_soc_data mtlp_soc_data = {
 	.ncommunities = ARRAY_SIZE(mtlp_communities),
 };
 
+/* Meteor Lake-S */
+static const struct pinctrl_pin_desc mtls_pins[] = {
+	/* GPP_A */
+	PINCTRL_PIN(0, "DIR_ESPI_IO_0"),
+	PINCTRL_PIN(1, "DIR_ESPI_IO_1"),
+	PINCTRL_PIN(2, "DIR_ESPI_IO_2"),
+	PINCTRL_PIN(3, "DIR_ESPI_IO_3"),
+	PINCTRL_PIN(4, "DIR_ESPI_CS0_B"),
+	PINCTRL_PIN(5, "DIR_ESPI_CLK"),
+	PINCTRL_PIN(6, "DIR_ESPI_RCLK"),
+	PINCTRL_PIN(7, "DIR_ESPI_RESET_B"),
+	PINCTRL_PIN(8, "SLP_S0_B"),
+	PINCTRL_PIN(9, "DMI_PERSTB"),
+	PINCTRL_PIN(10, "CATERR_B"),
+	PINCTRL_PIN(11, "THERMTRIP_B"),
+	PINCTRL_PIN(12, "CPU_C10_GATE_B"),
+	PINCTRL_PIN(13, "PS_ONB"),
+	PINCTRL_PIN(14, "GPP_SA_14"),
+	PINCTRL_PIN(15, "GPP_SA_15"),
+	PINCTRL_PIN(16, "GPP_SA_16"),
+	PINCTRL_PIN(17, "GPP_SA_17"),
+	PINCTRL_PIN(18, "GPP_SA_18"),
+	PINCTRL_PIN(19, "GPP_SA_19"),
+	PINCTRL_PIN(20, "GPP_SA_20"),
+	PINCTRL_PIN(21, "GPP_SA_21"),
+	PINCTRL_PIN(22, "FUSA_DIAGTEST_EN"),
+	PINCTRL_PIN(23, "FUSA_DIAGTEST_MODE"),
+	PINCTRL_PIN(24, "RTCCLKIN"),
+	PINCTRL_PIN(25, "RESET_SYNC_B"),
+	PINCTRL_PIN(26, "PCH_PWROK"),
+	PINCTRL_PIN(27, "DIR_ESPI_CLK_LOOPBACK"),
+	/* vGPIO_0 */
+	PINCTRL_PIN(28, "LPC_ME_FTPM_ENABLE"),
+	PINCTRL_PIN(29, "LPC_DTFUS_CORE_SPITPM_DIS"),
+	PINCTRL_PIN(30, "LPC_SPI_STRAP_TOS"),
+	PINCTRL_PIN(31, "ITSS_KU1_SHTDWN"),
+	PINCTRL_PIN(32, "LPC_PRR_TS_OVR"),
+	PINCTRL_PIN(33, "ESPI_PMC_EC_SCI"),
+	PINCTRL_PIN(34, "ESPI_PMC_EC_SCI1"),
+	PINCTRL_PIN(35, "vGPIO_SPARE0"),
+	PINCTRL_PIN(36, "vGPIO_SPARE1"),
+	PINCTRL_PIN(37, "vGPIO_SPARE2"),
+	PINCTRL_PIN(38, "vGPIO_SPARE3"),
+	PINCTRL_PIN(39, "vGPIO_SPARE8"),
+	PINCTRL_PIN(40, "vGPIO_SPARE9"),
+	PINCTRL_PIN(41, "vGPIO_SPARE10"),
+	PINCTRL_PIN(42, "vGPIO_SPARE11"),
+	PINCTRL_PIN(43, "vGPIO_SPARE12"),
+	PINCTRL_PIN(44, "vGPIO_SPARE13"),
+	PINCTRL_PIN(45, "vGPIO_SPARE14"),
+	PINCTRL_PIN(46, "vGPIO_SPARE15"),
+	/* GPP_C */
+	PINCTRL_PIN(47, "GPP_SC_0"),
+	PINCTRL_PIN(48, "GPP_SC_1"),
+	PINCTRL_PIN(49, "GPP_SC_2"),
+	PINCTRL_PIN(50, "GPP_SC_3"),
+	PINCTRL_PIN(51, "GPP_SC_4"),
+	PINCTRL_PIN(52, "GPP_SC_5"),
+	PINCTRL_PIN(53, "GPP_SC_6"),
+	PINCTRL_PIN(54, "GPP_SC_7"),
+	PINCTRL_PIN(55, "GPP_SC_8"),
+	PINCTRL_PIN(56, "GPP_SC_9"),
+	PINCTRL_PIN(57, "GPP_SC_10"),
+	PINCTRL_PIN(58, "GPP_SC_11"),
+	PINCTRL_PIN(59, "GPP_SC_12"),
+	PINCTRL_PIN(60, "GPP_SC_13"),
+	PINCTRL_PIN(61, "GPP_SC_14"),
+	PINCTRL_PIN(62, "GPP_SC_15"),
+	PINCTRL_PIN(63, "GPP_SC_16"),
+	PINCTRL_PIN(64, "GPP_SC_17"),
+	PINCTRL_PIN(65, "GPP_SC_18"),
+	PINCTRL_PIN(66, "GPP_SC_19"),
+	PINCTRL_PIN(67, "GPP_SC_20"),
+	PINCTRL_PIN(68, "GPP_SC_21"),
+	PINCTRL_PIN(69, "GPP_SC_22"),
+	PINCTRL_PIN(70, "GPP_SC_23"),
+	PINCTRL_PIN(71, "GPP_SC_24"),
+	PINCTRL_PIN(72, "GPP_SC_25"),
+	PINCTRL_PIN(73, "GPP_SC_26"),
+	/* GPP_B */
+	PINCTRL_PIN(74, "GPP_SB_0"),
+	PINCTRL_PIN(75, "GPP_SB_1"),
+	PINCTRL_PIN(76, "GPP_SB_2"),
+	PINCTRL_PIN(77, "GPP_SB_3"),
+	PINCTRL_PIN(78, "GPP_SB_4"),
+	PINCTRL_PIN(79, "GPP_SB_5"),
+	PINCTRL_PIN(80, "GPP_SB_6"),
+	PINCTRL_PIN(81, "GPP_SB_7"),
+	PINCTRL_PIN(82, "GPP_SB_8"),
+	PINCTRL_PIN(83, "GPP_SB_9"),
+	PINCTRL_PIN(84, "GPP_SB_10"),
+	PINCTRL_PIN(85, "GPP_SB_11"),
+	PINCTRL_PIN(86, "GPP_SB_12"),
+	PINCTRL_PIN(87, "GPP_SB_13"),
+	PINCTRL_PIN(88, "GPP_SB_14"),
+	PINCTRL_PIN(89, "GPP_SB_15"),
+	PINCTRL_PIN(90, "GPP_SB_16"),
+	PINCTRL_PIN(91, "PROCHOT_B"),
+	PINCTRL_PIN(92, "BPKI3C_SDA"),
+	PINCTRL_PIN(93, "BPKI3C_SCL"),
+	/* vGPIO_3 */
+	PINCTRL_PIN(94, "TS0_IN_INT"),
+	PINCTRL_PIN(95, "TS1_IN_INT"),
+	/* GPP_D */
+	PINCTRL_PIN(96, "TIME_SYNC_0"),
+	PINCTRL_PIN(97, "TIME_SYNC_1"),
+	PINCTRL_PIN(98, "DSI_DE_TE_2_GENLOCK_REF"),
+	PINCTRL_PIN(99, "DSI_DE_TE_1_DISP_UTILS"),
+	PINCTRL_PIN(100, "DSI_GENLOCK_2"),
+	PINCTRL_PIN(101, "DSI_GENLOCK_3"),
+	PINCTRL_PIN(102, "SRCCLKREQ2_B"),
+	PINCTRL_PIN(103, "SRCCLKREQ3_B"),
+	PINCTRL_PIN(104, "GPP_SD_8"),
+	PINCTRL_PIN(105, "GPP_SD_9"),
+	PINCTRL_PIN(106, "GPP_SD_10"),
+	PINCTRL_PIN(107, "GPP_SD_11"),
+	PINCTRL_PIN(108, "GPP_SD_12"),
+	PINCTRL_PIN(109, "GPP_SD_13"),
+	PINCTRL_PIN(110, "GPP_SD_14"),
+	PINCTRL_PIN(111, "GPP_SD_15"),
+	PINCTRL_PIN(112, "GPP_SD_16"),
+	PINCTRL_PIN(113, "GPP_SD_17"),
+	PINCTRL_PIN(114, "BOOTHALT_B"),
+	PINCTRL_PIN(115, "GPP_SD_19"),
+	PINCTRL_PIN(116, "GPP_SD_20"),
+	PINCTRL_PIN(117, "AUDCLK"),
+	PINCTRL_PIN(118, "AUDIN"),
+	PINCTRL_PIN(119, "AUDOUT"),
+	/* JTAG_CPU */
+	PINCTRL_PIN(120, "PECI"),
+	PINCTRL_PIN(121, "VIDSOUT"),
+	PINCTRL_PIN(122, "VIDSCK"),
+	PINCTRL_PIN(123, "VIDALERT_B"),
+	PINCTRL_PIN(124, "JTAG_MBPB0"),
+	PINCTRL_PIN(125, "JTAG_MBPB1"),
+	PINCTRL_PIN(126, "JTAG_MBPB2"),
+	PINCTRL_PIN(127, "JTAG_MBPB3"),
+	PINCTRL_PIN(128, "JTAG_TDO"),
+	PINCTRL_PIN(129, "PRDY_B"),
+	PINCTRL_PIN(130, "PREQ_B"),
+	PINCTRL_PIN(131, "JTAG_TDI"),
+	PINCTRL_PIN(132, "JTAG_TMS"),
+	PINCTRL_PIN(133, "JTAG_TCK"),
+	PINCTRL_PIN(134, "DBG_PMODE"),
+	PINCTRL_PIN(135, "JTAG_TRST_B"),
+	/* vGPIO_4 */
+	PINCTRL_PIN(136, "ISCLK_ESPI_XTAL_CLKREQ"),
+	PINCTRL_PIN(137, "ESPI_ISCLK_XTAL_CLKACK"),
+	PINCTRL_PIN(138, "vGPIO_SPARE4"),
+	PINCTRL_PIN(139, "vGPIO_SPARE5"),
+	PINCTRL_PIN(140, "vGPIO_SPARE6"),
+	PINCTRL_PIN(141, "vGPIO_SPARE7"),
+	PINCTRL_PIN(142, "vGPIO_SPARE16"),
+	PINCTRL_PIN(143, "vGPIO_SPARE17"),
+	PINCTRL_PIN(144, "vGPIO_SPARE18"),
+	PINCTRL_PIN(145, "vGPIO_SPARE19"),
+	PINCTRL_PIN(146, "vGPIO_SPARE20"),
+	PINCTRL_PIN(147, "vGPIO_SPARE21"),
+};
+
+static const struct intel_padgroup mtls_community0_gpps[] = {
+	MTL_GPP(0, 0, 27, 0),		/* GPP_A */
+	MTL_GPP(1, 28, 46, 32),		/* vGPIO_0 */
+	MTL_GPP(2, 47, 73, 64),		/* GPP_C */
+};
+
+static const struct intel_padgroup mtls_community1_gpps[] = {
+	MTL_GPP(0, 74, 93, 96),		/* GPP_B */
+	MTL_GPP(1, 94, 95, 128),	/* vGPIO_3 */
+	MTL_GPP(2, 96, 119, 160),	/* GPP_D */
+};
+
+static const struct intel_padgroup mtls_community3_gpps[] = {
+	MTL_GPP(0, 120, 135, 192),	/* JTAG_CPU */
+	MTL_GPP(1, 136, 147, 224),	/* vGPIO_4 */
+};
+
+static const struct intel_community mtls_communities[] = {
+	MTL_S_COMMUNITY(0, 0, 73, mtls_community0_gpps),
+	MTL_S_COMMUNITY(1, 74, 119, mtls_community1_gpps),
+	MTL_S_COMMUNITY(2, 120, 147, mtls_community3_gpps),
+};
+
+static const struct intel_pinctrl_soc_data mtls_soc_data = {
+	.pins = mtls_pins,
+	.npins = ARRAY_SIZE(mtls_pins),
+	.communities = mtls_communities,
+	.ncommunities = ARRAY_SIZE(mtls_communities),
+};
+
 static const struct acpi_device_id mtl_pinctrl_acpi_match[] = {
 	{ "INTC1083", (kernel_ulong_t)&mtlp_soc_data },
+	{ "INTC1082", (kernel_ulong_t)&mtls_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mtl_pinctrl_acpi_match);
-- 
2.40.0.1.gaa8946217a0b

