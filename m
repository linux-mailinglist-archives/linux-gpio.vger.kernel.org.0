Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3F075F542
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 13:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjGXLkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 07:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjGXLkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 07:40:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FCCE5A
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 04:39:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so6388674e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 04:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690198798; x=1690803598;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJ4yOgRXHtYK3jmLeq4Idrc0hB5BqvDloR4hEaxZCoc=;
        b=hvX7wN6tws6Me+yfYdsoMhlkMC8EumtAdhgPwJHKAwY1pk5tJAWr0qHohpmNwmxCdC
         sOVrZ8sbjPURvhVzk4kPqx3A+eXTTfmIftdiAexdrLUOECHTkt2jPEFQBxu/QhFbY9/V
         Sg7c3ZO6Tfq2dWcVAref1q2lyyyOE8vYSY4b6PfdBwCck5GLX6cAO4cPVcoIKnug/RLK
         EmIpchaDJCqyEWXw4h+XI1vuqGgmgxvmrjy2W921bybIqyuvVmaz4MI+4Nc/LRXiikXI
         LU6WNyfoC1wTM+XZ5QbsmEgMpuAc42TX4isDXYALOERmM1B5235+02Cv6300gwiexWqw
         viag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690198798; x=1690803598;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJ4yOgRXHtYK3jmLeq4Idrc0hB5BqvDloR4hEaxZCoc=;
        b=HXFcXB111/VB08IO2z1XHs2ubV8y/dRtNbA13zGTOCEp/zYmgXCeVWI5lcgznnY88Z
         dQoLXj14QU7h93kA6Y4wZ64EAOCQJQ8rL0qMdh0AQrsY1YCeL2GNVrXRH9Ta3uyEvE5t
         uMRYKi//egsdMihjgcixXMvLFu2JH7dEq6WwvUJ/bsgM4/nfY+wVkNP8m18dNFhl5tNQ
         jpKvdlzV4HjPaeV2R/Sy9+Z93v8+7Adz7QdsPEJSDGaV7JPUhGkeMUhAdIZv3X+/U2va
         KrRY0e3y0Ta+KAuAdALXhcrTX8CREh8qR6UII0il0lEURPCboF4rQ0J4uW5583UjDp8c
         1KDw==
X-Gm-Message-State: ABy/qLau8F1HBQj+C4re7Q+IAwUU63Yp8h4Xsk54m81anDpgSp/noSmw
        3F+BFxy30iUUt+SSpuBtS3YCIw==
X-Google-Smtp-Source: APBJJlHJLqB0l9juZ3h2RvkRLq9XkLsByx7clUGMX82DIWl/8ZUJ550IJa8XWsOdhQcQ/aio7blv0A==
X-Received: by 2002:a19:8c0b:0:b0:4f9:a232:f09c with SMTP id o11-20020a198c0b000000b004f9a232f09cmr4185431lfd.63.1690198797951;
        Mon, 24 Jul 2023 04:39:57 -0700 (PDT)
Received: from [192.168.1.101] (abyl203.neoplus.adsl.tpnet.pl. [83.9.31.203])
        by smtp.gmail.com with ESMTPSA id u1-20020ac24c21000000b004fb881e5c23sm2168977lfq.47.2023.07.24.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 04:39:57 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/3] SM6115 LPASS TLMM
Date:   Mon, 24 Jul 2023 13:39:55 +0200
Message-Id: <20230722-topic-6115_lpasstlmm-v2-0-d4883831a858@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtjvmQC/4WNQQ7CIBAAv2I4iwGKpXryH6YxFNZ2EwrNUhtN0
 7+L/YDHmWQyK8tACJldDysjWDBjigXU8cDcYGMPHH1hpoSqhFGKz2lCx2spz48w2ZznMI4cnDb
 64htrhGMl7WwG3pGNbihxfIVQ5ETwxPf+ureFB8xzos++XuTP/rkskgteKS9rXfnGGH0LGC2lU
 6Ketdu2fQED0d9czgAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690198796; l=1248;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MyMuaMloZrXeqpFIhj35adNC4/W+TiZZpLrCk6Q8v6M=;
 b=VJpyTZf36Wng6fHwXT9oyN1V2jIGCOjbx2gFVWOTgcjy41piGxCnvkF5HmIkd3W7tlJRysJjw
 cW+OXunkPPIBCILEWrpHX27LDjPHVAWTUuRgX/y3Zdoh670qV+QO50+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series introduces the bindings and driver for SM6115's LPI TLMM
block and enables it as a module in the arm64 defconfig.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Fix up gpio number regex pattern and gpio-ranges in bindings
- pick up tags
- do not change patch 3 as suggested, a bulk reorder seems more
  appropriate
- Link to v1: https://lore.kernel.org/r/20230722-topic-6115_lpasstlmm-v1-0-32d1643d8774@linaro.org

---
Konrad Dybcio (3):
      dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add SM6115 LPASS TLMM
      pinctrl: qcom: Introduce SM6115 LPI pinctrl driver
      arm64: defconfig: enable Qualcomm SM6115 LPASS pinctrl

 .../pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml     | 135 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pinctrl/qcom/Kconfig                       |   9 ++
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c    | 175 +++++++++++++++++++++
 5 files changed, 321 insertions(+)
---
base-commit: ae867bc97b713121b2a7f5fcac68378a0774739b
change-id: 20230722-topic-6115_lpasstlmm-ec4749d8a70c

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

