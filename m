Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2F1A2F54
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 08:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfH3GC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 02:02:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38835 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfH3GC3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 02:02:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id o70so3899603pfg.5
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2019 23:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVR5WK7jw8bBtk+96qcPeVzLLFLq4erxKa+SEg0zTgE=;
        b=ZDd2GrcbYhVH1waqmTlIUW+64lcxxjrJYr5RLlBqyCDbUzFHLa3ziiTmSoyUr2P4Jp
         SUyAEu56MzN3geRGuEAbrAqJbbpFqLQgwOYvAvZX3Y1Oue0U+lBnApEXEoeMmRMPK39f
         L8hDKYfGEd6SPKa4Ulf7yX6koEXwtJktVedMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVR5WK7jw8bBtk+96qcPeVzLLFLq4erxKa+SEg0zTgE=;
        b=CmfoDpEg5Oz9wXbwuS6RRkZgSr9LB0ehwR/sysnehYL80+1oAH7GLFfTEYVfyzPp9H
         FhdfM/LMmIcDNNyl3fb0dJ6aoz1jw5I7YZcZcQ972TizlP78pRSBUOORP3KRcEEnDEqW
         uSkJ9mprPFxgs7UUP4CnYIbElsIQ448aJgd0/ZvXX/jCg2fBT5hUzBgHsg6T3iU0cjiW
         lIS3+e60dspcLl3lhPKoN5AR7hlVMmwilp/HF3SduHcoiZndQNIpQwnc0LeDVb8qyzAf
         5Q6mTtllIXDvAhdN2o29RFCv3ZpRNTGL55hEbkiHrD9Rur6+CBEpbr2k9g7T/lGnupeN
         XG6w==
X-Gm-Message-State: APjAAAVBb0UXovlmpQImQxhDpBE8RM7sw8Oc9rw1xBNyLVTxWoTCye91
        3QwF2c7rmtlzPns4Zq0UdnoUyKvMfzoAPQ==
X-Google-Smtp-Source: APXvYqwJSUMil0yYhGisN0J5w16EOL8/CV6qq5568mVBJX4s6BMWhVxxdAzWH+XRG6JYrfPhcSV5oQ==
X-Received: by 2002:a63:1e06:: with SMTP id e6mr11408856pge.185.1567144948737;
        Thu, 29 Aug 2019 23:02:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x10sm3449865pjo.4.2019.08.29.23.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 23:02:28 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH] pinctrl: qcom: sdm845: Fix UFS_RESET pin
Date:   Thu, 29 Aug 2019 23:02:27 -0700
Message-Id: <20190830060227.12792-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The UFS_RESET pin is the magical pin #150 now, not 153 per the
sdm845_groups array declared in this file. Fix the order of pins so that
UFS_RESET is 150 and the SDC pins follow after.

Fixes: 53a5372ce326 ("pinctrl: qcom: sdm845: Expose ufs_reset as gpio")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 39f498c09906..ce495970459d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -262,10 +262,10 @@ static const struct pinctrl_pin_desc sdm845_pins[] = {
 	PINCTRL_PIN(147, "GPIO_147"),
 	PINCTRL_PIN(148, "GPIO_148"),
 	PINCTRL_PIN(149, "GPIO_149"),
-	PINCTRL_PIN(150, "SDC2_CLK"),
-	PINCTRL_PIN(151, "SDC2_CMD"),
-	PINCTRL_PIN(152, "SDC2_DATA"),
-	PINCTRL_PIN(153, "UFS_RESET"),
+	PINCTRL_PIN(150, "UFS_RESET"),
+	PINCTRL_PIN(151, "SDC2_CLK"),
+	PINCTRL_PIN(152, "SDC2_CMD"),
+	PINCTRL_PIN(153, "SDC2_DATA"),
 };
 
 #define DECLARE_MSM_GPIO_PINS(pin) \
-- 
Sent by a computer through tubes

