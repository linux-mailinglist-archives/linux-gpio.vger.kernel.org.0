Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05EC316292F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 16:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgBRPS1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 10:18:27 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:39528 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgBRPS1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 10:18:27 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 4FJE220015USYZQ01FJEv2; Tue, 18 Feb 2020 16:18:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j44dZ-0006yO-UY; Tue, 18 Feb 2020 16:18:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j44dZ-000238-Sw; Tue, 18 Feb 2020 16:18:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 5/5] MAINTAINERS: Add GPIO Aggregator section
Date:   Tue, 18 Feb 2020 16:18:12 +0100
Message-Id: <20200218151812.7816-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218151812.7816-1-geert+renesas@glider.be>
References: <20200218151812.7816-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a maintainership section for the GPIO Aggregator, covering
documentation and driver source code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
v5:
  - Add Reviewed-by, Tested-by,

v4:
  - Drop controversial GPIO repeater,

v3:
  - New.
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 634376400709d6e8..d39f550ab1555a87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7128,6 +7128,13 @@ F:	Documentation/firmware-guide/acpi/gpio-properties.rst
 F:	drivers/gpio/gpiolib-acpi.c
 F:	drivers/gpio/gpiolib-acpi.h
 
+GPIO AGGREGATOR
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/gpio/gpio-aggregator.rst
+F:	drivers/gpio/gpio-aggregator.c
+
 GPIO IR Transmitter
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

