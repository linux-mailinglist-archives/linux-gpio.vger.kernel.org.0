Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D15720640
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 17:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236616AbjFBPdX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 11:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236706AbjFBPdW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 11:33:22 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE1218D
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 08:33:20 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-43b27330e51so276739137.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685719999; x=1688311999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnozPpr9PIN7JWFNjwjsptNuMvRCJkqnXG6boNn6DTU=;
        b=yYT6R2kC18AiJqxeXIp8Bs0aTXQ738SAPOOvBktUsonDNViAYdp1XQQRgBnmScokLl
         Od70eOlPvmu/2LmE1/ZULUKv8I75yPK2J7cRmuiuVQ+sh4TTMZsQh/vM7pPMXIzrZDPZ
         zb8uB8TdG0tf2PassiyzFHFQrtTVLVS4U/8Pq5bZhDqGRF+ZoxvaTxdqgNgsG7wIP0Q1
         8LTrstMYXj2BuHkaG++yQqYZjm+mg3a7wIh052uU8guC4DjaSim+ZBHctuiPvatX0L7W
         aqTfHMevNLg860vKjLfbPCZUHhXONI1KQZyOls6gf6TzkvkGWM8h/+rhBKxE/yzMf7iq
         n4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685719999; x=1688311999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnozPpr9PIN7JWFNjwjsptNuMvRCJkqnXG6boNn6DTU=;
        b=jlKIQNAKEro7tTRcRtisLycEv9mD3075dQWlPPEfcnA5kIv5NA/kBm0iMPMbYls/bB
         +LyjwXBC8ZdbSg2letg8DNRq5UcvdYCeIk8PQCy5MEN99v9GqroSVGZUe/L+6v8QVIcR
         w4KxTjkFWcpr7EBHaoRAKjzNzgyQPf7I5Uzj4nBOUhMlZkSk75fE7I8h1dtMg+gHJk/l
         kRs3Kero2gjAUCwDVDq4mzAeCteL4xfgxSUIlzOur/qKm8qv3KA95yLYAOW6e9AjqLvx
         e+2UAdDUzHwXGvwIVNoMsWQIx6MF0DwhffHyw4WT0D7/NhwKdTXQmINKD8CDEryN6muq
         Khrg==
X-Gm-Message-State: AC+VfDz/GtBoH1QsnR4Vb20ZTby+Vh3eOcG5ss2PKm9O85mvZXv/4xl4
        vB1lCX3yPvZ9TqgGCCHi6DgQmJIBOOCVAFcL41bFFTwHLNviCRcA6C0=
X-Google-Smtp-Source: ACHHUZ6BQ2xl7IoQB6bc7WeXCatj+9/L5NNXNMa89H7y9CiWJuAhyHdD04n5o9WAtOJXdVIsdrnkcV9urCFx1uX81H8=
X-Received: by 2002:a05:6102:134b:b0:434:f277:86ff with SMTP id
 j11-20020a056102134b00b00434f27786ffmr5857949vsl.29.1685719999354; Fri, 02
 Jun 2023 08:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230601140950.779453-1-brgl@bgdev.pl> <ZHirBqDkd99qWGX8@sol>
 <ZHjONQW0qVMseySZ@smile.fi.intel.com> <ZHlQT5KeU+7GkYba@sol>
 <ZHnFxdcZJEd1ta0R@sol> <CAMRc=MeC=H+Qvew3jrwPR6MMa=rO1Ds_5dN_tZZGS_C1zMz+FQ@mail.gmail.com>
 <ZHnuCjd5gDPDoDjq@sol>
In-Reply-To: <ZHnuCjd5gDPDoDjq@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Jun 2023 17:33:08 +0200
Message-ID: <CAMRc=MdRiJUURRZxqwm87b7H=DEFuyW5OOqKrqXjrveVNw7BPw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 2, 2023 at 3:26=E2=80=AFPM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Fri, Jun 02, 2023 at 03:10:18PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Jun 2, 2023 at 12:34=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Fri, Jun 02, 2023 at 10:13:35AM +0800, Kent Gibson wrote:
> > > >
> > > > On a related(??) note, I'm occasionally seeing Oopses when testing =
this
> > > > - when creating a basic sim with a shell script, not when deleting =
it.
> > > > In one case after a fresh reboot and on creating the first sim, so =
it
> > > > looks to be purely the construction.  Yay :-(.
> > > >
> > >
> > > I had thought it would be difficult to reproduce this and so difficul=
t
> > > to bisect.  Fortunately(??) not.  If I run my setup and cleanup scrip=
ts[1]
> > > in a tight loop it occurs very readily.  Haven't bisected it yet, but=
 did
> > > test it on 6.1-rc1 and it Oopsed there too, so I would need to go bac=
k
> > > further.  What was the initial release containing gpio-sim?
> > >
> > > The sim setp is pretty simple - a couple of banks each with a few lin=
es
> > > and hogs.
> > >
> > > Could you confirm that you can repeat the problem?
> > > Otherwise I might start thinking there is something broken in my test
> > > environment.
> > >
> > > Btw, the loop script is:
> > >
> > > #!/bin/env bash
> > > for (( ; ; ))
> > > do
> > >         echo "create sim..."
> > >         ./basic_sim.sh
> > >         echo "destroy sim..."
> > >         ./clean_sims.sh
> > > done
> > >
> > > Cheers,
> > > Kent.
> > > [1] https://github.com/warthog618/gpiosim-rs
> > >
> >
> > With this script I've been able to trigger an issue but it looks
> > different from yours: https://pastebin.com/cbsgT2ae
> >
>
> Looks similar to me.
> I would assume that is the same issue - even if the  particulars of the
> crash differ.  If you can fix that and my problem remains then we can be
> sure they are distinct.
>
> I've been doing a coarse bisect to see how far back this goes -
> basically looking for a known good.
> 5.18 crashes, but it crashed hard, so no syslog.  It did run considerably
> longer before crashing, so that could be different issue masked by the
> other (later?) one.
>
> Moving on to subsequent releases...
>
> Cheers,
> Kent.

I managed to trigger a different crash: https://pastebin.com/6Gx29vHB

This one happened in gpio-sim:

$ ./scripts/faddr2line drivers/gpio/gpio-sim.o
gpio_sim_make_bank_swnode+0x12f/0x220
gpio_sim_make_bank_swnode+0x12f/0x220:
gpio_sim_make_line_names at
/home/brgl/workspace/yocto-gpio-sim-crash/build/linux/drivers/gpio/gpio-sim=
.c:725
(inlined by) gpio_sim_make_bank_swnode at
/home/brgl/workspace/yocto-gpio-sim-crash/build/linux/drivers/gpio/gpio-sim=
.c:837

But to me it looks like some memory corruption if the stack traces are
so random... Where is Rust when you need it? :)

Bart
