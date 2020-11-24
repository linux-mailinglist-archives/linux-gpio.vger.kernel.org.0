Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BF52C2431
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 12:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732083AbgKXLb0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 06:31:26 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:8397 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbgKXLb0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 06:31:26 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CgMKM2hG2z6ybj;
        Tue, 24 Nov 2020 19:31:03 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Nov 2020 19:31:13 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] pinctrl: pinctrl-microchip-sgpio: Mark some symbols with static keyword
Date:   Tue, 24 Nov 2020 19:42:53 +0800
Message-ID: <1606218173-3722-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following sparse warnings:

drivers/pinctrl/pinctrl-microchip-sgpio.c:63:31: warning: symbol 'properties_luton' was not declared. Should it be static?
drivers/pinctrl/pinctrl-microchip-sgpio.c:68:31: warning: symbol 'properties_ocelot' was not declared. Should it be static?
drivers/pinctrl/pinctrl-microchip-sgpio.c:73:31: warning: symbol 'properties_sparx5' was not declared. Should it be static?

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index d6c31cc..e182419 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -60,17 +60,17 @@ struct sgpio_properties {
 #define SGPIO_SPARX5_CLK_FREQ    GENMASK(19, 8)
 #define SGPIO_SPARX5_BIT_SOURCE  GENMASK(23, 12)
 
-const struct sgpio_properties properties_luton = {
+static const struct sgpio_properties properties_luton = {
 	.arch   = SGPIO_ARCH_LUTON,
 	.regoff = { 0x00, 0x09, 0x29, 0x2a, 0x2b },
 };
 
-const struct sgpio_properties properties_ocelot = {
+static const struct sgpio_properties properties_ocelot = {
 	.arch   = SGPIO_ARCH_OCELOT,
 	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
 };
 
-const struct sgpio_properties properties_sparx5 = {
+static const struct sgpio_properties properties_sparx5 = {
 	.arch   = SGPIO_ARCH_SPARX5,
 	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
 };
-- 
2.6.2

