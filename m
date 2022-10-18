Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DB5602A8B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 13:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiJRLuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 07:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiJRLuG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 07:50:06 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0424573C04
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 04:50:04 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id bh13so13081887pgb.4
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2QJkGMhqbbaOx5v1TbypyOHw9HBv90Z0xTzCJMEnAw=;
        b=a1Gda1fiqMtLOfs1yyeuNQzLExEth9JAXG4gwD3DmexTde0liOLlgo00W/CKvuUCHw
         y8LPObLbvNhMKHsyoH4GAkr6YFf1p79nHSd4l9+ALtbBz0NWvxyw7A+w8WB7UdrCfKxB
         iovaFQVQFegReWc2XWjUnMRav13xJU4eb/pPtjoO+QUKg6lWKMry+WuixrLMkB8e1gjp
         oR5Ss+jrzlJzqt3gkklqI2Byv2eKVfgHvwIAQM9uECg1FJAHbEynYLzT+1cU1ATm0lko
         2DCNH+BxOpP0z86iqP23EFfDr0gdsT+L6H6pXb9Pd9ArX6RqYtNDqA0Cw7VrP6vwz3nb
         Vjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2QJkGMhqbbaOx5v1TbypyOHw9HBv90Z0xTzCJMEnAw=;
        b=G8HF5XBdaa8toFRbJFqnXlihLtgCuP5GBOl0V42lpB5IbSiwSilcqvoS0k6JhAnURV
         MPfUeDY4h2YrtwMwuVw4rOEVwdETOqNc1fzSY4mItINCVcmxjnfZfrI94ws0iQEGTyCZ
         AgN9BjOPd5ewGqos2W/yvRYWg0v2+yWZ6nD9D7PZ2ZD/TWDsc/q3bWtXmZQB18Tb4L49
         SVBmnN7PU7hZ+lsuVBNC9bH5MHjJQEyg6FkfBA8QFrjzPVyZldYXHiykN9KgWYfQ5WHa
         75NjXzGz46+DTn0MfzAF6BLFrgd5lyADK9A1FTdzwOXqaYC+0exBIS9ANlvA6JQieWmn
         /qKA==
X-Gm-Message-State: ACrzQf2yMQjmVJ5ROND+GaWKTvF9vkJ6JqkYcPgMVYQDz6mSGtfndYfj
        te9wfTzeHGsfciXVri9rbf8=
X-Google-Smtp-Source: AMsMyM7IkrwxMTh/zDtVkUWHMWGC81MVa9KY4oY0X6I5NLBh0U4FN1wrxOOWGvp+WomHtN9h0fDIaw==
X-Received: by 2002:a63:5c56:0:b0:464:85bb:8fd9 with SMTP id n22-20020a635c56000000b0046485bb8fd9mr2256037pgm.188.1666093803415;
        Tue, 18 Oct 2022 04:50:03 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id j8-20020a170902da8800b0017305e99f00sm8504302plx.107.2022.10.18.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 04:50:02 -0700 (PDT)
Date:   Tue, 18 Oct 2022 19:49:56 +0800
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
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <Y06S5GCFYeaPEW9E@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol>
 <20221018112204.l36wnimrqvexnvat@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018112204.l36wnimrqvexnvat@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 04:52:04PM +0530, Viresh Kumar wrote:
> On 17-10-22, 20:59, Kent Gibson wrote:
> > > diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> > > new file mode 100644
> > > index 000000000000..77f82719d269
> > > --- /dev/null
> > > +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> > > @@ -0,0 +1,15 @@
> > > +[package]
> > > +name = "libgpiod-sys"
> > > +version = "0.1.0"
> > > +edition = "2018"
> > > +
> > 
> > Add license and other relevant keys as per the link you helpfully include...
> 
> Is this enough ?
> 

You should add "categories" and "documentation" if you intend to publish
to crates.io.

> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> index 77f82719d269..af4098cb137d 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -1,6 +1,11 @@
>  [package]
>  name = "libgpiod-sys"
>  version = "0.1.0"
> +authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
> +description = "A rust library for libgpiod public header bindings"
> +repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/"
> +keywords = ["libgpiod", "gpio"]
> +license = "LGPL-2.1-or-later"
>  edition = "2018"
> 

Why the 2018 edition, rather than 2021?

> I picked license details from C code, is that what we should be using
> here too ?
> 

LGPL is probably not appropriate here, as the binding code ends up
being part of the binary - unless you plan to package it as a dynamic
library?

The licenses of your dependencies are:
$ cargo license
(MIT OR Apache-2.0) AND Unicode-DFS-2016 (1): unicode-ident
Apache-2.0 AND BSD-3-Clause (1): vmm-sys-util
Apache-2.0 OR MIT (8): bitflags, cc, libc, proc-macro2, quote, syn, thiserror, thiserror-impl
MIT (1): intmap
N/A (3): gpiosim, libgpiod, libgpiod-sys

IANAL, but one or more of those would be more appropriate than either
GPL or LGPL.
You, Bart and linaro(?) will have to come to some agreement on which
license or combination to go with - it depends.

Cheers,
Kent.

