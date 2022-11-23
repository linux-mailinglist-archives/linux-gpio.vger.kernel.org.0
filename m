Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22FC563632D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 16:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238621AbiKWPUX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 10:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238736AbiKWPUI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 10:20:08 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6123F90598
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 07:20:07 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id x17so16418337wrn.6
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ziwsq9banwczERpMX+Bo3ns23w7Dd8VFWVq2lIRwuKE=;
        b=h+z4P+mLFJgnkVRXVdp3prIBBPkAdi+FwhU/MWCM+45GjS344kKmGvvfC2NWJqctNL
         /b8fuSL1ttsIggGguMPLdLrNDm7QUjnWFhx1eKOzGTWwc7ABYnK8CYQn+mKfE6i9vuwq
         jhwmETeTCYfTEC8YfaPYjjA8FG+UsOIFbQPcZkes8iHOP2u6ioYsBCdYSq5Z2IS8HHWX
         sCTmfDmipwpLQN2bayLosN2jXgN2GknoCWPZwFLaQu/ac8PlZVf1fmWWEw0opiJnqw1z
         hWUWqpSuWYnYRc/ITfDNE4+8FKZ7UVQiQcHqQol87JeGPzcsTjd/cjsAq+QRTtsA9EZG
         Mn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziwsq9banwczERpMX+Bo3ns23w7Dd8VFWVq2lIRwuKE=;
        b=gHQQrJh/akuiJzRPVdhEsqErBh+5NEZ5cwAvIAmHiFnHSkJUTSYv896dcnQj9N5E6S
         UxsmO8HT6OXMzrWpO453qhpIZw5lJhnIkvdeLduqdUbnndP+qpZrq4U4G1pwJIbdDCYo
         0qF2NRlKqB/x0A4m3EhfCyWorDXCt4k36nYyUDwzp4LVxs5XuGI17N3e0Aamgss/1GqJ
         lwA6R5WyEcaPhrPxl/DSiDjEfinNykuuIxw5Ce/RvWDwCfHmv7YhiY/HuCvzgFPfNYzQ
         EgfSfTOrti055Hk9banege/Mq04INLfaUUGUb0KHW07aSqlJRC8uohKk09RFt4xYLoEy
         5h5A==
X-Gm-Message-State: ANoB5plEyePMpDJL6vxZ/Cop4XGmDoHRDzWZeD3GlAQriUUuYJdSvAGg
        cs/o+eGUDchuLpCrkG1o5jqYRw==
X-Google-Smtp-Source: AA0mqf63XHGjwyrqrPkF1+AicWGQJXD0EFyrzQk6d2t/8H6zregd0KnivxFbLhZYRfMBIHYCQ0kaNg==
X-Received: by 2002:a5d:48cf:0:b0:236:4983:285f with SMTP id p15-20020a5d48cf000000b002364983285fmr17585786wrs.576.1669216805925;
        Wed, 23 Nov 2022 07:20:05 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l10-20020adff48a000000b002366ded5864sm16764914wro.116.2022.11.23.07.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:20:05 -0800 (PST)
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
Subject: [PATCH v2 0/4] pinctrl: qcom: Add support for SM8550
Date:   Wed, 23 Nov 2022 17:19:57 +0200
Message-Id: <20221123152001.694546-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds pinctrl support for the new Qualcomm SM8550 SoC,
One thing needed by SM8550 is the I2C specific pull feature.

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

Neil Armstrong (2):
  dt-bindings: pinctrl: qcom,tlmm-common: document i2c pull property
  pinctrl: qcom: add support for i2c specific pull feature

 .../bindings/pinctrl/qcom,sm8550-tlmm.yaml    |  163 ++
 .../bindings/pinctrl/qcom,tlmm-common.yaml    |    3 +
 drivers/pinctrl/qcom/Kconfig                  |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c            |   20 +
 drivers/pinctrl/qcom/pinctrl-msm.h            |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8550.c         | 1790 +++++++++++++++++
 7 files changed, 1988 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8550.c

-- 
2.34.1

