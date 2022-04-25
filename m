Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A928350E3A4
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 16:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242571AbiDYOv4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 10:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237185AbiDYOv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 10:51:56 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA6BE0C
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 07:48:52 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gh6so6041171ejb.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQaX/A4/I4s0qGu0vJ+njlRdZAPY9nAxyONMP1I41xA=;
        b=eg9IuoW1OSeXcExZx9Hh4/oZUh9YGDuept5KxU5bqry9p605Dj7kxSPYupWhyNpWgp
         t5hKfyyrXeAIs1BJ4BkMeqpcbGy57Gvr9l64q2ekExIFQVyvTzP3sbWUNleu6amA7Sox
         2MJ3F6+ipJRPIotOWH/oYyqrqRtdPzseSXfKpHn/QpwPzoldE5tmUw1kshpmwCaH//39
         j0yGoG59cxaHrt1r3WIGNL4WCO3Ac8DIkLmAVF/4KJBEJhp31BwXTnKX4PGa/SqOZ296
         z0UQl+1NlJD8XCapxDztceukWt82sT9NUactgNHkKUjTZHQZet+l9iyGxz91m7T8uSj6
         b0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQaX/A4/I4s0qGu0vJ+njlRdZAPY9nAxyONMP1I41xA=;
        b=yOjbMqWuBrpb7q1SbLdM51jeXSsphez2XfLnDBsZI4w9HXiF+NqaphP/BeP/vl8UCE
         Dl+zX2XCrMafaZtMD82B9pCtmLW3lZd6WPzjwiO7rS7ZZzi6XUDi4bMgqUuKzSSoCQB+
         78ibXZR86UEr0dmXEzwR9qvKau8XbcTKTasJAJPrke3wXGrYZieW1bM1osJ/W/6uAA8g
         FPSnxfqoLxH746qqByzIHK+iGz78fl8jd6L6i+91DD4KjhsmTZoVHuixdiL0g/6zLq8a
         FDmuBK2sV1h36MDVLtUMF6CS5V27BIImqzr2v9YrvN3dvzu3DllTJVfeW83u2qFHNxbx
         2mSQ==
X-Gm-Message-State: AOAM531BF9nEzIiGmSbZTwadMhl/rzU8FMd7KvV/yKD4PId7Qb+fkc1L
        KgzUq+igV8Vlu0wh3tNKgsvYy6HhALSYx1B1w6k3w3iYPqEDwA==
X-Google-Smtp-Source: ABdhPJzy0JJW/uToo29EniMYFiG+jxqgQfU8W/OvHPAu104UofnQgjkJA9gg6D+r4llEDI35yzZzbPkmzB/QpMp8FOU=
X-Received: by 2002:a17:906:1841:b0:6e8:872d:8999 with SMTP id
 w1-20020a170906184100b006e8872d8999mr16449066eje.492.1650898130612; Mon, 25
 Apr 2022 07:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220323142236.670890-1-brgl@bgdev.pl> <20220327122153.GA24870@sol>
In-Reply-To: <20220327122153.GA24870@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 16:48:40 +0200
Message-ID: <CAMRc=MfsRE0ALqYbxqd6LLiwQZoBOUhQmNYGZuYuqn374ZzErQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v5] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 27, 2022 at 2:22 PM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

>
> > +     ::gpiod::edge_event_buffer buffer;
> >
> >       for (;;) {
> > -             auto events = lines.event_wait(::std::chrono::seconds(1));
> > -             if (events) {
> > -                     for (auto& it: events)
> > -                             print_event(it.event_read());
> > +             if (request.wait_edge_event(::std::chrono::seconds(5))) {
> > +                     request.read_edge_event(buffer);
> > +
> > +                     for (const auto& event: buffer)
> > +                             print_event(event);
> >               }
> >       }
> >
>
> What is the purpose of the wait_edge_event() here?
> Wouldn't read_edge_event() block until the next event?
>
> This example should be minimal and demonstrate how the code should
> normally be used. e.g.
>
>         for (const auto& event: request.events_iter())
>                   print_event(event);
>

We're making the request's file descriptor non-blocking in the C
library. Do you think we should keep it in blocking mode?

I'm no longer sure why I did that honestly.

Maybe a request config flag for that?

Bart
