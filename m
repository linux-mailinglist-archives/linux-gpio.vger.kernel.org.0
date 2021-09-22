Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217A4414998
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 14:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236181AbhIVMtr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 08:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbhIVMtm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 08:49:42 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF87C061762
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 05:48:07 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id b65so8743561qkc.13
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 05:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOd6h/Yrxn5Oodi5c84PARcC+Qmls9Bjqxy6D0i0gaE=;
        b=LC7zuodttu1Ldc3PmL3UjrqEjro5G6YVm2qOGl003DTcVkLTUSdUIWa6OKtoqRkVlf
         j0ix+QBTVVqcUWeSRjxxdHn0lUBzQDHL1DaxnWnr42cDle3K84/oSTERXmEtLJMtKP6M
         OoYuft2DDLGK0prGGnNr1uZnivFMmzG7rNuwcy3JHyVbF/z5s66uSVqfTK3KYd0YL13t
         ZctY/pAkNrCAH7GJIlnrmJ3QmfQUn7nKkErG+aoaOOiFG0aTyO4yca+PjuvvVdUxT8cI
         7XUYavZXn3IsH5DtnoN2GGF8iePvcaZ/K8REn7ultKz6EXUTBkxY7ozBVjNoKmoihyBC
         hEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOd6h/Yrxn5Oodi5c84PARcC+Qmls9Bjqxy6D0i0gaE=;
        b=rRcTj2y2HMprz96oLz1I5wf9aVw2uSvffB7U9vKE/esx2nf/0Mo9NwE+WWNg9vwOLu
         3NPi5/LL6i7qUbs34xgjW0BFr0TZHH5zjfrLObFBpwk0WhjCMf3oD+SGPmPTlZm/FDYD
         8eNWyDFuzxBAa0argxfqauQK6VCQJAw3KKZKTnBJl/BOtiH6mCv3tRJly5l9oFb2MQVT
         1l6EJ7l/x+mvDQ3/t0ajuPAwTOoLJmbZKh4O2s/s8R0iUnxp7LXyy7XSaq12Yons3a4v
         S6zJMNSR3yYVVz/yHD7BhUpp4ow44d9vBzh6hQH+atojW+5kPkEUKlAVNWTooc4MSJQ5
         sXtA==
X-Gm-Message-State: AOAM531EV8XDEANi6LnrA++04USHgajnOgvxkGnFql+0uld5i4h+wM2E
        muph1LqmlUgvhT+V2foUzFwFJrxJEJV+xiESvyG4Lw==
X-Google-Smtp-Source: ABdhPJzOnb/1MbqqxB20FR/qra6sz62kiRapIfLwVRJgk660z7HoheEro+RuNYOomgpi6g87ak9y0dwq/PN9fFl4EzI=
X-Received: by 2002:a25:14d6:: with SMTP id 205mr1886426ybu.93.1632314886788;
 Wed, 22 Sep 2021 05:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210816093856.12313-1-hdegoede@redhat.com> <CACRpkdZ8ngakZhbrJp=OjcayLJ4j7C9gqb72N18fHExtMT7gNg@mail.gmail.com>
 <86fafc6f-113c-2ea9-579b-ea29343865da@redhat.com> <CAMpxmJUtYoq1tX060dw6sKNpAf+D73Dr_s-pMhUdpeOKSr22gg@mail.gmail.com>
 <CAHp75Vf4mjDoiVCZ=z7QS5oDMsPQM1rTQUTFps5fKRsNEj99Ug@mail.gmail.com>
In-Reply-To: <CAHp75Vf4mjDoiVCZ=z7QS5oDMsPQM1rTQUTFps5fKRsNEj99Ug@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 14:47:56 +0200
Message-ID: <CAMpxmJWwXR=T8Sd9fuzSF5hpX5V-cbtP_eqiUoA8L+eJ2Bx-2w@mail.gmail.com>
Subject: Re: [PATCH regression fix] gpiolib: acpi: Make set-debounce-timeout
 failures non fatal
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 12:56 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 22, 2021 at 12:17 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Tue, Sep 21, 2021 at 8:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > On 9/21/21 8:28 PM, Linus Walleij wrote:
> > > > On Mon, Aug 16, 2021 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> ...
>
> > > >> Fixes: 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
> > > >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > >
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > >
> > > > Bartosz will pick this up I think, I'm a bit off duty with GPIO right now.
> > >
> > > Added Bartosz to the To: list, to make sure that he actually
> > > sees this. I somehow did not add him in the To/Cc when sending out
> > > the patch, sorry about that.
> >
> > Yep, I only process patches that are directed to me personally (TO or CC).
>
> Hmm... It's then strange that GPIO lib ACPI is not listed for you in
> MAINTAINERS.
> Perhaps we need to update MAINTAINERS as well.
>

With the following line in MAINTAINERS:

    7998 F:      drivers/gpio/

My name should pop up for all patches aimed at the GPIO subsystem if
one uses scripts/get_maintainer.pl.

Bart
