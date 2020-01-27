Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9267214A997
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2020 19:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgA0SPv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jan 2020 13:15:51 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:48445 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgA0SPu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jan 2020 13:15:50 -0500
Received: from localhost.localdomain ([37.4.249.152]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MIdS1-1iqMAq2lZF-00EeIy; Mon, 27 Jan 2020 19:15:41 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [RFC PATCH 4/4] ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels
Date:   Mon, 27 Jan 2020 19:15:08 +0100
Message-Id: <1580148908-4863-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Gxba3mqtzEfAZsLaIh9BPR5KGgNDsOM8n/SyTdefyB0S+Ix6nQ6
 3ZLcgMmQ0ZYCLRjSx9LHkgciD9ISLplz152G/qC58KgorZhlZLhVE974IeKAkTW7W6RIHig
 h04Lium+H3BT4cdz+bIAKz1RoTVdqSRp3Bov22Fv5E4IbNQGvAgEx4Sh7aDH+pVGti//bPm
 sxDDXE5ZOXGV0qV3mvozA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cCaO9H+V7fw=:e54AxDo4xa1RNP7BrlXkUw
 hcxiAvXNAIgIOvr2ULYOCL0TL9NzkdUBAFNQCWXg+9tQt4S1g6hU8gHkciuR6wa+2Cp8Xx5tX
 +llHcigXOC2W2A3/H9CyAonFLfN2LtqKP65pY2L50CbaZwjnsBqXhx204sIbiRowV9mxvafPo
 t2qbrWIi7u6FIMFVrCPP6wE54WKajQz0y/dLzyYY97zKFvnWCVnVi+wqat0odNyoSPsqVn0bZ
 IosK/ArAU/cdn47p/tTAICkZ4LT3Hej8lWbLgs37gDw8DDTbDojBGQNroAepDuL3/RNn+lzON
 kdG+mueLFX0OBuSSfviiSheetOwE1yiesBRvOGGH8SPAdosy99GUDu9JWlb+5Nu0T59IQTm7O
 Fjvqcu1fiL9L6Qw24XdH9osD6cr2kE4395AH6pP7KLf3KbZClN203u6SfTB9Xw5mAK1mLTOJO
 8C2OC1qX/NFSNffy6qM68jxJ+dRjhB2kyFtiquL5w85hQ9A+0UHh47pQP+vii1XlpE/xYDuRX
 VqTiy7fJn8xtcDs0VAoOVnelun1+ppzMdObQpGWaheuA29O4gvaKjA55oKwCw1zzpVOzHmLAg
 FhqvMZv3NiqUlLpj85vqbQT9r4U6POpxLorzLyvoarWOy7nvAyVdepSLB7BhbJWwrIbzeiFNd
 2mNR6PTfFZbsMkXdj67sk75MnEgUMjxerASnkhv0xHqQXo/rbdc2HX7fC/1Ft04B1HJextbil
 GrPQ6dSPe5SCpjQP6yd9yhLNoaLeNEHpY5Ds0M1hULtqYkJiubORBMvp9H1mmjV7o5UCHqlOW
 S9QPe97AN6cfCJGvjb5uYcfneUnc1K0Bj8mmXat9B6fHaxA7pDEsAS1Cy0OgtFjH/t37B1P
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the labels for all the SoC GPIOs on the Raspberry Pi 4.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 74 +++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 1b5a835..6607e2e 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -71,6 +71,80 @@
 	};
 };
 
+&gpio {
+	/*
+	 * Parts taken from rpi_SCH_4b_4p0_reduced.pdf and
+	 * the official GPU firmware DT blob.
+	 *
+	 * Legend:
+	 * "NC" = not connected (no rail from the SoC)
+	 * "FOO" = GPIO line named "FOO" on the schematic
+	 * "FOO_N" = GPIO line named "FOO" on schematic, active low
+	 */
+	gpio-line-names = "ID_SDA",
+			  "ID_SCL",
+			  "SDA1",
+			  "SCL1",
+			  "GPIO_GCLK",
+			  "GPIO5",
+			  "GPIO6",
+			  "SPI_CE1_N",
+			  "SPI_CE0_N",
+			  "SPI_MISO",
+			  "SPI_MOSI",
+			  "SPI_SCLK",
+			  "GPIO12",
+			  "GPIO13",
+			  /* Serial port */
+			  "TXD1",
+			  "RXD1",
+			  "GPIO16",
+			  "GPIO17",
+			  "GPIO18",
+			  "GPIO19",
+			  "GPIO20",
+			  "GPIO21",
+			  "GPIO22",
+			  "GPIO23",
+			  "GPIO24",
+			  "GPIO25",
+			  "GPIO26",
+			  "GPIO27",
+			  "RGMII_MDIO",
+			  "RGMIO_MDC",
+			  /* Used by BT module */
+			  "CTS0",
+			  "RTS0",
+			  "TXD0",
+			  "RXD0",
+			  /* Used by Wifi */
+			  "SD1_CLK",
+			  "SD1_CMD",
+			  "SD1_DATA0",
+			  "SD1_DATA1",
+			  "SD1_DATA2",
+			  "SD1_DATA3",
+			  /* Shared with SPI flash */
+			  "PWM0_MISO",
+			  "PWM1_MOSI",
+			  "STATUS_LED_G_CLK",
+			  "SPIFLASH_CE_N",
+			  "SDA0",
+			  "SCL0",
+			  "RGMII_RXCLK",
+			  "RGMII_RXCTL",
+			  "RGMII_RXD0",
+			  "RGMII_RXD1",
+			  "RGMII_RXD2",
+			  "RGMII_RXD3",
+			  "RGMII_TXCLK",
+			  "RGMII_TXCTL",
+			  "RGMII_TXD0",
+			  "RGMII_TXD1",
+			  "RGMII_TXD2",
+			  "RGMII_TXD3";
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm1_0_gpio40 &pwm1_1_gpio41>;
-- 
2.7.4

