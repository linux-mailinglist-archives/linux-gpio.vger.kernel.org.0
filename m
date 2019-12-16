Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 792F711FF49
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfLPICQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:02:16 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:46583 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfLPICQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:02:16 -0500
Received: by mail-vk1-f194.google.com with SMTP id u6so1353809vkn.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Ep2QCdJlKr+TyNg9ZznUSUSlsgcyTzmJiAJ0k9iPPA=;
        b=mMYNmrDrg5AxzSc6pcHqwBFxyjG3hWU63y04GsqBzyQQ+dBj0dN+Ez+m6I8vh+dLTN
         IjadAfi9yJTIE6MtqNbP3E7p0SfuC6oT8+dlXkOgrlwk12oayA2jRypbB1/W/Ub8DOyy
         3e/gwiDXBB1k5F4IJyDfGTjAec9HRkbS9c1ihZIi1tJ4l7Mf7YfewJQIOvV6c30GnsNm
         c+aBlMs5ZH7dwOh2Y/nfPI9guIL2XweoUUP+dgy0zpuE02Krj4s83kwujHdwW0VEj9G8
         D5BbeFybH/lFY3xugIroYY3YFkQ6hYBdX/MxLzq8JuJdc9fTHcdfdOQa44I15MulIE60
         MSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Ep2QCdJlKr+TyNg9ZznUSUSlsgcyTzmJiAJ0k9iPPA=;
        b=p79ZnBluXuw22YUvOP+ZKUkd1+sSBqoIKePEbpjiWZyIn37bClBot2u/+eqQg/7Ic6
         +pOzgR5IMH4aQlkgj1rA1PESqk3DcCzCoeRWOVvgxG5rPJh8GDK20JRG6+F4LBuYs7fd
         7BxeZ+l/GvJc0WKIrExvIxHzsifDwq0SQwdye9kvZBXS1woh7rNvIi3E0w5aWw3Tf1W+
         nzikode/kq8+l2bEAIAajmi9GlLLl6FukwekL9+KaBFbSkGp/i0D8whs4AUPEojMvIgs
         JEpHaJsfpARbCdVhZgB/T82VmtmM1cnvjU2B37W/AD5i9uwatuEmKQ34EeuJ/PL8jNZ2
         P5oA==
X-Gm-Message-State: APjAAAWGNB6NEUkv/bEraff5HyohPzxbCBCYLxIVV34ttvTLirkjUNh8
        Mw7L5TuDvayoMZ8tBtlAR+Uxira0X7HdPrwczY9QHw==
X-Google-Smtp-Source: APXvYqzBnQzdKrEWuj834Usnxn0YZfnxNBxusbpjzzcPns+vYb7S0z8Y+JeuAdw9b6S2rwCqoYtfAhOzeEmRmO6d6jk=
X-Received: by 2002:a1f:7288:: with SMTP id n130mr24095211vkc.46.1576483335271;
 Mon, 16 Dec 2019 00:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20191206170821.29711-1-ulf.hansson@linaro.org> <20191206170821.29711-2-ulf.hansson@linaro.org>
In-Reply-To: <20191206170821.29711-2-ulf.hansson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:02:04 +0100
Message-ID: <CACRpkdZmuvRbLrud86Jd-8w4pBx5u8L+TvNpWAOtyAvNw6OFnA@mail.gmail.com>
Subject: Re: [PATCH 1/9] pinctrl: core: Add pinctrl_select_default_state() and
 export it
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 6, 2019 at 6:08 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:

> It has turned out that some mmc host drivers, but perhaps also others
> drivers, needs to reset the pinctrl into the default state
> (PINCTRL_STATE_DEFAULT). However, they can't use the existing
> pinctrl_pm_select_default_state(), as that requires CONFIG_PM to be set.
> This leads to open coding, as they need to look up the default state
> themselves and then select it.
>
> To avoid the open coding, let's introduce pinctrl_select_default_state()
> and make it available independently of CONFIG_PM. As a matter of fact, this
> makes it more consistent with the behaviour of the driver core, as it
> already tries to looks up the default state during probe.
>
> Going forward, users of pinctrl_pm_select_default_state() are encouraged to
> move to pinctrl_select_default_state(), so the old API can be removed.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

I have put this patch on an immutable branch so that you can pull it into your
tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-default-state

I also pulled this immutable branch into my "devel" branch for v5.6.

I think other subsystems may need the same kind of stuff and I might need
to change code around here so I need to apply it to my tree.

Yours,
Linus Walleij
