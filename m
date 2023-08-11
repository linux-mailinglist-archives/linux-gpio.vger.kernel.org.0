Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378FA7797BD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 21:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236707AbjHKT1d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 15:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236717AbjHKT1d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 15:27:33 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182EA30F7
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 12:27:32 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-79d93e7ba34so1336515241.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 12:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691782051; x=1692386851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpvKbuECMPzdBo5ZNQCPGKS5T7oO9/mxI/5xeP2hJcg=;
        b=aqV1Tqn26tAyC/1KKHSypfx8XCO2SbIK5Xs9IuOrpTXiiG2oVcgppsXhsuW5tvY/yO
         AgqGawkabEsouqMj8ucp4Q21Zvs0SRFa0jQaczetNt9yRyM0abJ0Yru88YN9yPaIZFuC
         hc2xSV+NenPYTMWviB40tPmc40wfmRWDT3NAozQ4THJXyMG07VPcmIa1Fbh4kOymNBBX
         lQh5aHANz29gZUTm3HZFeSaFGGdF1VSw7Bc8jdAhf2f+fomlQDblCtJe5MgicAVHZ3vS
         pVqmUkOiVJAZlv43oIxkKDuZ28MnHwLgTuYps+2VZfXieLVWbXVkI/ZffMz8ZUDF0mzi
         O8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691782051; x=1692386851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpvKbuECMPzdBo5ZNQCPGKS5T7oO9/mxI/5xeP2hJcg=;
        b=YI7i5B3VOpoPG1mAWNu/Sk+I0pIo/BT5D7T+n01d8AfajR7CJOwMZeMKvtVR3Wxqh4
         2F80BZ/nesVMv8KUsh7oWdOb4Rp9ra/KyCw/1adp0oD3UJWRv5Ywpx1ZksFpTDQBaeW9
         9anvbu4bOjsayPKGMwpUhiffvAqB2LIA00S2wSLtyI/4QHUKGbqLdrRYcC58WdfRwmB0
         iaV1AuIlCp09bP26EbxJwG13eFIv7JUlwpD106+1i9ipSh32A33EI5zvpUF6050fBIlc
         2bmWJHSpSCpQDverWO5iSdywrMWRDZVUnNVdAm0yssAw7FL3wTg9iVIyqMLInrqm9roq
         kdRA==
X-Gm-Message-State: AOJu0YwsPsO7Bfk+p53k1F8pyDsXHrsmh7A0z4eLmTnH0DNIC5eScGcf
        WRiGIdZsr9CZul/C2Ie/qgXfTmnfKoxv4TFXU6rqiA==
X-Google-Smtp-Source: AGHT+IFz30T+lG3l27j8vGBsfpnzsIHZvSEeLW8dKkEdH1UUUwldNrP0QrEY5Xuyfzb1QRfQBHWWGEtRdh4geQCerFg=
X-Received: by 2002:a67:f996:0:b0:443:61f7:3ce with SMTP id
 b22-20020a67f996000000b0044361f703cemr2143192vsq.15.1691782051166; Fri, 11
 Aug 2023 12:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230810184846.22144-1-brgl@bgdev.pl> <CAMRc=MdOFpyz8u6xnPtB7+Q0qzq_JqZwaS3=yACAEJzLh60r-g@mail.gmail.com>
In-Reply-To: <CAMRc=MdOFpyz8u6xnPtB7+Q0qzq_JqZwaS3=yACAEJzLh60r-g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 21:27:20 +0200
Message-ID: <CAMRc=MerfgEWM+P3MMUF3r73jwEVe09Es9B13Erz4-2qL=PNsQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix reference leaks when removing GPIO chips
 still in use
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Fri, Aug 11, 2023 at 1:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Thu, Aug 10, 2023 at 8:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > After we remove a GPIO chip that still has some requested descriptors,
> > gpiod_free_commit() will fail and we will never put the references to t=
he
> > GPIO device and the owning module in gpiod_free().
> >
> > Rework this function to:
> > - not warn on desc =3D=3D NULL as this is a use-case on which most free
> >   functions silently return
> > - put the references to desc->gdev and desc->gdev->owner unconditionall=
y
> >   so that the release callback actually gets called when the remaining
> >   references are dropped by external GPIO users
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > v1 -> v2:
> > - add a comment about why we can't use VALIDATE_DESC_VOID()
> >
> >  drivers/gpio/gpiolib.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 251c875b5c34..2158067c4fd2 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2167,12 +2167,18 @@ static bool gpiod_free_commit(struct gpio_desc =
*desc)
> >
> >  void gpiod_free(struct gpio_desc *desc)
> >  {
> > -       if (desc && desc->gdev && gpiod_free_commit(desc)) {
> > -               module_put(desc->gdev->owner);
> > -               gpio_device_put(desc->gdev);
> > -       } else {
> > +       /*
> > +        * We must not use VALIDATE_DESC_VOID() as the underlying gdev-=
>chip
> > +        * may already be NULL but we still want to put the references.
> > +        */
> > +       if (!desc)
> > +               return;
> > +
> > +       if (!gpiod_free_commit(desc))
> >                 WARN_ON(extra_checks);
> > -       }
> > +
> > +       gpio_device_put(desc->gdev);
> > +       module_put(desc->gdev->owner);
> >  }
> >
> >  /**
> > --
> > 2.39.2
> >
>
> Queued for fixes.
>
> Bartosz

Eek, I need to back it out. I realized there's an issue with this
patch. I'll send a v3.

Bartosz
