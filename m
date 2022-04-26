Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B66F50EFC0
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 06:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243595AbiDZE1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 00:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiDZE1Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 00:27:24 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF074443E9
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 21:24:17 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id g3so14459312pgg.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 21:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AziEqC0Q6pSh4ntP3HXty97YIvQ3ZnrFuGF//JT+8wI=;
        b=jPjffvP6d1TnTN3ivvBwDRR8J68RhJvdkzDI7K8YDb7gz7BAJTURzfeXTuy5Ahs/Ky
         O+Asg9ekeC4jYAGy6AMY95V9ppcfN9qc5SOy8l0Gp7haeQJmfNdv5w4cBiyFvsHnVI1Y
         UO+6MD+Snm02z/oj2jF4flEd42jcrVJnSEh8Etv1klJFEs4zM0bsjTrApyM9J4kW90I9
         NK91SgR0bBKrUutcrRkIJzC5dF9QmjOdALdmMBtrz/h4BNo5Z1xxa4+KUWt6xdqgXqyO
         HgW3qs63J8O2YnXMI+KQCH9glIAXyiZz3gZyVcvZXVTgGBuRsONO9AqKRme5oVoSbWIo
         iWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AziEqC0Q6pSh4ntP3HXty97YIvQ3ZnrFuGF//JT+8wI=;
        b=Mz0xzvFZWnXoEulahwBwzpJV9jBd97mpDz+xquc03EeP1L+m4XCMzPqqU7VjR5g9Bu
         AiC6s7U/fBZIHIG1zFWS82T8dTp06F5gVL13zX0NdhXfTAfcJbO5uUjYk7wVeEso4GUq
         p6baTfpjUed/06egtoJH7VT1RfFK1K/Wa6EepBLHkVKdq1ZyDOqiUAoKlDX4uPxrHlb5
         TmBB23hTqKXIUiTSVO3Jpi8gXYouUmCaRcU+HIonVyqaqlQCGRFatYr17T7u5kIcXm3+
         p535hT6p/uAnkNSQdtFFPQ9XYRwLwqL4hSin6Or8AvReh1H0m+5uIX0ZLDcDukHx60vY
         VNzg==
X-Gm-Message-State: AOAM533fI10dDdfVKJYN3lpZFLOocc2lb2KFRDMjZTjh30WThi0KGdJZ
        Yz6EepvjVRqDn0ne8bSVAaZdOybAbF4HKQ==
X-Google-Smtp-Source: ABdhPJzhpRi3mjyWA5irMRSmS+9JjcfedbBFpxoTheY0i33+18DjkCquuVfQ/OyI4xofXjcPDFyHlw==
X-Received: by 2002:a05:6a00:894:b0:4fe:25d7:f59e with SMTP id q20-20020a056a00089400b004fe25d7f59emr22619019pfj.58.1650947057215;
        Mon, 25 Apr 2022 21:24:17 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id v24-20020a17090a521800b001cd4989fec0sm915545pjh.12.2022.04.25.21.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 21:24:16 -0700 (PDT)
Date:   Tue, 26 Apr 2022 12:24:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v5] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
Message-ID: <20220426042411.GA14421@sol>
References: <20220323142236.670890-1-brgl@bgdev.pl>
 <20220327122153.GA24870@sol>
 <CAMRc=MfsRE0ALqYbxqd6LLiwQZoBOUhQmNYGZuYuqn374ZzErQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfsRE0ALqYbxqd6LLiwQZoBOUhQmNYGZuYuqn374ZzErQ@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 25, 2022 at 04:48:40PM +0200, Bartosz Golaszewski wrote:
> On Sun, Mar 27, 2022 at 2:22 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> >
> > > +     ::gpiod::edge_event_buffer buffer;
> > >
> > >       for (;;) {
> > > -             auto events = lines.event_wait(::std::chrono::seconds(1));
> > > -             if (events) {
> > > -                     for (auto& it: events)
> > > -                             print_event(it.event_read());
> > > +             if (request.wait_edge_event(::std::chrono::seconds(5))) {
> > > +                     request.read_edge_event(buffer);
> > > +
> > > +                     for (const auto& event: buffer)
> > > +                             print_event(event);
> > >               }
> > >       }
> > >
> >
> > What is the purpose of the wait_edge_event() here?
> > Wouldn't read_edge_event() block until the next event?
> >
> > This example should be minimal and demonstrate how the code should
> > normally be used. e.g.
> >
> >         for (const auto& event: request.events_iter())
> >                   print_event(event);
> >
> 
> We're making the request's file descriptor non-blocking in the C
> library. Do you think we should keep it in blocking mode?
> 

Ok, didn't realise that.

The function documentation for gpiod_line_request_read_edge_event()
says:

@note This function will block if no event was queued for the line request.

and I was assuming everything was built on that - so blocking.

But in gpiod_chip_request_lines() you do fcntl() the request fd to
non-blocking. So that documentation is wrong - or you should not be
setting the NONBLOCK.

If there are no events available, gpiod_line_request_read_edge_event()
will in fact return -1 (EIO), as returned by
gpiod_edge_event_buffer_read_fd().
If you want to go non-blocking, that should return 0?

Also, the line_request::read_edge_event() methods don't specify if they
block or return 0 if no events are available.  Whichever way you go,
document it.

> I'm no longer sure why I did that honestly.
> 

Hmmm, the only reason I can see is so gpiod_edge_event_buffer_read_fd()
can read up to max_events events in one read and not block if there were
no events available?
It could poll() first to check if there are events available - but it
doesn't.  Keeping syscalls to a minimum?

> Maybe a request config flag for that?
> 

I'd rather not - then you need to explain that the functions mentioned
earlier may block or return 0, depending.
I would rather make the wait/read the standard approach, with the read
blocking if no events are available.  That is fine for the vast majority
of cases.

Having said that, given you expose the fd, the user can always fcntl()
it themselves - in which case libgpiod should not assume that
gpiod_line_request_read_edge_event() will block - it may return -1 (EIO)
instead, as that is how gpiod_edge_event_buffer_read_fd() currently
behaves. So libgpiod should handle both cases, even if not explicitly
supporting a non-blocking read.

Cheers,
Kent.
