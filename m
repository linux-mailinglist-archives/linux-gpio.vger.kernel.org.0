Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1CF3A7852
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 09:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhFOHvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 03:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhFOHv1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 03:51:27 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B408EC06124A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:22 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso1704806pjp.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kToQoYGMVDwEP081PrugIKt6rs2IgkM3tpJJ4Oi9CQ8=;
        b=bdX2tgiSRbG3C/0M+dK3VoZJ9yu82exbbYqn+vqve8pHvA7wz64EudJoOJ4r2JrOHJ
         piPnOI/Hk30BTFp5shTse4ClOwAfjd5Aubgf8me24vlWIdBTODuki766Fby8N4kF/IJD
         88cePNEQSZKHggU52A1/yp52oUpYLM0mEheiqghCniOKl2N6QsjEduf0uBATE6wCmC1r
         zFLm4WOhGKXfd8bn/KJD5WPQZn4EfZNRenLHFTDfTiDc7yHZa4a3CogTpAIUifXzTa49
         ZIdvF8YO1l3YOp8BV7PjfFO0aBCPSrHgqPMy9X80HvdFyX95AxnsEw2dSeK80J4puWEP
         ipDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kToQoYGMVDwEP081PrugIKt6rs2IgkM3tpJJ4Oi9CQ8=;
        b=IRyJv3CuokDQdkgynyg78Z+U3c/SK5/tCjbiXiL9SFqRUW2InsW+OGmKpZZ9AKzwWv
         eIKgr+idPGqnkDeyV8jadMod+9H7wvLzb1MLYl4lKbPaRpY580uMvuVJWvuuE7+Q3AU8
         yfhZ7yzrQHBHPg+bbN7PIirGIYGpC0GqqU7IuM8MR0/8DW/BWR20Cpc5W3qrfaNIq1aG
         FIMuaatcERUEtRyzLMeM8qdX6zLKu60uJVN44+IkKxqrJ2N0KcYjFmMF0wUsMGZii6xa
         rzywpzZaJ/e396dkHFwmqIbX4Ap+VwHHql+LLYzFTjbied4I/rMy79vY13vRo79/zPa4
         bcDA==
X-Gm-Message-State: AOAM532w37Xd6AzqbA7VThlNYohxS1eGtkVirbgsiyDPtllnVOIxfbxt
        IsM+as1oZorD8DfjGMug//WzGBSOqUcgqQ==
X-Google-Smtp-Source: ABdhPJyy4wXKXepB9EppesnsK2i+Om3ZzoI46sCTcbwYfC9Qqk+hmdRFDM3HprWQ9pU/nxT7olvFCw==
X-Received: by 2002:a17:90a:d102:: with SMTP id l2mr23511799pju.225.1623743362288;
        Tue, 15 Jun 2021 00:49:22 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:22 -0700 (PDT)
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
Subject: [PATCH v2 02/10] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
Date:   Tue, 15 Jun 2021 13:15:35 +0530
Message-Id: <20210615074543.26700-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pmic-gpio compatible string for pmm8155au pmic
found on the SA8155p-adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index f6a9760558a6..80b8a66e29d8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -27,6 +27,7 @@ PMIC's from Qualcomm.
 		    "qcom,pm660l-gpio"
 		    "qcom,pm8150-gpio"
 		    "qcom,pm8150b-gpio"
+		    "qcom,pmm8155au-gpio"
 		    "qcom,pm8350-gpio"
 		    "qcom,pm8350b-gpio"
 		    "qcom,pm8350c-gpio"
@@ -116,6 +117,7 @@ to specify in a pin configuration subnode:
 					     and gpio8)
 		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
 		    gpio1-gpio12 for pm8150l (hole on gpio7)
+		    gpio1-gpio10 for pmm8155au
 		    gpio1-gpio10 for pm8350
 		    gpio1-gpio8 for pm8350b
 		    gpio1-gpio9 for pm8350c
-- 
2.31.1

