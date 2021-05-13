Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1EB37FFA7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 23:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbhEMVMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 May 2021 17:12:31 -0400
Received: from mx3.wp.pl ([212.77.101.10]:13962 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233320AbhEMVMb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 May 2021 17:12:31 -0400
Received: (wp-smtpd smtp.wp.pl 16248 invoked from network); 13 May 2021 23:04:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1620939879; bh=AzcBINbYZdnielXea23PvA+W95/jspAWRWbklsvvER4=;
          h=From:To:Cc:Subject;
          b=X+NynzB3VgC9qFG2Yiu/O9VuxwKsNFRNrTboSNrNw3OPdtlzAKFnZJS+d1++9DUbV
           /9Pmw2JARHRm9xik90L+A1maVIFIRV8hLLHR1Dnq+GOyNWJt5JV7+K12F10Jrx9oU4
           19lBhypJa7y/jhLs10+SXO6u+OUgERHFhM/ph+GA=
Received: from riviera.nat.ds.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linus.walleij@linaro.org>; 13 May 2021 23:04:39 +0200
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, john@phrozen.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH 2/2] dt-bindings: gpio: stp: add gphy3 and gphy4 properties
Date:   Thu, 13 May 2021 23:03:40 +0200
Message-Id: <20210513210340.10466-2-olek2@wp.pl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210513210340.10466-1-olek2@wp.pl>
References: <20210513210340.10466-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: a88212db06a9e0d4b6918adb88f1eed9
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [QSO0]                               
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The xRX300 family has 3 and the xRX330 has 4 gphs. They can also control
some pins of the gpio cascade. This patch documents the missing properties.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../devicetree/bindings/gpio/gpio-stp-xway.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
index a36acc98898c..beb755edf639 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.yaml
@@ -84,6 +84,22 @@ properties:
     minimum: 0x0
     maximum: 0x7
 
+  lantiq,phy3:
+    description:
+      The gphy3 core can control 3 bits of the gpio cascade. Available on
+      the xRX300 and xRX330 family.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x7
+
+  lantiq,phy4:
+    description:
+      The gphy4 core can control 3 bits of the gpio cascade. Available on
+      the xRX330 family.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x0
+    maximum: 0x7
+
   lantiq,rising:
     description:
       Use rising instead of falling edge for the shift register.
-- 
2.30.2

