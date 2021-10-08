Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899264261C3
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 03:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbhJHB1a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 21:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbhJHB12 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 21:27:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCADC061768
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 18:25:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m3so32595636lfu.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sE/GeDbmDq0h+hKpjaIbLxWeY1CrCvRz2kO4vU6ead4=;
        b=mO2BfTUSoOS+QDuI4UVTr2/fdVvyNIeiyheoXP4BVNtgxKbGRRo02bC+aR4iJ+qbYU
         LgXZbwpzld3il6xvx38o//nNQEkhGY/nuiW4PqGiVzirQKtUqpE70wqxbFwmf4O+WfQC
         5RDX2OrqxjiUiyluvf00Kr/qGBIwgLcBQzpuBcUlYWGP2xAe1qQJ0IbyMA15WWm8e7tt
         aEKFnBcuGPsXknzoKsfQFRQjzCUIy0y1b58IvtX0DVWv5iwHs/DOVLN87ZK8W6jEdd7B
         BHXw9t0e8vbJVa9bWI03bxlQ4Jw6wy3H6CoWNJKL2iZg2VUlAOkgFUtdHNEAJEuNOkb0
         gWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sE/GeDbmDq0h+hKpjaIbLxWeY1CrCvRz2kO4vU6ead4=;
        b=CjinhUgqNAVnadZnvc1Hx8nbltHDYltc60xb3x5xpODU3+8IcY8O6pm86UsA2LX6qF
         THsCXSNGh/8EAyo+B2orhrAOzEeWBx5A+7zhKrujB/bfE6sfDwcwPApjCm4jsYsoh93U
         PLBCokf/tLGMcPar2cz1aVmlbb5m8NiTrgb5/9pyye6walFtvBsopxehPMpOfBbQVIKn
         O5cT6ZjRR2poPB97XASvAtt5AE6VBBAJnO6/iFCaZfU3MA+8ndxOmssqzT4DGn2ukRTh
         xr8TrqtJK4ym8l7gSUMqRwjAlQb6gvEUTpZ9TbUDWPbzRqqtMjjZaWznRWUU/hazpRsO
         0gGQ==
X-Gm-Message-State: AOAM533qdDXp11PuJaCcatK2Yk8+2MVt7sLwnfTPGvLfFYrbPNV8w8Vp
        slnAvrfux/3nScqzsNLtmAwuEg==
X-Google-Smtp-Source: ABdhPJzgutI+nOtWdmpQ9mcezQ/G2nxiTvlyG8oRrrXVfiIeglp87+g03CpxJjNQ1om6JPdnlSW72g==
X-Received: by 2002:a2e:9c49:: with SMTP id t9mr409209ljj.86.1633656332022;
        Thu, 07 Oct 2021 18:25:32 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 06/25] ARM: dts: qcom-pm8941: add gpio-ranges to mpps nodes
Date:   Fri,  8 Oct 2021 04:25:05 +0300
Message-Id: <20211008012524.481877-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpio-ranges property to mpps device tree nodes, adding the mapping between
pinctrl and GPIO pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index c1f2012d1c8b..cf8daa2fe144 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -79,6 +79,7 @@ pm8941_mpps: mpps@a000 {
 			reg = <0xa000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pm8941_mpps 0 0 8>;
 			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
 				     <0 0xa1 0 IRQ_TYPE_NONE>,
 				     <0 0xa2 0 IRQ_TYPE_NONE>,
-- 
2.30.2

