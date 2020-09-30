Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A164127E505
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbgI3JVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:21:33 -0400
Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.119]:58930 "EHLO
        atl4mhfb03.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729132AbgI3JVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Sep 2020 05:21:33 -0400
Received: from jax4mhob20.registeredsite.com (jax4mhob20.registeredsite.com [64.69.218.108])
        by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id 08U9LRAE029966
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 05:21:31 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail01pod0.registeredsite.com [10.30.71.203])
        by jax4mhob20.registeredsite.com (8.14.4/8.14.4) with ESMTP id 08U9L7ni194192
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 05:21:07 -0400
Received: (qmail 31924 invoked by uid 0); 30 Sep 2020 09:20:58 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@83.128.90.119)
  by 0 with ESMTPA; 30 Sep 2020 09:20:58 -0000
From:   Mike Looijmans <mike.looijmans@topic.nl>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C
Date:   Wed, 30 Sep 2020 11:20:52 +0200
Message-Id: <20200930092053.2114-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
with 8 GPIOs, latched interrupts and some advanced configuration
options. The "C" version only differs in I2C address.

This adds the entry to the devicetree bindings.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v2: Split devicetree and code into separate patches

 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 3126c3817e2a..99dc1936f633 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -20,6 +20,7 @@ Required properties:
 	nxp,pcal6416
 	nxp,pcal6524
 	nxp,pcal9535
+	nxp,pcal9554b
 	nxp,pcal9555a
 	maxim,max7310
 	maxim,max7312
-- 
2.17.1

