Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B43334A6CE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 13:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCZMEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 08:04:37 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:53686 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhCZMEP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 08:04:15 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9f01:cce8:c5ff:8b8d:f8cb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 77EAA1E5E51;
        Fri, 26 Mar 2021 13:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616760247;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EVsmFVeEo1wlLuqCsgNHIjMoIql8i6Dle436XRDTZaE=;
        b=vRIrMGipd8yncEKpB5+KGmKkXgxgtYl2Aj6NzdMff5AjFI+UtrCJK7IxS+l7nNjPZjqLWN
        ZpNgSXmTWW2BLdfvfpDMNqffzAHK6Q4JnNOFzB7oh4EgWOjlxBe8XqXkVNyW4tMmpheyOf
        8tPJkxBfV0g5Hmp7QBR7BhHSY4fqddhaSuk7VfbV/Qp5a4+zfnSqb+J7LaJO18nhJca4F5
        gr86Qc+Af50USjkx5S6p0bzVSMAzEUlOPnFeVjF3LLo+xEaR+iJEnw07TG/qpyNKxf9NsW
        Jbs+/EsdMrJJ2U8DbtkaBy48lNZoD3ZYSULeHj8NoaiF0cO20eFy8k8CZdCkWg==
From:   Sander Vanheule <sander@svanheule.net>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     bert@biot.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, andy.shevchenko@gmail.com,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v4 0/2] Add Realtek Otto GPIO support
Date:   Fri, 26 Mar 2021 13:03:44 +0100
Message-Id: <cover.1616760183.git.sander@svanheule.net>
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
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-realtek-otto.c              | 330 ++++++++++++++++++
 4 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
 create mode 100644 drivers/gpio/gpio-realtek-otto.c

-- 
2.30.2

