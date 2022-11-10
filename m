Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17DE624A63
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 20:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiKJTNc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 14:13:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbiKJTN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 14:13:27 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C79B15
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:25 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id h133-20020a1c218b000000b003cf4d389c41so4146136wmh.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTMzmDnHuNaa5mhTxvMD0VcD1tdH8kw6heaICPQ2NMs=;
        b=wRVNzlHCucZKEJu/0XOifX1jjSXXTLJp8AmN/0TxWUZCnTRsJhtW3vL1gchfxCxrqm
         Ra/KV+b708LLmf8QJLrJ1jsCr4sJ/73UUeHxg0VXjYgst3/OuR7YKtKi5e3e0y8DY5Hr
         vQ5oONH4uFupyU/h6cBal54B/5MGaAljEsd9WVeG9MKtLEFRemJW4nh9OSYFVLEJWr+o
         2g/9h3iKpW76KSjmhEQM2+/mNBDvcPYR33Piy4VzhRfXVG3fkEqeNAxpN76QpjHpa/VM
         y4n0ah0WsVJSXLLJje5elfF6S+v+opDvDYZfhRH6u+LYFLY58ohfXPq8f8VsusVBR5gS
         b7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTMzmDnHuNaa5mhTxvMD0VcD1tdH8kw6heaICPQ2NMs=;
        b=A8QSAHrxfz7fby5aVeqmT/Kxkuna1b6dglwbnvqTXl6sLJKuzc/kXvQFXxrptQkorz
         piiNa4si4MsoNPmzx0jAnEOSeHHh+EkkSDUGR4ISjlozUedDg9tnWaDqmJ/0YbowS3n5
         mTaIxbSjRYaRHeS1AGTBNaAW9sr+ANReEjd8kZ4N/9KbYDtAideGiwICegoihOhQbDws
         /BZLQtZtDGY9Gn5wEQzNuflyq7knJUJolhFSe2TTyB2d0SbQ0GGBJ2EGbB0ucwBFpkB4
         onclzu0XdiF22+KdDZJUtvSZ0/KfxRSEgyMklw5rem/Vc4YFwNjOt4bWZEnUa7RDIgpF
         H27g==
X-Gm-Message-State: ANoB5pl6ES4vYPtSOqGogLQ156qCS9ep9PND6L546mQPU9U72LmPa7nX
        ERjqMWYaePb8Ubcq+pGqFDOLiNfrk5/WqA==
X-Google-Smtp-Source: AA0mqf5TjN0bn6AXgrqA7CHe2F9NKapqjEym5jY2xBT0468AueYW0P5SZTAzgJxodnTU+XpBaP5wnw==
X-Received: by 2002:a05:600c:4186:b0:3cf:c55b:9d78 with SMTP id p6-20020a05600c418600b003cfc55b9d78mr2804719wmh.174.1668107603668;
        Thu, 10 Nov 2022 11:13:23 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id bk28-20020a0560001d9c00b002365b759b65sm17025102wrb.86.2022.11.10.11.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:13:23 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC 2/3] pinconf-generic: add pull up and pull down config with resistance
Date:   Thu, 10 Nov 2022 19:12:57 +0000
Message-Id: <20221110191258.1134378-3-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110191258.1134378-1-niyas.sait@linaro.org>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
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

pin configuration types have been extended to include a pull up
and pull down config with resistance in ohms.

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 include/linux/pinctrl/pinconf-generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 2422211d6a5a..57e4b364e877 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -36,6 +36,8 @@ struct pinctrl_map;
  * @PIN_CONFIG_BIAS_PULL_DOWN: the pin will be pulled down (usually with high
  *	impedance to GROUND). If the argument is != 0 pull-down is enabled,
  *	if it is 0, pull-down is total, i.e. the pin is connected to GROUND.
+ * @PIN_CONFIG_BIAS_PULL_DOWN_OHMS: the pin will be pulled down with value
+ *  passed as argument. The argument is in ohms.
  * @PIN_CONFIG_BIAS_PULL_PIN_DEFAULT: the pin will be pulled up or down based
  *	on embedded knowledge of the controller hardware, like current mux
  *	function. The pull direction and possibly strength too will normally
@@ -47,6 +49,8 @@ struct pinctrl_map;
  * @PIN_CONFIG_BIAS_PULL_UP: the pin will be pulled up (usually with high
  *	impedance to VDD). If the argument is != 0 pull-up is enabled,
  *	if it is 0, pull-up is total, i.e. the pin is connected to VDD.
+  * @PIN_CONFIG_BIAS_PULL_UP_OHMS: the pin will be pulled up with value
+  * passed as argument. The argument is in ohms.
  * @PIN_CONFIG_DRIVE_OPEN_DRAIN: the pin will be driven with open drain (open
  *	collector) which means it is usually wired with other output ports
  *	which are then pulled up with an external resistor. Setting this
@@ -116,8 +120,10 @@ enum pin_config_param {
 	PIN_CONFIG_BIAS_DISABLE,
 	PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
 	PIN_CONFIG_BIAS_PULL_DOWN,
+	PIN_CONFIG_BIAS_PULL_DOWN_OHMS,
 	PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
 	PIN_CONFIG_BIAS_PULL_UP,
+	PIN_CONFIG_BIAS_PULL_UP_OHMS,
 	PIN_CONFIG_DRIVE_OPEN_DRAIN,
 	PIN_CONFIG_DRIVE_OPEN_SOURCE,
 	PIN_CONFIG_DRIVE_PUSH_PULL,
-- 
2.25.1

