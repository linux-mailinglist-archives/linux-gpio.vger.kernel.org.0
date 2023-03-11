Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5246B5ACE
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 12:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjCKLN0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 06:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCKLNT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 06:13:19 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5A8CDDF
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:13:12 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id er25so2589940edb.5
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKcG3ySBRe5JuI6NeHmlPILSvTUD+lUq9m6at8uAk5A=;
        b=n2Rvr7kl1IYJajnq0ldv2bkSaydwwJ3o1ZvlrlgBQKI0Xc9n/dtV7g0C9DOkOM/kCl
         i0mKGhJKduSBD3dJJXjgtnYvaxxkzgPU/xyR2+1QpPGKnK0c7AYrQ3JvwiKnZcNmgqn6
         VfCci2mLOlirUQEbj2a41FiOmbSGBMRO2c0SPI6ppJ0DmPTHielB4c5ff6AtRlkdH0QK
         MAB1G1WVWt4SaT4DZ3oq0dF0CWk5PzgS3EdugtyxMIc2IiwoP789e7oi0zQz+fyNn/52
         BadOh8pP/nQbg9PXDBK7XtbDb63kbAcIfTw+cRVH2RDgjg4y8yiRrJEjZFrg2Qty9Snp
         TLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKcG3ySBRe5JuI6NeHmlPILSvTUD+lUq9m6at8uAk5A=;
        b=f7jBp6ZNkYOCCTo5h1Raisy/W4pXgl0k1CfYLmcRE68IRe7llRKogK1NzS8lLRMqdQ
         rAcXcPA02KUmMVj9g2Jv0lWJQux8qfaU7pMse5UHJx/N89+IPs5WSAnhzj0zJrbjK7WT
         sxCDCftQgfDJval/F1Q9FyL7hNw8MIfzjqBf8aw+aapVIwAyDW1eE0DndVxgbruYQMRm
         XE5S09P8CJ/EOk40zUYUPqkJ8rb8uEam8MOF7A1NmkWhhfz+gRyaG70jl5Q17BWTPw63
         Ujy5kYiJnJmVxdSjWS6UPTgjiJdOWAl9XAZ2B8SOr3pO0wYR5qwXcf29DPbqIkJxcO2D
         KAyw==
X-Gm-Message-State: AO0yUKVl/pyb6RObw4J6DzMqrJvr7f6WcdUvkoO6x6jq23muuudOIxHT
        HwZyu5UYjUEGj0ZixrA+RsVWyA==
X-Google-Smtp-Source: AK7set+YBcaMtvHO4ngFhPGNllDoFAkHQQFm1NFBgnehBp2jMGVV6Aj/CbmzzUXu/tDdio+14jWZJw==
X-Received: by 2002:a17:907:6da3:b0:878:50f7:a35a with SMTP id sb35-20020a1709076da300b0087850f7a35amr35308557ejc.72.1678533190497;
        Sat, 11 Mar 2023 03:13:10 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/8] gpio: altera: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 12:13:01 +0100
Message-Id: <20230311111307.251123-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/gpio/gpio-altera.c:324:34: error: ‘altera_gpio_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 99e137f8097e..c9158b5230f6 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -330,7 +330,7 @@ MODULE_DEVICE_TABLE(of, altera_gpio_of_match);
 static struct platform_driver altera_gpio_driver = {
 	.driver = {
 		.name	= "altera_gpio",
-		.of_match_table = of_match_ptr(altera_gpio_of_match),
+		.of_match_table = altera_gpio_of_match,
 	},
 	.probe		= altera_gpio_probe,
 	.remove		= altera_gpio_remove,
-- 
2.34.1

