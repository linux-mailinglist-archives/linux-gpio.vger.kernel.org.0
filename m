Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B96D7B32AB
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbjI2Mex (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjI2Mew (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:34:52 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E11BE
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:34:47 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-495d687b138so5346606e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695990886; x=1696595686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4lUBEn+jDygmMOFO7/F0juJNlGo49qtp8pwnlx0y2Y=;
        b=iIVdy2Gl/vExm+IKbzjcpX6v3fe85tn7YHDy840UP1WthzoV8dxML0TvnzlnUCPg3s
         FbmsL8aU7dT65LYJpeFVx1pHvyokeepZE3DreomyLREPLtUEYhivNmBFdZM7j8O8SBNj
         qlLw1ibKCMYz07RZ845AWVy97O0Mry9+av0d+t5Ilt1hGklidY3YXSzPaCgpjTkI3csi
         EPLqT17qi0lJjjzrbWZ5trcZcZPMjmPQGtFL5flb5mjY4wFI2sAzo0jlb0wkhyQPTroc
         zQeeFtKfwQmpax6Qw/fH10jBYb33s+CfljgX+3XtKrKT3OCN0Wds2cueteaevxIx0eCp
         /ucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695990886; x=1696595686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4lUBEn+jDygmMOFO7/F0juJNlGo49qtp8pwnlx0y2Y=;
        b=KA5sJXuf0X/+9ByiJ5IGiKzSGPG/yg8nWDmd+/W2VXGlEtXUmVzlWe3bCbfwjbK1T6
         P2Sp1lZHZ5vRhCrt7zMCoe/9Q6aMqnxStz3u6T46/5CdIf4SY9e/vVvzfZqAaJ1mBXoa
         YTMbUFPZYqpTyxqB/s08ZoJhmjoOUfJx9BLYQ3GsbWmp7sWfDP/W6/Wy0X/uqOFmatYh
         jyWr6XS2oTIVrPYEFKarKm7jvq3LMuxmk4hgvIkFJcP1W7OttdIuf8JfcR2t4lmRQx5b
         QDXHiWvtSpy6+IcYB591180P1mEjmQjFE3C1bRdkfXO0a0PC+mrbgxlxuvt0IX24R8Ep
         /E6A==
X-Gm-Message-State: AOJu0YyBzY+EFI69tOlcbP5qM6REUHgrFoV3PlMH204a2IzCThLGPSwG
        TrCtEEG7xOWOpR2xmtK5UsFR/AASAr1aVdhUo3D+sQ==
X-Google-Smtp-Source: AGHT+IEKCLzEtkQ1avboqOQ1dogcbvYHe3BPdlfAxKVrWhmvKhseG8l7+B18vWlIx7kk1H+Kamj/FaJ4eEaS/aUeNfM=
X-Received: by 2002:a1f:c5c4:0:b0:48f:f026:27de with SMTP id
 v187-20020a1fc5c4000000b0048ff02627demr2837220vkf.15.1695990886467; Fri, 29
 Sep 2023 05:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-useless-clone-v1-1-c512c3c6bf2f@linaro.org>
In-Reply-To: <20230928-useless-clone-v1-1-c512c3c6bf2f@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 29 Sep 2023 14:34:35 +0200
Message-ID: <CAMRc=MfOBLco-a=JYNQ-RWkMNRhBUEFowOAT6_e=6GAJbDhbFQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: rust: remove useless clone
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
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

On Thu, Sep 28, 2023 at 8:25=E2=80=AFAM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Reported by 1.74.0-nightly:
>
>   warning: call to `.clone()` on a reference in this situation does nothi=
ng
>     --> libgpiod/tests/line_request.rs:71:44
>      |
>   71 |             let chip_name =3D sim.chip_name().clone();
>      |                                            ^^^^^^^^ help: remove t=
his redundant call
>      |
>      =3D note: the type `str` does not implement `Clone`, so calling `clo=
ne` on `&str` copies the reference, which does not do anything and can be r=
emoved
>      =3D note: `#[warn(noop_method_call)]` on by default
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Found while running nightly toolchains in order to run tests under the
> AddressSanitizers.
>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/libgpiod/tests/line_request.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust=
/libgpiod/tests/line_request.rs
> index 9af5226..da22bea 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -68,7 +68,7 @@ mod line_request {
>
>              let arc =3D config.sim();
>              let sim =3D arc.lock().unwrap();
> -            let chip_name =3D sim.chip_name().clone();
> +            let chip_name =3D sim.chip_name();
>
>              assert_eq!(config.request().chip_name().unwrap(), chip_name)=
;
>          }
>
> ---
> base-commit: ced90e79217793957b11414f47f8aa8a77c7a2d5
> change-id: 20230928-useless-clone-af75c3a58df7
>
> Best regards,
> --
> Erik Schilling <erik.schilling@linaro.org>
>

Applied, thanks!

Bart
