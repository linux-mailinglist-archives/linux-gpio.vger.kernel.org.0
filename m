Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515C25E9274
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Sep 2022 13:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbiIYLHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Sep 2022 07:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbiIYLGd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2022 07:06:33 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3DE32074
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w8so6727749lft.12
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ltd+pnwzPyeoA6eImt7eQVAAefud/sfm9oMKcojNkgE=;
        b=tlLlTMpTqrKh2WFQxL0HxNPtdRO4n/J/OM+kRemabxcSv9/uTCsvSxp/EsJEuEEloT
         7aHKKjmatBWss8LjUYe9lwWMzBLV2357i+qCsMXVsSwM654tuDXcXlJWUw/hc+8qkdos
         U2Jw8NbRsMO6KPt2y7qXPnge9OFyvK994HDQX+bhYkgiKvdisDeBqlbMdjxIhnZ5wunm
         nAAcofJ4QOWGr+Uodn24B2o2RNDCofxT4M9XN+KI1XNU4Ez8Lw/7+UwtJetT+9bWsMWX
         LYQ/UY5peaR+fFehrp+0pNULIY8Si8LXuwuewdy61wcVKjTxzCQUGr/eraIK+v92qASn
         LmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ltd+pnwzPyeoA6eImt7eQVAAefud/sfm9oMKcojNkgE=;
        b=KxpQvCmTE+O2blrhIpapHQLaDp2T1i5R/3YHwRfHgFERA9xMFyxMuEV9YXIk1qiu/R
         BEoxnTrGdUYXgLFvY3VH3UFzKbJQql+3V5KmBHjqhT1hk4lRfCxT2xUxG4Gt1cVC26ia
         BKWyW6Ynyh/ExPTzowmPUjn9E8qTJdbqBNQBGFEltJsv2I+W55bzXtASrzQkG0ndqd/n
         QhQtO1wh14b7Yv03+ILd2PnnTCU1NtA5FiGHDKGJ/MgHxf4/kxJtcC4C1dyX8OeU+/ZT
         CwfzF1h53vcSIIGP+Tfn3zcFQjJ6IgzpZCBOax0+6XkdUeGQSVjGGSbwQdjHJ6boliQO
         B7lA==
X-Gm-Message-State: ACrzQf20rM9RE0RZ4c3A3Z3xdf4I/V32EgQqWd1exMjL053uKpFFSDx+
        l1Z/SqrHYW9HHK9jn7++4v9uPQ==
X-Google-Smtp-Source: AMsMyM57t13wYv+t4apXeTo8L58bPl0in9J6WQ8xwsyPKvSKngP7eSxTQLlL2f2v+koI5KRxQNjDdQ==
X-Received: by 2002:a05:6512:3403:b0:48c:9727:50b0 with SMTP id i3-20020a056512340300b0048c972750b0mr6404437lfr.309.1664103983645;
        Sun, 25 Sep 2022 04:06:23 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:23 -0700 (PDT)
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
Subject: [PATCH 09/15] arm64: dts: qcom: sm6125-sony-xperia: add missing SD CD GPIO functions
Date:   Sun, 25 Sep 2022 13:06:02 +0200
Message-Id: <20220925110608.145728-10-krzysztof.kozlowski@linaro.org>
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

Add default GPIO function to SD card detect pins on SM6125 Sony Xperia,
as required by bindings:

  qcom/sm6125-sony-xperia-seine-pdx201.dtb: pinctrl@500000: sdc2-off-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'clk-pins', 'cmd-pins', 'data-pins', 'sd-cd-pins' do not match any of the regexes: 'pinctrl-[0-9]+'

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

