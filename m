Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5AF4560A1
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 17:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbhKRQkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 11:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbhKRQkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 11:40:15 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987EEC061574
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 08:37:14 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id y12so29597097eda.12
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 08:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9nlhrbPgH29BFhpgWXzGCQSpXI8GOTlHdkImc7F7jYg=;
        b=SoCq7Kk1O7Nw3sKoNLGQOLs6eLDBWdRWhEbS0DUdg7XHZUw9jEEFHh1Mt4xoqvPoY5
         Gt9uqfvfPmG1o6FO8DocQJXocuOb0dNc1YxEbgz8u1gSe7+iEfAmpl58ywtOnkqewW59
         RXx9OlNBRVocqnHKeKcfU1fN//N5K0llL0FeZGSeMews+p5XYSO3WbrOaja7nk9LEWNU
         ywk0uH59N0BvWp2YfKRSsIl6p2Tjl7SA+vK0ni6njw35tmLUc5QlQgeIAwoQ5mrJZ313
         1nvTwpqbKh+OjqpNoQ9/o7gPTSXEGMVyostJECW4oBPGh8HFPZWIm9JsrUYG7/G/1y1h
         g5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9nlhrbPgH29BFhpgWXzGCQSpXI8GOTlHdkImc7F7jYg=;
        b=iPW7jwtoJ1UYoU9dt//tfQecKaskEv7Trg+kL5oSKEfqFhiFTg5vK2065ktCmqUdHq
         IcgkVffsrF+XvLmdYW6MY2pbS/XVssXqxHoUFQykr879S9x+/FJ/k8XH2sBP/tLMjDhk
         BzBjZ6pXinZeKXR8lzFBTgDafc7+8moGVwobsl5nM0tW7Mh+conZd86OmeZqDgywE+Wk
         EDFVfa0X+VtOt9rSXWOieMM72tc+6CVyMx4uoDWVFf+bMLM9kRZCzD90N1CGGgCSS6ko
         HKEPZF1dae3JbDPkmrgOSIeKsMxhopTucjVczx+1sQ57iLFW6yY94ZXXQ3eUakyakAAF
         4yLA==
X-Gm-Message-State: AOAM532PBMA3I3+gnBzhOjKJV3w+fBn6N1L+ey/GFmJ4/b/rD8yqR9tb
        OBQKCT7dG92Oy9O1FH7I3lX1rVkDoWsgYkWcpdObkA==
X-Google-Smtp-Source: ABdhPJzGgBsGXvytRkU8IvtGhSPpAlbfXoW8jOMd1HVqjYIYBaYAEF9qF7e4XUVvOz3bVBfsGrqCbT7dsxHsAL0NmAk=
X-Received: by 2002:a05:6402:1e93:: with SMTP id f19mr13449689edf.60.1637253433120;
 Thu, 18 Nov 2021 08:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20211118145142.14519-1-brgl@bgdev.pl> <YZZ1cFWaexGlJL8C@smile.fi.intel.com>
In-Reply-To: <YZZ1cFWaexGlJL8C@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 18 Nov 2021 17:37:02 +0100
Message-ID: <CAMRc=MdeEiz+uKhAz5-1MX_KG5fmjshRtDXARPMEx8VwBKfXZQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] gpio-sim: configfs-based GPIO simulator
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 4:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 18, 2021 at 03:51:38PM +0100, Bartosz Golaszewski wrote:
> > This is another shot at the gpio-sim testing module. As there was no
> > reasoning with configfs maintainers for many months, this time the whol=
e
> > concept of committable items has been dropped. Instead, each configfs
> > chip item (or rather a group - more on that later) exposes a new
> > attribute called 'live'. Writing 1 to it brings the chip on-line
> > (registers the platform device) and writing 0 tears it down.
> >
> > There are some caveats to that approach - for example: we can't block
> > the user-space from deleting chip items when chips are live but is just
> > handled by silently destroying the chip device in the background.
> >
> > Andy (rightfully) pointed out that parsing of the lists of line names i=
s
> > awkward so in this iteration it's been replaced by a system that is mor=
e
> > elegant and will allow to easily extend configuration options for
> > specific GPIO lines. This is achieved by turning the chip's configfs
> > item into a configfs group and allowing the user-space to create
> > additional items inside it. The items must be called line<offset> (e.g.
> > line0, line12 etc.) where the offset part indicates to the module the
> > offset for which given item stores the configuration for. Within each
> > such line item, there are additional attributes that allow specifying
> > configuration for specific lines. Currently we only support the 'name'
> > attribute but I plan to extend that to support GPIO hogging too.
>
> One question here. Since you know how the driver looks like in both cases
> (with and without committable items), would it be possible to modify what
> you proposed here to the former one in case ConfigFS gains the feature?
>

This would completely change the user interface unfortunately. We
could extend it but we would need to keep this one too most likely.

TBH I don't see the committable items merged anytime soon, and this is
GoodEnough=C2=AE.

Bart
