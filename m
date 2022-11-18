Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACB662F1A7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 10:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241672AbiKRJpR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 04:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241719AbiKRJo7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 04:44:59 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35048922F0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:42:37 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id y25so1535331ual.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kMpzMjbD5KlceWACIMqfVYm+ASXBB2S9AzzL9F3auM=;
        b=sPtQwG28GbN4bLDKztiJLJ3qag06VbHTEu9MgdJ9wEhCDHPHCoi12Kc/bo1r1Coo3K
         iRlOnK9YUmcV1qPsFRoviuIm7kpCaBtjoyqdIu+ZJUqEEWTvoQ06mImZDWckO4xPgvk0
         670Ytf+4sUGs+JX5oWpw/Xb7szVA0T7rxG/y+pvSRECIrx+5EMuJysjrUi2V0cyJArRA
         3KkXHKkCX7EcetTnIW775ygIBM0d5WZrFWuNa7GoCo7aYNL02mhVRjX8pNJ5nhj86QmI
         O5Ozlvhh1D1oGLPyZSN6HOUzent/0BXJuaQ9ydZe6Gf+NYz2TL2HH0ckMtGSS+wKJ/94
         4ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kMpzMjbD5KlceWACIMqfVYm+ASXBB2S9AzzL9F3auM=;
        b=3YSNzyV/CG8RSmT4uhiBxMUdjuWWUvQsOy/refpMqhhkGA6eRIqHo0ts2lvoPkIqay
         DkzLzzXxXp+IqQOkx8ig6mPmG9f9L4SOQnWRuSEa3OhreSGWqOL79fJ8RQWHv7w9ewO1
         CcZxRCSjNzlm39lpDsBvqF3sezs1E9ob0xl8xF/98c63Vk/CwayqBKDNPEDiXFgk4eOf
         A60eHDoK4rrWiIsPw6/ZYXCldwbfOUwo+qOhzgxAzV1lEon7mcp0DxZmIz0NQNWlimvz
         QnIMyi7fQYYz30PiLDnkb9KqJmSReME/EJDnCWPqICJ28c/IA9BJrv096994PyPDyDmf
         AAkg==
X-Gm-Message-State: ANoB5pk2X1J9JAyPBFINcAlN/EiYGCr3tgQ11jqyXwAV1t54wXVFKdDE
        +x6BBxws1vmre27xc+qYGJ1Oca9FGZw97DiGebA/ZA==
X-Google-Smtp-Source: AA0mqf75T+3ItrjjowWUnfi9ltCo2e1dgORuSyMNgTjVn8dVfIiaaHS1CtFv6s9fQvlYYg3mAyMnarcznVWwBmaRWeo=
X-Received: by 2002:ab0:2559:0:b0:411:5e79:781b with SMTP id
 l25-20020ab02559000000b004115e79781bmr3681416uan.66.1668764556248; Fri, 18
 Nov 2022 01:42:36 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
 <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
 <20221117112517.64fvaynvjwbcqeix@vireshk-i7> <CAMRc=Mdyk4Fx5aKvjKjZSRhsSOq03wiHcMP7=Y2TG4ovWf-+zA@mail.gmail.com>
 <20221118093558.hopbhda6knmoekyt@vireshk-i7> <CAMRc=Mf8c8sen+8_76POGjCzTea-SK-DBPJOdGH7MCvTzWjFPw@mail.gmail.com>
 <20221118094119.s4jeafgf6rn4hxn3@vireshk-i7>
In-Reply-To: <20221118094119.s4jeafgf6rn4hxn3@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Nov 2022 10:42:25 +0100
Message-ID: <CAMRc=MdVi1ZBVQSNqXbZuGgJ4z-sTsozB7X+oFkDkdm+NoaXhg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 10:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-11-22, 10:38, Bartosz Golaszewski wrote:
> > Should be:
> >
> > # SPDX-License-Identifier: CC0-1.0
> > # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> > # SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>
> For all files ? Or just Cargo.toml and README.md files ?
>

All files. We're using unified SPFX-FileCopyrightText instead of custom notices.

Bart
