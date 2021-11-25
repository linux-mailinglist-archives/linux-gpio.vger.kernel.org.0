Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2BF645E2D0
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343804AbhKYWCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 17:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhKYWAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 17:00:40 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527CAC061746;
        Thu, 25 Nov 2021 13:56:45 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id k37so19405314lfv.3;
        Thu, 25 Nov 2021 13:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+xEZeptIFxKUhbqhiFVnqGqN6Ab8HrFfKJKYFIcuna8=;
        b=j2jrdtKDfjIF2/VQumwah3x35qghBAF7rFhqOYBOVWX6j1XP7FenYr7ZaGu0DT64RC
         IcDufkGKwb9awNbIS3un1qGBCRE+qQ4hzaVcTokthbyUfGTLRZPO4Fu4+il3hXokqzFh
         1wm4cxOYo5pM57dSkpwH0DIfniwJ4bJ3hQg0F+OuYCql0TPLz2T2DskvAMtSlv5nQ2vB
         WFydVv9DeLwSLnyDsoN4kitLK801s/dkTsBSOgMmGoSsR5yRqtQmKMk56BiQvDZ72E30
         6XcdWgQz5CleDItEeVR2CMK1nMWhL8HT2CA33Q818jEWRqSFnSQlnq5moY9q23wOIjRH
         hLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+xEZeptIFxKUhbqhiFVnqGqN6Ab8HrFfKJKYFIcuna8=;
        b=gJvdSZSBZgo250modi/bnshj0RN3VCUi8aOcrEUaLpuwW6lbuyxyUgDfDRIuirBHpZ
         SRFp09IWU53YdER9wByflNjGqChSBhd2xG8wypsxAYc6XHXUBCFW1dFpWL4h8Tg5bUhg
         e+SqWn3FPFVbVYMB+Ep8Q2tLWArcMGbQs5/EzJ7FW4/H0ruQnbXJzIaHwnpZPUy4U5Wm
         RDyHqlagWYXxLsvB/HoN5BcC/5VszkrDY0woKbdRxV0GQKQpREA8d6NtaMzz52dJG21z
         vE4BQDZNfFCuTELMKexrU0SxY2EmvXdfJp0MNn4PIKDRDoGvkzNKIz4iKs9MnCNWXPRK
         2YUw==
X-Gm-Message-State: AOAM530WZqgjtCkJusYXt1b3YxENhVviCf2BskHKMh7do1vZBY71II0q
        kQ1Z6MlvVhlEAl+S7QmDGWo=
X-Google-Smtp-Source: ABdhPJx1mrubuqNyQ0dooCVOTMGD+K7aLr/k7C1mFcvBED8jX1uELx0eBU7Rl+Ez/uWq+6ymci64vQ==
X-Received: by 2002:ac2:4119:: with SMTP id b25mr25681466lfi.3.1637877403556;
        Thu, 25 Nov 2021 13:56:43 -0800 (PST)
Received: from localhost.localdomain (public-gprs212807.centertel.pl. [46.134.170.136])
        by smtp.googlemail.com with ESMTPSA id l16sm404861lfg.90.2021.11.25.13.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:56:43 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH v2,2/5] dt-bindings: pinctrl: qcom: pmic-gpio: Document pm8226 compatible
Date:   Thu, 25 Nov 2021 22:56:26 +0100
Message-Id: <20211125215626.62447-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125213451.62010-1-dominikkobinski314@gmail.com>
References: <20211125213451.62010-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 8952b4cc1262..293f480ad0b4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,pm8058-gpio
           - qcom,pm8150-gpio
           - qcom,pm8150b-gpio
+          - qcom,pm8226-gpio
           - qcom,pm8350-gpio
           - qcom,pm8350b-gpio
           - qcom,pm8350c-gpio
-- 
2.34.0

