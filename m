Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B7D7E5EC5
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Nov 2023 20:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjKHTiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Nov 2023 14:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjKHTiH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2023 14:38:07 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982AF1FFC
        for <linux-gpio@vger.kernel.org>; Wed,  8 Nov 2023 11:38:05 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-45f3b583ce9so762586137.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2023 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699472284; x=1700077084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9jmA62WJ3dXDEDJ8zs60+IqD631L0FgH5nOpMqDxWQ=;
        b=si4XSq3cpFjl61aywG6Jo+qFzXc+z/SQ9SGdbMnUuR7vg/aiH1hpcfwli4oQJkiKfa
         XLnnxl07DRM6XMTLxEN5HU3HK50xWSzTfT6a3JjsCaSjkB3qQ3afckVgpDqzG1M3J8vq
         mHvC8RPbCNI7vTYPSx2uDCNJU6QLvKxQlqHhUS9HWmzx/J1rGt8njwE1MlZ3HT6pBWXr
         VOB6AFIfU7aR/Av8UNDoVeCjGMLdUpiJOEK5DqQCrzLifORBji3xmwiasyhV8Jjqwd26
         S20dxSxunSINXNc3/R7Dy1cpEBPsr+AibDWgdeNDgTwpzOop1LreXkj88fCqVH/jfzuM
         p33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699472284; x=1700077084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9jmA62WJ3dXDEDJ8zs60+IqD631L0FgH5nOpMqDxWQ=;
        b=O9cfvL+vZkKnY5UNxaKqDziVVA1RT6xvGo74WYogersyJcufcoyYiPMWMMjwHEp0Zv
         oC5gKEAuiXAXHtaj5EutZyJx3C76Z23bzqQL5RoV1Q03P9GTD/eOcv+cks+zU6TrWn9A
         r+yJiuyPnfmGHIpAIICcDRwkw/ofTLOqmh7wddlfHrdmdbm4MMKYSZHNq+dz52tFad91
         g5X+6yaVrJdIWBJJmCH4W+ZR0r0wAbsyJp8MvGlGj17X2L+mN7DR3FtzY/nFidQcplOO
         FUSiRq72uv8cOLsM633WZojtpXQhOeQQksoza4zi+MsyBuhFBFzQf0ZpZP013SJBwe8Q
         a1Lw==
X-Gm-Message-State: AOJu0Yzqbm2o1zWXZM/OMrFGmFgiyHL2wWA5A8L2rqwDbCTT7LR49xmA
        oRbw412+aWUqgh9VIKszN6uG2FfUeKGifpuEVOnUvJzSmQmnH0Tm
X-Google-Smtp-Source: AGHT+IEkLGfULOwTcWrlUVpDK7oc/DKEA/jBDqGoGdOPG3OVpodm+KGIR9+Qh1aC3Gi5c/CmNhO4rkKA9olprJmuNaw=
X-Received: by 2002:a05:6102:20c3:b0:450:cebb:4f15 with SMTP id
 i3-20020a05610220c300b00450cebb4f15mr1514130vsr.1.1699472284625; Wed, 08 Nov
 2023 11:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20231107134718.2913223-1-phil@gadgetoid.com> <CAMRc=MeGp7+UN52-2sh_gTea+y2evbyseJ+rko9-=3vDT46=ZQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeGp7+UN52-2sh_gTea+y2evbyseJ+rko9-=3vDT46=ZQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Nov 2023 20:37:53 +0100
Message-ID: <CAMRc=Mef7XW8NuV_sA1ARAqUoL0py2RmK__DuUgn-2auf3nfXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] bindings: python: fix library path for python test builds
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 8, 2023 at 2:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Tue, Nov 7, 2023 at 2:47=E2=80=AFPM Phil Howard <phil@gadgetoid.com> w=
rote:
> >
> > Correct top_srcdir to top_builddir for out of tree builds.
> >
> > Signed-off-by: Phil Howard <phil@gadgetoid.com>
> > ---
> >  bindings/python/Makefile.am | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> > index 079ceb1..b2f2779 100644
> > --- a/bindings/python/Makefile.am
> > +++ b/bindings/python/Makefile.am
> > @@ -15,7 +15,7 @@ all-local:
> >         GPIOD_WITH_TESTS=3D$(BUILD_TESTS) \
> >         $(PYTHON) setup.py build_ext --inplace \
> >                 --include-dirs=3D$(top_srcdir)/include/:$(top_srcdir)/t=
ests/gpiosim/ \
> > -               --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_srcdi=
r)/tests/gpiosim/.libs/
> > +               --library-dirs=3D$(top_builddir)/lib/.libs/:$(top_build=
dir)/tests/gpiosim/.libs/
> >
> >  install-exec-local:
> >         GPIOD_WITH_TESTS=3D \
> > --
> > 2.34.1
> >
>
> Phil, please squash these two patches together as you're modifying a
> line in the first one just to change it again in the second.
>
> Bart

Nevermind, I squashed it myself.

Bart
