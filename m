Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455AC4941BD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jan 2022 21:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357335AbiASUcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jan 2022 15:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357341AbiASUcF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jan 2022 15:32:05 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A12C061574
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jan 2022 12:32:05 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id a5so3343877pfo.5
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jan 2022 12:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OZ6TQT4GWeSGbapYTD8zwcnou6pSe/ETGXSsIZZ2vnA=;
        b=prfhzT8lrBnwGRfOY1VDCvBcn7r8eAjiAa8UlC2fZL/WDAb9Xa6THPiAfb3wWjCG5S
         w0cW8LqkQXM6lLGTSi/LnYOUL8IDyIGL3RSgT2mycnOwwsHhah5X2x1eFkJB12yJYnD7
         gjVU8AW4CyWL8sy21AhCvXFpzi4DMwGkoTufPSyqIffu9h/ASnUZxm393hy5pXVbpNJW
         Xgwf38qNiXxDJQf8K1PUqkjI6fyTo6IOCRLuKrxgqwkys70X1HjzeIecPVw+uGiJ/K4C
         9NaFMsXQnmgMcyTsp2KeUaiFqBuY7bP44Anwi78nOSSG5UzeofXJ39MkK/Z0u6Bq9ppc
         F7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZ6TQT4GWeSGbapYTD8zwcnou6pSe/ETGXSsIZZ2vnA=;
        b=kYztwl6eDThioN+RtqzIc0X7ZLDAdgZadllj2Y6QWRir8qLtPZzYEQD88mP286xCfd
         fnY3WUBFxA8f0G/Kt1hXNaYfIAr3T9Drpoxx5smrTTL8K6Hn3+zwwmzcnMwGMiRqZZXb
         xiJ0hLV90nvin1xdx9nd5S4+jMV2mxG6A5glTbppgnwY59Xl/+ezmnQ9EFnG9yxmSA4A
         a05Dxl2ZGDf+wQmIaNrqp3wqcd81ys+ywVjL8cPbVmL/M6swlEvKDQR8AbBaZVJg8kLY
         psUPtpp+ozmnm453XjhDs6kpyJAm/H+3lcMCBVlLlvR89CueKOIMsrEVbswEB+dJDevb
         6CZQ==
X-Gm-Message-State: AOAM532piiMrwr59dHolL3sh7POuSxd4vmkk0y9PS0lYu84QkGdxtXLH
        gh7i8wu1uAfTsA3L6He/c7+4GA==
X-Google-Smtp-Source: ABdhPJz4y06xkJGOJqeAXdWqbUCFk1aGCBSrYDYCHhZULINBiM2pNNpqBKKrRn6waq/R36zJvAqSmg==
X-Received: by 2002:a65:460c:: with SMTP id v12mr28021917pgq.58.1642624325264;
        Wed, 19 Jan 2022 12:32:05 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:47e5:8bff:a3f8:a494:acd0])
        by smtp.gmail.com with ESMTPSA id x13sm6807552pjq.43.2022.01.19.12.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 12:32:05 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH 1/4] dt-bindings: qcom,pdc: Add compatible for SM8150
Date:   Thu, 20 Jan 2022 02:01:30 +0530
Message-Id: <20220119203133.467264-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220119203133.467264-1-bhupesh.sharma@linaro.org>
References: <20220119203133.467264-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the compatible string for SM8150 SoC from Qualcomm.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index 98d89e53013d..bd3539644d3f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -21,6 +21,7 @@ Properties:
 		    - "qcom,sc7180-pdc": For SC7180
 		    - "qcom,sc7280-pdc": For SC7280
 		    - "qcom,sdm845-pdc": For SDM845
+		    - "qcom,sdm8150-pdc": For SM8150
 		    - "qcom,sdm8250-pdc": For SM8250
 		    - "qcom,sdm8350-pdc": For SM8350
 
-- 
2.33.1

