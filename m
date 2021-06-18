Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE793ACB7F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 14:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbhFRM7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 08:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFRM7k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 08:59:40 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DA3C061574
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 05:57:30 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z22so13877000ljh.8
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jF9pURhxENYTan5Ye25myNYhrCwRUkpmo9Dhc1bSoEw=;
        b=Fn1HoqFQ7nmte0xZq2YGQaecysC995DoLNw0dPEbpUb29LBrXndNbXR8166YRlUJVB
         Hy5Q6qC6HbdEUIG416kJGF77qu0h+b36HZ0i8dYKtv2L/V+Q5PVcBGj9hfKxJDmyn7++
         IDk/xnxQMETjdsM23PqVYNggB6Ab1iaWEp4L30wxFtLNm98sN3mPcE4vMhrMfBWsMVJ8
         CJEzNUprRnBYhC5CUduiA79pcyarIlvhq+Jbuafl6nJAZcD08KzAKZy3mXhd1+vhAJw7
         As65MkJlZnyuBGf524rGROXZwOJDYoQ8jJp6cO5tXS8Z+7ruRhDdb+oFnAtvMgDbPJDn
         MGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jF9pURhxENYTan5Ye25myNYhrCwRUkpmo9Dhc1bSoEw=;
        b=JgoZJO4zfY2C2jS8BmMAeJ/+O5wTnN9Cn+8Igu0Np0m9I8QRtHg41sqtmrbX8diqHM
         57fuOB9aNZ9QiSveigvzWzoZm8dy2B4cAa0aCsQzyhTRAzlOWa/GIRK4oER9cDIvUGtV
         3rv+b91fpnK9iJWUJVC2ZBs3gQXFCahSfkfOJB9KaczcDoWUyCtUw3/4Td5vO7k55OOJ
         23PIWn0yxtCMt7fNCmwVwkTUUDnuZxuXZ4rvSCasoyvnSBXthWRvig4mPUedhRHEyrcJ
         kdKCM1uOVxS4e1+qRlBCuJL/sSspqiWVuTv2Hra3r+KIpfu8ajzxgLBzWDfVLmTw2ftc
         aZlQ==
X-Gm-Message-State: AOAM530Q+GQbap7Coa1ZY7A3kSBZ9Lr/NThvv4VoCmO4rlUPbj+bsjmD
        2NrxEKizwAUe/b0DihyXB67ufxxGWpxmkXJTaUloOw==
X-Google-Smtp-Source: ABdhPJyh4rUqU+FLUB8CGIiTuIm71e/bqTQUmglrgI5HwwqBSedgi9V+DbUL9LCrHJeLKACwerPho5HhQJ7qZLptpDw=
X-Received: by 2002:a05:651c:1501:: with SMTP id e1mr9644806ljf.74.1624021049247;
 Fri, 18 Jun 2021 05:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210617144629.2557693-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20210617144629.2557693-1-fabien.dessenne@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Jun 2021 14:57:18 +0200
Message-ID: <CACRpkdYmE6qU=UXp-K0AXbAhmS7Drk44FT9nYz4ibswHoD5r-g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: fix the reported number of GPIO lines per bank
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 4:46 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Each GPIO bank supports a variable number of lines which is usually 16, but
> is less in some cases : this is specified by the last argument of the
> "gpio-ranges" bank node property.
> Report to the framework, the actual number of lines, so the libgpiod
> gpioinfo command lists the actually existing GPIO lines.
>
> Fixes: 1dc9d289154b ("pinctrl: stm32: add possibility to use gpio-ranges to declare bank range")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied for fixes.

Yours,
Linus Walleij
