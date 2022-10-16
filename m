Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080F160023A
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiJPRW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiJPRWw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:22:52 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C77D37FA6
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:44 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id 8so5464735qka.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXCX/bvx+GMITxwd1sJyJkSs746MTV1B+EirXA61vBw=;
        b=U/Uog/3oGcNKxEW3ZGHOx7ZGNEgEpVgLbGkK5PfRbiX5qF1LrWDcMaK62Ey3ihB/Jp
         v/fzi6npqnqZtqRvnndpylz7ntQiGtxTI9qvvaQyG7TwWp2PdkWRU8qHkxPPAPoEga7c
         Jvb+b4lhBSEyqn+oehyxiDoAOekP2VIBPrWoeShQmo9PPO+Lm4dj8hr4Iq0IgWMCidTn
         wIW9wLlDpcRwIh7kKsq7ZXySwJ93OMnRZ33jKAdfAQmbN1qeaVimbzxi2DIUtvtyZvXE
         LcwvRV1Z5TRxrwyriSuJPtB8//Q+Z9w+iup3VbMlFWC6ZtMouBb/fe0dNmAztZjWRIvK
         W4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXCX/bvx+GMITxwd1sJyJkSs746MTV1B+EirXA61vBw=;
        b=pxkUKoXY9IZMP6+8BbM7ttfsV91M3z/YXgjHEyy43U627IOvWIJnlK6plQoehoZE9u
         /Ai9FLoFbD9MNJsDhBoSDUFBKqfjNg795c2xPSm8xU/gXJpxe3yE5IgFjCamj92GeGwm
         PLaNW0ekwDYhJeQev9bpns1QhxDndVAQFLGiQRcqieCUCwb/Y5iX/xlBAEQfzEXZ4yA/
         jPU9Z1iXZTpBRnpW5f8az2nzaEyTa7w/B3NVqitVgpx23DysymEeu7fma/YogxQWZ9cr
         fxiwUNv6M2bxBYvGCNBfj71Um43jC3jAyAp6SVR/EadXVho87EowA+KQIrspWDZ9GlrV
         5Dhg==
X-Gm-Message-State: ACrzQf0DQqWQvx+768NA52F20KF1zd3COwkboOroPkXluTz40kgmvY5o
        0U4O/p02ENHNog6WDiTbGDf8PQ==
X-Google-Smtp-Source: AMsMyM7BISQHvTRb75ZiRziZVonRMA5Y+vaWTUg9EVFvYFVZk7gtnr2w1/7l0ETlV9k4tEdEnCZcVw==
X-Received: by 2002:ae9:ec07:0:b0:6cf:4190:246 with SMTP id h7-20020ae9ec07000000b006cf41900246mr4953993qkg.760.1665940962485;
        Sun, 16 Oct 2022 10:22:42 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:41 -0700 (PDT)
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
Subject: [PATCH v3 08/17] arm64: dts: qcom: sdm845: align TLMM pin configuration with DT schema
Date:   Sun, 16 Oct 2022 13:22:03 -0400
Message-Id: <20221016172212.49105-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

  qcom/sdm845-lg-judyln.dtb: gpios@c000: 'vol-up-active-pins' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 20f275f8694d..1eb423e4be24 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -604,7 +604,7 @@ pinconf {
 };
 
 &pm8998_gpio {
-	vol_up_pin_a: vol-up-active-pins {
+	vol_up_pin_a: vol-up-active-state {
 		pins = "gpio6";
 		function = "normal";
 		input-enable;
-- 
2.34.1

