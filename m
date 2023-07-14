Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAF5753B32
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jul 2023 14:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbjGNMlB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jul 2023 08:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbjGNMlA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jul 2023 08:41:00 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4859E3586
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2023 05:40:57 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f96d680399so2974953e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2023 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689338455; x=1691930455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO3BaxYCZ+L/uORC+pf07E8D9o0fBToXSlhtH2de7rw=;
        b=oxGZgrpIfJhQzZIJqF+aBM+mmaE/bK4naa7fvpgtwek3knax53LGE17XpfHcoS3xJn
         D2ZvIAugeRv+VGHitrRirxUNf87rDIlel0AAT72jssZzbzlpv4CUt+f8lr4B6M1h3jHM
         g4vfDbzXoldY4o33AmlhFZkSEN0DZNT8RXX8Jtue5cDwZEj4WTj9d8sBIxAGf3T10fRC
         vmjqbSwVdd4ExBWkuzSB4hJgG/3dXR9deUWKg/pgdXo8IZMDyZ9srMieLZ78bsaA0xJA
         EPI9sh3PRjXxpoU5GlP1ihK/PGvQyLwWWkl2UvYQZ8A/UBPd7qliGheUntGi69zj5pA2
         0tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689338455; x=1691930455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uO3BaxYCZ+L/uORC+pf07E8D9o0fBToXSlhtH2de7rw=;
        b=bvB+zuT135fBUoyyY5TkP89YxyRmJ+9t2AT6uVzjiYIulNqFF+NKpWEC7UkoLZoizw
         70zU9yhz98tywtA/xcmeOUitoye8XFRf2hBUj/9OJkKW2cJpxK6ZDdxF8cyuOPEHvJuD
         p8MphqFjtREPpy735gf6qlldAoGiPpky2zfOzWm92yd23flWmf3f7cS9wtBDMICAOOeN
         bR4N3qBWKkQs6Crif3yNGcnl9ptc2wR+1ZxWR3Mt3hckfqxnGDRt/uky8+cL0hYYn9tt
         rnap6vTZqDaQFCmkKj1UzQpPhb8WcFji+tNSN/l9w4eWRNUpHNWpPUKTn9wBkFuJrUvk
         +OGA==
X-Gm-Message-State: ABy/qLaDn5tabUhhYtfS4zg2lDa6G2pdqGgAWl/iMA12b3+Lylwlckf5
        9X4BfK5D4oUtl09uO3qLogVa3g==
X-Google-Smtp-Source: APBJJlHlAddaubQ/zueOeGxnPlLqyGKtU17F4/ArIFEtjLQai74eAepMpx7KknX5mdh58a5qmuwxRQ==
X-Received: by 2002:a05:6512:3705:b0:4fb:7a4e:b573 with SMTP id z5-20020a056512370500b004fb7a4eb573mr3610408lfr.5.1689338455608;
        Fri, 14 Jul 2023 05:40:55 -0700 (PDT)
Received: from [192.168.1.101] (abxj146.neoplus.adsl.tpnet.pl. [83.9.3.146])
        by smtp.gmail.com with ESMTPSA id b6-20020ac25e86000000b004fb2244563fsm1482588lfq.289.2023.07.14.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 05:40:55 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 14 Jul 2023 14:40:48 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Remove qcom,adsp-bypass-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230714-topic-lpass_lpi_cleanup-v1-3-dc18b5bd14f7@linaro.org>
References: <20230714-topic-lpass_lpi_cleanup-v1-0-dc18b5bd14f7@linaro.org>
In-Reply-To: <20230714-topic-lpass_lpi_cleanup-v1-0-dc18b5bd14f7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689338449; l=730;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DyK40mymfrvw8k/ltntuGU1sfhX2SFcLdrpfHTNW0dU=;
 b=qBnOkFZmC996wH1CYdwJcNu3hlwhZiyzrwhXN24QgaMwaVqj+hEgRFwf2kwMfKM31XoMQltpX
 SPVdPsAQ8r9BXTtayuWOtbsupyVAclRjwoHW2RQCeF7FbIyodHXeW5A
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This property isn't used or defined anymore. Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 925428a5f6ae..ce7d318afd57 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2510,7 +2510,6 @@ lpass_tlmm: pinctrl@33c0000 {
 			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
 			reg = <0 0x033c0000 0x0 0x20000>,
 				<0 0x03550000 0x0 0x10000>;
-			qcom,adsp-bypass-mode;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 15>;

-- 
2.41.0

