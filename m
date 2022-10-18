Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C07E602A09
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 13:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiJRLWJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 07:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiJRLWJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 07:22:09 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5C5B14F9
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 04:22:08 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id n18-20020a17090ade9200b0020b0012097cso1491042pjv.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 04:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3AKmd6DIHHF3xqTa91U9upU8FlJHptBr1lRXYKeXA0=;
        b=gm7/lZEagVLaXMk8IFbLB1gbKVwfp0eKpD6EzBKXrSdSk5aoEWb95UmAi5FkM5IdSa
         1irSJKJzDXj9XfjaSji5Yc9A9FJVcVtMGwzAUamvvwJM96xTSQQuu4jr1Swvc8R7TWwr
         gKEuXkH3CIUvBgDVC7bMh9vJ6K2QVN8wi6n4PfC4JkvR2K5n/VXH9g09x7kDzqiobgRs
         5yeOWEJtyKyaJdDfvVcIwraKlFpw+koCvGGPjOJkppAPHExPy50kwDkV98INnwOEy5jO
         45WmZr8le2wJdbedtOfBDwC3taEBQRtYLYKIvp16HFGpoouposS/kQ2tB0sLu9BEXB2A
         RWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3AKmd6DIHHF3xqTa91U9upU8FlJHptBr1lRXYKeXA0=;
        b=NKGNbtylgpb9N183jMLcoAFiTT0pw7ytbQgo1oUXIBwLqsfujDq5W822s2tHHmMUil
         NjQZ7vmCrJamXER8Kj87rNmrpq1p5z995U6FsfHb8ri+KWW8h+SCi24hBvDbVJr0WU/h
         RDlQLlI1ZtMyfAE/qk+wBBe0x4W9oD7dFyXb2oOXrY38uqQhIjurkZ0NOm0ohGuCvXAl
         gThadZjaJUFdhmwATva97mzHfm51TKinYFwIRlaxCGoinxYWyYQ9Nq0Lit/M7DQDdthh
         JcRET8kC1KChaa+VBVYGDJQiMG81Fqd9myE25KBxHjLc9ohR9fEBQfu/W6H2C+KVP0DD
         8EWg==
X-Gm-Message-State: ACrzQf33v8TPUbQHCV3mggq5701XDmHccfMlX3EUfPH6FC3iIMhlMLRK
        vzrSply0n69z3OEM4qTGp2+xxg==
X-Google-Smtp-Source: AMsMyM4ZTLOCVbs53Rrbqg4OG97SIf555gpxi6EQc+A1a97/2o5NxC6q+MCQVlsZFI7LMkyOOnMQ4g==
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id pa3-20020a17090b264300b00205bd0dbdffmr2974544pjb.99.1666092127908;
        Tue, 18 Oct 2022 04:22:07 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902710600b0016d773aae60sm8398071pll.19.2022.10.18.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 04:22:07 -0700 (PDT)
Date:   Tue, 18 Oct 2022 16:52:04 +0530
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
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20221018112204.l36wnimrqvexnvat@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01RqjgZINnkcyIC@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-10-22, 20:59, Kent Gibson wrote:
> > diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> > new file mode 100644
> > index 000000000000..77f82719d269
> > --- /dev/null
> > +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> > @@ -0,0 +1,15 @@
> > +[package]
> > +name = "libgpiod-sys"
> > +version = "0.1.0"
> > +edition = "2018"
> > +
> 
> Add license and other relevant keys as per the link you helpfully include...

Is this enough ?

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index 77f82719d269..af4098cb137d 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -1,6 +1,11 @@
 [package]
 name = "libgpiod-sys"
 version = "0.1.0"
+authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
+description = "A rust library for libgpiod public header bindings"
+repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/"
+keywords = ["libgpiod", "gpio"]
+license = "LGPL-2.1-or-later"
 edition = "2018"

I picked license details from C code, is that what we should be using
here too ?

> > diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
> > new file mode 100644
> > index 000000000000..1ca355b5f5ac
> > --- /dev/null
> > +++ b/bindings/rust/libgpiod-sys/src/lib.rs
> > @@ -0,0 +1,13 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> 
> GPL-2.0?
> 
> Elsewhere you use Apache 2.0 AND BSD-3-Clause for rust code.

I would use the same information here too, once decided.

-- 
viresh
