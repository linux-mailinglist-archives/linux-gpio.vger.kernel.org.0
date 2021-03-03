Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3232BB43
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbhCCMRc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343707AbhCCDcw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 22:32:52 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545D2C0617A9
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 19:31:23 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id t25so15314737pga.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 19:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cn2nXibIzD0MkhidCs0pgueHS+0vk99rUID4aeq6w6Y=;
        b=CLmmXpcEX5+Anb8wZZGcKGG/CeFLnu6I8e+fm741ocARS+TjchKVo2iDrMHSD1Nbt2
         9fhwi1sVXOtwNX4OgQeeiwzsT+mEntWK6ZKWmPRKHtTazpXdvJiYa762vlCjezwteNxe
         teSIaHPPAHFhMIUUqdFOE7CRcKi0cfyciqA0uaQyNF2vWt8bHKmarKsqFp+c/VBGhhwM
         rbMG8ZK4MzApHOALD+oW588JmebnGEOvRE+InxBfw9mKdlVetpNymOIQGBDNmdKMBrz2
         wBx+/7t+TKX3FnXqfW9/eEwKe53bT24W1eNohwIqXkv96aexuZLoPNF0pbrZcmaZM5sb
         H5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cn2nXibIzD0MkhidCs0pgueHS+0vk99rUID4aeq6w6Y=;
        b=qMqTdsZ7x7UpCmk+jRo7L5A4YQz+GhXfLaRONl8ZYEbcwIbCDAAqre0MROuMAHqbbJ
         cKZdqU4u/VuHpYDVC69x33PcJ2e37DE7d/YiHJweWvc20OTl7gqsAprUJdOCJMwRvYR5
         vtiS5QdDWWzzYyeQJsvdsC+ftlBlSZbrl+VUku2+5QOajiAFsACUHTlK42Q6i4xgCV+V
         Q3XC5jQuFgUj9e+3rYxrBsevDxR4J9EY5AuyaWW0EfZO6NG+tFNTymBuqrbRsESxVuK8
         9k4zri0OLnmjVy/NzuiuQT8CaH52A4WB3cj7xFFtYMfH9k8Ver5VQJaYxz/PnQ3FnMHm
         adzQ==
X-Gm-Message-State: AOAM530JH0j7c3bJ9iWL69ew7EmxM5sdY2LucvpYcBSxRwqaaVNhBTtN
        K+A//QE7MTU7uSkg418Qh+VMTOdm3eCT2w==
X-Google-Smtp-Source: ABdhPJxUuYkhu4i6aduARS71TgXJShBmy+zKxt2isfiduxdLMnn1un8v+HreOtOXqf7YGR/bczwMLQ==
X-Received: by 2002:a05:6a00:a95:b029:1ee:471f:e323 with SMTP id b21-20020a056a000a95b02901ee471fe323mr19528594pfl.69.1614742282903;
        Tue, 02 Mar 2021 19:31:22 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c4sm16057511pfo.2.2021.03.02.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 19:31:22 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
Date:   Wed,  3 Mar 2021 11:31:04 +0800
Message-Id: <20210303033106.549-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303033106.549-1-shawn.guo@linaro.org>
References: <20210303033106.549-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The last cell of 'gpio-ranges' should be number of GPIO pins, and in
case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
than msm_pinctrl_soc_data.ngpio - 1.

This fixes the problem that when the last GPIO pin in the range is
configured with the following call sequence, it always fails with
-EPROBE_DEFER.

    pinctrl_gpio_set_config()
        pinctrl_get_device_gpio_range()
            pinctrl_match_gpio_range()

Fixes: e13c6d144fa0 ("arm64: dts: qcom: sm8150: Add base dts file")
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e5bb17bc2f46..778613d3410b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -914,7 +914,7 @@
 			      <0x0 0x03D00000 0x0 0x300000>;
 			reg-names = "west", "east", "north", "south";
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-ranges = <&tlmm 0 0 175>;
+			gpio-ranges = <&tlmm 0 0 176>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.17.1

