Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294E6191857
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 19:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgCXR7l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 13:59:41 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44581 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgCXR7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Mar 2020 13:59:41 -0400
Received: by mail-io1-f68.google.com with SMTP id v3so18995090iot.11
        for <linux-gpio@vger.kernel.org>; Tue, 24 Mar 2020 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3/YdP/6ZBHatXWmdlHE9Atbea6809pNVDo3TmmIg+hY=;
        b=hbA8KrXcZJOaEElrOE8LOVe+N0hSvJQfUjdDdNJNXl4yl876rjm0S18slUyuJePm6p
         1hH8V8GCVcpEIub0vWvymgck6z4lgHphAxhkiHm8dDnYT8bDp4+GX/meMbcxCxbPGvX8
         s2bUYqA7fo0zbB9JAAsiyZ7GTXuXXXCkcDrYYeV1vhSy9DlfWsB217cJ5G3BwAJ6YtDz
         LSjNlRnti2O7g/SQa7GeV/t2pXw+HrlVewFE+KC8x3j0nEWW+BFiewPlNoN5rAeQ3Ivn
         CBbSFW/FwXZtA1Tnv/2yLx5iXkZ2dO9EaI4du4gxld6m7qB+ZwBFE6ZywLOnCy4HYoTF
         AQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3/YdP/6ZBHatXWmdlHE9Atbea6809pNVDo3TmmIg+hY=;
        b=CNQeHkkSdy39IxCoAFWnuSl44Jj+46N4Y49l92nzfh4DLTAratekLXXj5+xcWbRhtm
         gspGycMosD01MfBMTksC1W92rlSRziNihKmbbHbV5vRyaoVqU3BcySR0CqXgmQJjbEN0
         O3t17FLXee49ECBezp4JfeP6q4zgQe8BCpHLAX80gfvLZSeLf6qRWUwrLFq4PX58DsHP
         piwjzZ9lmTQHxi2Ok/F7ot3v8BnI9cou3eaBuLOdyIFXXUb+Ree63Zi82aGYZuMuDR3c
         AeW0/yp3b3C+g+pU26olOLlfSRUn5Z/gwSc4zMxokLCzWHA3a5KT/2J/UPohmJe6TLYJ
         xjrA==
X-Gm-Message-State: ANhLgQ3/6+hwNt2LLaPLLrMmyek0Kh7jtG4tK7qBvoG56skVDPEbtqEL
        5V3gKEIR5/sjt1rqhMv2ySUKFkeEBYcougz8RBZoWA==
X-Google-Smtp-Source: ADFU+vsKXjUXcwzZ2JQAj+FIH1xlB2PDonLA9OClimtz00JXNl8TjYPoFyii6Ygxlbj/C2IZreWjjEIDQNNIAUKbHaU=
X-Received: by 2002:a02:cbc3:: with SMTP id u3mr25169276jaq.114.1585072780667;
 Tue, 24 Mar 2020 10:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200324082903.19366-1-brgl@bgdev.pl> <CACRpkdYk19NMMW9ua12475om-jKWWf5u8Rd=VU==2vhXRocnoA@mail.gmail.com>
 <CAMRc=Me55D2Os8KkFAbnL9-KfseYUS0=gogMrZfdzQ64to+0eg@mail.gmail.com> <CACRpkdaQQftxqVLNYeNnVzbYO+S3fKeVqshO98On+WJ2WdcALw@mail.gmail.com>
In-Reply-To: <CACRpkdaQQftxqVLNYeNnVzbYO+S3fKeVqshO98On+WJ2WdcALw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 24 Mar 2020 18:59:29 +0100
Message-ID: <CAMRc=Mfx-rYCC8sqtTthhzND_-k_oZxOen900q6fcZr6GZ0KKQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part 3
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 24 mar 2020 o 17:58 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Tue, Mar 24, 2020 at 1:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > wt., 24 mar 2020 o 10:05 Linus Walleij <linus.walleij@linaro.org> napis=
a=C5=82(a):
> > >
> > > Hi Bartosz,
> > >
> > > On Tue, Mar 24, 2020 at 9:29 AM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > >
> > > > this is the third and probably last batch of changes for v5.7 I pic=
ked up
> > > > into my tree. Details are in the signed tag. Please pull.
> > >
> > > Which rc is this based on? I got a bunch of unrelated changes, so
> > > I suppose I need to merge the right rc base to the devel branch
> > > first.
> > >
> > > Yours,
> > > Linus Walleij
> >
> > Hi Linus,
> >
> > this is rebased on top of your devel branch, so you should be able to
> > pull it alright.
>
> To me it looks like it is based on my for-next branch which is a
> mixdown branch that I create solely for inclusion into
> linux-next.
>
> Can you double-check?
>
> FWIW for-next is created like this:
> git checkout for-next
> git reset --hard fixes
> git merge devel
>
> So that branch is highly volatile and not very good for
> development.
>
> Yours,
> Linus Walleij

Hmm maybe I messed something up. What branch/tag do you want me to
rebase it on then to make it the most comfortable for you?

Bart
