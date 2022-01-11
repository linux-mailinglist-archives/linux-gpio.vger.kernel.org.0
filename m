Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE3048AC4D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 12:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238304AbiAKLWw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 06:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238685AbiAKLWw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 06:22:52 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A4FC061748
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 03:22:52 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id l8so14450773plt.6
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 03:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EMXmZlFguOt5qjM8Mju3XqareZLrVjvBoxrDlqW40Jg=;
        b=UFLB81h0iX3ZqYtdi07F/FwaSLK2hfrLHRXrm+quboO7VeHcwM5jwLhqE6NRgJ68Mm
         oqkmGHi0Tdk3gJKKrvD93cjMflMetaaCsTxWcDVX6A7icNVuGxJ+RZwWL+V0cK9L5FMx
         Cpv4tzns3Z9SVuL6P+y5hNNuU7+/6YWG9fuUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EMXmZlFguOt5qjM8Mju3XqareZLrVjvBoxrDlqW40Jg=;
        b=ZUTYp29Gl08UC3T5b2yBi0B+/B0IrXM68htFEE01Zpi4dRaU9sMabka4Ibpg6o73DJ
         Q6edBp3lJ1Xd+sFYoeG3hMPTCT347na2SrjRSQXIkTbi5kVYpkJqg4zml0bTeFbX7GyW
         E9cMJLVP3T/9h0QSwroawerqFHXSB26K2NTe2YP6lNQtMgpsmHH2e3scYKT1GU/EXSGI
         IHEybxGXYQ/ClkTHRc3zajN3A7zp2F7G83ea+wx9LPS1KcrW0PhjTigmD+Fj8MqDQYlh
         KcU4mHqXo98opnIJvlsE9DIYOiuzMjWfxuO3NLGKsfxwNdFp5PiU8ZJ51eIwOoa6SRQ6
         EKwQ==
X-Gm-Message-State: AOAM532Dnv4v8eJ7ITxBTXs4OK2jXAlATeHuzeC8zYop+YuKQKI6NjQ2
        DYWRilGvD7yctFp2VCqz5Asiug==
X-Google-Smtp-Source: ABdhPJyGUCS1OeFe84DG12JyMqhdck1JEx4lgTsvVydKsQtX3NxZFt66NL+LGUYUbSR71Xtv63tKYA==
X-Received: by 2002:a17:902:7c05:b0:149:a3b4:934c with SMTP id x5-20020a1709027c0500b00149a3b4934cmr3888753pll.42.1641900171738;
        Tue, 11 Jan 2022 03:22:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
        by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:22:51 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 1/7] pinctrl: pinconf-generic: Print arguments for bias-pull-*
Date:   Tue, 11 Jan 2022 19:22:38 +0800
Message-Id: <20220111112244.1483783-2-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bias-pull-* properties, or PIN_CONFIG_BIAS_PULL_* pin config
parameters, accept optional arguments in ohms denoting the strength of
the pin bias.

Print these values out in debugfs as well.

Fixes: eec450713e5c ("pinctrl: pinconf-generic: Add flag to print arguments")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/pinconf-generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index f8edcc88ac01..415d1df8f46a 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -30,10 +30,10 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_BIAS_BUS_HOLD, "input bias bus hold", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_DISABLE, "input bias disabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, "input bias high impedance", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", NULL, false),
+	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
-				"input bias pull to pin specific state", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", NULL, false),
+				"input bias pull to pin specific state", "ohms", true),
+	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_DRAIN, "output drive open drain", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
-- 
2.34.1.575.g55b058a8bb-goog

