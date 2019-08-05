Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF2A816AA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfHEKQS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:16:18 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40533 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEKQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:16:18 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3EE512000B;
        Mon,  5 Aug 2019 10:16:15 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Konstantin Porotchkin <kostap@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/3] pinctrl: mvebu: Add CP110 missing pin functionality
Date:   Mon,  5 Aug 2019 12:16:05 +0200
Message-Id: <20190805101607.29811-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805101607.29811-1-miquel.raynal@bootlin.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Konstantin Porotchkin <kostap@marvell.com>

Add missing definition for function 0xe on CP-110 MPP-62.
The pin function is Data Strobe for SDIO interface.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
index 584952b2ba47..85ade9761885 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
@@ -597,7 +597,8 @@ static struct mvebu_mpp_mode armada_cp110_mpp_modes[] = {
 		 MPP_FUNCTION(7,	"uart0",	"rxd"),
 		 MPP_FUNCTION(8,	"uart2",	"rxd"),
 		 MPP_FUNCTION(9,	"sata0",	"present_act"),
-		 MPP_FUNCTION(10,	"ge",		"mdc")),
+		 MPP_FUNCTION(10,	"ge",		"mdc"),
+		 MPP_FUNCTION(14,	"sdio",		"ds")),
 };
 
 static const struct of_device_id armada_cp110_pinctrl_of_match[] = {
-- 
2.20.1

