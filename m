Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA563512FA
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 12:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbhDAKEl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 06:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbhDAKET (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 06:04:19 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBE7C0613E6
        for <linux-gpio@vger.kernel.org>; Thu,  1 Apr 2021 03:04:19 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u5so2010203ejn.8
        for <linux-gpio@vger.kernel.org>; Thu, 01 Apr 2021 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tdJu4NzPjRKxf7IHGvtWzEypzz/sgqEq/MXKxQfclPc=;
        b=AKT0Kecm1iHwnk7ipLWshLWGG0F6hYxwTeRpDgr9kkfIe8SY/IHl8nVr8DfungkOyw
         mcaPb3Hh47Hb1JiFanSC0l5ZoMlU7ofH1xIY/XOkBN0sxiP16cnDnav+TnVJMv+4uj64
         bmyoXOXY6pJkMM2xwMx+cOKsUNQwoAXFIAURcZk+lRaVEvgLNGyXlFP4g89Q1tXJ7cXz
         wpqv7jZHH4Z8wBbAbqpNTiWtSBLJpXf8R1ppDS2jXesK6sMTG//LjQtPVDEcZfOUYuS8
         tlG3JmXQj6cgC3RTd3PBQ6HrlPejMSLv8t68eyAJCQfAEEI9ecdmRqhNn2xfQ4O0zZAe
         mCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tdJu4NzPjRKxf7IHGvtWzEypzz/sgqEq/MXKxQfclPc=;
        b=tbVkjUbmrSu34QO1P/mnjkOa0bXMfPENOmxcbKmcH0damunkJB+lgC0tZnpcLVRzwt
         z+Od9yU8EeFAfvmDbGG+wwoIGUBNSMRij3dGiPYkZ3loY/tSq/9Me9icaQVFprYLYhgH
         rOeA9sYKparo/gzZzl5WR1pp9YIfN3jAkz7rDkv9g6adgFApqUvHNVfhZV0ATu4yTBQC
         ybOcnDmky1cLIlkoVdLHiGUa4Jbrm4vLIJbw8Pvt9Pj7beBhmTCw/T/thUtrr6klyNGE
         gVXKh3VJSL6PKXkBpPVGmboyWN9Cmz1GnzgNXwNdjPHOgEbGmdA1ObtoXwmjLJzO6ddk
         bDlg==
X-Gm-Message-State: AOAM531oOvXCn7/x7A4P2yDUoWYOljaxci5gq3L0XJQzFX2hiwx4jXd9
        jWmHmEEkcuCbCShNCmRI5RC3P0ZlGoPEiZAlx4OGxg==
X-Google-Smtp-Source: ABdhPJzHdvylMX6Bu6zBm9RnvurGoOQTywfu4c1iZpW+Dom2fsBqXYVajD2pWqqZHTQ9qVJm9X08DbYyYFfsmbbKN4I=
X-Received: by 2002:a17:906:3b48:: with SMTP id h8mr8129952ejf.261.1617271458228;
 Thu, 01 Apr 2021 03:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <YGHhPlK5Ej4QywNH@black.fi.intel.com>
In-Reply-To: <YGHhPlK5Ej4QywNH@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Apr 2021 12:04:07 +0200
Message-ID: <CAMRc=MfWiqUKq82M-9dCVKRO=RFKGJ+ARTTfhEy9Pbog2Txk1g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.13-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 4:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> So far collected stuff for Intel GPIO drivers (including aggregator clean up).
> No conflicts are expected.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit b41ba2ec54a70908067034f139aa23d0dd2985ce:
>
>   gpiolib: Read "gpio-line-names" from a firmware node (2021-03-08 11:59:17 +0100)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.13-1
>
> for you to fetch changes up to 6c46215d6b626cb0981f8332da506b69b98c4b49:
>
>   gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events (2021-03-27 23:48:55 +0200)
>
> ----------------------------------------------------------------
> intel-gpio for v5.13-1
>
> * Implement event support (GPE) in Intel SCH GPIO driver
> * Clean up GPIO aggregator driver to use more of the generic code
>
> The following is an automated git shortlog grouped by driver:
>
> aggregator:
>  -  Replace custom get_arg() with a generic next_arg()
>
> lib/cmdline:
>  -  Export next_arg() for being used in modules
>
> sch:
>  -  Hook into ACPI GPE handler to catch GPIO edge events
>  -  Add edge event support
>
> ----------------------------------------------------------------
> Andy Shevchenko (3):
>       lib/cmdline: Export next_arg() for being used in modules
>       gpio: aggregator: Replace custom get_arg() with a generic next_arg()
>       gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
>
> Jan Kiszka (1):
>       gpio: sch: Add edge event support
>
>  drivers/gpio/Kconfig           |   3 +-
>  drivers/gpio/gpio-aggregator.c |  39 ++------
>  drivers/gpio/gpio-sch.c        | 198 +++++++++++++++++++++++++++++++++++++++--
>  lib/cmdline.c                  |   1 +
>  4 files changed, 198 insertions(+), 43 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bartosz
