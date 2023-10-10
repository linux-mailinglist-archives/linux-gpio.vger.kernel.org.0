Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 477D27BF826
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 12:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjJJKBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 06:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjJJKBf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 06:01:35 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0B793
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 03:01:33 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a7bbcc099fso8263677b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696932092; x=1697536892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KnCKRITOv5I0m79M+W59hTFCqIZxFe7ENzvwgtAZmg=;
        b=jYG3qVoTcHCDRj2Y31OuHc8fkjI1eEZFeleZ9OuHR8IVUIjQirYoENxUQ4GusD36f8
         IomknygQiM9G21aEMt7oCQ4298WlAi33Rk/N9D34w+lMjII8kDGlcGfasTbOw+gBeyyj
         8GL4+/as2CzMYK92aFWLzdxJOKt4Lg9LB+tTnFWZMGLbVKzOw6BroD247hN0JHXkI+u9
         6z+erOh50uYPA+/qsmb+QizM/22B2wrBpVsB1o8znH6kYjpMjGhlpyUCk3Gen+1DRrq3
         rXo6JpofDUHlxCTLfq0Sl/SCtFn9MSQWEioIk2Jx6UEQ7Fhtr8w4RdwTziVE6CsMmlc3
         /hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696932092; x=1697536892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KnCKRITOv5I0m79M+W59hTFCqIZxFe7ENzvwgtAZmg=;
        b=N1c3HS2Q4WN7S0zco8G+P3ThjNmG7NytODbyubefXNzBVJHLvkopsEGcyjOpaxKdM9
         v/rP8QVsqw+YL/1YkiuwWNGOSHd1itgex9+QVAgg81A4RV/KNiEpWJlWWxj4eUtRkSbs
         Q6rne2P1j+ONUGUgxuh1DRcUGVJieaFkOO7z8TO4M/aKw7hCz7nQ6dAKclymOKhLtNqJ
         LSq5qauptOj0AY9xGjqeTYE9c7FN9s+cLMJC5Qf1RIT7VLO18oUWDvWdD7rGTUdh1OSH
         xJj/s1jhyL22XH0wvvDwXKYx6XXS09zXLDYefVMSo9zu+9Ozhhw9XbeELM6LYTIN3+Yg
         M2ng==
X-Gm-Message-State: AOJu0Yz2q3ED/M0ZjtCJRF98M4gsrOOf7/PPp0SI5K5UTMsLYZayhks2
        9dmGduqtL/wCdm002LVk+ZBaZ7duIANKQ4tr0h9qlQ==
X-Google-Smtp-Source: AGHT+IFmY2vOCoez0i9jWFIOe+JW2WhPvQKQhd8EZ9Ru/3LydEJKIcl6zMbI9WUcrArJ+HpdjhX2zjWnu5YzqCdLgCw=
X-Received: by 2002:a81:78d3:0:b0:5a7:a817:be43 with SMTP id
 t202-20020a8178d3000000b005a7a817be43mr2949300ywc.6.1696932092454; Tue, 10
 Oct 2023 03:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231009190729.38675-1-brgl@bgdev.pl> <CA+kSVo-pkmque7Zig3a7iwRN=4OtHmi0dpyO5Zc9ttOabYd8XA@mail.gmail.com>
 <CAMRc=Mdg2rasefCZAx+13pJh6boyKP6oWNBm6d1G_qn6VS=-gw@mail.gmail.com> <CA+kSVo-0XroiBgiGHkk9SfKsWsW-_rsqd1MxuL=bVcydbxfFew@mail.gmail.com>
In-Reply-To: <CA+kSVo-0XroiBgiGHkk9SfKsWsW-_rsqd1MxuL=bVcydbxfFew@mail.gmail.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Tue, 10 Oct 2023 12:01:21 +0200
Message-ID: <CACMJSeuXd1OSnjmM2Z6MnJOm=rCYJQ1EtYKM5BjrzjhmyFEurg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: replace PyModule_AddObjectRef()
 with PyModule_AddObjectRef()
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 10 Oct 2023 at 11:50, Phil Howard <phil@gadgetoid.com> wrote:
>
> On Tue, 10 Oct 2023 at 07:31, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Mon, Oct 9, 2023 at 11:00=E2=80=AFPM Phil Howard <phil@gadgetoid.com=
> wrote:
> > >
> > > On Mon, 9 Oct 2023 at 20:07, Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
> > > >
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > PyModule_AddObjectRef() was added in cpython v3.10 while libgpiod c=
laims
> > > > to depend on python v3.9. Replace it with an older variant that ste=
als the
>
> I've done some digging and it looks like "PyModule_AddType" [1] helper
> function is what's
> anchoring the library to Python 3.9 (in the stable ABI as of 3.10)
> rather than 3.8.
>
> Is that correct? If so I'll update my patch to reflect the use of
> PyModule_AddType.
>
> The raw Python part of the library is compatible back to 3.7 (EOL),
> 3.8 EOL is this time next year so going < 3.9 is probably not worth the e=
ffort.
>

Agreed, and most distros ship >=3Dv3.9 anyway.

Bart

> 1. https://github.com/python/cpython/blob/43a6e4fa4934fcc0cbd83f7f3dc1b23=
a5f79f24b/Python/modsupport.c#L686-L703
>
> > > > reference to the added object on success.
> > >
> > > Ah, fixing this makes much more sense than bumping the dependent
> > > version, thank you, I will update my patch.
> > >
> >
> > And of course the commit message was supposed to read: "bindings:
> > python: replace PyModule_AddObjectRef() with PyModule_AddObject()".
> >
> > I'll fix it when applying.
> >
> > Bart
> >
> > > >
> > > > Reported-by: Phil Howard <phil@gadgetoid.com>
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > ---
> > > >  bindings/python/gpiod/ext/module.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/g=
piod/ext/module.c
> > > > index 25c252a..b456190 100644
> > > > --- a/bindings/python/gpiod/ext/module.c
> > > > +++ b/bindings/python/gpiod/ext/module.c
> > > > @@ -178,9 +178,9 @@ PyMODINIT_FUNC PyInit__ext(void)
> > > >                 return NULL;
> > > >         }
> > > >
> > > > -       ret =3D PyModule_AddObjectRef(module, "__all__", all);
> > > > -       Py_DECREF(all);
> > > > +       ret =3D PyModule_AddObject(module, "__all__", all);
> > > >         if (ret) {
> > > > +               Py_DECREF(all);
> > > >                 Py_DECREF(module);
> > > >                 return NULL;
> > > >         }
> > > > --
> > > > 2.39.2
> > > >
