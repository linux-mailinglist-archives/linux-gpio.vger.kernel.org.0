Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6075228E524
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 19:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgJNRNc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 13:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgJNRNc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 13:13:32 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455D5C061755;
        Wed, 14 Oct 2020 10:13:32 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so19726pgb.10;
        Wed, 14 Oct 2020 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6uo0zZpvzDaSDdtJhTUWqOqljbE66RmGZ5TF4JiXQbs=;
        b=NgMprzvA3pyrmzjyu6aqJz6i63CdTgW4HgryJA4IoO6JaMJAvfohuBk9B5gzIwZuKF
         WKVtfAUZ2J3KMq8u8QS1rPERmLAV1whI8XZnO7PmvHFxvc9HBIA3tk5GypHif5aFN9pj
         ma3p04RPnlBerUQl0NZYSql+u0vZienklGMcMV+1YTyS0PnB2rhKWCixwl/oI447/0az
         pYHTQ/7A1JWsQdy+HaeDlkCHa0e4YYf9+iIksWlUA3AHsjsYtw8IFuHt/41o4NHuVx+4
         6BUVuhqP8CPKbqAiJYcPPsXLcRPyHaaQRsRjeBVdhS5gBCAsybCxaHxZVG7xKveCgTdE
         yrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uo0zZpvzDaSDdtJhTUWqOqljbE66RmGZ5TF4JiXQbs=;
        b=eq2CVz42rPfYOtSNvEt/hEzgaKFkGqNbcct3wnOX4pxIXf60eFpnjxBnkxdGTJvoPj
         BwvIBMMSY1ywO5v0tiusLuoOSD8C9vUFGU7Wsk4GDJLlYP4KsEOrbbTi1Ybs6yRHCAl4
         8nQ0veOCsn2l+gFT/SIS83PkQsjhaKap8j3iBgzgDeD1Z827+qYVjNPpsX8N8YKrGihC
         9S4VZ9nXs/NSo2X1lY7emEH9pw7CkA/eMHxn3szqmincGxw/tks6dSUmSaDepWcUIdop
         PIPZ9HI/xrkQRUK03l1BK424HwPDTBzKfRxHLQn1aZNuzsEpYgWEng034WzzWjnOhe/Y
         RtfQ==
X-Gm-Message-State: AOAM533QgugEc50Tu/niSlxIH3kZkppYemifQcP15qg0VwuPF0KqMMRS
        Mi9T8qkcEEE0YhkfO+eft+FVIDLqBbYOgPLhitE=
X-Google-Smtp-Source: ABdhPJxQ7kvfm3lLhbpiPFW6Qynyw1p5YmPMm/QgaNYKlFnjI4Bozg99wlTZFKaJzaXZ+63YaffmiGqy+94vIiIMhjo=
X-Received: by 2002:a65:47c2:: with SMTP id f2mr43510pgs.4.1602695611776; Wed,
 14 Oct 2020 10:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070329.21055-1-warthog618@gmail.com> <CAMpxmJUbxuAHmcf_1vP27qb1gSXTfE1OBb8X3MSoESpa=pycgQ@mail.gmail.com>
 <CACRpkdZ+9-bFg1zYXE=ppGUa0OY0f9-+QRefd1q1OMsLEdh1dg@mail.gmail.com> <20201013132952.GA219958@sol>
In-Reply-To: <20201013132952.GA219958@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Oct 2020 20:14:20 +0300
Message-ID: <CAHp75Vfy9bkny-1gyw7fKf3S=RN-DdZYK40eMC27tE9ApKF6jw@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 7:34 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Tue, Oct 13, 2020 at 03:21:47PM +0200, Linus Walleij wrote:
> > On Thu, Oct 8, 2020 at 5:46 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:

...

> > I am waiting for Kent to respin them addressing Andy's comments
> > on patch 5/5 then they can go in as fixes I think.
> >
>
> I had replied to Andy's comments - I'm prefer with my version than his
> suggestion:
>
> "I'm not keen on that alternative as what it suggests is actually a
> pointer comparison, and even if the user realizes that they may instead
> use "strlen(label) == 0", when they shouldn't be assuming that a null
> terminator is present in the array.  I avoided mentioning "string" and
> kept it in terms of the char array for the same reason."

My point is to make documentation less cryptic (= less programming
language stylish).
If you can rephrase it that way - nice! Otherwise, I leave this to Linus.

-- 
With Best Regards,
Andy Shevchenko
