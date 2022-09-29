Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3619E5EF6F5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 15:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbiI2Nzz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 09:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235065AbiI2Nzx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 09:55:53 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA48D109600
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 06:55:52 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id 64so934346iov.13
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dJqyDZta+r98pSvbq4xZJeYjWmW9XvLhEwiY9wSbAjI=;
        b=QbqeVjWZpFX22pwCsGPD+W5GuIp7Ix6dU07r9J70H+7mjNNVOFhbYVJXc9y8oxXAQi
         HafYSGGdsPsC0wYa/iIFBllwe5RmLlZ5rU33SwhhV29tzqKg+sHHGW3h4/ajqImtkA35
         WHHg0qwqMuVvT741YDsjPHjEK7vRe5TfTvt7wLFa/JvEVHn70LQpJ4IeXpsxrkHFS2bK
         fM3d5j7WAYKLz4H7oMvRli0ncU09IhdLlI9dA1OTuVt+hoxvFlbx/0pCP2Yd8UErldA9
         TwqBP/sc59/AaODsdT2XMdDQsmBT9gQWn2B/ioJfl3S+SzZrMTxU13om2Qn/RC81LDeu
         SP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dJqyDZta+r98pSvbq4xZJeYjWmW9XvLhEwiY9wSbAjI=;
        b=LX4wKsXDvG93azA3Lij+OCPsR6LIR58IlR6GTYO3hmrnbsKlZdLJyti9BjL49wA0fH
         VNtLvrhW50Z2RDLyu4EoH986h2ioD4JH43u7cWW45jv6fb0nIEmPkBKrRIz13q0ud+BA
         afqWqRUts1x6N39DIJgdU46VgSQ9n2uenN6DUQj0nJJdZwObWp4L3bLqY1zcRAzdYTX+
         0ZG3QBGaQ027zQoK1OicnqZlE9pv8kswuKToAugw9/WXZumCkx3YGQzyE70De8ty+Z1/
         0uNOgLuuC3tJD7bavXFTcTlJdA/Mb4srzFbtXpyoy6zHuSvisT2VfgPTJ1oXL+IjKnUh
         SIVQ==
X-Gm-Message-State: ACrzQf36jPS9ZWAqgduu2PsigJVwy9rYHWzCZar1RH2sJX1IIOrquzNP
        1KPmK5mQSc/6GYw4N21ksU2e3SXDGiW0m0Cq1CgAn3Ijm7nXag==
X-Google-Smtp-Source: AMsMyM4yr4wvwE7cnN8DMcshiuA47OPFfrUUxSGbRwl0OobC5QUU7cWy199wCPNvdILGndyzMmXhfWmp3uEhmvG9Irs=
X-Received: by 2002:a5d:9411:0:b0:6a7:f7ec:6dd8 with SMTP id
 v17-20020a5d9411000000b006a7f7ec6dd8mr464527ion.44.1664459752241; Thu, 29 Sep
 2022 06:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664189248.git.viresh.kumar@linaro.org> <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7> <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7> <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
In-Reply-To: <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 29 Sep 2022 15:55:40 +0200
Message-ID: <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 28, 2022 at 7:54 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> I'm a Rust beginner but my understanding is that the whole idea of the
> language design is to *not* allow a situation where the program can
> crash. It should be detected at build-time. We must not rely on

More precisely, it needs to avoid UB (which is defined similarly as in
C++, and of course UB may lead to a crash if one is lucky).

> Is there a way to invalidate a reference in Rust? Have a small (cheap)
> object in the buffer which the event references and which would get
> dropped when reading into the buffer?

From your C++ example above:

    const edge_event& ev = buffer.get_event(0);
    request.read_edge_event(buffer);
    std::cout << ev << std::endl;

It looks like a container whose elements get invalidated, so
`read_edge_event` could require an exclusive reference to `buffer` in
Rust, that way you cannot keep borrows to its elements like `ev` if
you want to call it. But of course this requires tying the lifetime of
the events to that of the buffer.

Cheers,
Miguel
