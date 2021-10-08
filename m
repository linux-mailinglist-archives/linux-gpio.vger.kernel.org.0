Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567BB4261F0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242333AbhJHB1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241969AbhJHB1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8000BC061788
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:43 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z11so24038862lfj.4
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N1AtEgs0cni74U+0HJfUmBYJcZUYOvYv6UrqXbEKgM8=;
        b=OYTGVh+9G0muxWDccBLrHPtwBPfucZTxBH4t4eZ9mohV21BXeZ2ZO3gaghlFfAWPmb
         SuHsvOKIuNoVvgV/f/7FgwZbpSIa7FVvRjblsn58Ulvs/D0bfZww3zyFGn60Iw4+lmYf
         B18MYxzprcS3oLeaJHEhsNv0oU8Fn0QAL2l01okbysqhCxI8Kjn1WKSQ0Ku1QfTzh865
         OC6jaFiNl3oyJ5Y+zZlcU/0otipEtjsCzavroELWw1dFC55nWlatMwztBGQsozMXqJDq
         TRG1MMhkeDspJQRDneNgEpRuQl2SQC4ilTMUc9zkqs9Wng/Xk2g5wboTbkzMP9EekvZs
         BbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N1AtEgs0cni74U+0HJfUmBYJcZUYOvYv6UrqXbEKgM8=;
        b=4gXCLebt+xUf/QS/oS5MWszX7hocqPIzQo+Ruk0O853ME1FwJXveskvHgPQ8K/B4kA
         XcTGp/hy84GHndBJ1Gf/ITfuyf9eDBHUHHxS4AbFuthtkR9FWg0pKD6gwuAPjHHcO7yC
         fhE6W3eYD8jeHHtLKOFcbp1xECj3pR4x5mgMQdDNOKgsrH3MaLaE5iGoK3Y0S9ZBBeW0
         WQP+nMs+b8cZKRyg4vJ9FWX15dGDqkN4bBl1s1zZ+/IYp456q7Wqqvd6v2Lo4Y/V+b8e
         7wET5ra7NZM8jXTkjShh8iLQNty7WvYNe6H+uIwbFKWO3euL07nClfyD2qa2cc+RCq5U
         oy1Q==
X-Gm-Message-State: AOAM531xvGgn/PXUVSDL578ZeupXNvGIS9iHWcqAIH9ockdHjeK7UFL2
        nB21BbKmfLS7p8IjL+lkQMG84Q==
X-Google-Smtp-Source: ABdhPJyJIuqxAvjXmvZDZfKOHMAd9yuOmhUqNf+HS/0CpfhKzpcScKzEf+aedI0feSWThIQ5JnfjEw==
X-Received: by 2002:a05:6512:3d91:: with SMTP id k17mr7153008lfv.430.1633656341842;
        Thu, 07 Oct 2021 18:25:41 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 21/25] ARM: dts: qcom-pm8841: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:20 +0300
Message-Id: <20211008012524.481877-22-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-pm8841.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8841.dtsi b/arch/arm/boot/dts/qcom-pm8841.dtsi
index b6066c27732c..2caf71eacb52 100644
--- a/arch/arm/boot/dts/qcom-pm8841.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8841.dtsi
@@ -16,10 +16,8 @@ pm8841_mpps: mpps@a000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8841_mpps 0 0 4>;
-			interrupts = <4 0xa0 0 IRQ_TYPE_NONE>,
-				     <4 0xa1 0 IRQ_TYPE_NONE>,
-				     <4 0xa2 0 IRQ_TYPE_NONE>,
-				     <4 0xa3 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		temp-alarm@2400 {
-- 
2.30.2

