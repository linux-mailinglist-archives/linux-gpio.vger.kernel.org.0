Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253AB692A7C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Feb 2023 23:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbjBJWsY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Feb 2023 17:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbjBJWsX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2023 17:48:23 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B927532CDC
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 14:48:22 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id l201so7115899ybf.10
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 14:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9V+zsV1TA739jM/Ghxhj4I8BxArH5h7QM0M5+yu8NH4=;
        b=yeomO+TAo5S0V0qCgEkJQZexh/5y3obB++mgbBjFuN1Roau5COEg3FzAhbWRgqVObO
         XOUBcq5guD+84TzV3IZ+h4s7XrKjhdOlFtyC05BUoTQEd8qM1C8jJB/VkmrD16mqg3fc
         Kr5yLc0xWU80OyOEgfkOYKb8zXnTNkMroIVOvm1JOyrYe9HpVhArkFZA0zETDJ38eGiy
         BgexlpLRjnwAnLLp0KnBegqTJ1AGBXu8OaMEs2+VpLDaziwN8qr1QQ/Pjxy0UQbCso/5
         kJWctJWoEaW5CV5hiiOgMAhzsxiiJISKHhf/w47+kQMXcjE20HI+p8EotyhXmrR/az27
         Qa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V+zsV1TA739jM/Ghxhj4I8BxArH5h7QM0M5+yu8NH4=;
        b=7Aj+jF4TdHAhVvA/mGlpW6IuiZBcNbIwq58/gVUKMrwRaBeYfGjbAFMbjdFr5k67bA
         pJAfzS1z6yuwgvkC6sMjbsmYemR88wOhDePq+9h9F0s5BjcDth0tk41RqkehjUrP5cLd
         RphemB/Eu5dTBVM9vHvTNJAslnAZC0rMYEGgr6BGlF3FtHq4PZzGiD/oWb6oghtxhr19
         6DrmaIcHdgrkCmHVNWClslOXZqenur6DbRu6kS9RgPyCTE53aYq2wIjiab7NyVeU7epO
         NxmiOV7c36hn1BCW+2TN/m+38Wq52vi7X3n+pAPbpOj5zk4IM0XoPSnS5Ynyi2IHVVKR
         8SRA==
X-Gm-Message-State: AO0yUKV/drlmxYHUaBnw6KiKHRgkFuFILbRDAX+E6thkMeoMF33bruvb
        sYPUv6Ysh3wgXEDr4othOIsBa38VFxBFH891Vk+5WA==
X-Google-Smtp-Source: AK7set+pQfNJNY9S+wbdMQA1kVlICKHwx56mwcDxq/G7Zcm528p2mKL2GXy3CFy4/gF6gNAT8oJmA/Qx3lUFLVa61u0=
X-Received: by 2002:a25:8c04:0:b0:883:cf5:1553 with SMTP id
 k4-20020a258c04000000b008830cf51553mr1881980ybl.28.1676069301949; Fri, 10 Feb
 2023 14:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20230209074510.4153294-1-abel.vesa@linaro.org>
In-Reply-To: <20230209074510.4153294-1-abel.vesa@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Feb 2023 23:48:10 +0100
Message-ID: <CACRpkdaqqbJ_2PjdXqkoe5Y4V4UFDc+XnnNE2csv3xqLyZFENg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: qcom: Add support for i2c specific pull feature
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 9, 2023 at 8:45 AM Abel Vesa <abel.vesa@linaro.org> wrote:

> Add support for the new i2c_pull property introduced for SM8550 setting
> a I2C specific pull mode on I2C able pins. Add the bit to the SM8550
> specific driver while at it.
>
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Applied to the pin control tree for v6.3, I expect that Bjorn will apply
patch 2/2 to the qcom tree!

Yours,
Linus Walleij
