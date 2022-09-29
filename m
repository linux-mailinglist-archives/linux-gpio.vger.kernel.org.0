Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F305EF41D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 13:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbiI2LRR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 07:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234889AbiI2LRM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 07:17:12 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0841513E7F6
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 04:17:11 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id bk15so1628518wrb.13
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 04:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5psvd8uIPHvr1x8pF6LzkcSxElTADKW25AlmbHcPXl4=;
        b=OgcatXoM0HAXeh8RTNP7y7zUfugJLPbduPfcsHx5U97CuzT5zOJsO5Uq7wxQOHHQ/g
         nH5UxL12C9FysYsqbTCEbkWC8FzNLNB8UHtXbl6cwqJhSLINYJniafkRUMpOBh3SuUsh
         o1a99H9thZuxSpyaAe5bpa2tFlnRggZF6AbYPt9YA1qu1a/6P/egkfn7WqiYxULmkl4j
         qIVGMQiD8FEY1JHuGBGYr8KangMzxD+5nzpVt0I7ar2o1yb0D19AyfWo80KSsXmYO1IQ
         sgQjCgXN29cqL1ux3zjeLN/VE9X6pDorbpu7w7TsdhfWcUJHGfq96Jgsaw1S2CTN+8Y0
         IeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5psvd8uIPHvr1x8pF6LzkcSxElTADKW25AlmbHcPXl4=;
        b=6hfV8xlg5FcMfmTopbEiK9h6y78guZE0DD1Yuagl+y//dP0NybICo8/ETPHIw9sLUS
         eDG4bbLO0Ce5BD1feNkkrTcxkV7k+5M1S/ytDDQ/8sroOhO6vb0WxGsfco3WaoiyMPhm
         1BFDJJCZqKXInJxLx1LVl7IyWWeXdnKoVPuthRxJCX4KBB9klQGxKZszIb9QqzNXcuH8
         2mmy8CPAR5i4Bx3Dx4U9spaLBpVF7BtQWDOBW7siJI4DT6e/p2B57DwqSJB+LRSUTHnc
         hOVhLPSTNilGz5C1w/h46qCpbTlKfvkQj5aYWKxoEzcSH6uhg9Y3Nf2A26gSzXrw7m6A
         hsxQ==
X-Gm-Message-State: ACrzQf2EkH1/JUSDl8tt7QJdTRWTtpFc6S+J6xxDTaZxwUoys3gWM2sD
        +55LgDSBukRfSqWivrDXpjlPMQ7JXdol4vGratDU5A==
X-Google-Smtp-Source: AMsMyM44ZeXVFc+1ElAJcbkA+CKeCCttXtBfG9xJLNVLmdK1d8JL0C22Xgn8C4pSifSWW7fFFi1ek8wAOS+s24YGk00=
X-Received: by 2002:a05:6000:15ce:b0:226:f2ab:516d with SMTP id
 y14-20020a05600015ce00b00226f2ab516dmr1877904wry.264.1664450229571; Thu, 29
 Sep 2022 04:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7> <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7> <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <20220929065409.rqilrzxaczvvds4i@vireshk-i7> <CAMRc=McSZWLdPNESPLfDD4UgyvtyU7BcvB-ZZrvDWM3LDYjEMA@mail.gmail.com>
 <CAKohpokyoQ2gE5MHLotj-QZSErKG+Ceq4Gqgq_BKqui9Y8x6TA@mail.gmail.com>
In-Reply-To: <CAKohpokyoQ2gE5MHLotj-QZSErKG+Ceq4Gqgq_BKqui9Y8x6TA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 29 Sep 2022 13:16:58 +0200
Message-ID: <CAMRc=MeV4Ttz5_dn5DkSkehawkJNS=-dEKv3FeAUhtQA6UqPng@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
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

On Thu, Sep 29, 2022 at 10:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On Thu, 29 Sept 2022 at 13:07, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > I'm not talking about locking, this should be left to the user of the module.
>
> Yeah, I get that.
>
> > Can we force-drop an object still referenced by other objects in Rust?
>
> No, AFAICT.
>
> We can call drop(x) on an object, but as long as an reference to
> it is out there, we won't end up calling the actualy drop() routine
> for the object.
>
> > This is what I had in mind - a small, dummy, cheap object inside the
> > buffer that's created when reading into the buffer. Each even would
> > reference it and then Rust would not allow us to drop it as long as
> > there are references to it. Does it make sense? Is that possible?
>
> I don't think so.

Miguel: Could you give us advice on how to proceed with this?

Bart

>
> > Nah, just take the time off and rest. BTW, I'm starting at linaro next week. :)
>
> Excellent, welcome buddy :)
>
> --
> Viresh
