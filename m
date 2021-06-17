Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59E63AAABD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 07:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFQFUG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 01:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhFQFUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 01:20:03 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D39EC0617AF
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:17:46 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id u18so4019699pfk.11
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7xfbbBP1sARI98p9+Yj5eU4M7nEGILOgTtUScNpJW1E=;
        b=LI11gSZQsWwiN0eXh5YAy9PUhbCjXGcjidxtJQlJoXkvNoc0gJMYIusXuwr6yK7Y8S
         Wrz31oKNC2h1QlZaEwilmEhN+j2BxVEXFcGVz+eEfNjQbWkj0d1Wqg+t63JXUohvlCc1
         /3jcHsd1vtJhvlgc3kRPA4CKFvVkcba88uWffpbAf9c/oPKbzASebjhdge+PT2UxDIHK
         jjafId778XpHRman43joXPFvQ7wf578hN95IjqzmkRwbCe1m6jnWgLkLm0RCaTea6Hgs
         ZvGEVB3g/pF2Hs7vNGNmAUFd6AAYxWPBKNtf3Xo4JRSFSleHZaorx2GeLtGoZ70MM/nF
         mX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7xfbbBP1sARI98p9+Yj5eU4M7nEGILOgTtUScNpJW1E=;
        b=OCSvxZy5Nk/YWYZjQGO1qC3NBxQfYZf3ZglolE0bg8jePp8ExZ1eNjURYbnsqd6KLY
         8SIuK0IfxGkgoLjSHSSV5H4Dyw3CCrKqjBJukjG3SBGletBmL3LiuMR/NP3UcAt0Zdi/
         x5VpvktaVTyl3nckd3O+fimUe2AklDgrc6hmZmhJZyy9SbtSWnGPzGz2/O5GpPXSXKTj
         sbbRYEkJ9b8DgyByWftYbO/qUxj8eCsRJ2dktr/KRpzgLGCcMkbWFXyb5GGUuGBQnN8I
         OKwvj+DYC1hu7b7ouYhSoJoE68N7eOmgK1OH1ADc/FTZn2CbAJHSLWQMd9slbUkarAvP
         h2kQ==
X-Gm-Message-State: AOAM532z3lEiT+u2sXWZovEeCYUJWlI2YTyoKauHmPQjniNvBjiykL93
        snXq+HtpPOtiuhP9NHOqDCF5Zg==
X-Google-Smtp-Source: ABdhPJz2Y8u5eKmqt+h74jIHfR9Rk6O4mIUUJ1TObavQdkdwG6hmS431LUWONQO3S1TsH9NjLfdsbg==
X-Received: by 2002:a63:e253:: with SMTP id y19mr3308498pgj.137.1623907065718;
        Wed, 16 Jun 2021 22:17:45 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id 188sm3900893pfz.146.2021.06.16.22.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:17:45 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/5] dt-bindings: regulator: qcom,rpmh-regulator: Add compatible for SA8155p-adp board pmic
Date:   Thu, 17 Jun 2021 10:47:09 +0530
Message-Id: <20210617051712.345372-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for pmm8155au pmic found on
the SA8155p-adp board.

Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 3546c6a966a3..34de38377aa6 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -62,6 +62,7 @@ properties:
       - qcom,pm8350c-rpmh-regulators
       - qcom,pm8998-rpmh-regulators
       - qcom,pmi8998-rpmh-regulators
+      - qcom,pmm8155au-rpmh-regulators
       - qcom,pmr735a-rpmh-regulators
       - qcom,pmx55-rpmh-regulators
 
-- 
2.31.1

