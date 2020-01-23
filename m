Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6097B146AD3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgAWOGN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:06:13 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:44580 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAWOGN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:06:13 -0500
Received: by mail-io1-f66.google.com with SMTP id e7so3017162iof.11
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gvEKLZlDMkWIma4Hyg4xXfMq3Pu+MDy4BtfJNtH0DlM=;
        b=K/XZvrts1jGW4gQXM4HIgH0iKxrOZPnIYpF7pcebd2iNw5NcAxxjBnC0a6sIf6B9g5
         YllgMarQHju03rrIADB5USBzhEtusDlcoraXg4l2ZNUVeeqOggA3tQqeigJqJQE5RQMM
         upzNZapN4wiJkT7WH/xsZw7eNZtaS5P28JjHN3VFLrXAXM4lI1WA5JZU/dXtkFb6FKaO
         KIgeLFcxIX4nD6gsaxlP8wt3r0Ugkpsm2QiD+h9VnnhqC4/Hvx1Tnr2VwQN24vXeTSB8
         1g51X8BZ3XN0pVQ4Qnq59LuPSWqfparifXzBG3M0iVKUQIIcxIDWvFIciqXj7Bik38cS
         koGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gvEKLZlDMkWIma4Hyg4xXfMq3Pu+MDy4BtfJNtH0DlM=;
        b=KrVFJ7VqdwfZL1uFYrNywGZi/BMJHJAZ2j2dT2sVT+PFG1tehoJgN3FwoB/A+44NhB
         VGt8RSSshTPOVMRdK7PzJwh+G/PAbfl5C49rnoFGPCXhjHGOkISyFs6kPwnzupU0fY55
         y8mTe4drmirH/HIyTpcZGJjSZ88EKvtEWedh+Cq+cWrnfJz+CMW/UPpBqzWa4YF+x3yC
         DJAjKNKYLM0Iq5CA4xIA7i1d8TSEB2l2qVGdzMhVtkKb3x2Abi/zvx0c/aeJ2yRxs0d6
         8Ze+X0xNW/oPNdoqfx+3z9YvFsgy40aNfP46SuDNWxxneKbDXHxp43/MuVUHHkfVwhzB
         hMRQ==
X-Gm-Message-State: APjAAAXOWufvU1o88O6LhsSIn2NX+lQH9urDQSAXQ1mYq9QUo+6GujVF
        ezrS4xAfFxg20h/BdfVkZw6fUdThqjBAAr/q7kQEBw==
X-Google-Smtp-Source: APXvYqwUOM4P7pXnMt7JTJLROWjd1CXi2dKUzReOaaDmqfByeJwch4bBzmJ5AYzVC3X6L4pfxwgXycTKvwT6EhjcmaU=
X-Received: by 2002:a6b:2b41:: with SMTP id r62mr10602149ior.189.1579788372482;
 Thu, 23 Jan 2020 06:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20200109115010.27814-1-brgl@bgdev.pl> <CAMRc=Mf34JTo-mCCb-ubdY9=YsGQp-YrkhQMp811_wXyVtW-=Q@mail.gmail.com>
 <CAMRc=Mc80hudqxHMp87_Ro+k1YQNeo=FxYD0oZy_g7P=Z2w-Zw@mail.gmail.com> <20200123113726.GA980445@kroah.com>
In-Reply-To: <20200123113726.GA980445@kroah.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jan 2020 15:06:01 +0100
Message-ID: <CAMRc=McW2KdUVWPKnJ=g29-SuhU5UereHeC_=h2QFpHFmJLQOg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpiolib: add an ioctl() for monitoring line status changes
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 23 sty 2020 o 12:37 Greg Kroah-Hartman
<gregkh@linuxfoundation.org> napisa=C5=82(a):
>
> > > > Bartosz Golaszewski (7):
> > > >   kfifo: provide noirqsave variants of spinlocked in and out helper=
s
> > > >   kfifo: provide kfifo_is_empty_spinlocked()
> > > >   gpiolib: rework the locking mechanism for lineevent kfifo
> > > >   gpiolib: emit a debug message when adding events to a full kfifo
> > > >   gpiolib: provide a dedicated function for setting lineinfo
> > > >   gpiolib: add new ioctl() for monitoring changes in line info
> > > >   tools: gpio: implement gpio-watch
> > >
> > > Hi Andrew,
> > >
> > > could you Ack the first two patches in this series if you're fine wit=
h
> > > them? The code they modify lives in lib/ and doesn't have an assigned
> > > maintainer, so I've been told to Cc you on this series. It would be
> > > great if we could get it in for v5.6 merge window.
> > >
> > > Best regards,
> > > Bartosz Golaszewski
> >
> > Gentle ping.
> >
> > Greg: could you maybe ack the kfifo patches so that we can get this in =
for v5.6?
>
> I am not the kfifo maintainer :(

Nobody is... :(

I resent the series with some people who acked kfifo patches in the past.

Bartosz
