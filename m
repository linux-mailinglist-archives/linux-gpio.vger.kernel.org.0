Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD027B7C6B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 11:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241963AbjJDJk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 05:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbjJDJkz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 05:40:55 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543F3AC
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 02:40:52 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7afc13d58c6so889043241.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 02:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696412451; x=1697017251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lRgfQRKAHHfwXbD9Q7JdRGcIwxv86zSvFtRHGqUG0M=;
        b=Xc97QBYVCQaZVhraxWbq0f+ADRItdxQ2MHgpMoEJTEDLf4q6+VLgfm+FWUHpJ3LiBP
         F75VP++W3TJtwneG8AwEwi2Ke+wtDuItR6k7GllBcq6zYZp9G8NlA6dffwabL5mLJACZ
         iU4WzbhLFgJ1r/DtbEFR4hO74zhrhoUyTKIqW8MShgmcQZpMVhvfmxaQCymtWVbASAJQ
         X+LGpN4WG/g+gN8mJyOX7uMhcTF9EWxpRYSHF8a9Uze9Rjbxq1OGfVAOlKCtYJssFT06
         eVKk+30u5ZDL1iOcD2PUmBMBunnRqvtQYDwx/svNUnD1aak3zBWElSUSzoK9+89yeqgq
         U2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696412451; x=1697017251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lRgfQRKAHHfwXbD9Q7JdRGcIwxv86zSvFtRHGqUG0M=;
        b=umt8PFxKN9oj8jaxEUneebS8tyDtOGaYsd2kTVdeoUNGoRrgIC5h8RDsHcZmYdKNeN
         J02kzxgTKxbioisN4Bhi2Hymt/mcDwvYNNVr2LDx4fp07uETZA6ZNd2KGKPRg1DhgEec
         Co9RrS6qgIfUnriFGeXOctOFtBXf/NdcSyjUEh1LgXYjjcA3AxCUyAr3TBawJxQVNlm+
         ly9BovuWRQoVCZW28rzeAETFg2OjWmn+LmElbj7VeeFaOBz+M2jy0E9ATwLxDcDsHCW2
         kMx2pwlpyNHcOs3bTDzZ73Wt3pNfrm1TmePIslQLqUWIWxMT89usBo+U0N4a1EZyUwb6
         hAFg==
X-Gm-Message-State: AOJu0YxlvR8AcOgX7Neqtvs4jIJSGos9Nw3zrFeC91TzpFnk9d4bgRuu
        EEmbQPg8UcKjd7npEWKJiIVYbFqnwUfVYbQ2nDyNGaSz06aApzCY
X-Google-Smtp-Source: AGHT+IGxfuGcKzK+GBkAU3+b2fXkDnk+t6Y/rKafMasvYvZlBVDHtbpvJ1h/fFrPdV+0YvRqkUctiaAG92u7q5mA8ac=
X-Received: by 2002:a05:6102:3175:b0:452:951f:2bbc with SMTP id
 l21-20020a056102317500b00452951f2bbcmr1662205vsm.25.1696412450267; Wed, 04
 Oct 2023 02:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145114.21637-1-brgl@bgdev.pl> <CACRpkdY03QUkHcmyfTTfvVFbmNujW3qg5GcNJ-=8zj_zvGqDeg@mail.gmail.com>
 <CAMRc=Md7QKYqRaytw2xG8hqTmEDmZGxFfDyGZqoE96h-CvmJcw@mail.gmail.com>
 <CACRpkdZkQ8tJz=94rKGB4DcEC0z8HJHieZn5FD+-efRU-897Pw@mail.gmail.com> <CAHp75VfWi91WaJuoW0NWrHH9=KRjOcrwwCeiXhnBd6Wg+o2Qow@mail.gmail.com>
In-Reply-To: <CAHp75VfWi91WaJuoW0NWrHH9=KRjOcrwwCeiXhnBd6Wg+o2Qow@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 11:40:39 +0200
Message-ID: <CAMRc=Mf2820qT=h9GYFyKfG9jQjbFGTgsV4Uv=D-C853hOp79g@mail.gmail.com>
Subject: Re: [PATCH 00/36] pinctrl: don't use GPIOLIB global numberspace in helpers
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
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

On Wed, Oct 4, 2023 at 11:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Oct 4, 2023 at 11:42=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Wed, Oct 4, 2023 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
> > > What is your view on Andy's and Kent's issues with the _new() name
> > > suffix?
> >
> > We have done similar operations in the past, and it is similar to what
> > Uwe is doing for the moment with the .remove() callbacks.
> >
> > Usually the strategy is employed when the work needs to be spread
> > out over a few merge windows so it is a bit of a marker that "this is
> > in transition".
> >
> > There is the  horror story of this staying around forever and becoming
> > idiomatic: struct napi_struct (include/linux/netdevice.h) where
> > "napi" means "new API" - yeah that could have been handled better...
> >
> > If there is more moaning about it I will simply squash all the patches
> > into one and call it a day - the end result will be the same and no
> > sign of any *_new suffix anywhere. It was still worth it for reviewing
> > the driver changes on a per-driver basis so then it becomes one of
> > those Schopenhauer ladders that you can toss away after climbing
> > it.
>
> You can go with a compromise and name it better from the start, so at
> least the patches that are taking care of renaming back won't be
> needed.

What are you talking about?! The names are *FINE*. I DON'T want to
change them. I want to keep them. The temporary renaming is there to
make the review process easier but the end effect is that the names
stay the same with only the signature changed.

Bart

> Another way to have three or so patches with combined efforts, but still.=
..
>
