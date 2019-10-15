Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCF78D71F2
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 11:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfJOJRQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 05:17:16 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:51486 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfJOJRP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 05:17:15 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 0D7906A009;
        Tue, 15 Oct 2019 17:17:12 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31702T139879414421248S1571131030242699_;
        Tue, 15 Oct 2019 17:17:12 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c99d8c2a32cf4f8dc3eadc48a50b2f78>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        heiko@sntech.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: rockchip: add rk3308 SoC support
Date:   Tue, 15 Oct 2019 17:17:07 +0800
Message-Id: <20191015091708.7934-2-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015091708.7934-1-jay.xu@rock-chips.com>
References: <20191015091708.7934-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add rk3308 SoC support to rockchip pinctrl.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
changes since v2:
- Add Acked-by: Rob Herring <robh@kernel.org>

changes since v1:
- Add Reviewed-by: Heiko Stuebner <heiko@sntech.de>

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index 0919db294c17..2113cfaa26e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -29,6 +29,7 @@ Required properties for iomux controller:
 		"rockchip,rk3188-pinctrl":  for Rockchip RK3188
 		"rockchip,rk3228-pinctrl":  for Rockchip RK3228
 		"rockchip,rk3288-pinctrl":  for Rockchip RK3288
+		"rockchip,rk3308-pinctrl":  for Rockchip RK3308
 		"rockchip,rk3328-pinctrl":  for Rockchip RK3328
 		"rockchip,rk3368-pinctrl":  for Rockchip RK3368
 		"rockchip,rk3399-pinctrl":  for Rockchip RK3399
-- 
2.17.1



