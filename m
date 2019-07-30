Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48ADF7AC3E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 17:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732277AbfG3PZG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 11:25:06 -0400
Received: from atlmailgw2.ami.com ([63.147.10.42]:60948 "EHLO
        atlmailgw2.ami.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729202AbfG3PZG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 11:25:06 -0400
X-AuditID: ac10606f-d27ff70000003324-fb-5d406151cc24
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com [172.16.96.144])
        (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id 24.AC.13092.151604D5; Tue, 30 Jul 2019 11:25:05 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 30 Jul 2019 11:25:04 -0400
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
Subject: [v6 0/2] gpio: aspeed: Add SGPIO driver
Date:   Tue, 30 Jul 2019 11:24:26 -0400
Message-ID: <1564500268-2627-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWyRiBhgm5gokOswdedEha7LnNYfJl7isVi
        /pFzrBa/z/9ltpjyZzmTxabH11gtmlefY7bYPP8Po8XlXXPYLJZev8hk0br3CLsDt8fV9l3s
        HmvmrWH0eH+jld3j4sdjzB6bVnWyedy5tofNY/OSeo/zMxYyenzeJBfAGcVlk5Kak1mWWqRv
        l8CV8ez7aZaCk2wVN6+5NDAuZO1i5OSQEDCReN9/nR3EFhLYxSTRssyni5ELyD7MKNGx+CwL
        SIJNQE1i7+Y5TCC2iECexOH1b1lBipgFTjFJzNjXCTZJWMBA4vOa72wgNouAqkTzw8tgNq+A
        vcSp6TOZIbbJSdw818kMEReUODnzCdgCZgEJiYMvXjBDXCErcevQYyaIegWJ532PWSYw8s1C
        0jILScsCRqZVjEKJJTm5iZk56eVGeom5mXrJ+bmbGCEhnr+D8eNH80OMTByMhxglOJiVRHgX
        i9vHCvGmJFZWpRblxxeV5qQWH2KU5mBREuddteZbjJBAemJJanZqakFqEUyWiYNTqoGRU6+k
        SrhkctiU/MjKL0dzmDYIv9uZKR8lfV7QefHnJ0Y7fwtZzuT4V+c26f4z3qXvjcUv3xdcyNwu
        4VzCmh+b/5lDve3elgMbJ8h5SC2z3HZr7ZILvOynL5zSOMKa9r3VZ2cP87RdGw/mbzgadO6m
        SRJLdeedhQv2/1V6enna9E/SHzxqn7BJK7EUZyQaajEXFScCAI781llfAgAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This short series introduce dt-binding document and a driver for the 
Aspeed AST2500 SGPIO controller. Please review.

[v6]:	Changes between v5 and v6:
	- fix a bug in aspeed_sgpio_dir_out()
	- v5 feedback updates, some comments cleanup

The related SGPM pinmux dt-binding document, dts, and pinctrl driver
updates have been accepted and merged:
_http://patchwork.ozlabs.org/patch/1110210/


Hongwei Zhang (2):
  dt-bindings: gpio: aspeed: Add SGPIO support
  gpio: aspeed: Add SGPIO driver

 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |  55 +++
 drivers/gpio/sgpio-aspeed.c                        | 521 +++++++++++++++++++++
 2 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 drivers/gpio/sgpio-aspeed.c

-- 
2.7.4

