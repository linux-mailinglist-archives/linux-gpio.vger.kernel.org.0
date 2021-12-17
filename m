Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F60478802
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbhLQJpJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhLQJpI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:45:08 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4C2C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:45:08 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id 15so1165258ilq.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWm+5eJ1NKkZ8kLgeaYQHXXc1vko4JCUGYVct8hkwCA=;
        b=FldaIL+ND/TLB30rHBuGiJsqJ2BgRL2AajJ4+r++1FDwVMdP8Jp/XgksUq94t9cKnM
         zyuHznSzj/Np81V+qTvZDTmu3sqZII1igqUehI7CbnOuOIgmm/rPwWCkSOzn4HpXch0G
         3f1zMe/Aj1S5sY0KfYthar2geMv5bEmpzJANlF+/4CUmZNLlNEl5CqBihqcshWbHbz8g
         icveRLeMDVFgXFFWcflV2cvgPcCtfiG2vLFXK1z9WBBRB50SWlLvhc1lJMsYuMrVlRME
         xZ49CkIZ6BpEiS5ZXH8t6kmhvi8Yf2cmSIOLZLdpvXZymmTgSSB7LJejyEHMatedHemo
         NRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWm+5eJ1NKkZ8kLgeaYQHXXc1vko4JCUGYVct8hkwCA=;
        b=rcvQej6jsfAySN/N2x4w7BKUn0b+woSu4sSeOtvvHNJGHUvScadvJzznuVFiFmwh4g
         HCJx3y3WowpkD+InTKrofht0agvjw+q6+Sd9Qaz13MaSaX2hix7aBJtKqW2Jo6Qi8M3N
         wsQPOdpye2R+1rRAk1ypWjjXbpLWTW0YyKsXM5VzUYXnV5umr67eyAlxJmSCJgs3vwWJ
         UrGBcNGFAzoy9lgl7tLlKuU4BBqwLyV16TweSFH/e8v+XglygNKuf000jChVDNz7hydu
         m0pccVUF3jeejqv2gfoCCJ3jYcdhvJx/+I3o7uEqTxmb+/yJ7pw3Nb8vXXUnSyW3EqTY
         FNDQ==
X-Gm-Message-State: AOAM5316V49kDMicoT8iOy3C7ia/b+1jTZOyhhPGeMHOTzmWCdGs3A6z
        q/6yJJFRoKOdRR7vc2zcPVl45QZ2DIBN+mJDfN8=
X-Google-Smtp-Source: ABdhPJx6fSoovzABjA9IoDrGU4lBh9+PMDQFI3MyYqi1l1i4AkazXPrOWJ2ZbUVRximBUmavoCyTsPr3vOD5wOhGbCg=
X-Received: by 2002:a92:c56c:: with SMTP id b12mr1003274ilj.237.1639734307943;
 Fri, 17 Dec 2021 01:45:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com> <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
In-Reply-To: <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 17 Dec 2021 10:44:56 +0100
Message-ID: <CANiq72n=i9e5y8ONhZdH72tNuQJp8TJKY2Xa-y4NEpSDOq0+rw@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 6:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Miguel, what's your take on stuff like this ? I am not sure if we should just
> drop this check altogether.

Given the C side documents that the pointer is valid (I think; since
others are documented as "or NULL" etc., but it is a bit implicit),
then avoiding the check is a possibility.

However, to answer this, one needs to understand the risk profile of
the project, the stability of the C API, the performance expectations
(e.g. is the call supposed to be in the hot path of clients?), etc.

When in doubt (or when there is no reason to not do the check), it is
usually better to err on the safe side, specially if you aren't close
to the maintainers of the API etc. But since you have access to
Linus/Bartosz here, it is best to discuss this with them :) And, after
all, you are already trusting the C side to some degree anyway, and it
would be good to make sure both sides understand and clearly document
the contracts of the functions so that no bindings break in the future
(Rust or otherwise).

Cheers,
Miguel
