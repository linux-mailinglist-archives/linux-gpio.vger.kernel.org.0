Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EEE3AAB0B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 07:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFQFgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 01:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhFQFgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 01:36:49 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB99CC06175F
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:34:42 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id m2so3991156pgk.7
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 22:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5vymR9vEe1gwFyB1z0N/gT3waUjY8ME8wV8pdxM/FA4=;
        b=gdm7KB+XnV2iwLdfceOGNsWjtIxYaeqOY89xhyab9IFBN5WTkxN+zAoZ+ljSWyjJHm
         oPdczqKf12eYRW4tEN1K9vM2J5hioDyKNQo7WBbqShjzcQYtvf3HwyHp7kOKwg3nwuZp
         aVdQJySvYAdGXDAB3rDPjKaeB6QbIR0eWvgEDzLeGQX9cW2Qcga7VKkv6u1YxN2r4KSD
         z5AKp6RPpzgf67pFJmwH6ZxOg0+gFBL7fLLdYf/F8+4lME5aNS5gozxIwSyZ8AztAlC1
         CS4K55CMckfXAsYkk5dr+vnSvRRgz8ly17Lket8WhF+aWeUukl+Iukp//9c6YfgekSoL
         N1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5vymR9vEe1gwFyB1z0N/gT3waUjY8ME8wV8pdxM/FA4=;
        b=nVKjGHIrbeae1QP7Py7t9GNhFnT4iDuex0PSBdR0OLpYsfd5jBBGr1cwgvuxd3Elje
         5wIyRBouAUIg//A3tnZmtMqxGtePXLfpk/oeDoM2mjgv7plfkuk9oMzeJn/Q+CU78oct
         DjgylRb5sVlCoTF3zSavzdiNTNGobDUVrBVyhBMYy1wW0agRp0BL2BaTxYE4fq12/ZY5
         DMhpmcuqOacuCpzT9xnqnrRdIQ853IVQIXIJ4MGQWAaigwFd8TzbG/mvj+D5Oyb0G8V4
         aszlGQrpv8mMm5v8vKm784adJAGoG62Dq7l9WYCDWCS0yJKdO/H5YSNdwd6H1KYLU2Z6
         yofA==
X-Gm-Message-State: AOAM530oGAvGAc4Qe6f6WCeMbjlLsoP/6fWy+mn4S1Bt5iE1QV3IB9Pt
        sM26EShIHKwVAlJPSFk8nQTZZQ==
X-Google-Smtp-Source: ABdhPJzp3Zjon4xOYV28bQpQM+rS40C5QGV1ys7Wdo8Mri8ZAyc2BtPPzujTjS3udRism8J2LvXRkA==
X-Received: by 2002:a63:3c17:: with SMTP id j23mr3311249pga.281.1623908082292;
        Wed, 16 Jun 2021 22:34:42 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id m126sm4056405pfb.15.2021.06.16.22.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:34:41 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/4] pinctrl: qcom/pinctrl-spmi-gpio: Add support for pmic-gpio on SA8155p-adp
Date:   Thu, 17 Jun 2021 11:04:28 +0530
Message-Id: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes since v2:
-----------------
- v2 series can be found here: https://lore.kernel.org/linux-arm-msm/20210615074543.26700-1-bhupesh.sharma@linaro.org/T/#m8303d27d561b30133992da88198abb78ea833e21 
- Addressed review comments from Bjorn and Mark.
- As per suggestion from Bjorn, separated the patches in different
  patchsets (specific to each subsystem) to ease review and patch application.

Changes since v1:
-----------------
- v1 series can be found here: https://lore.kernel.org/linux-arm-msm/20210607113840.15435-1-bhupesh.sharma@linaro.org/T/#mc524fe82798d4c4fb75dd0333318955e0406ad18
- Addressed review comments from Bjorn and Vinod received on the v1
  series.

This series adds the pmic-gpio support code for SA8155p-adp board
which is based on Qualcomm snapdragon sa8155p SoC which in turn is
simiar to the sm8150 SoC. 

This board supports a new PMIC -> PMM8155AU.

While at it, also make some cosmetic changes to the qcom pinctrl-spmi-gpio
driver and dt-bindings to make sure the compatibles are 
in alphabetical order.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (4):
  dt-bindings: pinctrl: qcom,pmic-gpio: Arrange compatibles
    alphabetically
  dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
  pinctrl: qcom/pinctrl-spmi-gpio: Arrange compatibles alphabetically
  pinctrl: qcom/pinctrl-spmi-gpio: Add compatible for pmic-gpio on
    SA8155p-adp

 .../bindings/pinctrl/qcom,pmic-gpio.txt       | 60 ++++++++++---------
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 33 +++++-----
 2 files changed, 48 insertions(+), 45 deletions(-)

-- 
2.31.1

