Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827BE3D3C7F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 17:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbhGWO57 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 10:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235438AbhGWO56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 10:57:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C76C061575
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:38:31 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f18so2720495lfu.10
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5fKS0W78jBgl+mIxB7Xm3uGD8b8IxeNIeStjZ0bgIs=;
        b=evLuO9t2y1KdY+CTSGy4BwPos3Vq4zxanoA1hWD9X7Hbicscye1STEqtbg/Sdvkv5C
         djdQvdh6R9hwgJYEyJMx+uTqi7m8c6OBtGwK0GWXoRd8tfJZw7matlNo2DPmpuF2aHUk
         DN6Z9qin5+4zvK0UJ6/hqgdLKyYnQrMPO9Daag/g/7r+D+GsVOh0HnaYoZLoYeYKpOG9
         WsapjxStnD2hyGkzN7Sa3W1CQKpfV8ZxnTwEst9FtevCwZ/8WqwAd2q9p23pIbW6kVAW
         6JD8VsZ6+32CqGkL6EpMhj6/Ker1hspQRoepWg0g46AoC9zoYnxJU/lufv155kTTjuab
         uofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5fKS0W78jBgl+mIxB7Xm3uGD8b8IxeNIeStjZ0bgIs=;
        b=jJkiT0yRWfqBBXhqHBrQl11RNyqONFtelE5xu483KQRm/KXp3vmgh9vqeAabKPo6up
         fAde9PS1Kf8q2CfK1vKde7+d+w7KZj17r9/2FwL2AZJ579ykRWVnAa7QceuvH0JIFwga
         Rp5JWYrl4b8y1n7yXGlzsO6zUzYzsfBgg06/nJm26TWGK41+ea2dwsILfFRZJapCAonA
         1DwH20478Ickw9qkTWmFIy1arbzPZz+gQcFg3jUUR/Fn9wUmnnSCLhfpc9x1E4CU2v+Q
         +Ff0bIkLS7cS0WJ3V4RjDXQDpQalUxZc/n+Vn4M6OUnbjaIty9C4X+zo/buZbfU2U8cF
         brXA==
X-Gm-Message-State: AOAM533rug/+GBujOVh3FqYt0TW1Y+8ilNYzdYE70jXf5y0LyceJQio9
        C5jLJ3mhI20jJ1Via1CHZwkQJIL+Y9hdbD5MBUr42Q==
X-Google-Smtp-Source: ABdhPJydD4EvUxZjN8jfbePd6NexZtDbTJWMSw9gG1tEl0IrnQUz8uu1ccPNLmvpaMBm4zlx+ZGvhjPSF5bNqDsr5T0=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr3344716lfr.465.1627054710287;
 Fri, 23 Jul 2021 08:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210627185628.691435-1-iskren.chernev@gmail.com>
In-Reply-To: <20210627185628.691435-1-iskren.chernev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 17:38:19 +0200
Message-ID: <CACRpkdZa1apQtmwxMeFxA=Mh2DNV_ggX8JtO8AoZ5eR0pWHEEw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add Pinctrl for SM4250/6115
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 27, 2021 at 8:56 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:

> This patch adds support for the TLMM block on QCom SM4250 and SM6115, codename
> bengal. The code is taken from OnePlus repo [1]. The two platforms are
> identical so there is only one compat string.
>
> [1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250
>
> v1: https://lkml.org/lkml/2021/6/22/1163
> v2: https://lkml.org/lkml/2021/6/25/28
> v3: https://lkml.org/lkml/2021/6/25/72
> v4: https://lkml.org/lkml/2021/6/25/351

I wanted to apply this v5 version but it doesn't apply cleanly on v5.14-rc1
and I am worried about making mistakes.

Can you collect the final review tags, rebase this on a clean
v5.14-rc1 and resend as v6?

Thanks!
Linus Walleij
