Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF81D4E6ABD
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Mar 2022 23:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243625AbiCXWdd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Mar 2022 18:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355409AbiCXWdb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2022 18:33:31 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8543BA338
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 15:31:57 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id v35so10958364ybi.10
        for <linux-gpio@vger.kernel.org>; Thu, 24 Mar 2022 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=unhdPMLIAUACVz2ta5YZx0FTmwWyjrB4gDaU+iEB1D0=;
        b=hTxSAKsIg82thRj0mm7BUZlMO/6avdMpZ4WQZLkmubMUZsQmzFQD4lf+Ue3YZ3ipGg
         kaDNjK90NoVMsiE8EIwqEzt/UnmDCb+cv/eCMAYOeeQdhaXpvkWMCpfeZZrMyVivbx9o
         VD9S256lHvqxsLAxAKSWnc8mKXOR9GX3fzn5bzT2Ov5omnwHkN9dlm6EGAHjLvz+B6db
         Vcna5veV5wPbWfjqmYEKb2gOEZeZfoPlYKcZstebnzbNkUNQSRLSrFQeodD12Q+3oDnd
         IZVAPqvB718vY1HW1kyALmOqR8kfQJm1Mpu8blPawVV/ZLGbrwdl2criTUpSdVhbBPzc
         yExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=unhdPMLIAUACVz2ta5YZx0FTmwWyjrB4gDaU+iEB1D0=;
        b=NaSEx9y9+lsuWQPTq2ZbNOUE3CUq7ZE+pUJKzaf3DKS6ov+M5J/mDRUEzZnPP2JbdQ
         rlvJ8aTvw023F9pQm+LSrpmUbtTcsH8ZFOZio2hhbx8P8dXLxBtswxvcJbVixPQiWSps
         fkA24Vb+Hl24Re0TiG/GlwLcR7Eva7SNysHVTZvm5ZcU8Cqn5TP43YDV1n6qsRTr8/YU
         sGi9Xm8EuGMMfP6SlQN3aoARc5GN8xKbq3vLvbQPhIy1llWVuGux0hf2bXdFtjyRayw8
         mLzHmyOuHtW5Cvi9/Rh1I9+yA6zSjT9holl4CNPp6+68iNpOg9jF8zRvFmHcTocC07zm
         pgnA==
X-Gm-Message-State: AOAM533tRQYk7q1CYRVBDxKTUr7wpeF5E94YJhzRaMOQ49bzMAdz6ac4
        TEuzXQ9+XNVjjBX+z+kfLviIfxi5m+pXTTmpXEaHKg==
X-Google-Smtp-Source: ABdhPJxs4t3J1ZErfS66y2YUQTZDig4sOog2fYt/B4CvIl2Z0L955zjdE1XtxSV7OohXD8tfBdoEtvvGGYDr1YIrbyE=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr6922497ybr.295.1648161116855; Thu, 24
 Mar 2022 15:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220315091106.613153-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220315091106.613153-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Mar 2022 23:31:45 +0100
Message-ID: <CACRpkdbJVe1AhOfGNYQcnsNV9gQWXEui1iv09-KT4Yd1JocFzw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom-pmic-gpio: Add support for pm8450
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 10:11 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> PM8450 provides 4 GPIOs. Add a compatible entry for this GPIO block.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Patch applied.

Yours,
Linus Walleij
