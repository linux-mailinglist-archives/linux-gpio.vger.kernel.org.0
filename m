Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B0A1445B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 08:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfEFGCO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 02:02:14 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:37166 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfEFGCO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 02:02:14 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hNWhZ-0004zU-JY from Harish_Kandiga@mentor.com ; Sun, 05 May 2019 23:02:13 -0700
Received: from localhost.localdomain (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 6 May 2019 07:02:08 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>
Subject: [PATCH V1 2/2] dt-bindings: gpio: document the new active-state property
Date:   Mon, 6 May 2019 11:31:41 +0530
Message-ID: <1557122501-5183-3-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the information of active state of gpio pin
as property into device tree configuration using a
"active-state" property u8 array.

This is useful for user space applications to identify
active state of pins.

Note: The active-state attribute is completely optional.

Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index a8895d3..3af3066 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -167,6 +167,9 @@ left to right from the passed array. An incomplete array (where the number
 of passed named are less than ngpios) will still be used up until the last
 provided valid line index.

+Optionally, a GPIO controller may also have an "active-state" property.
+This is an u8 array defining the information of active state of gpio pin.
+
 Example:

 gpio-controller@00000000 {
@@ -180,6 +183,7 @@ gpio-controller@00000000 {
 		"LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
 		"Row A", "Row B", "Row C", "Row D", "NMI button",
 		"poweroff", "reset";
+	active-state = /bits/ 8 <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0>;
 }

 The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
--
2.7.4

