Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F4747A48D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 06:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhLTF2i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 00:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhLTF2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 00:28:38 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250A9C061574
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 21:28:38 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id x1-20020a17090a2b0100b001b103e48cfaso8057084pjc.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 21:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oJidzbW2lj4G6oJPN8cPoZP8R9z7Jhnz3zJWOhNgPcc=;
        b=E3ILASAi4KB0gLADNwEzIedZ0iprf7F2ck2GvwFhv7DyPSULP+h4DHIb/XP53DyX6Q
         zfhvsb5+TkQzughRUhZcPuHgvdNxW0URZP5Qcx1Dfi23rcdsGhEaNGaglbZtMues7xi9
         t/4qHcSgTLVwE401UzXrFi6uGP7AtAXI9Q4kSHbEPtnrKwTOLHpCdJnjPRaGHNjOIIgy
         AJnOKtoUs7MMKa1eKgMca1CMU9M9o/a7ZY6fjqCYDKvOtEsYrpabOvNzBmlSNqpxhD0J
         aKVNUTIfijhxjM5aEEta2npxULiyAXUHdffhp/quSgwdfsChHeqz2jMvEvam+SpnfzD2
         Axdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oJidzbW2lj4G6oJPN8cPoZP8R9z7Jhnz3zJWOhNgPcc=;
        b=jlu85C+jGiO/2vnj8JSsvjar4T9FMHkMwc8rNXt1GsBlnUgTo+O5joCYNxeVLUfe1G
         OFjG8vV0rfPpc5RiQRblIOo0BG9NYMwXJpMQG1q3NvROUjalQkVPrGz72CtRgQomecPm
         qEn/vHB6Kx4VS8OBdR6KZXWB7lk99lIttcBIbHavCaOpl2i4xlksaBty3SXI0xJeM6Hf
         /vwhy2566GgeySyriP7ppIMxBAy9Qoabze1pZLaf30A1SuuGt08yyuQGCSTODT82ZVaC
         I1Ev4hxb1QanxY6RJiIg2IWAD9NVtbzNg//9uaJ+YdOkSp+R9QQahgF5tXMJVnPcWP65
         qgag==
X-Gm-Message-State: AOAM533kFRY750npUJ6BsvtMHgQEBz69YfURp04Ea5s0Bw+VKAlsTQ6+
        A3ERIyysMvmKuUlxXzvTxdrZ/Q==
X-Google-Smtp-Source: ABdhPJzJp/vQbXWkIio/4pv7MVGyfD5hGb/ZG0P4ylc2ThPa4tX7+o98apjhv+hqmMM5qU/azJtbJA==
X-Received: by 2002:a17:902:e5c8:b0:149:14b:f2da with SMTP id u8-20020a170902e5c800b00149014bf2damr6800929plf.110.1639978117700;
        Sun, 19 Dec 2021 21:28:37 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id g22sm18512699pfj.29.2021.12.19.21.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 21:28:37 -0800 (PST)
Date:   Mon, 20 Dec 2021 10:58:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20211220052834.b5vca6vrfh7nucsl@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217050135.l7p3sudbdvzewi6y@vireshk-i7>
 <CAMRc=MeP7xPsaiEoJ4ML8SNMo7BH9pb34eUkG6+3SLf+A=biMA@mail.gmail.com>
 <20211217093239.to4u5b5zorr2hpee@vireshk-i7>
 <CAMRc=Md33nLhMMOSQgQXW5hzXFbkPE3P9Drkj6DK543-cSjCaA@mail.gmail.com>
 <20211217095415.axgq7t6pni5sb7rp@vireshk-i7>
 <CAMRc=Meh7Q=01PpM6vuwMf2S5at2OsSyNT5jXqnUE_f+n0vzXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Meh7Q=01PpM6vuwMf2S5at2OsSyNT5jXqnUE_f+n0vzXg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-21, 13:02, Bartosz Golaszewski wrote:
> On Fri, Dec 17, 2021 at 10:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > I don't know Rust that well to be able to come up with an idea off the
> > > top of my head but I assume inheritance in one way or another exists
> > > in rust? Can you have an EdgeEvent interface implemented by two
> > > specialized structs, one that's stored in the buffer (stores a pointer
> > > to the internal event)
> >
> > This is what my initial patch had, right? It isn't safe. There is no way for
> > libgpiod-rust to guarantee that the users don't access the EdgeEvent after the
> > buffer is freed and this needs to be made safer at libgpiod itself.
> >
> 
> I'm not sure it had the same thing. In libgpiod it's simple a matter
> of definition. The docs state that a pointer retrieved using
> gpiod_edge_event_buffer_get_event() must not be freed while one
> obtained with gpiod_edge_event_copy() does have to be disposed of. In
> C++ it's safe because either you hold a const reference to the object
> stored in the event buffer or you have copied it and now it will
> survive the parent meaning the user can access the event even after
> the buffer was deleted.
> 
> > > and one that stores the copy (and frees it when
> > > it goes out of scope)?
> >
> > I don't understand what we will get out of such a scheme? Is there any benefit
> > of getting these values via the pointer to the internal C event ?
> >
> 
> You avoid allocating memory for those objects. The memory exists in
> the C buffer. In order to keep a similar level of performance you'd
> need to replicate the behavior of the buffer in rust as well.

I was aligned with all this, I just wanted to skip providing the interface where
we use the event without copying as that has Safety issues. I will try to
provide both the options now, lets see how it looks.

-- 
viresh
