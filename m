Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9DC637BB1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 15:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiKXOql (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 09:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiKXOqk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 09:46:40 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177F8F41A1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:46:39 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id b73so2044704yba.4
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3s17i79Ve6r+tRIi+mNbEIOEiUA9iI9GQi6nDnSp3P8=;
        b=pETj17R/zey2tTr7t5nAPIo72MR1flEjjp2gP/Y6pebJaXEG22tdP1+4kDbmh2KDk2
         FBH4h5nTSFmd8yEFtQg5TrWEKGyEngRFbVp9CkFv/emN1pFy48kTegdm4HLRVvVsX4wX
         TAsVvfKNf8GFJQtiyHTEAV9ana8gTNVTXc/g+PuNXutMe46Hwwna0VyCSYSZK0vXQ5lN
         mPaGop/GXCi2qAuuEnQNS4iMNWp6Ue7/VvsyxemcAiTBZDzlosKt64bGoOEf61uaQOPc
         6Rl9dqh7L7nq2XFAsr/wPJRQ+6sO67QgvF2Uu3z1sbJnAVeDBygjbMjzfPvK1Ersn8fJ
         U7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3s17i79Ve6r+tRIi+mNbEIOEiUA9iI9GQi6nDnSp3P8=;
        b=JHTveenm+fjiVzH9Xaytxtb+ar1Q7i94QZZ5g49OPEruUXDnnEZP4QvnbShj4a5cik
         tvHJTlbGP3NHtHWwEiF+Ef3stTJ3sZc7JRH1o3B5huXEy6iOFVoz925ZBin1vDxIARTB
         K2WC7UB335c9xDo4KN/BW4vG10wCLvhjd9hqCazWgW5+MQZKx8R3QB3m+RXYvw2fSLW5
         s3mvbaEzEVYnQnX91kQwWx+XTHXEND3SKlaRiUNxV10Mv8ofdRZENYJ0E0hiSEmEvI8H
         9Xwhu2Bgc7cnHojWssCNmTBEhkeuvuNtJTAkYDMB2sSjKYxEeYILJOc7d5C9Awvlb+nF
         dJIw==
X-Gm-Message-State: ANoB5pmXLSKatANXRXUO0ImZ/NuMhcdQ72ewmbky0ICPuZHUFcp07eKT
        NArmFM63OJS9+vYqR2afj6EKeBUlndPQOKtRVu+mNZn7Mo3cHQ==
X-Google-Smtp-Source: AA0mqf6DnbTsoMsALQAlm28NaWe5ZSPnYmpxIHtAhj1KJAaM8lRh+oFM7bfGek4Fy7g//njpHtZXNK02bDQ2d1CUTZc=
X-Received: by 2002:a25:bd4a:0:b0:6e4:c63f:ea6d with SMTP id
 p10-20020a25bd4a000000b006e4c63fea6dmr20460571ybm.323.1669301198285; Thu, 24
 Nov 2022 06:46:38 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7> <Y39yackN2u7q2Fxs@sol>
In-Reply-To: <Y39yackN2u7q2Fxs@sol>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 24 Nov 2022 15:46:27 +0100
Message-ID: <CANiq72=ufe1eGRVAcHcn9TZiMx2-HC-QQPZMbss5ErSdcpMyBA@mail.gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

On Thu, Nov 24, 2022 at 2:32 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> I don't see this as a problem for generics.  Whether the enum is signed
> or unsigned doesn't need to affect the Error variant, much less the whole
> Error type.  The Error doesn't need to respresent the type of the source
> of the error, it needs to represent the type required to convey
> information to the user.
> Just accepting that the InvalidEnumValue variant expects i32, and casting
> from u32 if necessary, seems appropriate to me.  Unless there are some
> extreme values you are concerned about - but then you always switch it
> up to  i64 ;-).

Yeah, I am not sure what a generic `Error` buys us here.

If one really wants to preserve whether it is signed or not, that is
only two possibilities, not an open set of them. Moreover, I imagine
one wants to constraint them for users, rather than let users provide
the type `E`.

Thus one could have a sum type with 2 variants like
`InvalidEnumValue(..., Either<i32, u32>)` or something more explicit.

But that is assuming there is a need to preserve it. What is the
variant meant to be used for by users? e.g. if it is just for
reporting, it probably doesn't matter. Actually, does the user even
need the number? Could `InvalidArguments` be enough?

Looking at it a bit more, I am confused why the error is possible to
begin with. There is `Value::new()` which appears to be public and can
return `InvalidEnumValue`, but why should it be used by users? They
should create the `enum` directly, no? And for the other `new()`s that
also return `InvalidEnumValue`s, I see they are `pub(crate)`. That is
what I would expect, but still, why is the error a possibility to
begin with?

For instance, somewhere else the library does `Direction::new(...)`
with a value from the C side. The values from the C side must be
correct, i.e. it is a bug otherwise, right? Thus one can trust them,
or assert them, or if one wants to avoid panics for something that is
a bug, one could return a `InternalLibraryError` with no extra
information, because there is really not much users can do with the
error details apart from knowing there is a bug in either the Rust or
the C side.

I have taken a quick look at the C++ side for that same case, and from
a quick look, C++ appears to throw if the mappings are wrong, so it
sounds to me like you can similarly assert the validity in Rust and
remove the `InvalidEnumValue` variant altogether.

Cheers,
Miguel
