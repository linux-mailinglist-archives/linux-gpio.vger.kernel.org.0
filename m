Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405A643347F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 13:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235406AbhJSLSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 07:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbhJSLSn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 07:18:43 -0400
Received: from chandra.tablix.org (chandra.tablix.org [IPv6:2a00:ee2:100:3a01::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0488C06161C
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 04:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tablix.org;
         s=alpha; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=AcmiMBamHqAhge7WKPErkwXIKrwgjCmuQXlnjGH70k0=; b=qhKaJHeW530GgNctosu7Gz7RmM
        MdSPeaPesAiaDVPDUOFb3MrJvukJ0pvpfN7IHUGtLH0Wr3XEI0aab6KOzbYtd9EnG7ZDM2TSMTVJg
        Rfmz4QBi2grS61lKMxw/qbm8E6zxXgTR2gP92DGGBwH9fhSGQPXtd9zcFEV+Fsy2+XLLlh2U0cLjM
        KruypWOfQgoZZYUz1KHSaWPbTEcOIParzGucLcXMyjju0a0CNT/cf/hLyzn8osfVKqIbF/hOkEkKV
        mS08DYjhH95dv29aH+T02Z3DcgIaZh6EFaQrE1ROK7ziSytRxt5EbKQyE1+kxsbIV9fdSwT3ep2Mt
        m1pbidsw==;
Received: from [2a01:261:355:1d00:9067:d686:f385:2acf] (helo=muffin.lan)
        by chandra.tablix.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tomaz.solc@tablix.org>)
        id 1mcmlE-0004jq-4R; Tue, 19 Oct 2021 12:54:24 +0200
From:   Tomaz Solc <tomaz.solc@tablix.org>
To:     linux-gpio@vger.kernel.org
Cc:     Tomaz Solc <tomaz.solc@tablix.org>
Subject: [PATCH 2/2] pinctrl: mcp23s08: support for PIN_CONFIG_OUTPUT.
Date:   Tue, 19 Oct 2021 12:52:50 +0200
Message-Id: <20211019105250.9405-3-tomaz.solc@tablix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019105250.9405-1-tomaz.solc@tablix.org>
References: <20211019105250.9405-1-tomaz.solc@tablix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds support for setting mcp23s08 pins to output-high or output-low via pinmux
in the device tree.

Signed-off-by: Tomaz Solc <tomaz.solc@tablix.org>
---
 .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 12 ++--
 drivers/pinctrl/pinctrl-mcp23s08.c            | 58 ++++++++++++++-----
 2 files changed, 49 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 2fa5edac7a35..483ac9f719a1 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -88,11 +88,11 @@ gpiom1: gpio@0 {
         spi-max-frequency = <1000000>;
 };
 
-Pull-up configuration
-=====================
+Pin configuration
+=================
 
-If pins are used as output, they can also be configured with pull-ups. This is
-done with pinctrl.
+If pins are used as inputs, they can also be configured with pull-ups. Pins
+used as outputs can have their default states set. This is done with pinctrl.
 
 Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
 for details of the common pinctrl bindings used by client devices,
@@ -121,8 +121,10 @@ The following optional property is defined in the pinmux DT binding document
 <pinctrl-bindings.txt>. Absence of this property will leave the configuration
 in its default state.
 	bias-pull-up
+	output-high
+	output-low
 
-Example with pinctrl to pull-up output pins:
+Example with pinctrl to pull-up input pins:
 gpio21: gpio@21 {
 	compatible = "microchip,mcp23017";
 	gpio-controller;
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 764c93dfd277..81fc7fcef8ec 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -159,6 +159,26 @@ static int mcp_set_bit(struct mcp23s08 *mcp, unsigned int reg,
 	return mcp_set_mask(mcp, reg, mask, enabled);
 }
 
+static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, bool value)
+{
+	return mcp_set_mask(mcp, MCP_OLAT, mask, value);
+}
+
+static int mcp_direction_output(struct mcp23s08 *mcp, unsigned offset,
+		int value)
+{
+	unsigned mask = BIT(offset);
+	int status;
+
+	mutex_lock(&mcp->lock);
+	status = __mcp23s08_set(mcp, mask, value);
+	if (status == 0) {
+		status = mcp_set_mask(mcp, MCP_IODIR, mask, false);
+	}
+	mutex_unlock(&mcp->lock);
+	return status;
+}
+
 static const struct pinctrl_pin_desc mcp23x08_pins[] = {
 	PINCTRL_PIN(0, "gpio0"),
 	PINCTRL_PIN(1, "gpio1"),
@@ -225,6 +245,7 @@ static int mcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	unsigned int data, status;
 	int ret;
+	u16 arg;
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_UP:
@@ -232,12 +253,28 @@ static int mcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		if (ret < 0)
 			return ret;
 		status = (data & BIT(pin)) ? 1 : 0;
+		arg = 1;
+		break;
+	case PIN_CONFIG_OUTPUT:
+		ret = mcp_read(mcp, MCP_IODIR, &data);
+		if (ret < 0) {
+			return ret;
+		}
+
+		status = (data & BIT(pin)) ? 0 : 1;
+
+		ret = mcp_read(mcp, MCP_OLAT, &data);
+		if (ret < 0) {
+			return ret;
+		}
+
+		arg = (data & BIT(pin)) ? 1 : 0;
 		break;
 	default:
 		return -ENOTSUPP;
 	}
 
-	*config = 0;
+	*config = pinconf_to_config_packed(param, arg);
 
 	return status ? 0 : -EINVAL;
 }
@@ -259,6 +296,9 @@ static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_BIAS_PULL_UP:
 			ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
 			break;
+		case PIN_CONFIG_OUTPUT:
+			ret = mcp_direction_output(mcp, pin, arg);
+			break;
 		default:
 			dev_dbg(mcp->dev, "Invalid config param %04x\n", param);
 			return -ENOTSUPP;
@@ -308,11 +348,6 @@ static int mcp23s08_get(struct gpio_chip *chip, unsigned offset)
 	return status;
 }
 
-static int __mcp23s08_set(struct mcp23s08 *mcp, unsigned mask, bool value)
-{
-	return mcp_set_mask(mcp, MCP_OLAT, mask, value);
-}
-
 static void mcp23s08_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
@@ -327,16 +362,7 @@ static int
 mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
-	unsigned mask = BIT(offset);
-	int status;
-
-	mutex_lock(&mcp->lock);
-	status = __mcp23s08_set(mcp, mask, value);
-	if (status == 0) {
-		status = mcp_set_mask(mcp, MCP_IODIR, mask, false);
-	}
-	mutex_unlock(&mcp->lock);
-	return status;
+	return mcp_direction_output(mcp, offset, value);
 }
 
 static int
-- 
2.20.1

