Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF40763191
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jul 2023 11:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjGZJSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jul 2023 05:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbjGZJSK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jul 2023 05:18:10 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0118D2118
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jul 2023 02:14:38 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-991ef0b464cso167823766b.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jul 2023 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690362869; x=1690967669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC2tHCYKHwgxaEUWfpPQiubm5LumCbOxn96mJg0qmV0=;
        b=J2Qmd2Ob1hznxEQMDEhdJ0RA9WiYRy6Cg5juEYS0nNUgyoVcspcPyXnvhSm4X1HpV3
         117DgPsmdVBl5f15DlK6raUwqAJr0tKWvvwmdbYwJwzhyUzK2qtt82SXl8+vLxLMqt83
         1JHMOvmvPz7zPKiuHqQOUaTA/GnFVR6wN27mwdlYj0M596zMatC954PoXN4Z4QZBon6z
         1g0MN3UUqpNDf7oyGqCUJCopq+B0B+Z3OFQBEkS48SvnIjDKr0mKPToBjpNSTKiZHKtu
         Bl2KbMm/++7/vcB2G/5Co0/My5e1XKtANavAIRV1OzrRCIqaa/pqihfzK/zKX1yv2oOi
         RUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690362869; x=1690967669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CC2tHCYKHwgxaEUWfpPQiubm5LumCbOxn96mJg0qmV0=;
        b=OIkZimSuxqWMdZVy5CfAlYoDdlJ1HupNZfTE7+5d/yypy3IQFpT6cktyaZ72cyAuaa
         7vC84rhBfaNzaDZmQk+D1mCL3efTzq9TofEY2GwXQhP5ZQZqceUy1mAlGsTXChKcx4mQ
         alZUISFFnQUIxrn6xLVKAeP6VELNQho8/dKgkx9ptcHC3T+KiKMAGWoiRQK406h79BXx
         OzLtjUl8qQJJnkIGA/yZ+b2ergWrh5XP19IMlf2b0r9xw7tkkALiGY/MPw6iR2DqeX6p
         1tH9Cqba39do3yCrx4uE8YL5aVtLGQ1ZHPM7G/ZNq+CP1mquL2+h8U6g1JW+mAj5R4Gt
         ZvKg==
X-Gm-Message-State: ABy/qLbIUe40zxAiSFzcwanz0TzstMI74fj7dxZfFvIaGKwT7glY2rN2
        e9FzWHlpOQIE+t8ZIQlaaB+7DA==
X-Google-Smtp-Source: APBJJlFw/2DFQSOvPSHKmYW0Sc3HrdXpAVTVqatn4vIVl/ZWALS0pkUOwDlgCoFTHszWbVACCPulUQ==
X-Received: by 2002:a17:907:971a:b0:98d:4b97:acc8 with SMTP id jg26-20020a170907971a00b0098d4b97acc8mr5368327ejc.25.1690362869156;
        Wed, 26 Jul 2023 02:14:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm9384492ejb.84.2023.07.26.02.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 02:14:28 -0700 (PDT)
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
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: pinctrl: qcom,sm8350-lpass-lpi: add SM8350 LPASS TLMM
Date:   Wed, 26 Jul 2023 11:14:17 +0200
Message-Id: <169036285577.127914.9465194201914884488.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719192058.433517-1-krzysztof.kozlowski@linaro.org>
References: <20230719192058.433517-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Wed, 19 Jul 2023 21:20:56 +0200, Krzysztof Kozlowski wrote:
> Add bindings for pin controller in SM8350 Low Power Audio SubSystem
> (LPASS).
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: qcom,sm8350-lpass-lpi: add SM8350 LPASS TLMM
      https://git.kernel.org/krzk/linux-dt/c/2b4e7a87276eb90c562e84450ced77f17f98b8b5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
