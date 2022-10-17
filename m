Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC086018AD
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiJQUIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiJQUIq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:08:46 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9477A771
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:37 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id a5so7390578qkl.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b34m75C009iIZzJu3wQMuuBZWmzJ1WhgRJhOBshaRuQ=;
        b=SbB14J2PwrjxdWC5ec+SxQSKApLFYnvWwABLOcd5+4LfM3rNYtZ8zEwtlY6tcohmjx
         AoSUcJnABebHaKt4cIa8jeGm/nPz4V6hF9PN70Px9DpsH71+n2wglwNll2r97qPpoJHS
         p9vHgdyTA7XElaGCB7x3JzIpJ0f/05V1PT7eK1+VFINmZ2XPyfs8Tz5z4ffbrk+2Hn69
         SIgbH9bA2jMVV8O1LUeyNBKCHjQ72oqOqoOtu1BaU6VKBNWLJC+a2843+B/k7Nuu7j5I
         vuRrMEaEWxg7DQk7Wt4PdAUsaXII8s5Zt+2221v8qtJbP8afgsTJe3pfOwWCMb2ueIYK
         mPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b34m75C009iIZzJu3wQMuuBZWmzJ1WhgRJhOBshaRuQ=;
        b=y1p4HzPBM95u/AreVQIWM6enAYLjjA7MBN5jwxStXmTAyxvnnbwrmJyXP9URbX41K6
         fRdWXUpkJ1TeYEcqrscdsAvt/61YlMBw+YQDCxb3Q/VfxZF0oYXz2HaFSL0uKydtwu2u
         oxPmwPGzpMO2qodk0ywEG2nRuJ6RW3zrCTr3DHXVTEUp/gVurF8svyikX81RI6RXNBP2
         A7/QvO3nA2rLwm23jJ9LKorurH2Ukbl9zgs+j4xlWADDDeVVVQDiEJdt6Ofdgr7yl3Bo
         hUFzKWedQrlXvSBktiVZB+aRGeDR0jI6Ipr6bYFCo0StIa2shEHyzzFjA7ekW3bN3eMn
         0D+A==
X-Gm-Message-State: ACrzQf2HyHtLGp29pXHaRdDNLaVlY1X8ovSHZ1AjKfMtt/scvhSmTfTd
        SmoORoXNFUHtQ4fv6Gd6Juosyw==
X-Google-Smtp-Source: AMsMyM4AaZ0dl46d26zlNlfFW7sC/TYI9VC93ez/8+cq9OjlZ76KsVpR6QuzJGB1kdARvmp2nL8VpA==
X-Received: by 2002:ae9:eb45:0:b0:6ee:94aa:7520 with SMTP id b66-20020ae9eb45000000b006ee94aa7520mr9097432qkg.516.1666037316999;
        Mon, 17 Oct 2022 13:08:36 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 09/34] dt-bindings: pinctrl: qcom,ipq6018: correct BLSP6->BLSP0 functions
Date:   Mon, 17 Oct 2022 16:07:50 -0400
Message-Id: <166603728601.4991.10204223048558957862.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-10-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 16 Oct 2022 13:00:10 -0400, Krzysztof Kozlowski wrote:
> The pin controller driver has BLSP functions from 0 to 5, not 1 to 6.
> Add missing blsp0_i2c, blsp0_spi (already used in ipq6018-cp01-c1) and
> blsp0_uart.  Drop blsp6_i2c and blsp6_spi.
> 
> This fixes dtbs_check warning:
> 
>   ipq6018-cp01-c1.dtb: pinctrl@1000000: spi-0-state: 'oneOf' conditional failed, one must be fixed:
>     'bias-pull-down', 'drive-strength', 'function', 'pins' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
>     'blsp0_spi' is not one of ['adsp_ext', 'alsp_int', .....
> 
> [...]

Applied, thanks!

[09/34] dt-bindings: pinctrl: qcom,ipq6018: correct BLSP6->BLSP0 functions
        https://git.kernel.org/krzk/linux-dt/c/5d6f7ee5f7efc21724250f9c42f74aa8785e682b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
