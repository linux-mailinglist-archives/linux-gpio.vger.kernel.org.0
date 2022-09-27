Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6A05ECB37
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 19:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbiI0RkU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 13:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbiI0RjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:39:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0909F1E05C9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w8so16759271lft.12
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lCmscB9HoSOsvxfbLHIo1vqOoKuqSEqO2nxtzExDOCQ=;
        b=K0hqnmWjl41grgVpa430TOvKb6GTLsdsm+uQ1XY4Yt5uW2m/zzHePP5nNZBnk05qun
         AN5T7Vpl7fHpe7FiJmvrOmW1msRAojGsamvbgrBYSz99IldzjQE8s6Y+va+ziN4LVT33
         QQMQc4rkWgNhPuHYNzvxla6El+tzkU74lXU31T1rFl5OnOUoTHjVshyxIqedz8QEAY5c
         n/EHJpz7ANelgNYwcq+rcxAS42sI+Eb7AbfEct7+DqEa9C0Ls7jWrL5xNQHPb2SfBncV
         CT93xoNnwPVLKsJ/VPTY+Rs6iMgagC3LftMOGzCcJAB1HsCtxyjBIIfV3XPq0/q2qBho
         75TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lCmscB9HoSOsvxfbLHIo1vqOoKuqSEqO2nxtzExDOCQ=;
        b=m9pKmA8Q9W9imd8stzZXy4Ve8eS0gcSxGP+irpiwWS7ffrfFmthzfrwfSWalX7Q2CP
         EEpR4jQFb8TxKTHBfuXVPYm/TMlsuki0kiqkxjgV+ftwdp8eSgCjPAW+NsUwdfJBjKsR
         J/4wx6U+gAKvRo17caOPlYs6/PiV1AT0J2xKNIl5jzWl/cOFqzZxQQcaHJ8YQoxeVWgT
         kt8DosRyjuVDomlrHOoXoSJfpKGbOLLijtHHjNPecG9iFoNLgQPK12EZVpbhpCaTWaMf
         2B/AwqHjGwGrNEZaPkRkujpq9GCrEkRZbpu/m2gUCRg+TTQb/ZkGGuUIaU4j8tm0XEKU
         TbWw==
X-Gm-Message-State: ACrzQf0MOg9GlbwW7ONhOR8g9ynpCeFwiydNiTwSJUQ3F/m1GtmehrgA
        CGQbysWDpMjZJdtQf5m+ebL0sg==
X-Google-Smtp-Source: AMsMyM6sWIpERQcf2T2x8b9tHQ1BMjCZbsjr1jGaxCa2V3bOoirO6srVqHm+wwhlhewWXD/82Sl/3g==
X-Received: by 2002:a05:6512:a85:b0:49a:c6f2:7aa4 with SMTP id m5-20020a0565120a8500b0049ac6f27aa4mr11543372lfu.59.1664300320288;
        Tue, 27 Sep 2022 10:38:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:39 -0700 (PDT)
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
Subject: [PATCH v3 19/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: do not require function on non-GPIOs
Date:   Tue, 27 Sep 2022 19:36:47 +0200
Message-Id: <20220927173702.5200-20-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>

---

v1 was reviewed by Rob, but patch was changed since that time, so not
adding Rob's tag.
---
 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index b1735918fa90..08e2dd5cbebe 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -113,7 +113,6 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
-- 
2.34.1

