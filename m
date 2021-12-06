Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A1A4693FD
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 11:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233953AbhLFKhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 05:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbhLFKhM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 05:37:12 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66782C0613F8
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 02:33:44 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so12952080otv.9
        for <linux-gpio@vger.kernel.org>; Mon, 06 Dec 2021 02:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=idIIka1mu53auPQEDeeVp+5SHwt5ecOY/qD1zuhwjP0=;
        b=s5NKI1vfcVcdP/hgX0slg1LbmFOYHQvdD54qDsKNlTuEvjhDieF2KBOa+m4AJP+fWa
         I6RwTWbgikEHoDk4duW2ogZ2n52/99cLU3ebklMcUtRyP6+YA0fkIzvdq7saaWZ6UZug
         o9PhAa6H+jEGHi+GOkzvgWG8YOYoXcn51hnBPXFiwgD+59Y4Zby8JmtM0LT/ZuPaLAkH
         qIU2KlnrMrHRd1jjAtSQtQVWmd0+rFjqzBjCOseUfUtuqfA3uqWBAPpht7a+DEE4vXQ2
         0rR8ORLRyw5ryR0t5ccRd6IYuAdObQzB2mS6cOVGNWdJfxywDzwvbr2Q1W5FuZUwU5BZ
         bzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idIIka1mu53auPQEDeeVp+5SHwt5ecOY/qD1zuhwjP0=;
        b=xicST9JXfJ1sy8QsDrM8qpJwEfaQllTB0lwkJ8o9LdRcWNN9AyZpsEAN+ZUWvGClAU
         vAk7E8la/DA3cxbfOiQrcOSik7mG9J6uKGyi4rjIM2WRhL6NEIkaihJRmSg9aztvxFVW
         H/o7q3ZzWzI+r4wOpZxoycUib+ajokONY3T466TqjOG3S/TjKV4KLNvWZvM8jJFtkIUu
         yDqhFicW7SYqP//cShq+bAJDw/mYLI60pI0PgosAeOiA7VP/pm0l4x7DtIx+aEQJzmhH
         JC3piS1+ACIKF3wpjHxzmEBCeLHKt0DMPi35uUeueVst0ssY/GKUYpnS7KwpZdoQiQ0C
         DyxQ==
X-Gm-Message-State: AOAM530KOtehP6Qcty4N2FkzJPsZKONNICi/pszdbIIqMm2oAThMlIei
        zStCs/+AfwodcBkPL1Y6W+hJ+WR4xLxzVh4e61HL8A==
X-Google-Smtp-Source: ABdhPJy+tsCtsj+QeIrqAMtkmf9IDd2UQ+HzcP4FYj0UXeDJ4SMyh01L0lrgFs/yzvW1/CttamvXLsS+qFDoNkAkXEg=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr27600057otl.237.1638786823769;
 Mon, 06 Dec 2021 02:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20211206092237.4105895-1-phil@raspberrypi.com> <20211206092237.4105895-3-phil@raspberrypi.com>
In-Reply-To: <20211206092237.4105895-3-phil@raspberrypi.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Dec 2021 11:33:31 +0100
Message-ID: <CACRpkdYJAZcr_PPCGPYcitfcwd9GDFf+7hPJkOmjomqCrruNfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     Phil Elwell <phil@raspberrypi.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 6, 2021 at 10:22 AM Phil Elwell <phil@raspberrypi.com> wrote:

> Since [1], added in 5.7, the absence of a gpio-ranges property has
> prevented GPIOs from being restored to inputs when released.
> Add those properties for BCM283x and BCM2711 devices.
>
> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>     pin-ranges")
>
> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the SoC tree.

Yours,
Linus Walleij
