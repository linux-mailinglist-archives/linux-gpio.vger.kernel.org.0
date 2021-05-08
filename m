Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6B437725D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 May 2021 16:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhEHO2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 May 2021 10:28:38 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49577 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229500AbhEHO2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 May 2021 10:28:38 -0400
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 May 2021 10:28:35 EDT
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud7.xs4all.net with ESMTP
        id fNoalDe3DyEWwfNoblAKIZ; Sat, 08 May 2021 16:20:23 +0200
From:   Mark Kettenis <kettenis@openbsd.org>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Apple M1 pinctrl DT bindings
Date:   Sat,  8 May 2021 16:19:54 +0200
Message-Id: <20210508142000.85116-1-kettenis@openbsd.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIi7mPy78jdujl4nZfljyb1v4wn9r4x1+IWMab6Nj9gHNxx7RaGVinDGSRw/qYZhY8oTrwtr4gmXafz43ConQ2CCgsoMy3B6bsK8zY+PmnDv7SAI6oD2
 xp+Ai1/X+pA+VVMISo9JGnqCRg0bzjBSKhwmWHyKrcfeywiQox6nAa/zchlxJJDFIBzmPxPpF6cqhRxLUm4R1/+BHicUF9wz87m/bGwlvAcxlkb/3d8tJgfz
 65tLrGmHW0u3Zhn8wMqbbTa6NbaMj1wxmlr6l2A8tB41mZbOQG5erlk3dcrXszL4b0SBpjIU5x3Sk4Zodj15q3Dsx8+ZUXu2cOqfHkjW8YM6WWRPscxDcUlb
 JJRpXJDgnzo13++Rp1ZqaTSw/ngX/ODFhFJXGuJVL0kHNVhxVPrczFPiHGGIoIHnGWa5FwTVldZUzai8O9OiPdBrMw/BkM4lgnxELRYkZmnqctohn8ShKc3b
 Za0LtCILuV7puZm6
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This small series adds bindings for the pin and GPIO controller found
on the Apple M1 SoC.

At this point, the primary consumer for these bindings is U-Boot.
With the help of these bindings U-Boot can bring up the PCIe root
complex into a state where the OS use it without having to deal with
the GPIO pins.  A Linux driver may be implemented later to support
power management and/or other devices that need GPIO control.  Since
the binding is based on standard pinmux node bindings this should be
relatively easy.


Mark Kettenis (2):
  dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
  arm64: apple: Add pinctrl nodes

 .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi          |  83 ++++++++++++++
 include/dt-bindings/pinctrl/apple.h           |  13 +++
 4 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/apple.h

-- 
2.31.1

