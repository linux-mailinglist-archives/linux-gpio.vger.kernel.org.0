Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70AFC61638E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Nov 2022 14:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbiKBNPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Nov 2022 09:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbiKBNPC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Nov 2022 09:15:02 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F2B1DA5F
        for <linux-gpio@vger.kernel.org>; Wed,  2 Nov 2022 06:15:00 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id u6so16524068plq.12
        for <linux-gpio@vger.kernel.org>; Wed, 02 Nov 2022 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C/kZvdRxAUH0GsTm0Ljg66O60LqmbOB14hLZgE6D6mQ=;
        b=A5nJBvY+F+9i+0Pl7xYlMpouklbsSQ0KJBPad+JpmWp/n8TN7u3EzmH6zvrDb+jPyi
         fs4Aa+wVQlJzxcAXkWysyz1T4Y38fezs3kUDZU/meezthtitSQ8QSOW/Ku+opNpbP+4s
         DdfOgH3KUaQb5vb1iIIwC7HljcvqPPXh5I5QZl6CiMWt/opKRK09JWlHjxV9wQJjwgV5
         XYi+yRXG9zWOZUU6SniiUruYPQWzc2WkihSpJqqZhR2orxuh+5JdNlo5lF7QGEjqoVbl
         UlTHHe4F87Csier41b4sloLf2DcBtr7i85XnasHRmYIVSRsk3Lcp3FgFCJB2Cve0ofyM
         rFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/kZvdRxAUH0GsTm0Ljg66O60LqmbOB14hLZgE6D6mQ=;
        b=tDmVctdba3N9QGcU4HlAeWnMhq0Cgags2pShpOWIpKO25obLUOh2nm8q+yjf7dM+if
         Kb1gDGFP00pQ+BJ1lL4QbjUexH9jdc7ZcqPOdG0Wv7Xfc8vtT27bsMz+Szhber7qXzEW
         yuKOo4+LbPLvyCgClECbfs2pEzSxbI1IPyxAbbZVDa8aDCTT/+H6Z6BPRh3heHZw+lBm
         5gdzIwUfOl165JF/BWPmvxB5v6L8/05bCG4kt0VX2QdEx9YeV2cTWNkn2ma0Vt79gRtF
         JzM3xvt7ge0CvzI4OgrzhXNwIoFs52mc6n1HB0R40V80+KNe3Imw+AEKfErtlAZH73hc
         Tkfw==
X-Gm-Message-State: ACrzQf0Djv6gBXImsHmAMKxaidBMBtkxtevzcAMiB3EEo7/RsTxKhmA2
        cx5WbtVC9wwm2musnhXmy2c=
X-Google-Smtp-Source: AMsMyM5IWxHkhViKeTL5DC5BQ80O4IkkVplaGNodhce41sYgPLfNWN078Oarhk1iIvpeDFy4XyhwsA==
X-Received: by 2002:a17:902:8643:b0:187:3f0b:a4d7 with SMTP id y3-20020a170902864300b001873f0ba4d7mr6212471plt.15.1667394899908;
        Wed, 02 Nov 2022 06:14:59 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090a088800b002071ee97923sm1409191pjc.53.2022.11.02.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 06:14:59 -0700 (PDT)
