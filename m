Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9D9600239
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiJPRW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiJPRWw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:22:52 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF833844D
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:44 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id g16so1724049qtu.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQBh9mrZMQXa4Wxb/syFmouoGZGa2l4WN/58xgtqFuw=;
        b=s7wNXTOQSsjdVEyR5YrTtmqv8lR5B+KaQDfI2Wv98VdXJVgVXV/nTzxdf7sxt+J2/D
         13/ugJn3Qn5o/96MErRjwMBj5rgbTOLAMaa0DjuzSKJLlgbOHpO4X76k40qPj2OVUvDN
         b/Gc+FhYUFkYoTUwQZi/Yj5386puztFYUV3OtjpuxROKUlZaio3cMzOQ5C+8yQ519KfW
         pmvyU47a4hiAhCuLwb9rxfAxKRXRR7rZ6QHB0gH1xmsU7ARXMlKmpRfsB0Sfe3THs2sG
         eM6LFaK9NfxutfjezMUyxTHqBQ3KaIVEzSGn69LdIQgFppWuGhaSWB6ZTjI3HvVysSTO
         X71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQBh9mrZMQXa4Wxb/syFmouoGZGa2l4WN/58xgtqFuw=;
        b=0NtCMM9/dRWMk2eqawfKd1BXDjbZiIUALpMjhXflIgtcFI2Qqk2rZmBJUWwc8BFSlw
         7Eizal8lnKSPj/JqYySTH2lzM4x956b7PgaNa5x2a764CQpPSThHLLppvcVMAZRSWgzu
         QAmmIog3dOYJ/k0ErfdpNU9ocsqVcy53cPel1mfAgD/6mVCyqs3Wz40HAm7tX5TtndaN
         5a2nRO+94Se59FQDI8hxR/eQEYBClytGkk0GtqOECRZIpHoVf3HR0jPB2NzT0MjBpNZP
         maVgEdc6U5Qe+qHJQ+476w/zoQnOwetPdH5RfvjnfeJWmC9bLamMTfhrTt4I/RCqZNr+
         bqWg==
X-Gm-Message-State: ACrzQf0anbm9Da249NLDgG9RzEQtNC8vOFFOAYRbvj04kXjS4NRebOoq
        9yfNJVnh5wgIYmwglSSB2y0fvw==
X-Google-Smtp-Source: AMsMyM7+gdQKhNe4Km/RBuyvkeiDyZXFdAG5dbAI6xRXqdla+5Dz1TJvZGhbH96CCTZmGlhNxkf35Q==
X-Received: by 2002:ac8:5f4e:0:b0:39c:c417:5405 with SMTP id y14-20020ac85f4e000000b0039cc4175405mr5906457qta.83.1665940963939;
        Sun, 16 Oct 2022 10:22:43 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:43 -0700 (PDT)
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
Subject: [PATCH v3 09/17] arm64: dts: qcom: sm6125-sony-xperia: add missing SD CD GPIO functions
Date:   Sun, 16 Oct 2022 13:22:04 -0400
Message-Id: <20221016172212.49105-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

Add default GPIO function to SD card detect pins on SM6125 Sony Xperia,
as required by bindings:

  qcom/sm6125-sony-xperia-seine-pdx201.dtb: pinctrl@500000: sdc2-off-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'clk-pins', 'cmd-pins', 'data-pins', 'sd-cd-pins' do not match any of the regexes: 'pinctrl-[0-9]+'

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 6a8b88cc4385..9af4b76fa6d7 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -89,6 +89,7 @@ &hsusb_phy1 {
 &sdc2_off_state {
 	sd-cd-pins {
 		pins = "gpio98";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
@@ -97,6 +98,7 @@ sd-cd-pins {
 &sdc2_on_state {
 	sd-cd-pins {
 		pins = "gpio98";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
-- 
2.34.1

