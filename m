Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4264A7C4CF1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 10:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjJKIUA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 04:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbjJKIUA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 04:20:00 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE2392
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 01:19:58 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99de884ad25so1164332666b.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 01:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697012397; x=1697617197; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vx1kyUP6/ZxJGlfJMrj7ldpOvOceNDkGredIy3LXfU=;
        b=LmE34sifhpO4tJ/PTD2SZ7qECRRZy3x/zB4lAkM4+5R600I2Xcmn8ttvWUhAc5ZP4M
         RloCANXmbkRamH5XMLzLrfWKruhddyH6vG5a4ImAuXmfLmrtLDPTbauoqQt6WHCUpNsl
         qlw7dEKZ44Hpj0OA/2eHYtNTtFlQbyevjaqOsbIvl9K26plS2H9lpYfrv/ikKkZNsjWk
         moozJgeSkP21r3zibybLOxAh1jPtflojFXEIy/acTXCiNCJeEJ+vGuL/2cWzVmOF/mCX
         sWtn0mIooxCDf95fdakXdkU/oTN+E8JjrMoC355O8zMcOMehBXke55tMxt1WyEX3XvSE
         BCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012397; x=1697617197;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/vx1kyUP6/ZxJGlfJMrj7ldpOvOceNDkGredIy3LXfU=;
        b=IA/5L6QUBqbN9HVvYs91QXWdSv38GL0XODTsL6dzukhU+pSOQp0iGkix/+4UN/9b9K
         scK1WYMJ9LSq7e2pLUeq5PJMFZ0ZkHQmoJiB6BcXGPMhsVesRXclzFaYwBdmsoutp4/f
         A1c6EtpZJsTpsTVOJBOZisfgfq7bHNGWz4JeKtfz9P+GWH681PiNBniFWLwtjvzI1g/w
         FSPK+CEjNHIOAdFb1i5YNGHPSKBlC9gy0F0UeUi3fr7vPWgoVSQpjZq41g93ncwmMUg/
         hldCGYWamFMyuMvN7TGoxD8KfjgUAgEKOc+Xk+qpomdzgqCE8trmv8cuI7yTHie/1xUs
         Z7EA==
X-Gm-Message-State: AOJu0YwJZ6/LWl8xn6HNTZweMv8KpfO4cyHleYDijiNwer1f4yO+VkoU
        3wLNXJ0p61e7hL2SRgeHXYNQcwk4Z7P3WqCDkaI=
X-Google-Smtp-Source: AGHT+IEWiepv1Ggk2+xD00ayyXqm9mi81i3Oi3DcfgfvIfRqAyUoT1CMp1+NxweLAr5+JjysbERi5g==
X-Received: by 2002:a17:906:221c:b0:9a5:b876:b1e3 with SMTP id s28-20020a170906221c00b009a5b876b1e3mr16858705ejs.20.1697012397094;
        Wed, 11 Oct 2023 01:19:57 -0700 (PDT)
Received: from localhost (i5C743875.versanet.de. [92.116.56.117])
        by smtp.gmail.com with ESMTPSA id pw23-20020a17090720b700b009ae05f9eab3sm9443843ejb.65.2023.10.11.01.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 01:19:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 11 Oct 2023 10:19:56 +0200
Message-Id: <CW5GOSB0GGOI.19V32RRNJ19UT@ablu-work>
Subject: Re: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.1
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231010-b4-libgpiod-0-2-1-v1-1-291cb0cd23d4@linaro.org>
 <CAMRc=Meji1JCrdCbwOLg1d2ZizTHxKvo7x=T7PzP-bq22_utBw@mail.gmail.com>
In-Reply-To: <CAMRc=Meji1JCrdCbwOLg1d2ZizTHxKvo7x=T7PzP-bq22_utBw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Oct 11, 2023 at 10:16 AM CEST, Bartosz Golaszewski wrote:
> On Tue, Oct 10, 2023 at 9:13=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > While the release technically removes a function, that function was not
> > available in any released libgpiod version. Therefore, this only bumps
> > the minor.
> >
> > This release fixes building with releases from the 2.x series of the C
> > lib.
> >
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > acebcf2 (bindings: rust: feature gate unreleased features, 2023-10-06)
> >
> > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > ---
> > Same as last release: Once this is merged, I will publish a new release
> > of the crate to crates.io.
> > ---
> >  bindings/rust/libgpiod/Cargo.toml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod=
/Cargo.toml
> > index 3fd1d74..3ce05df 100644
> > --- a/bindings/rust/libgpiod/Cargo.toml
> > +++ b/bindings/rust/libgpiod/Cargo.toml
> > @@ -4,7 +4,7 @@
> >
> >  [package]
> >  name =3D "libgpiod"
> > -version =3D "0.2.0"
> > +version =3D "0.2.1"
> >  authors =3D ["Viresh Kumar <viresh.kumar@linaro.org>"]
> >  description =3D "libgpiod wrappers"
> >  repository =3D "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.=
git"
> >
> > ---
> > base-commit: acebcf2cbefb735eaddc06ee52eb1b1c85886d1b
> > change-id: 20231010-b4-libgpiod-0-2-1-fc79302ea752
> >
> > Best regards,
> > --
> > Erik Schilling <erik.schilling@linaro.org>
> >
>
> Applied, thanks!

Released: https://crates.io/crates/libgpiod/versions

Thanks!

- Erik

