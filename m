Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF89622646
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbiKIJIS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbiKIJHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:07:23 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF6D20BC0
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:07:21 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id c31so5333706uae.10
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PvJg58V7w2dOg6IrIbefMZnXx6DAI2+IiCjdOWIuebk=;
        b=KQJsEOrnsbZ9rVAGQDHey1MoxRLKg0BnxfhEXqpuIix2ayJasrZAtTeI7+ZP+xj7xh
         uD8I3DfySPrOWR7PighYoTQjhUI09X/1t6gBqx/JUZ8M/ZIkUQzvYcpBDb60m4G5D/V3
         Jiyl1k4G0K8cXIAzK1mufIjVAPODGTyqsIj1Cpoo5GGVbHrUqQBXvOdExRkIt4G7hzQO
         d113o7RAPZNpGyoKwVSEJucblLvkhu19Ho79m8FgBFTid9yM3XwqGpba/d8/Ckk1IA4n
         TqD8W6861UKgi1gVHxbZpiNHGnj9UWGkC3ODNDw0YXesDt6yMBToa1NfofacKKTGM3gX
         w0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvJg58V7w2dOg6IrIbefMZnXx6DAI2+IiCjdOWIuebk=;
        b=5fSqnL14Ux3tpBXWnPV9IymO0A3uAk6pjxP0IsD3dIg8bNy1J6/7SAFzPMwSPSb0BZ
         vxEi1Eu8BjAjyZ9AKvhjijyLv8nnRZdxYFWEOe1dVhrsGcMfUmoZZENn2N0yg14Sh790
         eyA94VQu8XwVV3DD8qqBtkr8uHIFlYdengRKxkwa3+Lu1RYsRiGis8MnzdKsuxZoB1lE
         ErWemxwizymK/Sh/QbfITWe0QQ4c3Q3iwQ28m7J2q0lJ9y9rzZ/m3+TmmwLWByT2O0aV
         MQ2Scwn9Cg2FVBjmACS697coSmE6t8jeOG/Zp7E11k9v75jYGgUWJ8hPMArkQL3B23eS
         lA1g==
X-Gm-Message-State: ACrzQf13wivrLfvzZLuPQuI7QVpU77oe8JNlxhcEQnPoG/wQQ6sJRoqz
        /OHSiTFvfses96x/0ubpJRaN9fR9J/VLQ5NKJLPkSw==
X-Google-Smtp-Source: AMsMyM5G/vBETey3R5QiPIVxyOMec+PJWYMjlf9FVZ7aUcUrFGe7Kvr5Yfu3xLocOT42h5QXT2ottvMoBsgq2e/veDo=
X-Received: by 2002:ab0:20d2:0:b0:415:715c:1e70 with SMTP id
 z18-20020ab020d2000000b00415715c1e70mr12316746ual.81.1667984840832; Wed, 09
 Nov 2022 01:07:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <2a943ded955e634fc76022dd3bccdb0e8f8b4313.1667815011.git.viresh.kumar@linaro.org>
In-Reply-To: <2a943ded955e634fc76022dd3bccdb0e8f8b4313.1667815011.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Nov 2022 10:07:09 +0100
Message-ID: <CAMRc=MdiNPK2jatPLy6vcN-uVgzRjk-3KJFcbpWnXQik85FBwA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 1/8] bindings: rust: Add libgpiod-sys rust crate
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

On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This adds libgpiod-sys rust crate, which provides FFI (foreign function
> interface) bindings for libgpiod APIs.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .gitignore                            |  5 ++++
>  bindings/rust/Cargo.toml              |  5 ++++
>  bindings/rust/libgpiod-sys/Cargo.toml | 20 +++++++++++++
>  bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
>  bindings/rust/libgpiod-sys/src/lib.rs | 13 +++++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 bindings/rust/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod-sys/build.rs
>  create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
>
> diff --git a/.gitignore b/.gitignore
> index 6c08415b390d..9f2fcf440c5d 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -35,3 +35,8 @@ stamp-h1
>  # profiling
>  *.gcda
>  *.gcno
> +
> +# Added by cargo
> +
> +target
> +Cargo.lock

This should be put into bindings/rust/.gitignore

Bart
