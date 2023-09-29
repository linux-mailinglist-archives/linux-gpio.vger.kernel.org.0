Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23A87B32BE
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjI2Mnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjI2Mny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:43:54 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDD5B7
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:43:51 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4526a936dcaso6262401137.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695991430; x=1696596230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhP8BMnkshh0KHHgeHRBeIV/H0EdZG6IqyeL+1jAwX0=;
        b=o3xDLP5pjNsB4ojNeeE7xh/aiUaIp9oPUM78zZ1hhGCVqV1YwtnMxuZoiLCYOj1rxQ
         HhQHy3onYirbgRXuw6R0JHghY59pScuxCs0OSCtHrR4VimD3JTtUTQ/nVOuPTXuq9fG6
         e97fl/yEjbEwwhVrMe7SV/pEzWhjZ5fNIz3BVCqErsyLypfcxXvf0q4xUL477EQu2b0U
         xKdmR6+SaXlS+fDcDy/aIejEbH0ChSlnLsTh1eXudb3Urvx5gkvxeJ9BnyOrNJaB8G1h
         ncAT29BdpklEtBJPWzW9jHO8fuLm2S3WwH87NkUfEl6hm5n/XAGN31bTJ/vHv0S3taHX
         Zdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991430; x=1696596230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhP8BMnkshh0KHHgeHRBeIV/H0EdZG6IqyeL+1jAwX0=;
        b=oz3Ss/xLy9ERBYZMbhXWBPt1Dh5piJFHp+3Om4ZBs4xFkGSxQa79U+PvM9O1PfyLYd
         ylPJjUxiiAcJR0R3IKfr/pKWNH4Hp9+1y2JVl0iJHZG+Nv2LdMoy5CKKyCKqUCRSfEYY
         fYOY4EcuFiwuDSPq/FvjdNcW80oDpaMxVuhsnclgY9lSPURFSIB8wFxXj8KudTOm06kp
         BYUugLyq35IlOzWlBZtlgPhIM0aR6fkxfxGDJGZtzMQpaHwGI6avYPG7SS/Avxu2VxHe
         b+p2M9MBoeoUUK2K03hI6GSErvOYh7D/o9RQimRxX1DDID1Dm2QHXqKmm602tLS5JmV1
         zY6Q==
X-Gm-Message-State: AOJu0YwE0eJcTsCHO0y9rM6t9bbAIqFYzkrxkYFI+QJlU0Um2DhI9g3b
        oiPOxuYXm346aDA7CbSWqzSGT+JWqzq6IQA+Wn9r2MEDveftMO+P
X-Google-Smtp-Source: AGHT+IG4hdtG5Hx6rgJNAKZca4NLNZM8/sdowGT931F4/noNJcnF2MX2JuS88unlkhPzrEZvbw2H0tsMavU58qhhAi0=
X-Received: by 2002:a67:ad0f:0:b0:452:7617:a757 with SMTP id
 t15-20020a67ad0f000000b004527617a757mr4131364vsl.26.1695991430662; Fri, 29
 Sep 2023 05:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org> <20230927-rust-line-info-soundness-v1-3-990dce6f18ab@linaro.org>
In-Reply-To: <20230927-rust-line-info-soundness-v1-3-990dce6f18ab@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 29 Sep 2023 14:43:39 +0200
Message-ID: <CAMRc=MfZKuMfQx2bgfv2dT3VTj8TjMqYNw_d51kTaZXQh7LRKQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] bindings: rust: bump major for libgpiod crate
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 27, 2023 at 6:30=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Since the type changes around ownership of line_info instances are not
> necessarily transparent to the user, we bump the major for the next
> release of the crate.
>
> Note:
> I am using the term "major" as defined in the Rust SemVer compatibility
> guide [1], where the first non-zero digit is considered as "major".
>
> [1] https://doc.rust-lang.org/cargo/reference/semver.html
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
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
> --
> 2.41.0
>

Isn't it something that we should do right before tagging the release
once we know the final requirement for the version change? At least
this is what I do for the rest of libgpiod.

Bart
