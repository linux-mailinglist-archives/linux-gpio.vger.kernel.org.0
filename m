Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B610410D27
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Sep 2021 21:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbhISTmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 15:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhISTmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 15:42:53 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1872C061760
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:41:26 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i4so58208566lfv.4
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LYTzOdcrX47mnET/O6IbbirI1g0RFSgGZ65Y7f58LeQ=;
        b=spwp/KpEFJhDnqy54onPk162/G5pw8dUturgYEWZX1FMOfciExMa+ChSfIm0Gy8Tp7
         RNSSNAW0C+T4WiMO9tsEYzDiJxApm2db0Lb18vFiJkAV7CXWDtn1ZQIUcel6NuhM6XO0
         E2sfuU7GPsSaC3q+V8/6z/J+CXq3s+xXYp7LsdlTVP7y5Kljis25gsYra++pXnn8PUFN
         Hr0J0gZOrwJKACWnGNs2mThrmdJ4MVHy+kRHw674eHZZ7d419xVC3Uq1nhQ3jvAackV9
         0yw9zsy+BNOq6NecZQqOLfpn/7rax4qcEgSGCOrJyTaNhjGQBZked2iOG8LBCcWpqwkZ
         zyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LYTzOdcrX47mnET/O6IbbirI1g0RFSgGZ65Y7f58LeQ=;
        b=qZSEU1wODPnnoO9ChT5TW/7TrSCHfRaxUUvgfGzV/Ynga1Iwf2ZU3RdBiMiUJEO/0k
         ukBx7lmNRt1J+k49YROKDmczEkemDCw2drpYeN6+PTDKcEMQ+F6mzdliGsJ3J8n4u8qc
         O2tzNw0WD+o5Kco2T987v+3S3G0ebxHqolu1o06prOAT/xsVIuF7PeKpMZyA4ZpPyUd6
         HkZ9UU2j4Oe/qKRw278A4nhMJJqgfn/rO7lSmKMW2BHolQvfA7aS/1mM1vSa/JjqKeIc
         dG4mpHzlssAbhEHpeHpqs0Tr6yPYGrtvWwkMjhR5yQno7Fbd/d9PaWdaNyhw9knCe1zo
         zSjQ==
X-Gm-Message-State: AOAM533f1wGIJj9a4CsjdfSqEQDQah32ZIvexXzdWjMARZ7SbJx5tZ3b
        mGOdHa5dZcYt4t/MaxMtUIkLkFYvSKtJhBeRSZPpjg==
X-Google-Smtp-Source: ABdhPJw+a+RYqW7LREzMJdZrkeqv0faFTmrJBsxG9VYISXMESJvXoq5ic1siEmlwm2VnTvDad1sJr+wxcffypYWMwso=
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr18829959ljo.288.1632080484878;
 Sun, 19 Sep 2021 12:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210917105412.595539-1-thierry.reding@gmail.com>
In-Reply-To: <20210917105412.595539-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 21:41:14 +0200
Message-ID: <CACRpkdb+-6dQ4F-asb0K+_9d2JtP7LXyMgjC45V=C0kpBiuAJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: tegra186: Force one interrupt per bank
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 17, 2021 at 12:54 PM Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Newer chips support up to 8 interrupts per bank, which can be useful to
> balance the load and decrease latency. However, it also required a very
> complicated interrupt routing to be set up. To keep things simple for
> now, ensure that a single interrupt per bank is enforced, even if all
> possible interrupts are described in device tree.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
