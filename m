Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F97F62D86D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239133AbiKQKvx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239378AbiKQKvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:51:35 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190A4532FB
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:51:21 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id g127so1389905ybg.8
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3QfqankWcdSka1PuNxLdM2DyQ3ZsuO9DyDE2F30dUQk=;
        b=qXpApLHeTbaNe2BGg3tkMR07moo2z4j2oL4iDsjcZJwwXZUBEVK35IjYUfqc3y57c6
         jRITxuUE44E7DE6NkW9mET/2pNN0Rya9llWQPm9CxW7fXur854/C1UX53+6Eekv2yQfP
         HBQAeMfjvyahBfRVlVVg7QscIKtVDq409JoyOdogMcbVIvBlSwVQxR6/jRYpWUupFeCz
         IAK5Yk4k2TQDLZlBQKbiCVZyVV6fR0SgsXU6aM8QHWAkSywkmPtfhNqiOhrPDezsTCc7
         LJVg1lI3NgbNSFC6aY2/vlZqF23naJEIElVomhZ1SJdLhjFpKfJd4z+GpUnUDCSGC6L+
         FDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QfqankWcdSka1PuNxLdM2DyQ3ZsuO9DyDE2F30dUQk=;
        b=xF0IB4ybtFORfSqFdSYpCol3eexEZok7gG913do+c5byTOvzqoFwEXguDV/VhfLUrg
         n4h6e8APJlCIogVOikJeklWkO8mySN/SvFn6y3Rq39eAft9iu7lQMq3m4ln2fn+D/yu7
         USd3GNcfMS2Y0TfsTGhOAgmdFkLXUEI8qwm3piOe9WM1l4vN9dJ7uDZ/EYLeIOlKeYK4
         K/XtE1FCjsT7DetzUCj1pPrFwzaZQPjwezRmyyKrFytRLfH/+dNPs5Zqot2J3qzfCx1W
         o8yl82xkXrOFHNg1OPjq4NarYwfmXtY5Jlyt50uSWaQufdoVtU9bYoxtUlDhCgEjcO6b
         alIQ==
X-Gm-Message-State: ANoB5pln1bPN3coWiQRCL/bwyjzgIAChkzQIoy3OdRkkjpjKaQqEIr0r
        Qb1pizxmDnG1dbMwSwsbOP+PmiukopHmD9dMQN0=
X-Google-Smtp-Source: AA0mqf6Shk/KdIlT4RAvnI9tMpvWLcgS2SDXiLQcHOVhuDFnDFtRMwuMY4sb4uKEth2SdC6Iy2c4Ufta0MuFdcMswqU=
X-Received: by 2002:a25:dbd3:0:b0:6cb:8949:fdbb with SMTP id
 g202-20020a25dbd3000000b006cb8949fdbbmr1521152ybf.328.1668682280332; Thu, 17
 Nov 2022 02:51:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
In-Reply-To: <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 17 Nov 2022 11:51:09 +0100
Message-ID: <CANiq72n70mY4QGW+3uNLaS-f1Y40cR0aZHq37YSt7uZY17SnoA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> On Thu, Nov 17, 2022 at 10:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Do these problems you faced apply to libgpiod too? Honestly, putting
> automatically generated files in the repo just feels wrong. It defeats
> the whole purpose of code generation. If we can't reliably regenerate
> them, then it sounds like a problem with the tools, not the library.
> Maybe we don't need to worry about that just yet?

If the library is stable enough, then removing a heavy build
dependency on bindgen may be worth it. But yeah, by default I would
avoid it unless one is sure it is possible.

Though, if one can store it because it is fixed, at that point one may
take advantage of that and manually write (or tweak) the bindings
instead.

In any case, I would explain the rationale one way or the other in the
commit message or ideally in the `README.MD`.

One thing I may have missed: why is there a `-sys` crate for one of
the bindings but not the other? It may be a good idea to document the
intention as well.

Cheers,
Miguel
