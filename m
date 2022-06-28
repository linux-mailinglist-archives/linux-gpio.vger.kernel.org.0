Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17DAC55EF67
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 22:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbiF1UWA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 16:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbiF1UVf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 16:21:35 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00273D1C6
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 13:19:28 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id h12-20020a4aa28c000000b00425ab778155so1000013ool.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 13:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UvDcjSbWOKZl6gE5mzkeTi2PBrYErL+/ZA1UKHwrnYM=;
        b=cYevLFYXedFSBrq2GFIjF/GS6ahMDdV7aa8UrMEpTpZYXFAs5i9NrNoyQiQK/sJwaA
         eWHs8hmf+ntjplgCrv/v4H4nRb56+VyNGkM2S3QzWb7T7C/27kpmI339VruSlNJFJsSL
         6qS8sO0YTPgTHmE6cPScbfUpgR1BCtRyc/emF73IH89BdQutlOMpsD1SDREHTZHBKEjZ
         eAjU08PK4DJDhPejyoKzVddNDCgUpD/4O1rRMuAM0+fKHaCDUFROIz1sfejMzmkOfOc8
         qS+Fj7oEC29o8AK8mOewI6ydV0dI46TnoSXAlWGEzeXDE+7bvBP9zzMLQAhNMOgoea5O
         ukWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UvDcjSbWOKZl6gE5mzkeTi2PBrYErL+/ZA1UKHwrnYM=;
        b=eVeKBMEcJyDWtAKmKpgGzlsi/cvccM2atfVZXPScHStS0jIIUs2XPJ2R7K+aGhLtQR
         pe5PvnzirNYjxhr+WL3W2BUaxkBxufAVecQthnwyM3+gHquNIelhmDxR5ikevce4CJQd
         PaF/qMMiSHfp2SBG67KokkSS4vky3aHk10EtOHzOE2yjOwn96fBaYggpZQKyc9gYIUvp
         p7WvV8XvoOhS9I4y5ScYGYw7dJgWPYWd0LlsfRbr/jMBwlki+lG+OC+UaOCk1TcsHUFZ
         LXNnNFVXJ59FKrtrK64FADOALs0YUoz9ajsHE0N9uo6a7r0h5zm80lpzUTGEn3q6M1y3
         ceIg==
X-Gm-Message-State: AJIora9uEn4/Bx6m0XSK2hT65PahYGED0rPtipsCvE/ZfVZNrtT8FTlX
        PScYIgt5kjGoKQNor22MP0NRmQ==
X-Google-Smtp-Source: AGRyM1vc6vnZRPxqDOS7LbUETNGPpdTYQWj/OTm5nkD+g5CCRf1C3dpUxIxPfHAFHwH+Mr+Y9Qwf2g==
X-Received: by 2002:a4a:244f:0:b0:425:7575:f167 with SMTP id v15-20020a4a244f000000b004257575f167mr8989846oov.78.1656447568612;
        Tue, 28 Jun 2022 13:19:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>
Subject: Re: (subset) [PATCH 0/4] dt-bindings/pinctrl/arm: qcom: second round of minor cleanups of QCOM PMIC pinctrl
Date:   Tue, 28 Jun 2022 15:19:00 -0500
Message-Id: <165644753308.10525.5708687805772676299.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
References: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 8 May 2022 15:59:28 +0200, Krzysztof Kozlowski wrote:
> Dependencies
> ============
> This is on top of:
> dt-bindings/pinctrl/arm: qcom: minor cleanups of QCOM PMIC pinctrl
> https://lore.kernel.org/linux-arm-msm/20220507194913.261121-1-krzysztof.kozlowski@linaro.org/T/#t
> 
> Not really tested on hardware (except SDM845).
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: qcom: add missing gpio-ranges in PMIC GPIOs
      commit: b07bfd8ebe31b0a39184cba522fdae433b6cd0ad
[3/4] arm64: dts: qcom: correct interrupt controller on PM8916 and PMS405
      commit: a984d5d191527108a934cb9da2a15b07ea05a8ea

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
