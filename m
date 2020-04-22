Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92241B414A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 12:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732016AbgDVKv3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 06:51:29 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57705 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgDVKLN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 06:11:13 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id D64783C004C;
        Wed, 22 Apr 2020 12:11:10 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4UNUtcHSYsUO; Wed, 22 Apr 2020 12:11:05 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 524B63C057F;
        Wed, 22 Apr 2020 12:11:04 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.60) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 22 Apr
 2020 12:11:04 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <linux-renesas-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Yusuke Ashiduka <ashiduka@fujitsu.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [RFC PATCH 1/3] dt-bindings: gpio-rcar: Add optional use-alternative-interrupt property
Date:   Wed, 22 Apr 2020 12:10:24 +0200
Message-ID: <20200422101026.9220-2-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422101026.9220-1-erosca@de.adit-jv.com>
References: <20200422101026.9220-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.94.60]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Torii Kenichi <torii.ken1@jp.fujitsu.com>

When setting this property, you must set alternate interrupt number in
the 'interrupts' property.

Signed-off-by: Torii Kenichi <torii.ken1@jp.fujitsu.com>
[erosca: tidy up the descriptions/comments]
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
index 10dce84b1545..aa5aea90431a 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
+++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
@@ -50,6 +50,9 @@ Optional properties:
   - clocks: Must contain a reference to the functional clock.  The property is
     mandatory if the hardware implements a controllable functional clock for
     the GPIO instance.
+  - use-alternative-interrupt: Use 'alternative' GPIO interrupt instead
+    of 'normal' GPIO interrupt. When you specify this property, you must
+    also change the 'interrupts' DT property.
 
   - gpio-reserved-ranges: See gpio.txt.
 
-- 
2.26.0

