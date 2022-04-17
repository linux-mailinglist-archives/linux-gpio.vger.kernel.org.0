Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D05C504A14
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 01:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbiDQXfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Apr 2022 19:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235372AbiDQXfk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Apr 2022 19:35:40 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E72D12AA6
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:33:03 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2eba37104a2so127054537b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 17 Apr 2022 16:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qq311Ej4nKaNHmuSEh9g0stR0rP4XIT/BhL1cGtlS7w=;
        b=r9jqXinwzkdIC5VyPdggPBtZPjeAHyq1eSsjmecFUKYa55IuKybWRojKRp4ChNnyEf
         2hdV8pvp2zVL/G+i3bFwoGEXUF7LdMQzcbu/dcaa7Bu0KLi6mT5/vTvTJLCITdUjQecQ
         t1n4Jw78Jn5mFYMNl/2IRdB9WNuIF3xaaXjsuyQufBiqMKOPdJ5ZVkvjWUUys4tlsPxP
         Jf/59SscRxietyIJSswa3HWwkAZYXMtmGCs3SDLK4GME080mTndVG/5dG7nnLybV2/sz
         ieZReQIZUKpVfOhUogy5KDIoy6gmiHeKlVcR91obmX99jkzwWsPdUVG05pzwq/27JtIH
         nFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qq311Ej4nKaNHmuSEh9g0stR0rP4XIT/BhL1cGtlS7w=;
        b=LA3ODZ5dy8BHa5blJQlZZoZYlZUn5SxQHgoyCzkV3Ntx3zaQ4Lr/5aqzlPepou1/3q
         JXx7S5eFxhJb1dCLb5Du0axaJ0YCDDikiiISxz3K+lDz2I2deO5jTPSMB3J/M7M8shBg
         l8E82SZNN/lpEFcLaRDU5r73KIBzL9Dx3nDYg8X9rWB0cAVkOAvjVf2NvDp5HCggmZW3
         q+Wrm8LkSadyFCwNbN8l6zPSz3euFJM1XKtyV4mWLIisrQPlx27kSsQ3aG5aI++vS5hN
         B0omyByCNthitVQyCWx8Vhbu5anf2pJxIBT+xM50R8VSJTJ45XLbQWTpJpPAhDJ/JBuu
         2h/w==
X-Gm-Message-State: AOAM5300hXJ8FnnwYoUI2ZRqGWLlKParArAAuLs5YR+z1ItW+911veVB
        JNjBkoizYmprdXtcHKfl9B3XqJ84gq3JUSsCs6a6cg==
X-Google-Smtp-Source: ABdhPJy971JsV2M6G/kykCqVBXCve1UTM/9vpeUp4hd3G329HLHl0O/fftTQQ2T3LleMXPNCddp/kEi6imjIGc1o0Ig=
X-Received: by 2002:a0d:e813:0:b0:2ec:1e83:e5f0 with SMTP id
 r19-20020a0de813000000b002ec1e83e5f0mr8377849ywe.151.1650238382771; Sun, 17
 Apr 2022 16:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Apr 2022 01:32:51 +0200
Message-ID: <CACRpkdZKQRnxFjOD9z7iNvRQeM6kGBBopjW7VzFSuj91GYeJOw@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] Add pin control support for lpass sc7280
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, linux-gpio@vger.kernel.org
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

On Wed, Mar 16, 2022 at 5:17 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> This patch series is to split lpass variant common pin control
> functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.
>
> Changes Since V11:

Bjorn what do you say about v12?

Yours,
Linus Walleij
