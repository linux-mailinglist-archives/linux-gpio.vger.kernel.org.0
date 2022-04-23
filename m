Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7051050C8C2
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 11:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbiDWJoo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Apr 2022 05:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234560AbiDWJoo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Apr 2022 05:44:44 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD76C81197
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 02:41:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g13so20676404ejb.4
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J8b5hHd3ZE3FnDrXjojFeKTkNnb5II0lx5j41yJu2D4=;
        b=EKe5ShPRw7fZLZ6AFGwQlwGxyW41/UhYFAYrqo+HZI74rMdiSh83jGNz8R9n+ZU6F3
         hHIYIKWf8HtkUsV+dKRC7uOfkq1ryLosNyeL9UcJd1+HNoFyYwTHuqODjtwerAJfpa8e
         2wJ9Cp62IbrsXhiWdUpzOaRxTCIeMOkIBbb2hAy9qVftqdA9fNzL+0ZIqCqKEbnvVQgM
         AEcy+L5rjYYLY99JVqKCqXW0toemXwG6Lg4Ctvy11ESCZ+3U7JWv9UX0spDu5TzgQS0r
         WTQwTQBVQUGNvPTMUhhCxAufcNU4XCGELOHq8G8IXjf8rdEyJPYLElgJ6/WryQzuNxIU
         Ff5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J8b5hHd3ZE3FnDrXjojFeKTkNnb5II0lx5j41yJu2D4=;
        b=4eimbQgDc3bBLeLY65vHAlaipXBkWVZMmiy4BxcIODKdx5xUnXKQ5aV+Ef9W9QaxBc
         jkmZnfyMt6vwRsIfWcX0kEsk6qW5LlqpJ6a2/9lQaGjRb3m+CvOnaxWhRcglc5Nw/baB
         iqyO2a2BVzEzVbI3lKXwAc8r8k1mAsMP8LZUDLu5miwE+wAjp1asGLE8L6HQitlZIX8K
         Piifa2CtqQ4WUBERKgt/4nxQKZAYAYotMNKYZhrc++fHoRgPowl9N5wxsOlyHm2IpCbY
         AmNJQpSNDilLyvRfOTlGufxkDaBQbnkJgJU2ZTEK7P2JLhVB7KIFTbLasiGhrmDq2bvH
         KNaA==
X-Gm-Message-State: AOAM530d1EotKMitIwmegDqJYqRlJoKwW324JwFSKhwLWmcME7iTf5vt
        Dxp6J6wkCXC4QaGM4fpE6Q1n/w==
X-Google-Smtp-Source: ABdhPJz5g26SwBjbBClehKHJMS4wxlXlvnlGg5xTV8ATk3J7H+AteEMkJtNki1MW7iOhNoZI2XgOiw==
X-Received: by 2002:a17:906:c14a:b0:6e8:76d0:e0eb with SMTP id dp10-20020a170906c14a00b006e876d0e0ebmr7567035ejc.412.1650706906337;
        Sat, 23 Apr 2022 02:41:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 22-20020a508e16000000b00425c9d1704bsm975910edw.4.2022.04.23.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 02:41:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] pinctrl: mvebu: Fix irq_of_parse_and_map() return value
Date:   Sat, 23 Apr 2022 11:41:41 +0200
Message-Id: <20220423094142.33013-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: 2f227605394b ("pinctrl: armada-37xx: Add irqchip support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None.
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index ef4118e49f16..a140b6bfbfaa 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -764,7 +764,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	for (i = 0; i < nr_irq_parent; i++) {
 		int irq = irq_of_parse_and_map(np, i);
 
-		if (irq < 0)
+		if (!irq)
 			continue;
 		girq->parents[i] = irq;
 	}
-- 
2.32.0

