Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85CEE581DCB
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240154AbiG0C6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240121AbiG0C6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:58:23 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8423D371B3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:58:22 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so838033pjf.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EpMaBkRlooaZ1gxgV0CxN+Ks2u5aOCBaoOEH4C5rKjw=;
        b=OR/Tq4I9VkL2+3VYw9oWKZ4pg698IPd3pYVWlimSFBrqkO9qsMWVs1U2Y7GVep80Oe
         44OY6rUKXx5uKjpb7K30Rw8Bs4YnCznOvs+Ce3dLxk/5bN4mw+3rbHsJoXgIqe39EOFW
         uUzokwocMdI71hrNBxRIJ3Uz4h3bAfYVyOWhU/Z4DtYwK2BZ+DU+kNty2NAXvjXfbX3X
         /1h08si0Fz2KING72qf7Q1mvlSCvgcL+1okJhOtU0pokaCIh4mkJYfKU+U+rkhmikxbQ
         Qk3wtPngwIGxlvSrXCayLQp5BN0bTbX4/NqZNs1JA1K49M9d1gsu9a4ySYLsi7sI/VGn
         aTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EpMaBkRlooaZ1gxgV0CxN+Ks2u5aOCBaoOEH4C5rKjw=;
        b=VlBtI1HE3OfWfA6nnYrMs9/I7P9KJkweFmdX8GuXyVvWehqKGkVeXwkPdGktNkD+D7
         bZ/1GyRDxrkm0ArhQ1mjIidEBlWkxfaGoMAvavJVDg/PtCYGydw27+2Qf3p8IOHb1ob4
         nRC94brx5KTuLTDevxZHuwjkSDrG6vrDu9R6w5B+3FntEuxhTZWGD3kgWk2CCTm5aFrO
         SMb6r4138Vc5+ukn/pno2/Npl2f4wlfIaFOk1fTHdVSsXOwD3esoOrV9Ogc6RlWF5Cef
         UnlpkgKJqB3ifGdXdYG23bZrygcqAUaxQPvLKb8voE6NZX5XXeG6W9nbKpiqeF2/ZpgZ
         03Kg==
X-Gm-Message-State: AJIora8FtYvl1ebmy0QIUITsjy0FJvfe/OCOPLw43PRh1n9UL4AtGVdh
        /JX3tyhOv2E7F8Fcr/KvjzrJzbx2H08=
