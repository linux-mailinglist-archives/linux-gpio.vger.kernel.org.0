Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9085214132B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 22:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbgAQVdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 16:33:44 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46923 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726587AbgAQVdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jan 2020 16:33:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 769D25FF;
        Fri, 17 Jan 2020 16:33:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 17 Jan 2020 16:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=SdKZFOHmIi4bNTeW6qOOV5SAlt
        jiwbYypCEPg9/G1Ok=; b=kni8y1/KswKEsd50YOqBrchNHB/lFc7Mf72oMhCplM
        9FBU6DSdmpAOAVYrS+CBf6AH+ZFw6/9qTGmco9Zz1ygbD0jLVq7hH0hJ/0hymCwq
        t4MWw8Rtgdf3p6htEvca0w05UBvtZyXEjW71y53zlM8GBEqrUPX0W8Teudqz/dNU
        HKH/eEpia78OxBs13ZQuznoM8iJqo33i8/MbsuHOz+Q4D+vNa1Zhk7FMsETfWGJv
        vUtf9NqZkrW/7ucVep1/v2kEllu0f4wHQFyjf6Y3QR7ehqv+UHIYRO6Y7tg9Iqn2
        6l1HUO82Dbq8/La+Dgu3Qq3GDRjxIQsXo3QSrGrHHoTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SdKZFOHmIi4bNTeW6
        qOOV5SAltjiwbYypCEPg9/G1Ok=; b=uP5IsFwcxSDoIIrk7Ps3dTCImUsP3l/xx
        GqMnEBbOMsw20QWASJqp425AStjNtZnqH0lDs49eNyn1K92+8YPm/H5sLy9Wn7n9
        lRSRh0Xu9Pn8ukfmj/Kd8Aa4kg52mN2ik9zvsNvJ4Iv8EEJ6jUaq61zI8CjKj/oK
        mzn3+aN4+wAEwKDcedgI3sXll6LTDw5x7ngNF4AtW48CpeyPzRDLPu1grVHNP8Mr
        yVC5ZWmi1xQYmqjTCmrUloWZVryjXT8oujKL26h8Xi/FKp6br5LucZ+n/NtqQvD1
        AStBwudtZMnQSBpxZnwmlhQRxXfN9qJiOEMQHDky7mi9cosJUAzfA==
X-ME-Sender: <xms:NSgiXv2nzkYfp6TI2mq6-4IMy2JeuJt7tlV5800rV8f6GVyIiLHGxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdekgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
    drudefhedrudegkedrudehudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghl
    sehshhholhhlrghnugdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:NSgiXr4AxUIzI8Gs_eOGX9qMswveztffU1Gl_acOG49z60IlolFGVw>
    <xmx:NSgiXiODqgYlZwo06AooX5np6DrWytsem5jw2fZxWvI9SG59yM7nsw>
    <xmx:NSgiXoBnYt59qBynLG87jpaiv_u7Lp61Lu5NKv_40r3ma7fimviXUw>
    <xmx:NigiXv9sX4AC5qVwLFRgbA86OL4fYwLlrKMmeNE0E-dKOqfYRRBvjA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id EE9E48005C;
        Fri, 17 Jan 2020 16:33:40 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/2] pinctrl: sunxi: Forward calls to irq_set_irq_wake
Date:   Fri, 17 Jan 2020 15:33:39 -0600
Message-Id: <20200117213340.47714-1-samuel@sholland.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pinctrl irqchip may be connected to an irqchip that implements the
.irq_set_wake callback, such as the R_INTC on A31 and newer sunxi SoCs.
In order for GPIOs to be able to trigger wakeup, the IRQ from the
pinctrl to the upper irqchip must also be enabled for wakeup. Since the
kernel's IRQ core already manages the "wake_depth" of each IRQ, no
additional accounting is needed in the pinctrl driver.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0cbca30b75dc..df79da76321e 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
 #include <linux/irqdomain.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/export.h>
@@ -1058,6 +1059,14 @@ static void sunxi_pinctrl_irq_ack_unmask(struct irq_data *d)
 	sunxi_pinctrl_irq_unmask(d);
 }
 
+static int sunxi_pinctrl_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
+	u8 bank = d->hwirq / IRQ_PER_BANK;
+
+	return irq_set_irq_wake(pctl->irq[bank], on);
+}
+
 static struct irq_chip sunxi_pinctrl_edge_irq_chip = {
 	.name		= "sunxi_pio_edge",
 	.irq_ack	= sunxi_pinctrl_irq_ack,
@@ -1066,7 +1075,7 @@ static struct irq_chip sunxi_pinctrl_edge_irq_chip = {
 	.irq_request_resources = sunxi_pinctrl_irq_request_resources,
 	.irq_release_resources = sunxi_pinctrl_irq_release_resources,
 	.irq_set_type	= sunxi_pinctrl_irq_set_type,
-	.flags		= IRQCHIP_SKIP_SET_WAKE,
+	.irq_set_wake	= sunxi_pinctrl_irq_set_wake,
 };
 
 static struct irq_chip sunxi_pinctrl_level_irq_chip = {
@@ -1081,7 +1090,8 @@ static struct irq_chip sunxi_pinctrl_level_irq_chip = {
 	.irq_request_resources = sunxi_pinctrl_irq_request_resources,
 	.irq_release_resources = sunxi_pinctrl_irq_release_resources,
 	.irq_set_type	= sunxi_pinctrl_irq_set_type,
-	.flags		= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_EOI_THREADED |
+	.irq_set_wake	= sunxi_pinctrl_irq_set_wake,
+	.flags		= IRQCHIP_EOI_THREADED |
 			  IRQCHIP_EOI_IF_HANDLED,
 };
 
-- 
2.23.0

