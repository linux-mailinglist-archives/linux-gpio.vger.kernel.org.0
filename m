Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93DE601917
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiJQUMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiJQUMA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:12:00 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D8A7CA85
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:11:08 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id bb5so8443874qtb.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELxpcD2V+g7AlHzgweIXKsiOGdQ0NM+0PGHARpqHIJQ=;
        b=IG3+ISqWsGrvdC0HG4ACkT7zwnV7WUQJ7DXbhl8U1ByEm1bW/ZpXeMUC/FL9Koi3d/
         KQro/3PTelzTw3gD25xbUYvfUFgw1PHgwZnn3C0WElYSFaMJcG3qtlWA7oXFABwfQeAu
         z0Bm9EL2q/qmGPBl7CRM2javk5Maru/OncvkESjCGt9OXCWNisHeCOwFiAL3P1c+yO1B
         6VuhxGDXql6WfWiaY+Ihraf1yNdEjOItqKAK0KrMJ4iaUiLy/olREkMc1VbkrVZIOt56
         802M2VpFGTE5IimbQ0zkoYIq6YWm392tWpHavyWYBkKMDkdNCDDDb7PZe6Afb3buja0C
         UoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELxpcD2V+g7AlHzgweIXKsiOGdQ0NM+0PGHARpqHIJQ=;
        b=J5mZrEULvkwILdScXHG+fQSaghbh0LoEMYpi1wp0VGMtL3o+YLMjEdVKHSUa+hQ3Y+
         IDp0KSoSnHJNlDfaZUAaPOyP5FQyxaubIY5U6AbLdtMKfnjNZ29hrsGR/cPpJClxZgFr
         2cEKh9aQryb/loYD3YR5lNhaAoccvbg2IAjOvacQvTaY5pEuNt33VxXV64tdDPW+9+Cz
         ihcJDxnL7yA22Qf3WFRSqu8huY9XmgTCIH7gHilaBLUaiVWHzXqHJa6MO16vkD+qwKWZ
         9/iYbE8wZrvstKrSwaQVNpfsDtCbd3np0Q6+JNj98/tnE45g9FMLCnctPCJ16vHKgrAW
         NkMA==
X-Gm-Message-State: ACrzQf3L/xD7fpNBEplolVXSikn6PrPKprbTwkqgmHscw90lggQ5BTBB
        HwA2VXoTjiBa/iI70Zlm8aU/1Q==
X-Google-Smtp-Source: AMsMyM6/gKFkOxhR4PwyjS5XF9FXDHztUy8cKizy0hC+ka4MezIUXhA2NEd5EWUYjH1yCWhIyp8NtA==
X-Received: by 2002:ac8:5f12:0:b0:39c:d2ff:13aa with SMTP id x18-20020ac85f12000000b0039cd2ff13aamr9949770qta.193.1666037378538;
        Mon, 17 Oct 2022 13:09:38 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
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
Subject: Re: (subset) [PATCH v5 34/34] dt-bindings: pinctrl: qcom,sc8280xp: fix indentation in example (remaining piece)
Date:   Mon, 17 Oct 2022 16:08:15 -0400
Message-Id: <166603728603.4991.8364006823893676349.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-35-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-35-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:35 -0400, Krzysztof Kozlowski wrote:
> Bindings example should be indented with 4-spaces.  Previous adjustment
> missefd one spot.
> 
> 

Applied, thanks!

[34/34] dt-bindings: pinctrl: qcom,sc8280xp: fix indentation in example (remaining piece)
        https://git.kernel.org/krzk/linux-dt/c/0eaaf138fff0b61ff28707502fdea9bdbade3958

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
