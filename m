Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC11B600FA2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 15:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbiJQNAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 09:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbiJQNAL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 09:00:11 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5412C22BE6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:00:09 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so10907124pjb.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gSClxDthDBPaCwGQ3/sE/bJmTSOcjsUVXZg7EFssfOQ=;
        b=MXm/7SzEnhWhHF2wgXmFA8z+2zwhGc0wdTFVlFLvcRx8qYEnydVJGuokQRDmJ/axKJ
         V9Pnx7JTr291GYelHmRXk1JUsk1/hN1IfdDj/F/dyDuPnvzqYWdTjzwQQA8o/IXvButt
         swOM9OLpP+LYHeiJfEBCHSr7yFmLONUM9ChQ/U2xqvWmdO8tE19XP9UQuzpbnASm9e+c
         xlyFnq8QCsLdXA9ZzdJ6FSmzpOmU7+0idbKcV/9yXY83cNPU4XPJAKsn/SND6qZYYwOk
         YO2bMV4EcUG5RQubRkKLpGxwYP1bMfIhs63TyF4CZshpx/eKZWOM+8F7ztkUhDsj7ZpL
         ayOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSClxDthDBPaCwGQ3/sE/bJmTSOcjsUVXZg7EFssfOQ=;
        b=72EL50p0Dd4VsEcSXD/iDUW1PQWvm1hdotWeuSFJgOsRvMj1346BTNcuMZpaEh6VSZ
         v6DQmkVxhih6OUMNi3POU53zgHBljm322eDciq2jcjLbbJimMnBtUu9ajYowJCoG1ckn
         WlyoeZkPMxVM1ghDNqTfbQFexp2UbL5vy3M26/+eo707HNz/s/z/ROJA8dcnIEQrCTZ0
         pyCLUdnDQV7Llh6UyWHtlQqwVWkG8dzweewaiyogM4K29nWrQqVqvkVZ/O5eiRVK0XV9
         sunRTCBzPq7GmlHr63lr59JR3Vv/R3izYmUt2qI+7YSVVdKOC6PGq5+YUOEsYRO/9gAx
         jxXQ==
X-Gm-Message-State: ACrzQf3FcCcKW+LuVfAnv+lMQEi482n2tzMoEPVz1NsQYBlZuQH0k78+
        qFshOuK7ZjoXIGoopzzcaFc=
X-Google-Smtp-Source: AMsMyM5DThlJyR15fgxWpr/H2xV0IHhe/opzK6GLRXyHJCUYwjQ9FgW6BT8hZLfuJ1QQ/vwhrq1Uaw==
X-Received: by 2002:a17:902:e54b:b0:182:6c84:7fc9 with SMTP id n11-20020a170902e54b00b001826c847fc9mr11964167plf.91.1666011607204;
        Mon, 17 Oct 2022 06:00:07 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b00180daa59314sm6590889plh.125.2022.10.17.06.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 06:00:06 -0700 (PDT)
Date:   Mon, 17 Oct 2022 21:00:00 +0800
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
Subject: Re: [PATCH V7 4/8] libgpiod: Add rust examples
Message-ID: <Y01R0A0wrVR2Osyv@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <2d5fe872fcbf3e817cf09944494252a0e1bc8979.1665744170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d5fe872fcbf3e817cf09944494252a0e1bc8979.1665744170.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 04:17:21PM +0530, Viresh Kumar wrote:
> Add examples for the usage of the rust bindings, quite similar to the
> ones in cxx bindings.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/libgpiod/examples/gpiodetect.rs | 30 ++++++
>  bindings/rust/libgpiod/examples/gpiofind.rs   | 35 +++++++
>  bindings/rust/libgpiod/examples/gpioget.rs    | 42 ++++++++
>  bindings/rust/libgpiod/examples/gpioinfo.rs   | 95 +++++++++++++++++++
>  bindings/rust/libgpiod/examples/gpiomon.rs    | 73 ++++++++++++++
>  bindings/rust/libgpiod/examples/gpioset.rs    | 60 ++++++++++++
>  bindings/rust/libgpiod/examples/gpiowatch.rs  | 54 +++++++++++
>  7 files changed, 389 insertions(+)
>  create mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
>  create mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs
> 

