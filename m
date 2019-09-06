Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930FEAB26A
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 08:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391832AbfIFGZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 02:25:59 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38130 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfIFGZ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 02:25:58 -0400
Received: by mail-pl1-f196.google.com with SMTP id w11so2636362plp.5;
        Thu, 05 Sep 2019 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nRxcumHCoieD4YHhJDBwA9IBTCoCwLTVhc9o3nRRDkI=;
        b=ADimNP2ND3VOH2ln0p+yNfF/DGU2qkBipN72ljAr/PczQvTfbrKsX07vY8Zdwngoar
         LhdZEUosmuWvZxdURnHwN7oYANLXkw1O7D6cD5OJp5+/tCkczEX/nk5v6+w2CXfSDCk9
         L8eHl7xI6P/RcTjbsUVJuQNkq6YLcLN6H3OV6ApvAePbpWSpsOyYEqqqvMNYFtcxKvQR
         cbG2R/hIbwiZcQaSbzwjgw2yVtC0T4zgOKxeF049FwRTUIo7ETmaEAstIajleYpZtZKM
         C42BxBvR8hUAH8v2LxsxzjNdxPxoxqeK2II8PyPVrsFPJubqbesfhTTe9RIflLXv6b83
         6QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nRxcumHCoieD4YHhJDBwA9IBTCoCwLTVhc9o3nRRDkI=;
        b=MuW1ggQqkU0Wkossy8PGyQMQQyKS0Ee8dYjwcZeyh15DipREOpoBdZnzUL+cLD/vCR
         5aoWbUR0bPcGGbuDePqda/bvHZMNb4Wq+QdkGW3Saxsg80+FVhNC7lnkog783Dp0uCqq
         0RAPQvwsN7P7RbDJXE4mnH+EsFOp8Y/lK3io2LLNd0ZM5uafd/5vcc6/59929hRbYaub
         eLCTX3Zr8g0nT2TR9Y2VNmkl1AZi042cF8VAuPFxEjV5AzMbX+lBUZ1TU+aehuM1V3RG
         7Y1Tjdt3G6Z0xFkatiIsHS30s3+50yoaUOeOAKbXr5sFCTk8nKa+4pn3oED7yfH/LZCR
         WZGw==
X-Gm-Message-State: APjAAAWCRiOD6wv5iqU3+dLiYa80cYYHB7+tUpRX+wh5dq8JeWXdZeL7
        Yt80/Avzgcep1RmrAMYnt8oBHwknFqU=
X-Google-Smtp-Source: APXvYqxAHm7TEMjvZZG+IKwNgVMQW4iXvRHQ3UYm4fIeZ5CGft2zoBZMr3vCIp78S9acysQdbufG3A==
X-Received: by 2002:a17:902:748b:: with SMTP id h11mr7587383pll.269.1567751158029;
        Thu, 05 Sep 2019 23:25:58 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id y192sm6244998pfg.141.2019.09.05.23.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 23:25:57 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/5] dt-bindings: gpio: aspeed: Update documentation with ast2600 controllers
Date:   Fri,  6 Sep 2019 16:25:47 +1000
Message-Id: <20190906062547.13264-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
Additionally, it has a GPIO controller for 36 1.8V GPIO pins.  We use
the ngpio property to differentiate between these controllers.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 7e9b586770b0..b2033fc3a71a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
 -------------------------------------------
 
 Required properties:
-- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
+					or "aspeed,ast2600-gpio".
 
 - #gpio-cells 		: Should be two
 			  - First cell is the GPIO line number
@@ -17,7 +18,9 @@ Required properties:
 
 Optional properties:
 
-- clocks                : A phandle to the clock to use for debounce timings
+- clocks		: A phandle to the clock to use for debounce timings
+- ngpios		: Number of GPIOs controlled by this controller. Should	be set
+				  when there are multiple GPIO controllers on a SoC (ast2600).
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
-- 
2.20.1

