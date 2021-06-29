Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7183B721E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 14:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233727AbhF2MhG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 08:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbhF2MhF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jun 2021 08:37:05 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E00DC061766
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 05:34:38 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id j24so3041630pfi.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 05:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAxSAdg/rIMcJx/szXV2ix1QgDPfMpKoEmOCLfDuAgg=;
        b=vjIgtKgnYzu738FMpBj/MnDisNwDF1/nYqTS4mT6QiYAO74LdAQr8uqFfkDC7pQWR+
         Lbv9SccE5AIwIWmT8fmTsiSjlpk9nPzr5viPTz5gCdkZK7e1EmT1rgVh1hpy+ql3yjxc
         VEaAKh7JUnWTgR/g6ZQUVoQaYQeDOBKhitYsU5rb4a9VT3wKIsp1bF2NUZ+0caB7xXoX
         GtszcwC1opLoE/r2tATqbXBMIWcKr4DQl/A20ml4GWlNUG5SK5xhJnJ9h/L0++G1He/v
         fe1PivQTdOOxDyyg6oAl/T0Ag5w+R2dCUyZGEJzREeyhYcYTPG7kgSxVVd3Z/sH1IC/M
         jzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAxSAdg/rIMcJx/szXV2ix1QgDPfMpKoEmOCLfDuAgg=;
        b=t8WZAS4G+F1a3eKfkucPjH4uW6NNf58KvqIsL5Q1qtUd5lS19oO8YkE2qlTHhJcV5H
         5XVaZmo/+lJpTeZLUmM/QElTO5WRrWPS6ej9SFq20NqwwpMcRNxAVGFX168xo3iYVEQS
         yAgUlll5ART+eigbTFxaWQEXNbGOITHXFsqYM/PNekbPawnl9hocPaOkqE3aLG8vg1mx
         WVuCuLJvGvxmDkxPe+qa/SYr7Lqtl/3/l08jNeYi6C3YMSYpWBGV9FGY13giBKPRkFGQ
         vedR/+Dcg16VfbD3ZZA5dP+ubE0FIBbmF4/WzNCFdgEGoFaNh5UCrKIdNjmt6DKPDdRj
         I8lw==
X-Gm-Message-State: AOAM531rtppHnMr1nX/rBlkdGQ53Ym7yHYLqZV5sdNNEaiHNfVvVtap3
        bRvIJROUG+67kY+QHLwErkwmJA==
X-Google-Smtp-Source: ABdhPJwwtgr/KYGiQfqHQq9RmG6rS6ASQeIvnpEJL9qBWh1lW89si/lXKpvz2RN45odFC3k7Nn74OA==
X-Received: by 2002:a05:6a00:26c3:b029:304:8e6c:be0a with SMTP id p3-20020a056a0026c3b02903048e6cbe0amr30123692pfw.65.1624970077691;
        Tue, 29 Jun 2021 05:34:37 -0700 (PDT)
Received: from localhost.name ([182.69.252.226])
        by smtp.gmail.com with ESMTPSA id 143sm16176692pfx.46.2021.06.29.05.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 05:34:37 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
Date:   Tue, 29 Jun 2021 18:04:05 +0530
Message-Id: <20210629123407.82561-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
References: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pmic-gpio compatible string for pmm8155au pmic
found on the SA8155p-adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index c9f02062774a..261a1d114253 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -34,6 +34,7 @@ PMIC's from Qualcomm.
 		    "qcom,pmi8994-gpio"
 		    "qcom,pmi8998-gpio"
 		    "qcom,pmk8350-gpio"
+		    "qcom,pmm8155au-gpio"
 		    "qcom,pmr735a-gpio"
 		    "qcom,pmr735b-gpio"
 		    "qcom,pms405-gpio"
@@ -124,6 +125,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio2  for pmi8950
 		    gpio1-gpio10 for pmi8994
 		    gpio1-gpio4  for pmk8350
+		    gpio1-gpio10 for pmm8155au
 		    gpio1-gpio4  for pmr735a
 		    gpio1-gpio4  for pmr735b
 		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
-- 
2.31.1

