Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA024433480
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 13:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235239AbhJSLSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 07:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbhJSLSp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 07:18:45 -0400
Received: from chandra.tablix.org (chandra.tablix.org [IPv6:2a00:ee2:100:3a01::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4896C06161C
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 04:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tablix.org;
         s=alpha; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=kniGFXrvN/Mfmadpnrd8zGz4BwdtxzL1m+6xnFAowCM=; b=kzsQnJP9aG8OaCTZGJisIkk986
        LYXM9HoL/K1UTJAxaVqvnnb6r+Nr6MR07IP21gi6YFaz4JVWwu1pUgjwXVeab2H9yKpfmqNrjZOaw
        xI39w0X1osyJS3VnOHHBKQ6tDtXEM5JJyqslP4tlsWe0tfjLb++Tikjpa92nShtmySes2k94MFWSP
        UQz5lHweOOcW7TCYcx9ubFRQOFxWuGDxceCrZqUFslgleGx7TTZGvi2IK+NK3FxmC0kitTc3SbEYG
        YRgK6rodCSaP14XadheyD5/jKpPGjzHCTTtMK1xR6AJ0FHABuxcGJJNCrJcSbGr/WGnGfgvketj9B
        VS0H2hIw==;
Received: from [2a01:261:355:1d00:9067:d686:f385:2acf] (helo=muffin.lan)
        by chandra.tablix.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tomaz.solc@tablix.org>)
        id 1mcml5-0004jq-J6; Tue, 19 Oct 2021 12:54:15 +0200
From:   Tomaz Solc <tomaz.solc@tablix.org>
To:     linux-gpio@vger.kernel.org
Cc:     Tomaz Solc <tomaz.solc@tablix.org>
Subject: [PATCH 1/2] pinctrl: mcp23s08: implement get_direction()
Date:   Tue, 19 Oct 2021 12:52:49 +0200
Message-Id: <20211019105250.9405-2-tomaz.solc@tablix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019105250.9405-1-tomaz.solc@tablix.org>
References: <20211019105250.9405-1-tomaz.solc@tablix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Tomaz Solc <tomaz.solc@tablix.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index bccebe43dd6a..764c93dfd277 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -339,6 +339,29 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 	return status;
 }
 
+static int
+mcp23s08_get_direction(struct gpio_chip *chip, unsigned offset)
+{
+	struct mcp23s08	*mcp = gpiochip_get_data(chip);
+	unsigned mask = BIT(offset);
+	int status, ret;
+
+	mutex_lock(&mcp->lock);
+
+	ret = mcp_read(mcp, MCP_IODIR, &status);
+	if (ret == 0) {
+		if(status & mask) {
+			ret = GPIO_LINE_DIRECTION_IN;
+		} else {
+			ret = GPIO_LINE_DIRECTION_OUT;
+		}
+	}
+
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
 /*----------------------------------------------------------------------*/
 static irqreturn_t mcp23s08_irq(int irq, void *data)
 {
@@ -545,6 +568,7 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->irq_chip.irq_bus_lock = mcp23s08_irq_bus_lock;
 	mcp->irq_chip.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock;
 
+	mcp->chip.get_direction = mcp23s08_get_direction;
 	mcp->chip.direction_input = mcp23s08_direction_input;
 	mcp->chip.get = mcp23s08_get;
 	mcp->chip.direction_output = mcp23s08_direction_output;
-- 
2.20.1

