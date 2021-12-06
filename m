Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5207468E39
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 01:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241488AbhLFATC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 19:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhLFATC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 19:19:02 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A56C0613F8
        for <linux-gpio@vger.kernel.org>; Sun,  5 Dec 2021 16:15:34 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id bk14so18357825oib.7
        for <linux-gpio@vger.kernel.org>; Sun, 05 Dec 2021 16:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OcQu+nszxHeciDfMgQfC/dJ4VYy85Zg0zWvNUBVRLDs=;
        b=dgZV9awunn/xxdlPzy4aApzuRcKEUfr5RDfQQviA9m4veWA8oWjuCkiH6E5hzxBcno
         mleqm9ThQYeAcnI8f+UPhhGJBNVHlqMZb2foyqga9uirq4eLhBTP/wBa61pbpYkmjao9
         XbgAtGL0X26skPTkunr37eSq9/txTUTVgbojUIvr9/iTov9fb5201badrxEietTguf3X
         xzmtXCPqNIcN0JkcNr5HPqgnQ6aLP7zLfukTHP9ti6hRJjOLTb6cNes5vGc+UtvTJyvP
         6mboxZbfba/56+2s/RCc9pw9/ntqzdMa/6OLNK2Dbcve9Q8lhQ3DRactI2Tw/qvUmOst
         /VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OcQu+nszxHeciDfMgQfC/dJ4VYy85Zg0zWvNUBVRLDs=;
        b=VblUQnejE7HT6jkoKdlQfIdw/lyuovK39lpQFarFzAyk9LriS6sz5ZJl0oL1EWApj+
         wUC5Vr1YvQ3jts5VAjfmZRQtOHdUev5rsm3fKR0/BaxiRrDhDUXkgfmnkmoHNp3M7fY0
         MHLnJB6VmHn7J/mOUGs8ovVvulR3w7oa91oDUtyyCAUjKPBHMf8BcPH9KMYLR6xINi/P
         Jtcq5ls7sdhSQUQQ/MWBFxfg6UuBQ7UQDgywsLNY5Gl03f9yas0CG10Rplq7mVNd1e0n
         PNFOxWj5EaWLoKTZo1kA12oXOYIdVoOLG0DPQsyZ1sQcrklhAcz7nDPTkKcLmmu5JHZ7
         syXA==
X-Gm-Message-State: AOAM533vwmDaVL1cOLwu5UY1ailchl2JBix4l9uBG0pJFv2leTrtNlls
        Nr6GncGHI/y30uAXwOgywU0m/keXJ2CB2Bk+dyvQYbpboBA=
X-Google-Smtp-Source: ABdhPJyz/9SHneoAqYpVtNjtIolhIoXihV1nZKZYLYvJHm/Luyf0FC0ojXQNQmQOuX+P5LaPEBW9O9CSCF2ur0XHytg=
X-Received: by 2002:a54:4791:: with SMTP id o17mr21710174oic.114.1638749733578;
 Sun, 05 Dec 2021 16:15:33 -0800 (PST)
MIME-Version: 1.0
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com> <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
In-Reply-To: <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Dec 2021 01:15:21 +0100
Message-ID: <CACRpkdb3q4-9O3dHS6QDWnZZ5JJjXWXS9KPvwXVaowLMRhcejA@mail.gmail.com>
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid context
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 5, 2021 at 11:45 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Any idea why this hasn't been seen/reported before? According to git blame
> that mutex_lock has been there since 2013. Does nobody test with
> CONFIG_DEBUG_ATOMIC_SLEEP? Am I really the first to encounter this?
>
> Before spending time on this I'd like to be sure that, yes, I'm really the
> first in 8 years to see this, and this wasn't introduced by something else.

Probably because people don't CONFIG_DEBUG_ATOMIC_SLEEP
so much and then it will also work fine unless they have a GPIO
that is backed by a pin control driver, because it's only then that
you have to go and dereference ranges.

There are lots of GPIO drivers not backed by pin control drivers.

Already at two variables the test matrix is big enough that people
don't really get there to test it...

> > If it still need to be sleepable (mutex-ish) you need to convert it to
> > use RCU I think? (Which would be pretty cool anyway.)
>
> RCU seems like a reasonable alternative, but I will have to read up on it
> since it's the first time I'll be using this. All those quizzes in the RCU
> docs (1) scare the hell out of me :-)

Don't say this to Paul McKenney he is very invested in the quizzes,
haha. I think this comes from authors such as Donald Knuth who use
them as educational tools.

Yours,
Linus Walleij