Add an example that exercises the event buffer, demonstrating that its is
not possible to read new events while the previous set are still in
use.

I added something along those lines, based on gpiomon, in my mods
branch mentioned in patch 3.

If multi-threading is supported, perhaps some examples demonstrating
that as well.  Even if there are tests that already cover it - major
features should have explicit examples, not require rooting around
through the test suite.

> diff --git a/bindings/rust/libgpiod/examples/gpiodetect.rs b/bindings/rust/libgpiod/examples/gpiodetect.rs
> new file mode 100644
> index 000000000000..f24ac72e2d48
> --- /dev/null
> +++ b/bindings/rust/libgpiod/examples/gpiodetect.rs
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of gpiodetect tool.
> +
> +use std::env;
> +use std::path::Path;
> +
> +use libgpiod::{gpiochip_devices, Error, Result};
> +
> +fn main() -> Result<()> {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() > 1 {
> +        println!("Usage: {}", args[0]);
> +        return Err(Error::InvalidArguments);
> +    }
> +
> +    for chip in gpiochip_devices(&Path::new("/dev"))? {
> +        println!(
> +            "{} [{}] ({})",
> +            chip.name()?,
> +            chip.label()?,
> +            chip.num_lines(),
> +        );
> +    }
> +
> +    Ok(())
> +}
> diff --git a/bindings/rust/libgpiod/examples/gpiofind.rs b/bindings/rust/libgpiod/examples/gpiofind.rs
> new file mode 100644
> index 000000000000..07e886bc3896
> --- /dev/null
> +++ b/bindings/rust/libgpiod/examples/gpiofind.rs
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of gpiofind tool.
> +
> +use std::env;
> +use std::path::Path;
> +
> +use libgpiod::{gpiochip_devices, Error, Result};
> +
> +fn main() -> Result<()> {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() != 2 {
> +        println!("Usage: {} <line-name>", args[0]);
> +        return Err(Error::InvalidArguments);
> +    }
> +
> +    for chip in gpiochip_devices(&Path::new("/dev"))? {
> +        let offset = chip.line_offset_from_name(&args[1]);
> +        if offset.is_ok() {
> +            println!(
> +                "Line {} found: Chip: {}, offset: {}",
> +                args[1],
> +                chip.name()?,
> +                offset?
> +            );
> +            return Ok(());
> +        }
> +    }
> +
> +    println!("Failed to find line: {}", args[1]);
> +    Ok(())
> +}
> diff --git a/bindings/rust/libgpiod/examples/gpioget.rs b/bindings/rust/libgpiod/examples/gpioget.rs
> new file mode 100644
> index 000000000000..f4c111987d96
> --- /dev/null
> +++ b/bindings/rust/libgpiod/examples/gpioget.rs
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of gpioget tool.
> +
> +use std::env;
> +
> +use libgpiod::{chip::Chip, line, request, Direction, Error, Offset, Result, SettingVal};
> +
> +fn main() -> Result<()> {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() < 3 {
> +        println!("Usage: {} <chip> <line_offset0> ...", args[0]);
> +        return Err(Error::InvalidArguments);
> +    }
> +
> +    let mut lsettings = line::Settings::new()?;
> +    let lconfig = line::Config::new()?;
> +    let mut offsets = Vec::<Offset>::new();
> +
> +    for arg in &args[2..] {
> +        let offset = arg.parse::<Offset>().map_err(|_| Error::InvalidArguments)?;
> +        offsets.push(offset);
> +    }
> +
> +    lsettings.set_prop(&[SettingVal::Direction(Direction::Input)])?;

This is an example of where 

       lsettings.set_direction(Direction::Input)?;

would be simpler and clearer.

Cheers,
Kent.
