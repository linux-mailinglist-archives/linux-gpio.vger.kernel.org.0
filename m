Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F8B3A7855
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 09:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhFOHvi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 03:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhFOHvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 03:51:35 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEB9C061280
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:28 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id v13so8021439ple.9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YZn3e3VBEAR8TZlTha9G2vnyP+heLgxEDY2GiRmVtgY=;
        b=B1hk7G36M9L9mzPmvi/0zZOYdOWp4UUbhTJ5hfeoE8vXl6DcL9/zH4a+kiEXIpBcgx
         2K2dX5sf9IAPMvFxugyCJEv8fSYMWcVRNOWOahODwlN5A3ijm6e++ZR2ueSZu8T/PJQJ
         AG+8TWxCvGOzygA9cTJ8FdolJELhO/cse7LJzlHbBPYp32yQna0VVX1FjKTmlNDnxT6I
         W9CbDtLGdustnBviLhYhFZ6yD1hgqoZOSK0UEiB/Dlh0K9sV3qNG4q4aLXPuGNOJKUGT
         4RkiXDMX9E9LAreE4ri9+xvDgMjCE9428pNacwlcLYDGkz4e9TcrX7uDgFTBhdT7R686
         qslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZn3e3VBEAR8TZlTha9G2vnyP+heLgxEDY2GiRmVtgY=;
        b=YSUr8Y1dtkERTAOAEuqZ+b1Jx54HxGxdKuPQWe1O4jOm3peegf9DgfxVcotC2WFUVg
         GOaAjR3NmoaoJNTsumxzZrSMVm6IZjLuunxym0kW5pIvhuCpaF6hQ7sDvnUL6SKSVOuO
         +DjFuwrITjJKt74LcT4ZFzWpzBp75aG+dsVHnUio3ADwbQadOlhPpI6PmZUNUPPWdHoR
         bKxhN/9bHg55sDUYAi0dnJXNfqhvEZKipE7pS729/T21LsFKmLfgJ+C5mpyQUDheE/zU
         Dij3IAYPsjtP7WTKdTUFL9KW/d9lEIiJ9rIVbJ+6eDZq0MX1Qdh7UHFuVgJOg3UnboqW
         zvdg==
X-Gm-Message-State: AOAM531xGTvlyrzLjuQaRydgpttSx2pTpwhfai9GlQBd6kjvoiN1tbi6
        +URvF2guBZzj/FMKRKt5HjPIxA==
X-Google-Smtp-Source: ABdhPJyv4N52Xre0AtC09GOaWoR1wPnQqqQVEanp9uraemty79/MntOaGaj1HwQAbYMg8jA7dsrYYA==
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr3698577pja.181.1623743368103;
        Tue, 15 Jun 2021 00:49:28 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:27 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 03/10] dt-bindings: arm: qcom: Add compatible for sm8150-mtp board
Date:   Tue, 15 Jun 2021 13:15:36 +0530
Message-Id: <20210615074543.26700-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sm8150-mtp board is based on Qualcomm Snapdragon sm8150
SoC.

Add support for the same in dt-bindings.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9b27e991bddc..d7bb90e5082c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         sdm660
         sdm845
         sdx55
+        sm8150
         sm8250
         sm8350
 
@@ -198,6 +199,11 @@ properties:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
+      - items:
+          - enum:
+              - qcom,sm8150-mtp
+          - const: qcom,sm8150
+
       - items:
           - enum:
               - qcom,qrb5165-rb5
-- 
2.31.1

