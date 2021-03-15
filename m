Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3444333AD52
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 09:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhCOIZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 04:25:30 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:41434 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhCOIZZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 04:25:25 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9701:b4db:50a7:6f83:328f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 8FD461DDFE8;
        Mon, 15 Mar 2021 09:25:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1615796719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FZ56iwiiZoD3tUjDSEOTnYxVXn0KyETY3D2NjRBz+jE=;
        b=mMYMO2EYhs5QLe5fJKtfgbmJHf/G196OZ7SK1iGzW0Fba1AT+0oQ5XqgB6OZn36/qICzZG
        hyb3RTfwV5nRLfHbOzJpa1r4iVwmasJRr4kU5C9f4D6x3HTUE/gMhI3fAckgxNdvrjzh78
        fvM2P6e9/Vk1aLe9ErmnHFu0PFidMCdnObwuRgTBtm+2UA+u1SKFBhZ9Z27P0FQuJpv3vv
        8fuMOju/0zjiWfoUFt3dYph50wYmFLLS7H+ob9LSTXwPXrdFvthoVnZb8Yom6lqdhC3BeH
        tzNh8fGA+dMMJc1VFIQD3ET2/SK56fkE5HUA/cLTjj8SB7s7EXzNvVbeaKhHJA==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        Bert Vermeulen <bert@biot.com>
Subject: [PATCH 0/2] Add Realtek Otto GPIO support
Date:   Mon, 15 Mar 2021 09:23:38 +0100
Message-Id: <20210315082339.9787-1-sander@svanheule.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the GPIO controller employed by Realtek in multiple series of
MIPS SoCs. These include the supported RTL838x and RTL839x series.
The register layout also matches the one found in GPIO controllers of
other (Lexra-based) SoCs such as RTL8196E, RTL8197D, and RTL8197F.

For the platform name 'otto', I am not aware of any official resources as to
what hardware this specifically applies to. However, in all of the GPL archives
we've received, from vendors using compatible SoCs in their design, the
platform under the MIPS architecture is referred to by this name.

The GPIO ports have been tested on a Zyxel GS1900-8 (RTL8380M), and
Zyxel GS1900-48 (RTL8393M). Furthermore, the GPIO ports and interrupt
controller have been tested on a Netgear GS110TPPv1 (RTL8381M).

Sander Vanheule (2):
  dt-bindings: gpio: Binding for Realtek Otto GPIO
  gpio: Add Realtek Otto GPIO support

 .../bindings/gpio/gpio-realtek-otto.yaml      |  80 +++++
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-realtek-otto.c              | 320 ++++++++++++++++++
 4 files changed, 413 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml
 create mode 100644 drivers/gpio/gpio-realtek-otto.c

-- 
2.30.2

