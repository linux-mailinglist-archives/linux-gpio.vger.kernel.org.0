Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BC933C671
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 20:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhCOTIm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 15:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbhCOTI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 15:08:28 -0400
X-Greylist: delayed 38560 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Mar 2021 12:08:26 PDT
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAC9C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 12:08:26 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9701:b4db:50a7:6f83:328f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 52FBE1DE334;
        Mon, 15 Mar 2021 20:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1615835304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zq7YQSlkcdUWTE6WiopphqP5vCHcCp130E2OZQ8xV10=;
        b=tJpCRQAXvdOVUv2I7O/0qolhoJZOj1SwzsPcyYxx4z/99pwAFUkjy1cKZ1yQ8lrnjzZPil
        vTNjo5mPwAgGKu0ilAVpFBtSVH4qb8+vPovSSSPA7I9WGSDQoB7TjIfon9rOXXOhqDBa2b
        rRKrYs98HrsXUpKPEpz93CgfLnxnlTA+pUvshRa/e48JKUPIq1r/yF5WIv28vDCGv+QyDk
        8sit7GTl6+iXcm/SxafBZsk1VJlRv3yT85FubGn88uAGgt64kH4W7g4IKYjK7pehT6MsXg
        ZKv9PRXvmjEhtESTjE4pWlVarGb0gKCFfczwcy8VVC1zq5oqRP5qWqN1i1m4MQ==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>, bert@biot.com
Subject: [PATCH v2 0/2] Add Realtek Otto GPIO support
Date:   Mon, 15 Mar 2021 20:08:04 +0100
Message-Id: <20210315190806.66762-1-sander@svanheule.net>
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

Changes in v2:
- Clarify structure and usage of IMR registers

Sander Vanheule (2):
  dt-bindings: gpio: Binding for Realtek Otto GPIO
  gpio: Add Realtek Otto GPIO support

 .../bindings/gpio/gpio-realtek-otto.yaml      |  80 +++++
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-realtek-otto.c              | 331 ++++++++++++++++++
 4 files changed, 424 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml
 create mode 100644 drivers/gpio/gpio-realtek-otto.c

-- 
2.30.2

