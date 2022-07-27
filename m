Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2EA4581F64
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 07:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiG0FPh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 01:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiG0FPg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 01:15:36 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33D82180B
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:15:34 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o14-20020a17090a4b4e00b001f2f2b61be5so1061587pjl.4
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 22:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mwrYXoagabA8n+LxxI7maQFZZDMr+RXB/acfKpnfsFo=;
        b=Ezkx/+ebGsixIkw0N+8LjjUYNA5wkCENZk4Kbp4hKDJqLIQA50DaCi5Qyn5rvDAwK8
         HQriwiuAq0HcMbM5pN0nuLwWidfbz7/HD1DiXXNOlFY9kVuNA5a7LMnqtX569W5flS4C
         mxTX3hzPYAkmzxF+R1S3iBrIShwpVMzhx2J61hpOLKOl3kHtCpUmghrkXC6u+kCyY264
         GINGyEiLMgPhzAg5SjHum3l504RNcTUYbEZKqT0w8pWVlcH3jxAetFAZMyCkePYdoDT/
         3NMWznkGLHAEyOuZKB1FmNiNVgDFjAjxuEYeBEPaFg7kfpHogmo6D7l00bBKH8CJIGCX
         jcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mwrYXoagabA8n+LxxI7maQFZZDMr+RXB/acfKpnfsFo=;
        b=GnRad7GW5VaNzbZk0J+uIrgOODPoe/yq7v4eezKw5oScNJ2FFGpgn09PIoOUZX3oSS
         rfvGj7q3njT2L5pnQckEd+t+fPKzZmWBZnyggESYnOybC8kBUXSz6ofze93grFwONyCT
         9UEqpBkj3xzP3eDBOtOH3KhEzKZK9yAjI/rlAkjBgKh6W/CFlnxaF9TSIUyP9RHIjCfO
         K0TQ2xTeFBxSx/f8b3dCqXZIBMKjFuMRMsHari5XvxDgU1n3xNgLh+OUBVa4avX3QzOk
         elyc/gbNaIJiAIWo2khi/VPSSjkvb+aKHb3n0iztH3XSXO45TqW/GC5g06pTRQOC+k+y
         zQcw==
X-Gm-Message-State: AJIora/A9oVMy6jvXFCtUd1e7gVVycFHa3gTMON4qDpDU+H7ipReEzB6
        /5w37uNjKscjA4gGZXywrKU7lw==
X-Google-Smtp-Source: AGRyM1sqpPY7en88UX5YqNENy1frwtGd9XT9pobJj/KFmsR/JhxD6AsGYSRfa+4T+rhHzYT+WKas/g==
X-Received: by 2002:a17:902:7285:b0:16c:ce55:9dba with SMTP id d5-20020a170902728500b0016cce559dbamr19564333pll.156.1658898933990;
        Tue, 26 Jul 2022 22:15:33 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902780200b0016a091eb88esm12579569pll.126.2022.07.26.22.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 22:15:32 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:45:29 +0530
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
Subject: Re: [PATCH V4 2/8] libgpiod: Add pre generated rust bindings
Message-ID: <20220727051529.becrq3qecbild2iq@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <07889ab056a7c69d30569fdd4b035691dd2d6248.1657279685.git.viresh.kumar@linaro.org>
 <20220727025723.GB88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025723.GB88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:57, Kent Gibson wrote:
> On Fri, Jul 08, 2022 at 05:04:55PM +0530, Viresh Kumar wrote:
> > +## Updating bindings
> > +1. Clone the source from
> > +	<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
> > +2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
> > +2. run `cargo build --features generate`
> > +3. Commit changes in `src/bindings.rs`
> 
> Those instructions do not force the regeneration of the bindings.

It does, just that the new file that got generated lands somewhere like this:

target/debug/build/libgpiod-sys-769f98853e1c0550/out/bindings.rs

and the end user crate will use this instead of the one in src/.

> I assume the rust build system is being clever and determining nothing has
> changed and short circuiting, but I would like to regnerate them to be sure.
> How do I do that?

If you use the "generate" feature, you will end up building it again.

> How is the --features approach better than just
> bindgen -o src/bindings.rs ../../../include/gpiod.h
> ?

This lets the user crates control it from their Cargo.toml file, libgpiod
doesn't do it right now but it can like:

libgpiod-sys = { path = "libgpiod-sys", features = ["generate"] }

> Why not build this all the time rather than hiding it behind a feature?

That's what I did initially but there are environments, like rust-vmm
containers [1], where all tools aren't available to run a bindgen for each
architecture/platform type. I ran into a lot of issues there and the maintainers
suggested to do this instead as the bindings won't change a lot later on.

FWIW, in my use case vhost-device crate [2] is using libgpiod, which uses
libgpiod-sys and the vhost-device updates get tested with [1] automatically by
bots.

> > diff --git a/bindings/rust/libgpiod-sys/src/bindings.rs b/bindings/rust/libgpiod-sys/src/bindings.rs
> > new file mode 100644
> > index 000000000000..930eb894f66f
> > --- /dev/null
> > +++ b/bindings/rust/libgpiod-sys/src/bindings.rs
> > @@ -0,0 +1,1920 @@
> > +/* automatically generated by rust-bindgen 0.59.2 */
> > +
> 
> Yet the Cargo.toml specifies 0.59.1.
> So you didn't generate this with the instructions above then?

I did.

The dependency like: bindgen = "0.59.1", doesn't force a specific version but
actually a range. An update is allowed if the new version number does not modify
the left-most non-zero digit in the major, minor, patch grouping [3].

> Having said that, I can confirm that 
> 
> bindgen -o src/bindings.rs wrapper.h
> 
> with the appropriate bindgen, regenerates the pre-generated file.

-- 
viresh

[1] https://github.com/rust-vmm/rust-vmm-container
[2] https://github.com/rust-vmm/vhost-device/tree/main/gpio
[3] https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html
