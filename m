Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773FE62DB06
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 13:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbiKQMgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 07:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239709AbiKQMfy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 07:35:54 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36E1BCB7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:35:52 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id y16so3561329wrt.12
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=65wbv6UpRqZPyPYUp0b9oWo0CYAIrP/UXeAdfgfEqzg=;
        b=oqhbTUa2ENAIrqE0Ahcy+s3t+4ZblcKFr6om4YGkYrvHTBGbRHpSmj6E6oJOWXcIqT
         4vVRbjXxBWSrcP+YH3zWpK4cy7HaCrball3R0fQfGi9/HyjzKkV5l/N8HDBrb4pHHgpH
         b7irlr8Sg2oxMvR4eWiSVNrGoCE7NmnQ2eJn0xxpGt8CJFu5LsGtgzztHJPgm4QpiDZR
         Lj0yc/bHMKDWKShNHkx8pNkdxh4QmZlNak7P3B6Y+9D5veY/Bj5x9ee/IpBnF1Xtxk9L
         0DadV6gEff5C23xhg1h5OYs5aqIOij78np9sGNy0jg01GxFZQcvtFSvtXRMY5AZsFBBX
         TM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65wbv6UpRqZPyPYUp0b9oWo0CYAIrP/UXeAdfgfEqzg=;
        b=USYQ813nuHcIMsv5xn97zVN7Oakdlpc7YPiJGiuAxWANpooUA8fpSaNG5sknMS51Gq
         AHaRSHrcXMLVygyKt/ILd7+vU/lRajDwsZMZUV1prainPcDicEcr5QJi6xyPKh3Sog2u
         FMzylpphb0Zp26zg55sW3YEH3d3qnffUQi9mZxDxfx/1cSLWPNDbeO4KBYmuBNWQEOs8
         ZvXtYtnKfUQN+16qGR5VKMgKxDAxXojbEPjQSC6uw6YMtzT46JHfjMIfv5foSR+i3kZ6
         q/sNIzi66A5623Nx/azhtVtaS99Cv4iymi0/Xmocl8J4dTh5LCos6mtXLudbLA51TrsF
         HLfw==
X-Gm-Message-State: ANoB5plf7urgjtLgglslfGsEm+i+BlvZvO89NujyRSQk6UQ2k4X6u6eS
        n6v5nQNzJtiEwG7xWYaDn3B7kcH931LDCA==
X-Google-Smtp-Source: AA0mqf5l1+mU96YDLrF4spwL7U03ZXVRhbw5/kt4kDNglSDZN5nWzcn/ar11Szi/SpD+g9Ou+XU6/w==
X-Received: by 2002:a05:6000:1108:b0:235:8867:50bf with SMTP id z8-20020a056000110800b00235886750bfmr1366223wrw.193.1668688550931;
        Thu, 17 Nov 2022 04:35:50 -0800 (PST)
Received: from localhost.localdomain ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m6-20020a056000024600b00236705daefesm887942wrz.39.2022.11.17.04.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 04:35:50 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH] pinconf-generic: fix style issues in pin_config_param doc
Date:   Thu, 17 Nov 2022 12:35:42 +0000
Message-Id: <20221117123542.1154252-1-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes following issues introduced in a  previous commit
to clarify values for pin config pull up and down types.

- replace spaces with tabs to be consistent with rest of the doc
- use capitalization for unit (ohms -> Ohms)

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 include/linux/pinctrl/pinconf-generic.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 11e7394bcc70..537064a997a5 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -36,7 +36,7 @@ struct pinctrl_map;
  * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with high
  *	impedance to GROUND). If the argument is != 0 pull-down is enabled,
  *	the value is interpreted by the driver and can be custom or an SI unit
- *  such as ohms.
+ *  	such as Ohms.
  * @PIN_CONFIG_BIAS_PULL_PIN_DEFAULT: the pin will be pulled up or down based
  *	on embedded knowledge of the controller hardware, like current mux
  *	function. The pull direction and possibly strength too will normally
@@ -48,7 +48,7 @@ struct pinctrl_map;
  * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
  *	impedance to VDD). If the argument is != 0 pull-up is enabled,
  *	the value is interpreted by the driver and can be custom or an SI unit
- *  such as ohms.
+ *	such as Ohms.
  * @PIN_CONFIG_DRIVE_OPEN_DRAIN: the pin will be driven with open drain (open
  *	collector) which means it is usually wired with other output ports
  *	which are then pulled up with an external resistor. Setting this
-- 
2.25.1

