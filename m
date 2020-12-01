Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0392CA6B2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 16:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390174AbgLAPJx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 10:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390172AbgLAPJx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 10:09:53 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A687C0613CF
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 07:09:07 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id v22so3690088edt.9
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RTOWmJcTi6tDwprZNdib9Hdn63NVGgGhw7pXQyKPyrk=;
        b=M6GzMfZ6FF7DbGPeP3NnXgxaIiQw4pdouFhBBJ+/YkU0qgns2g9J910z6UaG/504fR
         yo6SiAO+F9hFvvdZHOS29XEzYnpQF/JgL7IjpVsTFAxFmioDZAJZzqAzUMjgyqEOvEC5
         KVfjAE9Mb4jFaoBgbnn9qb4Zk8l74i2mShu2CaY9zJ2ORIYkDzUcMEnwwbfEwFzVmY87
         dEWsQPiu7OjYl5oV0BB5vAV0lxVVuHhfikU3wBXiO49UJedrpXtnthVuj2xNhDAcPqvl
         tySGoyMX+FBR6krNlJr/HrBybicyTg2y6RgT1lpI1UwWsxcwStC0FDcPZGl//6n8iklx
         2vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RTOWmJcTi6tDwprZNdib9Hdn63NVGgGhw7pXQyKPyrk=;
        b=M7WVS/kaEmkr5tgelGtSd7iiM6AuxtAXssDAzdAdhrBZmX5ARGa3ZbBKQHDsl/5yZk
         th88DGl39WY8yLmhgTLBWXJP8KnniyNJ/CShyeghDIePND37+asaEmPnuFa8g09/zpz4
         OGUZPHFp3qla1O24Gy/hzj+lYq20x+u3wRqsl8prNSvYXQnHqV1FYj8ctdN6kJJWyDk4
         AKvgafSpYb+H9HzB+Cgc1uYKrGQ+y01reAzXoPOitH0CBVDbEzeSULWjmPGlTKK5N8fy
         EJBZTxSaGzQ84Sg7PSQigdHcY9FfHOX+JntBNwtdbpCKGwCyKgDpT4mBgdkFxf2u1tHB
         spxQ==
X-Gm-Message-State: AOAM532NGfLN7nJ6rOsTsOu+pzVBypGV33y2q4OBBFtvogEIb901Xsnf
        tHZoWybhWxEgBk+x2pCHLrKjLnYg5bVwqNl6Eb1CZw==
X-Google-Smtp-Source: ABdhPJzrWBdQJnmW0BM0NTPvh2J75LukiUCSsiOAD+wTKDT0AULBU0OK7XeO2+V7DnpJ+Qa4WT6COZy0AbS/GJiikqY=
X-Received: by 2002:a05:6402:88c:: with SMTP id e12mr3532883edy.88.1606835346190;
 Tue, 01 Dec 2020 07:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20201127140852.123192-1-thierry.reding@gmail.com> <20201127140852.123192-3-thierry.reding@gmail.com>
In-Reply-To: <20201127140852.123192-3-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Dec 2020 16:08:55 +0100
Message-ID: <CAMpxmJVDo9DmKLsDzRH75GNzRAu2OTGOfEcPz6oEj55tvSFtEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra: Convert to gpio_irq_chip
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 27, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Convert the Tegra GPIO driver to use the gpio_irq_chip infrastructure.
> This allows a bit of boiler plate to be removed and while at it enables
> support for hierarchical domains, which is useful to support PMC wake
> events on Tegra210 and earlier.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

This looks good to me but Linus is much better versed in hierarchical
domains so I'll let him take a look before picking it up.

Bartosz
