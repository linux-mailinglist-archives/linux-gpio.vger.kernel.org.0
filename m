Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 593B0EDC48
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 11:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfKDKPI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 05:15:08 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36758 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfKDKPI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 05:15:08 -0500
Received: by mail-ot1-f68.google.com with SMTP id s3so6298950otk.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OgCCsceRy9h7bryx9QISpPy+HkrehZwdB/S8gHBbkX4=;
        b=sMd7nn1noith/dDz1tDq8h2czg+UsGoXI6SC0aJ2G2cZe/kPrr9EWFfJl4txzZELa4
         ZGEt+zgFkBrI8xj7OfRluNZ+yfMus93HnvOYx16O9cREy1Uhd5TdvV01AmQqR6KRCZyx
         SiIYps2WBy0IcYzyAaWvRSahKelraCl5dVdkbYDCpWmnydQy9yMZF86VOKRfbE9LEYJG
         it+oXazD/etNPcubJOLFsRuGR4XmN4E1TKDk9exulk9o/TL8fX4y63qdW6ANH4Zio+xl
         cXdOD59c//HoPsQpwkGNuiXeBkjaLXQ2DWDAHSET9SdE0xndE/tBSMK4hstjxsXZ/+SI
         qxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OgCCsceRy9h7bryx9QISpPy+HkrehZwdB/S8gHBbkX4=;
        b=OqPFl/1hWtr67+o4pNVZPA7d7wQu/5+pD9cNnlMNOTlNOLByRj8+KCPffQfcEWEpbR
         YHBY3tY6TAZTPvFbfP0dqLHxgY9veN9X1d7Oo7NvWe4fCGu78nyYYjle/KnSvVzmk8cs
         SRnGVWJ84eDbosnEURvNdADU+YoKcqfVNMbcGHnV7GfYJVf0Yd+N9L35p+D54HWKA4l5
         UWkTYEThKnPpj+eVMk2mVAuZSmIXQwWBSoyNNvKjMeT17EAmTcc2LMo+Kq2joPcauRKP
         p//NGCar5E7qRXIZsgjqBGnZ4KHvkSmXKYVi/0zAaa96K/D6jfQJPCvlMVSMfsgIlZOm
         xe5Q==
X-Gm-Message-State: APjAAAWDH9hPSEUNKoCfb7yjEVH8eCXVbfX6tH8qCUv1WDrlTaNY6OAy
        /amCg1ApzebBVsiKsn3tAdwV+1Wj/nqrsvdpwew+hA==
X-Google-Smtp-Source: APXvYqzg7uQdAIT4BjfsfaTPzNFPCrnB69h6oY6LvfdUoRYCrFixYr7IhtIPMKB1F+sqgtJUPytDIPtJETmSELPH2J8=
X-Received: by 2002:a05:6830:210e:: with SMTP id i14mr3866315otc.250.1572862507121;
 Mon, 04 Nov 2019 02:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20191028073713.25664-1-warthog618@gmail.com> <CAMpxmJUO3O05d6ZQijF4+1OCf5E7oeYOPVMZCmOXBV9-VJz5jw@mail.gmail.com>
 <CACRpkdayzONkSnHr+C7e2NVrDP7_Di+PTK6MtM0Kx_Mte+=2Cg@mail.gmail.com> <20191104010736.GA9134@sol>
In-Reply-To: <20191104010736.GA9134@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Nov 2019 11:14:56 +0100
Message-ID: <CAMpxmJUim4SV43McHR2X0Ukc2_zZrdj=cZPvAaETyp4kSObCSA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 4 lis 2019 o 02:07 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Mon, Nov 04, 2019 at 01:26:54AM +0100, Linus Walleij wrote:
> > On Thu, Oct 31, 2019 at 8:10 AM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> >
> > > [Kent]
> > > > This series adds gross control of pull-up/pull-down to the GPIO uAP=
I.
> > > > Gross control means enabling and disabling of bias functionality,
> > > > not finer grained control such as setting biasing impedances.
> >
> > Right, excellent and persistent work here, much appreciated!
> >
>
> No problem - hopefully I haven't irritated too many people in the process=
.
>
> > As long as I get Bartosz's blanket ACK on v5 I think it is ready
> > to merge. His consent is required for this.
> >
>
> I'm still waiting on open questions from v4 before submitting v5:
>
> One, handling of errors when setting bias, Bart has referred to Thomas,
> so waiting for feedback on that.
>

If we can get it merged for v5.5, then I don't want to block it
waiting for answers. Looking at the code I think we should only ignore
the EOPNOTSUPP error and propagate all other codes. Can you add a
patch changing that and then fix the other nits I pointed out? Also:
please Cc Thomas Petazzoni so that he gets the chance to yell at us if
it breaks something.

> The other, where gpio_set_bias is hooked into gpiod_direction_output,
> is fine as is for the UAPI - it can always be relocated subsequently if
> other APIs need to set bias.  On the other hand, if decoupling setting
> direction and bias is in order then that really should be done now.
> Can I get an an ACK on that either way?
>

This is in line with what you did for input. I don't think it should
be decoupled (any particular reason for that? There is none mentioned
in the cover letter), so I propose to leave it as it is in patch 5/5.

One more thing - since we all want this to make it for v5.5 - can you
make the set config patches part of this series (simply bunch it all
together)? This will make it easy to review and merge everything.

Thanks in advance and great job!
Bartosz

> I've also made a couple of minor changes myself while reviewing v4 -
> reordering the patches to group the gpiolib.c ones and leaving the
> gpio-mockup til last, and removing the "bias requires input mode" check
> from lineevent_create as the line is assumed to be input for events
> regardless of the input flag - there is no such thing as as-is for
> event requests.
> Only mentioning here in case such changes are clearly wrong...
>
> Cheers,
> Kent.
>
> > It looks pretty much as I imagined it when I discussed it with
> > Drew some while back, with some gritty details fixed up.
> >
> > Yours,
> > Linus Walleij
