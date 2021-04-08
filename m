Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE42B35857B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 16:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhDHOBt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 10:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhDHOBt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 10:01:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA20C061760
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 07:01:38 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id o16so2409307ljp.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xhqQfgoly9avn7XXhZhaK1N8yEQXzkHQX6Bo2sMn7Fs=;
        b=WNnTzsHoP+dFlWiqTjjqJyglMxEZZjjMBarB/ZDvorEla1DQUxj+0thphNRODKA6Y7
         0eqOUJKpdzFNYXgAs6TmhHIVnDL3/TgGxC6PMrfloeTpjyV1TXt2aI8HOhJWSEQKdkAx
         S0TXbkUEpSE455nWX4wCS0VTeTlCkMTDIKhHx8v47++0d6OEjqBaojCAqvJTO8nNdNF9
         NmJuU0dvKOQkUk0ghOiyfwbAL8tQGGVBUDASFSOMEP+zfYJfI4kj7hIugcivIVD5tPgB
         w4H4kKvSJXYnXIcTY72BhiOVP5IjzsOcZbmQy4TH1AguMr9Qrw7u4tGandLJZayjYXaR
         4HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xhqQfgoly9avn7XXhZhaK1N8yEQXzkHQX6Bo2sMn7Fs=;
        b=jG7GmiuxOMECPsANd69X40w7KJfN4/qPRUnYE7suvhDf9+dRjNUukGjjGi9dRUEguw
         8Z7szvmrbaoIcmHRT70L3nYmLdBSlWVpO1r4Sk9LnSf9g8YeazH62cl1dwAO88K1nv7/
         XH7PGeKRVC7MOdFZ/ksGbreMUCkfWNuHYF9HR2LoqOnF3837TGlRaccYl7l8Dg5l7xI9
         w9jnnWwvfBknoYyR8icAT6kGyyTzjQCjOLPiEqFGhb/XDsVEwqfv7dnD4w6ApdF/Y744
         F5kLhJyA7oDCI+fCjn8VqUvTTLbXD0rVWtBWQhVnwGtsWTwlSapD9KvBt/OJp82o1hdM
         BlyQ==
X-Gm-Message-State: AOAM53094dlFnw4ALbGkZ6i7L+NtE9r3RAgBpKfhhDhQj3GKt6/B5MWu
        pWhe4tVe0sEho8Iiz+uLFb53Qa9tDWGJJFbSKYKVsA==
X-Google-Smtp-Source: ABdhPJxU9DTkaWJ+YnuAoa4IEImpBXyOrNFaZoalC6kRmQO4nYfnK6k+1wBIw/KC7izS1V/Jx34MpoRJrsKl98O/dtg=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr5793077ljc.368.1617890494649;
 Thu, 08 Apr 2021 07:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210328183034.555702-1-festevam@gmail.com>
In-Reply-To: <20210328183034.555702-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Apr 2021 16:01:23 +0200
Message-ID: <CACRpkdbh59VH0eAWXP3dAiCN9hBDCY_TmMTzp_70G8pZpYmJDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: Remove unneeded of_match_ptr()
To:     Fabio Estevam <festevam@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 28, 2021 at 8:31 PM Fabio Estevam <festevam@gmail.com> wrote:

> i.MX is a DT-only platform, so of_match_ptr() can be safely
> removed.
>
> Remove the unneeded of_match_ptr().
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Patches applied!

Yours,
Linus Walleij
