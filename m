Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754DD74ACBA
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jul 2023 10:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbjGGIU5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jul 2023 04:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbjGGIUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jul 2023 04:20:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230931FF1
        for <linux-gpio@vger.kernel.org>; Fri,  7 Jul 2023 01:20:52 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso17126965e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jul 2023 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688718050; x=1691310050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Z0h6vYSqXNeuBCoLrE61zLNx+lI9H9j/VUTdBVk10g=;
        b=r2Br/oqnScc9+dg3I8eO/6XZZ5PNr+6orb8PoloE9HRxKNhmqBK7YJV34xcn9q2Iru
         fvXEvfkAMwM8kt2QGQePhnGe7WnI94dJfE5FY6ZCof205veCIGAYcEaoFSP4CZNzSo/Y
         68hGtLi+2mMy2GioR1Qv7LQkEfcG2gpRuKLOHdPB5nGXTaHtCWKJuVi6hOP9fBLhnh3Y
         hVPxPam457728573TphfbiVYPDFfg8jWBxU9P8yqt+08waaWsdbraiNSEb/uXnjDfPel
         7Yet3qzpQdvpKIuvLWMd8ECWtqWxuI6Fu96bQzH0gOhVQOrjCsntaWNm1yJKFg9pWP0J
         AbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688718050; x=1691310050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Z0h6vYSqXNeuBCoLrE61zLNx+lI9H9j/VUTdBVk10g=;
        b=eXz89v9QNo0vQUP3ByDbFX9MDgv6JJ1ZiRwIf/vYF1yGuobHJn/p3eiyg1M8StNktI
         0WRaohIxxjGq3e9V050WmK3vLTrFfYCqAA4NaaPWDgiUaK4QCdpI/hH4xcXysuM6cgm5
         VBhpWb5dEM+kb/8o0ZinVTydJccH/NAWMbxO8sdUj6RtHDjEx22F4dcGYHEa05Djq4fo
         9SGbBxqsaMu3cw7ZMDUNI3pp0O4vXrFNQ4OMR+wz8Oem1uNwnWfj2mmQq2I8IKDXhpO/
         ElWSObwGuQsZcLHnyyGFkrjLLisqrf6lsYww5Nv+A89TxnJTY9oByLB+4tyhQOdShvcE
         r7hw==
X-Gm-Message-State: ABy/qLagBnLAk9IjvA9WVKZcvhaTdITNgAGiC3/r/ljrp2sffa81DeN/
        drP8qcHTVSEbh/Dcg6flcCL5AQ==
X-Google-Smtp-Source: APBJJlFGuaAPvNctsxZT4h+rPeNLCrVRQZx2if4DjgbImxXDXh3d0dAHm+VNQdBF49oNM0Gf0m4naA==
X-Received: by 2002:a05:600c:c8:b0:3fb:b05d:f27c with SMTP id u8-20020a05600c00c800b003fbb05df27cmr3255792wmm.34.1688718050542;
        Fri, 07 Jul 2023 01:20:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a5-20020adffb85000000b00313e4d02be8sm3824395wrr.55.2023.07.07.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 01:20:50 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 07 Jul 2023 10:20:45 +0200
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 allow gpio hogs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-2-2160060446d7@linaro.org>
References: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
In-Reply-To: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=998;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xcMJDJisG5P8usDSUuJYQAhSJbsakC/C4wieWFF2OvM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkp8rfdkjrF4LrOwWQKI3uvXubBxsYnrCT9RuJaOrI
 X2sIXPaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKfK3wAKCRB33NvayMhJ0boLEA
 CLF9n1M62B3/yqBQIZjzcKQekaOoW5HwFNq5wiL2nk1Clia5bwryRVJ4Wsj6JXPDq6XUS9nGzMe+TG
 chtNsNDvtUJ9HFpO3436iq8nh+lAg5uscW8zUNvIpmTbu7vU+ADDAGgjy6j/U8m5hGOGCd4AwTNDSU
 DMhsndibEBRNH3aPBM0WB6UiTFIFHI9EP2C7Hhrae7UzEwzQG31pZtOrub3cwio4qIoaH8peWdf+Uh
 AjSbFZhorR4qCiY5pFnuJ213a2Z72dLr+7XVjd1abP2r8IWg2bLoEogRm1ww6FwqoUKEiwo1qNX5mq
 3eTbtyeCV8COkEuUHqaFLx6XNMqAc2SzSHTLdLt/hPNdqr3Agl3zwAjA3L6ZpxKylLQZNRXzX0OaVx
 nKbAF2NZrQ5WQOEG5nD7LhORjk4l80W0Aiu/AZVDG9xMdPiUp6nbnwJbjaBP4mt9OYNavi++zgurUR
 NzCie0NMF/sLnrDD0uUGEu04UcjZHUhjxul7RwzSPww0Mq7EGOm1d9JV5Xj9U09ZjkiDnFLj+IRGQa
 Sb/VdBwEjfdKVWJ8UvT4fOXio4qnDxProlJsgKHUarcHaofxLNQyrc0v/TQyiAaPDcHzVwdl2XJv6E
 zP+vPxgO4l+gGkJdr7nbTY+RvuKVaWRPCafL3whWgYl2EAgyBVz9OYpgX9mQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow gpio hog subnodes to the gpio subnode.

Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index a7b29ef0bab6..e707c222a07f 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -41,6 +41,13 @@ $defs:
       gpio-ranges:
         maxItems: 1
 
+    patternProperties:
+      "^.+-hog(-[0-9]+)?$":
+        type: object
+
+        required:
+          - gpio-hog
+
     required:
       - reg
       - reg-names

-- 
2.34.1

