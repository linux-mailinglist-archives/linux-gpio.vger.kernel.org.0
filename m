Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3175A75A552
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 07:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjGTFEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 01:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjGTFEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 01:04:04 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D281FE1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 22:04:02 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-992af8b3b1bso74344066b.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 22:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689829441; x=1690434241;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3z+IEXGnp7SRnYpFX7/ISaT8Ii5PNDqZql+gGPItEiY=;
        b=gZP8/iVns3mWlv/+INscbwW+McVSadsxwp3Vwxpp1Yiff9z+xRALofeCkgAQ4qfnOr
         +tRS5oKnSQiJSlmQv50Yyv6bDXgYUXLZv9YLIEioR4IaWWKaOB7spptdvKlUBLz2Xv1d
         u+ZKTm27yIt7k6ntCQOG3njUEA1uQZ2MENNa7tYhq/M/3ljOOQKr+3phmfWkF8yzy3Ac
         9ouP5CqU8Pv0cCCWoV+GJDkjgcy1pdsd920x5zLlA2s9UmJw+pOE/4jRC7tZZ8ggUJzR
         7IKK/0CEG6sTwn6ttIv5AI1WjbNtdWSw9U+nzHWfm+yJzMVu8KWKB2dHEaOOvh/8NpwZ
         xGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689829441; x=1690434241;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3z+IEXGnp7SRnYpFX7/ISaT8Ii5PNDqZql+gGPItEiY=;
        b=YocqpDoDBx0TsPQocQOF07axP12D2Pveetd9jb8SfdvclAke3ciG9nLg9liO+K9aIO
         cFy8yCO5kwh+SL4Gh4r6+W6Wb/k7ETQw529OBmIN0hB7lFm2d9HDuaIE9mHDDJVw+dfz
         35ezc4wIEo+LDYNaiHAts3oF1VWGpjoRCV+ivi64jPic8A/TJeWhTDLtme4tPskNIchv
         F+BmvTFInpGQlCOw8Auk9xjCOzs/EUFRsXP3OAuSkVqE25nnxW6YJrAlzvIio+Yi5sHm
         PvQ3CaBm+ad5v4PaJoFVihERyys0pQh6TUxLseqBxRGWc6emAgNOjYPWkJ/I/oFpyQYr
         yoZA==
X-Gm-Message-State: ABy/qLbwp+jHqXkZlofgpIMrdN6hixXcPtYJFgBhp0TYX4d3uqf/KnIv
        P6Z2fFgqbzeagcD7TopqH3zGyg==
X-Google-Smtp-Source: APBJJlElXI0ct83VFOnCkgL6EXZWUl5GQg2zWR0a9IqwLZHism/AHQWt9DG7XgQ31byK31ludgcPOw==
X-Received: by 2002:a17:907:ea9:b0:992:be80:ab01 with SMTP id ho41-20020a1709070ea900b00992be80ab01mr5600683ejc.58.1689829440959;
        Wed, 19 Jul 2023 22:04:00 -0700 (PDT)
Received: from localhost (i5C7438C1.versanet.de. [92.116.56.193])
        by smtp.gmail.com with ESMTPSA id ha17-20020a170906a89100b00988b8ff849csm100989ejb.108.2023.07.19.22.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 22:04:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 20 Jul 2023 07:04:00 +0200
Message-Id: <CU6QJJUDI5D7.2GPPMGLBM6C83@fedora>
Cc:     <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 5/5] bindings: rust: provide
 LineRequest::chip_path()
X-Mailer: aerc 0.14.0
References: <20230719192057.172560-1-brgl@bgdev.pl>
 <20230719192057.172560-6-brgl@bgdev.pl>
In-Reply-To: <20230719192057.172560-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Jul 19, 2023 at 9:20 PM CEST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a wrapper around gpiod_line_request_get_chip_path() for Rust
> bindings and add a test-case.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
[...]
> diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/l=
ibgpiod/src/line_request.rs
> index 1140aa9..2caab14 100644
> --- a/bindings/rust/libgpiod/src/line_request.rs
> +++ b/bindings/rust/libgpiod/src/line_request.rs
[...]
> @@ -25,6 +26,17 @@ impl Request {
>          Ok(Self { request })
>      }
> =20
> +    pub fn chip_path(&self) -> Result<&str> {

A rustdoc comment `/// <explanation>` on the function may be helpful.
The other functions have some (though those could probably also be a
little longer...).

More importantly, _if_ this function is returning a file path, then I
would consider to return a Path [1]. The conversion from &str -> Path is
"0-cost" and makes the API more explicit. `Sim::dev_path()` also returns
a PathBuf so the conversion in the test would become a little easier.

> +        // SAFETY: The string returned by libgpiod is guaranteed to live=
 as long
> +        // as the `struct LineRequest`.
> +        let path =3D unsafe { gpiod::gpiod_line_request_get_chip_path(se=
lf.request) };

The SAFETY comment should explain why the following `unsafe` block is
safe. For this block, the lifetime of the string does not matter for
safety. Instead, it should explain why self.request is valid and safe
to use.

Maybe like this?

+        // SAFETY: The `gpiod_line_request` is guaranteed to be live as lo=
ng
+        // as `&self`


> +        // SAFETY: The string is guaranteed to be valid here by the C AP=
I.
> +        unsafe { CStr::from_ptr(path) }
> +            .to_str()
> +            .map_err(Error::StringNotUtf8)
> +    }

Here the lifetime of the string is important then! Checking the
Cstr::from_ptr doc [2], one needs to ensure that:

- The memory pointed to by ptr must contain a valid nul terminator at
  the end of the string.
- ptr must be valid for reads of bytes up to and including the null
  terminator.
- The memory referenced by the returned CStr must not be mutated for the
  duration of lifetime 'a.

The SAFETY comment should explain why these three requirements are
satisfied.

Suggestion:

+        // SAFETY: The string is guaranteed to be valid, non-null and immu=
table
+        // by the C API for the lifetime of the `gpiod_line_request`. The
+        // `gpiod_line_request` is living as long as `&self`. The string i=
s
+        // returned read-only with a lifetime of `&self`.

[1] https://doc.rust-lang.org/stable/std/path/struct.Path.html
[2] https://doc.rust-lang.org/std/ffi/struct.CStr.html#method.from_ptr

[...]

LGTM otherwise.

- Erik
