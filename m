Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F3A264588
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 13:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgIJLwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 07:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgIJLvh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 07:51:37 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E3DC06179B
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2020 04:51:37 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so8229939ejb.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2020 04:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dn4K2T0JSEjR3GtfyAPlB1EWB29Nk5H6XeBf9p3Eoac=;
        b=QurwhrVqZJsLzQ5azGYsIfpN1znbp76vYNJ+mIAtygMOhcYTjfXWR0nqFECGQPJVwh
         S6yRg5r2CipGLggtHIq2iVZNf7hcHeDj7jCiGyleM+5uivGnIm6LLa3qm2CuBUoauZY+
         ilIrLbCI+hW3P74WN7ACHholf2CQlJsugRUwR/sJIc8fC2yvCtmW/04V5WNhV83+DvfO
         E6VP5B3I2qRjVN4ADa3R22FN+RhoJl2ZSacUQ7tchGoh3gInQvc3KuJNAhY0sOzftE3h
         Ok+Vmnk0yREsQMF1IJI/fctpBT1zjqRCInHdwVJE1GhMMz1lyZZWu8PrK07H9E5NGuwU
         PPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dn4K2T0JSEjR3GtfyAPlB1EWB29Nk5H6XeBf9p3Eoac=;
        b=hYOaE/RcwGr+Vc1gK0g6sMv5YXuj3qYT4vpqXGeHXOxs5bQe9rhJGMrZHfTR3BPBDX
         XubL6c8Tdn/X09PzVBvVq/R9AAa85O+FPwZAYa0SKgEaTzVEiQl+EswRgPyLs7bYNwQI
         MkC0EfoAz38LfQuvNwU9PndKdYAL14jWrcLncff9lWJ0S4Cga0eZIKWCcoZ5Q5K0oNrX
         a55Du7SKZ+AuxoYswF5GNFtYm2Is0PGKMgx1DAHncUoUlw/PQXq0U7JQ/GClyxWtc+Bj
         sU5Do4K43zumZq9CDuIIg+0UpCxwYx50Txug1v7vd+OrEYy8Iokv3s7v5aQRTgD1qI26
         S/Jg==
X-Gm-Message-State: AOAM5319svQRiWg1srg1f42Y0cmc3QQGQIqNwYdbESs3TQqS9MMe1mUN
        zMf7zAtl87wXBCVlELjsPQBtFbJfjy+b/KLyXeSEsw==
X-Google-Smtp-Source: ABdhPJxntOaycrjclXvSUCDNX+DpRy7/+hcfRM1X10oMJ0bQPMBZy4JhpcNses0vehYATdjR/zZi3Iv9FseB50UsNbs=
X-Received: by 2002:a17:906:941a:: with SMTP id q26mr8085043ejx.496.1599738695660;
 Thu, 10 Sep 2020 04:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200827140020.159627-1-warthog618@gmail.com> <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
 <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com> <20200910111017.GT1891694@smile.fi.intel.com>
In-Reply-To: <20200910111017.GT1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 10 Sep 2020 13:51:24 +0200
Message-ID: <CAMpxmJXXg=b8rNaaq_J84Nyd_84JrLe82__W3BO3ZacAYit=RQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 10, 2020 at 1:10 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 27, 2020 at 06:02:03PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 27, 2020 at 5:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > please hold it maybe for one more week - I'd love to have some more
> > people take a look at the user facing header at least. Andy is usually
> > very thorough in his reviews so I'm Ccing him here.
> >
> > I'll too skim through the series one more time.
>
> Thank you, Bart.
>
> I think you, guys know how to do that best. Unfortunately I was almost squeezed
> under pile of several tasks and didn't find time for this.
>

If we knew, we wouldn't be needing a v2. :)

> Meanwhile I have sent an updated fix for v1 as suggested by Arnd. It works for
> me.
>

Cool, I'll take a look at that.

Bart
