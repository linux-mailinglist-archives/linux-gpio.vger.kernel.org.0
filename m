Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26345F6667
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbiJFMrK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiJFMrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:47:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F200A2207
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:47:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j4so2644362lfk.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=C8o5PFjxV2DbD9sEGHbpRvhtOpSPJbDO58y01xwZ0Oc=;
        b=kjoCKLoVJRdGs4J2ygjNmH63v9oBGO6G9mNuPpyddPh+S4XpTblvHEWkZGh/OLvHJ6
         +vqpTZpVUVuk1mAq2u38B+XRu+LMYPA+nMZdBcqTfOlr6viIq0EiyJXoTp9TpYAI59Xh
         ISX7akp7JS2T439t7bPhAnwtIr2T8eUi1faQ0bxbn9rRB1K/WApoUDDuYIGrJJnLDn3d
         5hN931QXzz2Y6BuZdV4plim60VDw255s1ctQ9mb6Eh/d8TcITnYPbPNYxZNMZ2arSUQp
         hzvpvw9aLrixU5xx/NPFQakZr3n+q5Xsj3bvEvv54atY21WjHfxZMjsZB7eFsNa38yVl
         2DUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=C8o5PFjxV2DbD9sEGHbpRvhtOpSPJbDO58y01xwZ0Oc=;
        b=PoKmfXWXPtWxE9zEbufcvkEMhlZ8rbCdHOy3Cg0X6UiYYgC0nAhhY8GFG4Wgbe0fTC
         X1CpAM4XJuhlIq4eiJodMgWYk0AjcSZRq2ONJffnEMeWcuKwJCDzEjmi0VZePceoVCB5
         IEGg28Yfl+O/cE3/E4HCsU1K4h9w/UifjqlRPmzYQSwwvEtxvqp0CTYs9+oEEzD4oIOR
         Tu/27PV8jWWscUlsKgO0kLjyucv0jvvVqk0l5DWIUtG5kpSCYtrRt8/YppS237erXALT
         dAycugLjufBHRGvLJZmsWXa0WWQ8ds6mmSLPhxCE5kd7r/Qd/H1Bay6AL3znypvgaysJ
         yaOA==
X-Gm-Message-State: ACrzQf01WUBM5+BvHSGkrEJvcKRZVnM9o26Kz4lAOhCz+UMrqLa2ubYG
        Pvx2laUaPGLxZFfg48Q7oNsyNw==
X-Google-Smtp-Source: AMsMyM5HE1aldx9YR54sJ/7jFpb9Yex6BLIglkgIBzAV6akJ3UXX1cKBVXh5h7HdfHbY6Pc3NOIIDQ==
X-Received: by 2002:a19:a413:0:b0:4a2:2c46:31c4 with SMTP id q19-20020a19a413000000b004a22c4631c4mr1855370lfc.113.1665060425445;
        Thu, 06 Oct 2022 05:47:05 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 03/34] ARM: dts: qcom: sdx55: add gpio-ranges to TLMM pinctrl
Date:   Thu,  6 Oct 2022 14:46:28 +0200
Message-Id: <20221006124659.217540-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add required gpio-ranges property to TLMM pinctrl node:

  qcom-sdx55-mtp.dtb: pinctrl@f100000: 'gpio-ranges' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index c72540223fa9..f1c0dab40992 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -559,6 +559,7 @@ tlmm: pinctrl@f100000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 109>;
 		};
 
 		sram@1468f000 {
-- 
2.34.1

