Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813B4359753
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 10:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhDIIM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 04:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhDIIM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 04:12:28 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C6CC061760
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 01:12:15 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l4so7230622ejc.10
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soBlYbWRpEsxJknm5Lhn++2ZaagHWN09vzyTmxMmeVo=;
        b=0WX9c+qfhfO5GmSeazR9RvPzF7dvPZpYScvyTD4SJuIfzU9J66nhlB2/XnZcHGhuIt
         N6vlAJVBeR+uZz9+USDDWY7RFDxIv2Ckq7EAvzDRPLeIcCr7+6A8nIwsJatwXo7lJfqT
         sIrXOOpguGctTsbOBaPd3Rt0d3XOH9Qh43g1Qs7oGb7wiiJ6UrZ5Ril1YNQBZ8jhOrPI
         d0SyN9+SmNgLer9UBV6CVglSRjU1h7flgg7XSrNvGpI/4o15GUB+18ah1j8fbD4YKk5B
         Qdh7e6fOkLlKVwlFtkL2gLMUllCTR1XIHw0wdFbpINEeKEJyDl6YXc3QT7oLjqvMq8TK
         MEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soBlYbWRpEsxJknm5Lhn++2ZaagHWN09vzyTmxMmeVo=;
        b=OtDRy1/5gVvjBSGvhfOJhXpTcSn5FywNh1YTW3YkP32z8kXlCg1pcBxFC+GFpVwsPr
         n3K2fPreiHqKCNHziRBzvOjCN8Ag8O/N/mjZ8OLbY6hUbWp6qk0TtBmsz6TyEWWPEk/v
         csM/yAYP95jWUw1Cu5vSuLglBuclTiHFFxbZI0WdED/TSs1RWhFgGXg80Ny9e7Wnn9TX
         v6/H4CC94c+q02JTDeUVL+OZi/NCs6rRHfqKjJQSeSA8/WNSFc/L8nvCuo/IvBtiW3el
         W/GsTMOBgo2ismtNeYDdvP32AzZ7aC9EoRe85Sn+FmoNS1tDX425BQySye2D16AsX4ju
         lafg==
X-Gm-Message-State: AOAM530GY2eWMb7SjEQNT2qstGgrurl0xkgkjqsOWEAWfwJMhrUfIRws
        QZecqZzWUKUQn4TS2QgnS353sgSA9KCATnoPItKpcw==
X-Google-Smtp-Source: ABdhPJzFlNS40iTWybM8JrgLwuZy7PHVqI5O1X+G1FAOvMjftYuD26E7oyn9Vw5WsMrDkrfTiLjOdZ5ccB5nkQQg/wo=
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr15580727ejm.87.1617955933782;
 Fri, 09 Apr 2021 01:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <YGxJYL70rkzrZQ0t@black.fi.intel.com>
In-Reply-To: <YGxJYL70rkzrZQ0t@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Apr 2021 10:12:02 +0200
Message-ID: <CAMRc=Mfya7+zseii-Y-dbJ3K3p-ww_vxMSJgWeuiua4ymw0qxA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.13-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 6, 2021 at 1:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> More stuff for v5.13 cycle. PR has been done against gpio/for-next branch
> of Bart's tree.
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
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.13-2
>
> for you to fetch changes up to 058459043e71b5c1703194ea71aab576c0ff4f4d:
>
>   gpio: ich: Switch to be dependent on LPC_ICH (2021-04-02 21:44:56 +0300)
>
> ----------------------------------------------------------------
> intel-gpio for v5.13-2
>
> * ACPI quirk to ignore EC events on Dell Venue 10 Pro 5055
> * Kconfig fixes for GPIO ICH and SCH drivers
>
> The following is an automated git shortlog grouped by driver:
>
> gpiolib:
>  -  acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055
>
> ich:
>  -  Switch to be dependent on LPC_ICH
>
> sch:
>  -  Drop MFD_CORE selection
>  -  depends on LPC_SCH
>
> ----------------------------------------------------------------
> Andy Shevchenko (5):
>       lib/cmdline: Export next_arg() for being used in modules
>       gpio: aggregator: Replace custom get_arg() with a generic next_arg()
>       gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
>       gpio: sch: Drop MFD_CORE selection
>       gpio: ich: Switch to be dependent on LPC_ICH
>
> Hans de Goede (1):
>       gpiolib: acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055
>
> Jan Kiszka (1):
>       gpio: sch: Add edge event support
>
> Randy Dunlap (1):
>       gpio: sch: depends on LPC_SCH
>
>  drivers/gpio/Kconfig           |  11 ++-
>  drivers/gpio/gpio-aggregator.c |  39 ++------
>  drivers/gpio/gpio-ich.c        |   2 -
>  drivers/gpio/gpio-sch.c        | 198 +++++++++++++++++++++++++++++++++++++++--
>  drivers/gpio/gpiolib-acpi.c    |  14 +++
>  lib/cmdline.c                  |   1 +
>  6 files changed, 215 insertions(+), 50 deletions(-)
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Pulled, thanks!

Bartosz
