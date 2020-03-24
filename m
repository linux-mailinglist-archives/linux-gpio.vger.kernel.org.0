Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41A81191243
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 14:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgCXN52 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 09:57:28 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37856 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgCXN5V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 09:57:21 -0400
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id JDwu2200M5USYZQ06Dwu4g; Tue, 24 Mar 2020 14:57:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jGk34-0006Oc-Ga; Tue, 24 Mar 2020 14:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jGk34-0001kW-Ey; Tue, 24 Mar 2020 14:56:54 +0100
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
        qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/8] ARM: integrator: impd1: Use GPIO_LOOKUP() helper macro
Date:   Tue, 24 Mar 2020 14:56:46 +0100
Message-Id: <20200324135653.6676-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324135328.5796-1-geert+renesas@glider.be>
References: <20200324135328.5796-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

impd1_probe() fills in the GPIO lookup table by manually populating an
array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP() helper
macro instead, to relax a dependency on the gpiod_lookup structure's
member names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org
---
While this patch is a dependency for "[PATCH v6 4/8] gpiolib: Add
support for GPIO lookup by line name", it can be applied independently.
But an Acked-by would be nice, too.

Cover letter and full series at
https://lore.kernel.org/r/20200324135328.5796-1-geert+renesas@glider.be/

v6:
  - New.
---
 arch/arm/mach-integrator/impd1.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-integrator/impd1.c b/arch/arm/mach-integrator/impd1.c
index 1ecbea5331d6ed8b..6f875ded841924d8 100644
--- a/arch/arm/mach-integrator/impd1.c
+++ b/arch/arm/mach-integrator/impd1.c
@@ -410,13 +410,10 @@ static int __ref impd1_probe(struct lm_device *dev)
 			 * 5 = Key lower right
 			 */
 			/* We need the two MMCI GPIO entries */
-			lookup->table[0].chip_label = chipname;
-			lookup->table[0].chip_hwnum = 3;
-			lookup->table[0].con_id = "wp";
-			lookup->table[1].chip_label = chipname;
-			lookup->table[1].chip_hwnum = 4;
-			lookup->table[1].con_id = "cd";
-			lookup->table[1].flags = GPIO_ACTIVE_LOW;
+			lookup->table[0] = (struct gpiod_lookup)
+				GPIO_LOOKUP(chipname, 3, "wp", 0);
+			lookup->table[1] = (struct gpiod_lookup)
+				GPIO_LOOKUP(chipname, 4, "cd", GPIO_ACTIVE_LOW);
 			gpiod_add_lookup_table(lookup);
 		}
 
-- 
2.17.1

