Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D2E269FDA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 09:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgIOHep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 03:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgIOHep (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 03:34:45 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9C5C06174A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 00:34:44 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id h126so1918717ybg.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YijuKdv60r7ggV4eUSgpFVLLD2qefioGlR077TGOavk=;
        b=Hswb/aMz23PsL51GY8eDxb3bpypWWgAVRykk6TqpovRnwAKadGeIkAK5MX6tpfK6ad
         NgHFT/cIBahKKEW5RmF7zH0sIKAa92XNoNmluCv5vz1QBcqnNtJ31z8sYnVI0DazdBYj
         xuUODr8vM1GyjrgkJ0l7AroxLm6yW7y6Au31Xepz0MpJ06QbIsgwBnMhyN1B6La9tkCr
         wEAsRZScWrVvRL1uDGzJbnCIhvOf+NC/1dAv0v/fJwfKVkT9pHC7z2v9BdMn7EPyJ3a9
         Y7RkMPHNGpjkg27ywwlyAMtAxV2wowrCZw1BIgrDwLGgyXtYxYaovrOp3K2J7lBcs1Dj
         5XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YijuKdv60r7ggV4eUSgpFVLLD2qefioGlR077TGOavk=;
        b=UgfcoA/Vc8uaMR0bT2GbIMeq0HaYDILQPOSWimIZ2qXakghTkeevQ3AIx5+9Yi3jAF
         9BFKG7+bV5TEJKQI8ub6i8RXSHiH/4S+FFlc8NdqspmHlBrHZfopBrV98dPlCTNGn/VM
         M+etBrS7KP8ZLT9jtE1AzRdH/2Tp+GYtl5QtVk0Wj6CvFrMPrO5nlepDSvxaDVAtXdCH
         tqOcVGqtZ8fRoldi2XgZoBHyXx1UJLEJ+oslZnRgxQq6U6H+ek3W66k8RuJqCybViLkK
         LkEUqx1hVxtT/C3wZ0YYUcyDULHFP+dUot3dOD3RZ0BJztGFx95+nId5Qmpjd9Itf1sN
         fp3A==
X-Gm-Message-State: AOAM530/fWgRzWnq4v8w2G3hmJMfbXeDRQAcf1f2OP+9SJMqXDDu2cQH
        JlNLKiYm+3w5ZTA2daMzvpmnVWz564zDUaTlOCY=
X-Google-Smtp-Source: ABdhPJxKyAY3gHBWVEHME7xhdLzciOcuDc+kEVGQqfawCqcp11d9KIJB1JjxchxwSBHy4+iDyPSco0FKXw/l4j5PrP0=
X-Received: by 2002:a25:9905:: with SMTP id z5mr24088515ybn.38.1600155282343;
 Tue, 15 Sep 2020 00:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol> <20200915033428.GA14286@sol>
In-Reply-To: <20200915033428.GA14286@sol>
From:   Maxim Devaev <mdevaev@gmail.com>
Date:   Tue, 15 Sep 2020 10:34:31 +0300
Message-ID: <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> The bug was introduced in libgpiod v1.5 so, depending on your
> circumstances, I would revert to an earlier libgpiod or apply my patch.
> ...
> For the python binding that would be event_read_multiple() - as you have
> discovered.

Hello and thanks for the info. In my case, using workaround is an
acceptable solution, although I think I will also patch libgpiod. I
would appreciate it if you send it to me.

> The edge detection in the kernel only writes to the kfifo if it is NOT
> full, so it actually discards the most recent - you will only get the
> first 16 events. The last 4 events of your 20 will be lost.

Is this behavior documented somewhere? It's a complete surprise to me
that this is how it works. I expected to lose the old events. It seems
to me that for software that catches edge, the loss of new events is a
serious problem, since it can lead to a desynchronization of the
physical state of the pin and the user's information about it. For
example, if event 16 was falling and event 17 was rising, and the
signal stopped changing and remains at 1, the kernel will tell us that
it was only falling (i.e. 0), while the real state will be 1.

If we lose events in any case, then in my opinion it is much more
important to keep the current state, not the past. I can't think of a
case where the loss of old events can lead to problems, but the
desynchronization of the current state actually means that the
software can make the wrong decision in its logic based on the
driver's lies. Yes, this would be a breaking change, but it seems to
me that it is the current behavior that is incorrect. Don't get me
wrong, I don't insist on it. If this decision was made for certain
reasons, I would like to understand where I am wrong.

I see a specific workaround and for this behavior, when the read
timeout occurs, I can re-read the batch of all lines to check if the
state has changed. But it partially makes it meaningless to wait for
events. I still have to manually check if anything is lost or if the
driver has started lying to me. Here the example:
https://github.com/pikvm/kvmd/blob/7cdf597/kvmd/aiogp.py#L102

The fact is that after reading the presentation from Bartosz
Golaszewski and seeing the line "Events never get lost!", I was
impressed and satisfied, but the situation was not so happy:
https://ostconf.com/system/attachments/files/000/001/532/original/Linux_Pit=
er_2018_-_New_GPIO_interface_for_linux_userspace.pdf?1541021776

BTW what about unpaired falling-rising events? Is this how it should be?

=D0=B2=D1=82, 15 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 06:34, Kent =
Gibson <warthog618@gmail.com>:
>
> On Tue, Sep 15, 2020 at 08:45:41AM +0800, Kent Gibson wrote:
> > On Mon, Sep 14, 2020 at 06:55:20PM +0300, Andy Shevchenko wrote:
> > > +Cc: libgpiod maintainers
> > >
>
> [snip]
>
> > A workaround with the unpatched v1.5.x is to only read events using
> > gpiod_line_event_read_fd_multiple(), or one of the functions that wrap
> > it, with num_lines=3D16.
>
> Oops - that should be num_events.
>
> Cheers,
> Kent.
