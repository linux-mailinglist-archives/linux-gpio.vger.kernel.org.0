Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F724535B6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbhKPP1J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238133AbhKPP1I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:27:08 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236D3C061766
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 07:24:11 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id f7-20020a1c1f07000000b0032ee11917ceso2718252wmf.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Nov 2021 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ic7tuGpaS8/hqtPDK3UcPIMhRerIURUqlJhICnkZYYk=;
        b=TFNgiwmCLGCEdZck6rW5G5PXMyo9TiiyaF3olI3ZQNcUnvhbxzUtTzytWCIG8590fP
         Gvl7Kbompuj+h3ZSdbIXsTIBtTOwuu4NBaaET/Pu3V8NYt3zghmOkES9NX55cRFyCmoP
         238ugihGpWjJSgX+1PKhK8ennyq75SWv4u44nIJOcdqTKCkOyHrIeOaP8umP+k4Vlbk4
         XyK8S2+OwJYeS4Xz4ZkykFMsSa6MY362JSHui4xaWfMzizHBNRuCvlu7FMi8Gigv9dg8
         q1Tirl7+tZAEpE8JKQVugR8Nloi6dL5uVv+q6De3n27VAFvS5t4MRI5S42x445Qlp9/Z
         K0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ic7tuGpaS8/hqtPDK3UcPIMhRerIURUqlJhICnkZYYk=;
        b=aIl2XXgU49WeJk5TNY8rlOSWdfpMwfeqTYA4wXbWZdeV32NF16QokkoG1mqwHr4O5M
         R8oybKoy2MbqQeKXD5lML+j3zGYmfFkLl/M84dZxGl4w2knfMb5jxdkDNRZCkG0I/6Mq
         0b3x1mT9EvDrnyparCdU/n0BhlizxOZUotOq86y52Fq8LL9cEqVWJq15CtktQzpN6Ljh
         SxDoRnaqyt04mz00rj+Wd03KSOnMYmLEWuB8KP/9f+5LCFDaMAsDSaAQN44yfQzn5rBD
         6b63mYnCzzARofyF6y0Yo27dn3uIe6VmY1xYQPv2Igek8/hUIiBF7YFZQ2zsoOrwv7Z7
         ZdGw==
X-Gm-Message-State: AOAM533MWJi2bBBVmC1qedx0xk5oyuOi4ytQLDykjkFC3rCgkuf6bLmj
        6s9sEKpkRM9F6bRmEZ+aQTk/IA==
X-Google-Smtp-Source: ABdhPJwdMTQXcwElNEb7d90Bgd7XvdzwElkRm0YBfVkOQaFEmb/6q16deDVzwqbeSC+m0k6krrjzxg==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr8788746wmk.27.1637076249577;
        Tue, 16 Nov 2021 07:24:09 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id u23sm18847352wru.21.2021.11.16.07.24.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Nov 2021 07:24:09 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        shawn.guo@linaro.org, bjorn.andersson@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] dt-bindings: qcom,pmic-gpio: Add pm2250 compatible string
Date:   Tue, 16 Nov 2021 16:35:15 +0100
Message-Id: <1637076915-3280-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637076915-3280-1-git-send-email-loic.poulain@linaro.org>
References: <1637076915-3280-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible strings for pm2250 SPMI GPIO to documentation.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 8952b4c..42d8491 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,pm2250-gpio
           - qcom,pm660-gpio
           - qcom,pm660l-gpio
           - qcom,pm6150-gpio
-- 
2.7.4

