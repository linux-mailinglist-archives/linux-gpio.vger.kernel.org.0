Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB9A581DC8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240089AbiG0C5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbiG0C5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:57:32 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A23437197
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:57:30 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y141so14898568pfb.7
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H44T5T5MizwH9jSDzISRZhPoOm0ngKkJkNQhbaCsrJM=;
        b=UYxbNl2GYOuCTIk7FvWLqTOnaHi5O155Zu4YR0/N8HKpxcx+EbN5auEuj9otuXxtcZ
         bfli5WrrdmLqPoN3Qw1hKULO9uD1jajd60RE7fprhFRGkVdm4fX76kt0+5Hbe04g9djt
         y7t/08MjX4iVFCA8XSaFiL4BJ+459T1HOsqFBR+0kUmGBZacEQ+NsB4vxRiZX4n9W8Ft
         nbouMa4fj5EbyQy4vv4LLWEPRUp8lAxoErsfQMilzt+hHQ1DvYCw7pO5jj8YGLknXD0a
         D+RYhV6Aj0JSF3KcBnLOCFAShsv2pN8+Jq4zo5tUcNeMyUbaBP3J6/G6a6T3M6mFIvdg
         ntkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H44T5T5MizwH9jSDzISRZhPoOm0ngKkJkNQhbaCsrJM=;
        b=sW7MBl8CG4mhuYOxs1uZbs/SteyQVxHpdDBhbbH/MmqAzDPmoFLhRANCQgujpN1ew+
         R+vv8ZuGncL0JmdOFwgXvLXXvQwi3T49bWdKobVJmRF9H/hRL1T+lLvQHdkq3t0FQBoL
         LT/mPtUbkTZ2725xjuGOMipkESnxjU/dF5nBK9EF0tYdyk0ivra7BnbV0EEDXoB7/xce
         /G09XwcS5IzknkW3pPw+D8UA/kDq4bqwW6coG/8Mkx8JUk0pKjoXRggxUeFalH2nPeGb
         p6IStN5BtV7E/+oFw/ybc+iqZnwcUfGMKGt9oglDSUjOVYgyRIsJ0YzSPtWfdgQr3N9+
         o/kA==
X-Gm-Message-State: AJIora+un6FyRUcdgXWuW8MCAKcGlkr2DIdWWGiuUaWh2Cfz9Ay4vEx0
        FZ9fpM5VRbkckbcmp+OGs20=
X-Google-Smtp-Source: AGRyM1upG+/oZwyR/U5ztVWypBdAwklhiKhtUBuqGwctr254bi0G25qm1KAVADypPhFP0p3EJ+51zw==
X-Received: by 2002:aa7:84c1:0:b0:52a:e11a:f5e9 with SMTP id x1-20020aa784c1000000b0052ae11af5e9mr19781121pfn.55.1658890649763;
        Tue, 26 Jul 2022 19:57:29 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id c20-20020a624e14000000b0052b11fdb353sm12358335pfb.125.2022.07.26.19.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 19:57:29 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:57:23 +0800
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
Subject: Re: [PATCH V4 2/8] libgpiod: Add pre generated rust bindings
Message-ID: <20220727025723.GB88787@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <07889ab056a7c69d30569fdd4b035691dd2d6248.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07889ab056a7c69d30569fdd4b035691dd2d6248.1657279685.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:04:55PM +0530, Viresh Kumar wrote:
> This adds a copy of pre generated bindings and adds the suggested way of
> updating those in README.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/README.md       |   10 +
>  bindings/rust/libgpiod-sys/src/bindings.rs | 1920 ++++++++++++++++++++
>  2 files changed, 1930 insertions(+)
>  create mode 100644 bindings/rust/libgpiod-sys/README.md
>  create mode 100644 bindings/rust/libgpiod-sys/src/bindings.rs
> 
> diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
> new file mode 100644
> index 000000000000..ea037d6d7803
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/README.md
> @@ -0,0 +1,10 @@
> +# Generated libgpiod-sys Rust FFI bindings
> +Automatically generated Rust FFI bindings via
> +	[bindgen](https://github.com/rust-lang/rust-bindgen).
> +
> +## Updating bindings
> +1. Clone the source from
> +	<https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/>
> +2. run `cd libgpiod/bindings/rust/libgpiod-sys/`
> +2. run `cargo build --features generate`
> +3. Commit changes in `src/bindings.rs`

Those instructions do not force the regeneration of the bindings.
I assume the rust build system is being clever and determining nothing has
changed and short circuiting, but I would like to regnerate them to be sure.
How do I do that?

How is the --features approach better than just
bindgen -o src/bindings.rs ../../../include/gpiod.h
?

Why not build this all the time rather than hiding it behind a feature?

> diff --git a/bindings/rust/libgpiod-sys/src/bindings.rs b/bindings/rust/libgpiod-sys/src/bindings.rs
> new file mode 100644
> index 000000000000..930eb894f66f
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/src/bindings.rs
> @@ -0,0 +1,1920 @@
> +/* automatically generated by rust-bindgen 0.59.2 */
> +

Yet the Cargo.toml specifies 0.59.1.
So you didn't generate this with the instructions above then?

Having said that, I can confirm that 

bindgen -o src/bindings.rs wrapper.h

with the appropriate bindgen, regenerates the pre-generated file.

Cheers,
Kent.
