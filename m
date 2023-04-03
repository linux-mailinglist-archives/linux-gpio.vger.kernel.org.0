Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 920666D4F9A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 19:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjDCRxw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 13:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbjDCRxu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 13:53:50 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001592D7F
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 10:53:29 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5416698e889so567446787b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680544409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQO/GmpqLMEjtyr2atFB1M1H+ye6V/kPyFsUarcG0ic=;
        b=MXb6iL/HFXndej/CtEHNUvhgkCghuRYHFdCUjltYevYE9g6PVv/wflCUlYJVtPNw8L
         Wki2KsSIlx6Q33pfCVPcwZsmVns9GsSC4pjvOABViPyjTOIkjv+A/EeT2j67IHsY7huX
         8rafwtkUTK2XrwS7MazWNSxnSYbIr9JZ10Y6wjOWGnfrLYdolcytyRXilJKc63uncGzu
         No15Q4oJeqTJsyKYjah39PjR59XDUlmB9gWpAgEZxlN8GBp50F2/3h7SXDDen7ZnkA7B
         8t8phSKcJSJUgiTovPg+nrSVQqznek/2FljSjGjaW0TKOo34l6FtVcdWTSRg4a2Rx5zR
         zMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680544409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQO/GmpqLMEjtyr2atFB1M1H+ye6V/kPyFsUarcG0ic=;
        b=WCwkFhqIN05wxWCH0mVTqtHJb16A05O3if3Rg8HOMcsd0CfUc6JzQb3pNy/RfyFkKB
         8OXA7GrdZn8WTBW9HTqYKqruuUBlM+mp5vec+dP/YOlIF1Rfjc6wP5rIHZwcWIEexzsR
         7oLpWBayeKvT38CJOYWtnKie/J0qtq7vHOIRrdPmO+DzlloKk8TtzyMdNvxaGsqJymdJ
         1VM8k2nH8Vk/LKa1VLD13AgWfPc7sO0mRZv6bi3Zxu5MYd1PC/6LlrapO3ScWGjv1XdB
         qwIJ6ugYJ+c7+0E5VijQC2Z+R7WSsOYvkgyiBf1fzGvgRut4WMWtddWldopi14ulkCCS
         K8GA==
X-Gm-Message-State: AAQBX9fCf8CdIwXdt95ahlge8mEApIVYgr6djYCASqMzQA8WgRIH7yXU
        2a7ZfH+Nk7r0Pr9SBVtdwFuVBQ==
X-Google-Smtp-Source: AKy350bSFMd7XG8DGXPuPuVKSAbI8PI0Gs4lG8jTUxk69faGT/KbNU5FUpeDrQvn2OJKzeiuRqk5NA==
X-Received: by 2002:a81:5ad4:0:b0:538:5106:b41b with SMTP id o203-20020a815ad4000000b005385106b41bmr35592135ywb.32.1680544409017;
        Mon, 03 Apr 2023 10:53:29 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id z135-20020a814c8d000000b00545a08184adsm2661663ywa.61.2023.04.03.10.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 10:53:28 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 2/2] gpio: 104-idi-48: Enable use_raw_spinlock for idi48_regmap_config
Date:   Mon,  3 Apr 2023 13:53:14 -0400
Message-Id: <005eaf8c2094581025eb5273e2c669a676b12d08.1680543810.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680543810.git.william.gray@linaro.org>
References: <cover.1680543810.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The idi48 regmap can be used in an interrupt context by regmap-irq. To
prevent a deadlock, enable use_raw_spinlock for idi48_regmap_config.

Fixes: e28432a77365 ("gpio: 104-idi-48: Migrate to the regmap-irq API")
Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-104-idi-48.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index ca2175b84e24..ba73ee9c0c29 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -81,6 +81,7 @@ static const struct regmap_config idi48_regmap_config = {
 	.wr_table = &idi_48_wr_table,
 	.rd_table = &idi_48_rd_table,
 	.precious_table = &idi_48_precious_table,
+	.use_raw_spinlock = true,
 };
 
 #define IDI48_NGPIO 48
-- 
2.39.2

