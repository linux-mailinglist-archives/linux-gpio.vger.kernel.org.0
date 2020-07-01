Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF336210252
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 05:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgGADIQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 23:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgGADIQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 23:08:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AE5C061755;
        Tue, 30 Jun 2020 20:08:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so21620721wml.3;
        Tue, 30 Jun 2020 20:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kp+AZ2OQpkgYzsEUEsvF13veFsMd10pQS3JPgn4R6Ng=;
        b=CG0eRdM4nSGcNNL81fuuo8W+TEO3HxqCIUhHH01sJ2+wYiauylNYzArgI5NTEfbhfz
         mKeYTXR0ghYspwz0JBT9vrHKY70ZaxUi6d6c5WX+UZu5B+FkVAd99OR6MAZST5dT1Eh/
         jdvi55lWYMtQ5uLpZHWcXMwKcK87MNxHQ0X2rSxkh3+hU2iVl1kLXJ067qDH2vLPtYXn
         sYtZnLzyG33k+NEx45qYpr3PeX8CVeFoEnqmPJUM107iX8mbVgqrsAYlmDmNtFB34BIq
         wV28hUqcjRBGmIW3VUOkw83YjowV1MKdYeVLsSkZBpwCoTVewspNH/xwYdzBE7iXHTOD
         mrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Kp+AZ2OQpkgYzsEUEsvF13veFsMd10pQS3JPgn4R6Ng=;
        b=izJQrB4G8UIrKMkHOY/byhXG0CBXCJFeH9CJnYPZ6o+/p77YYd70J1dEpQ/p/J+3tS
         lVEkCtInsrPLk6g9OCepFPNUkt40dlZcBgKroIEm+5lIfLRFSpLirHlRl8z8PCaPfxJx
         oMEiE6O474Kq7shQ4bZAwCZglVevlWvXHDimHii4/ha3wMgs6BvlH61OvKOwZdWq/BwM
         87AdGf0PGiG+2zGc5zkf9nRe8eTX02eC3DvAmP3U5uOXNb6bGtMJnPjf0BISRz6uCvoJ
         C9hpF73/qCnKQbJuBudCAqSLaq5cWy8MJemmQ19iSsLfBfuRtQKrz6OKBeNmFdSnGcaO
         onAA==
X-Gm-Message-State: AOAM531EGy6XKQUCASNFC4/V/SSU0j3/6oKP1IdKfzOhcd2tpHiI6zfd
        a1jzGWESAdcImfUrJ1UPEzo=
X-Google-Smtp-Source: ABdhPJyp2dS0CMUbwyVCAerk4TlBJ87yWOY9msqe2AJenQdsul7dqdlDD+8tUTPPvHvvLJ5/S69IXw==
X-Received: by 2002:a1c:bc54:: with SMTP id m81mr17607509wmf.22.1593572894543;
        Tue, 30 Jun 2020 20:08:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id q1sm5515702wro.82.2020.06.30.20.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 20:08:14 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: aspeed: Describe the heartbeat function on ball Y23
Date:   Wed,  1 Jul 2020 12:37:56 +0930
Message-Id: <20200701030756.2834657-1-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andrew Jeffery <andrew@aj.id.au>

The default pinmux configuration for Y23 is to route a heartbeat to
drive a LED. Previous revisions of the AST2600 datasheet did not include
a description of this function.

Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index fa32c3e9c9d1..7efe6dbe4398 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -46,6 +46,7 @@
 #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
 #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
 #define SCU694		0x694 /* Multi-function Pin Control #25 */
+#define SCU69C		0x69C /* Multi-function Pin Control #27 */
 #define SCUC20		0xC20 /* PCIE configuration Setting Control */
 
 #define ASPEED_G6_NR_PINS 256
@@ -819,11 +820,13 @@ FUNC_DECL_2(PWM14, PWM14G0, PWM14G1);
 #define Y23 127
 SIG_EXPR_LIST_DECL_SEMG(Y23, PWM15, PWM15G1, PWM15, SIG_DESC_SET(SCU41C, 31));
 SIG_EXPR_LIST_DECL_SESG(Y23, THRUOUT3, THRU3, SIG_DESC_SET(SCU4BC, 31));
-PIN_DECL_2(Y23, GPIOP7, PWM15, THRUOUT3);
+SIG_EXPR_LIST_DECL_SESG(Y23, HEARTBEAT, HEARTBEAT, SIG_DESC_SET(SCU69C, 31));
+PIN_DECL_3(Y23, GPIOP7, PWM15, THRUOUT3, HEARTBEAT);
 GROUP_DECL(PWM15G1, Y23);
 FUNC_DECL_2(PWM15, PWM15G0, PWM15G1);
 
 FUNC_GROUP_DECL(THRU3, AB24, Y23);
+FUNC_GROUP_DECL(HEARTBEAT, Y23);
 
 #define AA25 128
 SSSF_PIN_DECL(AA25, GPIOQ0, TACH0, SIG_DESC_SET(SCU430, 0));
@@ -1920,6 +1923,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(GPIU5),
 	ASPEED_PINCTRL_GROUP(GPIU6),
 	ASPEED_PINCTRL_GROUP(GPIU7),
+	ASPEED_PINCTRL_GROUP(HEARTBEAT),
 	ASPEED_PINCTRL_GROUP(HVI3C3),
 	ASPEED_PINCTRL_GROUP(HVI3C4),
 	ASPEED_PINCTRL_GROUP(I2C1),
@@ -2158,6 +2162,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(GPIU5),
 	ASPEED_PINCTRL_FUNC(GPIU6),
 	ASPEED_PINCTRL_FUNC(GPIU7),
+	ASPEED_PINCTRL_FUNC(HEARTBEAT),
 	ASPEED_PINCTRL_FUNC(I2C1),
 	ASPEED_PINCTRL_FUNC(I2C10),
 	ASPEED_PINCTRL_FUNC(I2C11),
-- 
2.27.0

