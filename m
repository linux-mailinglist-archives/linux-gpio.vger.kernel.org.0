Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1357B28CA68
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 10:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403933AbgJMInM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 04:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403918AbgJMInM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 04:43:12 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19C8C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:43:11 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a5so19513175ljj.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zv0iqh7SWHu3tmYR6PPtiAS9fETlgJuE+f7z3R7HPHU=;
        b=EwAbM2RGaTTuHpEkbGhm9sEdo6ZaY1TDYVnNbPEciTUKY5LXOe0P2wYAXP5v/SowoL
         86dum30mbAp8NxA+hyJocDFnJTvNH5346ODzZMBALx6xHhSNhjndMlg+iEehysMBYAbO
         bQ8nDdA4VlVUGyaKNXqcoNMF9IuFXrX0AXc6kZm/hHL0nuY1PuxWGGySz7QP75tqtoDq
         ok2UQKK2UA1XHCegwFxUt2pcQOaiidFVN0LsGO/g8YT96iT1Vsq8oId2xl5sO5FicKRx
         usmijipvABCV9T5UAc+Rbhnm8L53N0k/GNhpdVBAmiSuNgA9f1okkrrN8JxuA5Pyr6+C
         fmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zv0iqh7SWHu3tmYR6PPtiAS9fETlgJuE+f7z3R7HPHU=;
        b=OVCkKfRLoLmss61BB8IxLaPjEDl8gztwBjNAGmdYZiIKoCQswvKB8ZVGfs3WRiqoC1
         dWmnk2iUC++sKI0+Ihb49jPu6KgqG+PQrD4yWSVpSFJ4bnex897uj/oNGw+64PelVt3O
         yc5kWL7DZlNZHPW1d6nPL4P7nazvfZ1+qqKNMK1VMaD1lduc8AeO7MdNOdGym494p4SZ
         4IH8OPkmzEnUMcQ6UTjVtB+kwFYYE3taYD2Ju8Y3KIStW9Uv3XG1bV8MC+djCzVKOJY6
         T8A4SEFVHqd0HQeJDhQ09a17UwoZi5wauRulEa8G6fhCHZHYPm7r5jx0b4cGlQ6IXJfa
         ov1Q==
X-Gm-Message-State: AOAM530asbKlNJ8h1NsVVzJIOcIa8XZ37VWkfTDd2yrsHKHevhHra4F4
        yZOudzk8cfOZjIveRCnloBvZc07tFj2fKn0PMFynhg==
X-Google-Smtp-Source: ABdhPJzsKhyfvPzaAOYep/hAF1ukHTPHBrnu2KWHHlcEr3Cb/P4PZE7iYG3R4ZksfnP7xT8erzcOt3oYB3CvvXMdCmE=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr11351232ljb.144.1602578590353;
 Tue, 13 Oct 2020 01:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
In-Reply-To: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Oct 2020 10:42:59 +0200
Message-ID: <CACRpkda4DF-XAi5XpJNLU_vjD9Zrjs6PkGpz5BW1E44W67SWvg@mail.gmail.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     Jack Winch <sunt.un.morcov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 11, 2020 at 5:11 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:

> I recently noticed that in Linux 5.7, gpiolib was changed such that
> line events are now timestamped using the system 'monotonic' clock
> rather than the system realtime clock.  The rationale for this change
> appears to be due to the major use-case of the line event timestamp
> data in relation to the nature of the system realtime clock (which can
> jump backwards or forwards in time due to adjustments by third-parties
> - e.g., NTP or PTP clients, etc).

The background is in the commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/gpiolib.c?id=f8850206e160bfe35de9ca2e726ab6d6b8cb77dd

Also study the solution in IIO that started the discussion about
all this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=bc2b7dab629a51e8beb5fda4222c62a23b729f26

> I know there are users of the line event timestamp who actively
> rely on that value being obtained from the system realtime clock.

(then in follow-up mail)
> For context, these wall clock time sensitive users are running on
> systems which are PTPv2 clients, with their system realtime clock
> synchronised to that of a local PTP Grand Master clock.  In the past,
> I have used the TTL Pulse Per Second (PPS) output of the Grand Master
> to evaluate methods of timestamping line events with wall clock time
> and it was the kernel timestamping which was most suitable for our
> application.

As Arnd stated in the thread from 2018:
"most of these clocks make no sense at all for a random user
space interface, mainly because I wouldn't trust user space
programmers to make an informed decision which of those
seven to use."

So I suspect you actually managed to make a good argument
for using the realtime clock, we didn't see that coming. :)

But why can't userspace (whether your application or libgpiod)
just call the system clock_gettime() function at the arrival of a
lineevent in that case, and this will be quick due to using vDSO
on most arch:es so no user-to-kernelspace switch will be
required?

clock_gettime() can get you any of the things IIO can get
you.

If you really need the timestamp to be as close as possible
to the actual event then I see why you want the kernel to
make the timestamp in the hard IRQ handler already, but
I just want to confirm that you really really need this.

> My suggestion (which I would be happy to implement myself) is to allow
> users to select the clock to be used for line event timestamping on a
> per line handle basis.

I suppose that makes more sense than the "global switch" in sysfs
for the whole device that IIO uses. At least it is a clear sign that the
user wants this specific type of timestamp.

> 1. Increase in processing overhead and latency of timestamp
> acquisition on line event interrupts.  Implementing the proposed
> change requires a function call to be made to the appropriate ktime
> accessor function, based on what the user has configured as the
> timestamp clock source.  In kernel versions from 5.7 to current, a
> call is made to the ktime_get_ns() function which is most likely
> inlined by the compiler.  This change will result in an actual jump
> having to be made, which will have processor and memory access
> overhead (potential I$ and D$ misses).  Then there is of course the
> overhead of resolving which function to call - either a switch
> statement or call by function pointer (probably the latter option).

Given the overall latency of the kernelspace to userspace
switch and the whole kernel executing around us this is not of
any big concern I'd say, though I will stand corrected in the
face of real-world usecase.

Yours,
Linus Walleij
