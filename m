Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47ED362D51F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 09:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbiKQIhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 03:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239263AbiKQIhb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 03:37:31 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D0542997
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 00:37:30 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id t14so821151vsr.9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 00:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ND63yMvJqYqz6uZWjnkTnhRL0LB6+JTUfMkGU3ZK+zs=;
        b=j7sjvnqYQ5qwf2hTShaCfInHThTLZ8CGDpQBR34vhljnI3ScLhBbJ+LX31E8RI7d7B
         cxNcaMt6oduXIrPj2CgO8Q3DF1F//E57KJ+RrXgYnlxsT/fL1EL2WVkrp//H9AZ3m3Zd
         1cuEG1O50nbJZ9CvCTpie/0qEXNByRc+VohGZohGbbTE3s4LP8IbTW3QSbZfoJwEW0x5
         7+bp+ujA62yA7dtmvI7WFi0t+VBwfvwthbY9nKM5w384cOEKYnMydX8rVyTXyBc0ObCP
         O2l2UreEUoupB/APmslYbwWRHhR6S5l2gKBK/f94GLL4TTHumNMDnTPDxGHa32g2C9y5
         KM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ND63yMvJqYqz6uZWjnkTnhRL0LB6+JTUfMkGU3ZK+zs=;
        b=VVegsDMckv9uHP644QrpGPyQvzfontROdir45a97aOuQgfgxsj96ynca0nMc969U+Y
         rJ4t3YS95BlAS7WwrEswIxatXetasoNK48fK1aKLuUd+Eaec8/Kh+ExoiYG8NFp+d8So
         x0tKrmLDAvqR6Zlhnyiy5kCKeNVdXUGN5UvCxx9rPJ2sc4juj33P8rPeYDfgZOaLT02/
         tsPxT2Em4OAz+HlBzU/gocJsCzy9lgpwLQqsMlYP4brnh9OLEUvspJvJdDPUGn9kMe8u
         eKs3I15dqQd92EFUr3T/3JXeWJCvRza452NeZgx07JBi3cOFtYeE/1QiEOkxigoGHG7Z
         CXxQ==
X-Gm-Message-State: ANoB5pl0Lqru2UhaK53vqlVa25SzWxi43IDli/IvhYORrfxmpz1lgVdt
        S+CAGGbg5grvGdP3Q23RbOlLOd/HnxchE5CdgqOxdw==
X-Google-Smtp-Source: AA0mqf4r1FhXrk/MyJ5niicGE/LjLpv/0pinY+oqXraCCReYLD4oALWmtNEtD3DrHLDb9tHr6WdCoAuNK1Y91ag88OQ=
X-Received: by 2002:a67:fd19:0:b0:398:6504:9ece with SMTP id
 f25-20020a67fd19000000b0039865049ecemr1160959vsr.16.1668674249549; Thu, 17
 Nov 2022 00:37:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <CACRpkdbD0M6WXKR6tmYfkxdTzYB5jFCFf-hqUG8_mm+HgC0=5A@mail.gmail.com>
In-Reply-To: <CACRpkdbD0M6WXKR6tmYfkxdTzYB5jFCFf-hqUG8_mm+HgC0=5A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 09:37:18 +0100
Message-ID: <CAMRc=MdjiecxuK-MDBr7QuY++5dUiun4ve0UK-HyDeJ8uOfK8g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 9:12 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Nov 16, 2022 at 11:29 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > One other thing is the license of the rust bindings themselves - I'm
> > not a lawyer but it seems to me that if you link against LGPL code
> > statically, your code must be licensed under an LGPL-compatible
> > license.
>
> Nope. The LGPL was created exactly for clarifying and avoiding that
> situation.
>
> https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License
>
> It is a common misunderstanding that GPL overall has anything to do
> with whether you link things this or that way, the legal term used is
> "derivative work" and the meaning of that can only be determined in
> court. The meaning can depend on the intent of the author and misc
> legal ramifications.
>
> In many ways LGPL is unnecessary, but it was created exactly to make
> non-legal people less weary about situations relating to linking of
> libraries.
>
> It is fine to link an LGPL statically into whatever software, but one needs
> to provide header files and linkable static objects (.a files) of the library
> to the user.
>
> Yours,
> Linus Walleij

Thanks Linus! Makes perfect sense.

Bart
