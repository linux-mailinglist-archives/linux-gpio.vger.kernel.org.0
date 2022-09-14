Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 180B65B84E0
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 11:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiINJWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 05:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbiINJW3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 05:22:29 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4BC82D0A
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 02:12:36 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dv25so33147678ejb.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NVf05MxsGGkxSVh6ElfnxGmkPmGgBxBBxxJUi46xaKM=;
        b=6ZoVPmCb8jZMOh3Xnf+tk5lQnDZcJzi9cKYvTpm5NqcehUoFtxeFaHH3hFthBsfndb
         b9BxMc1x+1TwcMIgCwACmDPPsvkwF4kQ+Fi8pxHIhpC65yNBREsEcvuhhcXiku9x8Bre
         p72CgUkiFaPJR00DidoPM1AM74yl8xC43OWqTHhIWoZdHLDvaUOpR5RfVyG9/LEOEdOr
         swbJqCfl80lbx2gPt7cocf3WkNWeEvJ4A4jpTDh2LPrL8t20ndUbOsGLYq9lRn20t0iI
         3D1n+gu14S04o1rmjzPs/9NeEGaTBcVu3P5K1T26pQxb2h54/IsKg1+B7cWNut5xc6I/
         DWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NVf05MxsGGkxSVh6ElfnxGmkPmGgBxBBxxJUi46xaKM=;
        b=C4JfRys3gJKWdmrPlZGZd/rZrkLdWSZ3+jsOuFmai03FM2lYpVOUcv8VDPiTxPhYrR
         c422OkXJQcz6oNg4OGfSFDp0a3WO/plK7cV7yavsYccYMxCVyiGLuzdCJJNIkI0PSXWF
         XRjP2jmhbJTeqctAvFSMb3VLAnKDiDPrbcV8yUlNiYkhcSgIqyhHA+r0c8x2FTJzCK90
         iwiRfEblLz98XP1U+1ZyfPJ82NPvVZw97zSLGkwyyzE4Yp1yKNHzvUKoRY65V9YsPns5
         qwJ7LgTXJfHGgF/p9ktbXp/iwOUYbS9yBP00PzdmRD4B6Z7KjmLjrAkOdOsjwDZRc+G6
         9P+A==
X-Gm-Message-State: ACgBeo1Yi2jIW90NDuFVqLnE5Xk7uFRpr+6kn4ftz/vB431yPrVVe7zt
        M4EgxykhGyzrX4UF3ZZkaH/XZlWfygsd9A6d1vPuU7E6Q1A=
X-Google-Smtp-Source: AA6agR4kYdMAAZq2bPOvC+gcMevuysrFERO0oiissfkalFgDjzQFzK6C9idy6IJgfhV2AC4QRJPqLI8MhCaQKVdxkPA=
X-Received: by 2002:a17:907:a079:b0:77b:8d9:9d9 with SMTP id
 ia25-20020a170907a07900b0077b08d909d9mr13258650ejc.697.1663146695940; Wed, 14
 Sep 2022 02:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <e8bf314dd0edfd0709d71e85fb8d877c3722e33e.camel@gmail.com>
 <CAMRc=Md47VUkZ47qoBpxSiHb6y5V2LsSkkO1ogvyY2KY4w4qyg@mail.gmail.com> <e6e721b3756db8b7a4bfe902af53e3377e681187.camel@gmail.com>
In-Reply-To: <e6e721b3756db8b7a4bfe902af53e3377e681187.camel@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Sep 2022 11:11:25 +0200
Message-ID: <CAMRc=MdvHwXPAXY5W5sSAw1f3PjQCcrYO___t4kWaRjK7feaNg@mail.gmail.com>
Subject: Re: [PATCH] tools: Change asprintf return code check
To:     Catalin Petrescu <catalin.petrescu@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2022 at 10:30 PM Catalin Petrescu
<catalin.petrescu@gmail.com> wrote:
>
> On Tue, 2022-09-13 at 16:47 +0200, Bartosz Golaszewski wrote:
> > On Thu, Sep 8, 2022 at 4:03 PM Catalin Petrescu
> > <catalin.petrescu@gmail.com> wrote:
> > >
> > > Hi there,
> > >
> > > I found a small error (IMHO) in libgpiod.
> > > The issue is that asprintf may return -1 if it fails to allocate
> > > memory, and if that happens, chip_open_by_number will pass a NULL
> > > pointer to gpiod_chip_open.
> > >
> > > I hope this helps.
> > >
> > > Thanks,
> > >
> > > Catalin.
> >
> > Hey Catalin,
> >
> > Please next time send the patch inline using git's send-email
> > command.
> >
> > You're right about the error code check but it should actually be ret
> > < 0 as per asprintf's documentation.
> >
> > Bart
>
> Hi Bart,
>
> I'll use git send-email next time. I was not aware of its existence.
> And I still need to figure out how to pass the gmail SMTP
> authentication.
>
> You're right, when asprintf returns zero, technically, that's not an
> error.
> My thought was that if asprintf ever returns zero, that means that the
> path is a zero-length string.
> So, the next call to gpiod_chip_open(path) will likely fail. But I
> guess, the right thing to do is to let gpiod_chip_open() deal with it.
>
> Thanks,
>
> Catalin.
>
>

Yes and also next thing we do is use strerror() which will return
"Success" for 0.

Bart
