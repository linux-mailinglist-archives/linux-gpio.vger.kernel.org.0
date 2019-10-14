Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA73D5905
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 02:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbfJNAZc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Oct 2019 20:25:32 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:58006 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbfJNAZb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Oct 2019 20:25:31 -0400
Received: from localhost (unknown [192.168.167.231])
        by lucky1.263xmail.com (Postfix) with ESMTP id 5A06972204;
        Mon, 14 Oct 2019 08:25:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P27735T140015220799232S1571012724759633_;
        Mon, 14 Oct 2019 08:25:26 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a4a69567aa61d2612998615e528684d3>
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
Subject: [PATCH v2 0/2] pinctrl: rockchip: support rk3308 SoC
Date:   Mon, 14 Oct 2019 08:25:21 +0800
Message-Id: <20191014002523.4540-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191012061528.27821-1-jay.xu@rock-chips.com>
References: <20191012061528.27821-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for rk3308 SoC from rockchip.

Jianqun Xu (2):
  dt-bindings: pinctrl: rockchip: add rk3308 SoC support
  pinctrl: rockchip: add rk3308 SoC support

 .../bindings/pinctrl/rockchip,pinctrl.txt     |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 377 ++++++++++++++++++
 2 files changed, 378 insertions(+)

--
changes since v1:
- add Reviewed-by: Heiko Stuebner <heiko@sntech.de>, thanks Heiko

2.17.1



