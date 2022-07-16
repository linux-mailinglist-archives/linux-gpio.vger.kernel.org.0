Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 840B1576D52
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jul 2022 12:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiGPKoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jul 2022 06:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGPKoL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jul 2022 06:44:11 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7331AF2A
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 03:44:10 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id sz17so12946918ejc.9
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LnoMk/bgI1uqawQ4r6L+u5hT1vSymXI9F3pbkuAoKGQ=;
        b=sI1uQPE4Npnhf6jPnrDrj0YVzZX9xubWKviV7CgnKd2LJL2Cowy0COP3prJZYtaOrg
         3b3uiQFl1I0/R5bP5YApsieTj47jgpahbW/KCg8XENv3IbIDKDazrz0eEM83rfWv7fF5
         u80yrWQFbkT9P++DXfU5wx0NFCr34OPMkT32fC3pChn6J67un3oaa3xmQ/CQtG1NKGlQ
         3vO6O2hAhP3Z/Pp3/+JdKVcmVCsQdEAqu9Q57ZG12KUMOTYzSMlnp/gzb6TbhBxJXoDz
         5AACRelCN1pdfk4I85vW3A7NUpUISnUfEm7A7yVLRkCldteUmQT5jhJzH0Biub8096nZ
         QRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LnoMk/bgI1uqawQ4r6L+u5hT1vSymXI9F3pbkuAoKGQ=;
        b=gczpq+RliAo4xujiMq7jK5iAmTkvwo3YAQwdSDVje90Q9tg2ZR3JIQM7lCCwZMu4Xa
         pg3uKN5ZlET7BWLg5WpLUpbAKXTxNlg7L6M3FXZuMqQtWJ7WOWzb+/3Z4gqFNLgvrDpG
         OkB5gfKQOgPCV+dcn/d2F5N0IkWXnrN/r7Wnwqeegu00bnWXc6dgUWl5ZIh0DpA7w8+Y
         1h8k0AGUvE1XYD2YtfP2SOggH+R4ljPEcksWeM4NamNqjQG3V3pQW4vlJVzS3SvQb9aE
         gTeclLiX80QGMZiLBbWtVVHIJgWecMf1sURUMUIaRvx2e5Gq6UMcIJx1xL0uFVK4bAoQ
         b/3w==
X-Gm-Message-State: AJIora9iE1ZYI8tvhWzLk9CJ8cgJ7ALeaGBEoDMA8rM4fPY4U8yDN+ZE
        kF3S1wlWCJlAudt/onV8EcPoLqnI5OnGn7kE3eG6MQ==
X-Google-Smtp-Source: AGRyM1sY1gXdiOgUk2PLhutQ1w9XlQ8UiDQWm1hqsVfFj90Ek2CH8+WqH+4aOFqc7ZtVGzSJlMv/B+Yk+Dj+CrsOJGY=
X-Received: by 2002:a17:907:2c4a:b0:72b:5b9b:9c50 with SMTP id
 hf10-20020a1709072c4a00b0072b5b9b9c50mr18178924ejc.636.1657968248668; Sat, 16
 Jul 2022 03:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
 <CANiq72mZM1OYb27z63aEtzNJ+7WuzL+EwBqqoj5xBeTfd1LT9w@mail.gmail.com>
 <CANiq72=sKvuaFeOpOwfcafeq81YG7paALPv3rU6=sO__O4zycA@mail.gmail.com> <CANiq72=9ARaKRdszvbfC4fr3BkYQz8r6tjTYzkOr9EsN5xma-A@mail.gmail.com>
In-Reply-To: <CANiq72=9ARaKRdszvbfC4fr3BkYQz8r6tjTYzkOr9EsN5xma-A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 16 Jul 2022 12:43:58 +0200
Message-ID: <CAMRc=MesukZX=byZMJM-nLWXoF86O6M2KdfimPhq823G4+YeTQ@mail.gmail.com>
Subject: Re: [PATCH V4 0/8] libgpiod: Add Rust bindings
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
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

On Sat, Jul 16, 2022 at 11:43 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jul 15, 2022 at 9:27 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > something like `cargo --no-run` as a normal user).
>
> Sorry, that was intended to be `cargo test --no-run` (and the test
> binary will be in `target/debug/deps`). Also note that is only for the
> unit tests, though, not doctests. It can get more involved for those
> if you want to avoid to run Cargo/rustdoc as root.
>
> Hope that helps!
>
> Cheers,
> Miguel

This does seem to build the test-suite but there's no single
executable in target/debug/deps. Instead it seems that every test
section gets its own executable. Does 'cargo test' run them
separately? Or is there a single binary including all of them
somewhere else?

Bart
