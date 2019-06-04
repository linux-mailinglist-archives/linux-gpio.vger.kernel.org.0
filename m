Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 962FC3524F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 23:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfFDVxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 17:53:36 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:58767 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfFDVxg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 17:53:36 -0400
X-AuditID: ac10606f-bbfff70000003de9-9b-5cf6e85fb469
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 2A.12.15849.F58E6FC5; Tue,  4 Jun 2019 17:53:35 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 4 Jun 2019 17:53:35 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Hongwei Zhang <hongweiz@ami.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3 linux dev-5.1 v2] ARM: dts: aspeed: Add SGPM pinmux
Date:   Tue, 4 Jun 2019 17:53:32 -0400
Message-ID: <1559685212-15857-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMLMWRmVeSWpSXmKPExsWyRiBhgm78i28xBtuOmlnsusxhMf/IOVaL
        3+f/MltM+bOcyWLT42usFs2rzzFbbJ7/h9Hi8q45bBZLr19ksmjde4Tdgcvjavsudo8189Yw
        elz8eIzZY9OqTjaPO9f2sHlsXlLvcX7GQkaPz5vkAjiiuGxSUnMyy1KL9O0SuDK+HJzGXrBU
        pOLGm2fMDYz7BbsYOTgkBEwk2ldmdjFycggJ7GKSuDpPqouRC8g+xCjxd9ULJpAEm4CaxN7N
        c5hAEiICOxglOue3sYI4zAJnGSU2PNzLDFIlLOAusfnjA0YQm0VARaJpwyI2EJtXwEGifecM
        sBoJATmJm+c6mSHighInZz5hAbGZBSQkDr54wQxxhqzErUOPmSDqFSSe9z1mmcDINwtJyywk
        LQsYmVYxCiWW5OQmZuaklxvpJeZm6iXn525ihAR0/g7Gjx/NDzEycTACvcTBrCTCm3j7S4wQ
        b0piZVVqUX58UWlOavEhRmkOFiVx3lVrvsUICaQnlqRmp6YWpBbBZJk4OKUaGFmuC7473/RG
        p23hviWB7gezwvuk102f8PmA3gqzF9umZluYTr/S8l28QH5l95w9JuvibYwZ9LfLzkx5eqZG
        63z/tHutkoLuyeZXyzyqXi/qUPRiPjmxLUhps72pbeHu3nNXFFp6Hk8QPn339kONji0192c8
        2yQaUWvn48MYKHywZemsek5rWSWW4oxEQy3mouJEACilowFWAgAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add SGPM pinmux to ast2500-pinctrl function and group, to prepare for
supporting SGPIO in AST2500 SoC.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
index 3b7266c..8f1c5c4 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
@@ -84,7 +84,7 @@ NDCD2 NDCD3 NDCD4 NDSR1 NDSR2 NDSR3 NDSR4 NDTR1 NDTR2 NDTR3 NDTR4 NRI1 NRI2
 NRI3 NRI4 NRTS1 NRTS2 NRTS3 NRTS4 OSCCLK PEWAKE PNOR PWM0 PWM1 PWM2 PWM3 PWM4
 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 RXD1 RXD2 RXD3 RXD4 SALT1 SALT10
 SALT11 SALT12 SALT13 SALT14 SALT2 SALT3 SALT4 SALT5 SALT6 SALT7 SALT8 SALT9
-SCL1 SCL2 SD1 SD2 SDA1 SDA2 SGPS1 SGPS2 SIOONCTRL SIOPBI SIOPBO SIOPWREQ
+SCL1 SCL2 SD1 SD2 SDA1 SDA2 SGPM SGPS1 SGPS2 SIOONCTRL SIOPBI SIOPBO SIOPWREQ
 SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1CS1 SPI1DEBUG SPI1PASSTHRU SPI2CK SPI2CS0
 SPI2CS1 SPI2MISO SPI2MOSI TIMER3 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2
 TXD3 TXD4 UART6 USB11BHID USB2AD USB2AH USB2BD USB2BH USBCKI VGABIOSROM VGAHS
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 187abd7..0c89647 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -577,6 +577,8 @@ SS_PIN_DECL(N3, GPIOJ2, SGPMO);
 SIG_EXPR_LIST_DECL_SINGLE(SGPMI, SGPM, SIG_DESC_SET(SCU84, 11));
 SS_PIN_DECL(N4, GPIOJ3, SGPMI);
 
+FUNC_GROUP_DECL(SGPM, R2, L2, N3, N4);
+
 #define N5 76
 SIG_EXPR_LIST_DECL_SINGLE(VGAHS, VGAHS, SIG_DESC_SET(SCU84, 12));
 SIG_EXPR_LIST_DECL_SINGLE(DASHN5, DASHN5, SIG_DESC_SET(SCU94, 8));
@@ -2127,6 +2129,7 @@ static const struct aspeed_pin_group aspeed_g5_groups[] = {
 	ASPEED_PINCTRL_GROUP(SD2),
 	ASPEED_PINCTRL_GROUP(SDA1),
 	ASPEED_PINCTRL_GROUP(SDA2),
+	ASPEED_PINCTRL_GROUP(SGPM),
 	ASPEED_PINCTRL_GROUP(SGPS1),
 	ASPEED_PINCTRL_GROUP(SGPS2),
 	ASPEED_PINCTRL_GROUP(SIOONCTRL),
@@ -2296,6 +2299,7 @@ static const struct aspeed_pin_function aspeed_g5_functions[] = {
 	ASPEED_PINCTRL_FUNC(SD2),
 	ASPEED_PINCTRL_FUNC(SDA1),
 	ASPEED_PINCTRL_FUNC(SDA2),
+	ASPEED_PINCTRL_FUNC(SGPM),
 	ASPEED_PINCTRL_FUNC(SGPS1),
 	ASPEED_PINCTRL_FUNC(SGPS2),
 	ASPEED_PINCTRL_FUNC(SIOONCTRL),
-- 
2.7.4

