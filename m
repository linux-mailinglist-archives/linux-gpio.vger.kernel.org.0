Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F196DD133A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 17:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbfJIPuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 11:50:12 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46912 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731145AbfJIPuM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 11:50:12 -0400
Received: by mail-io1-f66.google.com with SMTP id c6so5944362ioo.13
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HCWhS2mW72sB0Zov86PFmfhnWXYzQqjRGzIRg9HAdyo=;
        b=KFZ6J7jzLVr5jyXo4CWJmwzZn64gkXDH0eWHRRte3R+Y/UJ724VGzC8+d06rx2Bwvw
         F2hGih7WEjluHjNdzuAKh/Wno9NMuy5/mY1NJF90+GNSFVcyULrewYcNqV3fjT0hGBVQ
         caUF7ZFfBH0HNxHdPqu91fFNTnm5+r2nbAsnQNcjcc62SYVy2tH90H6arO3XoPyJmWbT
         I+ssvEOsu/a+gbXcuKfNdjsTWFD8MdmZYJO16GDI8nImKxnL2Yq+rUIAT5q5auCHz+J8
         KYBnlWtDMs13n3rgtQICjDoF/CW5+Bs0zF/qSxRJs6h3yVKEZSAEEPnNhNAcv8+/iLa1
         gOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HCWhS2mW72sB0Zov86PFmfhnWXYzQqjRGzIRg9HAdyo=;
        b=BS4IhUHFTmBg2zzsAjTJDWMT3rKiqvQx4KNEE6sGfxcWSn86lUalYlJrtDAC92wKQ4
         ZLpeD/aebp/Mfz7ma8A73TALiVCkbaMO+8DpWoU48TQKwzTONzppvlED7tqvxmEoDemk
         GPyCBgMWSh8Ngp5/lbcArVDxNTaVUM9QXPYF37xkklD4Yz8uDg6ZeK8OhMK09UOOG1Vt
         2c+frOJD+uRWufdijnodEULi0XsFPQV46zzhwHM7KVPY/Mxf7vbxAxiFIh/hPe2hTk/1
         Rd5p0LplkY1iGxFFsk7SSyrgMyu9TR3mgL0HpW3oe2dOQkMVpIOJLyHXEELcaD5lJf0H
         Smxw==
X-Gm-Message-State: APjAAAVjsRI1BH/tuw3O3WoYER029Jk7MRinCSrtY4iYOFGf2OmOORBY
        H1JNpZCI0oUoAt9a0jql+NUS1IAwMBd2yCeMIjVjSA==
X-Google-Smtp-Source: APXvYqxMxb7xH6OpW9i2u3LxtbM4JgB6UW226Ez7zFCpUiB37Yycqz46B2flDxtsZMoOEWDozBw0lBQGSJcD8dwILy0=
X-Received: by 2002:a5e:8e4c:: with SMTP id r12mr4170080ioo.235.1570636211213;
 Wed, 09 Oct 2019 08:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol> <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol> <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol> <20191009065524.GA4061@sol> <20191009133037.GA17244@x1>
 <20191009141134.GB22016@sol>
In-Reply-To: <20191009141134.GB22016@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Oct 2019 17:50:00 +0200
Message-ID: <CAMRc=MetgRSK6+4eFkEiVuL4-D+++LZ_trr9yUqQ-H_e1POiFw@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 9 pa=C5=BA 2019 o 16:11 Kent Gibson <warthog618@gmail.com> napisa=
=C5=82(a):
>
> On Wed, Oct 09, 2019 at 03:30:37PM +0200, Drew Fustini wrote:
> > On Wed, Oct 09, 2019 at 02:55:24PM +0800, Kent Gibson wrote:
> > > Safe to assume your code is in your topic/gpio-uapi-config branch?
> > > I hope so, cos I've forked from that into github.com/warthog618/linux
> > > and have started working on it.
> >
> > Do you also have a fork of libgpiod that you are working in?
> >
> Actually not yet - I'm using my Go equivalent of libgpiod to drive the
> kernel for my tests.  That is also on github - it is in the uapi
> directory of the feature/pud branch of my gpiod repo.
>
> > In case it is of any use, I just posted the libgpiod patch for pull-up/=
down
> > flags that I had been using to test with.
> >
> > I help maintain Adafruit_Blinka [1] so I would like try testing pull-up=
/down.
> > I already have a Raspberry Pi 3 booting a cross-compiled kernel with my=
 (now
> > outdated) patch applied and a patched libgpiod.
> >
> Go nuts.  I hope to be testing on one of Pis, but I don't think I have a
> recent kernel build handy, so I'll be a while.
>
> Cheers,
> Kent.

Hey guys, just one thing: don't send patches as replies - just send a
new version as a separate series. Also: please aggregate all the
patches (pull-up/down, set config, gpio-mockup changes if any) into a
single series.

Bart
