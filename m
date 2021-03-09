Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09001332A88
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCIPd1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbhCIPdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:33:24 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6890FC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:33:24 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a17so21214971ljq.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zRwlss4SrA+EM7wZCbEOyOofZwwpKM8spJqxREckCYg=;
        b=bmCEMsEvs8LayoyiN4csMl9ReStEGh9QOdXeOXIF099Bz+nzHIwen9/ijaNiLKYxlh
         hv7xpHIxCD61xOTx7SOHVfp8ZZi9sG/VTkfZZRyyzuGfeXjrgEj+UDU5TNnuZlL8eUWz
         DBEG+KgqPqKjTxG1ABABaOrXYWCnWwypF5nf9MXv3FBVLVduPkP6LNO475Q48pXwD02r
         ch2YspbeSYtMtRX0xhRtxtCn+I/frcekkJe1wO3f86tOHkRJLP2C2Db/E0JVctp2ssmN
         yZ4oLJ2/gwn9jDCu3t4xXVGTI4kODzHf7bi2FceqRmMuf6rfDOuPDEWv+3kgZGIqYpMK
         jVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zRwlss4SrA+EM7wZCbEOyOofZwwpKM8spJqxREckCYg=;
        b=XWQJZVZ3qPDHQ66je1oe9pOy100r+KI5zS55kWkSN4xMSn5FF8z15SEJ2AkRt+0LwP
         p6sLPPEm0qZWQb6rBADCUn3fjHBfTyyXDAQLvtbEE7sPg/KK4N30+Is/4yV1/k4swtlB
         t6vUDJzzePU7K9Dv1WsimsJb78I+R+oBfo8F/ZijmoW/PvKcK20qrAMtrF4SlQS5dOEd
         YqRUY3zqZ85EQUcuY23YhvlM/myc94HUP/J39BLeGi+VzoJJVo00ZRODk0kxu9CqXN5x
         AEaI/VznWNaFEdHqGwTOaPpkYdGHtbYfqqFNoSeDw3iKrLwlYfQ0mWC1B4ph+QHS+kDI
         vmug==
X-Gm-Message-State: AOAM532VsvK9zv2QyjyEKLaVAxy4d66cObGoJeAL6zxMh4kUUOVqgslH
        dD4uXptODxDoI0snWunjvK+RsyvaY/9S1j+oze1aMg==
X-Google-Smtp-Source: ABdhPJw3K0rLLpmvfGOoR6fdOJolCWEFuz2u7oucWdDreSGozFwcZUD7bHM6mANqS/YdpQrnTHYBT4EYMPMZ80otum0=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr17606807ljg.326.1615304002982;
 Tue, 09 Mar 2021 07:33:22 -0800 (PST)
MIME-Version: 1.0
References: <YD9K8LzSFpuAhDvW@black.fi.intel.com> <CAMRc=Mf1MsRUGJN9Y09yVQ=OO41-kYRo8n3D3tyLpymnJ6_JvQ@mail.gmail.com>
 <YEX72lTYIwxc0I8O@smile.fi.intel.com> <CAMRc=MeWppCHTc5G3wu3MMb0ZvncbaNJfOLU=WFFTbaw7EVnXQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeWppCHTc5G3wu3MMb0ZvncbaNJfOLU=WFFTbaw7EVnXQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 16:33:12 +0100
Message-ID: <CACRpkdZF2x-mAs3p=d1gx-rfrSGQA4J5v+-6WHOjFwt=62De5w@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.12-2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 4:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Mar 8, 2021 at 11:26 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Sat, Mar 06, 2021 at 12:38:33PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Mar 3, 2021 at 3:09 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > Hi Linux GPIO and ACPI maintainers,
> > > >
> > > > This is material for v5.12-rcX (presumably -rc2). Since it touches ACPI, this
> > > > PR is to both subsystems.
> >
> > > Pulled, thanks!
> >
> > Thanks! Though I don't see it in your repository.
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
> For some reason the merge commit doesn't show up but I do have the
> patches. Strange, I remember seeing the merge commit when I pulled it.

Did you rebase the branch after pulling?

That will drop the merge commit, and will also make linux-next
complain that the commiter has not signed off the commits.
(I.e. don't rebase a branch where you pulled in something.)

Yours,
Linus Walleij