Date:   Wed, 2 Nov 2022 21:14:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod v2][PATCH V8 5/9] bindings: rust: Add libgpiod crate
Message-ID: <Y2JtSw+laG5lgCUl@sol>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <08d4095c314caf50430c2eaa733d925122242b12.1667215380.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08d4095c314caf50430c2eaa733d925122242b12.1667215380.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 31, 2022 at 05:17:13PM +0530, Viresh Kumar wrote:
> Add rust wrapper crate, around the libpiod-sys crate added earlier, to
> provide a convenient interface for the users.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/Cargo.toml                     |   1 +
>  bindings/rust/libgpiod/Cargo.toml            |  20 +
>  bindings/rust/libgpiod/src/chip.rs           | 317 ++++++++++++
>  bindings/rust/libgpiod/src/edge_event.rs     | 128 +++++
>  bindings/rust/libgpiod/src/event_buffer.rs   | 102 ++++
>  bindings/rust/libgpiod/src/info_event.rs     |  69 +++
>  bindings/rust/libgpiod/src/lib.rs            | 478 +++++++++++++++++++
>  bindings/rust/libgpiod/src/line_config.rs    | 135 ++++++
>  bindings/rust/libgpiod/src/line_info.rs      | 162 +++++++
>  bindings/rust/libgpiod/src/line_request.rs   | 224 +++++++++
>  bindings/rust/libgpiod/src/line_settings.rs  | 297 ++++++++++++
>  bindings/rust/libgpiod/src/request_config.rs |  95 ++++
>  12 files changed, 2028 insertions(+)
>  create mode 100644 bindings/rust/libgpiod/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod/src/chip.rs
>  create mode 100644 bindings/rust/libgpiod/src/edge_event.rs
>  create mode 100644 bindings/rust/libgpiod/src/event_buffer.rs
>  create mode 100644 bindings/rust/libgpiod/src/info_event.rs
>  create mode 100644 bindings/rust/libgpiod/src/lib.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_config.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_info.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_request.rs
>  create mode 100644 bindings/rust/libgpiod/src/line_settings.rs
>  create mode 100644 bindings/rust/libgpiod/src/request_config.rs
> 
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> index b9eea6b3a5ea..4fdf4e06ff90 100644
> --- a/bindings/rust/Cargo.toml
> +++ b/bindings/rust/Cargo.toml
> @@ -2,5 +2,6 @@
>  
>  members = [
>      "gpiosim",
> +    "libgpiod",
>      "libgpiod-sys"
>  ]
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> new file mode 100644
> index 000000000000..ef52fdc198d7
> --- /dev/null
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -0,0 +1,20 @@
> +[package]
> +name = "libgpiod"
> +version = "0.1.0"
> +authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
> +description = "libgpiod wrappers"
> +repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
> +categories = ["command-line-utilities", "os::linux-apis"]

The command line utilities being the examples?
That is a bit of a stretch.

How about "api-bindings", and maybe "hardware-support" and "embedded"?

> +rust-version = "1.56"
> +keywords = ["libgpiod", "gpio"]
> +license = "Apache-2.0 OR BSD-3-Clause"
> +edition = "2021"
> +
> +# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
> +

That link is put there by cargo for YOU.
When you are satisfied with your keys you can delete it.

< --8<-- >

> +    /// Get the file descriptor associated with the chip.
> +    ///
> +    /// The returned file descriptor must not be closed by the caller, else other methods for the
> +    /// `struct Chip` may fail.
> +    pub fn fd(&self) -> Result<u32> {
> +        // SAFETY: `gpiod_chip` is guaranteed to be valid here.
> +        let fd = unsafe { gpiod::gpiod_chip_get_fd(self.ichip.chip) };
> +
> +        if fd < 0 {
> +            Err(Error::OperationFailed(
> +                OperationType::ChipGetFd,
> +                errno::errno(),
> +            ))
> +        } else {
> +            Ok(fd as u32)
> +        }
> +    }

Impl AsRawFd, as per Request.

< --8<-- >

> +/// Line info
> +///
> +/// Exposes functions for retrieving kernel information about both requested and
> +/// free lines.  Line info object contains an immutable snapshot of a line's status.
> +///
> +/// The line info contains all the publicly available information about a
> +/// line, which does not include the line value.  The line must be requested
> +/// to access the line value.
> +
> +#[derive(Debug, Eq, PartialEq)]
> +pub struct Info {
> +    info: *mut gpiod::gpiod_line_info,
> +    from_event: bool,
> +}

The "from_event" flag indicates if the info needs to be freed, or not,
when the Info is dropped, so call it something that indicates that, like
"contained".


Admittedly I'm only skimming this one compared to my v7 review,
but only minor knits that could always be picked up later.

Cheers,
Kent.
