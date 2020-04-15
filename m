Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D31C1AA94B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636391AbgDON7o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633864AbgDON7g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 09:59:36 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9C6C061A0C;
        Wed, 15 Apr 2020 06:59:36 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id e127so1880499iof.6;
        Wed, 15 Apr 2020 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pRjxl/RxXao+nWAMBe76BIw01PxwjbmGR4bmrWJXa/U=;
        b=OHyRXv+EJe89bKlBtMIRcIy6iGVeg4+1BLUU7F45NUrTBpB2u/gXtdnigUcSXXpabv
         0PEHLmSAs+VjQqxE2VA+r0z867D5opqanJSHqaEZCiHRhuAHlBnMGyF7XML6Jx9R7aeo
         EGL8BOA/hRwlm2RsJ61XfQQJxwpxLIVFF/phNaIqd1YOA5kO960q45a6Uq+ydaF2N9ju
         wZXKvL+1UrhIeVVBHfoD7bLX5j5uRuIBVGXNeA6LHtFhdER2isPGl524mlURGA0qddqz
         8sBvv1BIPxFX3atJlXidBYRZN1b8BGV80dTsvd3hrqOa/oNQlf5+IG1lZNsJfX3dvP46
         vyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pRjxl/RxXao+nWAMBe76BIw01PxwjbmGR4bmrWJXa/U=;
        b=BLBnOF0OzH8BkjBjeLHMlCGOuG8XgTopFmucrwbUhASviy+HpLwHrBCJITeZkjQNfZ
         iPG0JYMgNzJ3TrYpfc2+lGm2oa1I8FLGxjL1etl2Mv/rmNkcvNtM3ESXnMCbzyUmcg9I
         /SeO0EZjrDE+JaAtTzIvunsiya9VKf2Fs3G78J9oKG8SOh4QYsrCRaHiG35UYIvmofjg
         0YqJkBMk3Vk+5i6UNxmRdXmCN4sqV1dy6cBMUJyjDdqDwgQuylEkajoO+h/Wc4DS2MuN
         eggsZIh/35f0wrFbvvIjKgAvBO0iuQyyCm8jaUIYNOCEx0/qbEGSDmh1Aid7vMzdM1QA
         KuCQ==
X-Gm-Message-State: AGi0PuYinoZGwMu3aF/6Ma7PJH683rnd+F5TJaqT05YKNWXZXlm0qoDs
        UCkEGBs/Z1IWQT+xDouotBMRIA6VUX4NV4D8CXHHzGXP
X-Google-Smtp-Source: APiQypJ286KN3sPSWcXgZn5QQ32WFZCxO4SYT200TvkoL37eT//ErBTsACHHeQnxbpKmd+hJ2nunH5r/JqJOZNtShMQ=
X-Received: by 2002:a05:6602:199:: with SMTP id m25mr26299437ioo.13.1586959175477;
 Wed, 15 Apr 2020 06:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1> <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com> <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
In-Reply-To: <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
From:   Robert Nelson <robertcnelson@gmail.com>
Date:   Wed, 15 Apr 2020 08:59:09 -0500
Message-ID: <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Drew Fustini <drew@pdp7.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Drew Fustini <pdp7pdp7@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 8:47 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
>
>
> On 15/04/2020 16:20, Robert Nelson wrote:
> > Hi Grygorii,
> >
> > On Wed, Apr 15, 2020 at 8:15 AM Grygorii Strashko
> > <grygorii.strashko@ti.com> wrote:
> >>
> >> For this platforms the dynamic GPIO muxing/configuration is not supported, and GPIO block by itself
> >> does not provide such functions as pullup/pulldown.
> >
> > Correct, that's the state today, while Drew is investing time into
> > trying to figure out how to properly extend this feature into our
> > platform.
>
> Sry, but it's not clear what's the final target (at least from public part of this thread).

We are mainly targeting am335x based devices.  Today (well last few
years) we've utilized a "hack-ish" kernel module (bone-pinmux-helper)
to allow users to overide/change the pinmux-ing directly from
user-space...  (This evil module allows us to specify a list of
options for each pin, thus users can easily configure specifies of the
pin, aka gpio_pd/gpio_pu/etc from user-space...).  Since that time,
mainline has now grown a generic gpio pull-up/pull-down functionality,
with the ability to re-control these values directly from a generic
gpio library (libgpiod).

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
