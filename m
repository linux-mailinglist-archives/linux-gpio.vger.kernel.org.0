Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF7B202997
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 10:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbgFUIXv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 04:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729491AbgFUIXv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 04:23:51 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E798BC061794
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2020 01:23:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a45so5662584pje.1
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2020 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDm5/2SW5wPYPJ4DWExqsPEm9X1elYJfawELTt6Bqos=;
        b=JSndTkzCBTk8eCzEWz4ZcTkWxEpmuSoCqrLQyDnitgEWj2T6fdhoSdGfdLmyQ6DkZz
         QigHyQ7+P0vfoPSxBFKvw2+3DeWnz/jTAABD4Wyfw3SqFd5RVQar3sc48zvjxyRMSufa
         nxupy81EOnKq1GJdFmU8EmvMaqxdRJGnJLhJditpxkbVC8N4piwjRjcuG9IVwSUGKvaY
         ghj9yXah3p880RQ44gEZRWgTBPnRPzopI+NDDUlr/64gGij54Dhj3PmjBRqART5H2cZE
         +X8qo50TYsgnJ1mJGDZZ0JfKjNCHv8p74dZjtoBfzyfaiffTTREfZBhBvlNvT0IH6U0v
         rOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDm5/2SW5wPYPJ4DWExqsPEm9X1elYJfawELTt6Bqos=;
        b=saxjr3Z/azGpKzWcLINjR3g08AKP1oVyfM1JKwa/WFXC6ZKLO4qmcWF8TOF4di+NSb
         +eRBLTjpLbo9CrAVrHE1JdDvcbQkAm894AtFgE28PpmHKy5Jx2c7SG/6BvIg0Gt5qFbJ
         M7BZURu+3v3WOTklcvUOM1RjehujAhPnfV4FUwzT6FvQwJThJJqtDRS5Eme/mWthx8o5
         P4xeqcodlIfKZJ1xUtRoV9ABMWgRAXk1fJuODuvaHKlDYoBwL/HC4FUOHCMx08kis2GU
         aHpX8AZFHUoZPM64EJgsoJKF9vrq5wCMR7WOchJ41OeG7YEJj+LaxgsGo+Y5MMRnAy8i
         V8cw==
X-Gm-Message-State: AOAM532Hoel2KqwW7bbCPkWOTZtdDFBWwYU2nQqK8VhzonvkpvYfAgfr
        /BiLHfjMATOUl9P7lK1hV/qhICi+Yt/cRv14EOXktES4
X-Google-Smtp-Source: ABdhPJxlyBaYGsLiPyNxfdLLfawHbVNz4uL4TC/NJHiqjP+IS3zpZ6K4U8OOQI9TjUdsuNVlMrI68Ir6QnjP926cepU=
X-Received: by 2002:a17:90a:220f:: with SMTP id c15mr12885302pje.129.1592727830299;
 Sun, 21 Jun 2020 01:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200618114906.79346-1-andriy.shevchenko@linux.intel.com> <CACRpkdbWMS+qNQFsJ+9QrphTcqw+2EVRw177X0wTvTLoaXNuyQ@mail.gmail.com>
In-Reply-To: <CACRpkdbWMS+qNQFsJ+9QrphTcqw+2EVRw177X0wTvTLoaXNuyQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 21 Jun 2020 11:23:33 +0300
Message-ID: <CAHp75VdMLQth4pM7zgzcWt8vaBBPo-75=a3SSRv0SOGR8Eqk9A@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: pca953x: Fix GPIO resource leak on Intel Galileo
 Gen 2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 21, 2020 at 12:33 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jun 18, 2020 at 1:49 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > When adding a quirk for IRQ on Intel Galileo Gen 2 the commit ba8c90c61847
> > ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
> > missed GPIO resource release. We can safely do this in the same quirk, since
> > IRQ will be locked by GPIO framework when requested and unlocked on freeing.
> >
> > Fixes: ba8c90c61847 ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> This seems to go on top of what Bartosz applied so I expect him to pick
> it up!

Yes, that's what is expected.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko
