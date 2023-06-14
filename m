Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734F272F6FB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 09:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243555AbjFNHxi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 03:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243466AbjFNHxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 03:53:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE291BC5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 00:52:23 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-518b69d5b5dso338519a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686729142; x=1689321142;
        h=in-reply-to:references:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6+0Vv4ricdMlj4eD4upSJwROA0gAFrfajSPy6DM+fU=;
        b=yagH8tTDGR0p1QYuSoNTt1mVVroVik6PjkL5mxEUOX9t7jLVEjrG9MYZ6UpRKpHHS0
         xtbFmxu/kPP4eiQRtsFs21ouU4FRjdZqY7rhzerl9MpqxC90qqgoTfj4Pq4kY3UBYDyL
         tand+XkJgV4YMS2f8LIqV0O8Up3COdKlcR53bKzggiIzNvBrKHlHV7Ih4k1Pp23y18lk
         fXABwLzzBu52jY66mIFt2K/1hf+QYQxhRf1HsleQrfsPs1x6f3o6cJidxF6EHhNa3PT3
         uzEi6QqW2QtAqndSyTwphNlGkZxzZiTOft8pKhYHnET9ZMvZa5XaBztK8SPUi+MCogz7
         C+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686729142; x=1689321142;
        h=in-reply-to:references:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b6+0Vv4ricdMlj4eD4upSJwROA0gAFrfajSPy6DM+fU=;
        b=W2/zvMak4FAsGmr4RsaUrKFKJqfxShCaq13Q3eQCmjRTnx8UsFa6dFx75v0nzbXRMP
         Y8UZ+cSmZt4nL/LWQbnV+2n8wctYw4PzMR3wCCnDEyWMH9mkEFw+BniMA1cjxo0YohQk
         rLJ8WdVgD6hrjCPKg8MkPrHyPpfLZRlBMqZGfQAq8/Gt/IC9L/S4cGTq+QkPlY6FMs3A
         ST2Lj4wV7CGb2HFPVQuP9gBzlMXBhTHD94UnewbuUetSgT6NsM1KoVYgs50GyIvo3e/r
         MvpmuFsXEZvbljTEHNF7LzDLYzKF+teScFFM/AHNaM+UcDdGURai8E/U842AKGnzkWxu
         EjtQ==
X-Gm-Message-State: AC+VfDzp9hyWx6YTLwWYOBICj4vSEP+rpaEkD/FFQTzp9DMZ/ekjxz0A
        e/GWfKE9fZQADHvXRtG6jX0I3Obe3u4VTmzr4l0=
X-Google-Smtp-Source: ACHHUZ4/tlZ+OiW8MhMY+mASw6seH/mKXtyTG/Zs3Q+yoUEFzONEcjPrEVT67athydP00+PBGiomxw==
X-Received: by 2002:a17:907:3607:b0:8b1:7de3:cfaa with SMTP id bk7-20020a170907360700b008b17de3cfaamr14213709ejc.3.1686729141742;
        Wed, 14 Jun 2023 00:52:21 -0700 (PDT)
Received: from localhost (i5C740811.versanet.de. [92.116.8.17])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c489000000b0051422f31b1bsm7281801edq.63.2023.06.14.00.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 00:52:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 14 Jun 2023 09:52:20 +0200
Message-Id: <CTC7KTWRXMS4.1G8UBSCYLSMIT@fedora>
To:     "Kent Gibson" <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>,
        <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 4/4] bindings: rust: examples: add dedicated
 examples
X-Mailer: aerc 0.14.0
References: <20230614035426.15097-1-warthog618@gmail.com>
 <20230614035426.15097-5-warthog618@gmail.com>
In-Reply-To: <20230614035426.15097-5-warthog618@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Jun 14, 2023 at 5:54 AM CEST, Kent Gibson wrote:
> Add rust equivalents of the core examples.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>

Some nit-picks below, but those are a matter of taste and the change
looks ok either way.

> ---
>  .../rust/libgpiod/examples/get_line_value.rs  | 28 +++++++++++
>  .../libgpiod/examples/toggle_line_value.rs    | 43 ++++++++++++++++
>  .../libgpiod/examples/watch_line_value.rs     | 50 +++++++++++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 bindings/rust/libgpiod/examples/get_line_value.rs
>  create mode 100644 bindings/rust/libgpiod/examples/toggle_line_value.rs
>  create mode 100644 bindings/rust/libgpiod/examples/watch_line_value.rs
>
> diff --git a/bindings/rust/libgpiod/examples/get_line_value.rs b/bindings=
/rust/libgpiod/examples/get_line_value.rs
> new file mode 100644
> index 0000000..732fb71
> --- /dev/null
> +++ b/bindings/rust/libgpiod/examples/get_line_value.rs
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> +// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +//
> +// Minimal example of reading a single line.
> +
> +use libgpiod::line;

I think one could also just import the other used modules. Or, since
this is an example anyway, just `use libgpiod::*`.

