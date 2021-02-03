Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BFB30D6DC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Feb 2021 10:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbhBCJ6q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Feb 2021 04:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbhBCJ6p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Feb 2021 04:58:45 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798CBC061573;
        Wed,  3 Feb 2021 01:58:05 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id r38so16955606pgk.13;
        Wed, 03 Feb 2021 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l85f2Tlq2B/Iy2lfM9r3CyfdQrQrcedoJnaBPXo1e1w=;
        b=E2bD/+ZDle0PQTNoiFpVV6f+OFfr0P9L9Th5H54NE9g/GLE8HvdZlM/hfY5g6dMhAM
         zKH0jsMSn8Ajl/BdThXcjmRBt0HyUHstJF0LjfHD8NPnjDN7VolH7Fr2l83Zi2UMWA1Y
         zMjQ2eOvHJnYSt6Q/nkYK3D5dzPrUJBDXjWKz8zj9EIlKAZnGcQn5d/rV2wtmUybw5tH
         l6wsaOIsAGh/tKvhLrF8GOttlDO7TL7EHfAHtEfze2FM0V6e7HfXrpyHLN0ZJBkL+NOm
         5mpEwEstUzBY9aof7hPajJ7sJgroPIdTZCWgUfQAPy177uT21KflTmGAWvLjwa1eF4b1
         qKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l85f2Tlq2B/Iy2lfM9r3CyfdQrQrcedoJnaBPXo1e1w=;
        b=BLALqJZ78ySND2t1GyQZP25uxVztdhT8vOdpbFbcbwNajJHJFaUtBAFtNQYR2CD2QH
         Rxdep0vgrvNNaZVmuQKB+5JuIizPPEJl5z3JlLsJZQlgs6RvNYmbK20PjKC65tzk4PdD
         i/u2s4ya6NOw1OroxL/wN9ZH5kxQ3z5+CDwEp0Ku0/ZwdxKNHoCmh03xLtdjCcZR7mbN
         aQB/KoUhgl+Lm+5wv6OiCv2iWAMVokn7ui59PNP+AZzdMGxF478LLsmTfaxA7+DJ4N7t
         RMkvJwUg2KYz0B4sty5AwFGMNb6uCLlhIkDj6N8hbJLj2lKtQrl2JJdhnPSBoT29H1Hg
         gN4Q==
X-Gm-Message-State: AOAM533hQRhrFpNahKTCxPmesaym3H4dkNrWE1Q54oi4jrnk6wdDJ8My
        +n31vnuIbMBWsFJAsa7PD/iBVbdO1dhDKuwv8cU=
X-Google-Smtp-Source: ABdhPJz8yEMUE2yG9b6/wKdjHnk/Qb62s0Dv2BhCXf9OUrlR2B+OV175zl9NDQj43DHJJBhcrX1VZOeuwQYPucNqtug=
X-Received: by 2002:a63:e50:: with SMTP id 16mr2776546pgo.74.1612346285136;
 Wed, 03 Feb 2021 01:58:05 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
In-Reply-To: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Feb 2021 11:57:49 +0200
Message-ID: <CAHp75VeK1spj4=Zo0xKa4JyhnDkd6aAVPTEPucM6878yoj3ZVQ@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 2:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi guys,
>
> This is first part of Intel MID outdated platforms removal. It's collected into
> immutable branch with a given tag, please pull to yours subsystems.
>
> (All changes are tagged by the respective maintainers)

Bart, can you pull this into GPIO for-next, please? I would like to
base my PR on top of your for-next with this one included.

-- 
With Best Regards,
Andy Shevchenko
