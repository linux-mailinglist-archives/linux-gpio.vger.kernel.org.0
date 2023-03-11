Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573936B5B2D
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 12:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjCKLaE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 06:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjCKL3Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 06:29:24 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1217F14724E
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:25:35 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id j11so30794128edq.4
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 03:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vla60hxkVwnjodZl4FnF3exvzWOL+nSLnS08WriKNo=;
        b=D5gG28gWdnct+Z+6S1MGZeQhxUKglcYIICJhtGcYHF1UvV6nAebI4TiFYRAlD61EQ7
         ni1DBCll40k4DmvLmUf1r6NTKXVo79om03j3OsXHo1XKQKOJPJ+1k84qLwwbJC244Aqy
         6H83gtzHEPuo/VEeOoEGyePwlvmvLjlVIITfOszuII4ui1CNj9WL4/TpqLkg0AbojkS1
         o+FuHfXvOSKUtwshSvpYT4omRFVbLNHk/KjfagGorTHM+8vUkz6TbstS16X1YUQWOMV7
         4zy4YcZW4f0XG/JeKjRjEUm5jjOthSfxWWWid4RXzezGAXaWesmbCZtzVsUdvaUt4BNs
         rGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vla60hxkVwnjodZl4FnF3exvzWOL+nSLnS08WriKNo=;
        b=PnQH7yMBhXnyYAJlWY9gb3ZRGeuThK2J4AtsAHDCexih53Z4DBFIHsMxufzUsxtpTV
         M2j3qZH6dAVyr02BrUmPzKsSLUxdEbpA8wFaiBnxhtLhz3aotrivGKFS5cnb/LLcQ/rl
         eVWcP3a7j81k3N0DbFGKESl4tZpA0PBmDt3NFtrcKzYuDD1uPp77KkJtgDx1+UFhYuTn
         y3oEewDx7kI5Ejfk6HnLjBNWjyuIQKD2CtDXksQ77COAUH6xm9YqxHHVMa8Z2HglaeKE
         1XKDp8Yf/0Pafmq7N17OgGDQlH1Nrgpdb1SvYreHH60tPl0C4uqmJj6pb87jVVUi3el1
         wQ3A==
X-Gm-Message-State: AO0yUKV/VNKlJSmAHdM3zxdeBkhA8mhdUwp0NAZ/6T4wGNSQkFcSj2M/
        zdd9GVfSegRUaJX5YizutqEBEQ==
X-Google-Smtp-Source: AK7set/nVIPdHdLWiwaPe4gVuKQl7DnJsaIhi67UsZZqRQtxK+KwZyq4Pnj9MVMNAJBsJfAQS/qhfQ==
X-Received: by 2002:a05:6402:110b:b0:4fa:ba31:6c66 with SMTP id u11-20020a056402110b00b004faba316c66mr821171edv.42.1678533915213;
        Sat, 11 Mar 2023 03:25:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id k10-20020a50c08a000000b004c2158e87e6sm1038041edf.97.2023.03.11.03.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:25:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Nandor Han <nandor.han@ge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: gpio: xra1403: drop Semi Malinen
Date:   Sat, 11 Mar 2023 12:25:13 +0100
Message-Id: <20230311112513.254095-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Emails bounce: 550 5.1.1 No such user - pp

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5383af5d3b45..d73560738f46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23084,7 +23084,6 @@ F:	drivers/i2c/busses/i2c-xlp9xx.c
 
 XRA1403 GPIO EXPANDER
 M:	Nandor Han <nandor.han@ge.com>
-M:	Semi Malinen <semi.malinen@ge.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
-- 
2.34.1

