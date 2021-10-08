Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4534261E6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbhJHB1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbhJHB1m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:42 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6615BC0613E7
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j21so14484848lfe.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQKiFrIlu4aY0PWyyaI2rChbhDxGEcd2OHWvmY22ZAo=;
        b=VdvRqe+u6Yol+YioW6CZJicr70CDuUrGovPClHwleRc85YBA/N4i1jWSvugRV8FgF9
         cVsJ9q3YpOspPP4X6vqPU0ox7pnYbduXrW2GtMXdFaBnDdf3gQMwDYLMya88QAHue7Xr
         5XdvfheaytUhZ2af/y1vQ3TkwAikTmUjdTWpW1AP7wyj1eVmfWHDx5DMCFPDeGfhmc2V
         sRwfZ6lgs+3HmCllSNXiUUAXWnEU0KOhUgKjF489DZxJobbOKM9CC8ejMlsb6e8u0Kur
         A2l2/PS7Rj8EPPsqnl4dZ1B0PyJyjOijELe/Ug4+MzylD8RwFW3WezfbFbWRLWQ2QKOR
         IUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQKiFrIlu4aY0PWyyaI2rChbhDxGEcd2OHWvmY22ZAo=;
        b=KRQtL9kQAajvJb5imd11K4iK5fq+RgVnPANsBruvIbU6DNyEP9s4vMdFf0cCXSKq0l
         6UlGuYgUSgQjSseugVSXz1RBiBHpCDxmwBC9eg5fiYId0GSJBoXUSVOfuJ2KJSLPrF/h
         Au6b62k/0QdttrQ+1jmevadZM8EpZKiefh1e5rMcWoNoFTFyrxyORnGwewlMnKYiQHQ5
         LiertjtzNkCXD3UOohAndgTE4qrm6iw1+0lIaQQPLwScbTJG2emiJYcQeWDdR6FHmjh/
         nKCOUFk5FryY5+c2def1beO5tFYgdd0UhTmEE41jmkHkPPF0aUgKz81e0ryMFJXK/JLy
         2L4w==
X-Gm-Message-State: AOAM533licOM3patNShWO/0o5aJB54TsoxX12QzY1/QcjAQ22+wbp7tj
        OHMUTOg/jc4xeoBjhXouBhm36w==
X-Google-Smtp-Source: ABdhPJz/yPBXt97ilRGNphY8eRn9Wa01/2mCI/Ojy/r5UqbQdnZSfb21/Umrj86ttO00zKEC1BBR7A==
X-Received: by 2002:a19:674c:: with SMTP id e12mr7862935lfj.679.1633656339824;
        Thu, 07 Oct 2021 18:25:39 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 18/25] ARM: dts: qcom-apq8064: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:17 +0300
Message-Id: <20211008012524.481877-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that the pmic-mpp is a proper hierarchical IRQ chip, add interrupt
controller properties ('interrupt-controller' and '#interrupt-cells').
The interrupts property is no longer needed so remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index cbc9be8a69cd..5aebbeb5eb07 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -683,10 +683,8 @@ pm8821: pmic@1 {
 				pm8821_mpps: mpps@50 {
 					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
 					reg = <0x50>;
-					interrupts = <24 IRQ_TYPE_NONE>,
-						     <25 IRQ_TYPE_NONE>,
-						     <26 IRQ_TYPE_NONE>,
-						     <27 IRQ_TYPE_NONE>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&pm8821_mpps 0 0 4>;
@@ -728,19 +726,8 @@ pm8921_mpps: mpps@50 {
 					gpio-controller;
 					#gpio-cells = <2>;
 					gpio-ranges = <&pm8921_mpps 0 0 12>;
-					interrupts =
-					<128 IRQ_TYPE_NONE>,
-					<129 IRQ_TYPE_NONE>,
-					<130 IRQ_TYPE_NONE>,
-					<131 IRQ_TYPE_NONE>,
-					<132 IRQ_TYPE_NONE>,
-					<133 IRQ_TYPE_NONE>,
-					<134 IRQ_TYPE_NONE>,
-					<135 IRQ_TYPE_NONE>,
-					<136 IRQ_TYPE_NONE>,
-					<137 IRQ_TYPE_NONE>,
-					<138 IRQ_TYPE_NONE>,
-					<139 IRQ_TYPE_NONE>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 				};
 
 				rtc@11d {
-- 
2.30.2

