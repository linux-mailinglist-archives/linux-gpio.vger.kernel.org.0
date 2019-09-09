Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E228AD779
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 13:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390900AbfIILAC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Sep 2019 07:00:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37843 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390885AbfIILAA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2019 07:00:00 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i7HOn-0003wJ-Jf; Mon, 09 Sep 2019 12:59:57 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i7HOm-0006LO-SB; Mon, 09 Sep 2019 12:59:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC] gpio: define gpio-init nodes to initialize pins similar to hogs
Date:   Mon,  9 Sep 2019 12:59:19 +0200
Message-Id: <20190909105919.30418-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.23.0
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

Sometimes it is handy to be able to easily define a "safe" state for a
GPIO. This might for example be used to ensure that an ethernet phy is
properly reset during startup or just that all pins have a defined state
to minimize leakage current. As such a pin must be requestable (and
changable) by a device driver, a gpio-hog cannot be used.

So define a GPIO initializer with a syntax identical to a GPIO hog just
using "gpio-init" as identifier instead of "gpio-hog".

The usage I have in mind (and also implemented in a custom patch stack
on top of barebox already) is targeting the bootloader and not
necessarily Linux as such an boot-up initialisation should be done as
early as possible.

Not-yet-signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

maybe it also makes sense to use "gpio-safe"? Maybe it (then) makes
sense to reset the gpio in the indicated state after it is released?

Also it might be beneficial to make the wording more explicit in the
description and for example tell that only one of gpio-hog and gpio-init
must be provided. 

Best regards
Uwe

 Documentation/devicetree/bindings/gpio/gpio.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index a8895d339bfe..5b7883f5520f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -182,13 +182,16 @@ gpio-controller@00000000 {
 		"poweroff", "reset";
 }
 
-The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
-providing automatic GPIO request and configuration as part of the
-gpio-controller's driver probe function.
+The GPIO chip may contain GPIO hog and init definitions. GPIO hogging is a
+mechanism providing automatic GPIO request and configuration as part of the
+gpio-controller's driver probe function. An GPIO initializer is similar but
+doesn't prevent later requesting and reconfiguration.
 
 Each GPIO hog definition is represented as a child node of the GPIO controller.
 Required properties:
 - gpio-hog:   A property specifying that this child node represents a GPIO hog.
+- gpio-init:  A property specifying that this child node represents a GPIO
+	      initializer.
 - gpios:      Store the GPIO information (id, flags, ...) for each GPIO to
 	      affect. Shall contain an integer multiple of the number of cells
 	      specified in its parent node (GPIO controller node).
-- 
2.23.0

