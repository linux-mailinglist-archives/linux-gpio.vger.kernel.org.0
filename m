Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C107D11A78A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfLKJjm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:39:42 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:37853 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbfLKJjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:39:42 -0500
Received: by mail-qv1-f65.google.com with SMTP id t7so5452373qve.4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YKzYkDc7/BEE3nDAuJEhA8MmFDZrv8vJwNfFd1VWfqw=;
        b=zZBtIAFgaoqiao2IVnfvbitnLmmPyh6dlirWeDvIgIXFBghb4juzxe+Md3d5iOhN9U
         Ktv3DiBEIRF8GczYoiYmbEMOXPhmSH1WrUs3l3WNPkOwTSuprZuCIkMA3EoMO4nuqJTS
         6+4jhnMjTsAMA8D86PtfCYieaCmyjmM9q//lUZ3f05LrTEpZQ6Apn+cHgLZAU19UuCfL
         k1+eIanFIx6XwNAFsGQBv1CL9xgIGhfFi0q8IfqWr8brdKM51k2EzFMOlO3NLtfCJiY4
         CjNauMfNVBZ6uX52dU9ngPlfo9c0pjVRM5dE5tMdyVGDKsU4xliGsouQcWH0nht4bi79
         30og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YKzYkDc7/BEE3nDAuJEhA8MmFDZrv8vJwNfFd1VWfqw=;
        b=aMA5K0bJeE/K24Ga1HW9p3CQZJjv/7qymg6mYYYXvZl2GbwR8QR/vw9ynp6Kh6VJqn
         VD23rD8ZwD/7/pq5BLiGdO/mHxQMc7ffDYjNvM94KlJw1VzssOjz85oz21Q7ggxrU05D
         0eTJRpJ6PIK4Yo2Svi8CO9ejeSupxl/hjUZVqB+92bBKR12X7+e/Frau05ziKyAqUiUn
         24DVx3pQG2N+i9ZzM/MXEAVEZJ+o9Gi6bHG21bCAfDBi6tpZgd+yCO8RWYCZEBU9mqTf
         t8q2nLUdT8lLc/dNwBuuCXop8l7DUELMVgC5N6LRR95Rfq7pAanR56+6sFoW441rUiWs
         SNmA==
X-Gm-Message-State: APjAAAXiH1T21anEsE8wrvPvnV6+zK4JBvMVUbSUav1e3Jmg13TBbZ3o
        P1CGNzBq4ueptVifLl7D+TlTYhCs8Kag+O4fB6vTpg==
X-Google-Smtp-Source: APXvYqxJp3mrcIVtUz3zJCoDrGZeks+TlBrDHkJyghIxilEygVldm78HlXK7Gb4ahWgXQ61k4Z2KPxXXwLJKsTtsmjw=
X-Received: by 2002:a0c:d4aa:: with SMTP id u39mr2054331qvh.76.1576057181486;
 Wed, 11 Dec 2019 01:39:41 -0800 (PST)
MIME-Version: 1.0
References: <E1idcoc-0004ni-4f@rmk-PC.armlinux.org.uk> <20191208034340.GA9333@sol>
 <20191208071823.GZ25745@shell.armlinux.org.uk> <20191208075143.GA13664@sol>
 <20191208130256.GA25745@shell.armlinux.org.uk> <20191208133436.GA20748@sol>
In-Reply-To: <20191208133436.GA20748@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:39:30 +0100
Message-ID: <CAMpxmJVm-CDNMuY=Y85BWgn2ZNOB5CveavfiCTxYphKDDDw4TA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix up emulated open drain outputs
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 8 gru 2019 o 14:34 Kent Gibson <warthog618@gmail.com> napisa=C5=82(=
a):
>
> > > > >
> > > > > What about the FLAG_OPEN_SOURCE case?
> > > >
> > > > do you have a scenario you can test?
> > > >
> > >
> > > No I don't - if I had a scenario that had tripped over this problem
> > > then I would've submitted a patch already ;-).
> > >
> > > I'm simply pointing out that the logic that applies to
> > > emulating OPEN_DRAIN also applies to emulating OPEN_SOURCE.
> > > IMHO if you are fixing this for one then it should be fixed for both.
> >
> > That would be nice, but it would also be nice to be sure that the fix
> > works there _and_ it doesn't break anything by fixing it.
> >
> > I regard this as a risky change: with open drain/open source "outputs"
> > it is quite obvious when the pin is being driven, it is in output mode.
> > When the driver is off though, it is debatable whether it should be
> > regarded as in input or output mode.
> >
>
> Higher powers can make the call on that.
>
> I just wanted to point out that the fix only deals with one of the two
> cases that need to be fixed - in case that slipped by.
>

I'll apply this patch as is and if someone reports problems with the
opposite condition, then we'll fix that too.

Bartosz
