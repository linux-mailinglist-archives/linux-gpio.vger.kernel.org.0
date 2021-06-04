Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CE339C35A
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 00:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhFDWP3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 18:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhFDWP2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 18:15:28 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15565C061766
        for <linux-gpio@vger.kernel.org>; Fri,  4 Jun 2021 15:13:33 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id d2so9287256ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 15:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OHwV5VmedMjo0fB2YIP5vfg5xQVpg3dB69VmPS6NB6w=;
        b=MnVZxFbAveBu4SxAm6rnwMcfKbtBeKCjcevhXTmXa4rOuP9GiqtaziNuotSsoxvwM7
         DXftDG0skvQrVaCe0j+L+NSy/INIx7jB6FBWMppgVd4y3jKx4sdyBJWUz/dhab18DgmW
         9IitniMtnsgtDoGB26sstadfh70MjYIrU7XponIOL3slBzmKEzcCM99vNdMAzKoYYVqK
         eQeiB4wCcGXLk5PnJnyxuKpZE3aGpvNcnS5caZuss1JCm3x3mXdK72DmUqzpx1G8mhC2
         xg/8oYU5sK4Sn+BzJgEhvatE9M05PNnXwsdgPAwBsTr+ONkPbECP1hA5gd6lWhQZHLU0
         Lcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OHwV5VmedMjo0fB2YIP5vfg5xQVpg3dB69VmPS6NB6w=;
        b=KYeHYEsxsaXAZR5nTlXbZEub5lYDy7c8xv5MZHUhutvwwYPmAidbBEXFy7TxGtlfp6
         +tqHR+m24kcKciv/ydBYr06viNtywa48A1+ta3+Yezda5vo6Vm9n3U29K4EIM9Z5Am39
         42gCYHdl8FMYAut4dmEHnyM7ySB0Nbj0pm4fsB4ML8yXoofK3VP6xudkeIEnl7jJ8uiy
         dO1vPDQ9fr7KIVqMpc9BIfeEgp0jUXRl5y6HLVQrZF5uM6flF2aASQV6h/YwzCbfCfZI
         wDJcl3p2du23EXttakA/UT4VHFsvblmXROcPsg09JjRaDSUP3ELZ0nEKPUHTgF706wxB
         OZGg==
X-Gm-Message-State: AOAM530K/Sglw5adr6mZS0RK43Uu7DcJcsCUsYHHa713Q67Ck8Lj0q0N
        r10+tzydu61xjCzsarsTN+zNQph3vDw4fkouWxprVA==
X-Google-Smtp-Source: ABdhPJzYZy+CPX4nMzDIh1hrv+mRFW4eXSwoqi6rFl1IsAzTElzai5va+d9sj7JTSpmJFNS00UuTCZ6Wsuh39dD9LCk=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr5041191ljg.368.1622844811472;
 Fri, 04 Jun 2021 15:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210604110406.11006-1-michael@walle.cc> <CACRpkdZEytf1WJa4JNJy6o3CBqOJAZLb-D=_rGQb+naH=TKmZA@mail.gmail.com>
 <62d131e0c2f16d647c36406ae8f9efba@walle.cc>
In-Reply-To: <62d131e0c2f16d647c36406ae8f9efba@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Jun 2021 00:13:20 +0200
Message-ID: <CACRpkdYsh7=9KCHW8G8_qKoGy-f40rdTLUiE2dkzFGHc6KzLYQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: move drvdata to config data
To:     Michael Walle <michael@walle.cc>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 5, 2021 at 12:03 AM Michael Walle <michael@walle.cc> wrote:
> Am 2021-06-05 00:00, schrieb Linus Walleij:
>
> >> Btw, I'm not sure how to handle this "was part of another patch by
> >> another
> >> author" thing. Should I leave the Sob and just add mine?
> >
> > Ideally just stack Sign-offs it is called the "delivery path".
>
> Even if it is just a subset of the original patch?

Yeah it's just an indication of whose hands typed thes characters.
Something with copyright law actually, nothing to do with actual
attribution. See (11) here:
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

Author: should reflect the person who wrote the majority of the
code however.

Yours,
Linus Walleij
