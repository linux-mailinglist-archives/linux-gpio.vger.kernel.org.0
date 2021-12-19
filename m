Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19D3479F0E
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Dec 2021 05:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235183AbhLSEEg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Dec 2021 23:04:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235181AbhLSEEf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Dec 2021 23:04:35 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33450C061574
        for <linux-gpio@vger.kernel.org>; Sat, 18 Dec 2021 20:04:35 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id t23so10260348oiw.3
        for <linux-gpio@vger.kernel.org>; Sat, 18 Dec 2021 20:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJWt+KkmO0YLrs+UtVANxUD2GMcpvaDOALr1uWCtdM8=;
        b=BQL8sIVFJbDnIAbdP/g2N5jIawM/Hj+QHQ1O4hkd2MnUlUHvEPqvCh+/vlGS3JjNxp
         MlHfjfnzD9KEwCRNff928OrN1LP4Qa07pWgL3VcJv2COFhEBUx3rzf0gUqSllvHtcojO
         zwdSNgDAfNak9q24G20o8Q5+rc2QomtPMV47DDLdboU+bU2UCZwnpwyrt+vc1qFpEVP9
         HgMCGNyCrXKwQGANq9u4C+CmL05E1wu8kmWC+yA2vOVlqFxiiZagRtpH95inrPcuO4Uu
         48yLA1Gn5aDhB4wkyCI32StnpRO5rwtFi+AuWSh3NFLvrZA3xWJVj84JQTRdbA52ZfWw
         INyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJWt+KkmO0YLrs+UtVANxUD2GMcpvaDOALr1uWCtdM8=;
        b=ixKuI3/h2SsBUc8v70lSGEtkhK/BYbpOKTeXLukr3qPhbevzBCWk4atr1690LZSkrQ
         G7yVp9uXngKpYk4FVx2OPRXhIcwKp8IP8KmX1vQBPunaPaIs49BKJeKShLC8QxAWKQKV
         q2c7vAKv3l8FGdW5OxIU8Wd0eWwb+4NTZumL9/g0qwAvYVtM7Oug0xrZMF62dG5kuHaq
         6vjfccRVIRaOuXabQ4LAXo64iI0rVvfcncn8KA8at4c5tQGG/HW9YdJD8XX7SOyHB1js
         lco98pXXSJ8P2OsdYT8PfmI3osHU4aCAye8IdBLvM57UL2ecVRQbF7I8BZ87+i2e0fac
         NhDg==
X-Gm-Message-State: AOAM532Yq94XUdSLBwin4ccwoD+0Nfwukdcq6aRF4ITubyb47/5NXcYU
        9zCWOnHYdyASl6tSBAsN3/mDpfBA/p3T6qXY6QE=
X-Google-Smtp-Source: ABdhPJx0ldqUaFXeuP1Kjl95uV+6l0NkipfkAJU43DVowxSD2/ro+g6CacMxIQr+5SFXSC/caA2p/AAjQozf9fzm0vc=
X-Received: by 2002:aca:230b:: with SMTP id e11mr13213688oie.22.1639886673176;
 Sat, 18 Dec 2021 20:04:33 -0800 (PST)
MIME-Version: 1.0
References: <CAKycSdDgLYRU9d5dw8SUGX5Jow1LUM4ySb5n4v4FeUFKTwnYPg@mail.gmail.com>
 <20211217055001.535wscahbxfkrxn5@vireshk-i7> <CANiq72nimetRmi+aHF1h+hqvSjFJxVXsBYKQHUEnTQ50Lp5eqw@mail.gmail.com>
 <20211217104920.dxvgmw3536ii2de7@vireshk-i7>
In-Reply-To: <20211217104920.dxvgmw3536ii2de7@vireshk-i7>
From:   Gerard Ryan <g.m0n3y.2503@gmail.com>
Date:   Sun, 19 Dec 2021 14:04:22 +1000
Message-ID: <CAKycSdB791-yCjdoEAHZoRrEvNAEWaN5WO5pTKW4AGkSZM7CCQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] libgpiod: Generate rust FFI bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        stratos-dev@op-lists.linaro.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-12-2021, 3:50 PM, Viresh Kumar wrote:
> followed by wrapper crate to contain the wrappers around it.

If by wrapper you mean the safe/idiomatic wrapper then I agree.

> When I do a cargo build there (for vhost-device crate), it will try to build the
> dependencies as well, i.e. libgpiod, and I need to build the libgpiod's C files
> as well there. There are good chances that I need to build from source and
> libgpiod isn't installed there. How do I do it with Make ?

Hmmm, I was thinking `pkg-config` or make from this repo would be enough.
I haven't used it myself as I don't do much c/cpp work anymore, but
I've looked into https://vcpkg.io/ seems quite good.
and there is https://crates.io/crates/vcpkg to integrate it.
for now, perhaps `cc` is enough.

On 17-12-2021, 8:49 PM, Viresh Kumar wrote:
> Perhaps, we should make it compile-only for the time being. Once the ABI is
> stable enough, we can think of committing something to the source tree.

Sounds good.

On Fri, Dec 17, 2021 at 8:49 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-12-21, 11:38, Miguel Ojeda wrote:
> > Having optional pre-generated bindings may be good for some users,
> > e.g. libsqlite3-sys does it. I guess the main question is whether you
> > are willing to support/maintain it. Also consider cross-compilation.
> >
> > But I wouldn't only provide pre-generated ones if you are using
> > `bindgen` anyway.
>
> The pre-generated ones are normally good for kernel headers, where the userspace
> ABI is stable and so we don't need to change the generated bindings soon.
>
> But in our case here, the ABI isn't that stable and will likely change soon
> again for the first few months after v2.0 is released for libgpiod.
>
> Perhaps, we should make it compile-only for the time being. Once the ABI is
> stable enough, we can think of committing something to the source tree.
>
> > In any case, I am not a Rust expert, so please take that with a grain of salt :)
>
> :)
>
> --
> viresh
