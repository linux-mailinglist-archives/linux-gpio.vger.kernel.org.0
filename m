Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D86B62D858
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbiKQKsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234837AbiKQKs2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:48:28 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA81DE06
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:48:23 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id t85so617681vkb.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LIqaURVRlASi670aFWb3s108I+KazzUiYD+fGlOBdOA=;
        b=2Y6xs1gpOFnii7tZa6tRkC8Yd5UNOxsUTGp+2LS58vEFQO5y7vx3eKf2mJkyHOQNYr
         MFp4is5A2jabI78rJxqvX7isaGplveLrAvSZIyC6D57bxWSYL9c1So7AHDOasaQNjBq4
         zsaclt9o8+WEq4MJJsiskcKhed+i+a36WOIUVVkVhnUsQrStAX6FZRPXz1MoIkUqLU6b
         Z2+2a6mp45KHW28lUeAgilWp88aRzxeF3fvjKUhJ9s3y/R37iPyN0reowDyzywQZTW42
         9Z960SX0Yeo1dtrvm0o5kJO2rrHfQiCv6Lh9wIoq9y7GEe6+/x4qjTDst7BKTK117xBa
         Y89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIqaURVRlASi670aFWb3s108I+KazzUiYD+fGlOBdOA=;
        b=e7vqPKwYVZgDQ886lCF36yTgjF1c2wO1EKe+Zb5FRXWaZ2u3saDK9w2/jRJmXdIb63
         4Jx4BqQH+ylX+TOk5HT27SGpCMreFE0OQH/uihAB+G3LCr2rsv1D8vVYtX6TlO8oHzOG
         G09uQ6SREug5lMkreUte7qg8Y+tVov4L6CBpguiwp+QcjGvBbjUGHp6Tp2wc7/HPNm2M
         WBVfC+R6xpvMri5pwegqbvYeOkzWrtlQKEKpdf023ftIJQb4iIAFxpdP+YGcf+fhgAF2
         zBNQ2XjxvBxjr6Lbox7iLUnO82T3eHwaNRWN2ZN52YPCpA+/2zdx64K7uJpGo7/lzJL2
         HDqQ==
X-Gm-Message-State: ANoB5pkDdAt3kbhf0C2PxJXM9R9UUcbVyA04vH6NBhlqqmT/CrPkWO+H
        +zsPsC/aI/xXsye3581ZcdtA+MFT+l+jbkFn+0nCRQ==
X-Google-Smtp-Source: AA0mqf5zytjHYdJgBUArpEd/SMi5rgA5JLp26wYAXD5mI9cRtbkjsMEo/2U2Jasz1/w4opB+Y/n8lqavWRwoCxS52MA=
X-Received: by 2002:ac5:cbe4:0:b0:3b7:3aca:9868 with SMTP id
 i4-20020ac5cbe4000000b003b73aca9868mr853244vkn.33.1668682103101; Thu, 17 Nov
 2022 02:48:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
 <20221117104006.wvpuenedh7wqsjjj@vireshk-i7>
In-Reply-To: <20221117104006.wvpuenedh7wqsjjj@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 11:48:12 +0100
Message-ID: <CAMRc=Me3NBDicrTenfsZ97+T28QwQL8SfZsM=ECM=i=1sqHr+g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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

On Thu, Nov 17, 2022 at 11:40 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-22, 11:18, Bartosz Golaszewski wrote:
> > Do these problems you faced apply to libgpiod too?
>
> I faced them with libgpiod only :(
>
> > Honestly, putting
> > automatically generated files in the repo just feels wrong.
>
> I agree, but ...
>
> > It defeats
> > the whole purpose of code generation. If we can't reliably regenerate
> > them, then it sounds like a problem with the tools, not the library.
> > Maybe we don't need to worry about that just yet?
>
> it isn't about reliability of the generated code, but making everyone do it,
> even if they don't need to.
>
> Also, the code generated here is Rust code wrappers and other declarations,
> which let us call the C helpers eventually. It can be considered like hand
> written code here, for the argument that it is automatically generated stuff.
> Just that we have a tool (bindgen) here which lets us generate it automatically,
> without introducing bugs.
>
> Anyway, I am fine with whatever you decide.
>

Let me propose a different solution. When preparing release tarballs
with autotools, certain files are generated automatically that go into
the tarball but are never part of the repository. This way developers
don't have to deal with the automatically generated files polluting
the repo while end-users get a tarball with less dependencies and
reproducible results.

It's called the dist-local hook in automake.

Does it sound like something we could use here?

Bart
