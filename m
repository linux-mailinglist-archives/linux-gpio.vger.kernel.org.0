Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8674941CB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jan 2022 21:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244794AbiASUcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jan 2022 15:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357353AbiASUcT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jan 2022 15:32:19 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BC7C061401
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jan 2022 12:32:18 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id t32so3670269pgm.7
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jan 2022 12:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqXihKucmnytz8M1n0VHglkxlU7U954wHoSK4Xv6rQc=;
        b=vwQ+Z9Nq6jlaXRSAni70Sjj94YsAimviM58py95W8vr9oQwd0Apg+P5YuFXh/jAPF5
         WoMqRl6nGQkA8kcU7ASPwksXlso0bcxvXqV6OD4oeOuJDbroWKg09GNeuiSTkxqMR8tK
         9qcer4hTx0JXIBnlZIMRO4/TGjv7cdOINiu28BRNiRY9JIvJDrfkuL4Uv66KGc4LlxnT
         HnVA9Pfsa9WuZaoHgTeeRt0c3Qrfbw8LYucW97CVGg2bZ5OheBVTQWJL9m9ejSNCd70u
         eCjBYfNBFxm0mVz6aBPW7KuDwLJxGZDrmXkgYy5kQcUXzU5ktJKD51eHERqdX9yLfPma
         9k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GqXihKucmnytz8M1n0VHglkxlU7U954wHoSK4Xv6rQc=;
        b=X9DLNFoja0JbQMSh3WFE8iluT+cyxHPSju2xURbGK17EoW3h0q6m1kgTDXFgHlGfCC
         CkZpnFpfbS3YqnWRdeVW2hpvwgO9sCBgF8vUcsS/g/wo7X1JrtbIncd0RqQHNLX+Go5E
         qfd/CGlgsXI6/vNfdRDworCEh/QzE5W9uSQnp9CLDb0+HPpbWSCmb57DwB6E0MFGUKfn
         JkaQXgm+pWhZ0ElzDBVqIrKTG+x8UWRcxyaJSjnJ++ufJFFm3A2mYPmSFSJ4+gNTQUya
         6girRHJ0HOeIzGLNcIeeZdoOljL4MnI2tAVZB4fi4H6dCB9OHpQYE+1Isrdbomo6j8WG
         SVEQ==
X-Gm-Message-State: AOAM532T7RNmadx1FxO/xAM54h+HGpR6C50l2zv2tu1PKgTY3atF7w11
        EMm+E/r/LLAr+tvpV2+vFVEHAQ==
X-Google-Smtp-Source: ABdhPJyI9L708yeOZbuCJ5HXqNsradzR/S5DMtbz5n9jptiSXc9EmrmxrjwUGSLQdzHasWxQu5djGQ==
X-Received: by 2002:a05:6a00:234e:b0:4ae:2e0d:cc68 with SMTP id j14-20020a056a00234e00b004ae2e0dcc68mr32396719pfj.60.1642624338369;
        Wed, 19 Jan 2022 12:32:18 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:47e5:8bff:a3f8:a494:acd0])
        by smtp.gmail.com with ESMTPSA id x13sm6807552pjq.43.2022.01.19.12.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 12:32:18 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sm8150: Add PDC as the interrupt parent for tlmm
Date:   Thu, 20 Jan 2022 02:01:33 +0530
Message-Id: <20220119203133.467264-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220119203133.467264-1-bhupesh.sharma@linaro.org>
References: <20220119203133.467264-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several wakeup gpios supported by the Top Level Mode Multiplexer (TLMM)
block on sm8150 can be used as interrupt sources and these interrupts
are routed to the PDC interrupt controller.

So, specify PDC as the interrupt parent for the TLMM block.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index cc4dc11b2585..aa7e949a2bea 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1937,6 +1937,7 @@ tlmm: pinctrl@3100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			wakeup-parent = <&pdc>;
 
 			qup_i2c0_default: qup-i2c0-default {
 				mux {
-- 
2.33.1

