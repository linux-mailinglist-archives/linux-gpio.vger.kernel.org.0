Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FB8624959
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 19:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbiKJS0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 13:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiKJS0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 13:26:40 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D123B1F5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 10:26:39 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id bk51so542866vkb.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 10:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkRiRNFz3B0+o5bdjKTjdxN+wwnRNu+jJCIgV5Wh92E=;
        b=CMQsWHTMOGR/ADIiwmJykAVPJIhCO8djjog6YZeDG9v9fF6mmDyPPyAgsADyrdTjPK
         kiJ3MiNEiHY6bK7xyB5iL/iXj2TH8bcZjCtIWK266EaA3HsjNQ6oJtlVfxUJOn39024L
         mwKolq0Ky6lsCsOqj3RR227hTTLRkwqXs0mvwCPII/eTAw4Jw1zUO6+A+LJR9JARbLIz
         WeWA96CdAbOK5J4hS8EfEXNx/kwRybArfkYpxRsrMkG0++C0ywxissNtwrLiBODEVpwo
         H4EhMtuxgrpOjr9DBnMYsMBhvPU4bqG53fs0uwiBhFrqsm89WnCa2dw+gWjEavkkp3d+
         oGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkRiRNFz3B0+o5bdjKTjdxN+wwnRNu+jJCIgV5Wh92E=;
        b=d31AbuiDcqhZBSeX7wWRd9B0AiHjAcOr+SdTAGLrTlgzClWxszzM50cre1FXc0RsU+
         nuEflivg10o5J3ltkzPrhvjBSmQxjK/K9pDX/Yie1Jk55Efq9dhvWeqPWNhyq8rEfTZq
         28F4kyIF9BwLp0Jpy2X/FxmpIel+tHK5kBxK+vj3Yqfgk3ipUpq4O5gJbp36C8bW+K7x
         ofe1FaA2Us2w0GrfWtjiEZA3HVKcEU5jpX0bSvJrxnwQ+WowTPlezU7vGcjJYCySRrl1
         /Rs/fC6b2GsKnjwSgBRDMyIGeu6Lp8gjJus2XsR0eONGY1GjpbySTOsJEq9EGO+0bYfb
         j/vQ==
X-Gm-Message-State: ACrzQf2XzvSAZyBqOI34v/HWTUp9uqMLEtp3OVH/L5bNrZJfC87hDTt0
        Z8hodxpBIgeYy6HE8PHXV49iUsvM8QZ0X3iQBzRq3Q==
X-Google-Smtp-Source: AMsMyM7SnEHRz98GN4/5jy3o1c5oqxVsuXzjlsUSNUJDaJzz/SPsmMYgNmx9Dvi+4pHzQnq4Plkl5WHI9GQ33okw4Kg=
X-Received: by 2002:a1f:a695:0:b0:3ab:85c0:e1e8 with SMTP id
 p143-20020a1fa695000000b003ab85c0e1e8mr16330133vke.1.1668104798499; Thu, 10
 Nov 2022 10:26:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <43c0d28fc12bbfb5a0feba0d30542a4ca2d4bad6.1667815011.git.viresh.kumar@linaro.org>
In-Reply-To: <43c0d28fc12bbfb5a0feba0d30542a4ca2d4bad6.1667815011.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Nov 2022 19:26:27 +0100
Message-ID: <CAMRc=MetERzq-SjosE6bxTHh6Np6133CAMxz09YVrJAgvnpssA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 6/8] bindings: rust: Add examples to libgpiod crate
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> diff --git a/bindings/rust/libgpiod/examples/gpioset.rs b/bindings/rust/libgpiod/examples/gpioset.rs
> new file mode 100644
> index 000000000000..f72a623ab28c
> --- /dev/null
> +++ b/bindings/rust/libgpiod/examples/gpioset.rs
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of the gpioset tool.
> +
> +use std::env;
> +use std::io::{stdin, Read};
> +
> +use libgpiod::{
> +    chip::Chip,
> +    line::{self, Direction, Offset, SettingVal, Value},
> +    request, Error, Result,
> +};
> +
> +fn usage(name: &str) {
> +    println!("Usage: {} <chip> <line_offset0>=<value0> ...", name);
> +}
> +
> +fn main() -> Result<()> {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() < 3 {
> +        usage(&args[0]);
> +        return Err(Error::InvalidArguments);
> +    }
> +
> +    let lconfig = line::Config::new()?;
> +
> +    for arg in &args[2..] {
> +        let pair: Vec<&str> = arg.split('=').collect();
> +        if pair.len() != 2 {
> +            usage(&args[0]);
> +            return Err(Error::InvalidArguments);
> +        }
> +
> +        let offset = pair[0]
> +            .parse::<Offset>()
> +            .map_err(|_| Error::InvalidArguments)?;
> +        let value = pair[1]
> +            .parse::<i32>()
> +            .map_err(|_| Error::InvalidArguments)?;
> +
> +        let mut lsettings = line::Settings::new()?;
> +        lsettings.set_prop(&[
> +            SettingVal::Direction(Direction::Output),
> +            SettingVal::OutputValue(Value::new(value)?),
> +        ])?;
> +        lconfig.add_line_settings(&[offset], lsettings)?;
> +    }
> +

I'm looking at it and thinking that it would look much better as:

let settings = line::Settings::new()
    .set_direction(Direction::Output)
    .set_output_value(Value::new(value))
    .build()?;

settings would not need to be mutable (we'd have some intermediate
SettingsBuilder object?) and could be directly passed to
add_line_settings()?

We now have chained mutators for LineSettings in C++ and keyword
arguments in Python - somehow I think that the former suits rust much
better than passing an array of properties.

Bartosz
