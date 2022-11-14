Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B034A627A00
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 11:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236333AbiKNKGD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 05:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236291AbiKNKF1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 05:05:27 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6043BBB
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:04:40 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id 140so9061411pfz.6
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fpsl8vT9oW57ySDtkBiUZLCaSUkG3b9S7hFHNdCVj3E=;
        b=xKPbJijJx0795zn6uKnRJrjZX1pV4+/CRJgJwnEYhGxqHlWE28gww33lobl+7IyDsE
         6quExDlOWh7ycABK7Goz5YyzaJAE4U45P/EJtVEa5AEtWUZyPZirUpYO4y3yF1rPgyx4
         3TCLwGw6xTc1Y94D8wPUX1Xi0szH8UbAY3Yk0eK17m0K3M/C/tLF5MTpXRZd5qjAS7/e
         2YeVOGjYg+I0DKgaf2iZkzYnN88ROf5MW3GfH1PkMH8GGRPZxKGJ+AVcha67imnfOh72
         knUEuPL3SWVqqIrJWQspECxw5fZYrhx6bnh0LZxk90+w66vUrh3dr/+ztREMX70juxKO
         DQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpsl8vT9oW57ySDtkBiUZLCaSUkG3b9S7hFHNdCVj3E=;
        b=beGsTFh7ZJzO27heJXILD/wu4JQi8QUhC5jHzxWcShB/YoDXZ7vJvpi2wzvG5YvTH/
         kZFCziCc10wpaNawwuHLXzmj893PnuQPey+z1YfvtMkx5jFNIHeEPfuKvmtz5s6vSwK3
         5mHlxwZZNBzcU48BA+e3kfLu4JgqnKZUDfU2WQ0V17RbHv+k5NKPSk7BRsEvAA2GUvvd
         wEEHFyqgbulvEMmWHthUXlvJfwDV6pJNk+SZtg3IQ7E9gTFh6I43BZIUBWxRDqTlN5oX
         CXrTMld4orZz9ZwhD0w1K2OJBJ0M4hiwINXt/AalfNxkhEdmsggvnv5792MvwTeRDY0r
         KHUA==
X-Gm-Message-State: ANoB5plRYPHyZK1Duigy2hs73LVHblYOgjqLnYGdc7uskkn8EltDJ2nc
        19MxNC26Nsj2Gvjexm8MuPUuUw==
X-Google-Smtp-Source: AA0mqf4oWsJwTVQ95S2XbeHDxfohSEA4yRxb+3GQ0ef8sV8OcCcjDFbDG/LxHppPs5hSDgyUMnZvsw==
X-Received: by 2002:a63:4a64:0:b0:430:3d93:8c57 with SMTP id j36-20020a634a64000000b004303d938c57mr11246888pgl.397.1668420279925;
        Mon, 14 Nov 2022 02:04:39 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902680500b001785a72d285sm6951507plk.48.2022.11.14.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 02:04:38 -0800 (PST)
Date:   Mon, 14 Nov 2022 15:34:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 1/8] bindings: rust: Add libgpiod-sys rust
 crate
Message-ID: <20221114100435.djn6sskgjvkrrl6x@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <2a943ded955e634fc76022dd3bccdb0e8f8b4313.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=MdiNPK2jatPLy6vcN-uVgzRjk-3KJFcbpWnXQik85FBwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdiNPK2jatPLy6vcN-uVgzRjk-3KJFcbpWnXQik85FBwA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09-11-22, 10:07, Bartosz Golaszewski wrote:
> On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > This adds libgpiod-sys rust crate, which provides FFI (foreign function
> > interface) bindings for libgpiod APIs.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  .gitignore                            |  5 ++++
> >  bindings/rust/Cargo.toml              |  5 ++++
> >  bindings/rust/libgpiod-sys/Cargo.toml | 20 +++++++++++++
> >  bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
> >  bindings/rust/libgpiod-sys/src/lib.rs | 13 +++++++++
> >  5 files changed, 84 insertions(+)
> >  create mode 100644 bindings/rust/Cargo.toml
> >  create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
> >  create mode 100644 bindings/rust/libgpiod-sys/build.rs
> >  create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
> >
> > diff --git a/.gitignore b/.gitignore
> > index 6c08415b390d..9f2fcf440c5d 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -35,3 +35,8 @@ stamp-h1
> >  # profiling
> >  *.gcda
> >  *.gcno
> > +
> > +# Added by cargo
> > +
> > +target
> > +Cargo.lock
> 
> This should be put into bindings/rust/.gitignore

Should I resend the series with this one change ? Or just an incremental fix is
enough ?

-- 
viresh
