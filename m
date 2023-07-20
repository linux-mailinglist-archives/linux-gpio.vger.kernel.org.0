Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C95DC75A898
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 10:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGTIEU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 04:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjGTIEU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 04:04:20 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0540A135
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:04:19 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-4716e4adb14so224086e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689840258; x=1690445058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9QMk27wP0xhG140bZcOkv9eC9yKfi0qeZCV9QjAi9w=;
        b=wE6E81vxojE0+wIJzgEe7NQv+X56XUXENNubPgu1rQqfTHpSZuU/FB+ATNn+WryZN/
         YbD033Xm5KOC3YZLPdeKNt2OVXVitW3KKklo4Fy95IoOHITlqfam/9Y8k1U8df9hn3qI
         fP/5ZzR6MaLYPoa+gio8H5HKq6IYV0w/QikP5w99JQ19uYNquvJPYNpdsmWzd1agxvrV
         8mFqKdrLknFMEJkapx2DeaZqewhVDHF3qP8kd5lFvoz4+1a6zE4G5JIRkC42histMUvh
         eQFdeu7YiCBely7gcMEL3w8X2AIiFUwn+ovVs+QQ4dnVALoZYSp377sGzhugaPV96lJQ
         1iSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689840258; x=1690445058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9QMk27wP0xhG140bZcOkv9eC9yKfi0qeZCV9QjAi9w=;
        b=JoRnHc63PpdchXoQJ4dC9WVhiZrI+znClK2hAiu6CumOeg89tbd83NIKjp31BkOZPm
         ma9xyrHBFSMtHMsqpVojtMcfw6/4gm1Zh6WQGr0xturU8tAkKxDtN48iWEr0MqzIbsaq
         C2lQxpardbDD4YO2kS98Gc4MpwLyvqy8di4SGaIDZ8XEuj76S6Xe7EM3twVFREId8for
         upTHXZN0dkXi9Z7H00JVZ7uag0bo4s9tF3mxk1c19aHgbPZf4iaz1aLqSeeMIb32PD+F
         IN5VQceMeAeVPKFi6m/M/2aREvf5QKJcuOWt714gttURUVPGM9oNPJ0kaQi8sHHTqj3Z
         2BxQ==
X-Gm-Message-State: ABy/qLYw1Bgfxx0fQsaHwNc02KW+HD+jBhdFjfWch9fNYDDMlQ5br0RT
        lO7jORzZ5G9Ycr/z3lPqiX0ixJAoMURtCRZM7SFG1Q==
X-Google-Smtp-Source: APBJJlHchyWNLOjpCMd5SUZQnK7LZf7Wre1QcSlDMwF6FkbnbYRY/UZ/sOaftMEcg4Ct6Oc7JugPjaFFrdpVEBm/xCs=
X-Received: by 2002:a1f:dd05:0:b0:481:2f82:fd58 with SMTP id
 u5-20020a1fdd05000000b004812f82fd58mr4832633vkg.2.1689840258066; Thu, 20 Jul
 2023 01:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230719192057.172560-1-brgl@bgdev.pl> <20230719192057.172560-6-brgl@bgdev.pl>
 <CU6QJJUDI5D7.2GPPMGLBM6C83@fedora>
In-Reply-To: <CU6QJJUDI5D7.2GPPMGLBM6C83@fedora>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 10:04:07 +0200
Message-ID: <CAMRc=McrhxwASt8WJ0dOrEa1NPnhtOVkNBXuiK1ejiS5P37JgA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 5/5] bindings: rust: provide LineRequest::chip_path()
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 7:04=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Wed Jul 19, 2023 at 9:20 PM CEST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Provide a wrapper around gpiod_line_request_get_chip_path() for Rust
> > bindings and add a test-case.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> [...]
> > diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust=
/libgpiod/src/line_request.rs
> > index 1140aa9..2caab14 100644
> > --- a/bindings/rust/libgpiod/src/line_request.rs
> > +++ b/bindings/rust/libgpiod/src/line_request.rs
> [...]
> > @@ -25,6 +26,17 @@ impl Request {
> >          Ok(Self { request })
> >      }
> >
> > +    pub fn chip_path(&self) -> Result<&str> {
>
> A rustdoc comment `/// <explanation>` on the function may be helpful.
> The other functions have some (though those could probably also be a
> little longer...).
>
> More importantly, _if_ this function is returning a file path, then I
> would consider to return a Path [1]. The conversion from &str -> Path is
> "0-cost" and makes the API more explicit. `Sim::dev_path()` also returns
> a PathBuf so the conversion in the test would become a little easier.
>

I wanted to stay in line with chip's path() getter which also returns
Result<&str>. As you're saying - the user can convert it at 0 cost if
needed.

Bart

> > +        // SAFETY: The string returned by libgpiod is guaranteed to li=
ve as long
> > +        // as the `struct LineRequest`.
> > +        let path =3D unsafe { gpiod::gpiod_line_request_get_chip_path(=
self.request) };
>
> The SAFETY comment should explain why the following `unsafe` block is
> safe. For this block, the lifetime of the string does not matter for
> safety. Instead, it should explain why self.request is valid and safe
> to use.
>
> Maybe like this?
>
> +        // SAFETY: The `gpiod_line_request` is guaranteed to be live as =
long
> +        // as `&self`
>
>
> > +        // SAFETY: The string is guaranteed to be valid here by the C =
API.
> > +        unsafe { CStr::from_ptr(path) }
> > +            .to_str()
> > +            .map_err(Error::StringNotUtf8)
> > +    }
>
> Here the lifetime of the string is important then! Checking the
> Cstr::from_ptr doc [2], one needs to ensure that:
>
> - The memory pointed to by ptr must contain a valid nul terminator at
>   the end of the string.
> - ptr must be valid for reads of bytes up to and including the null
>   terminator.
> - The memory referenced by the returned CStr must not be mutated for the
>   duration of lifetime 'a.
>
> The SAFETY comment should explain why these three requirements are
> satisfied.
>
> Suggestion:
>
> +        // SAFETY: The string is guaranteed to be valid, non-null and im=
mutable
> +        // by the C API for the lifetime of the `gpiod_line_request`. Th=
e
> +        // `gpiod_line_request` is living as long as `&self`. The string=
 is
> +        // returned read-only with a lifetime of `&self`.
>

I'll take the suggestions verbatim, thanks!

Bart

> [1] https://doc.rust-lang.org/stable/std/path/struct.Path.html
> [2] https://doc.rust-lang.org/std/ffi/struct.CStr.html#method.from_ptr
>
> [...]
>
> LGTM otherwise.
>
> - Erik
