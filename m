Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5E07BF7DB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 11:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjJJJuw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 05:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjJJJuu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 05:50:50 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A87693
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 02:50:48 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1dd0526b5easo4070288fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1696931447; x=1697536247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9uN7FKPIyE/MdVLsJ9DhU82fz4qkDyb1atfH3f5guc=;
        b=UZPZKuqL3ll1D1HL+GOMmVeFkOd+7OG5Z5IWZvLr99hShRXuODzzgDv2L/a3iyzYrF
         9hsiUD3jp/7ehGBYEddTQGyPtdzpeeTyQwQKpKMqA/FxAoeWDaHdukuHMGsMZu2ojbBA
         mW+5/5qVS4BaS+1Olv2kroep4EltjrlYGHLpTmyTliPtEnNT87HIH6NhIE5HMlGrvZ3W
         bQEUL/4vF3NXcmEXpY5GuCkkCvZkqR+1WGoTwjT1coi5YXmwwe8+2i9K4Y+U3U78oNci
         Lf6X5eSPIB0OKuT9rfShbQIztwKwVGQQq4JTlr584NlkiQxzwfb79Ab6+T/0kOQ8Xryh
         /IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931447; x=1697536247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9uN7FKPIyE/MdVLsJ9DhU82fz4qkDyb1atfH3f5guc=;
        b=lmrzn42kpzz27tbpy7CmoleMjJC5vy/hbsrAkOlHEjr1fvF5WlR+gPd9LZkmaYXDW7
         Lv7wzdJ1k2+55En52VH1IJNlw3LKFZQu2NmUSQA0oz6agQj2QDgd69vQG6/KMy1//KzJ
         nbGtS5efJYahJvMapAmESxeK6R2QB4cpOZprn+RN8U3OfQ8oRywTxq1sLn/w/xOpgqAU
         cWOs2GGfH1qKBjy6ixca/2Q1a03zqgIwM0PKZqBpesftrCm5oq3jPUO2lPWTBFDXjhOP
         dbb8kcNc4mDlvxPD0xXU5PBy+1XI/OFh9TUQd1s2h+MzJhFIMFWc5e6wZCGLry2sgVJT
         vHnQ==
X-Gm-Message-State: AOJu0YyKb3UjbmTyuKLfoIqo6KYPB712DPGzMq4sFOEiJKDnOpkiO/Ex
        uzUYWQQzQ4LAQedZ9a9LRUEsaPkyxJwON8jNkux9PA==
X-Google-Smtp-Source: AGHT+IFRE0qGCHVAcoRontqIx7rD5PYlFdkcToBY4u3/dMjBzYRZr6pYkPDEhu5g4uxfNb3/1zQdP6Our0E5Tkl9Elo=
X-Received: by 2002:a05:6870:330e:b0:1dc:a055:8587 with SMTP id
 x14-20020a056870330e00b001dca0558587mr21481256oae.6.1696931447665; Tue, 10
 Oct 2023 02:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231009190729.38675-1-brgl@bgdev.pl> <CA+kSVo-pkmque7Zig3a7iwRN=4OtHmi0dpyO5Zc9ttOabYd8XA@mail.gmail.com>
 <CAMRc=Mdg2rasefCZAx+13pJh6boyKP6oWNBm6d1G_qn6VS=-gw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdg2rasefCZAx+13pJh6boyKP6oWNBm6d1G_qn6VS=-gw@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Tue, 10 Oct 2023 10:50:36 +0100
Message-ID: <CA+kSVo-0XroiBgiGHkk9SfKsWsW-_rsqd1MxuL=bVcydbxfFew@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: replace PyModule_AddObjectRef()
 with PyModule_AddObjectRef()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 10 Oct 2023 at 07:31, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Mon, Oct 9, 2023 at 11:00=E2=80=AFPM Phil Howard <phil@gadgetoid.com> =
wrote:
> >
> > On Mon, 9 Oct 2023 at 20:07, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > PyModule_AddObjectRef() was added in cpython v3.10 while libgpiod cla=
ims
> > > to depend on python v3.9. Replace it with an older variant that steal=
s the

I've done some digging and it looks like "PyModule_AddType" [1] helper
function is what's
anchoring the library to Python 3.9 (in the stable ABI as of 3.10)
rather than 3.8.

Is that correct? If so I'll update my patch to reflect the use of
PyModule_AddType.

The raw Python part of the library is compatible back to 3.7 (EOL),
3.8 EOL is this time next year so going < 3.9 is probably not worth the eff=
ort.

1. https://github.com/python/cpython/blob/43a6e4fa4934fcc0cbd83f7f3dc1b23a5=
f79f24b/Python/modsupport.c#L686-L703

> > > reference to the added object on success.
> >
> > Ah, fixing this makes much more sense than bumping the dependent
> > version, thank you, I will update my patch.
> >
>
> And of course the commit message was supposed to read: "bindings:
> python: replace PyModule_AddObjectRef() with PyModule_AddObject()".
>
> I'll fix it when applying.
>
> Bart
>
> > >
> > > Reported-by: Phil Howard <phil@gadgetoid.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  bindings/python/gpiod/ext/module.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpi=
od/ext/module.c
> > > index 25c252a..b456190 100644
> > > --- a/bindings/python/gpiod/ext/module.c
> > > +++ b/bindings/python/gpiod/ext/module.c
> > > @@ -178,9 +178,9 @@ PyMODINIT_FUNC PyInit__ext(void)
> > >                 return NULL;
> > >         }
> > >
> > > -       ret =3D PyModule_AddObjectRef(module, "__all__", all);
> > > -       Py_DECREF(all);
> > > +       ret =3D PyModule_AddObject(module, "__all__", all);
> > >         if (ret) {
> > > +               Py_DECREF(all);
> > >                 Py_DECREF(module);
> > >                 return NULL;
> > >         }
> > > --
> > > 2.39.2
> > >
