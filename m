Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59ED54261E9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242250AbhJHB1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbhJHB1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:43 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F07C061773
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:42 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x27so32510528lfu.5
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ZjqNWJNbpqp+wYhpfPdT4qYlEU1ULLxGhv3FpneW9Y=;
        b=MAjGzOTWzwVqMXeWy9koSr+ZsvOJydeBaNej7TfaJQ1IipAlHGpmUfBUf4i5PdwHx7
         KVdxrTouGB+L8D9aiRcpDk9F3a9MaNyvOO5Uryn9vWNXRua3y4GS3puLmpe4+NJUFM8B
         YyvRbuhFnTtzd5WIMAX/5hHlnc3CWPW/D/3tmDlb/UJBtKoKWg5zcPlZGekcA5S5kbGL
         AScuarz5ZALDY6pvdkmaXWBwo2zAe1JFOddgZ4xqqdgttzhOy/S+oFlvtIUG/4bwrWAa
         NhEDM5bczmzlKMuXGQLfNT/zKqTf2qt9S356jU5uWj4J5L63g7fF5HG+Jv+uZ0lxqOZH
         GBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ZjqNWJNbpqp+wYhpfPdT4qYlEU1ULLxGhv3FpneW9Y=;
        b=wGUNdYvq2Qg+KiPpS1q2ERAsmBNOmfXvfYz9lMousUg56BKaKiI8F6TKd/8VZ5jNi0
         WJmcEk0UJPXdNKCvSzZ9gLZr0WavSDh78e7gfLfalaFJ/pCYaCwd1atue0PJfDW2VgGv
         Mm7muL7tG10VciUJB1Tw/tcFgAlobOEG6JW7NJUxyBQ2STy979+40IxCXJH4/uj+qqSv
         +zgUkpa928m6L6A3VSCBISspfwe+L4qejGypA8ybHgt2DmZIW2Ju3ue3HK4qGILb6sea
         2PZ8hCCZhEl8Q9t965eJKYqovL/TTNH7+nl/Fv8BORbmFy0mDFun34P7NID9SCRHl8N9
         8fbQ==
X-Gm-Message-State: AOAM530VgdRwI1hY50qAXCPYVbhzMKhXFqiG6s3Ba+RuLfvB3I+kMLQ/
        9UuSDTUZIcuxLcNo+K5UapdRqw==
X-Google-Smtp-Source: ABdhPJy8JJ46Ku4Z5WPOF7x7G5kD2M7XtGFMpw+5P+qOlIFiJ2Nhw5VGsgbNR/HtFC3Tt0rfWIE8WA==
X-Received: by 2002:a2e:801a:: with SMTP id j26mr355117ljg.175.1633656340592;
        Thu, 07 Oct 2021 18:25:40 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 19/25] ARM: dts: qcom-mdm9615: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:18 +0300
Message-Id: <20211008012524.481877-20-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index cfff1a5706ed..6e90c5d5a050 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -302,13 +302,8 @@ pwrkey@1c {
 
 				pmicmpp: mpps@50 {
 					compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
-					interrupt-parent = <&pmicintc>;
-					interrupts = <24 IRQ_TYPE_NONE>,
-						     <25 IRQ_TYPE_NONE>,
-						     <26 IRQ_TYPE_NONE>,
-						     <27 IRQ_TYPE_NONE>,
-						     <28 IRQ_TYPE_NONE>,
-						     <29 IRQ_TYPE_NONE>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 					reg = <0x50>;
 					gpio-controller;
 					#gpio-cells = <2>;
-- 
2.30.2

