Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC36F332A53
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhCIPYt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbhCIPYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:24:20 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FA4C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:24:20 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id w9so20820367edt.13
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GopuZyg5YHEXuIPIU2+0iXZVgjkZyI/sNfxjE+oPyFs=;
        b=M4YqV58UnS11Q0AEJWjZirDj7bHlekszkgIcvXMQuO7buvLJovDD0mIj7n+pnkCEqT
         uQOMOagL0Ur92R9emeWHDkYCIqAeU4jCtFQ5GXCJb85AGKaGxx46b595q1Y2i4G+i2j9
         FiN4eyClFgu0fe55xO3ml5TqkMzBaXajMm99rknRAqVwn0FVCtXT+N5JF39V2aFzdJy/
         7+NV2mkiX13ireGvZthXXaHDXdpwYtpKXzU1HMkUEGDl7yht0sJT/aSdNouTf0oJVtPa
         kK/FaW4EUwsks5PyBJLWJlRh720F31lIv50D7FBvIIt+Muqg+ZDL/59ZNBa0imM0c3Wl
         3aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GopuZyg5YHEXuIPIU2+0iXZVgjkZyI/sNfxjE+oPyFs=;
        b=jhodhkVqBlTl6qk5JrkAKRHQWhas0v0sI3OgrcUiS+LGOcMTzCcVjGYhumVQQMDheB
         wF6PGOKAHOjzP923OwfLONy/0bFnTtTviEE0rbrKDo7mEPU/jG9g4Xj9QjqdttXxUG1H
         vl9Km7w5TW4Iwj8Dm+ABOPFgCwuCQw6SX8hW4klhmhPPvb9fS9iIOXoBT5mpwMmcTLx3
         wz0I2Qc9rWtMijkdi/hfnrxfUgpqRbqDDQfAbRqZqcQpOQioGEbr2uZoB6iA57vHR6HT
         ebj06RlqLuxSqTGbp9+rsA/sqVchTvZ99KHY9FV+f28F0GkjMKfTVWC4wRhSS9K4QY5q
         rkWA==
X-Gm-Message-State: AOAM531KljkcVCHRq3AItFmj1aUmA4XpHY9kGOurgAdpgTBKPZDiV9Ly
        +9cIPvCj4BP2oeWYco/O+hZOWH/cKSOJ9L2pFFalrw==
X-Google-Smtp-Source: ABdhPJwQvrNCSDqNBqy1qEv7FZmMTyhL+ZdhXQGWT2bGcZYT0Voyo4m7TuW+5Bdt1q3/3Rj9UeQ8S5hfAg4gW23PlYA=
X-Received: by 2002:a05:6402:3550:: with SMTP id f16mr4700945edd.134.1615303459027;
 Tue, 09 Mar 2021 07:24:19 -0800 (PST)
MIME-Version: 1.0
References: <YD9K8LzSFpuAhDvW@black.fi.intel.com> <CAMRc=Mf1MsRUGJN9Y09yVQ=OO41-kYRo8n3D3tyLpymnJ6_JvQ@mail.gmail.com>
 <YEX72lTYIwxc0I8O@smile.fi.intel.com>
In-Reply-To: <YEX72lTYIwxc0I8O@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 9 Mar 2021 16:24:08 +0100
Message-ID: <CAMRc=MeWppCHTc5G3wu3MMb0ZvncbaNJfOLU=WFFTbaw7EVnXQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.12-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 11:26 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Mar 06, 2021 at 12:38:33PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Mar 3, 2021 at 3:09 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Hi Linux GPIO and ACPI maintainers,
> > >
> > > This is material for v5.12-rcX (presumably -rc2). Since it touches ACPI, this
> > > PR is to both subsystems.
>
> > Pulled, thanks!
>
> Thanks! Though I don't see it in your repository.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

For some reason the merge commit doesn't show up but I do have the
patches. Strange, I remember seeing the merge commit when I pulled it.

Bart
