Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221ED7BA86D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 19:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjJERsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 13:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjJERr2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 13:47:28 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE04FB
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 10:47:25 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7b07c3eaf9bso487911241.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696528045; x=1697132845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtbtM+Kqq9eY2FzrbEugTIY8H/+c5pqgQBxrckc1Fh0=;
        b=eg4m+j5X9e+VXQh/vg6JzKcUhbQX3yPtuBNjQ65nfXEiWH9GbR/jKAWECcq9U0Lzbk
         vBLd5ZRxZbBsX9LV0qIBarCAEheB9OtT/dWkMdHlMtAGnjMaUkYEZl6zH7st4E+caIRz
         i7G24UOkj8sJlaUPjR6DXFqFpgtJ1v1tEL2Iwany2oZIFBNHpHXemww+89P01uV5LCDH
         WU8CbheCjUZ8R96N5dh6B8dm0DfLL+tJeRLHL0ih7ggt2EmS2o7TZhyEB+UXwGG4yQ6Q
         sklCHvKGyiMhKMqZX5pZR7Hk0l2BMxCn2ytNWg6i/JuDzHMFr4cU0UuFDn6sEUwQRtbv
         Q4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696528045; x=1697132845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtbtM+Kqq9eY2FzrbEugTIY8H/+c5pqgQBxrckc1Fh0=;
        b=d6kEVRi08LNe0gA65t+pwu7GokhMc5Xmj0jr+RCbkueohOGPIpaktjgsniDFw9CbCk
         Sh2Hw1rbmcrDnHYi9adI3MZlvJgwymtHtWSmWt8AAXZ9T1yNEX+z+sbx7sBs/blOaImY
         Cz9FyqVVTTQ9FkRTngOdjfWz2uYb8ostbTPVyXJDvFt26z2nXkiRmz5c87MC4qBE8ejJ
         jePfdh9ZHqSXzGtjJLqSnW9UakV+mubCfcJbl7pdR1FTBcKd746C/IML7BD1fLhcNZZN
         fvsFCoYLHLI1Y3bJcFdtAapboaD40j0x03kzKl/v2sMiZk8gZOD5YFGSrag2vBbHqj+L
         LQMQ==
X-Gm-Message-State: AOJu0YxZ7qjMTpVlPpRW0L0njA3ssrKZYh0GA902dZZhwCg4CgWPYaOd
        Th6aFIt4Cfz9ED/JMddKSWefws4ejKz2fIArwam0BmpOB2Z3hrVE
X-Google-Smtp-Source: AGHT+IHQVvBlxJZWR4h42kSYwIyVAS591cM2AIgFOIe+guNUGRPWcmg7i3kIDcH5igSMgzxXF28W/A4LaznWuT/aNdo=
X-Received: by 2002:a67:b102:0:b0:452:d9d4:a056 with SMTP id
 w2-20020a67b102000000b00452d9d4a056mr5221003vsl.26.1696528044955; Thu, 05 Oct
 2023 10:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231005-b4-rust-release-0_2_0-v1-1-0fab05c09962@linaro.org>
In-Reply-To: <20231005-b4-rust-release-0_2_0-v1-1-0fab05c09962@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Oct 2023 19:47:13 +0200
Message-ID: <CAMRc=MeTHSwyTPcjm1kttCjr4GrknqM2pqfWZ8ngFWWxC8YxeQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.0
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 5, 2023 at 9:42=E2=80=AFAM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> Since we had some (potentially-)breaking changes, we bump the major for
> the next release of the crate.
>
> Note:
> I am using the term "major" as defined in the Rust SemVer compatibility
> guide [1], where the first non-zero digit is considered as "major".
>

This makes no sense to me in terms of logical versioning but I trust
you guys know what you're doing.

Applied.

Bart

> [1] https://doc.rust-lang.org/cargo/reference/semver.html
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> (potentially-)breaking changes:
>   a29f3e6 (bindings: rust: rename {event,settings}_clone to try_clone, 20=
23-10-04)
>   b290348 (bindings: rust: fix soundness of line_info modeling, 2023-10-0=
3)
>   d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)
>
> new functionality:
>   808d15e (bindings: rust: allow cloning line::InfoRef -> line::Info, 202=
3-10-03)
>   64aac85 (bindings: rust: mark all owning types as `Send`, 2023-09-28)
>   d12ce74 (bindings: rust: provide LineRequest::chip_name(), 2023-07-20)
>   53226d5 (bindings: rust: examples: add dedicated examples, 2023-06-14)
>
> other changes:
>   0a570b6 (bindings: rust: drop unneeded Arc within Chip, 2023-09-27)
>   a97fe96 (bindings: rust: construct chip infos by reference, 2023-09-27)
>   27afa47 (bindings: rust: remove useless clone, 2023-09-28)
>   3f6e0bf (bindings: rust: add README.md for libgpiod crate, 2023-07-03)
>   4b8357b (bindings: rust: clippy: silence false-positive on iterator, 20=
23-06-30)
>   39189f0 (bindings: rust: clippy: drop unneeded conversions, 2023-06-30)
>   46115fd (bindings: rust: clippy: silence false-positives on casts, 2023=
-06-30)
>   901104e (bindings: rust: clippy: drop unnecessary casts, 2023-06-30)
>   46ecbe0 (rust: examples: file comment consistency, 2023-06-24)
>   aaed0f2 (bindings: rust: examples: replace tools examples with use case=
 examples, 2023-06-23)
>   b37bd9e (bindings: rust: examples: consistency cleanup, 2023-06-23)
>   06c8ad9 (bindings: rust: package new examples in the distro tarball, 20=
23-06-15)
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> After merging a couple of important soundness fixes and threading API
> adjustments, I suggest doing a new release for the Rust bindings.
>
> Once this is merged, I will publish the tree of this commit to
> https://crates.io/crates/libgpiod/.
> ---
>  bindings/rust/libgpiod/Cargo.toml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/C=
argo.toml
> index 518e5e5..3be4aa0 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -4,7 +4,7 @@
>
>  [package]
>  name =3D "libgpiod"
> -version =3D "0.1.0"
> +version =3D "0.2.0"
>  authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description =3D "libgpiod wrappers"
>  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.gi=
t"
>
> ---
> base-commit: a29f3e6957914dc564c723a8fc405cd99e407fd2
> change-id: 20231005-b4-rust-release-0_2_0-1344e6af7cc2
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>
