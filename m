Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC02662D7A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 18:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237478AbjAIRrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 12:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237407AbjAIRqH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 12:46:07 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF4141009
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 09:45:48 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id m7so8998080wrn.10
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUidst8virGDECkk/j16ylo+nI+51AixKCT0eQSx0pI=;
        b=GnPG6KwhM6OOi7LUB18Fzuec1a59qPgMpstWFH/IKGLfgrnTRux5QOG1oRZFE+yNF1
         yOZAvWsAUF0SabZUjBmR2XtcVE/8UeNdcvxw+LV2EgDrW7HcwkcnBdhXiMR3/UsrSr2x
         hTyQIewyfaWw4HuhZqs5Ajf3HnvA6aRa4/xkk0n7/qrNnpEXLiSqvusroWDq6ZDBdiA2
         rbuXNqQkmhyZoVFOU13rJr7f0yTplHUpTskyOpgjilIU1gQqZB3tjgm+DTGRh+7b9RHh
         CVMYA9EF36+u+Lq5Mo+VdDQw5sacwovFLgR2z01ePQfnRAaDHLidX5VdOscQNVD/wdw3
         vjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUidst8virGDECkk/j16ylo+nI+51AixKCT0eQSx0pI=;
        b=1bZEgl//noHcud5w/sjPCU0B51yny24zAvchvxbmbpO03n9NFy3a6z6F5SfB6l7deZ
         1e2VkyQPWjiCuUaCOqv9IWBopZag5LQ23P18+r1l0gFrKyi5uTu+G+/XvN7lbkr0QAIw
         hm6ByVhGsM6lZHUZsGx/5Umxl9gk/IXhbInwud/cwpajrn/ay0bOI/qurtMur9Xi4Yxu
         UWnCyauQzxdXh/FUpgDaFMoN/kbexh0kRebY7QJh7SAaMPJszxe4jA5YKSwNsBiINa1g
         VV7qLdQgJXGfpkECVjmz3NySMhOy4rL1tQsLP6hWo2l/DoIJx0BN5F7pxz9RDzxKluA4
         R2mw==
X-Gm-Message-State: AFqh2krSc3LEJbOXQCeJrLLhmNIbel32V5ULTJsDrZ3LjGe+KXoCjmIu
        jJkVe9y1QtI+RKJJEVEJT6CJyw==
X-Google-Smtp-Source: AMrXdXuZVvsi9T2GHcxP/4sFzZaUXCsznZqfPA6rgrEmOhFtAfD4kokT4JEI+HOFMQdx8tryKTsUFw==
X-Received: by 2002:adf:cc8f:0:b0:242:14bb:439d with SMTP id p15-20020adfcc8f000000b0024214bb439dmr42498449wrj.43.1673286348459;
        Mon, 09 Jan 2023 09:45:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c88:901e:c74c:8e80])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm6142902wrv.113.2023.01.09.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:45:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 12/18] dt-bindings: mailbox: qcom-ipcc: document the sa8775p platform
Date:   Mon,  9 Jan 2023 18:45:05 +0100
Message-Id: <20230109174511.1740856-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230109174511.1740856-1-brgl@bgdev.pl>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a compatible for the ipcc on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f5c73437fef4..de56640cecca 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sa8775p-ipcc
           - qcom,sc7280-ipcc
           - qcom,sc8280xp-ipcc
           - qcom,sm6350-ipcc
-- 
2.37.2

