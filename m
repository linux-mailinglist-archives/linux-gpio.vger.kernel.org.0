Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9681957675C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jul 2022 21:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbiGOT1N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jul 2022 15:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbiGOT1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jul 2022 15:27:12 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FA047BAA
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jul 2022 12:27:11 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id y12so3010385ilq.10
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jul 2022 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=idHHjkJiq1jgqeWJ6bJ8JIRJnzSMmFStTGMvG94gimU=;
        b=OBR95hb5VyYl3T47MmXFtq5gGnyHDeZkC4EtxGXqI1i++mzV2ns8IlbYaRVJyB8xtK
         TQvba9i874GY3zbP66eqRK+fI4tzy8dFyLwFpq6nuzynwqSSDaX7rnb8a9mW/QqQp40s
         2uClNila+qqnD61KGugtKe8d9WSvTh/bNHBgTTRdLWzBFxN68iGrB3V1G8C5lNCrjQvt
         L7xfoowqyUxJ1m6T/wyRhZclvSkM61Em6spRlEZ4dvv43Rhobt0Snp4cZ948/gjImTo7
         b+ZHT0RFQ2LbW7piH81Ym1xyv49RPqqht6EeRhog41iJqPq5qGXjVpzSMIFaQfoq7ma8
         R34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idHHjkJiq1jgqeWJ6bJ8JIRJnzSMmFStTGMvG94gimU=;
        b=eZ4DCNomJDOeWIqfe2VReVn9PGmosESZDi0qJIvHsGGxtO9FlGWQh5KMZjn98frNzc
         GVFjUhpsraAA5MplFgGC0aVKT4xH/fvFxxI88mLIeS07uK1+tKm2hdBR1yUQVgznS9bL
         i09DnWywMgGomEj3yyTUIEKD3o43xg7VD3vF1ukjeXEg+MjeyYEFvEGtXwsjxfwBAh+G
         KILul3tn/aXtIzFei9VlmZ1mGgRBaBv/IhsEQV/fp9jznCpZG1rYzuZ4RmKsI6vaNW9R
         2N45vVBg7Wi1CD5US8mfAFXmAtGSPFvliQMf3MOuq+ohhLqyRvBstp26y0aEQVOCoYqj
         Y2Bw==
X-Gm-Message-State: AJIora+hvjLtBH090hx0n6so/fF6ut7rLz4o8zXlyayXzr6NSNHQ1zeJ
        LMBScXoPpQyc0Z2wFNl1EYGnOm+KgEiZR+ihMmyjInOx9H52M2n4
X-Google-Smtp-Source: AGRyM1sQLXIpBOoshkKU3MmhKo3CrLZohI5ILc4PyjwDKuUpMwcIg7fVWNaqIX/k4lJ24LH9hbKTrXvsVx1PJMMO2IA=
X-Received: by 2002:a92:c54e:0:b0:2dc:83a7:169e with SMTP id
 a14-20020a92c54e000000b002dc83a7169emr8127765ilj.72.1657913231448; Fri, 15
 Jul 2022 12:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657279685.git.viresh.kumar@linaro.org> <CAMRc=MdLJ_uM_Dy=L5nb-5HVhMFcixaVpD3WQvrDgp8s2bUW9w@mail.gmail.com>
 <CANiq72mZM1OYb27z63aEtzNJ+7WuzL+EwBqqoj5xBeTfd1LT9w@mail.gmail.com>
In-Reply-To: <CANiq72mZM1OYb27z63aEtzNJ+7WuzL+EwBqqoj5xBeTfd1LT9w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 15 Jul 2022 21:27:00 +0200
Message-ID: <CANiq72=sKvuaFeOpOwfcafeq81YG7paALPv3rU6=sO__O4zycA@mail.gmail.com>
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

On Fri, Jul 15, 2022 at 9:17 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> If by "random script" you mean the rustup installer, you can always
> download rustup on its own, or even directly a Rust "standalone
> installer", which are signed and do not require rustup, from:
>
>     https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
>
> However, since it appears that you have rustup installed, maybe you
> don't mean that. In any case, if rustup is installed, maybe you can
> try something like:
>
>     rustup default stable
>
> or similar to install a toolchain.

Having said that, if building as a normal user is OK (should be), then
you maybe can simply run the test binary as root (building it with
something like `cargo --no-run` as a normal user).

Cheers,
Miguel
