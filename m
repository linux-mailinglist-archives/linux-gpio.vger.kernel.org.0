Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D231AC10F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 14:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635452AbgDPMVE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 08:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635444AbgDPMVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 08:21:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA99C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:21:01 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e25so1079114ljg.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rknl/ynm4VavE+Pu+iawF7Fl7IF9Ku/ZEj160zwTjKs=;
        b=BD11vIE6RgcwRqvlKjES5WQXc66nQU9o+Vi+AdltFX5gHPj3NQDMFsFeoRh+cflBT/
         iQtNMJdkLDCzOVU0lovj03FG0OtwaMVC8GYqCbvfYtE9CAhEYH5w1Z5aVNjU7141utE0
         3El994Tl6mlvtpuylP342T5UOd1+/2Ek2jPj4Lj3Erb7cc91ltdn9U/UOMQr0iQ8QqTt
         G5PiSckzAvUDzJ6eyjR0MjeW+GOUjIcU4Lb75YxDPHV9KKeoAxA0tut3e/IUvkWjJvji
         fAtTkNkCRC+QqE1GblImYLK0t3OiMDRiXOTgFMTuHID4O/oN0HAe7i19LkhPUrqnr0DT
         9FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rknl/ynm4VavE+Pu+iawF7Fl7IF9Ku/ZEj160zwTjKs=;
        b=jH57lCpCd7Or/71jieLzVpJlHFI74tbFnQkQ/D2baaDOhPNcWJuCfMCutJ2zCRxPHP
         7KyCKin+i7lAt4uKWGKW5aAS/IVmj1MmMt/3sC52Qyj5JxoGHt9zVsw5C9x+A4pCYOF4
         IvEaaJtJfTXx8FkQOaROjedeWw0bJPUjPVgt1Exdwxr051j/n89+5qGVCh257LD+axIg
         +7biHAj77b36UlJjZWCxm7w1am9HHXekbSknBt4lKtccm6WlJTUIA0HZXyKQIe8KKDN7
         EsXHpmigjYurEYnFGn1P9FRrjdrDXwbI5jZH3qX5zLqXUvUdHjVKTV29Y87GV8UsxjCn
         0TNQ==
X-Gm-Message-State: AGi0PuYrUaac089a3kRpQr93gHXIi71xyLxEx8g7dvXE5M4EGPbzAiX3
        5Kl5SqUnWLbXxn2FIqiZQa7T+f4gi+dB0NwfAWf97tAL
X-Google-Smtp-Source: APiQypIyqABkvrUdCitKfD6vXcnegm6O7VukMz0pY9EwLKwd6NWTkxHDqTCb+HK6IH1dLQgaxOHJI6WXdASqDPYzvX0=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr6115395ljo.168.1587039659684;
 Thu, 16 Apr 2020 05:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200414174900.5099-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYu3uahs--iOKXwrowiwh4ch-evGZN91N9u9q_rrLFV9w@mail.gmail.com> <20200416105301.GY185537@smile.fi.intel.com>
In-Reply-To: <20200416105301.GY185537@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 14:20:48 +0200
Message-ID: <CACRpkdad_Raetj10e=N+KZ3erPZFTXC8F3ChShyew8PkLbiqAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: pch: Use BIT() and GENMASK() where it's appropriate
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 12:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Apr 16, 2020 at 10:27:40AM +0200, Linus Walleij wrote:
> > On Tue, Apr 14, 2020 at 7:49 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Use BIT() and GENMASK() where it's appropriate.
> > > At the same time drop it where it's not appropriate.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > > v2: update one more macro (all IRQ settings are plain numbers, not bits)
> >
> > I managed to extract this v2 series with b4 and applied it.
> >
> > I don't know if you planned to send a pull request for the PCH
> > changes, it was so simple to just use b4 that I tested it on this
> > patch series and it just worked.
>
> Thanks!
>
> I would like to have rather Ack and send a PR, since there are more Intel GPIO
> patches in a bunch.

OK I dropped the PCH patches from my branch!

Sorry for missing this.

Yours,
Linus Walleij
