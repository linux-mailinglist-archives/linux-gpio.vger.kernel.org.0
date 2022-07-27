Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCAB7581F68
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 07:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiG0FRw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 01:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiG0FRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 01:17:51 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7073D2BB31
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:17:50 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p1so6710091plr.11
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rG/1LoJsLjoAuux/QhGfLOP+5wvIGuB37nmbcZ5TDDI=;
        b=Ryv1ScBXYNFsdDIn6OYPqBnnS9jKK2sftKF1XxaNXoLC578hrLmQt0JMRYZtmMqJpr
         55m+4AJFffM1R/A/pHiDgdTlKAt7ZQQMzWmK4RKvkfH1v1TsR1ZJyNy2D3hq5FRojV5A
         qJPONQS4YN9VR53Kz2H4SaCS7PTgZOAFtu0D/znxTuPLY4hKAPhgAKYO8OG0aAY5I/XU
         HcFD6ICAyf+cftHz0S/7tXjX+sN1F9M1ElxqGooVd6r+Ksa6cY/DpJhCVbSAXo7/VMPo
         0KhFmokvQpj4fzpePFlGcliYK7n9tMQcN3s9zm44Rk2DX+Q5vW/CMmHug8i9Kp6FdyE5
         JSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rG/1LoJsLjoAuux/QhGfLOP+5wvIGuB37nmbcZ5TDDI=;
        b=KLaWQ6YvyPy7fAF+xG4J+g8GB/DBVGCJLZZeUp0N5dDr3vEItFZ/JnFGs6CM9e3N3Q
         Gu1fD6qk7saqrpHtQIAXoKo+tpsNvdOxgRgbFSAOfbCKz4xoyFyKcl/AgW9MLCwQkFEn
         63ufe5z0OwR7JYMkqOha2Kcp4/4arFGnuy2NPWrXqP56RxucVjB2+ciNOyMH69pVm3pn
         j5JQx1SpylHjHvHtTPxvrQoXkcu5Ck75/Tmv+HhSCSwUCDBBgg+GFQpBIPY4ezeZPeIg
         +541d4qyjUZ1hlJh+7IdZXuu3RtSg63EXBsnY6/XJRZA+gYetRjDg49XSIC2uv8I7R1N
         Phew==
X-Gm-Message-State: AJIora8co4TqC0W7ISeTZl1Wj9UY/+/ZhksK/GHS3j0YB6XM4l89XiQu
        b1wjIYt18ZSkKL9Ac2QuDMI=
X-Google-Smtp-Source: AGRyM1uYsH18ftV21vOjci2PxnDWpnjmYqs2p1+xfESJuNsKzLRW2gCvnzhCpzHBZZFOWYNhARMB8A==
X-Received: by 2002:a17:902:7484:b0:16d:ac9a:73dd with SMTP id h4-20020a170902748400b0016dac9a73ddmr3252419pll.36.1658899069747;
        Tue, 26 Jul 2022 22:17:49 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f54c00b0016db6bd77f4sm220071plf.117.2022.07.26.22.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 22:17:49 -0700 (PDT)
Date:   Wed, 27 Jul 2022 13:17:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20220727051743.GA108225@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
 <20220727025706.GA88787@sol>
 <20220727045158.z72byax7pc7kokca@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727045158.z72byax7pc7kokca@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 10:21:58AM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:57, Kent Gibson wrote:
> > On Fri, Jul 08, 2022 at 05:04:54PM +0530, Viresh Kumar wrote:
> > > +fn main() {
> > > +    let files = vec![
> > > +        "../../../lib/chip.c",
> > > +        "../../../lib/chip-info.c",
> > > +        "../../../lib/edge-event.c",
> > > +        "../../../lib/info-event.c",
> > > +        "../../../lib/internal.c",
> > > +        "../../../lib/line-config.c",
> > > +        "../../../lib/line-info.c",
> > > +        "../../../lib/line-request.c",
> > > +        "../../../lib/misc.c",
> > > +        "../../../lib/request-config.c",
> > > +    ];
> > > +
> > > +    #[cfg(feature = "generate")]
> > > +    generate_bindings(&files);
> > > +    build_gpiod(files);
> > > +}
> > 
> > Shouldn't bindings wrap libgpiod and dynamically link against it rather
> > than building and linking statically?
> 
> There are few problems I faced, because of which I had to do it this way.
> 
> - I couldn't find a way to do a "Make" for libgpiod from here and then link to
>   the resultant library.
> 
> - libgpiod may not be automatically installed in the environment where the end
>   user of these Rust APIs exists. So I had to build it.
> 
> - And then the API is changing a lot, maybe down the line once it is stable
>   enough we can change this to something else.
> 

