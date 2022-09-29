Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C725EEE1B
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 08:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbiI2GyS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 02:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234952AbiI2GyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 02:54:17 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA3A12F761
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 23:54:16 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id b21so479967plz.7
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=g7pmH4wl9mnYOJLw/C4Z5mz6PmJK8Xgd4ECsRpBcpsc=;
        b=BwC/igXizLjdGHXOFSsAv0TOT/TTi/IOF7GtoqFGXKv6qponcFu4fYgeZiMaqyukig
         u7idsyUn62rf4AmFoqvZgNWJuGaipKEAdXMtw4VwoBG1L+KgNLIJ0OxdcszfvXgQNN8r
         luhumJKbZBKeYLEcdQNopl5tR3lrC83tDRS3sAaBRGaIGRqNN/I04ugb5tYBbQsy1fXL
         oC/2hYfJ1yxuw0P8ilTXJ6g8n9j5lL9ubkeiQDB8OFMu9XP/hzziDnf02+7R4Trgn2mV
         pw2r5ZI5vtbetDrgEFbc0TLDiysC0uuFozQ0cAIdYA3vmaWEQreQxefA+lD4kQPobG6O
         izxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=g7pmH4wl9mnYOJLw/C4Z5mz6PmJK8Xgd4ECsRpBcpsc=;
        b=ChRR6kLgKIeXnNRug/pnAmC/CqASSt7Ky8J75bcBFV4eTkU/wdE5kJoNpAEFm6ukwP
         Mq5WLaVAEY3QWlHeBD422PqOrc0ABze/Em0cDgv9FjgZpnzc67ByqsWZWiaQgGskekw3
         H9f6FQFHDvphypcDSFHJFgm1Gjx7fZSWal9jt48LG8o1N0sd3H2mWS0RQ6tKdQ4v5uOV
         k7Bng9B7JT2yuHsPXhUNop5giZRhDgt01WQ0PuT+dELGopVWHCCvnjR5Nrw+WEALxu71
         w/Y1EoUeRd2Dn921LUXmnj1dljQU3DVthjYsaqeo03QFWhG6ckEvpqex+iFJN9DJXKrz
         f1gA==
X-Gm-Message-State: ACrzQf2+ZwmC8Wd6cB6NXvzqONxb3iT0606RyPEWc6Ylagkakufc0DGP
        Igb2KHjUak5m0vY0HqHeqePt2w==
X-Google-Smtp-Source: AMsMyM6+4+a0BcZnvheDSbTWHDFF6J9xFpEyo0k6EhZrumQ+kaJzPjS4I9Cpn5O5N62gcPG8U7/RuQ==
X-Received: by 2002:a17:902:dac7:b0:178:b5e0:3627 with SMTP id q7-20020a170902dac700b00178b5e03627mr1899530plx.147.1664434455752;
        Wed, 28 Sep 2022 23:54:15 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902d48100b00174be817124sm5056105plg.221.2022.09.28.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 23:54:14 -0700 (PDT)
Date:   Thu, 29 Sep 2022 12:24:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20220929065409.rqilrzxaczvvds4i@vireshk-i7>
References: <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
 <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
 <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-09-22, 19:54, Bartosz Golaszewski wrote:
> On Wed, Sep 28, 2022 at 5:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > Hmm, so what exactly do we want to do here then ?
> >
> > - Don't allow events to be referenced ? i.e. make event_clone() the default
> >   behavior ?
> >
> 
> God no, that would be wasteful.
> 
> > - Don't allow read_edge_event() to be called twice for a buffer ? that will be
> >   inefficient though.
> >
> 
> Not good either.

As I expected for both of them :)

> > - Somehow guarantee that reference to all the events are dropped before issuing
> >   read_edge_event() again, else make it fail ? I am not sure how straight
> >   forward that can be though.
> 
> In C++ the preferred way is to do buffer.get_event(0) which will
> return a constant reference. If you store that reference as const
> edge_event& ev = buffer.get_event(0) and reuse it after rereading into
> that buffer and the program crashes - that's on you. In most cases you
> should just do buffer.get_event(0).line_offset() etc. If you do:
> 
> edge_event event = buffer.get_event(0);
> 
> You'll copy the event and it will survive the overwriting of the buffer.

Right, same happens here.

> I'm a Rust beginner but my understanding is that the whole idea of the
> language design is to *not* allow a situation where the program can
> crash. It should be detected at build-time. We must not rely on
> "contracts" defined by documentation.

If everything was written in Rust, then this problem won't occur for sure. But
in this case part of the code is available via FFI (foreign function interface)
and they guarantees are a bit limited there and depend on what the FFI
guarantees.

> Is there a way to invalidate a reference in Rust? Have a small (cheap)
> object in the buffer which the event references and which would get
> dropped when reading into the buffer?

I am not sure. There are locks, but then they have a cost.

Miguel, any suggestions ?

Bartosz, just as an FYI I am out on vacation until end of next week and won't
have access to a workstation. I can still reply via Gmail (html) from my phone
though.

-- 
viresh
