Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8432636916
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 19:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239381AbiKWShz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 13:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239349AbiKWShw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 13:37:52 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012AD1DF3E
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 10:37:50 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id x24so584001uaf.4
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dNVOUKDfXIHqmPEBZgHZImuV67zdytaAOf4eX2rE6fg=;
        b=I+h4FgHigtv166FyGWvEr7wndUetYWDy8j656tmnoDgxA6oeL+SU8PzMwfaRG3KYNr
         ZrKAwZNL9ZJiAO4PxDJPij5/LzKsomzEVCLFFvAmjyzAMae3ze1JaqGvlGvtlq/dqWA6
         98zEDB841L3WbRVDlVdKQt62EPVHsqLUywolTEQ1f5Zp45XHAXLZCnrE9WcXwBKEEb11
         W19MTxporKFg0suzzLOpbfu5HOKZR0IueQ57vSc6j1jl4buozAzqUD6sH9fXE3PCZdCD
         R7E5ArUS2VrYzCpPCVjXaplYZ4mxqz0o6O19N6c8ZQrXFy57vEOrR09BMM8aCTkpZsvq
         4Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNVOUKDfXIHqmPEBZgHZImuV67zdytaAOf4eX2rE6fg=;
        b=ytdD0AuYCcQr82dTevFvQrAO04Dfnzd+TJvLByYSstCFM9NAjfkrcyVwySlaXoJAz9
         VuGRnZHlOJjKr07aX7fa6/jX0Ex1vrCJG8bTOK+ylsXGRo0ywq4k65kf1UtArab56tTN
         rY2/FvZnERnJTfzHH0ikyHVij7zNaSsrpNgBUOiaeKBiltmkIywp1uz8D33avSwApeQB
         Cn879+2N3BxqVbFH3r01/NzdvB6TR6Tm60fXwJowL13qHzBIoJP8boo/LNBAyiQGTA1Z
         BUFpPItugmQThC1RsedWJbIvwUEPhRqdpEzquVM9Xpv7lYTHDTAyIWEWpYo9tc/ErvqX
         Ypkw==
X-Gm-Message-State: ANoB5pn10PZy4Mm6u562yjgwFQ6m5O0zHypfGtSAaohhR3vCXJPXN2HK
        kcG/wQKOTpST9ngA8aQLjQhhFY7uORsxyy6WBQ8snA==
X-Google-Smtp-Source: AA0mqf61Yq2QzAguwxf1GJLHadt6ybwwH/XnEdxyN357YOPtRtO3ea4rn441tBJqC2zFMoWRscxvpjBnQ7P2Oetvfo4=
X-Received: by 2002:ab0:5a6e:0:b0:415:715c:1e70 with SMTP id
 m43-20020ab05a6e000000b00415715c1e70mr8850742uad.81.1669228670098; Wed, 23
 Nov 2022 10:37:50 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com> <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 23 Nov 2022 19:37:39 +0100
Message-ID: <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 8:08 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Nov 22, 2022 at 5:55 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Nov 22, 2022 at 4:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > ---
> > > The expression that defines the value of an enumeration constant shall
> > > be an integer constant expression that has a value representable as an
> > > int.
> > > ---
> > >
> > > and virtually all compilers store enum variables as signed integers,
> >
> > I don't think this is true. Both GCC and Clang seem to pick an
> > unsigned one if possible (for the enum, not the constants), e.g.
> > https://godbolt.org/z/6zjzMdP3T. I assume bindgen is using the one
> > decided by clang.
> >
> > Note that the quote of the standard is a constraint, i.e. the values
> > of the constants need to fit in an `int` (and the compiler is required
> > to issue a diagnostic if they don't, under `-Wpedantic` in GCC/Clang).
> >
> > > As enums are naturally signed integers in the C world - can we somehow
> > > make bindgen default to c_int for all enum types?
> >
> > This would be https://github.com/rust-lang/rust-bindgen/issues/1966,
> > where it has been suggested as an option (as well as the fact that the
> > constants are not being generated as `c_int`).
> >
>
> IIUC this is not done yet.
>
> Viresh' code makes the assumption that all Enums are unsigned
> integers. This would be easy to just convert to signed ints but having
> both types supported seems impossible. For instance there's the
> InvalidEnumValue error that takes an u32. There are more instances
> where the enum's type matters.
>
> What should I do in this case to accommodate two types for enums? I'm
> bad at rust so I don't even know. In C++ I'd probably use templates if
> I had this problem. So generics?
>
> Bart

Viresh,

Could you take a look at https://github.com/brgl/libgpiod-private?
There's a branch called topic/further-libgpiod-v2-updates. Can you
check out commit 5a4e08d546a8ec32757e6c9cc59d7a16939721ea and tell me
how you'd make rust bindings work with it because I'm out of ideas
(and my comfort zone)?

Thanks in advance,
Bartosz
