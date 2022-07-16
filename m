Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC3F576E48
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jul 2022 15:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiGPNrK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jul 2022 09:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiGPNrK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jul 2022 09:47:10 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C451C123
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 06:47:09 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id u20so5863937iob.8
        for <linux-gpio@vger.kernel.org>; Sat, 16 Jul 2022 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vju/B7WgasqAYZaZZzOqK0D8eJg2F2QhyydjhTbUtwo=;
        b=lshX2sfbwAHppgObvjWVgxsSPVpqRzA1RZt3hGSKws8EE40GhPcty4AOSzkLUpA5IS
         VEks29rij+P1as1HMwGIcFMBAlt1jke33Y27X5VMKeTLtUJV3f/5FJGELRoffglFhop9
         qVXDfn1/GpIzlcBO9jGKi8aw1dDewiZWBWYRFFGPJH5r9OQluXxLnQvwXXaIBIk54XWH
         3KcehDTUzpLr8WBoZKdWs8eD7Y5pbYMzYjvUEIoJmVEXkEFY1PXtN9YozX8FEzt5gjKv
         tECJOytRo6WQS1YQF7t1CRgTIP5qs6HBD2+A+JxWhlLFUtgghSPW1TbiK/o+ZovKY63K
         N+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vju/B7WgasqAYZaZZzOqK0D8eJg2F2QhyydjhTbUtwo=;
        b=e2f8NWwbGGAkho6r9TRCfAxLomy40loE+9mc+Ue4hfTPwrWmA7Exzj7leRjuJqI4Zf
         gpBXgAbmXjyrk2ELShBJPQtBudbTpDCZnuwX4YmDjSCm6C8j2o80T+wq9Y5JqE2x9NM4
         oKqap+bZRo7p6r5qOtVqyp7VeRME9VuRrxB4K7kk1fjM7QNm9SyKROvaB7iksdD/ryi7
         /KrN5MQKn5cTJN/fvx3hau83lnwWyWZ5UZtb4WNFGJ4YWZykDgUvh8+REIem/Ya9uSfN
         Q4SIdBj98cYXrnR7LXQ2p6tFPhuCJAsoHYWs7fNonhExuINtxew63gNEbkQCIO/kYEDG
         UFaw==
X-Gm-Message-State: AJIora8p0oNmx7DK9EKUM721PmiCiOaJirFrx7+piLpxvCywWMQKT9Sv
        8qVsLTMzqfhD6E5b45zIaJLkMpNSRvYgQvdso88=
X-Google-Smtp-Source: AGRyM1tZoZxR1E0hqbi2OhpGB/iGN9HxU0Ny/C6XbbyD2ctkC1pYerfyZzw61mcS/xfLLgb65op1L1kmgZB6GJOc1vI=
X-Received: by 2002:a05:6638:4514:b0:33f:45cb:2f35 with SMTP id
 bs20-20020a056638451400b0033f45cb2f35mr10702506jab.256.1657979228872; Sat, 16
 Jul 2022 06:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
 <CANiq72mZM1OYb27z63aEtzNJ+7WuzL+EwBqqoj5xBeTfd1LT9w@mail.gmail.com>
 <CANiq72=sKvuaFeOpOwfcafeq81YG7paALPv3rU6=sO__O4zycA@mail.gmail.com>
 <CANiq72=9ARaKRdszvbfC4fr3BkYQz8r6tjTYzkOr9EsN5xma-A@mail.gmail.com> <CAMRc=MesukZX=byZMJM-nLWXoF86O6M2KdfimPhq823G4+YeTQ@mail.gmail.com>
In-Reply-To: <CAMRc=MesukZX=byZMJM-nLWXoF86O6M2KdfimPhq823G4+YeTQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 16 Jul 2022 15:46:57 +0200
Message-ID: <CANiq72myZ6426m0o6HO7_68UPzLTJyAFQwMf-VtDEMdH_fxg0Q@mail.gmail.com>
Subject: Re: [PATCH V4 0/8] libgpiod: Add Rust bindings
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 16, 2022 at 12:44 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This does seem to build the test-suite but there's no single
> executable in target/debug/deps. Instead it seems that every test
> section gets its own executable. Does 'cargo test' run them
> separately? Or is there a single binary including all of them
> somewhere else?

Yeah, for `tests/` tests it seems to create several binaries. For
`#[test]`s, they are put in a single binary.

Another solution for both of those (from
https://github.com/rust-lang/cargo/issues/5999) is `.cargo/config` (in
the project folder):

    [target.x86_64-unknown-linux-gnu]
    runner = 'sudo -E'

Which indeed seems to work for both `tests/` and `#[test]`s.

However, I don't think that one works for doctests, though (at least I
don't see it executing `rustdoc` with the runner)... But maybe you
don't need privileges for those.

Cheers,
Miguel
