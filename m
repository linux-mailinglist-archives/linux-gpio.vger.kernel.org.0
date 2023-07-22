Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DCF75DB25
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Jul 2023 10:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjGVIw5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Jul 2023 04:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjGVIw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Jul 2023 04:52:56 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D2926A5
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jul 2023 01:52:55 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b8413671b9so47574431fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 22 Jul 2023 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015973; x=1690620773;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVzX507K6RPyVztrEgxtL4tdVGSqIUMR8aU2wvrKbrw=;
        b=y+U6XMFXb+XQBgGhTEMVJj6j1cNf/PV+VRBw/rj0mgbUkodLMIbgfhJ7qBVdo/Lk4t
         WinJDVfUtcQ1HGifggQqTr+gK7e14k3jV5Z+PsdcoP8DXIqJ+lSuYfaRLWLs4PUidhnx
         hNOUZHpbzQ1DSoc2mNZktJsit3BlyKahMEMsNzru55qoZNq76exi0lcDtkb5IPk9fYqP
         8ZTXSIGzWxu6772SqOKWO6r1exearFofQNzOcyrzNZKDPzl501C5Zd9PSuoYBqHSAjdK
         mUS7Fb2XP9Fnc+PIiErh50NRxeFEEwuOV6gMYtla9oseu1/M5+oFMIFZlDNXy1TsBvyU
         iU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015973; x=1690620773;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVzX507K6RPyVztrEgxtL4tdVGSqIUMR8aU2wvrKbrw=;
        b=B8cV+xeG6EL7BcPEN+BgMxjUTrMKgbgzTtQ4ndk2xNXhf/GVwzsAfZuEGu0LtTTHEX
         j9wAQTbrvEEytJFQnDdCr5YhfzjtGgLL0fKfOxnKciG0Jieulh8pGj1mT+UO9JryHs60
         UNbF+yCvUQ9MvcBAhmysPDlRSXEALrMv4RrMOp0LvwbeK0sTIW4a9Na8pQ/IdRr9uhsf
         dhAvLYaTqLNBaoX6GrKTxA8j85fPkHyKIc6Pns6SVb3ArgjmQxCEPkoUdjvNDBU5RknJ
         /tbE2eLl8vNN1xIAHvAkLlCAo8oyb0GacbtsowJeATR7xKuvEPedwyyXfJ8RpTbmX7KY
         O70w==
X-Gm-Message-State: ABy/qLazVBSTScg3TMNA1C6cEB3AP8obeRRFALU/7ggLSe58fa8QU/cp
        sMk/cZSDccJsnggM1wbC8qwySQ==
X-Google-Smtp-Source: APBJJlH7tsYAXNxPfGf7LgG6XjJgFOhr3KIl6Uq943DsGPwxF1cB6U+AGXIHstnqox/wO53RcQHO4Q==
X-Received: by 2002:a19:385a:0:b0:4fd:d1b9:f835 with SMTP id d26-20020a19385a000000b004fdd1b9f835mr1334127lfj.1.1690015972664;
        Sat, 22 Jul 2023 01:52:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id x9-20020ac259c9000000b004fbf5242e8bsm1107034lfn.231.2023.07.22.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:52:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] SM6115 LPASS TLMM
Date:   Sat, 22 Jul 2023 10:52:44 +0200
Message-Id: <20230722-topic-6115_lpasstlmm-v1-0-32d1643d8774@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANyYu2QC/x2N0QrCMAwAf2Xk2UBbp1V/ZYhkXXSBrivNNoSxf
 7f4eAfH7aBchBUezQ6FN1GZUwV7aiCMlD6MMlQGZ9zZeOdwmbMEvFp7ecVMqkucJuTQ+vY+3Mi
 bADXtSRn7QimMNU5rjFXmwm/5/l/d8zh+pEV1UnsAAAA=
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690015971; l=965;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=PRPRlwGyn/4Xttz2MNkgkck20GYS3LIFuGGj91Ldr9Y=;
 b=Sv6SrDZfok5fxbzm37/IhmzKYcBavZUYcrWYhrJozyEiDLH2NlQ4wxmeFgGTfNp6fNZ7gdfSz
 Jo63M6m0rAFDFBuFjNbgv4granQmX2EH7QVubJbFcKRbGhxfOW5ThZb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series introduces the bindings and driver for SM6115's LPI TLMM
block and enables it as a module in the arm64 defconfig.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

