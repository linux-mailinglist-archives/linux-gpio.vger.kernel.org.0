Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AC032DE66
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 01:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhCEAjQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 19:39:16 -0500
Received: from lucky1.263xmail.com ([211.157.147.130]:51568 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhCEAjP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 19:39:15 -0500
Received: from localhost (unknown [192.168.167.224])
        by lucky1.263xmail.com (Postfix) with ESMTP id C0F55D0616;
        Fri,  5 Mar 2021 08:39:10 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26158T139991629948672S1614904748986290_;
        Fri, 05 Mar 2021 08:39:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <adc5252af9cc13c74d0ac0f323da289b>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de, catalin.marinas@arm.com,
        will@kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 0/2] make rockchip pinctrl module able
Date:   Fri,  5 Mar 2021 08:39:05 +0800
Message-Id: <20210305003907.1692515-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make the rockchip pinctrl driver able to be module by unselect
PINCTRL_ROCKCHIP from ARCH_ROCKCHIP, then modify driver module define.

Jianqun Xu (2):
  arm64: remove select PINCTRL_ROCKCHIP from ARCH_ROCKCHIP
  pinctrl: rockchip: make driver be tristate module

 arch/arm64/Kconfig.platforms       |  2 --
 drivers/pinctrl/Kconfig            |  6 +++++-
 drivers/pinctrl/pinctrl-rockchip.c | 13 +++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.25.1



