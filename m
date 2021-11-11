Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2885844D536
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 11:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbhKKKqD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 05:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhKKKqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 05:46:03 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53150C061767
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 02:43:14 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id e11so10979827ljo.13
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdlEntx/bV7G4AsDiF3jxVAMPp4OZ6W0+ZvfFXAAPeA=;
        b=UQmAR8AaEOEO5IFxI5xvWs5axVFnXhyxAWqF45ZUq1KigIU8fMEOGu15URAtyLO1en
         J48qehtV9Rf9uuIhNdx11JTFGd+eoP4jK3Z6Er4do1DomGn2mNiiMaUXXtljOqLzvi69
         a35J8yH6GiAvVFYQ9lhMtU8Nh3GS63Bd9IOHb+k32kNTHELJxVOzDW+hQGxxFpwxGqvx
         RMceCsEs8M/gId5BARlR4CKhojsKGnqo79Sxn9tlRSYki4YlVlq663ghCwo6DM9+q61p
         FL1Zb74/JeVO7PpJhFmY2wRwp/cyo6QHDJD+xEEtLZNhn/zMEI2OD7vC5d4iALpd7Igy
         LdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdlEntx/bV7G4AsDiF3jxVAMPp4OZ6W0+ZvfFXAAPeA=;
        b=al+K6DnPfxE8BhHuqFZ5pa2Bj3sa/ohCA5Kw1ToLXlV15xlav/t0CPNv/dx7xL0K/x
         P57VNM1xcXT8PKaFTzLSwPDIx2LTQzj9STKdM+G5bUb5P/Pz0bJlsgvMwjQJdnwEPVJ+
         0PptF0efXsfTt9w142yvVNlgfRM0XhNiqvYJztB56MnNgpQfZlt/TbXTeI4+ARL/tAhp
         JmHE6D7jgw6jJdJaeWLxN6S0C9qZ8Pm3iossnQEyGFRenz+X5p7uAi2pF3Ili3T8Pf9q
         EdUxdJyETB44x49ViL+Jtp65xgk3Ua9ajObsdIM8GRnSoUI93Y+HHnjidAiO6rbvu4wL
         MBdQ==
X-Gm-Message-State: AOAM530Hb4ykFWuk8qDgpTq504JotlQ8e6fRzZqZ9VGWcDpLzP0Usc1H
        Y07heQp4ojE5Tl47MGorzDiLECgX7D2J+PTWgzNWxg==
X-Google-Smtp-Source: ABdhPJyTKwk0+lRBSGsuh9JXonXwvjBKNZrb6BcCyMKZMcMNGTSqI+8+wA5L2ltjbDUfGvq4ekLwAo9jUI6tJJwT9Lk=
X-Received: by 2002:a2e:a404:: with SMTP id p4mr5989126ljn.78.1636627392657;
 Thu, 11 Nov 2021 02:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20211109161253.2202108-1-robh@kernel.org>
In-Reply-To: <20211109161253.2202108-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 11:43:01 +0100
Message-ID: <CACRpkda1+86GgvCJEehg9CGS78Q10FJ3ZHzdmHpYHrY7tAwkwA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xlp: Remove Netlogic XLP variants
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 5:12 PM Rob Herring <robh@kernel.org> wrote:

> Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
> support"). With those gone, the single platform left to support is
> Cavium ThunderX2. Remove all the Netlogic variants and DT support.
>
> For simplicity, the existing kconfig name is retained.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

A question:


> @@ -373,7 +263,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
>         gc->label = dev_name(&pdev->dev);
>         gc->base = 0;

Can we also set this to -1 and use dynamic GPIO base allocation?
(Can be a separate patch.)

Yours,
Linus Walleij
