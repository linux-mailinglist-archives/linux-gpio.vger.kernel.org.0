Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C50821D91B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 16:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbgGMOtq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 10:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730132AbgGMOtn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 10:49:43 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B8DC061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l17so13607029wmj.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=we+FYdI1lkoYeqfH+hTSe6pNVLsfmTg5CRQP3bOvglU=;
        b=U1WN0X53vbT4MvhLNRle/Pi49aoyXp8l/FZ9qbfpELXVGRvwteyYQ59YIS581Rx0Xp
         q5UQZNPMwm4gbhy2sGnmyUhu+w/WSyDy8SZwq5gc7YFHp11qt2IevOUpEE0bd15DH/8G
         F0tLllXkjBOGT94L/jRw4tRXmh6xUXZ42RV3KnfYe23GHPr8WB7Izy+DlVxJwv3uNcH3
         spPTiORGerSbhn1gcD3+8ZhgKGlr3WTLewuQPjCmNoxXAWdMLet04UicbcIPSh9F7Dh8
         3s3nrgW8efZiHQaPyILOHhsm0gTtGvlZ75SUX8Oby7yTHrd4vKHUhLfTND2frhv/Mv0y
         EjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=we+FYdI1lkoYeqfH+hTSe6pNVLsfmTg5CRQP3bOvglU=;
        b=TryiporHqG311cGIybrKdzk8dVLuDyc39eNHgD5TipCzIL8REVA2jSfvCruyLSzIuT
         j7tL4gUV1FtpVFFWLSW3+TFOCQLhjqnkwDxi5H1O9ScY3oDD23gPu7mIRjpuk9NCTLJE
         48KNboF5/W1ZdYKVQb77wmXW0HSnbzMVV8g0irBGXbGtb5R2QAL6c/LoyLoO+pCyPtm8
         7HOhgMDaLoa7vlGy3r29hHS7D80z4bV0ZXY9efOPwwFMy1D+Xw88CrQPd9c2a6T2GXgx
         22xQpM8WtX+2+3Nh8g4V7q+LWFuNcYb2Nw0g97GoAkQaBBKqvL/QyNPJor40r+shLeV3
         qcTg==
X-Gm-Message-State: AOAM532RpCZs4kTEmWLfbGH4hIfh+vrZ982E29TRLfEyW7VIdjohblGU
        /xx3OYY6sdZaE1UNkt7paMHJsg==
X-Google-Smtp-Source: ABdhPJxoVsuUxdjQrc3CM3WbousZGi/1/+jQn4P+0A7iaqIru6LA4EJm04rEqpNRn1DujBpLMkOpjw==
X-Received: by 2002:a1c:c242:: with SMTP id s63mr311154wmf.146.1594651781752;
        Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 08/25] pinctrl: samsung: pinctrl-s3c64xx: Fix formatting issues
Date:   Mon, 13 Jul 2020 15:49:13 +0100
Message-Id: <20200713144930.1034632-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kerneldoc struct titles must be followed by whitespace else the
checker gets confused.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/samsung/pinctrl-s3c64xx.c:212: warning: cannot understand function prototype: 'struct s3c64xx_eint0_domain_data '

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index f97f8179f2b1b..b8166e3fe4cef 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -193,7 +193,7 @@ static const struct samsung_pin_bank_type bank_type_2bit_alive = {
 	}
 
 /**
- * struct s3c64xx_eint0_data: EINT0 common data
+ * struct s3c64xx_eint0_data - EINT0 common data
  * @drvdata: pin controller driver data
  * @domains: IRQ domains of particular EINT0 interrupts
  * @pins: pin offsets inside of banks of particular EINT0 interrupts
@@ -205,7 +205,7 @@ struct s3c64xx_eint0_data {
 };
 
 /**
- * struct s3c64xx_eint0_domain_data: EINT0 per-domain data
+ * struct s3c64xx_eint0_domain_data - EINT0 per-domain data
  * @bank: pin bank related to the domain
  * @eints: EINT0 interrupts related to the domain
  */
@@ -215,7 +215,7 @@ struct s3c64xx_eint0_domain_data {
 };
 
 /**
- * struct s3c64xx_eint_gpio_data: GPIO EINT data
+ * struct s3c64xx_eint_gpio_data - GPIO EINT data
  * @drvdata: pin controller driver data
  * @domains: array of domains related to EINT interrupt groups
  */
-- 
2.25.1

