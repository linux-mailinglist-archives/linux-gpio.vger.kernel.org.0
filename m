Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C24753B28
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jul 2023 14:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbjGNMk6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jul 2023 08:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbjGNMk5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jul 2023 08:40:57 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F19269F
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2023 05:40:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso3218066e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jul 2023 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689338451; x=1691930451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMCvrRbG3eEHni7DJadXrX/4XYjVj/I3WUzNH8fXQ/s=;
        b=FVZ0RTM9dtahF48Q6C/3ClhJsT7ZCh6UweyM2SlNHmXjOuLcOPoilZRlltV4LmccnK
         ZUPGoIwV7jCNM8755sKuyQ3rw0g0L0AteDQ9sHgNCXKCzteRIVHq56lBz37jA4/I5Erg
         VvZixzMHNTh4nmxpbvkf3r7Yl07QLS93CKNIwXXczpvu2YLD35GrhjXP6vxCdPmHUFJc
         J/YK4FLPxDCwFLKGMynkrT/h7DnT/RGhde5f6gm7C3pAbR24UFSVR2MBlOZvNgnWsIHv
         CaWk9k8+8TZfmQ/Yp8kaiy1XOn/X/Gp0THAryfOIpPu72t3o3QeuDoy4+AOPw5uJg2fv
         QpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689338451; x=1691930451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMCvrRbG3eEHni7DJadXrX/4XYjVj/I3WUzNH8fXQ/s=;
        b=eeTg6kIyYy4SOo1RmX1CBXkV9im6vWLjlGuKfchavn60yTGyRL8pI1RGtNZWScMF01
         gw3cCL1/9qw8Ad0PlJFKO/z6Tys4LtXFARLyWYcSxiIhAOEMnBupJ4sdR17qUhcoV9Gu
         8TruxHa1ruV7v8h+wXn2ERJsXC3clDxR80nubeZvxo6yR3pYoLL+sg5clVwyrnFd5rp/
         5w9ps03heenZxizWpDCuaBa4PhexIqS3wVLsyXoi4H1+GUyjaheigiRwDUvGirY4xjH6
         JyWMCVGfFVGP45+fY3lC3q74k3NU07IPAfEjdLgu+iDtWoer47+kmIoasy3DcLq49GzW
         kPEA==
X-Gm-Message-State: ABy/qLbUjDw5lW7rk5+qCiuQSH0MpkeZstbomgxO/GjUU51P9hhIo031
        Y+udBsjL/lsVrrc7vfp11C3jDA==
X-Google-Smtp-Source: APBJJlHn/5VdSC50EYrgnvHeqg01QGP4ijhCvZtnycHIAeQhFQcagg+At/7vpMK0Zx2lkwknnnOBTg==
X-Received: by 2002:ac2:5f62:0:b0:4fb:7be5:46b3 with SMTP id c2-20020ac25f62000000b004fb7be546b3mr3154336lfc.55.1689338451328;
        Fri, 14 Jul 2023 05:40:51 -0700 (PDT)
Received: from [192.168.1.101] (abxj146.neoplus.adsl.tpnet.pl. [83.9.3.146])
        by smtp.gmail.com with ESMTPSA id b6-20020ac25e86000000b004fb2244563fsm1482588lfq.289.2023.07.14.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 05:40:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] Clean up LPASS_LPI probe
Date:   Fri, 14 Jul 2023 14:40:45 +0200
Message-Id: <20230714-topic-lpass_lpi_cleanup-v1-0-dc18b5bd14f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1CsWQC/x2N7QrCMAwAX2Xkt4V96TZfRWSkNXWB0oXGyWDs3
 Q3+vIPjDlAqTAr36oBCX1Zes0FzqSAsmN/k+GUMbd129dD07rMKB5cEVeckPIdEmDdxsRvQ38Y
 4TeMVrPao5HzBHBbr85aSSSkUef/vHs/z/AGX0pT2fgAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689338449; l=1045;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=8DDyjVP4q1BXBuCaQyRFK9fvQH4xjE517KGgWzFlkr8=;
 b=b1FrtZd1MuxUfhJsK5Wr1mfg1aiJEuK6IjqOsNdVulkGBV8FHgOlJCzv7n1uxgroV777dQQwn
 BU2nBIxCY8mADjTujPRSXN/BsPmT0QPYyNRpbP+K47AVeo8Bf/ZRynC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some SoCs (like SM6115 or SC7280 with various firmwares) expect a single
clock for the LPASS pinctrl.

This serires addresses that by simplifying the probe code and relying
on bindings to sanction the correct number of clocks. That allows us to
shoot down another downstream-ism.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (3):
      pinctrl: qcom: lpass-lpi: Make the clocks optional, always
      dt-bindings: pinctrl: qcom: lpass-lpi: Remove qcom,adsp-bypass-mode
      arm64: dts: qcom: sc7280: Remove qcom,adsp-bypass-mode

 .../devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml  | 5 -----
 arch/arm64/boot/dts/qcom/sc7280.dtsi                                | 1 -
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c                            | 6 +-----
 3 files changed, 1 insertion(+), 11 deletions(-)
---
base-commit: 7c2878be573282a9961c359b806ccf70afe1a6b6
change-id: 20230714-topic-lpass_lpi_cleanup-f37ab68f9985

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

