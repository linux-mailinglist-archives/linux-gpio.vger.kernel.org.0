Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFFE69F24
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 00:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730940AbfGOWso (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 18:48:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41503 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730912AbfGOWso (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jul 2019 18:48:44 -0400
Received: by mail-io1-f65.google.com with SMTP id j5so32630485ioj.8;
        Mon, 15 Jul 2019 15:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDVgMC3pgMI66Qfbn4dKj97wxKc85WWhYTVyq+wpXho=;
        b=R3lZyxu+Gjt2hWMNXZ76XUtLOlilTejJyHjfoA/BnS8hM6X0xOv/jhq2RfrfGIDBNV
         wcZ65qDYDJv9SkDCh+BNCSMVL7w55hGvXumBSvvGt+uuxYFHhu9ZyniwwwFrDyiec/ug
         7/zXoVrnkQPhgOVYvwBohJEKTnBPGGn8tCI5p9/16axR4cfkuSyGEDmtL+/M5TQ/TKMC
         csfJ3yqHzyvbLlLbn5A4yjZZNaEKn6S8sbz8Mpp7Msc9amH9pKmK6q2g9n5Kl1FcrqhU
         HACQJmqU9TxqI6wvDKc6jYNcL+XyaBA5b4JGGe66j8dS9ohBk0NKq8aFo4+qIq9/E50d
         wFMw==
X-Gm-Message-State: APjAAAXUeMou2LmLY5XyMThiZ/zO2SrLxEWgaPVYeV4HjtGDZ6c8RUgF
        qGJvtF9DTt0sse0gwsIt8aBR3XE=
X-Google-Smtp-Source: APXvYqzgHu4vzbb6DbWm2vals8wB1vp8H0ICorDGecZ9nvzGessLbPgiUZ0qbKixMnW6J9/fMT2+xg==
X-Received: by 2002:a05:6602:219a:: with SMTP id b26mr4773812iob.55.1563230923181;
        Mon, 15 Jul 2019 15:48:43 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
        by smtp.googlemail.com with ESMTPSA id t14sm17185778ioi.60.2019.07.15.15.48.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 15:48:42 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Fix AST2500 example errors
Date:   Mon, 15 Jul 2019 16:48:41 -0600
Message-Id: <20190715224841.6771-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The schema examples are now validated against the schema itself. The
AST2500 pinctrl schema has a couple of errors:

Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
example-0: $nodename:0: 'example-0' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.example.dt.yaml: \
pinctrl: aspeed,external-nodes: [[1, 2]] is too short

Fixes: 0a617de16730 ("dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema")
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index a464cfa0cba3..3e6d85318577 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -76,9 +76,6 @@ required:
 
 examples:
   - |
-    compatible = "simple-bus";
-    ranges;
-
     apb {
         compatible = "simple-bus";
         #address-cells = <1>;
@@ -91,7 +88,7 @@ examples:
 
             pinctrl: pinctrl {
                 compatible = "aspeed,g5-pinctrl";
-                aspeed,external-nodes = <&gfx &lhc>;
+                aspeed,external-nodes = <&gfx>, <&lhc>;
 
                 pinctrl_i2c3_default: i2c3_default {
                     function = "I2C3";
-- 
2.20.1

