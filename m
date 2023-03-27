Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D789F6CA4B8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 14:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbjC0Mxm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 08:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjC0Mxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 08:53:30 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6391210C6
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:28 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso4854816wmo.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCfaLfkFa9+r23DNhVQqZmyOO2Rn4kY0uWG6aZK0HR8=;
        b=PYBN+u4b1Gohk9bh2TKYaETvHvNPu8a/7/SNvTVGy8lroSQ6N6YNFD3LFHqGuO/OHn
         ucJyoCHrpNHTvFYD+Fve6MCPLWomRjMJDY4tdk0dReUgC0Iubjy6wOi0EnjCM7VlqALs
         e6Kcd8Rq66c5HJVX5lyvB6K19tmWa9bIc3HlGSYJ6VOzYJHWFRQkjPuqwS0j2G7nVNt9
         zww0SLIMSbSoL5jE+xEL0vT1WI102PMMAimVnzzgwRMaSY3gFqTBTvU9fHorqjVoxPoD
         tFEoA5B4ta2xMRZjxrL+WEpST86DotAQTbi5djxeYLdk5irUAVW1e/iHTPS2dqvM/KN5
         vQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCfaLfkFa9+r23DNhVQqZmyOO2Rn4kY0uWG6aZK0HR8=;
        b=jqxQrs9XZFoEib8EpVnSFFz7fBxASYCZfam7EErf3jVA3hRUb7fGuVaDC/RzfyjHIb
         Yex8frFtefDb0qd3F8BgYywVQ3Zf5ZBz8hpQuKl/ParEaYJg2+f+JJS/BWqWDcu152y4
         Z+i1bfXfrCfc3ij7NroxTFrGUE2NAMhP4rgtpRa1AI8TsrwjuGo7nIBa+gBGUqq4oinj
         /Ne7xbWgOcHvIB3aoV36Pt9S5VNYFRypXvQAN8Ey710UD5cqvW/F/m2Mg4k2Y02AwwXr
         Jhj2eNZK+0iGmrDNnziY4t34c6RlV9NSL4sSnxNTR4KZOq40R91x6khmi6I+/3ah+evK
         Df9A==
X-Gm-Message-State: AO0yUKV/1i7SSbaXZFZRjEtcydxN2nMBSHsk1vjvGguV08QSsKYn08+d
        oAMPW88p+ahuEvIGhLoGeCFSLQ==
X-Google-Smtp-Source: AK7set+brWqvOktXTMt7JRWGxzKOEw32VebNsxv+m3zTuLyQQgQ+hqQDyx53EY5Yk3RvBviZPdJJQA==
X-Received: by 2002:a1c:770b:0:b0:3ed:4b0f:5378 with SMTP id t11-20020a1c770b000000b003ed4b0f5378mr9168056wmi.27.1679921607876;
        Mon, 27 Mar 2023 05:53:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 09/18] arm64: dts: qcom: sa8775p: pmic: add the power key
Date:   Mon, 27 Mar 2023 14:53:07 +0200
Message-Id: <20230327125316.210812-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the power key node under the PON node for PMIC #0 on sa8775p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index dbc596e32253..f421d4d64c8e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -19,6 +19,13 @@ pmm8654au_0_pon: pon@1200 {
 			reg-names = "hlos", "pbs";
 			mode-recovery = <0x1>;
 			mode-bootloader = <0x2>;
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
 		};
 	};
 
-- 
2.37.2

