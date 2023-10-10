Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9847BF315
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 08:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442235AbjJJGbZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 02:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442300AbjJJGbX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 02:31:23 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B58C9
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 23:31:21 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7b6043d0bbeso55044241.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 23:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696919480; x=1697524280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFFsvn1DouMyP8QgmuhXe30oXzdt0BFFDZz8hVnMg+w=;
        b=qpxzcdSAjZviJ2t8mggTj8+MMnBQ0KZ02WyVy5JrXIzQ18yOm4rxeodaQtxWpb8egG
         ITseqU+9vnHAUkpJyLb+WcA3Uz4JpdzqjCZZRGu7kU6W5fqs28xTijUMd2Pbs/If+WeN
         4Fv4tGwhO4X2gMPcWaiN7JoK/TPFqUbHtTyPB+AiXNW8lJ3NnAUgGUt4c253d0nhiGr8
         62GjFNdtwWmkSgdtyyfc+eDJ9XCRgAT6bjTbpT/uaFnggZqCwp+NeZSLxbiJ6/JWHU5P
         LYOfmljeQjNNiu1mYKp3491b9MePYFcHi3haXclnpbgncYb35PzfnzxfuSCYTXzJPdp/
         CUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696919480; x=1697524280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFFsvn1DouMyP8QgmuhXe30oXzdt0BFFDZz8hVnMg+w=;
        b=jKMUm0ClCN353RKdHE7Nn6ZBQ7MD7KWlubV1I+5izOOspIp8fp73t3QBGdESsoVW5d
         rdA79n78u9zZKCYUX1x122Agqvb4rA2XsKbaJxKSyjzvfD5nQQ3h5UMmFp8ti8ZYDuId
         hObPLayW+0q1cKvuUWQSCcv5yLenQtVhKmD1/507/iLn8UGWjz8eFY1zrRBHA9ehar/a
         cCMMY+VVBqR4Y9NdnPDhAa+M8yK112/q8DIluEEnbAb/dwg01VSQp7XCs4KLo4O63kLY
         G4cAXMaF6x+ACYbaqHxZohC5Ae9/5dmxBHtKw8+w/+i3py3oXkZxk9VDgUkRTrQhoAz4
         YPyg==
X-Gm-Message-State: AOJu0YyYAvj/6bnwy7BuxIoAYdRLokWiooODUtonsKwdcCxp5BIxzYHl
        Fxvr3ZOuOCfaTHXm6XZ1D4Smw6IyPeUuaDS316NNDA==
X-Google-Smtp-Source: AGHT+IFb5ebXdCcfV50Lu1cRi6NBUhvPuIpP7u3O90cWFXYRDiY0J492C1Wpp0GuXwlNta6KUEwQzQFzl0+5JRvVVyM=
X-Received: by 2002:a67:f64e:0:b0:452:db93:1ee3 with SMTP id
 u14-20020a67f64e000000b00452db931ee3mr12678518vso.30.1696919480242; Mon, 09
 Oct 2023 23:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231009190729.38675-1-brgl@bgdev.pl> <CA+kSVo-pkmque7Zig3a7iwRN=4OtHmi0dpyO5Zc9ttOabYd8XA@mail.gmail.com>
In-Reply-To: <CA+kSVo-pkmque7Zig3a7iwRN=4OtHmi0dpyO5Zc9ttOabYd8XA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Oct 2023 08:31:09 +0200
Message-ID: <CAMRc=Mdg2rasefCZAx+13pJh6boyKP6oWNBm6d1G_qn6VS=-gw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: replace PyModule_AddObjectRef()
 with PyModule_AddObjectRef()
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Mon, Oct 9, 2023 at 11:00=E2=80=AFPM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> On Mon, 9 Oct 2023 at 20:07, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > PyModule_AddObjectRef() was added in cpython v3.10 while libgpiod claim=
s
> > to depend on python v3.9. Replace it with an older variant that steals =
the
> > reference to the added object on success.
>
> Ah, fixing this makes much more sense than bumping the dependent
> version, thank you, I will update my patch.
>

And of course the commit message was supposed to read: "bindings:
python: replace PyModule_AddObjectRef() with PyModule_AddObject()".

I'll fix it when applying.

Bart

> >
> > Reported-by: Phil Howard <phil@gadgetoid.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  bindings/python/gpiod/ext/module.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod=
/ext/module.c
> > index 25c252a..b456190 100644
> > --- a/bindings/python/gpiod/ext/module.c
> > +++ b/bindings/python/gpiod/ext/module.c
> > @@ -178,9 +178,9 @@ PyMODINIT_FUNC PyInit__ext(void)
> >                 return NULL;
> >         }
> >
> > -       ret =3D PyModule_AddObjectRef(module, "__all__", all);
> > -       Py_DECREF(all);
> > +       ret =3D PyModule_AddObject(module, "__all__", all);
> >         if (ret) {
> > +               Py_DECREF(all);
> >                 Py_DECREF(module);
> >                 return NULL;
> >         }
> > --
> > 2.39.2
> >
