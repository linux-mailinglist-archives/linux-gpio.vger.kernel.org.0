Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8212D9A8A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 16:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730343AbgLNPDR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 10:03:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLNPDP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 10:03:15 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD6CC0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 07:02:34 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id q137so17110973iod.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 07:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Z+QVarofE1wEvfFu21bMC2eN+W3CZ93Xu6Vyj0YIko=;
        b=0ztrXdYgmEm0Fcaa868Cjp/0M4ugmUwORLAoSevHXYRIv7xvtwtRQnfeCA/3FeUhvv
         DKhPV8RHnwaqV5GFF5RhzdOsCodHWgWUvbFwr7vj5qwH1ScNR6sXVJUl+pAQZiYD5d+d
         AGIKLJT6qTkVcDzs691q4WLDqCK7UZaPR8LDOVTiQ6w1ug5B8Gw+DEvE+1FV/Xi+vWJF
         fhfPFRZRPfdPMOHYRgad4HpbXFWN4yABkLWYxwLNruiZieSHycNReH1eRJkneBhgz9I4
         TXNJhoH/caY8R8yPyfqju0RrTmgqialbqP1S0UAe8yTRqvI+I4u1jPsttI6JLQYvmUYB
         FF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Z+QVarofE1wEvfFu21bMC2eN+W3CZ93Xu6Vyj0YIko=;
        b=DtaBObwt8BKq6T4CMbZ42Ivh3RhijgxBRnB0GP4noyKsWQDrus0i1Z/BzYm2ycznsD
         JgAZ01re/PRmdvylHQOFouGz0CDYRDR721KvpSRvjOXapHLX8j6/WrwMvr2cx3x8CKVN
         f/68G5DTKoAe24YlzQ2fiai4Q5pa3YLpq/3BnninSL2AuE2mToMYJdZ3npc5VbVJIZ7E
         Tubv4R0Do+ON1z5Fnlgx8dJiFapZ+hHFvGatwXmAreK+0n+I8/Rou5xEoJrz73mQq0u6
         Aj03njKS9VsCHRPHPRg11GlYBvBL8ANoOnF4jCzofK6Lp6Ip0q0UiY05k5iOr7RpwRY+
         UdSw==
X-Gm-Message-State: AOAM530ax2pztK7rSSuzKzG2MOGi0DA3qCJKMUXq0vKUs2uC35DxYx+a
        /fbkaDRmMktOxrSowx9nG9Cx9/8vigoVMdKC2EZ+yg==
X-Google-Smtp-Source: ABdhPJxuP+cNCb2XzJgSxp4QHDkuyOGWSeDQKpLQirSLj/XhcJIPX5Dy7Ro9IuWjLFTWzQ7xEKzxt7MuA4XI5MJv3nE=
X-Received: by 2002:a02:ac18:: with SMTP id a24mr33386364jao.24.1607958153906;
 Mon, 14 Dec 2020 07:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20201210132315.5785-1-brgl@bgdev.pl> <20201210135627.GH4077@smile.fi.intel.com>
In-Reply-To: <20201210135627.GH4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Dec 2020 16:02:22 +0100
Message-ID: <CAMRc=Mf-N+cRzWv-iAT0SWNwMDT7O811Ge655hgrNS1tnwHfeA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 00/14] treewide: start shaving off cruft for v2.0
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 2:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 10, 2020 at 02:23:01PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The following series removes a lot of interfaces that were deemed overkill
> > in libgpiod and the removal of which was suggested to me before proceeding
> > with the new API.
> >
> > This leaves a couple holes in the library but we'll follow them up with
> > more improvements all over the tree. We'll create a new object called
> > gpiod_request for dealing with line requests of arbitrary size. We'll
> > probably remove the the bulk objects from bindings and eventually we'll
> > switch to using the v2 kernel uAPI.
> >
> > Andy - a note for you: I know you're always very thorough in your reviews
> > but in this case let's consider this series preparing a construction zone
> > for the new API. Please don't nitpick too much. :)
>
> I don't know what you are talking about. The series looks nice, esp. taking
> into account statistics! FWIW,
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>

I applied the series so that we can move on. Since we're now getting
per-chip unique lines, we'll probably have to redesign line lookup
again but that's alright.

Bartosz
