Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B577BF362
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 08:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442267AbjJJG4K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 02:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442233AbjJJG4J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 02:56:09 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FF199
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 23:56:06 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-49e035bdca7so1339718e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 23:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696920966; x=1697525766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1RSKToCjPJC5jzicUqwtAy2uwufMAcUfSP0hcJg1ls=;
        b=FrtsCuYkMO3/vVF1vCFKQDbmk7LM9LyUA/Z6yUY3o9Bc7OMpg2XYQjRi4DcYQI9kek
         ravSY5n+doRm7Q0hFejoYBSJR6vo4FqWfluxfwn7mKAVwsCqeXExppsKWYHhcT4M9cnO
         2nde0xkKdwlXpXAm1YEU9FXZmRyNb1HkP+JZgUzqobNBeVZrYXaRvxXg6nxYiBwnzZYl
         7JFpvn12j/ceVDs3P4bH9G8ByOx/pMH689XNvv2nJxHydgV/P3Ts5Zt0QvwUUnbDqKHr
         kCzrjXhDOK686SaMQTb7r8Uag7YfrGAjWNslCoL6L0e7hPmiV4QL29Meg9mIEklgj4Um
         Eh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696920966; x=1697525766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1RSKToCjPJC5jzicUqwtAy2uwufMAcUfSP0hcJg1ls=;
        b=rhlIV/ZqcPHRM4k8vZ3v8dGjokmuQpq4jUIlSBRwcyEH8B2x6F1AyGO07OEA63FPf6
         8tXofs9RNwd6rGUhCrXIZi2bVg1xpmLmlm7+ZQXxEOtVvnVdxCfGO4luuiCaS8dngzR3
         eiddy+7N0MdOjBCFEdFW1Bie4TRMFZfPQOSq8RRsMZFDUmww9ltn33VG67edWfW4FcfV
         FjbPfVSqCs6eMMnNklP2RLZ7oYVqc6pscZvwxAB1LOyPzHIbJU4X1APN9ZAoITvvc2H3
         tNdKr5i2Qgk0lSAnLamugLjP+bgki4DypwmiWIpj44pTr4EE7PUnjyapw/mKXEHdn+qE
         pS9A==
X-Gm-Message-State: AOJu0YyVvvpVFNGW1F8eHB8KadvhRMwbPXob7KFTKnp9Auu/kayFzbh1
        Kyjrp4AoeVFj7cMrK963uu6kWpN8vo7diJyO8l7ZIg==
X-Google-Smtp-Source: AGHT+IEuZ7pjMNCUe89o4s8qlKRnxkzLKdzemokmfFPbEKUF6G5jS0h3OYF41D4TAsmkSkAuO8TWZ6pP80PiOFr4Vf8=
X-Received: by 2002:a1f:ec43:0:b0:49d:fab:fa42 with SMTP id
 k64-20020a1fec43000000b0049d0fabfa42mr13663173vkh.1.1696920965898; Mon, 09
 Oct 2023 23:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
 <CAMRc=MdD5SOmPM6JgagPbkbNJHn+kHqtzu_iGjQPm-K2kFCEfA@mail.gmail.com>
 <CW3VO38FC7ML.380UJEH9HNQU8@ablu-work> <CAMRc=MfDXtDPmqKneL_XfXrJj-g7oBG=9UMZTqR3oZC0pRiQmw@mail.gmail.com>
 <CW3Z0GR143R8.363IQKC787V0W@ablu-work> <CAMRc=McUJ+4gJNGJ=UfBJk980BQ3Swk=kE7rjrfoKJP_0MimGg@mail.gmail.com>
 <29nnq.9lre8l3k31x@linaro.org> <CW40ER5HT93Q.83CW582AJP9C@ablu-work>
In-Reply-To: <CW40ER5HT93Q.83CW582AJP9C@ablu-work>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Oct 2023 08:55:54 +0200
Message-ID: <CAMRc=MdZdwv2fmNBCGyeYBO0CaAONwtM3ROKNoyCv2EjvpFh9Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] bindings: rust: feature gate unreleased features
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Phil Howard <phil@gadgetoid.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 5:21=E2=80=AFPM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> On Mon Oct 9, 2023 at 4:39 PM CEST, Manos Pitsidianakis wrote:
> > On Mon, 09 Oct 2023 17:32, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >I'm Cc'ing Phil Howard who's the developer behind the Python bindings
> > >work.
>
> Hi!
>
> > >
> > >In Phil's WiP branch[1] that should soon be posted to this list the
> > >autotools flow is entirely omitted and building of the libgpiod C
> > >sources happens in setup.py directly. Can cargo compile C sources like
> > >that?
> >
> > The rust compiler team maintains a library for that:
> >
> > https://crates.io/crates/cc
> >
> > You can find examples of it in use in many popular rust crates, like
> > when building the openssl crate https://docs.rs/openssl/latest/openssl/
> > with the `vendored` feature, it uses the following build-time dependenc=
y
> > to build the static librarie:
> >
> > https://github.com/alexcrichton/openssl-src-rs/tree/main
> >
> > There is no general need to put the vendoring code in a build-time
> > dependency by the way, it can be done in in the bindings crate's
> > build.rs as well.
>
> Right. One can use cc, there also seems to be a somewhat popular crate
> that allows calling autotools: https://crates.io/crates/autotools.
>
> That said. I am not sure if I like listing all the sources and defining
> the build process manually again. It feels like we duplicate what the
> existing build system already does for us and no longer have a single
> source of truth...
>
> Taking a look at the openssl build code [1] I also see all the target
> and environment specific hacks that I feared about... I guess it won't
> be as bad for libgpiod, but I guess it might be a painful way to figure
> out whether that is true.
>
> I have seen similar things happening when cmake projects attempted to
> vendor in external dependencies and are not a huge fan of marrying to
> different worlds together like this.
>
> That said. I am completely supportive to the idea of exploring static
> linking for the Rust bindings. I am just sceptical that doing that by
> default will make things more simple for consumers on the long run.
>
> [1] https://github.com/alexcrichton/openssl-src-rs/blob/main/src/lib.rs
>
> >
> > >
> > >I'm not sure how that would work honestly. The stable branches in
> > >libgpiod are per libgpiod minor release. This doesn't map onto rust
> > >releases anymore with decoupled versioning. Maybe rust should get its
> > >own tags in the repo (on the master branch for major and minor
> > >releases) and its own stable branches?
> >
> > In cases Rust crates want to support multiple releases, the usual route
> > is to expose different bindings per release exposed via feature flags.
> >
> > I can't say if that makes sense for libgpiod though, because I'm not
> > familiar that much.
>
> Thats true for attempting to support different versions of the C lib
> (and it is what I suggest in this series). However, the recent release
> became necessary to a bug in the Rust bindings, not in the C lib. So a
> stable branch could still make sense. But hopefully, we would only need
> it increasingly rarely in the future.
>
> Overall I still think what I suggest in this patch + maybe exploring
> optional static linking is the simplest path. I mostly suggested this as
> an alternative since I felt resistance to my suggestion :)
>
> - Erik
>

Fair enough, I applied patch 1/2.

Bart