Sure, it is a problem, but static isn't the solution.
You should be able to get the appropriate paths from autoconf, but I would
refer you to Bart on that.

Wrt, "API changing a lot", autoconf make build dependencies should sort
that out for you.

> > > diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
> > > new file mode 100644
> > > index 000000000000..3384863a567c
> > > --- /dev/null
> > > +++ b/bindings/rust/libgpiod-sys/src/lib.rs
> > > @@ -0,0 +1,20 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +#[allow(
> > > +    clippy::all,
> > > +    deref_nullptr,
> > > +    dead_code,
> > > +    non_camel_case_types,
> > > +    non_upper_case_globals,
> > > +    non_snake_case,
> > > +    improper_ctypes
> > > +)]
> > > +
> > 
> > Are all these really necessary?
> 
> Actually not, thanks for pointing this out.
> 
> > Builds mostly clean for me with just:
> > 
> >  +    non_camel_case_types,
> >  +    non_upper_case_globals,
> > 
> > Both non_snake_case and deref_nullptr are only required for tests.
> 
> and if you want to run sanity checks with "fmt" or "clippy".
> 
> > The deref_nullptr masks several warnings like this:
> > 
> > warning: dereferencing a null pointer
> >    --> src/bindings.rs:121:14
> >     |
> > 121 |             &(*(::std::ptr::null::<max_align_t>())).__clang_max_align_nonce1 as *const _ as usize
> >     |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ this code causes undefined behavior when executed
> >     |
> >     = note: `#[warn(deref_nullptr)]` on by default
> > 
> > which is code generated by bindgen, which is a bit of a worry.
> > It is only used for alignment tests, but you'd think they would disable
> > the warning just around that code themselves.
> > 
> > Disabling deref_nullptr globally for all builds is at best poor form.
> 
> Even with this these will get disabled only for the code present in libgpiod-sys
> crate, file bindgen.rs (the automatically generated one). This won't cause the
> warnings to be skipped for the libgpiod rust wrappers in the libgpiod crate.
> 

By "all builds" I meant build/tests/fmt/clippy etc of this module, not
others.

My concern being that a subsequent bindgen may introduce a problem into
the generated code that the allows would hide.  So try to keep them
restricted to the problem at hand as much as possible.

> > Perhaps only disable it for test builds, i.e.
> > 
> > #[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
> 
> I also run following normally:
> 
> cargo fmt --all -- --check; cargo clippy --workspace --bins --examples --benches --all-features -- -D warnings
> 
> to do sanity checks, etc. And this will also generate warnings, not just tests.
> 

So
#[cfg_attr(any(test,fmt,clippy), allow(deref_nullptr, non_snake_case))]
?

> > > +mod bindings_raw {
> > > +    #[cfg(feature = "generate")]
> > > +    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
> > > +
> > > +    #[cfg(not(feature = "generate"))]
> > > +    include!("bindings.rs");
> > > +}
> > > +pub use bindings_raw::*;
> > > diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
> > > new file mode 100644
> > > index 000000000000..7bc1158b7d90
> > > --- /dev/null
> > > +++ b/bindings/rust/libgpiod-sys/wrapper.h
> > > @@ -0,0 +1,2 @@
> > > +#include <string.h>
> > > +#include "../../../include/gpiod.h"
> > 
> > The string.h is just to provide strlen() for the wrapper crate??
> > (but also pulls in the other string functions)
> > The wrapper crate already depends on libc - why not use libc::strlen()
> > there and drop this include here?
> 
> Right, done.
> 
> > And then wrapper.h becomes redundant - call bindgen on gpiod.h directly.
> 
> Rust documentation specifically suggests wrapper.h to be created [1], maybe it
> it is better to just keep it, even if we have a single entry in there.
> 

Specifically the tutoral says:
"The wrapper.h file will include all the various headers containing
declarations of structs and functions we would like bindings for."

If you do need to bundle several headers then fair enough, but I don't
see any benefit in this case - gpiod.h contains all that.

The tutorial is probably written that way so it is easy for them to
refer to the general "wrapper.h", but there is nothing in bindgen that
requires it.

Cheers,
Kent.
