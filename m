Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83315F129E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Sep 2022 21:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiI3Tae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Sep 2022 15:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbiI3TaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Sep 2022 15:30:21 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C35C3206B
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2022 12:30:09 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id p5so5784291ljc.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Sep 2022 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=otCIRU4GGd1lvww75mOgK5nY3xGQD+p6iPG3YaT4+2M=;
        b=XtOAuzmNgm+SzNKEsckn4knlTuEtBRCys11lnJHKgWJhxOWiYr9+g+QQhaBdy30o5Q
         EAe7hqxdvQL0PTc52lcYzo5HAzEakabfhEhziDKmkzxGDhXCh1SoewcKJRsrUGwgCO/q
         1jPQGyKOLUh0JeRm4T8u4yGsV9dgt9B5S+vDZo3eM55m6aAUGJdwqBNWjwkBvQcbidF/
         coXWjhtNoTvxZxqT9S9OolhXtt2fb8VqYr9el/Xth2JCY8jEdB3yW1ZBL5h44K9rm4q8
         5StCDPABR63YgziV1WeKI2aYcLeP8kRSjqVZ0dhq8qRXsE75DGZxgXIOb/1cVwHD2zHK
         p96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=otCIRU4GGd1lvww75mOgK5nY3xGQD+p6iPG3YaT4+2M=;
        b=AY2pmZqG8Y/2EfhfoJgvz2030Pdm7AgIPo8OXnrIdrqIrQrpwknJSW9Au4ePNe0fA8
         9n3Xm0sBIAQblU1K6iPbijxP1CGZdipV0Yr+Jkt+4c6ECYGzo/COG5vxNQmNc+4CNCCm
         MWg1nwZNADbtZKebqV6ipQtzTaHg7OduSw/lSSoDd5Qv0YlIAshO2M79bSnhWjGnhIc2
         tblBPjhGYgES/OXLRITSc3qQSaOVBOdD130ubXxacaUaGYYEcvHsaYSeX67e6efkD8/K
         kCZpokREN8zDGhJ/LlgtS6gtJSEdLJKeXsPbsXHYk5onIsWm4LAYOiD1SE4Gxk6wVzHE
         XyWA==
X-Gm-Message-State: ACrzQf1Fn3vYNuqc2dhDJxmkHAnOKpFAGVS74D33Al/P+61+1sch9cIC
        fwMLu8rGJEAkOmTeF6O5WMbEXA==
X-Google-Smtp-Source: AMsMyM4BW7D1iCE6XYv6UXwJa93QmslOjdcD1E8Aki3+X5vx9i+UwRwcUvOk+tdp/ZstMu40K0xa+A==
X-Received: by 2002:a2e:7817:0:b0:26c:3e9c:3465 with SMTP id t23-20020a2e7817000000b0026c3e9c3465mr3042669ljc.145.1664566207530;
        Fri, 30 Sep 2022 12:30:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:07 -0700 (PDT)
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
Subject: [PATCH v2 10/16] arm64: dts: qcom: sm6125: align TLMM pin configuration with DT schema
Date:   Fri, 30 Sep 2022 21:29:48 +0200
Message-Id: <20220930192954.242546-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
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

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 1fe3fa3ad877..af49a748e511 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -407,13 +407,13 @@ data-pins {
 			};
 
 			sdc2_on_state: sdc2-on-state {
-				clk {
+				clk-pins {
 					pins = "sdc2_clk";
 					drive-strength = <16>;
 					bias-disable;
 				};
 
-				cmd-pins-pins {
+				cmd-pins {
 					pins = "sdc2_cmd";
 					drive-strength = <10>;
 					bias-pull-up;
-- 
2.34.1

