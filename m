Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08476581F46
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 06:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbiG0ExO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 00:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240509AbiG0Ew5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 00:52:57 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D593F309
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 21:52:02 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id p1so6670150plr.11
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 21:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dil1kD3FBts00p2zWkXJQziwhOgVq6H3jEVx9TuQ7jk=;
        b=AEN/CbMerYxFL9ISZ1gy1xe7YqnQRsleZRErksRQOLNHb1bsLz0QuoxQUaXjj/cD4/
         9VZhvP+FpeciR1AVCtCD8zJURkNsUewkLo+G0gjNBcPBKVdTvLoxBfIQ6Z3ImgFP5mft
         8egnKY5w+6siFc3NSbjfWCj/1TKn+iKGqgUGGvbs1fVJTCEMsYp8JzZq82n1+lEuolR0
         5zZjrCjVYJG30Ir9pln29MGInJ93hDpeWgqMGTtpwBQCAkGl7Am757OmonnZUEBgI938
         WkfNUR98MAZRxwIwHzypTsg/27oBkZhwzYWzSyQ9Fy6b+yltYmJRLuSD0HbwE92L/GQn
         4x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dil1kD3FBts00p2zWkXJQziwhOgVq6H3jEVx9TuQ7jk=;
        b=pT3gPDeBMjh/ZfUgi+D0D8s7dvU6xvdPAJJXNfMZP10GBZexXUu0Htq9WuVAxvTKE9
         NFX/xGdYqbRK93GH49IHKsEgOLf6M6DJwM6bHI5qVJQtqBloYXtKQSnMIzpJv13h+tt7
         hBv9Psaq2ZnE+JbiWYBVXb3wyNKOf2fPJXD/Vq7ytYzHmVeAq5CSeXokjzey0u0JCuVq
         CgqfoKKcYK7KLY7VzdXQlWHFT2/nOvVFQORFleIbSJ1QUdRkF9ZV/ftYTK1wNLCjdrI/
         NOwuToHB/jJZGdDn1M/O/eiO1jbnbIRqCgcHKTpjsTU4Ebqk5LKBFwIfCj2oD/3+S4EN
         liyg==
X-Gm-Message-State: AJIora/9oldD31SBYjL7d1LkUiamIcvmLdb0tIEiCw5cvMf2QpGrarXj
        TsFgYLw3S8DTRThrYFHkIRd14w==
X-Google-Smtp-Source: AGRyM1vOGLfFYFKCIZ2ItpZr+3hMgFWiEw+rB5yp65yRxytb8BYvkx5QWPFDa0aWAJCl6ex7Me/2sA==
X-Received: by 2002:a17:903:22c8:b0:16c:4068:cd with SMTP id y8-20020a17090322c800b0016c406800cdmr19867523plg.59.1658897521090;
        Tue, 26 Jul 2022 21:52:01 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902650200b0016c0b0fe1c6sm12693568plk.73.2022.07.26.21.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 21:52:00 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:21:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20220727045158.z72byax7pc7kokca@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
 <20220727025706.GA88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025706.GA88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:57, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:04:54PM +0530, Viresh Kumar wrote:
> > +fn main() {
> > +    let files = vec![
> > +        "../../../lib/chip.c",
> > +        "../../../lib/chip-info.c",
> > +        "../../../lib/edge-event.c",
> > +        "../../../lib/info-event.c",
> > +        "../../../lib/internal.c",
> > +        "../../../lib/line-config.c",
> > +        "../../../lib/line-info.c",
> > +        "../../../lib/line-request.c",
> > +        "../../../lib/misc.c",
> > +        "../../../lib/request-config.c",
> > +    ];
> > +
> > +    #[cfg(feature = "generate")]
> > +    generate_bindings(&files);
> > +    build_gpiod(files);
> > +}
> 
> Shouldn't bindings wrap libgpiod and dynamically link against it rather
> than building and linking statically?

There are few problems I faced, because of which I had to do it this way.

- I couldn't find a way to do a "Make" for libgpiod from here and then link to
  the resultant library.

- libgpiod may not be automatically installed in the environment where the end
  user of these Rust APIs exists. So I had to build it.

- And then the API is changing a lot, maybe down the line once it is stable
  enough we can change this to something else.

> > diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
> > new file mode 100644
> > index 000000000000..3384863a567c
> > --- /dev/null
> > +++ b/bindings/rust/libgpiod-sys/src/lib.rs
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#[allow(
> > +    clippy::all,
> > +    deref_nullptr,
> > +    dead_code,
> > +    non_camel_case_types,
> > +    non_upper_case_globals,
> > +    non_snake_case,
> > +    improper_ctypes
> > +)]
> > +
> 
> Are all these really necessary?

Actually not, thanks for pointing this out.

> Builds mostly clean for me with just:
> 
>  +    non_camel_case_types,
>  +    non_upper_case_globals,
> 
> Both non_snake_case and deref_nullptr are only required for tests.

and if you want to run sanity checks with "fmt" or "clippy".

> The deref_nullptr masks several warnings like this:
> 
> warning: dereferencing a null pointer
>    --> src/bindings.rs:121:14
>     |
> 121 |             &(*(::std::ptr::null::<max_align_t>())).__clang_max_align_nonce1 as *const _ as usize
>     |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ this code causes undefined behavior when executed
>     |
>     = note: `#[warn(deref_nullptr)]` on by default
> 
> which is code generated by bindgen, which is a bit of a worry.
> It is only used for alignment tests, but you'd think they would disable
> the warning just around that code themselves.
> 
> Disabling deref_nullptr globally for all builds is at best poor form.

Even with this these will get disabled only for the code present in libgpiod-sys
crate, file bindgen.rs (the automatically generated one). This won't cause the
warnings to be skipped for the libgpiod rust wrappers in the libgpiod crate.

> Perhaps only disable it for test builds, i.e.
> 
> #[cfg_attr(test, allow(deref_nullptr, non_snake_case))]

I also run following normally:

cargo fmt --all -- --check; cargo clippy --workspace --bins --examples --benches --all-features -- -D warnings

to do sanity checks, etc. And this will also generate warnings, not just tests.

> > +mod bindings_raw {
> > +    #[cfg(feature = "generate")]
> > +    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
> > +
> > +    #[cfg(not(feature = "generate"))]
> > +    include!("bindings.rs");
> > +}
> > +pub use bindings_raw::*;
> > diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
> > new file mode 100644
> > index 000000000000..7bc1158b7d90
> > --- /dev/null
> > +++ b/bindings/rust/libgpiod-sys/wrapper.h
> > @@ -0,0 +1,2 @@
> > +#include <string.h>
> > +#include "../../../include/gpiod.h"
> 
> The string.h is just to provide strlen() for the wrapper crate??
> (but also pulls in the other string functions)
> The wrapper crate already depends on libc - why not use libc::strlen()
> there and drop this include here?

Right, done.

> And then wrapper.h becomes redundant - call bindgen on gpiod.h directly.

Rust documentation specifically suggests wrapper.h to be created [1], maybe it
it is better to just keep it, even if we have a single entry in there.

-- 
viresh

[1] https://rust-lang.github.io/rust-bindgen/tutorial-2.html
