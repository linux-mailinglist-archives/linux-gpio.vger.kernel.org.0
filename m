Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC1134EC5A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 17:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhC3P1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 11:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbhC3P1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 11:27:11 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A74C061574
        for <linux-gpio@vger.kernel.org>; Tue, 30 Mar 2021 08:27:06 -0700 (PDT)
Received: from terra.local.svanheule.net (47.118-244-81.adsl-dyn.isp.belgacom.be [81.244.118.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 6BCC81E7DD1;
        Tue, 30 Mar 2021 17:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1617118024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3ACTtDwLrd6MhIlUOxZYT4FyKfrTiQy/cUhDCuM0ixc=;
        b=nPv7Ax2plVIYUVUntMblYQZiJSg0v471Mohhw4UZALHK5lm8ZzHpBgWLGqujYwA2b5mG4i
        BAd5MnLCM8IYb31aqv+6qthnMaXVvfiXUWkcRVi8L0a21ikNzs9MmOL+0gYQejUU7wuSYv
        AhvFVCRWsBKsHjtZVN82y+dLtTj5wQEDBW2aBiHvUxfYe+DoK76+la/2tiFVUd1HYNnCAR
        +6213IF1JPHeHkwplj2eGNIAZwj4uUCt1QLjJpy0z8Wf9GylS0yCgeF7icg8IpbvoFqoFV
        YdKsmUy/MEEUdzhjhJxiHUA6aS/fr7Fe0KOIW1PzXHpBkH4twTqAxplyhxDcHQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     andy.shevchenko@gmail.com, bert@biot.com,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v5 0/2] Add Realtek Otto GPIO support
Date:   Tue, 30 Mar 2021 17:26:50 +0200
Message-Id: <cover.1617117762.git.sander@svanheule.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315082339.9787-1-sander@svanheule.net>
References: <20210315082339.9787-1-sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO controller employed by Realtek in multiple series of
MIPS SoCs. These include the supported RTL838x and RTL839x. The register layout
also matches the one found in the GPIO controller of other (Lexra-based) SoCs
such as RTL8196E, RTL8197D, and RTL8197F.

For the platform name 'otto', I am not aware of any official resources as to
what hardware this specifically applies to. However, in all of the GPL archives
we've received, from vendors using compatible SoCs in their design, the
platform under the MIPS architecture is referred to by this name.

The GPIO ports have been tested on a Zyxel GS1900-8 (RTL8380), and Zyxel
GS1900-48 (RTL8393). Furthermore, the GPIO ports and interrupt controller have
been tested on a Netgear GS110TPPv1 (RTL8381).

Changes in v5:
- Edited code comments
- Fold functions that were used only once or twice (ISR/IMR accessors)
- Drop trivial functions for line to port/pin calculations
- Use gpio_irq_chip->init_hw() to initialise IRQ registers
- Invert GPIO_INTERRUPTS flag to GPIO_INTERRUPTS_DISABLED
- Support building as module
- Add Rob's Reviewed-by tag

Changes in v4:
- Fix pointer notation style
- Drop unused read_u16_reg() function
- Drop 'inline' specifier from functions

Changes in v3:
- Remove OF dependencies in driver probe
- Don't accept IRQ_TYPE_NONE as a valid interrupt type
- Remove (now unused) dev property from control structure
- Use u8/u16 port registers, instead of raw u32 registers
- Use 'line' name for gpiochip, 'port' and 'pin' names for hardware
- Renamed DT bindings file
- Dropped fallback-only DT compatible
- Various code style clean-ups

Changes in v2:
- Clarify structure and usage of IMR registers
- Added Linus' Reviewed-by tags

Sander Vanheule (2):
  dt-bindings: gpio: Binding for Realtek Otto GPIO
  gpio: Add Realtek Otto GPIO support

 .../bindings/gpio/realtek,otto-gpio.yaml      |  78 +++++
 drivers/gpio/Kconfig                          |  13 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-realtek-otto.c              | 326 ++++++++++++++++++
 4 files changed, 418 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
 create mode 100644 drivers/gpio/gpio-realtek-otto.c

-- 
2.30.2

