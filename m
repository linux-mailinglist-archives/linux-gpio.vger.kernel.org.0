Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F261718885
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 19:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjEaRdi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 13:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjEaRdh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 13:33:37 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72054B3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 10:33:36 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-96f850b32caso1111698366b.3
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685554415; x=1688146415;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51LmbX9ly8Cn/8tz7Pwwwafhm6rl3OBIT72gFpSrdm4=;
        b=iB57w5mtYdtShRctuiMSNmMqk9mgCL0IZTdo3Y29NEzPt4KaRWSkrv/iDbCpvEuZRR
         AZCmysXWrs0vmTFGvrQ/uKrqRt0wFIY/qjKuSN3WEUvU66Lu4R+6OgRi10oPLjbW5em6
         dGAIsQYHFRhqfWBuyJqqn4r0X4xtVS9PEvZA2VDdFyc4LtNDY5U5Y7rD49z2P2s3Vn2b
         2CfJywm6KfD+GavDf2deJ8tUi5iHHDUNk33m5iey0bumBBHiBlqxihXRzrsWo/bhg7A6
         0oKh3daFjjkXaANmS9hpvCq/zeUOYy676GVuEGvOqSxbmKFchO7iRN4NAsT2jOJ9TkLU
         nnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685554415; x=1688146415;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51LmbX9ly8Cn/8tz7Pwwwafhm6rl3OBIT72gFpSrdm4=;
        b=HmYZDuq3io6/z44k/a5kopUeclUACNVmvA8fhAYOJZSnf+zvTdGe30jb4HO/yhI63I
         iTIW2FaPTZylR25v5/Wil3qs30degHmBPsFU4ExBY5dKyN2kM8hyxqFtg+ivHjewJ08s
         tS/Ye9uMEH0dEoOAiQ4/SAsamDSk7k4YwYDazGinhBD1iY5dH7GJziLkSa298gMJca+O
         /HDVDkirV6b6+q9Q5/tPEVrfe8hGZpJpc+9ZeAwURuvDzeXWPGJYFSEws7lOJlbY5uGI
         dmoGxhzvSz7U18yXleKwdShZ5Z2ESi1SgSwUjC8xRQ7Zvk72nE8ZmI0iow65aDbn+Bp4
         gkKQ==
X-Gm-Message-State: AC+VfDxER/bcnAoGG6NrGJhEBUIkJLtZRptGGxQTHlcsHdYCJPwsj/kI
        Bm+ecoGGJUA5XCO2Kz4DCs0q+Q==
X-Google-Smtp-Source: ACHHUZ7EU71awpJNRnUcgOTqrc4ydnyv2Ljkj9WvI8ppcTp0bYELvt88FQqvi7pfn7+nMsaYgfh92w==
X-Received: by 2002:a17:907:868a:b0:970:e017:5596 with SMTP id qa10-20020a170907868a00b00970e0175596mr5243870ejc.59.1685554414862;
        Wed, 31 May 2023 10:33:34 -0700 (PDT)
Received: from localhost (i5C741499.versanet.de. [92.116.20.153])
        by smtp.gmail.com with ESMTPSA id s20-20020a1709066c9400b0094ee3e4c934sm9387583ejr.221.2023.05.31.10.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 10:33:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 31 May 2023 19:33:33 +0200
Message-Id: <CT0N67TFERNZ.29590E8F8K2JR@fedora>
Subject: Re: Publishing libgpiod-sys and libgpiod to crates.io
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Manos Pitsidianakis" <manos.pitsidianakis@linaro.org>
To:     "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <CT0CRWOTJIEO.20BGIDMLFM0E8@fedora>
 <CACMJSes5+vT=NBqSe7xpSEPAEMmkgrZvJ8iKx7oBCKZQaGB_rg@mail.gmail.com>
In-Reply-To: <CACMJSes5+vT=NBqSe7xpSEPAEMmkgrZvJ8iKx7oBCKZQaGB_rg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed May 31, 2023 at 3:31 PM CEST, Bartosz Golaszewski wrote:
> On Wed, 31 May 2023 at 11:24, Erik Schilling <erik.schilling@linaro.org> =
wrote:
> >
> > Hi all,
> >
> > After merging of [1] only some cosmetics should be missing from being
> > able to publish to crates.io.
> >
> > First, we would need to agree on a version number (or rather a
> > release management process). Rust is suggesting people to follow a
> > SemVer approach [2] and I would strongly suggest to stick to that
> > recommendation. We _could_ just start releasing with the next libgpiod
> > release and have the Rust bindings follow the libgpiod releases. While
> > this may seem intuitive to users (they can just spell libgpiod =3D 2.0.=
1
> > and reason easily about which libgpiod version is in use), it would com=
e
> > with a couple of implications:
> >
> > 1. Users would likely expect new features of a C lib release to also be
> >    usable from the Rust crate if it uses the same versioning scheme.
> >    So this would also tie the necessary effort to expose those features
> >    from the Rust bindings to the release process.
> > 2. Supporting multiple versions of the C lib with the Rust bindings
> >    would be no problem in general, but would become awkward when trying
> >    to replicate the version numbers of the C lib.
> > 3. Changes to the Rust bindings would always require an overall version
> >    bump.
> > 4. There may be a conflict between SemVer bumps for the whole of
> >    libgpiod vs a bump that would be required for the Rust bindings only=
.
> >
> > This all seems pretty restrictive and undesirable to me... So I would
> > recommend to manage the version numbers of libgpiod and the Rust crates
> > libgpiod-sys and libgpiod all separately. It may help to think of the
> > versions of the Rust crates as ABI versions (the C lib has its own
> > ABI version too!). This way we could :just get started with the version
> > numbers starting at 0.1.0 and start bumping them as needed for both
> > libgpiod and libgpiod-sys independently. Also, this means that uploadin=
g
> > to crates.io would not be strictly coupled to the release process of th=
e
> > C lib and other bindings. That may allow to spread the load a little.
> >
> > This may be slightly confusing to the user, but I hope it is less
> > confusing than the mess of what I listed above? Any opinions?
> >
> > After agreeing on a versioning strategy, actually publishing to
> > crates.io should only require to add version number restrictions to the
> > libgpiod->libgpiod-sys dependency. It will then use that version for
> > installs from crates.io and use the `path` when building locally.
> >
> > Once that small change is also done, I think we are ready for
> > publishing.
> >
> > @Bart: How would you prefer to handle the upload of new versions? Or
> > would you prefer to be the one doing it or prefer if someone from the
> > community handles it? I can offer to help with documentation and setup
> > if needed :).
> >
>
> For versioning: I'm all for decoupling libgpiod API version from rust
> bindings version. I did that for python bindings starting at 2.0
> (since they've been published separately on pypi).

Yeah, Python bindings are probably in a very similar spot. Would make
sense to follow them I think.

> For uploading rust crates: I'd love if someone else could do this. I
> don't care enough for rust to do a good job at it. :)

Viresh: Shall we spread the load? I am happy to set everything up.
But it would be good to have someone else on the list who is using the
bindings actively. :)

- Erik

