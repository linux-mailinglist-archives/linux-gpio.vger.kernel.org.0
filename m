Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47255EDC71
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 14:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiI1MVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 08:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbiI1MVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 08:21:02 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16B8855BB
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 05:20:59 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n10so19468287wrw.12
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=v/p8K7HtaX6JAI3yHVrBzF1uNSv7sOcL+OZjbUD2ia8=;
        b=mnduWAb4b61HqjGzTRCLB1zYtA2v3vHmwAAHRMajriWFbvyjRM5qC4A2PiXno9fUUb
         r4FB8ecJApkcTpRBB1TTKdTgSd0/kJdvJmf19C1eAjaRrawha4PJT1qEN+v48+qIVrCX
         peCSCkUv7uW0SrBAqdlfwq6v8n1KrBBBcypOTIKxybwycYuQzLvskB0SSwxJ1Fbm9dJc
         iEYsZ0BeGdCpF4BSzN6JIWbiOJj8RZ81gbFTSYO2z4VGCK6vvV+lsTPHa3sn3CbQfoZK
         IKLzRAd/G+9/TluEMmHwCjCC6NzeZxEu9DAiR6N4qtSq8Hjk9D5tYwmTb2B74xM+Iq9Y
         t4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=v/p8K7HtaX6JAI3yHVrBzF1uNSv7sOcL+OZjbUD2ia8=;
        b=Z/7r1cu6nXmDQ//p3Q8OyDu9GZPx5T+9NPXtGxPyMxsgYSPlk/Wj1iRxmrxSjySEOe
         vWZyS2FKRjYdW1r4Q40Q7LUWn1wxPvfSapUh4tt96oJ73NO/OjxiUh7V5LSf5kOjXIH/
         FJDqubKl7NVe+wkZq66GH5NTj1EAWAkx+x3yed8tJ9nOFqLhQ+cpYpQxpQ54PP7AN6JN
         ZYfiPRKt5Hok0bH4YqTMpJjj/EtnVxFayFWmbAetpYhgNVLPL52zuauPmO0jvedtOkox
         Ros8EGtxRqCO/5DN7t8xyQzEcRoZkvKO8iQ4704axkHIQKS961rm8yA4xSugi1Mv+pTP
         CfPw==
X-Gm-Message-State: ACrzQf2f58unsxfkjF4YeLoghlhKDcEQqksmbeOodcfZ03c/y3MROQFK
        EdhJaILxOSSpxz5OnEqlvZhL5hJJdHhtD5+tm8ChwPUjdU4DYg==
X-Google-Smtp-Source: AMsMyM6vAAPTrfLS5shHf/0YDqDknAQfBBc1TeK9sdL/4N/yOBQZPEn2y3EmPyrLoZS1FgvSZPAIHmkeQbGAQEzvzug=
X-Received: by 2002:a05:6000:15ce:b0:226:f2ab:516d with SMTP id
 y14-20020a05600015ce00b00226f2ab516dmr20594723wry.264.1664367658002; Wed, 28
 Sep 2022 05:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com> <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
In-Reply-To: <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Sep 2022 14:20:46 +0200
Message-ID: <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
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

On Wed, Sep 28, 2022 at 1:10 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Here is what happens at each call for easier understanding:
>
> On 27-09-22, 17:25, Bartosz Golaszewski wrote:
> > So what happens if I do this:
> >
> > let buf = edge::event::Buffer::new(10)?;
>
> buf1 = gpiod_edge_event_buffer_new()
>
> > let request = chip.request_lines(&rconfig, &lconfig)?;
>
> gpiod_chip_request_lines()
>
> > let count = request.read_edge_events(&buffer)?;
>
> gpiod_line_request_read_edge_event(buf1)
>
> > let event = buffer.event(0);
>
> event1 = gpiod_edge_event_buffer_get_event(buf1, 0)
>
> > let count = request.read_edge_events(&buffer)?;
>
> gpiod_line_request_read_edge_event(buf1)
>
> > println!("line: {}", event.line_offset());
>
> gpiod_edge_event_get_line_offset(event1)
>
>
> We will allocate a single buffer (buf1) and the event (event1) will be a
> reference onto its first event entry in the buffer. It will print offset value
> from the second read_edge_events() here instead of first, as it was just a
> reference to the first event. And for such a use case, the user should do
>
> event = buffer.event(0).event_clone();
>
> --
> viresh

Ok, so this is not correct. The doc for
gpiod_edge_event_buffer_get_event() says:

 * @return Pointer to an event stored in the buffer. The lifetime of the
 *   event is tied to the buffer object. Users must not free the event
 *   returned by this function.

We make no guarantees that the address returned by
gpiod_edge_event_buffer_get_event() will still be valid after a call
to gpiod_line_request_read_edge_event(). In fact the doc for the
latter says:

 * @note Any exising events in the buffer are overwritten.  This is not an
 *       append operation.

So we're being clear that after a call to
gpiod_line_request_read_edge_event(), all previously returned edge
event pointers are invalid unless the objects to which they point were
explicitly copied.

Current implementation does indeed work like what you describe but
that behavior is not "contractually" guaranteed and can change even
between minor releases.

In C++ if you do:

const edge_event& ev = buffer.get_event(0);
request.read_edge_event(buffer);
std::cout << ev << std::endl;

You risk a segfault.

My understanding is that Rust should not allow a crash in this
situation by design.

Bart
