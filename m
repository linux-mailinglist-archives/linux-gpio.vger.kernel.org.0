Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141456227A1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiKIJyh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbiKIJyh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:54:37 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A6612AA3
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:54:32 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id r14so26400185edc.7
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1aP0VTR/z9TSjeTnqdlEKv6O490QZs8lFGPB+r0UAx0=;
        b=jIUZv8lTJ+szmB+RsVRFMOTBV88nyQblxTSwvlO66MB3PdtxA4+qOQb4GT8GIZ1ZZR
         8kclpXt0k2vAsZ/XVKxBa08KwJalDEk39kdPw47pIyIR6C/9wcnM5vL1rrBm+JQ9aGX/
         eDsydmFJRNwWvogZEfEgMKmLiVRO8jGvxe8JNO1R38cq/vb0PxzraLEdNQxitU+5+bEh
         +8SC9Pfg7PPNSKctVeEtFWCyiHurePj+OhQ1uNeAPJhPMHZd9u16PBXb9ZMmF2S++s2Q
         qaxnCjiiaRE7yMelGPuZbwyYcLg6RqfnyfOcQNKni6lFmki1oiATvn6IjpeEhdX6Po8D
         9yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aP0VTR/z9TSjeTnqdlEKv6O490QZs8lFGPB+r0UAx0=;
        b=cCzQ3Vy5VLNlp03XRrDHDhZg9RVK/vFN4J9kQAG5ICcKc4sR1ef82R6/ZeqhTsnzuW
         1euAnSHsFk4i9REiwm88SHLKoQCeUs3htZp3bYwmUhbzrnBCG87Jt88kgm998PpnnER6
         oVOrZPEf8JjtErPdA45ia81ANcJJu+I4y7muAMHi7Naz/K+OteEq27CbMrFDKdzyVQax
         Qrdq2PDNHx6X57/qsjC6ixDcVaizImVmfG+mb/cCs7vsLD14ArZcIrwnDv88+1M3N9A2
         4118BjQBhE6Tue2NsaAj9K/xXyt63vTvZXjWseDJA9HJhO/fVEnr3N3z3s5ryw1WPifF
         FeRA==
X-Gm-Message-State: ACrzQf1y+deAwxtoIV4RMKbEJJ3E1rs9mo9EKzy24jSQHQUrE/s06bhF
        P5NdRkyE4T9ujAL+6ppVbD+kic63ZWBDyCQ1ZpZ7oQ==
X-Google-Smtp-Source: AMsMyM4IgcVFIVNoE5vWeZCHmy+v44JC0kPvNvuvOBW6xmHiX7i5BGi8g6VdJbiiU7c893Tsb7FyHcwy28SMOUgG+G8=
X-Received: by 2002:aa7:d6d1:0:b0:463:ba50:e574 with SMTP id
 x17-20020aa7d6d1000000b00463ba50e574mr41437710edr.158.1667987671494; Wed, 09
 Nov 2022 01:54:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <d9d71dc939ad39abf262f5442d423c2241336548.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 10:54:20 +0100
Message-ID: <CACRpkdY1HJKgexktP9LjcMJzyrSCnumKJaG0ypjVR_=_FOryyQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 7/8] bindings: rust: Add tests for libgpiod crate
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 10:31 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Nov 7, 2022 at 10:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Add tests for the rust bindings, quite similar to the ones in cxx
> > bindings.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> Without modifying udev rules on my system - is there a one-liner I
> could use to launch the tests? I guess using cargo as sudo is wrong
> but the executables are there so can I somehow run them all at once as
> if running `cargo test`?

What I think the DevOps:y people do is run tests as root but in some
virtualized or containerized machine. I don't know how well that
approach works with gpiosim though, virtualized probably, containerized
hardly, GPIO is just too real.

Yours,
Linus Walleij
