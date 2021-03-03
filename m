Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5473F32BB40
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244555AbhCCMQj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343682AbhCCDcl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 22:32:41 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F9AC061794
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 19:31:21 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id j12so15244059pfj.12
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 19:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CX7nnUJDVRP42eJky/cZ0aCMDizljES0o4MdBwQ4CMk=;
        b=gDz1yEByWLsYs+FakH5QYXl3lFXx/nNsv8zzvRVrSC5DKraer8E6LQHZ1nrxtHaZMf
         aNBFHCc59ulsidmWvF5vMSrkQXVc30OToKjjOQWgKDvxX85yGexEZcJVgQvZVl5A75zC
         UCn4dsjSYAH24tiiY+8jBgfda5qf6MofxPw5GI3+mA7sjkBfErqlyoE/hFTivbixch/e
         3oCIcsGWNz23PTDwQbuEsMZ4SJG1ttid+5d2Gg0tzQTHKdUF9U6gQQll+6da81fBNm5Y
         TW0lSuYiB1yq240WosvVhzmHY9cNKHHrUGJ+z4JS3AjOftXcQYOeOLo7ylmaA5rpNU2m
         ek1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CX7nnUJDVRP42eJky/cZ0aCMDizljES0o4MdBwQ4CMk=;
        b=Esh6a26sjBdyQ2f0pU7WQ9xIFTRvX+xiGvsM6pTplcCmKdhLBs5ODmC+qMYrigPTSR
         h3gfUlIYDlnprxZ7ja5Is1Ntmox3CkResvFu9iG53P20GlWbfLAsA+Oei+MqYtMPbDDv
         nOd3lM3AnCooJAAh5XWsgJlwLTPUTL6VIcfH0JoXX3IAUxOjuwovBOPyv2GGA4f7BBC6
         N1VP1xj7S4YB0CIi1w/6Nb9H06MGzCSUFOC8ZTJPmcMOdBPXxE9KbnpFDIb24hbTgDWA
         4cSfLS201FC1aRCHCr0UUIWY3B5Ok96EvQKWF86CgM7njbIW/ctOCwcZwwDvGaKn4C6T
         Qh3w==
X-Gm-Message-State: AOAM531/CaCfGq7bVo8LZX8YWB9LhvEd40yNCTLnxqPLVI8DwmvgDg4v
        ciSJSKd4o+WPgDibi/J6P6zC/Q==
X-Google-Smtp-Source: ABdhPJz54Js3NgB/rnRs/fbaJHzlKjghBfEkgYhhhwSk+5Pv1NyxIsdzCP8iJS8j/buOEXtGRU0shg==
X-Received: by 2002:a62:6005:0:b029:1d9:ce00:26cf with SMTP id u5-20020a6260050000b02901d9ce0026cfmr1309226pfb.7.1614742280695;
        Tue, 02 Mar 2021 19:31:20 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c4sm16057511pfo.2.2021.03.02.19.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 19:31:20 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Evan Green <evgreen@chromium.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in 'gpio-ranges'
Date:   Wed,  3 Mar 2021 11:31:03 +0800
Message-Id: <20210303033106.549-2-shawn.guo@linaro.org>
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

Fixes: bc2c806293c6 ("arm64: dts: qcom: sdm845: Add gpio-ranges to TLMM node")
Cc: Evan Green <evgreen@chromium.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 454f794af547..6a2ed02d383d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2382,7 +2382,7 @@
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 150>;
+			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc_intc>;
 
 			cci0_default: cci0-default {
-- 
2.17.1

