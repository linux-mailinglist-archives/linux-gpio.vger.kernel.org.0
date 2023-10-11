Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6832E7C4CDC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 10:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjJKIQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 04:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjJKIQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 04:16:49 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A64C6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 01:16:45 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-452c0d60616so455245137.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697012205; x=1697617005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKYARpcgxvqJ5nm7hy2mQ8mw5dgI1AzlyTKv/R3vw/E=;
        b=C3xgkE/HTbHic8j90QXoehTW7gvINhJU7mvumVFQotR0NWaOXqxslRkX6binmn/hSu
         e5zTBtu8OU+IS5OgLg/fVS9cK2oWqfxOg0RU6u6RKeGjADAF7zSyxnfw1vWsDL8jk/E0
         NLuqp1BbclaTvWqmFRo7lUyOmFsg1ynNHmJfugbd+TS37s43aKtP6szMrlzgQAByRraz
         nS2rOCN/ygf77c4S8NSKKlYgaNm5TsKffam6LyQvOIX9bsZ2pjgCGyUFml+P71zZiJfz
         pckK1VvjNkbNReKE26O87tcC3LgE4amkNRx5iw46VhQCbmremGAL/OOQ8nh92/TqQ50V
         oRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012205; x=1697617005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKYARpcgxvqJ5nm7hy2mQ8mw5dgI1AzlyTKv/R3vw/E=;
        b=vIHNWT/CywnxEeaTbg3B1B5GOemQ7RTn3jxKj0u7xd23Tyq2r7wqZUwElqaV8gb60R
         FwQTmQfDF4mBCVnYLxGi/Y3RfDpNC4IjO4XmICXnq7VVYXBJijgmsYsEW6+UIIDrO9IL
         Wuw1Q4JwCiYpLTVaNxYjL6GQd1NKJtHniEVC2fMwjMnEuzpJm+LwETjBk4Q90441O5Vj
         ZR5r63YPWWIynai7qqTTC/W9dD0VmsN+0N8aso19p2poDZGQLopG1N5M4N2O1vSN3mxV
         3mBCgvTGTXx2RiAhYRmvsQSLkGiJ2aRqllmKpaoJB7rkYuq0RDqtna6UTmNQYDab5yKW
         PWJw==
X-Gm-Message-State: AOJu0YyWNUdppltvcy9JzKw8u+VnkXusLgj/vE9OYv8EjyNGgAxfCuLb
        cl5CsUGFkTrNQnq6oszxKWWA/hhVPG5k0suOjNIV2w==
X-Google-Smtp-Source: AGHT+IH7/IeaTpVElvblcmI+3xTZA/Gg+jzOTDYefYBPGe07kgORfy4OcmBt9mM4V+C5yfbyTxGqY2G/2Eim/t5+Eh8=
X-Received: by 2002:a67:ffcf:0:b0:452:75be:26a4 with SMTP id
 w15-20020a67ffcf000000b0045275be26a4mr11387799vsq.6.1697012204721; Wed, 11
 Oct 2023 01:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231010-b4-libgpiod-0-2-1-v1-1-291cb0cd23d4@linaro.org>
In-Reply-To: <20231010-b4-libgpiod-0-2-1-v1-1-291cb0cd23d4@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Oct 2023 10:16:33 +0200
Message-ID: <CAMRc=Meji1JCrdCbwOLg1d2ZizTHxKvo7x=T7PzP-bq22_utBw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.1
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 10, 2023 at 9:13=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> While the release technically removes a function, that function was not
> available in any released libgpiod version. Therefore, this only bumps
> the minor.
>
> This release fixes building with releases from the 2.x series of the C
> lib.
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> acebcf2 (bindings: rust: feature gate unreleased features, 2023-10-06)
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Same as last release: Once this is merged, I will publish a new release
> of the crate to crates.io.
> ---
>  bindings/rust/libgpiod/Cargo.toml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/C=
argo.toml
> index 3fd1d74..3ce05df 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -4,7 +4,7 @@
>
>  [package]
>  name =3D "libgpiod"
> -version =3D "0.2.0"
> +version =3D "0.2.1"
>  authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description =3D "libgpiod wrappers"
>  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.gi=
t"
>
> ---
> base-commit: acebcf2cbefb735eaddc06ee52eb1b1c85886d1b
> change-id: 20231010-b4-libgpiod-0-2-1-fc79302ea752
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Applied, thanks!

Bart
