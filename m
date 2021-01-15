Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2F62F811C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 17:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbhAOQrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 11:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbhAOQrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 11:47:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36B7C061794
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 08:47:05 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0SFY-0001WU-MR; Fri, 15 Jan 2021 17:47:00 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0SFY-0004h7-Cq; Fri, 15 Jan 2021 17:47:00 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: gpio: pca953x: Document new supported chip pca9506
Date:   Fri, 15 Jan 2021 17:46:57 +0100
Message-Id: <20210115164658.187681-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115164658.187681-1-u.kleine-koenig@pengutronix.de>
References: <20210115164658.187681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The previous patch added support for this chip. Add its name to the list
of allowed compatibles.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index f5ee23c2df60..cdd7744b8723 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -32,6 +32,7 @@ properties:
       - maxim,max7327
       - nxp,pca6416
       - nxp,pca9505
+      - nxp,pca9506
       - nxp,pca9534
       - nxp,pca9535
       - nxp,pca9536
-- 
2.29.2

