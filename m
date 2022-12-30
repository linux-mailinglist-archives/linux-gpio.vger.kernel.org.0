Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42C6659BB1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Dec 2022 20:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiL3TpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 14:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiL3TpF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 14:45:05 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD2018397
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 11:45:04 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id m3so6838796wmq.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 11:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q72SkNrjUv6hApXPAFQeSLQafL5ZXzh4liHqcfBQoss=;
        b=cl+lv5TpIcUAycTAeAn5TmieFmvwZ3TC9P3bzUzh8NMNaZlhTHCchdvZLOWRsIwFHF
         N739iA1eLpJa7Rth4rnlBI9QqtmQKQGA5bjBmcwrUOS7Rrj0lzIqslyIPJZTZyS+FTt1
         bwfUrkYy1W85CM42cEi+eqleY8cvrhYnwutMZrTSmmzQAY/W1W27lVBQ8YyCxvvqGjbC
         YDkMQiAkXazpjplvjj+Jn0i+CsnsLgbpSgJ9FlrQwnBTzQM7YKBoWutv07wbQX7/hRIX
         fq8YzxjbBpkKJvpOwi+f/HGK9+xIy1CxvKgOTwS7DQDHMCoFpanNaTvE1wvHv6WZ+viZ
         qiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q72SkNrjUv6hApXPAFQeSLQafL5ZXzh4liHqcfBQoss=;
        b=QHbE0B+z2+qUais2SnC2U3c5nChn9YwK1kbsHbFtdz/RnZ+lyL95xoHsw96QvRgIrY
         yWwtfCZEpm3KzpoizoyVWcy3zePkiVOcr80KY8LbFrcdwJxnFgHe/pK4zG0EoLcEFx4n
         xwZqwaB6jN0K96iIwimlQvG3+pqHt5uIbeaLQFQFVFmEQqqG7jz9w4Z4F5ai/Z66+ygx
         9c7CUM6zV700sgIgjHGMpMynbSqUzncI8aukLrh6oZ+q1hIMStJJM2oyfPD79asZ0fPb
         EnAm+y7InhcqxiFuwD2GxgdVuE+PiCdduJiQ7xv0L8nuIXeR8ku3ZB0SeDrcG9hD8J39
         moGg==
X-Gm-Message-State: AFqh2krghh0HHhiUtIHQ3wu3b0Oqezjv6kVpiNuSf0CPOoLy+jp/ml1C
        L8YEEa9mEt107mj5R1WBQicnBw==
X-Google-Smtp-Source: AMrXdXsnGymGIz5wKkyeGlp5NGCZTlccx+1TfgiDq4nzoUgDuD/JJts9ZAFkwK5mVOXUx44yP3ydGA==
X-Received: by 2002:a05:600c:3491:b0:3d1:f16d:5848 with SMTP id a17-20020a05600c349100b003d1f16d5848mr23777360wmq.26.1672429502975;
        Fri, 30 Dec 2022 11:45:02 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003c71358a42dsm44855413wms.18.2022.12.30.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 11:45:02 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add support for SM8550
Date:   Fri, 30 Dec 2022 21:44:57 +0200
Message-Id: <20221230194459.2370924-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds pinctrl support for the new Qualcomm SM8550 SoC,

Changes since v2:
 * dropped the i2c pull up bit for now. (dropped patches #2 and #3).
   It needs a proper approach which I intend to take care of soon.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (2):
  dt-bindings: pinctrl: qcom: Add SM8550 pinctrl
  pinctrl: qcom: Add SM8550 pinctrl driver

 .../bindings/pinctrl/qcom,sm8550-tlmm.yaml    |  163 ++
 drivers/pinctrl/qcom/Kconfig                  |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8550.c         | 1789 +++++++++++++++++
 4 files changed, 1963 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8550.c

-- 
2.34.1