> +
> +fn main() -> libgpiod::Result<()> {
> +    // example configuration - customize to suit your situation
> +    let chip_path =3D "/dev/gpiochip0";
> +    let line_offset =3D 5;
> +
> +    let mut lsettings =3D line::Settings::new()?;

I think `line_settings` would still be an okish length (same below) :).

> +    lsettings.set_direction(line::Direction::Input)?;
> +
> +    let mut lconfig =3D line::Config::new()?;
> +    lconfig.add_line_settings(&[line_offset], lsettings)?;
> +
> +    let mut rconfig =3D libgpiod::request::Config::new()?;
> +    rconfig.set_consumer("get-line-value")?;
> +
> +    let chip =3D libgpiod::chip::Chip::open(&chip_path)?;
> +    let request =3D chip.request_lines(Some(&rconfig), &lconfig)?;
> +
> +    let value =3D request.value(line_offset)?;
> +    println!("{:?}", value);

Could also be:
+    println!("{value:?}");
(same below)

> +    Ok(())
> +}
> diff --git a/bindings/rust/libgpiod/examples/toggle_line_value.rs b/bindi=
ngs/rust/libgpiod/examples/toggle_line_value.rs
> new file mode 100644
> index 0000000..cd7038e
> --- /dev/null
> +++ b/bindings/rust/libgpiod/examples/toggle_line_value.rs
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> +// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +//
> +// Minimal example of toggling a single line.
> +
> +use libgpiod::line;
> +use std::time::Duration;
> +
> +fn toggle_value(value: line::Value) -> line::Value {
> +    match value {
> +        line::Value::Active =3D> line::Value::InActive,
> +        line::Value::InActive =3D> line::Value::Active,
> +    }
> +}
> +
> +fn main() -> libgpiod::Result<()> {
> +    // example configuration - customize to suit your situation
> +    let chip_path =3D "/dev/gpiochip0";
> +    let line_offset =3D 5;
> +
> +    let mut value =3D line::Value::Active;
> +
> +    let mut settings =3D line::Settings::new()?;
> +    settings
> +        .set_direction(line::Direction::Output)?
> +        .set_output_value(value)?;
> +
> +    let mut lconfig =3D line::Config::new()?;
> +    lconfig.add_line_settings(&[line_offset], settings)?;
> +
> +    let mut rconfig =3D libgpiod::request::Config::new()?;
> +    rconfig.set_consumer("toggle-line-value")?;
> +
> +    let chip =3D libgpiod::chip::Chip::open(&chip_path)?;
> +    let mut req =3D chip.request_lines(Some(&rconfig), &lconfig)?;
> +
> +    loop {
> +        println!("{:?}", value);
> +        std::thread::sleep(Duration::from_secs(1));
> +        value =3D toggle_value(value);
> +        req.set_value(line_offset, value)?;
> +    }
> +}
> diff --git a/bindings/rust/libgpiod/examples/watch_line_value.rs b/bindin=
gs/rust/libgpiod/examples/watch_line_value.rs
> new file mode 100644
> index 0000000..5a95b6a
> --- /dev/null
> +++ b/bindings/rust/libgpiod/examples/watch_line_value.rs
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
> +// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> +//
> +// Minimal example of watching for edges on a single line.
> +
> +use libgpiod::line;
> +use std::time::Duration;
> +
> +fn main() -> libgpiod::Result<()> {
> +    // example configuration - customize to suit your situation
> +    let chip_path =3D "/dev/gpiochip0";
> +    let line_offset =3D 5;
> +
> +    let mut lsettings =3D line::Settings::new()?;
> +    // assume a button connecting the pin to ground,
> +    // so pull it up and provide some debounce.
> +    lsettings
> +        .set_edge_detection(Some(line::Edge::Both))?
> +        .set_bias(Some(line::Bias::PullUp))?
> +        .set_debounce_period(Duration::from_millis(10));
> +
> +    let mut lconfig =3D line::Config::new()?;
> +    lconfig.add_line_settings(&[line_offset], lsettings)?;
> +
> +    let mut rconfig =3D libgpiod::request::Config::new()?;
> +    rconfig.set_consumer("watch-line-value")?;
> +
> +    let chip =3D libgpiod::chip::Chip::open(&chip_path)?;
> +    let request =3D chip.request_lines(Some(&rconfig), &lconfig)?;
> +
> +    // a larger buffer is an optimisation for reading bursts of events f=
rom the
> +    // kernel, but that is not necessary in this case, so 1 is fine.
> +    let mut buffer =3D libgpiod::request::Buffer::new(1)?;
> +    loop {
> +        // blocks until at least one event is available
> +        let events =3D request.read_edge_events(&mut buffer)?;
> +        for event in events {
> +            let event =3D event?;
> +            println!(
> +                "line: {}, type: {}, event #{}",
> +                event.line_offset(),
> +                match event.event_type()? {
> +                    line::EdgeKind::Rising =3D> "Rising ",
> +                    line::EdgeKind::Falling =3D> "Falling",
> +                },
> +                event.line_seqno()
> +            );

println!("{: <8}") could also be used to pad things (would allow
removing the trailing space).

> +        }
> +    }
> +}
> --=20
> 2.40.1

- Erik
