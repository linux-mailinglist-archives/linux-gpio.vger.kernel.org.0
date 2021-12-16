Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166954770FB
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 12:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhLPLqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 06:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbhLPLqY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 06:46:24 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D718C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 03:46:23 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id z5so86613976edd.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 03:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lApPK1DgT1GLd7XOqE+jk0fA3ozKzkJ05FIXe6TVqFw=;
        b=qeW+/Cvv3fvLaCSiElDIjXV3L/NieBYd9jZPzIfJfPcwEHxZ2xqcoeUoR4GO7RVMli
         XibZbs5Vy5tEfegTT9OuDC+OUIO2PPQbjOQrJoxADgmMbU5HuXQCiFPwnql+h/HjIOov
         CoHiHZI4/qSL9EtrYU4ih8UFxjbiRtD1BPlUebbQxe9Qkp9DdclkoaOvq0YiEnV11buz
         hdbsw+SmBbGOrPzLskfmSIJQ+xE92YdZL2fqfnPvObbkpsG8QCueDWJJrHvwSH76hqDA
         P2sMtZOm5gyWd+zjrPHA62TLHXweSnpv4AlRhRxyJ0ThhN2boDZWmlBPxo/bUxv9oSVu
         L74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lApPK1DgT1GLd7XOqE+jk0fA3ozKzkJ05FIXe6TVqFw=;
        b=CvAQnMZHJI8zwvqHhQNddjcdH3Zyv+bZjENgYr3ZneISvizyBIpFUzaVAvY/mXO0ZP
         6i6nhqh5NHoYk8ZpAUBrbkXbKJAESGBnDOw8+RGv/lt2e+xRQzn+mwgW+SEsUx/YaNxa
         mhOvE8/qDgLsxY/b3EW99DkMQ+8bEulZ5QwaarPi67Ff/18CDi1L/1x5JofZCei/bsFB
         GSjcZfI3C2gsK+b3C85hJQAVIZQK2VUqcWaZ9uDS51YTcJ0zkiJfqoW/UJjZdge1ZIyB
         BJty+D4+JKfvXMkxIrZvFAvhBLQ0CIKGkuhXo+vQLEMqZ/DfQfVwRax2xLDGC72UrArU
         EmMQ==
X-Gm-Message-State: AOAM531/ATiW022YqiHDzc8quGiAOGr9T8ra1ONmuux7Xt+LLt9N6PhV
        eFY0UpPSKumPJ9VQVZDdPNegGfyfJYRjn4D4tdNk6Q==
X-Google-Smtp-Source: ABdhPJzMT0V2+v+iAYP4BEeGTM0JZMAf8CIVe1Z+CT8cGrD3Pi1SaYgV+5gaJ7fpieY7R4rmTxA+FEdpQQbpaMVYgpo=
X-Received: by 2002:a17:907:3e0f:: with SMTP id hp15mr16006170ejc.697.1639655181487;
 Thu, 16 Dec 2021 03:46:21 -0800 (PST)
MIME-Version: 1.0
References: <Ybn8pxv5xPgc5nGz@black.fi.intel.com> <CAMRc=MceOZWt5Qb6kFSALOOwyYb_MikFusxZqt9KgqqQPfnwgQ@mail.gmail.com>
 <YbskttzHvxlprBPM@smile.fi.intel.com>
In-Reply-To: <YbskttzHvxlprBPM@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Dec 2021 12:46:11 +0100
Message-ID: <CAMRc=McSULw2YpCgsK-C6+pTx85mtH3c5Y+MbawO+SSgUXM1gg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.17-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 12:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 16, 2021 at 10:14:05AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Dec 15, 2021 at 3:33 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Hi Linux GPIO  maintainers,
> > >
> > > Approximately a dozen of changes for v5.17 against Intel GPIO drivers and
> > > GPIO ACPI library. It has ben a while in Linux Next without any error reported.
>
> > Pulled, thanks!
>
> Thanks!
>
> Are you going to pull series with the OF node assignments clean up?
> I forgot to mention here that my PR does not include them.
>

Yes, I'll queue it this week.

Bart
