Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70E93B721A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jun 2021 14:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhF2Mg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Jun 2021 08:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbhF2Mg4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jun 2021 08:36:56 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E72C061766
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 05:34:29 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id cx9-20020a17090afd89b0290170a3e085edso2356027pjb.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jun 2021 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=08olEo+l7lc9p8Mmtezyj9w90KFJHlqPp1LZ0fIu3/U=;
        b=OeEpzZRnI1w/aTKv6sCy3gps1Y9gCNWvEzou3m3bJ0D4h8rodQ5FLuyvcUaLGs/ot1
         2ReB3/V6G69mmhBQQr0IrN1GqhLHpSg/0sz/4ozLWXaIQmqsh+T98cYdh2B3XJ6Np1cs
         69MQshW3YVSdOGK6J2R6bquH20zfpCWqE0dGVhX9zk38uRRvFFoz1dRzQdHUI2sPsgbN
         5UT6anUhNbxc6hXm7AB/ZHMRrmxTa94qaomexNcSTnbu7sPJmI/zCy7twMr5H3ThfUIy
         EBMhWTI171XjYFz7+PsmuAR8PYeqyLPa6bIqqygNbkvG+kUwV7BPWZ9mtNQErVbqW5hw
         93dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=08olEo+l7lc9p8Mmtezyj9w90KFJHlqPp1LZ0fIu3/U=;
        b=dxzthag7AQbjgLO3S32nLnCJ8V2ZPZzlppO2foyN5bSQ2Jzf0KoTmTDE2DA2SPvRtk
         deAOWAmrRcxbcZ7QItr+5V8FiORA5nuVpliMd+wEels+Y+X+7ydt2v5QUFVQWdRA+8x3
         0w+/1pTxAww7EA4nJTWLJOP84DB+9P52s0VzhyQW2MVSzRiLrlizPBGx85L5Y76c77Hp
         1Tdm9RjOTrPx26lrw+iu3bMNdgsYEjcPVcYQaa4RsHTxbKjgn2dtCzEi7ZxpUFscOp78
         0kpXDNkkwbgdvlqjxwowNtTMHHkZz7NCQaS2QDVOyVRJA5Wj3oSkiPdK/gwUFL96tc+P
         0HsA==
X-Gm-Message-State: AOAM5321Wkfxz9pM9omrUBJ1EFIiybKhGIxGfxqIvLyc28kZLO/eaASz
        Uypz93EtflmzrhgMUPQ5V3d7gA==
X-Google-Smtp-Source: ABdhPJxNB26ussGz4q7Tzio0I7waWW1w6fmF3q8wj3QpLf39crjBOIQ/UKHI6ouiBexJl1JVYb9fSQ==
X-Received: by 2002:a17:90a:bc89:: with SMTP id x9mr33858494pjr.228.1624970068126;
        Tue, 29 Jun 2021 05:34:28 -0700 (PDT)
Received: from localhost.name ([182.69.252.226])
        by smtp.gmail.com with ESMTPSA id 143sm16176692pfx.46.2021.06.29.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 05:34:27 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 0/4] pinctrl: qcom/pinctrl-spmi-gpio: Add support for pmic-gpio on SA8155p-adp
Date:   Tue, 29 Jun 2021 18:04:03 +0530
Message-Id: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes since v3:
-----------------
- v3 series can be found here: https://lore.kernel.org/linux-arm-msm/20210617053432.350486-1-bhupesh.sharma@linaro.org/T/#m2b1bf2d32dfdde3196dc5342722e356ee1f87456 
- Rebased patchset on pinctrl/devel branch.
- Added Reviewed-by from Bjorn for patches 1 to 4 and Ack from Rob for
  patches 1 and 2.

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

 .../bindings/pinctrl/qcom,pmic-gpio.txt       | 64 ++++++++++---------
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 35 +++++-----
 2 files changed, 51 insertions(+), 48 deletions(-)

-- 
2.31.1

