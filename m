Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D39343E32
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 11:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhCVKnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 06:43:35 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:53772 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCVKnU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 06:43:20 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 76176F3377;
        Mon, 22 Mar 2021 18:43:14 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P24306T139685293258496S1616409792243826_;
        Mon, 22 Mar 2021 18:43:14 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <bf31d402894e306b7286649179f7c0be>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     huangtao@rock-chips.com, kever.yang@rock-chips.com,
        linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 2/3] pinctrl/pinctrl-rockchip.h: add pinctrl device to gpio bank struct
Date:   Mon, 22 Mar 2021 18:43:09 +0800
Message-Id: <20210322104310.863029-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322104310.863029-1-jay.xu@rock-chips.com>
References: <20210322104310.863029-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Store a pointer from the pinctrl device for the gpio bank.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 69e4639214b5..0a816e256ae6 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -80,6 +80,7 @@ struct rockchip_drv {
 
 /**
  * struct rockchip_pin_bank
+ * @dev: the pinctrl device bind to the bank
  * @reg_base: register base of the gpio bank
  * @regmap_pull: optional separate register for additional pull settings
  * @clk: clock of the gpio bank
@@ -104,6 +105,7 @@ struct rockchip_drv {
  * @route_mask: bits describing the routing pins of per bank
  */
 struct rockchip_pin_bank {
+	struct device			*dev;
 	void __iomem			*reg_base;
 	struct regmap			*regmap_pull;
 	struct clk			*clk;
-- 
2.25.1



