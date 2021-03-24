Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C2334838C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 22:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238293AbhCXVXt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 17:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbhCXVXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 17:23:30 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17D5C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 24 Mar 2021 14:23:29 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9f01:9a93:b6b:1adc:3da7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 2129D1E4FF5;
        Wed, 24 Mar 2021 22:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616621007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+/KBan7pEXMk9C2eO4o+fG6N3X0BchEzJ4IMvWHgbgc=;
        b=Cij5y/gxGkQOHBR9umvh3CxND9QKD9qr6ZSpEWmU8w6KEYRtelP2GGO345I1JdGSQdti/g
        HM3JGm3uD9L/dvZjcCRSn799Qlg54lAqrJVefbY6ax0CWXbkWBPkzn5CG165kCCk/GAkvi
        /XLFBUhvkHlzsXRunDvqBt4e5Al1OxMNR6G1rdEkE16QpIuKSpBPLTKqx0wApDj8TFUoik
        ++Gv9ksfexuOcY6AUqpz6OG5401cpr4hu5ADNUflh+Nh4FZMCpvZW9kFJlblO4Bf06oAj8
        9Oqq/GncIhVJSdLuRjxmmCyy77GxfhNNof1KafhftFZkXJtcLdU7c2ibQuPklA==
From:   Sander Vanheule <sander@svanheule.net>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     bert@biot.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v3 0/2] Add Realtek Otto GPIO support
Date:   Wed, 24 Mar 2021 22:22:38 +0100
Message-Id: <cover.1616620884.git.sander@svanheule.net>
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

 .../bindings/gpio/realtek,otto-gpio.yaml      |  78 ++++
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-realtek-otto.c              | 335 ++++++++++++++++++
 4 files changed, 425 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
 create mode 100644 drivers/gpio/gpio-realtek-otto.c

-- 
2.30.2

