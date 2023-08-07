Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67ECD772FDC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 21:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjHGTrh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 15:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjHGTrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 15:47:25 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90AE1BCB
        for <linux-gpio@vger.kernel.org>; Mon,  7 Aug 2023 12:46:47 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-791b8525b59so1826309241.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2023 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691437607; x=1692042407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pR1XLVuC4FafbCW0W8qRiCSP9MUCg1QW4kAwDb4GxSo=;
        b=fghvH5QtWy7Zl7Jl0YEwj3DzxNuyG2HC7oHrnVjlZsJYD9zEyF2qebYMCV2Uv7t8NZ
         sFeJeAH4WaN3Z8SK+OkSTrTowg/b6b+b5erQ/aYGIGYjFRknwG65fGd65ZcEa3+I6C2Z
         AiF1rLZdBjBQTodstckyybqXYO+jm+iCCSW3Jazipk1GBa9nczn7qrxySL5dNLhg8Evs
         1yWL9kybBF6STqC7FB6mizHNX8UwWBEXcqvLu9/FLxnxMEKCWz2y0IHYk4NNHDihpXEA
         DHFUEPOcyVD6lxnhNoN8WxyhqhSd/FzQl743YbXdXIQXjzWBncw+7Y6MgQ+4+2t1trqB
         bkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691437607; x=1692042407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pR1XLVuC4FafbCW0W8qRiCSP9MUCg1QW4kAwDb4GxSo=;
        b=LyD7D62X4KGFA2wCJcun7vUHd+D+9cd8gyeAees9QcqsjlC8DmtNvo4hGBclq2IYg3
         TZaYcOYh6DX2PBn5Ex2AAlJk5n0p4fvyl0D/a90jHNblIRVJ/ufLzgz51UYSzFf+8Io8
         Y9GgNJ1nqHlg3wktFp4zky4J4wKCZ2ez+ocC9/0/jlMWsgr2On4gvYUpDlwTyz//fOKD
         pP/zY6g94LHB6+WrmSCMxKb8KJwU6ws+jBHNyLdaMUOwLTXMyvpcUnVLsOx3FZIBepbf
         YaynJPmBstjC4jbVV4tNvi6eI1hZdXfNoEcCmob0nuloZX5gtFZbPTCkeCi+En71jHd3
         cfDw==
X-Gm-Message-State: AOJu0YyZPDRxEWxi+Dqu1VSC/7xAFBl+i1s5yLDTsbwybtkR5HzuqtBZ
        0t+yNPY4WxxTjQp3jnDV+zrFVDMycKG1NDC6CkF6tOWeu3pweYUVWNo=
X-Google-Smtp-Source: AGHT+IG94K+keUl/+2+aVAGMgU98pt5Otg48P0UbsMjjZNmROclhb27EIoGmi3qVQvhjZOAEbWSnRoV2YDrVZeafsow=
X-Received: by 2002:a67:d011:0:b0:447:7046:7254 with SMTP id
 r17-20020a67d011000000b0044770467254mr4484729vsi.35.1691437606891; Mon, 07
 Aug 2023 12:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230802152808.33037-1-brgl@bgdev.pl> <ZMuR0W303WCbS1K0@smile.fi.intel.com>
 <CAMRc=McEAG7Ezgb=OwMPoRhQzu_A66JMnB=aBSgmdZUvS-ZPhw@mail.gmail.com> <ZM1YW025tD6S/y+Q@smile.fi.intel.com>
In-Reply-To: <ZM1YW025tD6S/y+Q@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Aug 2023 21:46:35 +0200
Message-ID: <CAMRc=MebFDbkLLucmL_7dHBDOyRh3nQ1w3nLtsV8fVAQjaG_wQ@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: consumer: new virtual driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Fri, Aug 4, 2023 at 9:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 04, 2023 at 06:03:47PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 3, 2023 at 1:39=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > +     if (list_empty(&dev->lookup_list))
> > > > +             return -ENODATA;
> > >
> > > Instead you may count nodes here and if 0, return an error, otherwise=
 pass it
> > > to the callee.
> >
> > I'm not following, please rephrase.
>
> The below call calls list_count_nodes(), you may simply join these two ch=
ecks
> by calling list_count_nodes() and return -ENODATA in case it's 0.
>

We don't gain anything by doing that: list_empty() doesn't count
nodes, it just checks the head pointer. We would decrease readability
(more arguments!) for no reason.

Bart

> > > > +     swnode =3D gpio_consumer_make_device_swnode(dev);
> > > > +     if (IS_ERR(swnode))
> > > > +             return PTR_ERR(swnode);
>
> ...
>
> > > > +     if ((!live && !gpio_consumer_device_is_live_unlocked(dev)) ||
> > > > +         (live && gpio_consumer_device_is_live_unlocked(dev)))
> > >
> > >         if (live ^ gpio_consumer_device_is_live_unlocked(dev))
> > >
> > > ?
> >
> > Nah, let's not use bitwise operators for boolean logic.
>
> Then it's even simpler:
>
>         if (live =3D=3D gpio_consumer_device_is_live_unlocked(dev))
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
