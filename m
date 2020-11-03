Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7198D2A4361
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 11:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgKCKsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 05:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbgKCKsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 05:48:21 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6C8C0613D1
        for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2020 02:48:21 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id e7so13815816pfn.12
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 02:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rKa+JgzadxzWS3bdsoFXKOpjwWVP8DbpJnaCBUt14mo=;
        b=qpi63dg6RuLyzF9O47QcF7vcoiD+4QFUfxKAw8oKDqOaSdbinO/wT6qcAcQdnoWd4Z
         7sG1u23gZWuG9RC0vn6yrrHtnoWfhqPfnzB2NIKwKnup3D0p1qiWYqv9sMf3gikX0aJN
         vVRmftQqrce7TX4H30ZyqMcXwRyKd58ia9q8QL/iYhLtdj63q7HkOEFwCwXPldpgYoz3
         IjubeWJ85dG8h5TEfloxM/AZee178RiKZCGmtt+uO25ehGFMZnrmkasq8LqTS5P7SUKc
         sZV3JlEIFmYGSBI6M4tLTKCilw1LEmaF8hzn2BtfgsbzDeWgKzisjWJJHjSuGqru6iVd
         mNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rKa+JgzadxzWS3bdsoFXKOpjwWVP8DbpJnaCBUt14mo=;
        b=UWbO+lvewBJkWK4pFVU5odoHQOGYX+9nraGFbZfprKXMiUX7D+Xdbk2hIRzONmpWIY
         HJNd5IglI4Jj1+w9Cc3Z+lbljOoBdXoUAWF1k5ATte5Bwy5Yr3ee06foJXnbvglAmx6I
         QXkZMwd61AXNS+Ov+mFWhNMi18gvRVcC/jOkODyMPCGoW3aNom9tA+u4jrCBPZ04KWkE
         dzYDGImicNWVVFW2QnE2OY/4oTPGiE4qn2EBFBARyJdCqv6WnwGjg7TWvGq98Zq33cpK
         UTuu1KAPZmzC+tZZh/2DaaI1NG0g8g7to/0UQxN+b17Cz0FYu0ISCYtiPr2ZFd5Ee/sM
         pOPA==
X-Gm-Message-State: AOAM533771sJBRdmT+0AQluEKml504h/Oo7lvNLr4X4soJQMNcgPQoBS
        Z+tr31hkenCkHuGAQIBSeUiOhwV3T5dnXO6w1ujegv+ifQ40Rg==
X-Google-Smtp-Source: ABdhPJxMkcNLPT3Yz759qyIzP/3KsBKciOfH87QdigzUYnNTt8Typ2gcfJpVpSv32xsCNO6oLRV2+1eYYd0se9avpSo=
X-Received: by 2002:a63:4511:: with SMTP id s17mr9135338pga.4.1604400500661;
 Tue, 03 Nov 2020 02:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20201006044941.fdjsp346kc5thyzy@Rk> <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk> <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com> <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk> <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk> <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <20201103000507.ufzukd2vkb5h2e3b@Rk> <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
In-Reply-To: <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Nov 2020 12:49:09 +0200
Message-ID: <CAHp75VdYhe4YEAzULMNkhihTQwHAP3fC2F6iD=datqzyzd=4fQ@mail.gmail.com>
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Coiby Xu <coiby.xu@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 3, 2020 at 12:12 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/3/20 1:05 AM, Coiby Xu wrote:
> > On Tue, Oct 27, 2020 at 11:09:11AM +0100, Hans de Goede wrote:

...

> > [1] https://lore.kernel.org/patchwork/comment/1522675/
>
> This is a case where Andy is obviously right and you should just use the
> higher precision "unit = 15625" value (except probably that is wrong too,
> see below).
>
> We have had similar issues with the docs for getting the TSC frequency
> on some Intel chips, where the docs said 16.6 MHz for a certain register
> value, where what they meant was 100/6 MHz which really is significantly
> different. This was leading to a time drift of 5 minutes / day on non
> networked (so no NTP) Linux systems.
>
> I think this is what Andy was referring to when he wrote:
> "What the heck with HW companies! (Just an emotion based on the experience)"

Exactly!

...

> Actually all the values look somewhat suspect. The comment:
>
> >                 Debounce        Debounce        Timer   Max
> >                 TmrLarge        TmrOutUnit      Unit    Debounce
> >                                                         Time
> >                 0       0       61 usec (2 RtcClk)      976 usec
> >                 0       1       244 usec (8 RtcClk)     3.9 msec
> >                 1       0       15.6 msec (512 RtcClk)  250 msec
> >                 1       1       62.5 msec (2048 RtcClk) 1 sec
>
> Helpfully gives the values in RtcClks. A typical RTC clock crystal
> is 32 KHz which gives us 31.25 usec per tick, so I would expect the
> values to be:

I guess you are mistaken here. Usual frequency for RTC is 32.768kHz
[1], which gives more or less above values

30.51757
61.03515
244.14062
15625
62500

[1]: https://en.wikipedia.org/wiki/Real-time_clock
(just google: rtc clock frequency)

-- 
With Best Regards,
Andy Shevchenko
