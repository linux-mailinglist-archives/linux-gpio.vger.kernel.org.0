Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83370759E6C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 21:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGSTVM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 15:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbjGSTVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 15:21:10 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0A51FC0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:09 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so67936805e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689794467; x=1692386467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8Ghoj2qWhSzudbHZ/AY8E639NOQWAULVpg/aOv7ufY=;
        b=S0lt8deQ2yHm2Uo8ZdcQnpBhnocPZzlbO9LLVW3ewBqa9VvKyd8ZZgnVbiLpAqDNqG
         7Ob8tW46PtpPtplajubuRZeYsm6uSJ7p/pPAjkoOOU9SO1EpSOmcjZN9UTJoaurS0R94
         1j6Uoru8Gh7DCgrxh8Pgh51+VPF1JEGlTLCUrGKdgNJ2960Px9Rxru2u3u1xY48KX95L
         qQjBs0ZoqfLOThNl2w+0uGouudNi/ZMeBgQT/cWs3PJVVTRK7ZZPD0BvSa8HRbzXYc6n
         6C6QhHO4uWWFWeq7lTdEeIfeYyRQ9aMx0IlcT4yF+GkuG8MY8kwA7y7ub14C2z35CEz2
         KI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794467; x=1692386467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8Ghoj2qWhSzudbHZ/AY8E639NOQWAULVpg/aOv7ufY=;
        b=OKwUaV/idMiJzIdl2O5NER+8Dm5Luy5ecMexz/SnBZDqGjIzcIjvgruPuplcVXTMod
         Mm44C5JmKyGokFwKv5+cGS1Nvd7+a2kkhycK9EaJCSHIGd/jQt1WKQE7e3/cp746/E2t
         jLnLetDZESNIp5LliEMdcUU9T8Yq4D6f3yckjpdC7neRl27yUWb9tW1dXtshiD0UalLO
         ag63MnS4juT6cjkHaGJH41YYLsvKM2VgCYK6O3jiCivABYnyDa7oQnWmGjKAEZ4eR2w6
         R0UhZz2g3UnouVIM/NANlcpTztM7KH7aHoXIVTH1b8Qx45w6s/XzAtej9aFliOWeF6f8
         Syqw==
X-Gm-Message-State: ABy/qLasgJFyY4gQ3cSLJ99ADgddYaYu/7sECoXiNvl0PlCc1f29dJk1
        AHpcJgP9406NJ6zZfEXX6lgWkQ==
X-Google-Smtp-Source: APBJJlGOvyY5SulGoCfizo2FfE9z6DH/OZRKg95kF8gAyf3Tk/Lgh9/OP4tsc0ltIAqxZhyHF3Vc+g==
X-Received: by 2002:a5d:4a49:0:b0:314:1a98:ebc0 with SMTP id v9-20020a5d4a49000000b003141a98ebc0mr618964wrs.26.1689794467675;
        Wed, 19 Jul 2023 12:21:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r17-20020adfe691000000b0031444673643sm5991086wrm.57.2023.07.19.12.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:21:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] arm64: defconfig: enable Qualcomm SM8350 LPASS pinctrl
Date:   Wed, 19 Jul 2023 21:20:58 +0200
Message-Id: <20230719192058.433517-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719192058.433517-1-krzysztof.kozlowski@linaro.org>
References: <20230719192058.433517-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable the Qualcomm SM8350 LPASS TLMM pin controller driver for
providing GPIOs/pins for audio block on SM8350 based boards (e.g.
HDK8350).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>

---

Changes in v3:
1. None

Changes in v2:
1. Add Ack
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6cbf6eb59378..cf2a811e45f1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -594,6 +594,7 @@ CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8350=y
+CONFIG_PINCTRL_SM8350_LPASS_LPI=m
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
-- 
2.34.1

