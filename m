Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1E81ADB3F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 12:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgDQKiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 06:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726632AbgDQKh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 06:37:59 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13406C061A0F
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:37:58 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t11so1406102lfe.4
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sa/iJD7pXLwK0IaGFW8Prsaqr68kQ7db+mxnLmQAbkc=;
        b=iety4liZG5P9elk7/lP+iL2AHMKx0QtHLW7VYtXbcYPQLbLVQtk+jn9f4kR9a7n5vG
         aFBkAg7UsNhsWOLfIkPyEVRnddRtiZU8WGG6b/oiz5r3gPilwiajTp18Jn4Wnq+lNWCU
         t3rzThml+VgLWjJ2Wb/Bshfyg+lrYBzSvPZo0iPTjt3Ykh6GE9r83GwKIrq1EaHM+lZn
         9YA65HUiiaEn5pxzlDukLJpEqrd7SQH6JHyPVzitYN59CHHfMreGQeVSkXL+dpRHDoFz
         xcQldlM18jB91KEArUgpoVVlBLAPptdB+Fw6JFHbWwm1qzpovQtWxQXMNq5KzMD+Ml8v
         Qjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sa/iJD7pXLwK0IaGFW8Prsaqr68kQ7db+mxnLmQAbkc=;
        b=lX9iD/bYNRiaq43xD8P1gRosvk7YevINvFjm1UPxCKJyYgc8P78Kx069w5fkvOnMqE
         mx4wqbwAF3Iwowa9MZnoBJKnZABoMUhEkSgfcFCVpRYFZeoHFfqOW4BWDk+5FOIGJr5Z
         +1DaGVZ/ydEGJpeWPiU1kWvmEExFmRlxItca/pjYTq5nWyhmbqho32nDa9BVFkA1Zj9g
         TYTKuvB7YoPpM9Y8SJHUMxUYJaWhVjNo4Y26KmyJbR1oX42qscAvwXWnJcYVIncPxaev
         A7TDZsv6RlRWzy1xFNbyXL8Mj2ljtmC6zqwy+qqgjnqyjNGEry4cHjC6PiE5gkR/xbyZ
         J1Fg==
X-Gm-Message-State: AGi0PubvEqAiz9Y1u8Bt//VqOn5g9Bi8M/KHFYK1qYw0rTyD96Vjg007
        JhAPpIneFjh97rl60/mt1F+8ti2RA1CY8QTO4lB27Q==
X-Google-Smtp-Source: APiQypL+l3OfAOj7WyEBiVnd1Hde8nWUk9oVTa23Bt1LquS4heag/rCd339qzjCwvyfj3fQjgyxmvThxLnBwUwkb0rw=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr1618012lfa.194.1587119876479;
 Fri, 17 Apr 2020 03:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1> <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com> <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1> <495f118d-380d-a994-d8f9-bacdfe4efb85@ti.com>
In-Reply-To: <495f118d-380d-a994-d8f9-bacdfe4efb85@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Apr 2020 12:37:45 +0200
Message-ID: <CACRpkdZww1k-vo32FRjQZ0Qic_FccHh4KuekNm1aU3i5XW6Gog@mail.gmail.com>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Drew Fustini <drew@pdp7.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 4:17 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> (Changing MUX_MODE from user space sounds very unsafe for me.)

The way it works on a lot of platforms is to implement the
gpio_request_enable() callback such that it muxes the pin
when requested to use as GPIO.

How to handle that is up to the driver, but the simple ones
just assume that if (A) the pin is not muxed for something
else like SPI or MMC or whatever and (B) the pin can be
muxed into GPIO mode, then it goes ahead and does that.

But this policy is up to the driver maintainer.

Given that Beagles etc are pretty much for makers and
industrial control and such, a relaxed policy would be
beneficial for users that want to do some tinkerytink.
The reverse goes for users making airplane control
systems.

Yours,
Linus Walleij
