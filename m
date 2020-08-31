Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35442575C1
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 10:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgHaIsE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 04:48:04 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:58258 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgHaIsC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 04:48:02 -0400
Received: from localhost (unknown [192.168.167.32])
        by lucky1.263xmail.com (Postfix) with ESMTP id 6F5E4A263E;
        Mon, 31 Aug 2020 16:47:58 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P11834T140500763920128S1598863675343235_;
        Mon, 31 Aug 2020 16:47:58 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3892b05da8124e78724d07755bc66f37>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 4/6] pinctrl: rockchip: do not set gpio if bank invalid
Date:   Mon, 31 Aug 2020 16:47:51 +0800
Message-Id: <20200831084753.7115-5-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831084753.7115-1-jay.xu@rock-chips.com>
References: <20200831084753.7115-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add valid check for gpio bank.

Change-Id: Ib03e2910a7316bd61df18236151e371c4d04077a
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 265d64b8c4f5..6080573155f6 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2687,6 +2687,9 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return rc;
 			break;
 		case PIN_CONFIG_OUTPUT:
+			if (!bank->valid)
+				return -ENOTSUPP;
+
 			rockchip_gpio_set(&bank->gpio_chip,
 					  pin - bank->pin_base, arg);
 			rc = _rockchip_pmx_gpio_set_direction(&bank->gpio_chip,
@@ -2752,6 +2755,9 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		arg = 1;
 		break;
 	case PIN_CONFIG_OUTPUT:
+		if (!bank->valid)
+			return -ENOTSUPP;
+
 		rc = rockchip_get_mux(bank, pin - bank->pin_base);
 		if (rc != RK_FUNC_GPIO)
 			return -EINVAL;
-- 
2.17.1



