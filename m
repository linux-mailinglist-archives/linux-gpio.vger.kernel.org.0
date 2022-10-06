Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E2E5F6403
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 11:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiJFJ6T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 05:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiJFJ6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 05:58:11 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F239A89AD0
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 02:58:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id iv17so685563wmb.4
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=nih6K/iOH4NWZI3ARD7h83GsYopkCtps47Aq4lvZzNg=;
        b=JMM7jKixtXMGtXillk7/AJX3GCp2mUoK5P3vRzS2xwfMcMRSmqa2d1B4g4SO9GTFuA
         MYOarfSDLmml7ydx+hdZ020adhnILXB8ZIpWJ1IJY63mM3m2oFaJqos8Wtco/SO7TFgX
         dUNwXTj+PePl9OJpNpv4oT/EXM83QwKyT6iWOpkCXEHpabxdJhilbH0n7RbMaOxpagtr
         H5e3A0m4YGqjNi80/DHT5JG5NpHy5wvQ9mRhTPzcha2hLQZWzyhJr8g8BN9/VgwjufrJ
         dlNdpn2kewsvO73R0/UKyPC8FYZd/FU2n7esXtRpYvXGzwD73coNdXCXkEH5f2001Ewx
         Z3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nih6K/iOH4NWZI3ARD7h83GsYopkCtps47Aq4lvZzNg=;
        b=Ysu8PaDP9BNGKV/ZvudUWQmGV54rVi3TLFfvCe6ZGuXDiyrCjZbzWSqde4WWgQyfp8
         NEXJSNmu8o2ItPjmgPfz9kW+kH3OjyrTn+WhiyybfUiODSr58mOMMZyn1cJzgKka4l2x
         uc9wFHzN/KKvf8h7HsarWvV6gUHOHOzIJ7A+corE4AwSp0iO/a98hJZNP7C1z/BcB0VB
         jeTTQDMwWrTDigjc/ejTgWTQsL8L9hblYNcX4GI7/tfKClvejwdQdVqb1jcotqGF4R6H
         mQ68PtutB/Nnjpv1QO0S1wAvzLuy/c5KBbYwvDc16SnKCnXEYsbECawbWe4BAYkw9jdT
         Eg2g==
X-Gm-Message-State: ACrzQf2b8QhihLW6UQh1Dju2uxtoHM3vIXtpXyNX5QmLOL83Fj759gl0
        3AK1jgGBFzSwvFE6tjSvztUyzQ==
X-Google-Smtp-Source: AMsMyM4sjs3gknfpIApTwoNfjyL3v4ulJKadJBMHIxN8VrMkfyx7G2Cpnnf9LaLRw2P974Z5/miUcw==
X-Received: by 2002:a05:600c:4209:b0:3b4:fb11:3b8b with SMTP id x9-20020a05600c420900b003b4fb113b8bmr6077837wmh.144.1665050286353;
        Thu, 06 Oct 2022 02:58:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q11-20020adf9dcb000000b0022ac672654dsm17935603wre.58.2022.10.06.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 02:58:05 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 06 Oct 2022 09:58:03 +0000
Subject: [PATCH 6/6] dt-bindings: soc: qcom: ipc-rpm: refer to
 qcom,ipc-rpm-regulator.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mdm9615-pinctrl-yaml-v1-6-0cbc006e2a30@linaro.org>
References: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v1-0-0cbc006e2a30@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>, Lee Jones <lee@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now we have bindings for the expected regulators subnode, refer
to the right qcom,ipc-rpm-regulator.yaml bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
index d416950189d1..d18200d5c5b5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ipc-rpm.yaml
@@ -47,7 +47,7 @@ properties:
 
   regulators:
     type: object
-    $ref: /schemas/regulator/regulator.yaml#
+    $ref: /schemas/regulator/qcom,ipc-rpm-regulator.yaml#
 
 required:
   - compatible

-- 
b4 0.10.1
