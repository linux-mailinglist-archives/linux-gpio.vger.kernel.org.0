Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC9D269F03
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 00:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731167AbfGOWh3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 18:37:29 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35483 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731014AbfGOWh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jul 2019 18:37:29 -0400
Received: by mail-io1-f66.google.com with SMTP id m24so36846242ioo.2;
        Mon, 15 Jul 2019 15:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WXbxpjTO0OeI6MuUUKX3Eklg6COj9IISlKB84zUoyLo=;
        b=gldnTgBfP/UoVHKEyS2UtELXwMKReKvQhQO+dSsy93/vUaxwYoaU41MwNE/S8vApPc
         AUvM6uYp165wkXQQyoKMhK2Kittj49Jp2aGp6n0BbBZIzwUPjkdr3fgA/k18vEzlRuk1
         U4d+ZDOu4SpOARFbZ7t9E0PGVLuUw1cswbJK8Ecn1WHC/p6UuVx8o7uuW6w3KAgzZnTh
         4Fy2YPgZwFaSZ5IvUrl98zhdHO4ZUxefs+oncQ+ZsqaZIDXf6cJLqD7KZB5QUzWY+w1d
         qzEQ8iSmseXA5RSaxLNMYqZ+3uXhqoETdpo/PhomWInH8tQ0yOo8ItYzalEj+posgOBH
         D+1A==
X-Gm-Message-State: APjAAAVqpXOGUcwBlRjVhPuVjrSW3z/leRakM4FYfJA40OOVwdY9qVBw
        RaPHg3QZi7HCPgPSIA2noREtLRw=
X-Google-Smtp-Source: APXvYqxpaPu9UCGLAK8cqFKFRAwnJVxKaxtB+Ov7U8QDlsE1ae268Oy/Kl1oMN//CPx5c9hmTs3slw==
X-Received: by 2002:a5d:9d90:: with SMTP id 16mr27939554ion.132.1563230247894;
        Mon, 15 Jul 2019 15:37:27 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
        by smtp.googlemail.com with ESMTPSA id e26sm15751180iod.10.2019.07.15.15.37.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 15:37:26 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Fix 'compatible' schema errors
Date:   Mon, 15 Jul 2019 16:37:25 -0600
Message-Id: <20190715223725.12924-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Aspeed pinctl schema have errors in the 'compatible' schema:

Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements

Flow style sequences have to be quoted if the vales contain ','. Fix
this by using the more common one line per entry formatting.

Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema")
Fixes: 07457937bb5c ("dt-bindings: pinctrl: aspeed: Convert AST2400 bindings to json-schema")
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 4 +++-
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 61a110a7db8a..125599a2dc5e 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -22,7 +22,9 @@ description: |+
 
 properties:
   compatible:
-    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
+    enum:
+      - aspeed,ast2400-pinctrl
+      - aspeed,g4-pinctrl
 
 patternProperties:
   '^.*$':
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index cf561bd55128..a464cfa0cba3 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -22,7 +22,9 @@ description: |+
 
 properties:
   compatible:
-    enum: [ aspeed,ast2500-pinctrl, aspeed,g5-pinctrl ]
+    enum:
+      - aspeed,ast2500-pinctrl
+      - aspeed,g5-pinctrl
   aspeed,external-nodes:
     minItems: 2
     maxItems: 2
-- 
2.20.1

