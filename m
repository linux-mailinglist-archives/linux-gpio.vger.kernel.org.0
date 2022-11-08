Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C33621569
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 15:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbiKHOMH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 09:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbiKHOLr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 09:11:47 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347B8121259
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 06:11:22 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so38822349ejb.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 06:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GL2VB6yiqlJd7PXl9jCnnQ5NQhRNVLQL22XW+04witg=;
        b=Hhzk8FopA98HaJrgwoizCtMQjYbKieZLMyCwD4Px4prPzIh0xGexW33aaq/j+JippB
         cqlKGLoDi1XLjx+IY/su4mqqiHWvQUn+7tIVIJpEfiMquxhwIgRmC6N5SNcWnRVbdNtM
         YqocapQY/un37wC8kJ/7a0MLAYUePF1vbV8ex4L8Iifyb07W16xzVj2vo1LoYLVFUy8N
         aqdEWC1LNRy/bl5J7tZLgNbI7e8kqA4LHWdgOgQvzCSwe24kskKnAt7bt3IM1TdsdXyO
         zuAVijftra0VXnB2A5j20mQhvzZMmjKJrg1kYqt9t3FKqqZ2I58VGv1kCgZ2SCIAeVEg
         lwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL2VB6yiqlJd7PXl9jCnnQ5NQhRNVLQL22XW+04witg=;
        b=N+x6nk0sLzh8ppyfunNd+LX9CL0kjUQuq6Qeh/2N7IgxvRX29p9e4wDtWkBOQDhLWg
         pKqfFtXMh2mXmyNavM156fy/urV+4/UHClPkVoEq4xlaQ+dvjT6n7fEHdguhFS0NiidO
         f4gb0rZ04OH2pfUzwwLNbZbZVwYmYUZDyTYlbUrUGl+HjIxHodGFeD89iExf8Na1lS1v
         3cGuG1Gu46swBphBjpOfUuWun5c0V3T7Oc77TjTxiNtgt8F89FUw9M8MwXpI5Ofxz9vU
         ngbtAig+xStUxKztuNGYo6dlUoiITKGJiZg25o5H/S+3atQXy1wpNQxEp8Wph5eopKQ5
         h1Lw==
X-Gm-Message-State: ACrzQf26FmwYOBokNy8qDymggKjRlMRQaIxENdoyucKS7fW8dECKH0FG
        I4T1e6kOcFRbynhM+ZdCOaMvSDuEHgcYVVHM5mb+Xw==
X-Google-Smtp-Source: AMsMyM7J3Sd4gnDvu8zGm0CMMNKR4LFB/CGFMpK5G/rfqAvubgf422+2XMl7L688bBueJ+zjJiz/yGcF4N7ozpUkS1c=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr54232684ejw.203.1667916681564; Tue, 08
 Nov 2022 06:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20221104142345.1562750-1-thierry.reding@gmail.com> <20221104142345.1562750-5-thierry.reding@gmail.com>
In-Reply-To: <20221104142345.1562750-5-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 15:11:10 +0100
Message-ID: <CACRpkdbegcxckaYA5h0VKQonK72srZWDZYynHhUKSTHngWGHWA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: tegra: Separate AON pinmux from main pinmux
 on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 4, 2022 at 3:23 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The registers for the AON pinmux reside in a partition different from
> the registers for the main pinmux. Instead of treating them as one and
> the same device, split them up so that they are each their own devices.
> Also add gpio-ranges properties to the corresponding GPIO controllers
> such that the pinmux and GPIO controllers can be paired up properly.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Is this one of those few cases where this patch should also be
applied to the pin control tree to keep things coherent for e.g.
git bisect?

Normally I would ask for this to be queued in the SoC tree separately.

Yours,
Linus Walleij
