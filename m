Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739EF3AAB13
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 07:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhFQFg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 01:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhFQFg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 01:36:57 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34583C061767
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:34:50 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id o21so2314715pll.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UcB/vjjB0e9gJipKA//v703MbAzCMRsupGuwwOTjDio=;
        b=fgXIaaj0HsETVKRyV7KBf7e8L7whuTkRdRypBzdMxreL8fpjS/pj+jJmzd/e6Tqsoc
         fwz8wO2Ex40oAjBGyov+1j71RuXcfPZzstyUVkSOtB+fkkJGA2MaBq268rPFZH3K05AX
         lkozkVGK9PW7AEUmagUY7QhmXxxIF6/YEGfaRuLAuPewiWAEDgbHtPCq/3ejFk9cKeBw
         A1ckh0w3ipZWbLUGS/Nk/hvpqsgJpJnt3RsCUQxoSclVLbyH4wY6ljG7uS/MBqhIopDI
         I9DAkT7PcDUtFbZYSelMnwPvDSuFbHQE6sPPJKxLsJc+jf0aEHwgMVCkGtoyTG0qYJf0
         mBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UcB/vjjB0e9gJipKA//v703MbAzCMRsupGuwwOTjDio=;
        b=UQ5Ba/oGGkMoKWT0BypBbniX/OkWiCwXqMmeT8HV0Q0y67v/RlzQmeAAyurdumrUdz
         ++cXfG2UbwsgPjUvNum44vMiakA82uPcXgSpAsBJ1NmR6Zerohdx+F72GKWwE3TSVXs7
         2sscxy83QJjjk9Rp8S7xsWbDn4Zt7VXCIguOehOWLAF0OoWqOWcSHD1cv1J6/+nDx+Be
         SxToY81ylX7Rs4PRBEDh4p41Rjhdl148uLJn4RqnfEWd/W0BC5oUCaDd8bPNhZqIfmXx
         Lr3MKbaOu+XJsfgi4e1I7+fWn0t65Rc7g0UF434ozXNohcSe9ipXJt/25+sgo4NbsVyH
         rJlw==
X-Gm-Message-State: AOAM532VePEA5c4Sk9hEQnFZ4wfYrihE0mfft6unULYJvzcc/q/5gYZD
        HteMC6vuBW201Gkoh4ffvR1Ffw==
X-Google-Smtp-Source: ABdhPJyPwl7B31LdfVyW4xxhljTdgfTaKBwcQ7ULtqWZptk2a47gLvT69SNWtCi1HT4v67HIoi2N2w==
X-Received: by 2002:a17:90a:1da3:: with SMTP id v32mr2774502pjv.192.1623908089665;
        Wed, 16 Jun 2021 22:34:49 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id m126sm4056405pfb.15.2021.06.16.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:34:49 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
Date:   Thu, 17 Jun 2021 11:04:30 +0530
Message-Id: <20210617053432.350486-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pmic-gpio compatible string for pmm8155au pmic
found on the SA8155p-adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 10f049e21264..95d158848546 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -33,6 +33,7 @@ PMIC's from Qualcomm.
 		    "qcom,pmi8994-gpio"
 		    "qcom,pmi8998-gpio"
 		    "qcom,pmk8350-gpio"
+		    "qcom,pmm8155au-gpio"
 		    "qcom,pmr735a-gpio"
 		    "qcom,pmr735b-gpio"
 		    "qcom,pms405-gpio"
@@ -122,6 +123,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio2  for pmi8950
 		    gpio1-gpio10 for pmi8994
 		    gpio1-gpio4  for pmk8350
+		    gpio1-gpio10 for pmm8155au
 		    gpio1-gpio4  for pmr735a
 		    gpio1-gpio4  for pmr735b
 		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
-- 
2.31.1

