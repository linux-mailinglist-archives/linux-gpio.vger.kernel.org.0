Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496AA6018E5
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 22:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiJQUKm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 16:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbiJQUKS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 16:10:18 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DD42338F
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:38 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id l28so8458361qtv.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uttg+bYjdERqlEklhLd/zP1DZ62JMXnd+VpjKaW6lnI=;
        b=NA9dKJPLHC9hE7lEJM0ZBYoDkeuQV67w5U/RVJtCMDnf/zgGC+m6S75E7A/LhfUPM6
         ai2wOFTL4/aG9OZg514I0qFGmVC6M37jJuYG6CuITzKV7osBHV1G9XfdDT7h+om6asNA
         ctrM2j3Pc2O3M42botP4oNR7Jd1ybf9ISGJUKknq7CYK21m+nwQwCnFn7LVWowb0XEcT
         4kOUxwiTHQXMVzJr9gehh6+sOnIHB2+cLpAtyVjxGMvGKlixDYz94XVRUtqmA+yVyuLl
         yP0ApB8na4lPwdclLvK7gojhCRuyOXyQiL5Cd/1Dz+fagb4coza9Sic7rb24yBe7Uiqh
         nx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uttg+bYjdERqlEklhLd/zP1DZ62JMXnd+VpjKaW6lnI=;
        b=veKp2cq1bJF/0bxRp94Pg0a4FmBbx2FNeYqVfmD05d5UUIE1lRD0sD1KLLV1k2s6D6
         RGLlScUKyG6AAD1m+fkWPCLQcohg63V3p+JI8idGwoGi5gfVyk4EXkMklNjtU8uKQ0T+
         XFrNmx9IMIxb1MpM6sdScYLA6pPHtvdxmj7KCg7V+ko96Y2ZewubJtkLF1YpVf4ic7In
         MUPhI8t5oICBfJyiuWrlm2RqKcB3bvVXV0Sz0UNGbRwGRE3BRwCo5mrUhTJ98GHsTASl
         lXbLr6242huKM7zlkAEm/aMf9bi9tS0Rj3xkVaGUrj/aUSpUUuWHspfaeMn2LpWYiIxZ
         3LSw==
X-Gm-Message-State: ACrzQf1LF2DCn+W9zP1lBAsQc7MYlgfSwVJhRZ2JH2Arznifq+sZFbxo
        aW6VXN5fw9eWWCQ75oAbt36o5A==
X-Google-Smtp-Source: AMsMyM4prtQ1PUZWvni6VMKx5vTyQ+DtPEdARdAonDSYFA0hOfSbeFhCA/puTg5EqNMALweK+Wj14Q==
X-Received: by 2002:a05:622a:141:b0:38b:f43:60bf with SMTP id v1-20020a05622a014100b0038b0f4360bfmr10083138qtw.137.1666037350211;
        Mon, 17 Oct 2022 13:09:10 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:09 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v5 21/34] dt-bindings: pinctrl: qcom,msm8953: fix matching pin config
Date:   Mon, 17 Oct 2022 16:08:02 -0400
Message-Id: <166603728602.4991.9106121729137545090.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-22-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-22-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:22 -0400, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.  This method also unifies
> the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.
> 
> 

Applied, thanks!

[21/34] dt-bindings: pinctrl: qcom,msm8953: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/ce4762ae0228024961d70a38631cc9177f7f8818

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
