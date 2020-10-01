Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD9D62801B7
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 16:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732342AbgJAO4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 10:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732299AbgJAO4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 10:56:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD74DC0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 07:56:18 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id jw11so2011266pjb.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7zu1xuioIGoRaU9tR6KUTuevEKFajnx8W9zhG0gA2sQ=;
        b=fxc1JpA2uPoNbJsrFbaC5w7I6Y5rbpfzks+weUPB/9RzUd9Fd0A8rDlmQjWPA442bx
         GOcltzf1dgjdnTcZ32uik9xwJOPFaUuDTqy/yYHPOiu9Xd5Ugs1n16gj9VKkTYVs7P9K
         Kp1BjtPkooQVg8sRVoZfMel/AkNuT+GZ1p4+wDKaMdtL1OkbVkXbyazf6iy5aKnbdDpW
         oNtYaqghuYpZftx/uQZ6Zkw4yabO9eC97qM9+New8LH4cAuTd4T+6cKw9RSCsc69TW5s
         XwmCrWb0GpWhN/5o9Qm1RaclU3d6J1f09/COo5ZXkU8DXvPGFq6JxZyCYaNyUSFQDWye
         u6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7zu1xuioIGoRaU9tR6KUTuevEKFajnx8W9zhG0gA2sQ=;
        b=QpDYAvrOIgphI6Gze3jqZZYQkvJ/XLQflstkihVGkfynXsY/tfRFl3N7TJukNi/VsC
         erCphlIQO1Z0HpRCUe1ceEmZF4J0kCeP1IUxUYNk0xWcUKqjw/9IbcLt5KGDgyXddZLT
         CHWo2dywvPyvxGT5AbJ0gPSpDeM1pbNURHoQ4T9EVnvddEeFychLOg3QGaTpki2Nu5LV
         Uoyu0DJ5besUDB/qq1DUcOiRYa7fr8hXJoemL6Qwk7LVdUk9+7obRC6EhRrBVxnn8DJi
         6YhQFQHKu9fdwPibc5rFK9NthJmTafaWRpxdyUatiY2brgwcnqqHsUqs14miQu81l9IM
         1uuw==
X-Gm-Message-State: AOAM5336lhfqWnPVD0w3Y9lDqmVUrM7lSzWKBEkHtPuXyTQ0c8vGdN5y
        K/IbBTYTi/l6CJrF58+7MegkIv0F2LiYVKvMb6A=
X-Google-Smtp-Source: ABdhPJxaCr6YA6x9ekWQCsQDR97M630h7ZlJZ1FLsbdSjQpQKy6s+OYPTuaWxYhzPtBhscMZl46HDA2nbowWdHiUodI=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr363091pjr.228.1601564178082;
 Thu, 01 Oct 2020 07:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
In-Reply-To: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Oct 2020 17:55:59 +0300
Message-ID: <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v1.6 released
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 1, 2020 at 3:20 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> I'm announcing the release of libgpiod v1.6. This is the last release
> in the v1.x series. New, improved version of the GPIO uAPI is now in
> linux-next queued for v5.10.

Good news!

> It introduces many new features which we
> won't be able to support with the current library API (and we also
> have several reworks defined in TODO that'll also require breaking
> compatibility) so my plans going forward are as follows:
>
> 1. Switch the major version of libgpiod API to 2 and start working on
> the new API (preferably starting out by simply porting the current
> library to v2 uAPI).
> 2. Indefinitely support v1.6.x branch with bug fixes.
> 3. Consider v1.4.x as an LTS supported for as long as yocto uses v5.4
> kernel as their LTS (this is because v1.4 is the last version to not
> require v5.5 kernel headers to build).
> 4. (maybe) Create a compatibility layer between v1.x and v2.x once
> v2.0 is out that will ease the switch to the new release.

I'm wondering if you are planning to develop v2.x with possibility to
coexist with v1 on the same machine (like gtk2 / gtk3 and other
examples).

> There are no big new features in this release, mostly improvements and
> bug-fixes. The details are in NEWS.
>
> Grab tarballs from:
>     https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
>
> Grab source from:
>     git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git



-- 
With Best Regards,
Andy Shevchenko
