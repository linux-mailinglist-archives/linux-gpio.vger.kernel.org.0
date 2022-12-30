Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F94659914
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Dec 2022 14:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbiL3N5H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 08:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235084AbiL3N46 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 08:56:58 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED851B9C3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 05:56:52 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bq39so24043089lfb.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LFPu/nfv09qeuH7foczG8nitidZm7jiC/H/irSOvB0=;
        b=FenquDmeM5xjvYwTOMVkaV1iRtMO3RONryG+sEZeZeoIYQMaHQ4rIPIHTtf9gwycFH
         9ED5Id07W+cOR1CqHsPoEH9J4DVdFwGtiAzFJqlFCldTxZoLxN+6UNzkGMELLyyHSa/0
         wxH94i1BAGrXOA52m1RHFIKoxa6UBPF3OouT99D9HGlf2Qj34V1MUaz/ImVx3x6yuxYT
         dFhEild0R6nRlch9HHZ4niwOmGv3sc0MHXVR94hqm8PoWYSbcqZQU1bjVWkRmy1g3FuH
         KTUXKvxXjH3Cf8ez1vqvtCqYrvU/bzWTCaDHQdP19FrQBqG7/bBv404dibrIVjhD1BDg
         m9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LFPu/nfv09qeuH7foczG8nitidZm7jiC/H/irSOvB0=;
        b=VRV6rIvLX6N+4USqEJDU9rM0PmB4RcK0t3u8O/9xPQ8e3/1zZ+7fqqgMGyz1I04pTZ
         8y5ADAq2t66gPbUOAj9vJVSX7/7UcJ7Q2KYMLRowS67VLWuXe5Oej5skqq1E2rQMrZZR
         3QsOrAa+zI3b80Vv440RPZ7dpuHkSAr5TZnksUnvOe/A0N25AMODmTSWIkGUaUl42boM
         zIdfBP506XBwEJxxvxV/0oyBE05kB9CcT75JRsiYtm3jvQGc1fscgLaavDiUe2kSuyWc
         KwoGk+VGob3YL3UEP5r3LeE98j4Spd5UCdWCbrvkXX4+MypV6uCsLiOG58lDotRmLwlF
         HqNQ==
X-Gm-Message-State: AFqh2koTWhKH4938jNQo3uAXUysHsM0sqdoz/m3wxOducJ1BVwEP01Ob
        wPhstzfWPyUFH4No7yYfh6qSjw==
X-Google-Smtp-Source: AMrXdXtz5qJKZlog4jA903P0FBj6sn0ZKWF1jQjXH4xcsohitA2gUJ2BvVm6Md/VN8xGqKNaKGHAWw==
X-Received: by 2002:a05:6512:220e:b0:4b4:b610:1427 with SMTP id h14-20020a056512220e00b004b4b6101427mr14824948lfu.8.1672408611102;
        Fri, 30 Dec 2022 05:56:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d9-20020a056512368900b004a26ba3458fsm3454787lfs.62.2022.12.30.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 05:56:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/9] dt-bindings: pinctrl: qcom,sm6350-tlmm: add gpio-line-names
Date:   Fri, 30 Dec 2022 14:56:39 +0100
Message-Id: <20221230135645.56401-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Allow gpio-line-names property (quite commonly used) and constrain
gpio-reserved-ranges.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
index 41e3e0afc9a8..b099649e58f7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
@@ -26,7 +26,14 @@ properties:
   interrupt-controller: true
   "#interrupt-cells": true
   gpio-controller: true
-  gpio-reserved-ranges: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 78
+
+  gpio-line-names:
+    maxItems: 156
+
   "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
-- 
2.34.1

