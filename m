Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5CE07CC80F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 17:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbjJQPxB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 11:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbjJQPxA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 11:53:00 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6393995
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 08:52:59 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7a52a27fe03so2443230241.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697557978; x=1698162778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10zDA4jsGdSEZi61OrVk/SewEnQtFeqKZqEsPJ4EUM8=;
        b=b9mh10Ohhu13zCFuHIu236a7X8hguS1xxxDUW5+cqFljUiKzuo4H6yRiUI+JVwIEKq
         s2nf5PO0rO0lRLW6cSzgsda9/s+neDbWd0a/slEzoEEZG8Xtg8J/utdmUrs2/vqdCwWX
         O/jh8dqtMsVOY3+LNupS8ZEyfwmBwB8ZxuJUbyBjotOZCmSZGyAZzbY4CnFLlJ0Css8E
         eN/OXj7qIub0bxCHz5cSqTdbpxww43q/E2+jIbAQd4GkV4zv00JluijCIOtH0HrBsXk1
         o4wtXUZSI2Fz7rdUJo6CgLQe28ioDq5wQ1jhi2jnsvPDdr2c2Xy/Xf5Znomo3JnJ43Ee
         p7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697557978; x=1698162778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10zDA4jsGdSEZi61OrVk/SewEnQtFeqKZqEsPJ4EUM8=;
        b=QnpypVSmWO2FEBG864fL4ivS0qIgs58eHGe2QUwAnffXUaZ78u2U2bIhHN+d9kisyx
         qeIDVMEBV7d89CnMx/Fu2xv2PjxH6EAkBnPZTlP2wh9l01HLvOpscAAt87mSWxvx5IPC
         dThJgmUbUPgEaLpCXta2DA8y3yiJkvMOIKrk1fHva8lXqV3q/f+4WSLGUuBDsU+oRPuX
         L14vEVWFS+ID/HXcXnsZy6sFzq2Clg5a6eFSg0lNtVNxEKCM3O3bGPeIdCDariQ/xyRs
         /HagdeiszEDnh2IGwb7jPLPRCe8SZNfajCMU51FOX6HjiCiXh6d4pxb0Zq5Kv7QtdOAK
         OrzA==
X-Gm-Message-State: AOJu0Yw4a8UowQhZ+UASJid+fIIxgf28LTiFJlbs3tZx1phBc9l1MjGf
        IwhE936FX6DdNaVd/cr6EqGwEhMM0+nSF7LvF8LbaIJfP+Jw4SIQBUY=
X-Google-Smtp-Source: AGHT+IG6sM/ZhJ4ysTbGo1k9yhPzo5wdQ80IrPALAf32Bz3GWktRcn1xp5WfvQM/UyHaGox9gOg6GbRomSkBDKpXAno=
X-Received: by 2002:a67:c39a:0:b0:458:19fc:e1e5 with SMTP id
 s26-20020a67c39a000000b0045819fce1e5mr3140690vsj.6.1697557978471; Tue, 17 Oct
 2023 08:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231016151848.168209-1-phil@gadgetoid.com> <20231016151848.168209-2-phil@gadgetoid.com>
 <CAMRc=Mec6=wFAMeQwUaxuj15fMYC4U+Mc_byT1RQUfXRgRFHLQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mec6=wFAMeQwUaxuj15fMYC4U+Mc_byT1RQUfXRgRFHLQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Oct 2023 17:52:47 +0200
Message-ID: <CAMRc=MeiGa2OCzMR+P=XF=u2Hum1NzzSLD_oavQTRBSUuab58A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 17, 2023 at 5:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Oct 16, 2023 at 5:18=E2=80=AFPM Phil Howard <phil@gadgetoid.com> =
wrote:
> >
> > Optionally vendor libgpiod source into sdist so that the
> > Python module can be built from source, even with a missing
> > or mismatched system libgpiod.
> >
> > Add optional environment variable "LINK_SYSTEM_LIBGPIOD=3D1"
> > so that the sdist package can optionally be built and
> > linked against a compatible system libgpiod.
> >
> > eg: LINK_SYSTEM_LIBGPIOD=3D1 pip install libgpiod
> >
> > Update build to add an additional sdist target for upload
> > to pypi. Call setup.py with "GPIOD_VERSION_STR" set, which
> > triggers a vendored package build. "GPIOD_VERSION_STR" is
> > saved to "gpiod-version-str.txt" and included in the sdist
> > for standalone builds.
> >
> > "GPIOD_VERSION_STR" must be specified in order to produce
> > a standalone buildable sdist package, this requirement
> > implicitly preserves the old build behaviour.
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
>
> I just realized one issue with this. Even if we indicate the version
> of libgpiod as v2.0.2 using the environment variable but actually
> create it from the master branch then the build-in code will really be
> the development branch not v2.0.2 stable release.
>
> This is precisely the kind of issue that linking to system lib allows
> to avoid. :)
>
> Anyway, maybe we would need an additional environment variable that
> could be used to point setup.py to the actual source tree we want to
> use, which may be different from the tree we're using to generate the
> sdist package? Typically we'd want to release the pypi package with
> the most recent stable release of libgpiod.
>
> Bart

Or we could even do it online and fetch the libgpiod tarball from the
official repo[1] at kernel.org?

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
