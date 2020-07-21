Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5442281DD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgGUOTV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgGUOTU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:19:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C622C061794;
        Tue, 21 Jul 2020 07:19:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s189so11995652pgc.13;
        Tue, 21 Jul 2020 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ih/h2o3UHZ4rhf8zO59cCvqTeRPhJjIxWLpdIiq6qK8=;
        b=e09jncM9gd0NX7UJOwQYjVD4n6sUaE4VqsDeSeiG9so9YtS4xkhQpxoF5Ld4l1V6qP
         +T+ezzgEm/9mgAN/Eh780QQBoNqeCf/fYZwy0bNCXe/OLAeQ5HyaxZcS0QACIbjELLER
         /OcAQbIxq2CBIYHD2xBBVHSevHWQm+Gd4P2hpnuzILTyrd9iTjRdsiRz0i+c9wtO2Bav
         c2l8poZtSDG1GYlKxeXJwARxDQgnHQfpaugFIok4onF6Vc4O7uq/iZwDrRG/tKe3riEs
         7/hAqp43TIMnTOfrI+7cAXvGBosokHU1UQjssidcIAAnmZp5d8smrMJCkxdzLHVqq1lJ
         Q6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ih/h2o3UHZ4rhf8zO59cCvqTeRPhJjIxWLpdIiq6qK8=;
        b=MACsh6PhngGR7zRK3ahjQtq9rWEilRO9l9dE71NUXY/mGnPzIRT4x9QL9VJIZWbM5b
         x9ffoEUILrEU9+6KRaaOjx8VBb0oASM1dFHrGDC9LrLV4ZG9/NsdFb7Z1Cid2fRKewR9
         DNIG/2XNucVgE48AjdiVfNaX3xSw8DxJRnabs+d699jCun3rVOy4TNxy755VXoj7pudn
         wlEss9GSwAgX6yAzTQvZmFasgWs/qgtHPOWeTWW57rY4Be3FirJ47pG1MVCnxHcSSE2K
         ZO5LS5yvSkk/KZmcGu5r3kP0Kdq50z8LwQowevDLhbgColGQIvGLYqyqZkx9+SM74Ap8
         l1oA==
X-Gm-Message-State: AOAM533x9NXgar8RfBXTgBqheD/TbmxFg0WnVwdrV3ykHPfphvLp+AvF
        wcRBkNrD9a5HCtN0CFntVfCcY2yX7DjUXGrw8Ak=
X-Google-Smtp-Source: ABdhPJyJNLXqe4A/dY5MwPpJbBBaGpvNKi+9I6P9iMOtNtFxpav/4h9V1S8yiZJ36pzUs/9eNJOs0jwHINi1CYAC8/8=
X-Received: by 2002:a62:8ccb:: with SMTP id m194mr24932948pfd.36.1595341160168;
 Tue, 21 Jul 2020 07:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200721140233.2063475-1-drew@beagleboard.org>
 <20200721141034.GA2064533@x1> <CAHp75VdfjYuau0cPES7LUy-jN_RLX-L3kspVRMP+1OSZVocmFA@mail.gmail.com>
In-Reply-To: <CAHp75VdfjYuau0cPES7LUy-jN_RLX-L3kspVRMP+1OSZVocmFA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 17:19:05 +0300
Message-ID: <CAHp75Vfb-RJToJ8s=voPQ7tCutS9tTVpiLY6CwUgMAgcDQxbkQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: core: print gpio in pins debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 5:17 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jul 21, 2020 at 5:10 PM Drew Fustini <drew@beagleboard.org> wrote:
> > On Tue, Jul 21, 2020 at 04:02:34PM +0200, Drew Fustini wrote:
> > > If there is a gpio range mapping for the pin, then print out the gpio
> > > chip and line index for the pin in the debugfs 'pins' file with the
> > > format: "[gpiochip-label]:line-[index] "

...

> > > pin 25 (PIN25) gpio-32-63:line-25 44e10864 00000037 pinctrl-single
> > > pin 26 (PIN26) gpio-32-63:line-26 44e10868 00000037 pinctrl-single
> > > pin 27 (PIN27) gpio-32-63:line-27 44e1086c 00000037 pinctrl-single
> > > pin 28 (PIN28) NA 44e10870 00000036 pinctrl-single
> > > pin 29 (PIN29) NA 44e10874 00000006 pinctrl-single

And would be also better to have

0:N/A

to keep both arguments in it.

> Because line is integer and label is string it is better (from parsing
> of view) to put it other way around, i.e.
>
> %u:%s, label, line
>
> ...
>
> > Apologies - I should not have put the change log in the commit message.
> > Please let me know if I should resubmit.
>
> Since the above comment, I guess it would be good.
> Thanks for doing this!

-- 
With Best Regards,
Andy Shevchenko
