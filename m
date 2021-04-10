Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D4735AF99
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 20:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhDJSbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 14:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhDJSbT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 14:31:19 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEB5C06138A
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 11:31:04 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id dl5so2082215qvb.6
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LkUZZwgRVdPAw6SfJBLkYKXJMvX4yLBFHqIQSj02keY=;
        b=GM3DEtG69NU3Ma6nlXcAjCqsr9X33+vSX4lvQpotPN/wZx0uEUY9h5tNvBkFiv8rBe
         F/89hF4pFNtoeEFsOIy7RwxKQgHcNCqXExh4ljR0BUXrhpxy0KpXgHnqkb55n+FItdeO
         hy2NGzh9glSGAqpdq/uXe5v9dQyWPQS/29E3c/+AOqYYz462DOhAKe0ZEiC4jpN3SdPg
         EzyM8e8S2Uq1n5cZehYJVt7nIGBUzBwArbx0Jk8HJx6LpoRanrouunzT7DnjQcjs5bW4
         /Jmxvt3YU3sYrxUlEMPn+WGfijkCQSgvW64dPBiyYuf4AaxIGjRYcL6xIOjjgMut3Mdi
         qvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LkUZZwgRVdPAw6SfJBLkYKXJMvX4yLBFHqIQSj02keY=;
        b=ply0dyn+kmRstCE9dTMKe7cQTeMCQ38vEH7OSAYTcC1K6vqI3U1TBZjM4p+byDYxmh
         Nr3PdwMEI2EQxZJw5i7VBXBEtu7k0SmWgNWYcRHx9UZ0HZZhxavVVarImwP8dnPow6RP
         tLWLJXR5tjo1N52xk42OFoG0DfYIG5o3tS1WnDqFGqSi6toV0oEDyYGNur8RQytjWg9P
         eSiK3yUGFZMsOJGvBKb6PzuYi7itdNRJmnJewRDZuARQYevlVVXMbkC1MkWWR+WQxUyh
         iut/tt380mWXKjSa/Mie5K8u55GumwmDorvAt9D4D0qpnFo28DTn7+JCr04oW2B1vPxJ
         Xx/A==
X-Gm-Message-State: AOAM531uOalMtI6XHQ1HzOLjrEqF0bw52C8sJnc+c6aH6f9lWpJb3qPk
        vLv90NRGVIM2KmAZNkEHFFeQ0DtRih0BocY3pCQonEHP
X-Google-Smtp-Source: ABdhPJxD+03g3bW2o3Wm0k4uauFUOuHCFCfaUHZuWaYB0v9YC846umySpnMOycHOVXpvrV+xYJdjEUedybGGdzR81gg=
X-Received: by 2002:a05:6214:7e6:: with SMTP id bp6mr990801qvb.37.1618079463452;
 Sat, 10 Apr 2021 11:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210304013342.1106361-1-jay.xu@rock-chips.com>
 <20210319081441.368358-1-jay.xu@rock-chips.com> <CACRpkdY+A4bsW28yXRGeGVnK_UcR70sMeX3jpABGVJc49A-xcg@mail.gmail.com>
 <CAAEAJfB3csiXBtAioV768PYMb4Sv8UYvmaVaOXZDhJWEzXPLeA@mail.gmail.com> <CACRpkdYYpgFWH9pVOT=o7unWXRqVeHtvsJgbByNGZ170CZ_FXA@mail.gmail.com>
In-Reply-To: <CACRpkdYYpgFWH9pVOT=o7unWXRqVeHtvsJgbByNGZ170CZ_FXA@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Sat, 10 Apr 2021 14:30:52 -0400
Message-ID: <CAMdYzYqk3k0UqCyFwB+W1tKKKTg39Mx0Vdsrj+eeC58nARaumQ@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: rockchip: add support for rk3568
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Good Afternoon,

I'm currently working on the rk3566 early bringup support in mainline
and encountered an issue with this patch set.
Unfortunately in the rk3568/rk3566 the gpio registers switched to the
(16 bits write enable / 16 bits config) register format that other
rockchip registers use.
This differs from previous chips where all 32 bits were used for gpio
configuration.
The patch fails to account for this, which causes all gpios to fail to function.

For clarity, this only affects GPIO_SWPORT_DR and GPIO_SWPORT_DDR.

I'm currently working on a patch to fix this issue, but I know that
you are planning on breaking out the gpio functions into a separate
driver and wanted to make you aware of this immediately.

Very Respectfully,
Peter Geis

On Fri, Apr 9, 2021 at 8:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 9, 2021 at 6:17 AM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
>
> > Seems we are missing the dt-bindings for the new compatible string
> > "rockchip,rk3568-pinctrl". Is there a patch for it somewhere?
>
> Nope please send one :)
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
