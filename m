Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE59C7168A1
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 18:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbjE3QFx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 12:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbjE3QFk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 12:05:40 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36367100
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:05:29 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-557c7ffea48so1774710eaf.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685462728; x=1688054728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rW8nzh6v70rMPSC2Y37BgfuwM80oycACguOtdR6Odo=;
        b=htlAG+lo3xIsAsGS7OZcaP4I3dp8HECFD35wWDANYD5ssuVh90hmC7adymeR2KR8Id
         duDFR42tqOFMnZdIMkietnDvwOI/9Ngk9yyG4LDzhQapGtc0S3q1hVw9TwMoFqhNQ9aJ
         P1QYb4B0Im0GuFH893bWGFEr9hWXU1TrXIWEfURUaLoR7wOeJ6WYstqkhdB0OL2cEkZU
         24xb8CyQ0Yp5mxUI+sMdxhkYgODJs/4Elpapq5sfgak6b++PgJ2BWM7jFzfRu/Ercg+a
         HanlM1UoiZXB9Ai3VSglRVYbGna5SfLsB8IjUb2eaLTNr148V9RnB/reMds5Ru7IkxMn
         5cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685462728; x=1688054728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rW8nzh6v70rMPSC2Y37BgfuwM80oycACguOtdR6Odo=;
        b=KfHRrsGAe4AFY5IGT06XCd0zbYnPlfe1TeZFfzIMLoWATLuSHZ0s6niOVSfgiapE82
         RquuXtzArDeDGIpX1ZWTEyQTRpikKmf4GSczh6tez68kIzztcUUyI0ufqq6vM8WG7Erk
         xGYuDr+Pc7j0sloJK6jx5Jo2kGYTDs49YkI6Iy+SN/HOWTrJ2/zVqCbZahVP8CAhAmu8
         6vYF76sqK+We0axfuPXHDFMfVuBXpEBdEUMKwv/NmWLkSrCd2lKbiQIwK7Y18+pkLZev
         MxUGmPDmv8JydI7JthXppAkH/Fds40ND43iGd2RIug7a5WQhtjAGyvFU2rwoxjddBRHf
         xkcw==
X-Gm-Message-State: AC+VfDzangyLu4AazqU1CT9ZbQpO5jJtvTFEutsvTCzoCSpxp0nv4l1F
        LLb3KXn1U+T2mmm9ElprVmZgFprVGFbmDYtsiqjWZA==
X-Google-Smtp-Source: ACHHUZ7N5EqNR5tWEljpqJtTwr3IfK1mZiWrONlEZKQ/YrM2hqpRYrSxwSjwmpDZHk0qGkrr92F2bbOaEmyBV2aVs30=
X-Received: by 2002:a05:6358:3106:b0:122:23b2:dd60 with SMTP id
 c6-20020a056358310600b0012223b2dd60mr48357rwe.15.1685462728410; Tue, 30 May
 2023 09:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230522-crates-io-v2-0-d8de75e7f584@linaro.org> <20230522-crates-io-v2-1-d8de75e7f584@linaro.org>
In-Reply-To: <20230522-crates-io-v2-1-d8de75e7f584@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 18:05:16 +0200
Message-ID: <CAMRc=MfJYYyEKrKsK+huP-t84ZjoJzDD-+kxj3ud=GQDkO0p7Q@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 1/2] rust: bindings: turn SPDX tags into comments
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 26, 2023 at 5:28=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> In markdown `# Foo` generates a top-level heading. This leads to to some
> weird, huge SPDX tags being rendered before the start of the actual
> content.
>
> Lacking good examples, I just took the syntax that `reuse addheader`[1]
> outputs.
>
> [1] https://github.com/fsfe/reuse-tool
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/gpiosim-sys/README.md  | 8 +++++---
>  bindings/rust/libgpiod-sys/README.md | 8 +++++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/bindings/rust/gpiosim-sys/README.md b/bindings/rust/gpiosim-=
sys/README.md
> index 6cd24d9..b13f09a 100644
> --- a/bindings/rust/gpiosim-sys/README.md
> +++ b/bindings/rust/gpiosim-sys/README.md
> @@ -1,6 +1,8 @@
> -# SPDX-License-Identifier: CC0-1.0
> -# SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +<!--
> +SPDX-License-Identifier: CC0-1.0
> +SPDX-FileCopyrightText: 2022 Linaro Ltd.
> +SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +-->
>
>  # Generated gpiosim Rust FFI bindings
>  Automatically generated Rust FFI bindings via
> diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpio=
d-sys/README.md
> index 3eb5c9d..1cb3b0a 100644
> --- a/bindings/rust/libgpiod-sys/README.md
> +++ b/bindings/rust/libgpiod-sys/README.md
> @@ -1,6 +1,8 @@
> -# SPDX-License-Identifier: CC0-1.0
> -# SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +<!--
> +SPDX-License-Identifier: CC0-1.0
> +SPDX-FileCopyrightText: 2022 Linaro Ltd.
> +SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +-->
>
>  # Generated libgpiod-sys Rust FFI bindings
>  Automatically generated Rust FFI bindings via
>
> --
> 2.40.0
>

Applied. And this made me think I should convert other txt files to markdow=
n...

Bart
