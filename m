Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889137166D9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 17:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjE3PUE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 11:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjE3PUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 11:20:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4F0C5
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 08:20:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418d-0007zn-KT; Tue, 30 May 2023 17:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418c-003uGa-Kl; Tue, 30 May 2023 17:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418b-009XZo-SX; Tue, 30 May 2023 17:19:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with less ambiguity
Date:   Tue, 30 May 2023 17:19:45 +0200
Message-Id: <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2341; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RA3qVT25IwLPobyPssIaHOeXzanjSoTCt6oNKhicJgo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdhQHBHZtGIAi6Bq/F5I5DQjnidMrtkAExD67+ 4cBTEJLzpaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHYUBwAKCRCPgPtYfRL+ TuSYCAC36CDtC2DtUlenGl1cRN8aFjh4SuW3OyzLQhYmWV5qScoZjIf+4AIzlZaHGfDXKyM7BA4 ip6uRtZqq0ULnOC0HB9Z3pDdp5nz3dMtW3v73Sp5JrklmGBDrIl6LmI0ot2B9QX7qrMDPYiZmPe m5fYlN9oJ/WuPJ1rC1taFmPDsrvKuQ7P3Q1AYf1bQJ5uAycrKYTWgSkoGf87BhEXJglgeci+dFF AMTLFRIth1t0KFEekflfdSH5gco2udNJrgbMo/m0ptCPGGDgJnlU5STj9fK5ovWXepcv010YgxM 7kxtCxLKyNclnrfJK/dQBj+DzbDprwxs9zNJ7/1GG6VOprt5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
 Documentation/devicetree/bindings/gpio/gpio.txt | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index d82c32217fff..2f037bbd3ffa 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -209,15 +209,21 @@ Required properties:
 - gpios:      Store the GPIO information (id, flags, ...) for each GPIO to
 	      affect. Shall contain an integer multiple of the number of cells
 	      specified in its parent node (GPIO controller node).
+
 Only one of the following properties scanned in the order shown below.
 This means that when multiple properties are present they will be searched
 in the order presented below and the first match is taken as the intended
 configuration.
-- input:      A property specifying to set the GPIO direction as input.
-- output-low  A property specifying to set the GPIO direction as output with
-	      the value low.
-- output-high A property specifying to set the GPIO direction as output with
-	      the value high.
+- input:             A property specifying to set the GPIO direction as input.
+- output-inactive:   A property specifying to set the GPIO direction as output
+		     with the inactive value (depending on the line's polarity,
+		     which is active-high by default)
+- output-active:     A property specifying to set the GPIO direction as output
+		     with the active value.
+
+For backwards compatibility "output-low" and "output-high" are supported as
+aliases for "output-inactive" and "output-active" respectively. Their usage is
+misleading for active-low outputs, so their use is discouraged.
 
 Optional properties:
 - line-name:  The GPIO label name. If not present the node name is used.
-- 
2.39.2

