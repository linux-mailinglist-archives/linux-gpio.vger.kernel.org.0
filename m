Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 506FA5FC82A
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 17:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiJLPSA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 11:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiJLPRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 11:17:54 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02C4C8229
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 08:17:50 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id g11so5717490qts.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eaRKQx+Doc3jRznRAbzHwjMv60Gkzs2xOqcmaWaxKA0=;
        b=qcS+qn97NOUGT4Ij1A7qTKqKkvOzgGvOfP8bmPZROjAi9T40p4xGsTvBOsXLdNUx+z
         nm3DAdXElDEqJcTV+muqd2QLZU/CmCfuiqEI7khi/gHrPjrEH2WYvnYWA3dwHk+3uNEu
         Vl/aeNRl03BlmmPAsqOjC1o5i5ih/WpWe4GBwOYq2RRfENVBuf1XbYsD7YE/l/IZ5c9H
         pvlAO1gukFYi7SwKHw7jfzaJjHNPRFRMv6wQbYn8nZ/+blMD/F4Bym+YFOxRVjTnXscj
         jXpGJVgFdvRxMjRCmtoSKgCh1OxmFLHF2dFiK2gZlsBEQOhaRjyq+TYl75eqKH9KAUOk
         bQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaRKQx+Doc3jRznRAbzHwjMv60Gkzs2xOqcmaWaxKA0=;
        b=XrlVZl9aiHfvLFRCxB5haGSdvttWk6z3CwGwDYt04NOBpXnZoEirk3DGYmG6ikO+Yv
         pDr/PO1jp2rRtzwSEWcZ0gRJqdIPCxsFZJ+NM3xhd/RqJDMAavMsN/Ce6Tjvvc2caZye
         a95mLeeA1lsFu0L8BubK0ayR4GyWY1TMuRxBUuvE+EXNKshppFIeT4mAlAFiEyhOw86y
         9u3KtHou3fGfhoDPeVASCYmoLURw76xu5Dp/AHR+xi7QQ6Onn3NFok0vnEHS4/Pjb2UI
         /ehyGYbM6ikjXoSg0b8NUdA3r5EdHvAllfmTtZu1FNOEvjC/JaL8rN1nMLs4I0CSRQ6g
         CMhg==
X-Gm-Message-State: ACrzQf1p4jAVH6G+6rjBVrIC/iajPBRLGHqZTLBCP7zIMo0ds+LhE2Jz
        gUfLhvehXkXGG09ENUoVK2fnz9j4khQA0g==
X-Google-Smtp-Source: AMsMyM6lgaQm3WlfkETyHWAUgrqg3P/v+EhUF0cOTf9ATTF55y2RDgnrrmg1fv15rsb4fqKTLmZLwg==
X-Received: by 2002:a05:622a:13ce:b0:39c:c82a:4584 with SMTP id p14-20020a05622a13ce00b0039cc82a4584mr1080419qtk.150.1665587870012;
        Wed, 12 Oct 2022 08:17:50 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id x19-20020a05620a0b5300b006ee91ab3538sm2787671qkg.36.2022.10.12.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:17:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: msm8996-sony-xperia-tone: drop incorrect wlan pin input
Date:   Wed, 12 Oct 2022 11:15:43 -0400
Message-Id: <20221012151545.39061-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pin configuration has no "input-high" property, so drop it from node
described as Wifi host wake up pin.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index ca7c8d2e1d3d..93568fb4bc86 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -912,7 +912,6 @@ wl_host_wake: wl-host-wake {
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
-		input-high;
 	};
 
 	wl_reg_on: wl-reg-on {
-- 
2.34.1

