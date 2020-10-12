Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658E028ACAC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 06:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgJLEDD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 00:03:03 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:61026 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgJLEDC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 00:03:02 -0400
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 09C3U8Nd087657
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 11:30:08 +0800 (GMT-8)
        (envelope-from billy_tsai@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 09C3TpBf087375;
        Mon, 12 Oct 2020 11:29:51 +0800 (GMT-8)
        (envelope-from billy_tsai@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Oct
 2020 11:32:00 +0800
From:   Billy Tsai <billy_tsai@aspeedtech.com>
To:     <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <openbmc@lists.ozlabs.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [V2 PATCH 0/3] Fix the memory layout and add sgpio node for aspeed g6
Date:   Mon, 12 Oct 2020 11:31:47 +0800
Message-ID: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09C3TpBf087375
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series is used to add sgpiom and sgpios nodes and add pinctrl 
setting for sgpiom1

v2:
  - Split the change of dts and pinctrl to two commit.
  - Add the compatible string for aspeed,ast2600-sgpiom. 
    aspeed,ast2600-sgpios will implement in the future.

Billy Tsai (3):
  Arm: dts: aspeed-g6: Fix the register range of gpio
  Arm: dts: aspeed-g6: Add sgpio node
  pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting

 .../devicetree/bindings/gpio/sgpio-aspeed.txt |  8 +--
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi      |  5 ++
 arch/arm/boot/dts/aspeed-g6.dtsi              | 54 ++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 30 +++++++++--
 4 files changed, 89 insertions(+), 8 deletions(-)

-- 
2.17.1

