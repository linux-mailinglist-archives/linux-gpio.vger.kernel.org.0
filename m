Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83E538B4FB
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 19:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbhETROo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 13:14:44 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43435 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231561AbhETROo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 13:14:44 -0400
Received: from copland.sibelius.xs4all.nl ([83.163.83.176])
        by smtp-cloud9.xs4all.net with ESMTP
        id jmEWllugRVN4kjmEXlB7at; Thu, 20 May 2021 19:13:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1621530801; bh=WjpDZrKkDBV5L77ReKKWoyRdT7dzQ2/hsXfXJDi4a+Y=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=KbjgNmR1BoCNt84sppLQ0Cz3hsLlboSUOafsMhjA5rqu70Ld9xJsHk1qF7dmI3rRn
         FsOmH7Jdey8zMajAHTUfhLz99HwWQ4+R/P/rfzVO3aYs7NUUaFlpvd+iRvHSt3QJEV
         MwmracWwONDSdqDnJLo/eBA/a1oX+arjhie5PSxIhnS5tErVKmxUvdL9Fg6fDGPCKN
         siIU32UcpRJDprCl5KZcJnRcnFYhJAFW4VR9pHAzBxkOEoDcoEipnHi6+gKEdtKKxx
         3VmmvzkqcuflL0Ih5Kzxz8O4Lxm3jJkIRj8xg1kUO6/tu51dDsf8mMg2KzMi4zhoCf
         kfZj0aucq4dMQ==
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     devicetree@vger.kernel.org
Cc:     Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Apple M1 pinctrl DT bindings
Date:   Thu, 20 May 2021 19:13:05 +0200
Message-Id: <20210520171310.772-1-mark.kettenis@xs4all.nl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCqXz/k0b8/lGMVGcgYoRJLw0qtn4re3p3yr+MmSkj2BDUTt5nltCu2PEVnwxd2a6H7DbPpBRIpWYqaNK9C/6djCrwDheppzbOy6Hx0Beq439qg5YOnr
 IFVnt1tVcquGCbusf2njdUpkLYnJkw7YTcVYro99i+JuPg6qYE5UxZejmI4yCXrQx0bn7AY3yJ7Aoc/jAY/nlylimUwRHt2jT41afY+iw8IP9FLQA2ER6Rbh
 EvQM91mLLwNdHRzyqKbfj5UbtMPjiNDdiE/Gwjb/KP8sKkOIHCJmRKNHWGnVoNAuGUTyBSfowD1jYwyIRsxAV0X7v8ZLg2ell40OxFlGFAh3HvblRCQ9wLPP
 eB25tkRKmNMF3EMvDKk6+7YJAKE0p36xn8CJdZebY8WYnHdImP3SCwWEylZwbVOAJpB7MkV8LbbhQWKqFrrVcvngUwDYrt9Uy+B6P/QwNWui4KQsrOqs6WyD
 tfaLW17PgWu/QYes
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Mark Kettenis <kettenis@openbsd.org>

This small series adds bindings for the pin and GPIO controller found
on the Apple M1 SoC.

At this point, the primary consumer for these bindings is U-Boot.
With the help of these bindings U-Boot can bring up the PCIe root
complex into a state where the OS use it without having to deal with
the GPIO pins.  A Linux driver may be implemented later to support
power management and/or other devices that need GPIO control.  Since
the binding is based on standard pinmux node bindings this should be
relatively easy.

Changelog:

v2: - Fix typo in DT schema

v3: - Add description for interrupts property


Mark Kettenis (2):
  dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
  arm64: apple: Add pinctrl nodes

 .../bindings/pinctrl/apple,pinctrl.yaml       | 106 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi          |  83 ++++++++++++++
 include/dt-bindings/pinctrl/apple.h           |  13 +++
 4 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/apple.h

-- 
2.31.1

