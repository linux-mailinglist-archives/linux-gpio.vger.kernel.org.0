Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B2C2D71F9
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 09:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436961AbgLKIk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 03:40:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436918AbgLKIjg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 03:39:36 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60D4C0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 00:38:55 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id i18so8679856ioa.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VM08EE9RDtOdUiMXUT3EqoLQjyxJfZ4vlM5vBalhnzM=;
        b=yp0MYUU21+Ovh7Z3QHECIId3LXrB3iW4nqNf+gEpEDbCHGCrXlZXtsWFoKjRRm/dFG
         iIEtlnilj1/EgFH1fCP+NrA8HCKxdvL+7/Wxdp/EXNn2gwBwjNEC4Rm77TQrPfnMavNV
         /JVQv7Md2v7H0cuZGZSYWaeKF7PEt5/d4bP0ziQNr2qa/NjluiKsaFL+/Q+DpzUmubyf
         Z9T8nkIDtxK/0cxevRFQQxN80IgLUtCL0nUDV2jHtV5qQjXumUWZtUb8E7PYZlXRcpWQ
         miOGQKMi8QAmNaxqzmIpQUQcdalL26O0PsvF0sZrgb2eWlwnUQxPjIgdGGVsn1NemvQZ
         rCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VM08EE9RDtOdUiMXUT3EqoLQjyxJfZ4vlM5vBalhnzM=;
        b=ebErG3+dBJIT+twBxuEwXacog2YLB4uNxkfcPFEevcgObMn0GQ5G70pH18SA1bPUdB
         6733/1So7YFv7T8CMejDHooeIrfCPRsgkRQQTZ19P8ZSilbLdyweGqjxyP0wea5iNdEV
         l524H4+X0KTo86UkS+dZDpHInb3HgdB0HKqZ22ZnmtN4k/jZiDgFBv9CfJDwG99DyhdN
         BN45jHWZDkK4dgmSUkbjm/nKDqUjhNKSjNjO+ohg7c8UTYP4WRCms6oPy7j4j5gd2j3h
         GaZG1lreaym61s8dUnPfpry8pcH1zbDsdX8uSsA8ebLIGKCPKOnrpm4qIlHz63/IXzng
         /+XQ==
X-Gm-Message-State: AOAM533ab8+iKWibr8j02mOv9Tjgdoe3A8YJbToq3wFTeXx+4/dZwgz/
        DiliFlYdDyz/88Oe8+NKJkwZYc5d4lS2Caiq8egBtQ==
X-Google-Smtp-Source: ABdhPJwBqsvxK/zEYcNkQhUUee6G1jUTZJZCjqwCzRk+tzVTRkKeJMbBsKGkcHaSNg9/zIdbq9PlcKQHNCTHnCa18pk=
X-Received: by 2002:a05:6602:2e81:: with SMTP id m1mr13675289iow.131.1607675935230;
 Fri, 11 Dec 2020 00:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20201210132315.5785-1-brgl@bgdev.pl> <20201210135627.GH4077@smile.fi.intel.com>
In-Reply-To: <20201210135627.GH4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Dec 2020 09:38:44 +0100
Message-ID: <CAMRc=McJLC23-RcOH+EyCWiwhSjgwfjS4W=tCijBmqWUcqdVRg@mail.gmail.com>
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
> One side note, though. Are you already plan to support autotools-2.70?
>

Isn't it already supported? 2.69 is the minimum version, 2.70 should just work.

Bartosz
