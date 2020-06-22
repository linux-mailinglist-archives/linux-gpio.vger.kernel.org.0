Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F168A204047
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 21:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgFVT0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 15:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgFVT0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 15:26:33 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF84C061573;
        Mon, 22 Jun 2020 12:26:32 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id m21so14532762eds.13;
        Mon, 22 Jun 2020 12:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D3mfNI3tpj7TRzILlNnYOGT6ZBrzCCEcbxRV2T2nUks=;
        b=WsjB8NNxnJRtuxY3fTzdww2T0NoEdnimu+6C0ru0tAxn6pKm8sfHSUS8eLMd3AaL9F
         HOWxYt0xRXvIoswC8rsAxmMtrT4PnHw2DUIxhn4zzqC/eW6+kI+hwDtqzzjTnSpve1V0
         Ac+pPI3DLPHzJuXjsEOcBv6M5jaaWkKyYF9dTStQVCIKW0QA6a0G6CAEcM2yY+aoJHrh
         JwGIBuOcdcFDWLbkIy7vO6BdXbYH6Q5gttXFcrQqTfd5q8Y0ADB4X4Kypp1z9S+vXfUm
         AsXAgZdFOdK48vJksWgyObZ7fpMlxuapuwvcqT3j2iNlaeKS7VmcwIaFNXZEEyK0tiHS
         ivqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D3mfNI3tpj7TRzILlNnYOGT6ZBrzCCEcbxRV2T2nUks=;
        b=sdfzuWqeQqI5GjF7kf+mHBn3LWDR+DBZagZQ3nCfnGhAK4MSHCXuX3Enk1ewbBlWn1
         fcdtpTfAl0WvojPV2QbZ1aBb1BOlc2F4KP+XiPtVbxcA/PUWOHlnFHpFAAHg0izE+6SY
         9MJ1GytPoRKsrkyANpaGXN4LkNIoUJZ0fqtnQOIaUCL7+Xm6Rs0tk+x3S0WQJ2xCKhUS
         aNB2pPHUXoSs5e2DCD3ZLGsGvObmT7FS0xsCmGS88xJvyb0C/njsl2k2zttAVBaPUpoX
         0dLjWXu7X5Qhtygw5UKhpa98jS1vKysOSiKtt8zOR9EznaLvyvRoayTFpbnt+wffDHre
         AVcw==
X-Gm-Message-State: AOAM530WUn/JbAlmcfMbe9d1Q9VJ2e/uNQkTNkDuVzCJzkDLYfNNQudF
        8IuMCBmdRSGUE+VsW4uNFec=
X-Google-Smtp-Source: ABdhPJyEvTKKKK1QUgvSAgIB4e1tk+u8wJU/dGxWTG0TwnjrRa4CCrBrWgHPVhWLKjxqOoOqh0h72A==
X-Received: by 2002:aa7:dc57:: with SMTP id g23mr17807266edu.352.1592853991490;
        Mon, 22 Jun 2020 12:26:31 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id d16sm4043336ejo.31.2020.06.22.12.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:26:31 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 7/7] mailbox: qcom: Add sdm660 hmss compatible
Date:   Mon, 22 Jun 2020 21:25:57 +0200
Message-Id: <20200622192558.152828-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622192558.152828-1-konradybcio@gmail.com>
References: <20200622192558.152828-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Qualcomm SDM660 platform has a APCS HMSS GLOBAL block, add the
compatible for this.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 12eff942708d..b4501c6b5c6f 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -22,6 +22,7 @@ properties:
       - qcom,msm8998-apcs-hmss-global
       - qcom,qcs404-apcs-apps-global
       - qcom,sc7180-apss-shared
+      - qcom,sdm660-apcs-hmss-global
       - qcom,sdm845-apss-shared
       - qcom,sm8150-apss-shared
 
diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index cec34f0af6ce..ab0275869434 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -49,6 +49,10 @@ static const struct qcom_apcs_ipc_data msm8998_apcs_data = {
 	.offset = 8, .clk_name = NULL
 };
 
+static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
+	.offset = 8, .clk_name = NULL
+};
+
 static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
 	.offset = 12, .clk_name = NULL
 };
@@ -150,6 +154,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
-- 
2.27.0

