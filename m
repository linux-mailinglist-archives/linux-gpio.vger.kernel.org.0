Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 758C1D71ED
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 11:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbfJOJRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 05:17:15 -0400
Received: from lucky1.263xmail.com ([211.157.147.135]:52474 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfJOJRP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 05:17:15 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 9C86645E09;
        Tue, 15 Oct 2019 17:17:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31702T139879414421248S1571131030242699_;
        Tue, 15 Oct 2019 17:17:11 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6f4ff25618f2263670538bb75275f38c>
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
Subject: [PATCH v3 0/2] pinctrl: rockchip: support rk3308 SoC
Date:   Tue, 15 Oct 2019 17:17:06 +0800
Message-Id: <20191015091708.7934-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for rk3308 SoC from rockchip.

Jianqun Xu (2):
  dt-bindings: pinctrl: rockchip: add rk3308 SoC support
  pinctrl: rockchip: add rk3308 SoC support

 .../bindings/pinctrl/rockchip,pinctrl.txt     |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 382 +++++++++++++++++-
 2 files changed, 382 insertions(+), 1 deletion(-)

-- 
changes since v2:
- Add Acked-by: Rob Herring <robh@kernel.org>

changes since v1:
- Add type case for pull get/set
- Add Reviewed-by: Heiko Stuebner <heiko@sntech.de>


2.17.1



