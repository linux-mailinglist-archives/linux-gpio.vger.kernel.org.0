Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8476B9E77
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 19:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjCNSbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 14:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjCNSbL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 14:31:11 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B71C302B9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:31:01 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id bi20so1123729wmb.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bIVnlHmt6qvzfXTr0gBom9xZmGvzExFYpzsX6hvpJY=;
        b=ZewGe8JODcxm8N4lkEAmiZACO9UYNA8LS27Av68xAGVjmTY0Y0qH4+L5NgVK1MKr5k
         Lw5r98+JhKhss3uxnUSW21Va2cUq9qOyFqYISkZ45yCsQYs7ORGk+0iHQ0WVH9UOp1js
         qw5reT72dUevLljlqfifNyaf61dLinbFPtB9XNGUNThjlwrvrND7ZPzgIyRPc9ad0VIP
         SVAErNCyZfNP7619XkHpQn+rkp5xVaMBQwweETgPEMDHejGbmsFWcORJo8+K6t0XsZNP
         UXeX0zw3pTyJAicF86+JPxsU+yxZJ34hEWVD28ZFDNEb7WvCfAP7myvpvPjHxGugkJAL
         DVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bIVnlHmt6qvzfXTr0gBom9xZmGvzExFYpzsX6hvpJY=;
        b=NGHUvfLDRlPlahG6aRKh0+D1pXL1MKW1bqawZ+NwuDUkdtf5WenoPzHe5QEAfZx5IO
         IC5WOWQgM6PU4mDMUEjpdgc648qaLd+OGfhZH4IdECxE8OAzQHuaoBU8q/WBke5DDwUg
         Hyd2PLegvprsMQGnUP5gSk+tSqB1BZEBpWSAvzxY5K8ueS5eJ5HyM2JzTde1pPy48BHe
         PV9TcS19nU0XQBbyeNLQ3o07Ejr9QtZARL9Eb5pqR8iDmpI3QlI8labIHNpSj1u+8Nk8
         CVTGF6x3SWOeL0rg/B4BDuac0RQlukueAF5O9HH29iUHOVQ8mXUOsHPcBqZKbS7mEujN
         WE5A==
X-Gm-Message-State: AO0yUKXCoSyXnk6ruxe8S1jGnE8keg8pxjxt6CZ0YZAfb9LpmnGGIVwd
        ikAReDjIfWMjQWMQxi3KvVa8XA==
X-Google-Smtp-Source: AK7set/nKHX2wRJy6hNhNP/sgA34E70MD8dHqidIvZL0NhP/gMaiEJgIB8b7sf8ZgG8GrGzmdjOPyQ==
X-Received: by 2002:a05:600c:a4c:b0:3e2:589:2512 with SMTP id c12-20020a05600c0a4c00b003e205892512mr14964571wmq.21.1678818659533;
        Tue, 14 Mar 2023 11:30:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:30:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 06/14] arm64: dts: qcom: sa8775p-ride: enable PMIC support
Date:   Tue, 14 Mar 2023 19:30:35 +0100
Message-Id: <20230314183043.619997-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
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

Include the PMIC .dtsi file in the board's .dts to enable PMIC support
on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 1020dfd21da2..b7ee4cc676b5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sa8775p.dtsi"
+#include "sa8775p-pmics.dtsi"
 
 / {
 	model = "Qualcomm SA8775P Ride";
-- 
2.37.2

