Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C187E6B18
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Nov 2023 14:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjKINQz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Nov 2023 08:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjKINQz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Nov 2023 08:16:55 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66D930CD
        for <linux-gpio@vger.kernel.org>; Thu,  9 Nov 2023 05:16:52 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1f0f160e293so489916fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Nov 2023 05:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699535812; x=1700140612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duGI+QnVDD+gmXWRCdlzxN+ZsIAFqqTDfeZNwawnuZM=;
        b=JcalvDp0uEgzDX0ZslrV20KpZ7RSf0eH/iaYtzWPGVH2dvSrawm98IcKIg6pERu6Oa
         8pQMHPRB8UxdXEnQor9TEPVfKXPDZkORU/ZdkQ9nLHnchv1BNhMKwjU8xf7TJryTnSD2
         +OC+krUAEf2v2miinqmTbUgX5ueHmXGjQWXbFFDlkhqbkgT9s2/KQ1CvYxj78mLmmoHL
         py2QOQC1Pblc7z4Jo1ktLr2uDTDAfE+jAQSUhq4HCo3OSy3onYyDYeiuhoWBI0LThQC9
         xE82RbtFRijQtpOXZ7ZA7IbGVF+HVlO7uN86JTUWPsM5SxtP3FSfqzkqPS1o8LlMWvJE
         V2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699535812; x=1700140612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duGI+QnVDD+gmXWRCdlzxN+ZsIAFqqTDfeZNwawnuZM=;
        b=WJOSwhh3U8nudwnCYjXk9EUcGmYvUVqVCXrCo/hWsvpea99fTCMER4Mks7bmQy1Laq
         Bc2g7uxDrm3jukUWofUW1dZ0t1MAmAJTSHrtw8T+9x4CvT+tLYWxxI6AqRG5mA2y1QHa
         yH8EYkBg1aXzimqEbVX108PggGlnYKjKdpqYQEZVGjFc7TJvm61yVDMHR4Fay/xPms+z
         dmWB+AYfS6U2v5ZYgPoqmxDUSkPB1nzb6yQ3F97gzlSKYZnjvJcTlQEqoMfXH1ndVu9M
         PghYikj7R+xQm315pYWMoEMEjjZZaUJp47Ew1REX94owoenldUon0Q2Za+eX6dwTVA6E
         m6mg==
X-Gm-Message-State: AOJu0Yw9CJRMhxfbiQ7p+zJ1inxLSC7WGgYeYLLjCCYMgvhC1BQAtT+r
        MvlVM2QwdYPCIQmoNLn/GT8QdSZLTtWiFpXzZgUVEg==
X-Google-Smtp-Source: AGHT+IGgZW1PSFbZvbMn9Ey7Bnj1vDB+MLhuh7xvv9xo4Ek7N1fnEz1L1RWQ8DgR0SAuK7bObQ2U7n2rPmoMlcHv3HU=
X-Received: by 2002:a05:6870:14d4:b0:1ea:647f:a9b6 with SMTP id
 l20-20020a05687014d400b001ea647fa9b6mr5546475oab.44.1699535812191; Thu, 09
 Nov 2023 05:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20231107134718.2913223-1-phil@gadgetoid.com> <CAMRc=MeGp7+UN52-2sh_gTea+y2evbyseJ+rko9-=3vDT46=ZQ@mail.gmail.com>
 <CAMRc=Mef7XW8NuV_sA1ARAqUoL0py2RmK__DuUgn-2auf3nfXg@mail.gmail.com>
In-Reply-To: <CAMRc=Mef7XW8NuV_sA1ARAqUoL0py2RmK__DuUgn-2auf3nfXg@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Thu, 9 Nov 2023 13:16:41 +0000
Message-ID: <CA+kSVo851PMrRshCk+B=QtZn1nrzT8KBqyuFTz4hHZJxyBopLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] bindings: python: fix library path for python test builds
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 8 Nov 2023 at 19:38, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Nov 8, 2023 at 2:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > On Tue, Nov 7, 2023 at 2:47=E2=80=AFPM Phil Howard <phil@gadgetoid.com>=
 wrote:
> > >
> > > Correct top_srcdir to top_builddir for out of tree builds.
> > >
> > > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > > ---
> > >  bindings/python/Makefile.am | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.a=
m
> > > index 079ceb1..b2f2779 100644
> > > --- a/bindings/python/Makefile.am
> > > +++ b/bindings/python/Makefile.am
> > > @@ -15,7 +15,7 @@ all-local:
> > >         GPIOD_WITH_TESTS=3D$(BUILD_TESTS) \
> > >         $(PYTHON) setup.py build_ext --inplace \
> > >                 --include-dirs=3D$(top_srcdir)/include/:$(top_srcdir)=
/tests/gpiosim/ \
> > > -               --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_src=
dir)/tests/gpiosim/.libs/
> > > +               --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_bui=
lddir)/tests/gpiosim/.libs/
> > >
> > >  install-exec-local:
> > >         GPIOD_WITH_TESTS=3D \
> > > --
> > > 2.34.1
> > >
> >
> > Phil, please squash these two patches together as you're modifying a
> > line in the first one just to change it again in the second.
> >
> > Bart
>
> Nevermind, I squashed it myself.
>
> Bart

Thanks, I sent them split since the latter speculative fix hides the previo=
us
actual bugfix but perhaps a better commit message could have worked.

--=20
Phil
