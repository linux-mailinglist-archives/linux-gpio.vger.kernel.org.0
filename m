Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71E8D5EE39F
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 19:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234254AbiI1RzN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 13:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234762AbiI1Ryq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 13:54:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685EE10039F
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 10:54:17 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id iv17so8991181wmb.4
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QLnqCNrdkrN+F2FOjxqA+Okyc0NN3uVigCxct92mU/0=;
        b=5EPmCXROsEl/can+mvrAhLARO1VUVjgESzDFoHuvkPZscJxvjXrqyPw0zAex4cY/Py
         z5pA0Eg3WQJjvKItkmlYfa1R49ggArUbo3vF6HrdN6Aqo5Ace0iToW6/GLW+naXGwmmK
         mnIavam8iPcQip0fL3izIyFyvsQRoXmCNa+AXn0lxu5PViR0Uckc//Vtqpi+SpG/VExo
         aYx2ysKnp9hl5G2/uSS/cYHs2Pm/4KB2Eubc3VwnbMAm5ZH7qjP0BckGvExgJ71i99K2
         b7ZNN4mmZ/RYCiO7kzedCkEjsznZwQg/FjD9MoODW1+xy9HSqjolLQwZ5d7kxYhsXJyN
         wKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QLnqCNrdkrN+F2FOjxqA+Okyc0NN3uVigCxct92mU/0=;
        b=out0HAVey0m8UnXjrsloY7AetiMcT0ViBzV7orIegZNOjtIIQ78PmZCfPqoqlf6g0H
         m9hsTndxGt6kRxagoNQqagz5mU81txydilMSDFm8a1a1FPN2IVJQCAxz4bB49aJaDafQ
         mnSpH+P0r00S7qqeyfLlu0NIrJGdHnVwT/nJj8ks7/SX35IWJOk2vZXUOE0DXmVVu3e/
         S6ovam3LbYZ7gsQxDu/3fey/m6D/Kbp2Sd+rXm4lwDRWyYjIZUg8Z4fUyncWNkrOa0f7
         klqvShU9BWCIKQYgNkdjJZQYWLqk/9mElFzjnDUh8L5OG7d7dlNRLvYKWHgPmQr/mXz6
         hK8w==
X-Gm-Message-State: ACrzQf3+ghCiFzQCm2NGnfvpGXjLYR61RRzlZfbeSCZU+NCTaEHM+heP
        /sWUU1RLwUZKtb47KssblduSz/6Qy6xeJQGr50Rbomszpxs=
X-Google-Smtp-Source: AMsMyM7OQz0GkmPpX0DQFk7u73FswPIaIA/CfJrGqWpiESMqIFPs4gndJdNFZYHHVek7vu0tDaDF+WEWAoc03Ntddtg=
X-Received: by 2002:a05:600c:b42:b0:3b4:7580:a995 with SMTP id
 k2-20020a05600c0b4200b003b47580a995mr8000436wmr.30.1664387656355; Wed, 28 Sep
 2022 10:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7> <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
In-Reply-To: <20220928151716.3hhbcrjwskvwvajh@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Sep 2022 19:54:05 +0200
Message-ID: <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 28, 2022 at 5:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 28-09-22, 14:20, Bartosz Golaszewski wrote:
> > Ok, so this is not correct. The doc for
> > gpiod_edge_event_buffer_get_event() says:
> >
> >  * @return Pointer to an event stored in the buffer. The lifetime of the
> >  *   event is tied to the buffer object. Users must not free the event
> >  *   returned by this function.
> >
> > We make no guarantees that the address returned by
> > gpiod_edge_event_buffer_get_event() will still be valid after a call
> > to gpiod_line_request_read_edge_event(). In fact the doc for the
> > latter says:
> >
> >  * @note Any exising events in the buffer are overwritten.  This is not an
> >  *       append operation.
> >
> > So we're being clear that after a call to
> > gpiod_line_request_read_edge_event(), all previously returned edge
> > event pointers are invalid unless the objects to which they point were
> > explicitly copied.
> >
> > Current implementation does indeed work like what you describe but
> > that behavior is not "contractually" guaranteed and can change even
> > between minor releases.
> >
> > In C++ if you do:
> >
> > const edge_event& ev = buffer.get_event(0);
> > request.read_edge_event(buffer);
> > std::cout << ev << std::endl;
> >
> > You risk a segfault.
> >
> > My understanding is that Rust should not allow a crash in this
> > situation by design.
>
> Hmm, so what exactly do we want to do here then ?
>
> - Don't allow events to be referenced ? i.e. make event_clone() the default
>   behavior ?
>

God no, that would be wasteful.

> - Don't allow read_edge_event() to be called twice for a buffer ? that will be
>   inefficient though.
>

Not good either.

> - Somehow guarantee that reference to all the events are dropped before issuing
>   read_edge_event() again, else make it fail ? I am not sure how straight
>   forward that can be though.

In C++ the preferred way is to do buffer.get_event(0) which will
return a constant reference. If you store that reference as const
edge_event& ev = buffer.get_event(0) and reuse it after rereading into
that buffer and the program crashes - that's on you. In most cases you
should just do buffer.get_event(0).line_offset() etc. If you do:

edge_event event = buffer.get_event(0);

You'll copy the event and it will survive the overwriting of the buffer.

I'm a Rust beginner but my understanding is that the whole idea of the
language design is to *not* allow a situation where the program can
crash. It should be detected at build-time. We must not rely on
"contracts" defined by documentation.

Is there a way to invalidate a reference in Rust? Have a small (cheap)
object in the buffer which the event references and which would get
dropped when reading into the buffer?

Bart