X-Google-Smtp-Source: AGRyM1scBPEZYvMe3PaDju86+ZypMp0b2r3rd7tFn0WR3SpzOUz87C91i+WR+7MS0+S+bLA8s6R8uQ==
X-Received: by 2002:a17:903:124e:b0:16b:e975:232f with SMTP id u14-20020a170903124e00b0016be975232fmr18599507plh.165.1658890701846;
        Tue, 26 Jul 2022 19:58:21 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id o6-20020a170902bcc600b0016d1c771031sm12248461pls.242.2022.07.26.19.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 19:58:21 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:58:15 +0800
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
Subject: Re: [PATCH V4 5/8] libgpiod: Add rust examples
Message-ID: <20220727025815.GE88787@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:04:58PM +0530, Viresh Kumar wrote:
> Add examples for the usage of the rust bindings, quite similar to the
> ones in cxx bindings.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/examples/gpiodetect.rs | 37 ++++++++++++
>  bindings/rust/examples/gpiofind.rs   | 42 +++++++++++++
>  bindings/rust/examples/gpioget.rs    | 42 +++++++++++++
>  bindings/rust/examples/gpioinfo.rs   | 89 ++++++++++++++++++++++++++++
>  bindings/rust/examples/gpiomon.rs    | 68 +++++++++++++++++++++
>  bindings/rust/examples/gpioset.rs    | 52 ++++++++++++++++
>  6 files changed, 330 insertions(+)
>  create mode 100644 bindings/rust/examples/gpiodetect.rs
>  create mode 100644 bindings/rust/examples/gpiofind.rs
>  create mode 100644 bindings/rust/examples/gpioget.rs
>  create mode 100644 bindings/rust/examples/gpioinfo.rs
>  create mode 100644 bindings/rust/examples/gpiomon.rs
>  create mode 100644 bindings/rust/examples/gpioset.rs
> 
> diff --git a/bindings/rust/examples/gpiodetect.rs b/bindings/rust/examples/gpiodetect.rs
> new file mode 100644
> index 000000000000..82307e4eecea
> --- /dev/null
> +++ b/bindings/rust/examples/gpiodetect.rs
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of gpiodetect tool.
> +
> +use std::env;
> +use std::fs;
> +use std::path::Path;
> +
> +use libgpiod::{gpiod_is_gpiochip_device, Chip};
> +
> +fn main() {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() > 1 {
> +        println!("Usage: {}", args[0]);
> +        return;
> +    }
> +
> +    for entry in fs::read_dir(Path::new("/dev")).unwrap() {

use .flatten() to have the iterator unwrap the entry so it is actually
an entry, not a Result.

> +        let pathbuf = entry.unwrap().path();
> +        let path = pathbuf.to_str().unwrap();
> +

is_gpiochip_device() and Chip::open() (and ChipInternal) should accept
anything that can be converted into a &Path, e.g. a PathBuf, so the path
variable becomes redundant.

e.g. 
    pub(crate) fn open<P: AsRef<std::path::Path>>(path: &P) -> Result<Self> {
        // Null-terminate the string
        let path = path.as_ref().to_string_lossy() + "\0";
        ...

and then example code becomes:

    for entry in fs::read_dir(Path::new("/dev")).unwrap().flatten() {
        let path = entry.path();

        if gpiod_is_gpiochip_device(&path) {
            let chip = Chip::open(&path).unwrap();
            ...

(renaming pathbuf to path)

Similarly other examples.

> +        if gpiod_is_gpiochip_device(path) {
> +            let chip = Chip::open(path).unwrap();
> +            let ngpio = chip.get_num_lines();
> +

Why does ngpio get a variable, unlike name and label?

> +            println!(
> +                "{} [{}] ({})",
> +                chip.get_name().unwrap(),
> +                chip.get_label().unwrap(),
> +                ngpio
> +            );
> +        }
> +    }
> +}

Avoid using unwrap().  Have main return a Result and use ?.
Not so important here, but below for helper functions returning
Results allows the caller to determine how to handle the error.
And it reads better.

> diff --git a/bindings/rust/examples/gpiofind.rs b/bindings/rust/examples/gpiofind.rs
> new file mode 100644
> index 000000000000..bbbd7a87ece8
> --- /dev/null
> +++ b/bindings/rust/examples/gpiofind.rs
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of gpiofind tool.
> +
> +use std::env;
> +use std::fs;
> +use std::path::Path;
> +
> +use libgpiod::{gpiod_is_gpiochip_device, Chip};
> +
> +fn main() {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() != 2 {
> +        println!("Usage: {} <line-name>", args[0]);
> +        return;
> +    }
> +
> +    for entry in fs::read_dir(Path::new("/dev")).unwrap() {
> +        let pathbuf = entry.unwrap().path();
> +        let path = pathbuf.to_str().unwrap();
> +
> +        if gpiod_is_gpiochip_device(path) {

Perhaps have the bindings provide an iterator that returns the paths of
available gpiochips?

> +            let chip = Chip::open(path).unwrap();
> +
> +            let offset = chip.find_line(&args[1]);
> +            if offset.is_ok() {
> +                println!(
> +                    "Line {} found: Chip: {}, offset: {}",
> +                    args[1],
> +                    chip.get_name().unwrap(),
> +                    offset.unwrap()
> +                );
> +                return;
> +            }
> +        }
> +    }
> +
> +    println!("Failed to find line: {}", args[1]);
> +}
> diff --git a/bindings/rust/examples/gpioget.rs b/bindings/rust/examples/gpioget.rs
> new file mode 100644
> index 000000000000..c3bc35fcfdb6
> --- /dev/null
> +++ b/bindings/rust/examples/gpioget.rs
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
> +use libgpiod::{Chip, Direction, LineConfig, RequestConfig};
> +
> +fn main() {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() < 3 {
> +        println!("Usage: {} <chip> <line_offset0> ...", args[0]);
> +        return;
> +    }
> +
> +    let mut config = LineConfig::new().unwrap();
> +    let mut offsets = Vec::<u32>::new();
> +
> +    for arg in &args[2..] {
> +        let offset = arg.parse::<u32>().unwrap();
> +
> +        offsets.push(offset);
> +        config.set_direction_override(Direction::Input, offset);
> +    }
> +
> +    let path = format!("/dev/gpiochip{}", args[1]);
> +    let chip = Chip::open(&path).unwrap();
> +
> +    let rconfig = RequestConfig::new().unwrap();
> +    rconfig.set_consumer(&args[0]);
> +    rconfig.set_offsets(&offsets);
> +
> +    let request = chip.request_lines(&rconfig, &config).unwrap();
> +
> +    let mut values: Vec<i32> = vec![0; offsets.len()];
> +    request.get_values(&mut values).unwrap();
> +
> +    println!("{:?}", values);
> +}
> diff --git a/bindings/rust/examples/gpioinfo.rs b/bindings/rust/examples/gpioinfo.rs
> new file mode 100644
> index 000000000000..bd30d9096ce8
> --- /dev/null
> +++ b/bindings/rust/examples/gpioinfo.rs
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of gpioinfo tool.
> +
> +use std::env;
> +use std::fs;
> +use std::path::Path;
> +
> +use libgpiod::{gpiod_is_gpiochip_device, Chip, Direction};
> +
> +fn line_info(chip: &Chip, offset: u32) {
> +    let info = chip.line_info(offset).unwrap();
> +    let off = info.get_offset();
> +
> +    let name = match info.get_name() {
> +        Ok(name) => name,
> +        _ => "unused",
> +    };
> +
> +    let consumer = match info.get_consumer() {
> +        Ok(name) => name,
> +        _ => "unnamed",
> +    };
> +
> +    let low = if info.is_active_low() {
> +        "active-low"
> +    } else {
> +        "active-high"
> +    };
> +
> +    let dir = match info.get_direction().unwrap() {
> +        Direction::AsIs => "None",
> +        Direction::Input => "Input",
> +        Direction::Output => "Output",
> +    };
> +
> +    println!(
> +        "\tline {:>3}\
> +              \t{:>10}\
> +              \t{:>10}\
> +              \t{:>6}\
> +              \t{:>14}",
> +        off, name, consumer, dir, low
> +    );
> +}
> +
> +fn chip_info(path: &str) {
> +    if gpiod_is_gpiochip_device(path) {
> +        let chip = Chip::open(path).unwrap();
> +        let ngpio = chip.get_num_lines();
> +
> +        println!("GPIO Chip name: {}", chip.get_name().unwrap());
> +        println!("\tlabel: {}", chip.get_label().unwrap());
> +        println!("\tpath: {}", chip.get_path().unwrap());
> +        println!("\tngpio: {}\n", ngpio);
> +
> +        println!("\tLine information:");
> +
> +        for offset in 0..ngpio {
> +            line_info(&chip, offset);
> +        }
> +        println!("\n");
> +    }
> +}
> +
> +fn main() {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() > 2 {
> +        println!("Usage: {}", args[0]);
> +        return;
> +    }
> +
> +    if args.len() == 1 {
> +        for entry in fs::read_dir(Path::new("/dev")).unwrap() {
> +            let pathbuf = entry.unwrap().path();
> +            let path = pathbuf.to_str().unwrap();
> +
> +            chip_info(path);
> +        }
> +    } else {
> +        let index = args[1].parse::<u32>().unwrap();
> +        let path = format!("/dev/gpiochip{}", index);
> +
> +        chip_info(&path);
> +    }
> +}
> diff --git a/bindings/rust/examples/gpiomon.rs b/bindings/rust/examples/gpiomon.rs
> new file mode 100644
> index 000000000000..872907b386f3
> --- /dev/null
> +++ b/bindings/rust/examples/gpiomon.rs
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of the gpiomon tool.
> +
> +use std::env;
> +use std::time::Duration;
> +
> +use libgpiod::{Chip, Edge, EdgeEventBuffer, Error, LineConfig, LineEdgeEvent, RequestConfig};
> +
> +fn usage(name: &str) {
> +    println!("Usage: {} <chip> <offset0> ...", name);
> +}
> +
> +fn main() {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() < 3 {
> +        usage(&args[0]);
> +        return;
> +    }
> +
> +    let mut config = LineConfig::new().unwrap();
> +    let mut offsets = Vec::<u32>::new();
> +
> +    for arg in &args[2..] {
> +        let offset = arg.parse::<u32>().unwrap();
> +
> +        offsets.push(offset);
> +    }
> +
> +    config.set_edge_detection_default(Edge::Both);
> +
> +    let path = format!("/dev/gpiochip{}", args[1]);
> +    let chip = Chip::open(&path).unwrap();
> +
> +    let rconfig = RequestConfig::new().unwrap();
> +    rconfig.set_offsets(&offsets);
> +
> +    let buffer = EdgeEventBuffer::new(1).unwrap();
> +    let request = chip.request_lines(&rconfig, &config).unwrap();
> +
> +    loop {
> +        match request.wait_edge_event(Duration::new(1, 0)) {
> +            Err(Error::OperationTimedOut) => continue,

timeout/continue required as you can't (currently) block indefinitely?

> +            Err(x) => {
> +                println!("{:?}", x);
> +                return;
> +            }
> +            Ok(()) => (),
> +        }
> +
> +        let count = request.read_edge_event(&buffer, 1).unwrap();
> +        if count == 1 {
> +            let event = buffer.get_event(0).unwrap();
> +            println!(
> +                "line: {} type: {}, time: {:?}",
> +                event.get_line_offset(),
> +                match event.get_event_type().unwrap() {
> +                    LineEdgeEvent::Rising => "Rising",
> +                    LineEdgeEvent::Falling => "Falling",
> +                },
> +                event.get_timestamp()
> +            );
> +        }
> +    }
> +}
> diff --git a/bindings/rust/examples/gpioset.rs b/bindings/rust/examples/gpioset.rs
> new file mode 100644
> index 000000000000..ef70e8edbaae
> --- /dev/null
> +++ b/bindings/rust/examples/gpioset.rs
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +//
> +// Simplified Rust implementation of the gpioset tool.
> +
> +use std::env;
> +
> +use libgpiod::{Chip, Direction, LineConfig, RequestConfig};
> +
> +fn usage(name: &str) {
> +    println!("Usage: {} <chip> <line_offset0>=<value0> ...", name);
> +}
> +
> +fn main() {
> +    let args: Vec<String> = env::args().collect();
> +    if args.len() < 3 {
> +        usage(&args[0]);
> +        return;
> +    }
> +
> +    let mut config = LineConfig::new().unwrap();
> +    let mut offsets = Vec::<u32>::new();
> +    let mut values = Vec::<i32>::new();
> +
> +    for arg in &args[2..] {
> +        let pair: Vec<&str> = arg.split('=').collect();
> +        if pair.len() != 2 {
> +            usage(&args[0]);
> +            return;
> +        }
> +
> +        let offset = pair[0].parse::<u32>().unwrap();
> +        let value = pair[1].parse::<u32>().unwrap();
> +
> +        offsets.push(offset);
> +        values.push(value as i32);
> +    }
> +
> +    config.set_direction_default(Direction::Output);
> +    config.set_output_values(&offsets, &values).unwrap();
> +
> +    let path = format!("/dev/gpiochip{}", args[1]);
> +    let chip = Chip::open(&path).unwrap();
> +
> +    let rconfig = RequestConfig::new().unwrap();
> +    rconfig.set_consumer(&args[0]);
> +    rconfig.set_offsets(&offsets);
> +
> +    chip.request_lines(&rconfig, &config).unwrap();

Wait rather than exiting immediately?

> +}
> -- 
> 2.31.1.272.g89b43f80a514
> 

And, as mentioned elsewhere, add a gpiowatch example.

Cheers,
Kent.
