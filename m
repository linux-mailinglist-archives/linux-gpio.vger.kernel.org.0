Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93972C78B5
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Nov 2020 12:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgK2LJF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Nov 2020 06:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgK2LIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Nov 2020 06:08:54 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AD2C0613D2
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2020 03:08:14 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id q3so320747pgr.3
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2020 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfG3IJYFfaN+LLPLPN9u5BA6DY35eu9G1j5saJ10vaQ=;
        b=sKo2DUTDonDaiIv9hFnn0BJLMzL4XqOt+FgwsQebG2oxgVCSSgvueeNbnkq00vT/fn
         +0IqL36Aqs6B5P0bRgcN1eD8JTPI7oVWWM4a0a5ecelIheCW185xNziicy/8GGXGr0gG
         KsEW3oC0jkfxgG0hmRVy/gDIT9GmgXLnZNyMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfG3IJYFfaN+LLPLPN9u5BA6DY35eu9G1j5saJ10vaQ=;
        b=k5l366DzUTgjOWaIRXG9fIwJW/wuqYeI9mZuT6LbfnImL99dy3O7KM77xf2ynf0K8I
         KtQZ+/gUT36zr8U1LOGAn/9pB/TnrxtbgcqoQyKoA8F+/BhGfVdkItxf/mUEWbT06Pah
         ZDK4uhyW8fln0aYDpRve+RTdbhOc5rNk9XYCBA2BTWqKBNocwnxacpunxoinxx53qrZu
         gesLxpA1+hiCFJO6al2UEm+lvvUv4sBRUWRuRT3/wMDYf0Rr2GKNqZ6TXovJD1LC7dg7
         tESqTGBwt+1fzhprsCknIqDp6/2NlKszAJbkhjfa6suykg7+DESj7b9Zbpc6lRObj2Rs
         mpSQ==
X-Gm-Message-State: AOAM531VdsT5/uutaDlk3tXOgP/XSyeCrkOBRVJjqIArcvfvKNcgKD/B
        0KdjfTx9cAMERcrL2+FpD3BYLw==
X-Google-Smtp-Source: ABdhPJx2TWa65jQIOPR1bVgac6u1Qz7JaJNyTfwd5Cu71RgjmSi4gPQzIEb34BD6JhIN/Kg5vSRbgg==
X-Received: by 2002:a17:90b:203:: with SMTP id fy3mr18895929pjb.231.1606648093633;
        Sun, 29 Nov 2020 03:08:13 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 03:08:13 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     soc@kernel.org, linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        robh@kernel.org, w@1wt.eu, daniel@0x0f.com
Subject: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
Date:   Sun, 29 Nov 2020 20:07:57 +0900
Message-Id: <20201129110803.2461700-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

At the moment the MStar/SigmaStar support is only really
capable of shell from an initramfs and not much else.

Most of the interesting drivers are blocked on clock and pinctrl
drivers and those are going to take me a little while to get cleaned
up.

Clock and pinctrl aren't needed for basic GPIO to work (all pins
start off as GPIOs..) and it makes it possible to actually do something
so this series adds everything that is needed for the main GPIO
block in these chips.

Changes since v3:
- Remove unneeded "gpio-ranges-group-names" property from binding yaml.

Changes since v2:

- Numerous style and code cleanups as suggested by Andy Shevchenko,
  Linus Walleij, Marc Zyngier and Rob Herring.

- Pad names moved out of the binding header because they are no longer
  needed there. The pin/pad numbers are still there as I couldn't think
  of a better way to do this. meson8b-gpio.h seems to be similar.

Changes since v1:

- Moves the binding header commit before the yaml commit
  
- Fixes the license on the binding header to include BSD-2-Clause

- The driver has been reworked to use the gpiolib irqchip functionality
  as suggested by Linus[0]. I think I got this right. The gpio controller
  doesn't actually do anything with interrupts itself.. It just happens
  to have 4 lines that are also wired to lines on one of the interrupt
  controllers.

- Now that the driver is an interrupt controller in it's own right for
  the gpio lines that have associated interrupts the binding description
  has been updated to add the interrupt-controller bits and remove the
  description of the interrupt-names that described how the interrupts
  used to be passed in.

Daniel Palmer (5):
  dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver
  dt-bindings: gpio: Binding for MStar MSC313 GPIO controller
  gpio: msc313: MStar MSC313 GPIO driver
  ARM: mstar: Add gpio controller to MStar base dtsi
  ARM: mstar: Fill in GPIO controller properties for infinity

 .../bindings/gpio/mstar,msc313-gpio.yaml      |  59 +++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/mstar-infinity.dtsi         |   7 +
 arch/arm/boot/dts/mstar-v7.dtsi               |  10 +
 drivers/gpio/Kconfig                          |  11 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-msc313.c                    | 460 ++++++++++++++++++
 include/dt-bindings/gpio/msc313-gpio.h        |  53 ++
 8 files changed, 604 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 create mode 100644 drivers/gpio/gpio-msc313.c
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h

-- 
2.29.2

