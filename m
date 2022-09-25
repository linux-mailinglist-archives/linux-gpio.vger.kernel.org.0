Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35525E9282
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Sep 2022 13:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbiIYLHI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Sep 2022 07:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbiIYLGq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2022 07:06:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E47B326D1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:26 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z25so6798400lfr.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aNLcQQxhPdFOgwRsvgsgtamBjwIOHo82jCWuV4BIKpM=;
        b=jhrnCb/Fnu5wUNoCrnU7J6oEwA36I+carel3+GeIXo3O64+NhfX1igqSU+OMZcJoIl
         FO5V4Uj2NKbTH2jRVxTmMU2q4DJEoQPqGgOAllwV2vnRiO+vsipU8JnyDm3kFc17zyLI
         atdtsSHSpaTBjd1saeK72U1nPuerTAy4+O0pqW4d8A1uihYB35LnCbGDiY69gSjdUguA
         FdaHFsjX0KE1Efwl92ljN1U1xOkStbp8KtKWCAG7clw50OPOecxh7ke51SvmWLq2eLdX
         4FduUBYWk8wXv8LwPGGTev5mSbPpXCmqvecwR7r4eX0jgp/kbCe/wSnix7jc8sAHfZMr
         NKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aNLcQQxhPdFOgwRsvgsgtamBjwIOHo82jCWuV4BIKpM=;
        b=t3zD7FazTUAE7+kT/u1pYeJLH81nCZpTZ0O+3Fk6JLpMShegUkRfSsE4qOPY6LP3Fs
         eUaSPDwq4PafDW6G9sHmJEAPIjbuaweEzTc/XYwRpXJPuPdI7cOS0A4E7taFQEG58Fhp
         k57R1iem3rCQSwsfPUgr+OKGXlHcYMt/QYwYxZnNKUkHGIrm3+Ql80Oenm46V+bIww6P
         VYLU3LQtJBblkZKpWM0LNInswY8SWGxTn8w9EE+siNSz7L8TPvta05a40BlcZwdoQrxT
         uDNfOHMrZekUvzpiY9bFJ1R/pjmq/oneAzwI5Wjf+QvydUtWDsfjF0MK5J1klm8VM6up
         nJqg==
X-Gm-Message-State: ACrzQf325HxsG883ZVHuUe/di6ON1KI5Ip1ftM3zlDWzBsIdoANpQXZH
        ZcpyFHUvYKBazDjKNcueUDXcoQ==
X-Google-Smtp-Source: AMsMyM56CWbj1FJw/0qknzbYyh2y3pGIMvVHX90IMH40I9yAU3a7RcLmecGWI5czIsSEJGRZO/amMA==
X-Received: by 2002:a05:6512:3b8e:b0:49a:d2f4:6b7d with SMTP id g14-20020a0565123b8e00b0049ad2f46b7dmr6324123lfv.627.1664103985707;
        Sun, 25 Sep 2022 04:06:25 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:25 -0700 (PDT)
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
Subject: [PATCH 11/15] dt-bindings: pinctrl: qcom,sm8250: add gpio-reserved-ranges and gpio-line-names
Date:   Sun, 25 Sep 2022 13:06:04 +0200
Message-Id: <20220925110608.145728-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document common GPIO properties (gpio-reserved-ranges and
gpio-line-names), already used on qrb5165-rb5 board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index c44d02d28bc9..d7d8e5d3b659 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -49,6 +49,13 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 180
+
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
-- 
2.34.1

