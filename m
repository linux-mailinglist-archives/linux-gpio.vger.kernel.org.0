Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D516EAFF
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2019 21:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfGSTY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jul 2019 15:24:57 -0400
Received: from atlmailgw1.ami.com ([63.147.10.40]:55176 "EHLO
        atlmailgw1.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfGSTY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jul 2019 15:24:57 -0400
X-AuditID: ac1060b2-3fdff70000003a7d-7b-5d3219097179
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id 67.7C.14973.909123D5; Fri, 19 Jul 2019 15:24:58 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 19 Jul 2019 15:24:55 -0400
From:   Hongwei Zhang <hongweiz@ami.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>,
        <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [v5 0/2] gpio: aspeed: Add SGPIO driver
Date:   Fri, 19 Jul 2019 15:24:49 -0400
Message-ID: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRiBhgi6XpFGswZOljBa7LnNYfJl7isVi
        /pFzrBa/z/9ltpjyZzmTxabH11gtmlefY7bYPP8Po8XlXXPYLJZev8hk0br3CLsDt8fV9l3s
        HmvmrWH0eH+jld3j4sdjzB6bVnWyedy5tofNY/OSeo/zMxYyenzeJBfAGcVlk5Kak1mWWqRv
        l8CV0fkxpuAMa0Xr+pNMDYwHWLoYOTgkBEwk+trDuxi5OIQEdjFJnHpwlhHCOcwosWvCFeYu
        Rk4ONgE1ib2b5zCB2CICeRKH179lBSliFjjFJDFjXycrSEJYwEDi0Ps/bCA2i4CqxO/Pj8Ea
        eAXsJe7emMACYksIyEncPNfJDBEXlDg58wlYnFlAQuLgixdgcSEBWYlbhyB6JQQUJJ73PWaZ
        wMg3C0nLLCQtCxiZVjEKJZbk5CZm5qSXG+ol5mbqJefnbmKEhPimHYwtF80PMTJxMB5ilOBg
        VhLhvf1SP1aINyWxsiq1KD++qDQntfgQozQHi5I478o132KEBNITS1KzU1MLUotgskwcnFIN
        jHkvNq50Ny+Ir13+SiJP8kO21Vu36ZnR/yLLSp9Ps6r6P3Hx4i0GB15bl58qEt3atPGDnbLE
        pGWnnwg4p5/VP6No4mw6K31HYfELPTPfn38W1Z5r2Ss5s7fv1t87UYWfD4a5LpssruQn1Dz/
        fAz/x9Q3Muu/Pj6gt0TzvtIS2RM3WxexTPq59K0SS3FGoqEWc1FxIgACgC/sXwIAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This short series introduce dt-binding document and a driver for the 
Aspeed AST2500 SGPIO controller. Please review.

The related SGPM pinmux dt-binding document, dts, and pinctrl driver
updates have been accepted and merged:
_http://patchwork.ozlabs.org/patch/1110210/

Hongwei Zhang (2):
  dt-bindings: gpio: aspeed: Add SGPIO support
  gpio: aspeed: Add SGPIO driver

 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |  55 +++
 drivers/gpio/sgpio-aspeed.c                        | 522 +++++++++++++++++++++
 2 files changed, 577 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 drivers/gpio/sgpio-aspeed.c

-- 
2.7.4

