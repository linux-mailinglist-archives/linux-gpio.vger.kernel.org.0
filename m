Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5472E7C81
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Dec 2020 22:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgL3VAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Dec 2020 16:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgL3VAK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2020 16:00:10 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29D6C061575;
        Wed, 30 Dec 2020 12:59:30 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id h16so8226767qvu.8;
        Wed, 30 Dec 2020 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mSSJGsPqhouBo2Mp5AidaQG3JJvDQTg+FTRq3a3ps7o=;
        b=nWMErpLPA/cKQytVkYYq0YmDf3T3DMjQZcMYZBva8bxheaneD/e3dQtDYQNTykZrp1
         RIIdb2fpLAWnNfh48UctdpiJCNalHJCiedGfLrli8XQ0j1qMDBw39Kl2wst6X5uPICO3
         LGRQ5C9EF9h72RpAIRxkTsasJJEJr5kdsVe5qOe9KS4T+R34uXw4lRZCAEVBMPV7JDnC
         QmY39n7RC19B4dVD4QTgFVN+s4f0rInxjKWtVAZgB595CaWZ8m5Nl9xJh/oWqBnYSJdC
         K9JLJ8xUo8eG7DqqL1iupqD4l8qd6csloIx+KMIwWwQDF8J2EtoarEkHshFrO0/JtLf+
         bHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mSSJGsPqhouBo2Mp5AidaQG3JJvDQTg+FTRq3a3ps7o=;
        b=XvdmNrPYAsyp65GGnI/UAERJNpvVt6zy1PavVfdGkx3poi573D5QNa0Lt8BKzRQjnn
         D1x0tvHwTUTucI4ciRS0NrK9re/EppJc86qCN7kU+irNu7a+rpzGQh+q9VXGMGsHEmHQ
         Yu67Gsh/XdjutwN9GkMnxEEg7UqlvTH3iMacEuoR0SyCT4q9XkWeSL6b+3eOhAi9kkrS
         TF8fZPtB+UwfMjv5linVbPhweNUcARfzVn6l8qIoKfOlWcje0MVtC9ZlrYD93vvF2KRw
         8xlHNsD+ZhLuPsCFtR9CRoskaDrJ5I9JmeEj3SLc/cNEcS6P3VVqWs+99Kw39pYWG/C4
         pEAA==
X-Gm-Message-State: AOAM532ZU4jcl/7/BYmofnp5Nrhcr/+3705F44wOrxgCMvwk+5iEC27U
        66jrzNUXBxHxMJJRltXU8OQ=
X-Google-Smtp-Source: ABdhPJynPMg9sgVsCs9B00Bri1ZkJMmTGTtsUssaxCYh3TqVgstIqLOcYX2pD7DXv3LOoCd9C+I4Lw==
X-Received: by 2002:a05:6214:533:: with SMTP id x19mr58629015qvw.20.1609361969446;
        Wed, 30 Dec 2020 12:59:29 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:d66:6051:ad08:aa32])
        by smtp.gmail.com with ESMTPSA id m41sm20892474qtc.28.2020.12.30.12.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 12:59:28 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, sandor.yu@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: gpio: 74x164: Introduce the 'registers-default' property
Date:   Wed, 30 Dec 2020 17:59:15 -0300
Message-Id: <20201230205916.8875-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are cases where a certain default output value in the 74x164
output is needed.

For example: the imx6ul-evk board has the Ethernet PHY reset controlled
by the 74x164 chip.

After enabling the OE pin, the output pins of the 74x164 chip go to
zero by default, which makes the Ethernet PHY not to be detected.

Add a new optional property called 'registers-default' that allows
describing the default output value for each shift register.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
index 2a97553d8d76..bf8f45896018 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
@@ -14,6 +14,8 @@ Required properties:
 
 Optional properties:
 - enable-gpios: GPIO connected to the OE (Output Enable) pin.
+- registers-default: An array of 8-bit values describing the default output
+value of each shift registers.
 
 Example:
 
@@ -24,4 +26,5 @@ gpio5: gpio5@0 {
 	#gpio-cells = <2>;
 	registers-number = <4>;
 	spi-max-frequency = <100000>;
+	registers-default = /bits/ 8 <0x57 0xF0 0xFF 0xF0>;
 };
-- 
2.17.1

