Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C93662EF21
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 09:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241365AbiKRIYr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 03:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241362AbiKRIYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 03:24:46 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9683068295
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:24:42 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o30so3121404wms.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 00:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCj0dVvQrIlDStuTc/HtBM39cFcNUtJEg5lczvmxgKs=;
        b=F85IL8T5v6/v6K9gxmj0dgpbGs9+fO/f3+r3qSY4Hozja7efqI6Vm+NbDBE+2UMfpE
         vwKNorHV3pnCq2+pRfEVaB6hoJiOGBjYp1nW5hZHJPAHgxSYmpNyyuEjIjU3Zu2Dlx/o
         gmsxg8Q6dKERAB3nm2BdA4YD8t9GwlWE7JAX1CLLmfNjZMTe83A//tIpT+iHAOJ4ru/7
         9vjVZlhPFnyRE85o7MomceBIGHTONen+iMU9mWQMC6O0evJWMupsZl0z8H6BtoMdMW1p
         roDHIWkoZGhosof6vdwNG/5rp+VZgzIKQIv3pin5b2vFZSbzpkvjRWxT9i1wVBNXEaiY
         q1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCj0dVvQrIlDStuTc/HtBM39cFcNUtJEg5lczvmxgKs=;
        b=pquZl7so8HzPtTYHQfxKPbqt4XvLnY+GNDOJd9Hd1WjLHIRGWWu+yNTVI3g7FAzB0Q
         ly0BgnZJ76zBy+SCh84pVHL+qpUcw4UqGVgun7ZGwx5m5X0TLLgQvmMzUIAchdZdavxQ
         ufQhA+Hn0bhpm7PwXMsIO4NHerxXrtS5bw4ECs7NtRMwbYevnNVNEnYx0ubGR28f/cTk
         UXcpEBW0/AU0vjjKuRZMehYXYIDLZ1jN/Sx9RBx5Gbp3brFEH26kqsE4FSdfVqQjpAX1
         JRg3FEjml2hE07DizeRDzc84ahMhH74/vBqGZaf2SqvlZq0fQ/3UFnRijimr5tQhO4Wc
         RC3w==
X-Gm-Message-State: ANoB5pmO03/4IBwiWe239tZRjZwWM3M92FW603XIxTKVAoapRbGmJBgc
        2OxhyAmD714OK2eX+HbV2SQnHA==
X-Google-Smtp-Source: AA0mqf6Cca8aNYchWphhM5cN8e96CVy2ffjRIXxBbWHKFM/S+BV6+W6wZgIbDJB8mjWcBU9cdyao/Q==
X-Received: by 2002:a05:600c:19d0:b0:3cf:e7b7:d87d with SMTP id u16-20020a05600c19d000b003cfe7b7d87dmr7241767wmq.95.1668759881064;
        Fri, 18 Nov 2022 00:24:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c4f4400b003cffd3c3d6csm4070084wmq.12.2022.11.18.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:24:40 -0800 (PST)
Subject: [PATCH v2 0/3] qcom: add support for SPMI PMICs found on SM8550 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAEVBd2MC/42NQQqDMBBFr1Jm3SkmatGueo/SRRIHHTCJZFQo4t079ARdfd6H//4BQoVJ4HE5oN
 DOwjkp2OsFwuTSSMiDMtjKWmNMg8mVKGvJaUSJXdtWuC3K5CLKEhkHG/q+p9AOwYBavBNCX1wKk3rS
 Ns9aTixrLp/f6240Xv8f7AYrvNd156xvvG3Mc2bd5FsuI7zP8/wCRyhngNQAAAA=
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 18 Nov 2022 09:24:37 +0100
Message-Id: <20221114-narmstrong-sm8550-upstream-spmi-v2-0-b839bf2d558a@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SM8550 based platforms sports a bunch of new PMICs:
- pm8550
- pm8550b
- pm8550ve
- pm8550vs
- pmk8550
- pmr735d
- pm8010

With GPIO support on:
- pm8550
- pm8550b
- pm8550ve
- pm8550vs
- pmk8550
- pmr735d

This documents bindings for those SPMI PMIC and adds compatible in the
PMIC pinctrl driver for GPIO support.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Changes in v2:
- Squashed patch 3 & 2 into 1, added Reviewed-by from Krzysztof
- Squashed patch 5 into 4, added Reviewed-by from Krzysztof
- Squashed patch 7 into 6, added Reviewed-by from Konrad
- Link to v1: https://lore.kernel.org/r/20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org

---
Neil Armstrong (3):
      dt-bindings: mfd: qcom,spmi-pmic: document pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550, pm8010 & pmr735d
      dt-bindings: pinctrl: qcom,pmic-gpio: document pm8550, pm8550b, pm8550ve, pm8550vs, pmk8550 & pmr735d
      pinctrl: qcom: spmi-gpio: add support for pm8550 & pmr735d gpio control

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        |  7 +++++++
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml    | 18 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c               |  6 ++++++
 3 files changed, 31 insertions(+)
---
base-commit: 8274e19d9db1019f8fac39cf46da6680513fd5d3
change-id: 20221114-narmstrong-sm8550-upstream-spmi-d2c999ec5dc1

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
