Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257234261F3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241321AbhJHB1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241993AbhJHB1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0BEC061793
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:44 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z11so24038958lfj.4
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b0AQXKDQSfjbcdAy/YvhgqCZpI+nhwsFNhGswrbVvuY=;
        b=IqLbkhJJpNoLsuzCSuQKOqEqDE5uEQm9LmTxRYSVk5AjxAnCdcwJN2saHs67cHAqhD
         NN/5N4QtCVwaP8V+khw5Veg9lQsxSKZ8RgtWNUNQVaLTdFpVPfKvzULB3u/WpY0d8FwI
         XEIOUPqkXDsvRbOLrGk9ZsMf1rFr9nH5mSpQ+jOMPAtAXfeAtmGqmv95KfYFj4pFMWyW
         mzEvgDpa31yiY6OMmSXy1hBYivqznGrGW3vixms5FZqHVIo0pVNPBrROwoXXUHIcIf+u
         a6LQnGhHJdYLFPF2/+kttysBegZxw4SKWQsy0jOFbHmGuUr9aBbpmbh7W9z0F9XmKqdK
         BdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b0AQXKDQSfjbcdAy/YvhgqCZpI+nhwsFNhGswrbVvuY=;
        b=tqKEx6SRXpsVNtxpi0snEfrjs5ZI8Ao8oD0iAPRQQ3Aznw7Ul41gFkHThGLJy3UEUG
         Z12HiJXZ584L6I0GCJ+eyhE6/zG0dAr0pDPPyhlCNHvhcB34d0qxbCGQCWQBZjiw3LRU
         1uhx3z/jdfnYJUeX2u6aeZGB52ic0J6xEe+NXfh9Jejlo3b/cRA5N+9caAzS1TsjfSaf
         oE6qpxNkVk/wAgmttc6IQ9EOPn3dcNiUBLQsWyygI4dLMtzUHsYMBH/u1W67hHDIAnyf
         0Yrx3v/IUECIYDBggkTUsK0wL1GRiAfn/6dRm+KhlPnKhhMgBKHnWLNnmANp2SX3GoMv
         9MuA==
X-Gm-Message-State: AOAM533CHi8kJJh/qSjkBLAA9jB0rmkT/q2UiBIYLKP1tfLk6J+PV22Z
        tSTWc6K4ZXMRxWQ4VqnGoetAuQ==
X-Google-Smtp-Source: ABdhPJzN85IyNLdhj7zFxPrE11ApOac+wYFWSm7ukucmYOtwGb+S4pYLo4Mb+JYtDKPys1ZeNH5RWQ==
X-Received: by 2002:a05:651c:179a:: with SMTP id bn26mr361065ljb.528.1633656342577;
        Thu, 07 Oct 2021 18:25:42 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 22/25] ARM: dts: qcom-pm8941: add interrupt controller properties
Date:   Fri,  8 Oct 2021 04:25:21 +0300
Message-Id: <20211008012524.481877-23-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-pm8941.dtsi | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index cf8daa2fe144..da00b8f5eecd 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -80,14 +80,8 @@ pm8941_mpps: mpps@a000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8941_mpps 0 0 8>;
-			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
-				     <0 0xa1 0 IRQ_TYPE_NONE>,
-				     <0 0xa2 0 IRQ_TYPE_NONE>,
-				     <0 0xa3 0 IRQ_TYPE_NONE>,
-				     <0 0xa4 0 IRQ_TYPE_NONE>,
-				     <0 0xa5 0 IRQ_TYPE_NONE>,
-				     <0 0xa6 0 IRQ_TYPE_NONE>,
-				     <0 0xa7 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		pm8941_temp: temp-alarm@2400 {
-- 
2.30.2

