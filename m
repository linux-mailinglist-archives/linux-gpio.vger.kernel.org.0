Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 053E56018A9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiJQUIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbiJQUIj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:08:39 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A6F7B1C5
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:36 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id hh9so8446845qtb.13
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDQ7r+4J41AKYQ4tryB76sXiyRjvv1bHNf7uxKIsye0=;
        b=UHhUVmmW4wf3xUyGQm/0spdUQRJaWgKycvkNEQ9StJBmKh2tAJ5MElcAMG7zA+df6i
         KQH1wHHbVaRwoRGcSJg/wSBjt5R0mxYsd7OG81+6gymWcjUAB/xJB1ODMWI6gqMpCDbd
         jvIywfY2p7aJO9/nxqwELwBb2jxE6yHb1WtsWNyl6DTgaZ0HNzpeB86/r8Jhivlu/YJ0
         nGofa/6RC+8ijg4Nf649YAila1PVmKrXR3Dtba+8rUIx+IhNABW/Ckof1OShZGT6Jqeg
         O8snGcXy1vHFB9fxhiN/YZJx9OVVwwLTEYKi8X5mdGq14wiN8dI9Gc34ODrDsHpydOk5
         M7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDQ7r+4J41AKYQ4tryB76sXiyRjvv1bHNf7uxKIsye0=;
        b=svSK1UtjlrmxmrqUfDi+YIk3u7ZCT4CrePke748aVoQPMjHXp1C2OyLLdm4ADmDhNQ
         SGT2VRurRMrael3jEKfLJFgUPUnVOJxHaj/P7F2TAj2eJR1LvTlbMKfaKwl4NHaEQmvM
         fs0rWiBaBUCnB/Cd65OZb2WpTZ/AGCnEbuawsJVlsIq6WXsHUt5IlbKwLxO6GZXVDxZU
         dYFKPU0t/cDgKUwp6wu/lvzX5Q8GAk2sqj8K6az93uNNVy78bLimpzbOM9JzztkdfEuj
         cIihTk4S7ouMMQL5U/IvvTSXj2uDb8Gcly/aPh1zryXHk5oyoehSJwjHcknd9mLBAXt0
         17dA==
X-Gm-Message-State: ACrzQf1mwONFExxk/XBt58/TftoH+OuZD5dlO3fnumqmVjkib/vSc9gG
        m8HAf01XNX4UH6TTFZY7Gy4Dog==
X-Google-Smtp-Source: AMsMyM5OwglMJocx5iyFB/vq2QoTIT377RiJT8R+qlby+IGHgnXdAPrsJ3eqllCUIzPyxUZO6UKwig==
X-Received: by 2002:a05:622a:509:b0:39a:4f2e:576 with SMTP id l9-20020a05622a050900b0039a4f2e0576mr10229672qtx.438.1666037315376;
        Mon, 17 Oct 2022 13:08:35 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:34 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v5 08/34] dt-bindings: pinctrl: qcom,ipq6018: add qpic_pad function
Date:   Mon, 17 Oct 2022 16:07:49 -0400
Message-Id: <166603728601.4991.16594974338721313870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-9-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-9-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:09 -0400, Krzysztof Kozlowski wrote:
> The IPQ6018 pinctrl driver supports qpic_pad and DTS already uses it:
> 
>   'qpic_pad' is not one of ['adsp_ext', 'alsp_int', 'atest_bbrx0', ...
> 
> 

Applied, thanks!

[08/34] dt-bindings: pinctrl: qcom,ipq6018: add qpic_pad function
        https://git.kernel.org/krzk/linux-dt/c/6664924176497c40f20380eae298241e3b175217

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
