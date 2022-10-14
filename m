Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CE05FEC03
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 11:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiJNJpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 05:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJNJpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 05:45:31 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE732AA345
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:45:30 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id a66so2004318vkc.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 02:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VdrO7mtmH1DUJFW63UXShj5ag8RgWaG1H1XRoRcxtTs=;
        b=sMxDTqBcwK2dgKQ5w/9inhL7fMhTlzLHS90sVSa7GMjeOyg+mgQHfqNgVCerfFR1gw
         3CYGW2raBpTbXs47jCdM0JfcNJqZ8HlfISkErR0on4C53FTbPojNevUGECTtIymIVaYa
         LRoeWfi2sWVzV5yTpQkilg34qS1tAZb8f9uuSa54IEjQRS5A+b6vEs/s85peI5aCZZlj
         PvTXrSB/tmvKxRa1tyZ5Xv74liLMV23Ubk9xWgJG1hYJA2PQrXiysYNYU5BUQeWlmY36
         habGYudhQ0UqL4Ra5G8+u+u+Zc0y1aSFbA78+snZRtNjjfXzVPzxSjShQFxf08OkFlNY
         Jj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdrO7mtmH1DUJFW63UXShj5ag8RgWaG1H1XRoRcxtTs=;
        b=2VQrNl4TWwx0MCsKHruovRXaakS79skpFHH3MRzoMSlXNfhgBgsYrWuW5WXs9S5+YQ
         U79hKAPhFhhdOrAUVRAdfIBQOjMMo/qOevfZJME5jofnEMZUnBMJh4nLp0pAFrio5sWi
         L9oPngudZIyRWfn/7Iyaany5c6oywQciOzNgkKs74DDOliJfVmWxDqwpdmcJ2QkIkTHZ
         W6+lX0zY5brr+mX2uLO1KApF/PFWBba3o2R/JM6UkDd8e4ZA2RoGRsnX7Hn++LCuIDrs
         JO4svjKucdhsYLMGTWFwvYW78E17ZRr1K0hqXqG/daC8JuZN4g7cexd5GAcMy53RuVxH
         OZLA==
X-Gm-Message-State: ACrzQf0SjTmgVr1SXv14i69MbslfX/Hjc0fLQ8KZjRxQbeJcTAtsNFYp
        CLBAkcdwB8axr7/g3PYKiC0cdYZMeuegJfHkHd7oOcRWpJA=
X-Google-Smtp-Source: AMsMyM68twGM7x8UfT+97HqbkocKaOFaTG7GCm/lGpezFjTURb8VMAnqbIQlZJkICu7XoFk9ReaF1rrtzzmfeH/iDJ0=
X-Received: by 2002:a1f:4843:0:b0:3ae:c4a3:d653 with SMTP id
 v64-20020a1f4843000000b003aec4a3d653mr1758316vka.1.1665740729534; Fri, 14 Oct
 2022 02:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
 <20220928111043.bs2ihopdxduavcsq@vireshk-i7> <CAMRc=MfA7SYS2FWZ+HHmqjTe=0EtedncJ5fRLB9CT4NiR0U8SA@mail.gmail.com>
 <20220928151716.3hhbcrjwskvwvajh@vireshk-i7> <CAMRc=McHusz7kK2v-H5Ccdrj1X6M7gTj7oaMuQoyuHhDVXekYw@mail.gmail.com>
 <CANiq72mvLzoNConYzqRYYq9M9Wr6iyo28VQ7Dt0FpfFiHUwzhg@mail.gmail.com>
 <20221011041651.amibtu24kcgm67e7@vireshk-i7> <20221013061204.hu2vn24g42egybbl@vireshk-i7>
In-Reply-To: <20221013061204.hu2vn24g42egybbl@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 14 Oct 2022 11:45:18 +0200
Message-ID: <CAMRc=MfNjCARhhG1yGDKU0HYUmsHkN_MihWy-+pg+SY0T9WERg@mail.gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Thu, Oct 13, 2022 at 8:12 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 11-10-22, 09:46, Viresh Kumar wrote:
> > What about the below code changes on top of V6 ?
> >
> > Changes:
> > - Removed BufferInternal.
> > - Event contains a reference to the Buffer now, with lifetime.
> > - read_edge_event() expects a mutable reference to buffer, to make it
> >   exclusive, i.e. disallow any previous Event references to exist at
> >   compilation itself.
>
> Bartosz, should I send a V7 now with these changes ? I hope everything
> is settled ?
>

Maybe also add chained mutators everywhere? To be able to do
settings.set_direction().set_edge() etc.?

And I would still love a thorough API review from someone who actually
knows rust too. :(

But I will play some more with v7 so do send it.

Bartosz
