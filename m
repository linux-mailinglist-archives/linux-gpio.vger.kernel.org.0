Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB0F1F654C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 12:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgFKKDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 06:03:34 -0400
Received: from smtp.asem.it ([151.1.184.197]:57849 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727788AbgFKKDd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jun 2020 06:03:33 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000311368.MSG 
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2020 11:58:26 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 11:58:24 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 11 Jun 2020 11:58:24 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-csky@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH] doc: devicetree: bindings: fix spelling mistake
Date:   Thu, 11 Jun 2020 11:58:04 +0200
Message-ID: <20200611095804.22026-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090203.5EE20041.003A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix typo: "triger" --> "trigger"

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt | 2 +-
 .../devicetree/bindings/interrupt-controller/csky,mpintc.txt    | 2 +-
 Documentation/devicetree/bindings/timer/csky,mptimer.txt        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
index ba455589f869..e1c49b660d3a 100644
--- a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
@@ -12,7 +12,7 @@ Required properties for the top level node:
    Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
 - #interrupt-cells : Specifies the number of cells needed to encode an
    interrupt. Should be 2. The first cell defines the interrupt number,
-   the second encodes the triger flags encoded as described in
+   the second encodes the trigger flags encoded as described in
    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 - compatible:
   - "mediatek,mt7621-gpio" for Mediatek controllers
diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
index e13405355166..e6bbcae4d07f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
@@ -10,7 +10,7 @@ Interrupt number definition:
  16-31  : private  irq, and we use 16 as the co-processor timer.
  31-1024: common irq for soc ip.
 
-Interrupt triger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
+Interrupt trigger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
  IRQ_TYPE_LEVEL_HIGH (default)
  IRQ_TYPE_LEVEL_LOW
  IRQ_TYPE_EDGE_RISING
diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
index 15cfec08fbb8..f5c7e99cf52b 100644
--- a/Documentation/devicetree/bindings/timer/csky,mptimer.txt
+++ b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
@@ -8,7 +8,7 @@ regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
  - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
  - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
  - PTIM_CCVR "cr<3, 14>" Current counter value reg.
- - PTIM_LVR  "cr<6, 14>" Window value reg to triger next event.
+ - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
 
 ==============================
 timer node bindings definition
-- 
2.17.1

