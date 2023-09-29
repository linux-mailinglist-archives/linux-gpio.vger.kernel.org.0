Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFD77B32C2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbjI2Mpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjI2Mpv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:45:51 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA531AA
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:45:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso1895355866b.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695991547; x=1696596347; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQ3URrHKYFeFNyy1WMAmGsZEKsxkqyvNI2DYX95n5VE=;
        b=BXC0mkAnyXXfezrwleMqMSrZDMxd40kJSWEanpYwdbYEB5g0zY2Ku5XTaH3eMtDq+H
         /colEhRAK6DMo12bVZWTaNP2V1UoKdba3WQvnkFWKnLuCIlvpLsunW6hhe8T85KyjTGZ
         meOZseZx9pea1yW5A2gQuMvALeMemiGnjZWrz6xUbYSLVm8/AbjOL4eUhAyd4KMo3JdF
         Bb/qcxtuaKMWnHZ4B0XgYiM/g3FBj7ITHaFR6ux6ZwrFXUcyPpSu7qhcisbv9WqeVUQI
         KNyNwDoGsE98dtRit8OW0add8zyFLH/mJnoGRUTQpAISbJ2kvvBTqJAbQx97oljFG0N4
         A6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991547; x=1696596347;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CQ3URrHKYFeFNyy1WMAmGsZEKsxkqyvNI2DYX95n5VE=;
        b=jP93tvvCmKKFyt+oc5r2144/3nMObMwGdv7t75Y9a3AUUQ10uNX2ZHJ+limFuUpUln
         FdG3M5js8mC+c+I/lu9RdbI4y7FrOzL1UXNTmU0aZmuUL+eFNjVW8VosJLoesTMFPMVs
         ZAFL8EyRpgq6Nf2gg9J3Ine/Q5Xe8tYMEvZymUtRHIXK13o/y77gPWvUdQd1PKKSJ/jd
         qi8v5JDXynh5ZNrU+5Tja9gi9O2DMSfgpAV3R0AST4h5XSkspJVrQXUax4EwH/h1yMIS
         6WHTFk4IUeukdulFOmW5SRl3Z6kn1uu2xdercLhycvCsrLHBu8h+aK6cA/vCce6D5wTG
         3v9Q==
X-Gm-Message-State: AOJu0YyLb3qmHEWEvz739JrgqcYWhiDBoO/IlWUPF9PpTZwfETbqEzwL
        CSgIR+LzD+R7VvpNsv9hq5oHgPNeo831HLOHgzU=
X-Google-Smtp-Source: AGHT+IFC7ldw1vKcxauqGUvkXfcvVGWBAp+2Iy/wv3bA0zV21+Tq0MesZ760uSl7BWrdbg7UziFK4A==
X-Received: by 2002:a17:906:309b:b0:9a6:426f:7dfd with SMTP id 27-20020a170906309b00b009a6426f7dfdmr4261485ejv.66.1695991547567;
        Fri, 29 Sep 2023 05:45:47 -0700 (PDT)
Received: from localhost (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id d2-20020a17090694c200b00977cad140a8sm12282116ejy.218.2023.09.29.05.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:45:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 14:45:46 +0200
Message-Id: <CVVETSK5NDXF.139VWJ2R9BIB4@ablu-work>
Subject: Re: [libgpiod][PATCH 3/3] bindings: rust: bump major for libgpiod
 crate
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-3-990dce6f18ab@linaro.org>
 <CAMRc=MfZKuMfQx2bgfv2dT3VTj8TjMqYNw_d51kTaZXQh7LRKQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfZKuMfQx2bgfv2dT3VTj8TjMqYNw_d51kTaZXQh7LRKQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri Sep 29, 2023 at 2:43 PM CEST, Bartosz Golaszewski wrote:
> On Wed, Sep 27, 2023 at 6:30=E2=80=AFPM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > Since the type changes around ownership of line_info instances are not
> > necessarily transparent to the user, we bump the major for the next
> > release of the crate.
> >
> > Note:
> > I am using the term "major" as defined in the Rust SemVer compatibility
> > guide [1], where the first non-zero digit is considered as "major".
> >
> > [1] https://doc.rust-lang.org/cargo/reference/semver.html
> >
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> >  bindings/rust/libgpiod/Cargo.toml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod=
/Cargo.toml
> > index 518e5e5..3be4aa0 100644
> > --- a/bindings/rust/libgpiod/Cargo.toml
> > +++ b/bindings/rust/libgpiod/Cargo.toml
> > @@ -4,7 +4,7 @@
> >
> >  [package]
> >  name =3D "libgpiod"
> > -version =3D "0.1.0"
> > +version =3D "0.2.0"
> >  authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
> >  description =3D "libgpiod wrappers"
> >  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.=
git"
> >
> > --
> > 2.41.0
> >
>
> Isn't it something that we should do right before tagging the release
> once we know the final requirement for the version change? At least
> this is what I do for the rest of libgpiod.

Yep. Probably thats better. Then we can also use that as a signal of
intended publish to crates.io.

Will drop from this series and send again once all current Rust patches
landed.

- Erik
