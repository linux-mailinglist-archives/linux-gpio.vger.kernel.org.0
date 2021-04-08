Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651A3357E23
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 10:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhDHIdq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 04:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhDHIdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 04:33:45 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C564BC061761
        for <linux-gpio@vger.kernel.org>; Thu,  8 Apr 2021 01:33:32 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r12so1615633ejr.5
        for <linux-gpio@vger.kernel.org>; Thu, 08 Apr 2021 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5yCCjiWkAwqATqPSjIjQNyLbmG/huiKlevGSmwkEyR8=;
        b=IILPK87co6cRB30SBUD84s8jNEWHphYGfXu/trBxCn+HYZUD6LJxbIvbuvoFnHEIkJ
         8pT9+YwIxsWGPJRTvxmuhYnpdDMWE7ehCgXLZT0USf+os5lIdDr2/icw83jnnqMaPnDJ
         xXGMlpCnW+2Bu77aPYpaluIWMrDqKvl0b4qJ+jfLyt0aqMRftlIA69uuWYb5OSO+DKwb
         4bGlRcnt0chwis+3AaomfayoRZ6xkjTia6ZhRGhXeGDRVC2/knn8LJ4eYbjKQEIthRZr
         ela4zkCP9xWbLI0gWkQc5AW86VMw5RLYQeftE2A7cyrwz4VxXYWsVzKjDOPL7iBUiTGz
         7W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5yCCjiWkAwqATqPSjIjQNyLbmG/huiKlevGSmwkEyR8=;
        b=ioTY+WBsACnqZIWoMDguOYE283t4oXmGSt6ghbNnOd7WW/tkgYiJeV7Y+PhGRA7iTf
         VJxspBOrSIc9rv0jLYRirYesrko0tjvqU0SVLIjslAknkaI3SZKfj4NCDFAQ7x515dCe
         fk6VAp7bc+dQpnOb2tYkHaIbhq5EyBwSaBZ6Mvk/Xk2YX01JvktRAW6wYbJOBz4C2dDT
         AcOi+zqv+Eg3bWq9x4+fDja4um7Ij5Y5OrZ8VmjWBdTXmHoUjFPxNL7VqjsKIO90S0Ut
         yU0qLdR5aIzszw8wLpdKZCNMojH4jM3mCipcMS8svWoVu9p+z1jX8KSWPn78tsLbCqoP
         6zsg==
X-Gm-Message-State: AOAM532hViZQcwE38YMNSto+wJ/ZNcZQ9vzlhA+h1uEez0ouTHaipEmt
        jMFr2QzyHBMgSMvpz5yQWQjFhQIpgwURnIKFGJKALg==
X-Google-Smtp-Source: ABdhPJyu6/8vxWkUZcupdWZS44/FuHmo3e72vR0EqZhptpOKA0zGOzhX+uQpSlk8g3+BrTRTBir+tAGqYdWiAxlxXLk=
X-Received: by 2002:a17:906:9605:: with SMTP id s5mr8993580ejx.287.1617870811400;
 Thu, 08 Apr 2021 01:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsiRYaE+y44ApDkvPvbDCdiJ+nnCMhiiaPVsg6p8m4+1Q@mail.gmail.com>
 <CAHp75VdJ7kGXN6sk8HTeSfAKQtHDGSmtdVPn7CSkK5=yfDizuA@mail.gmail.com>
In-Reply-To: <CAHp75VdJ7kGXN6sk8HTeSfAKQtHDGSmtdVPn7CSkK5=yfDizuA@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 8 Apr 2021 14:03:20 +0530
Message-ID: <CA+G9fYuG12WaC6QAdx1k80v8-As7a7oVVkhaUDxqgV=BaunfxQ@mail.gmail.com>
Subject: Re: [next] [arm64] [gpio] BUG: key has not been registered! DEBUG_LOCKS_WARN_ON:
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Colin King <colin.king@canonical.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 8 Apr 2021 at 04:21, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 8, 2021 at 12:38 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > While running kselftest recently added gpio gpio-sim.sh test case the following
> > warning was triggered on Linux next tag 20210330 tag running on arm64 juno
> > and hikey devices.
> >
> > GOOD: next-20210326
> > BAD: next-20210330
> >
> > This is still happening today on Linux next tag 20210407.
>
> Can you add the following
>
>   sysfs_attr_init(attrs[i]);
>
> to the end of the loop in gpio_sim_setup_sysfs()?

Do you mean like this,

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index ea17289a869c..5fe67ccf45f7 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -296,6 +296,7 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
                dev_attr->store = gpio_sim_sysfs_line_store;

                attrs[i] = &dev_attr->attr;
+               sysfs_attr_init(attrs[i]);
        }

        chip->attr_group.name = "line-ctrl";


>
> If it fixes an issue I'll send a formal patch.

I will build and test this and report here.

- Naresh
