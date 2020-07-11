Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEE621C248
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 06:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgGKEyr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 00:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgGKEyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 00:54:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F836C08C5DD
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2020 21:54:47 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ju7XA-00069H-QU; Sat, 11 Jul 2020 06:54:44 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ju7X9-0001iY-PM; Sat, 11 Jul 2020 06:54:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v2] [RFC] dt-bindings: gpio: introduce hog properties with less ambiguity
Date:   Sat, 11 Jul 2020 06:54:41 +0200
Message-Id: <20200711045441.19464-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com>
References: <CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For active low lines the semantic of output-low and output-high is hard
to grasp because there is a double negation involved and so output-low
is actually a request to drive the line high (aka inactive).

So introduce output-inactive and output-active with the same semantic as
output-low and output-high respectively have today, but with a more
sensible name.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

compared to (implicit) v1, changed to ..asserted from ...active as Linus
Walleij suggested.

Best regards
Uwe

 Documentation/devicetree/bindings/gpio/gpio.txt | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index a8895d339bfe..1061c346a619 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -196,11 +196,16 @@ Only one of the following properties scanned in the order shown below.
 This means that when multiple properties are present they will be searched
 in the order presented below and the first match is taken as the intended
 configuration.
-- input:      A property specifying to set the GPIO direction as input.
-- output-low  A property specifying to set the GPIO direction as output with
-	      the value low.
-- output-high A property specifying to set the GPIO direction as output with
-	      the value high.
+- input:             A property specifying to set the GPIO direction as input.
+- output-deasserted: A property specifying to set the GPIO direction as output
+		     with the inactive value (depending on the line's polarity,
+		     which is active-high by default)
+- output-asserted:   A property specifying to set the GPIO direction as output
+		     with the active value.
+
+For backwards compatibility "output-low" and "output-high" should be supported
+as aliases for "output-deasserted" and "output-asserted" respectively. Their
+usage is misleading for active-low outputs, so their use is discouraged.
 
 Optional properties:
 - line-name:  The GPIO label name. If not present the node name is used.
-- 
2.27.0

