Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0220A6C1A95
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Mar 2023 16:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbjCTP6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Mar 2023 11:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjCTP5t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Mar 2023 11:57:49 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A47126D6
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:07 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id d17so2388451wrb.11
        for <linux-gpio@vger.kernel.org>; Mon, 20 Mar 2023 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOGGFNiRJEuMjhJtfyo06CFlZ9jQ7DwjlMMoJqx1/zY=;
        b=SnqRqAXL6AK6aJJVnSr6uVSgZnneUYWZaDafiDfpI+ZuS6dbhMUsh1mxxXDhKRO5d+
         vbKLnJyqlREz6EbbiyHVP4Hhsv4/x5l8fLTIyx2r6ninqqRWMK7sdBqagvA9pXCX8j8N
         +fUlHZvXyjVmJ1fANuowmw4ZVKFQSX5DOZ/ODX1EXJSFcZyQWn0dubXhxxWuiTcpuV1z
         IvYCxKjuFdqpqruvrtIm601irUzw4Y2A1T1efpAoRAeKFFbRDY7v8Jv+j1z2t7KfLYJS
         AXhiI7IBTw5PaBtcOBwL9xfWbGA+Ny04GB/H6xNZ7ZVGcoOedqvBmywNgVM9dZXXdwOl
         buMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOGGFNiRJEuMjhJtfyo06CFlZ9jQ7DwjlMMoJqx1/zY=;
        b=MOZYBsUQaDDw9+tw1xyMRkoEdO2igpDtd2OtJ7HxBg7smJF2gd+LY3lxlZJsP1bmY7
         E5jU+AKJARYBcsY52FOImcIFyNDijgP2i34tge74cmkys4ahCDR2pIisNsynANxXA63m
         DhY4ATLQfzy3/s2y9iRylUqpXdkU1deESpCfAP/7QrbNElr+dC8BcNT+i7YqUHtxgtma
         S9WF91xqlZnogNL5h0uKTGgXn+zhRlZfO6Cy2vQN50yhb0pN1tsNrSnpOpWM4g5xFaQN
         wOUaaBm3OVpjZuDWPU+VUhukjh21oNgX6IQBdCHiHzirU/uH/zE5SfvQnJKVm1Xd33h5
         e57A==
X-Gm-Message-State: AO0yUKUsSsKX6KGhNFJGN8Hs5cEp1d+aF4MV3M6IWB/Gf2qinal03GFM
        L1uMrY3UoOe1kmhp2PgkkkLjiw==
X-Google-Smtp-Source: AK7set/8wu6gTQyH8qNsDqPt4F0vVoW7STePOGp+0cBDL/CDwLG1WYBxUyxOPNd0025L/PLwyYJYhQ==
X-Received: by 2002:a5d:4381:0:b0:2ce:a8e2:f89e with SMTP id i1-20020a5d4381000000b002cea8e2f89emr12788838wrq.46.1679327337601;
        Mon, 20 Mar 2023 08:48:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:48:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 07/15] arm64: dts: qcom: sa8775p: add support for the on-board PMICs
Date:   Mon, 20 Mar 2023 16:48:33 +0100
Message-Id: <20230320154841.327908-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new .dtsi file for sa8775p PMICs and add the four PMICs interfaced
to the SoC via SPMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
new file mode 100644
index 000000000000..afe220b374c2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmm8654au_0: pmic@0 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmm8654au_1: pmic@2 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmm8654au_2: pmic@4 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmm8654au_3: pmic@6 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.37.2

