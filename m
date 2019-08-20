Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A202296B14
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 23:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbfHTVFe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 17:05:34 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:52819 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHTVFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 17:05:34 -0400
X-AuditID: ac10606f-d27ff70000003324-96-5d5c609dc94e
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 07.00.13092.D906C5D5; Tue, 20 Aug 2019 17:05:33 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 20 Aug 2019 17:05:31 -0400
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
Subject: [v8]  gpio: aspeed: Add SGPIO driver
Date:   Tue, 20 Aug 2019 17:05:27 -0400
Message-ID: <1566335128-31498-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWyRiBhgu7chJhYgzevJC12Xeaw+DL3FIvF
        /CPnWC1+n//LbDHlz3Imi02Pr7FaNK8+x2yxef4fRovLu+awWSy9fpHJonXvEXYHbo+r7bvY
        PdbMW8Po8f5GK7vHxY/HmD02repk87hzbQ+bx+Yl9R7nZyxk9Pi8SS6AM4rLJiU1J7MstUjf
        LoErY83Hp4wFH9kr/nTPYW1g7GLrYuTkkBAwkWjZ9JW9i5GLQ0hgF5NE895dzBDOYUaJtbP3
        MYFUsQmoSezdPAfMFhHIkzi8/i0rSBGzwCkmiRn7OllBEsICuhJzT99gBrFZBFQlvi7ZwwJi
        8wo4SMzrX8QOsU5O4ua5TmaIuKDEyZlPwGqYBSQkDr54ARYXEpCVuHXoMRNEvYLE877HLBMY
        +WYhaZmFpGUBI9MqRqHEkpzcxMyc9HIjvcTcTL3k/NxNjJAwz9/B+PGj+SFGJg7GQ4wSHMxK
        IrwVc6JihXhTEiurUovy44tKc1KLDzFKc7AoifOuWvMtRkggPbEkNTs1tSC1CCbLxMEp1cB4
        42BnLHv5g70MSy2WzQ4v/H3l96nHfpd3JGdMVjmR6rzsmNCVH7x/LzGkfrlsez5T5pTaVsM/
        bX/LbOoM7XZ+vMr2vv/as6yvh5WFC7sNJQyVGN/5bP/DfchekfnKp2PnXI88S1mV9Fv9Z8PX
        Pv+rOTcDpjlHR4lPytwtzVG+zaXtLn+c47owJZbijERDLeai4kQARbmDwmECAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This short series introduce dt-binding document and a driver for the 
Aspeed AST2500 SGPIO controller. Please review.

[v8]:   Changes between v7 and v8:
        - v7 updates based on Linus' feedback 
        - since Linus has already merged sgpio-aspeed.txt, I only include
	  the driver here to avoid confusion.

[v7]:   Changes between v6 and v7:
        - fix missing variable 'reg' assign issue in aspeed_sgpio_set()
        - v6 feedback updates

[v6]:   Changes between v5 and v6:
        - fix a bug in aspeed_sgpio_dir_out()
        - v5 feedback updates, some comments cleanup

The related SGPM pinmux dt-binding document, dts, and pinctrl driver
updates have been accepted and merged:
_http://patchwork.ozlabs.org/patch/1110210/

Hongwei Zhang (1):
  gpio: aspeed: Add SGPIO driver

 drivers/gpio/sgpio-aspeed.c | 533 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 533 insertions(+)
 create mode 100644 drivers/gpio/sgpio-aspeed.c

-- 
2.7.4

