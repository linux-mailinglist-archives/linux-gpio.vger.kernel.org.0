Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061FA15645F
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Feb 2020 14:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgBHNDg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Feb 2020 08:03:36 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:51007 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBHNDf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Feb 2020 08:03:35 -0500
Received: from localhost.localdomain ([37.4.249.150]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mk1BG-1jORvL3bXk-00kOXK; Sat, 08 Feb 2020 14:03:20 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 4/4] ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels
Date:   Sat,  8 Feb 2020 14:02:55 +0100
Message-Id: <1581166975-22949-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Uf6ddeH+Q5wU3A4iBHbQL6kw6jhHXupWbDnedDbnjV6Sm0OvoL+
 0aiJDtkaX9pxbPkeBOuQ4JmMWw+XD7KZ+F9sU+5aHuZy/6fLbFudCprCJMvvJnOtiIJ3jr1
 B+7BL9xVHLGsFROXiW9Wgi09sxB0wh34pzksdAQ5hvcm5AvKiM6t8b0dPd+vOjkjeVl+PHy
 W7Rl7txfWj9h4O4xX6r8w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L6KhevTF5eo=:kVi0/hnHVHoDdWEm8JG5c0
 Whuq8qda1JXLC+G8nGXZ0o2IeeNV0wpBLvxYUbfUAh44CRunuZK3v12klyoBZ9dJCpxy70Ul7
 41EMdotulajfRWzLx+j6ZCwCEbgMIU6h5C28XzmsC9PMPs/z4kOu8m75gC1Y+lgdk4x3umLyp
 L2SVF3lPNukgvVUkaWhSR90Obf8pKKhJ2sH7awlWJOodxEaotOlApZW1eB1jpqw0rKgbgIG2E
 BBnC16WnCNdydLgJp1UzokVFUpfW72K8fwdj/SFFuhcWkzGxludPEDZP7y8g+gUhWEebp5OaB
 /69pIBlKi4z8izFZ52Y4uG5ZVGD6JrqNqwJu1RO5xMkJ577S3n9BorpNKnGfCeSuuxRW96pSr
 /cCsVIF0E79Rk2g80Q3sYdaYzyAKElDrR6fSBIPrEDAhMXdyhNu3xMrt5GXGVYdrNisg7WzBB
 qTIpRWxduGLpQvE37HOs88QP6At6sNGaIDS1mCpmSIaskusgw64djCS7h6OwrJh3pmkw1UdpA
 PavqlbmlEhm+j9N3lkG3PS8iKnfC6VOrpQ5V66a+/urmqLuUlJc9VFWeLNXjZeIqWbmaGHHvY
 HYby8QaW+oIPhaxUXDaMVYLpvN4IBqXL+5RvnCu/OnBR6T0Gn+DuDONHIR2HhJjWREIvAUF8I
 /+Nvo3VCQZSg2ErAb53uAP0+x3Q5u5XaAbGIpr55Ko6WqQqZW7dft59cXqElK6iL4eFEP4kB5
 HbLPEGKLbOZRbabRcgrvnUxLkX2/NSUsuUMW+rcWLtvxzRbSFDfsXTDDvpewjJJ83p/DdQx0t
 YUeC4OM5/bf+3g5l4A8wprQrNyXylHtrxfar4+5h7VDbfIzUorTk5wroQy3I8fOz+2+nfpE
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the labels for all the SoC GPIOs on the Raspberry Pi 4.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 73 +++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 1b5a835..cb33852 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -71,6 +71,79 @@
 	};
 };
 
+&gpio {
+	/*
+	 * Parts taken from rpi_SCH_4b_4p0_reduced.pdf and
+	 * the official GPU firmware DT blob.
+	 *
+	 * Legend:
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

