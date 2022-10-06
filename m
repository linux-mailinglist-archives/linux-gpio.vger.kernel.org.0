Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E576D5F68C9
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbiJFOGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiJFOGr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:06:47 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CADA7A9D
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:06:45 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id by36so2375129ljb.4
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fQ27kq4/khNZ2CAemqwtqd/847NwOGk9AklkRWTL2kM=;
        b=iuxl4OevJ8dNqIncrrv/08aN0XNrBsfJsT2ioLWmqLRJp5xbcbghHzDwCvusfqasGz
         GMlZbsii188NJ41sDXg69fUpvGmY2w5OkeBSEo3pJ2Al3UjDJ1BnfAIXrgBRdkp211GP
         ydTFFOnzdKvya3t9IrIL9sotbj3E0oVCrARg8QPEBVXEBt4fwelFnka5R+ugEsGiVn1/
         aovvyTRSuz2e6S6tmRMHmnW8ezD95MFkNM3YJE5LSuCExm3hQRVlmKZsJippVVn2d9ov
         ynOFPcMljzrt363rQKGiEbfIGxqNUIOb0WlOzV3TYaQepPfgrWENaV7q7U3+5Enurfbd
         H3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fQ27kq4/khNZ2CAemqwtqd/847NwOGk9AklkRWTL2kM=;
        b=cqKqCxiHqqbO6rmvDlCSI6VoCkYGq9ew7Pg6MSqBo3tDFR9QIsyLaUQzQXCb1OiMlK
         4ZlkIEaxB49S3tfaw+K0gLwQ3rdMR3EWcpxtg4VTGJDA0NbQGeSG9/RxPCpbK+wYus6k
         2cR9yCG1q6QxutrmRQGCZUmbqqNghhMcD4XeIE8KQfkRUdDP4IgXRbaEmSelFfad9Gs+
         HMRpvj0vJ7lE8WUiMQgJwUFQ67yNIWFJYpE57Bz4grfG9py+1fszCcyoidOmrB4odAtA
         lnyQIa38jewVzbHm6ENBwjohSqxT/eudd/I3ViijgDZAO1SW/sMGX55i2DNTv+FojuoT
         G1sQ==
X-Gm-Message-State: ACrzQf36Y9T2aqMT4TjRQYdclrrNPaJ/l3gkXL4lZO8D40MgMPBjY4kL
        PumsWW+X1y72S7DSOC5oa6t6CA==
X-Google-Smtp-Source: AMsMyM573Gzq6QbH4Fk5gwdTGw3NHY4ObREc5I3fpFs2wtSVTQ1GWhZbRZBeb84OY90eDCXunOf85Q==
X-Received: by 2002:a2e:9e50:0:b0:261:bbc4:249e with SMTP id g16-20020a2e9e50000000b00261bbc4249emr1716587ljk.265.1665065203929;
        Thu, 06 Oct 2022 07:06:43 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/34] dt-bindings: pinctrl: qcom,mdm9607: drop ref to pinctrl.yaml
Date:   Thu,  6 Oct 2022 16:06:04 +0200
Message-Id: <20221006140637.246665-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index a37b358715a3..5a9002a83423 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   MDM9607 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

