Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579497B829B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 16:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbjJDOqb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 10:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbjJDOqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 10:46:31 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC316AB
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 07:46:27 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-493542a25dfso892998e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 07:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696430787; x=1697035587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwBDdPFutp4Wns+Ibf/M2e9ggWldvEkzAnfrfphtpkQ=;
        b=zI1E9XL6fpf2dHV/3SM+HVULvHPRd0qtUyg0M4TOTTCqQdzdL6IJrGo4pDmEwhvncG
         5WC5FJyJ3dCNGHgThuU1fNmGWqsbXnXOW0fAsr2MPkb0uNqHQd9FTZEFOmjugAEMVT1D
         VWhg486DeVrLxUT04FY5ZLzMclBDvo647ipw817mI0XTP6IkEkRn02FsQ1Ap2Kut2K85
         EUoUCSPH4amoXpu1IhU2Wa7IOR85lMCrvwGeugIo7Avr+ZJ/szMtVrSSWOdMBVEOl9SB
         RlponTZhzd/WhYw9SjKQD/TKEOsVxWjNud+LyhzpLiw7U2JNMZfR3xR3HODjguxYVUef
         8aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430787; x=1697035587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwBDdPFutp4Wns+Ibf/M2e9ggWldvEkzAnfrfphtpkQ=;
        b=RlIW7BmpMwZPa9iEH7jHBXiV9L5pvyChTw+atEv+ZTqZBjikrB+dn2eFTmAVX/c1E1
         VGWLnWolEjJKEO44W4en+t/WTdu7XVXu0ltuyuvq1JE8abyxSOdUREEAYeSJTo8ltAiM
         XkiurT/wYi3jbGCLFFter5+9k2y1QOI1yT8zsXFKZHQHRfiA10MpccXX3/qIiAy9uzo3
         1iS+Nlm0eIcxuCAofvzqyqieEyusNSurwRfCxLc6UaGrAq0ysO5rj/JSvy8fjviZFUpz
         cv3Spm/wnC78/VVkJe+F5l4YDVeqFOs3JWkTwp6CKgZt06DuVVF0w2TflkDnplgMxXCn
         15QA==
X-Gm-Message-State: AOJu0YwPTJ2ehAzszFlvXIJavAsTINJ6NOgwxMRF1WxvGNAC8ePLV8op
        FlQO+2AGCRUNOsbAGc6Y7WDGAjQjKmRmaA1Ej0G7GA==
X-Google-Smtp-Source: AGHT+IHowxYAlXaEo2LUwPOEzCMcE6e7W0t3/FURLEvqnOYDOVy4PsXfH6M8PFHYIPU8w4fvmpLliGDweCQVD9riZhA=
X-Received: by 2002:a1f:4ec1:0:b0:49a:3537:881c with SMTP id
 c184-20020a1f4ec1000000b0049a3537881cmr1960484vkb.14.1696430786959; Wed, 04
 Oct 2023 07:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <20231003145114.21637-35-brgl@bgdev.pl>
 <CAHp75VexazbYskr2pxOPzZe8q=o4ZCHnhcN6U1XX=Th8sxXCgQ@mail.gmail.com>
 <CAMRc=Mf9O0MKHKM0v3tongx+Aj3wxUaDcvSdNC+FZdXD3C_P0A@mail.gmail.com>
 <ZR1fb/nwg58AZ0y9@smile.fi.intel.com> <ZR1gOKF/laH05Clc@smile.fi.intel.com>
In-Reply-To: <ZR1gOKF/laH05Clc@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 16:46:16 +0200
Message-ID: <CAMRc=Mc-LQs1md91Q7Ld3tmRcd=N97Ry_RRgZEYBW6671EDdMA@mail.gmail.com>
Subject: Re: [PATCH 34/36] treewide: rename pinctrl_gpio_direction_input_new()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 4, 2023 at 2:53=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Oct 04, 2023 at 03:49:52PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 03, 2023 at 09:08:41PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Oct 3, 2023 at 5:16=E2=80=AFPM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Oct 3, 2023 at 5:51=E2=80=AFPM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> > > > >
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > Now that pinctrl_gpio_direction_input() is no longer used, let's =
drop the
> > > > > '_new' suffix from its improved variant.
> > > >
> > > > This and other "treewide" patches in the series are redundant. Just
> > > > name the functions better to begin with.
> > >
> > > I don't want to rename these functions. They have perfectly fine
> > > names. I want to change their signatures and the renaming part is
> > > there only to make the reviewing easier.
> >
> > So, then you can make them macros and based on the type of the first ar=
gument
> > use either old or new API, which you then make public. The all noise wi=
th
> > "_new" is not needed, really.
>
> To elaborate:
>
> First patch splits existing functions to the macros that use _Generic(), =
and
> old ones become renamed only on the implementation side (to _old or whate=
ver).
> Then you add a new ones and apply them to these macros as a second (defau=
lt?)
> choice. Then you convert users one-by-one or whatever preference is, and =
at
> the end you kill macros with old functions and rename "_new" again in a s=
ingle
> place (pinctrl core).
>

At which point do we go from "unsigned gpio" to "struct gpio_chip *gc,
unsigned int offset" as arguments here?

Bart
