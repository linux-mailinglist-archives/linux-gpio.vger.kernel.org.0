Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33AD39D207
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 00:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhFFWwR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Jun 2021 18:52:17 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:46964 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhFFWwP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Jun 2021 18:52:15 -0400
Received: by mail-lf1-f50.google.com with SMTP id m21so7264684lfg.13
        for <linux-gpio@vger.kernel.org>; Sun, 06 Jun 2021 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iEbRc55cDF3GuY6tvDFWk91oaBVpX0Pho0ibTrUBkXQ=;
        b=cDwD7oAayWVEY0p53KOvA3tzeOOJztne+kX7Zzy05xi1ORszH0ab92iLQPN8fupuDW
         G4bJtFoiXz1cvMn2DYNj6h3Y7wy91Kct7O6rRiXk9kAnyLxuxuaziMG/3YVRlMU3AZSa
         kkGNwR/RtMYBQ0X6eFKE8DKy2Ts6aVLgzoo+XR86JgqP+h5+HU1iIs4nXJJUX1NYwgjP
         eBfK5t1R2VA2hNeB1I/2tjCiNivVVQ7XfoaiOZV+1xK9HKvd1pLa6WZ/L3Y13qYFxEhQ
         T45b2pg9wc3dA5vdoje64KJJZVDqgpFHZcYuDpoYwq8DFUbG4VGQWyhk3a0crVYeUsG7
         5RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iEbRc55cDF3GuY6tvDFWk91oaBVpX0Pho0ibTrUBkXQ=;
        b=uiPgNhVz2Yv1cXrlHtx5c7o6Lcx1g+8LrA5ea2XSXaTce/wbWkCVy4/PspAC6CYWph
         VLftlDp9oNMzDZma0Lek7txfJ31jMJNrofgCBI5vFH4IvFrl3+FwsgeL+qSvVDVdnA+/
         dLK4Pf7rAR74TCynFiQq/ZtO0vG4exx1GDh1W+nUJbKn+XAbzH7ffuV6V2b3tAxi00HL
         L9hK2/e/36ptRIn1E85lyEOi8cKJeqJOQjR5QPP8nJzFy+QhY3JKskRO66o7SjpeeKBW
         1w1DbWaDz2lron/Xy1V9NOReEUZyOT/pueHLNFkFKaxWVTglnTAvcUMyy0jAIDZCBVjY
         YglA==
X-Gm-Message-State: AOAM5328x+C2x0UHmWOBB43I73ZqxoIw7ukPT/0ORTHgkmUR+BuSokh2
        GLujhF5sFdwOfBP9jw5WX+kN11QQcp/gWyl+p2Lm+Q==
X-Google-Smtp-Source: ABdhPJwmi9KUXwEWgKvoIxJJ62knUHrUccA58g0GYY6WYgHiqv2yc6ZOps26gsdtMvQV2DAfAlPWWIoiaEhxDzDbt4c=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr9876471lfn.465.1623019752440;
 Sun, 06 Jun 2021 15:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210528091945.411471-1-linus.walleij@linaro.org> <b3d9f92d-a311-0093-4243-b21f2646997f@gmail.com>
In-Reply-To: <b3d9f92d-a311-0093-4243-b21f2646997f@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 00:49:01 +0200
Message-ID: <CACRpkdY_jfYe1PNLrbrFMQBbcL+oucxOMxbREb8-LTCdANRv1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: move bit assignment
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        Sean Wang <sean.wang@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 2, 2021 at 2:34 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:

> > -
> > +     bit = BIT(pin & 0xf);
>
> I see this is already applied to linux-next, but I think the correct fix is to move
> bit = BIT(offset & pctl->devdata->mode_mask);
> just before calling regmap_write(...)
>
> I can provide a patch for that, if you want. Just let me know if I should base
> it against linux-next or if you will drop the fix proposed by you?

Just patch it in my tree, I merged more stuff on top and this
was just my quickfix to get next working.

Yours,
Linus Walleij
