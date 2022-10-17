Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0116018F3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiJQULO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbiJQUK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:10:29 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215E76EF19
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:50 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id c23so8457698qtw.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3cf7os4U9PrSITXrz9B047DOKUqlpVK8CpCC35AwUU=;
        b=o0j/aVM22smRsPnDS5lFKh6nJebaB80vYDsPR9zVapUGdzYQ+Wew4BMmAM+ZMsW2B6
         3bGJ7MZQkNNAihc3+7vsoQDigXpteAc7AvxgPaLg/6nmNSJIh8UUO9MGYrb3bbIZhDdL
         /n38gwX+o0zsYBD5brm0YYiAmiUdTAQq/atLKrPBDCbBm+apX6J8BP3YZvdopH69zwW3
         BbVA8fdsQ9PEhtSy/41Kd1VENPYAKzDOp7Ps0qv4HLANgklJXQvgBBdlvAVyL38CzRC8
         Uzj7TDTeQTSl4OvPg6XOeQYqYF68bq1YfawY2tnj8kAwNPs3//u7l5qGDC8O+Hd4KDvf
         YcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3cf7os4U9PrSITXrz9B047DOKUqlpVK8CpCC35AwUU=;
        b=CrUbptGEAW/9F538J+5Fxr+f2zvoWgOY37WBKPK2BmAYPwt6LXofJEOMs8jZ+xFL2E
         XTFi79qHxelVNtSseTzlNfxM2Om7v6VD2uM+pAQjIN7Uf3umNrtvl+uWtZZK4i95Ea30
         aJWKrJkDE+mM/eSVV1s6Wjpo20N/ca/+jLbEfSRI69xP3KNo1fNngHvybFmXDrgItGEK
         d41p2BXpz5uubng7wt2VoXQF4DhpWt0hrftgxAM9eXWJJGGLFmrUEy/j1wveLbXa59Xl
         nHo/1wFF3bTJdE1s3czWJZU7bVJriZP7vBs05UJgKTjPkgxi18SH8Aa9ga8ZyDj3E96F
         LKqw==
X-Gm-Message-State: ACrzQf06hcVtA7r7fm9ThXk6tUBHq6ItWk/D9tmh0E5+vC2C5umFdaVp
        shM7cxATA7sOTUl3Um9Upyo9tg==
X-Google-Smtp-Source: AMsMyM7Nu7K1dPRzSD+fXbCKPLLZqTXJgdsONUhDUmXOGPody9ZagoXojvdfY48zro9JpENviT7jcg==
X-Received: by 2002:a05:622a:114:b0:39c:b7ec:345a with SMTP id u20-20020a05622a011400b0039cb7ec345amr10118860qtw.677.1666037353888;
        Mon, 17 Oct 2022 13:09:13 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 23/34] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
Date:   Mon, 17 Oct 2022 16:08:04 -0400
Message-Id: <166603728602.4991.2075217324929919217.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-24-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-24-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Sun, 16 Oct 2022 13:00:24 -0400, Krzysztof Kozlowski wrote:
> Bindings example should be indented with 4-spaces.
> 
> 

Applied, thanks!

[23/34] dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
        https://git.kernel.org/krzk/linux-dt/c/479cc0adcd7412815962b9bf69f4288f79cfd18e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
