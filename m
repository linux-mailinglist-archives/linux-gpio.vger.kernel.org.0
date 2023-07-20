Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775B875A9F4
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 10:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjGTI5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 04:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjGTIt7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 04:49:59 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473C4268F
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:49:58 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7996e265b4dso197538241.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689842997; x=1690447797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0tWQuLZCPmXJ6nLynn9kYWkcYgXWEr6OUjvbN0VeMc=;
        b=v9yCjKPjbTb79DwwMBskxwVe6PDo2hEfA3wDlKvBDNuOuaAucOBRRUbtv5T1VxHwXW
         5YTf6OoHfxig39FNN2emyCvF/upZ3hLYKn00KAQnTgaI1lRU+oLhN/cpLwxn95uSSpKi
         wUH07QAYhc64j7pmzCA12f/H8niO5VjpsCGlcVwHcQQnaxJThNJep95MoWxV86qAfHQK
         JumAEbVqAnll+ZF1EOlwgoCYeQSyiy2NwIjtalENJf6D6fZVWFzuhQ1hOLmF9S33bY64
         EQDrlzkOzgRFnM5G5S1W0pM2RYjGdXbQ0hT43kvBt7bevMQRc2n8/+kgxg4rGIXUpdIk
         zfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842997; x=1690447797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0tWQuLZCPmXJ6nLynn9kYWkcYgXWEr6OUjvbN0VeMc=;
        b=gkzBvotZke18Wugo9W4PAKTj2frKIuauHGbsZae52uH+wTVCHnkrI3VV9nxdZGSJhl
         6V7tKqDiLHXMA4VfdCrpj2cXRM6oXmc9Ztb++/dajlNMIBDRX2LFGfaU9ypLCch9/CpL
         gY4MalSsOP9Y9kXGFkqWTP+GfXxpR6/iVz1an1QioroFXlfo73sNF58Y1s8onKp8M3zb
         gEcS4z43M/S3c33gq14HH9zksbMs+6f5+AtyKfISR3rNgo/wRfv0Kv8MH5QDUJ/ioQiz
         Ztaxluw3lqruUJ33usimdCXrld9BzCtCZEfz6dr/n5zdUTn153Gz4P2bign8EVV8RVmE
         RLtg==
X-Gm-Message-State: ABy/qLaZWJrH7VykRYAVhbCK+qELkevqpBTYTBohh5O/5ZaEbG+hzzcY
        AvkZLHmJ9u0UtQGT4dKi/wUB+8FmeOi+9JYjbCkNjiSF+Y4LQ7LENkQ=
X-Google-Smtp-Source: APBJJlEI14de2Rg9a9Cx6Kb+4qKmks0WlVnC/Pt+sgv3GsqBko8s9j7nTu6aCNfblNNN9kI64+Ncezq+G9ukFvKDKfQ=
X-Received: by 2002:a67:f60f:0:b0:440:a3db:2d84 with SMTP id
 k15-20020a67f60f000000b00440a3db2d84mr3493072vso.15.1689842997382; Thu, 20
 Jul 2023 01:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230719192057.172560-1-brgl@bgdev.pl> <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol> <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol>
In-Reply-To: <ZLjyscgZM50A/PLb@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 10:49:46 +0200
Message-ID: <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 10:39=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Thu, Jul 20, 2023 at 10:25:14AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jul 20, 2023 at 10:05=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Jul 20, 2023 at 5:27=E2=80=AFAM Kent Gibson <warthog618@gma=
il.com> wrote:
> > > > >
> > > > > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wro=
te:
> > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > >
> > > > > > While working on the DBus API, it occurred to me that while we =
can obtain
> > > > > > the list of requested offsets from a line request, this informa=
tion lacks
> > > > > > context if we cannot get any information about the parent chip =
on which
> > > > > > the request was made.
> > > > > >
> > > > > > We cannot reference the chip in any way as its lifetime is disc=
onnected
> > > > > > from the request but we can at least provide the path to the ch=
aracter
> > > > > > device used to open it as a way of providing some context for t=
he offsets.
> > > > > >
> > > > >
> > > > > No problem with this conceptually, the only question I have is wh=
ich
> > > > > one of these should be stored:
> > > > >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> > > > >  - canonicalised path e.g. '/dev/gpiochip0'
> > > > >  - chip name e.g. 'gpiochip0'
> > > > >  - chip number e.g. 0
> > > > >
> > > > > In this patch we get the requested path, right?
> > > > >
> > > >
> > > > Yes, I think we should just use whatever filesystem path was used t=
o
> > > > create the chip as it would be the one allowing the caller to reope=
n
> > > > the same chip.
> > > >
> > >
> > > So there are instances where those four don't map to the same thing?
> > >
> >
> > Not in a typical situation, it can happen if the chip was removed and
> > another one took its place which is very unlikely.
> >
>
> And a symlink could get changed as well.
>
> > I just think that we cannot have any "hard data" as in: a programmatic
> > reference to the chip in the request (their lifetimes are not
> > connected), so the next best thing is the filesystem path.
> >
>
> Indeed - the chip fd used to request the line is out of scope.
>
> But the number of possible requested paths is many, whereas the other
> three options produce a unique and comparable identifier, in a searching
> sense.
>

So which one do you suggest?

> On a related point, does the DBus API allow a client to access lines
> requested by another client?  And if so, how can they be sure they have
> the right line?
>

Sure they can but various user permissions as configured in the
relevant .conf file may apply.

So what I've got so far in dbus (and feel free to check out the WiP[1]) is =
this:

There's an /io/gpiod1/gpiochipX object per chip implementing the
io.gpiod1.Chip interface. For each line there's a separate object as
well:

/io/gpiod1/gpiochip0
/io/gpiod1/gpiochip0/0
/io/gpiod1/gpiochip0/1
/io/gpiod1/gpiochip0/2
/io/gpiod1/gpiochip0/3

Line objects implement the io.gpiod1.Line interface and the daemon
emits a PropertiesChanged signal for any status changes.

You can call io.gpiod1.Chip.RequestLines() method on a chip object
which will return the object path to the new request.

/io/gpiod1/gpiochip0
/io/gpiod1/gpiochip0/0
/io/gpiod1/gpiochip0/1
/io/gpiod1/gpiochip0/2
/io/gpiod1/gpiochip0/3
/io/gpiod1/request0

The request will reference the chip object from which it was created
as well as the lines it controls.

Bart

> Cheers,
> Kent.

[1] https://github.com/brgl/libgpiod-private/tree/topic/dbus/
