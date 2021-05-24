Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B4F38E1FA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 09:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhEXHys (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 03:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbhEXHyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 03:54:47 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDAAC061574;
        Mon, 24 May 2021 00:53:18 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x18so15877838pfi.9;
        Mon, 24 May 2021 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y04R6/08U9dkRFJf05cGeR44JCL1F2pFW48VsBx7hWw=;
        b=Q3qay/droMC/BQm5GLSNQBNXDPJKU+FzavfHsNOAjYU0fqbjovgq8f1ZIMvvLgL+UC
         axG1/wi0f+DyLYfUD+IISWmw6Sn6ba44eornEGHUMT/uznat5d9ZPves9Vm06DywE3wL
         74QmQDMiJVx2bJ8H7wqWUj84TrK3fb3ANVqO6iYKLUUrHrxN/cfWqUF0+Yh6lh6CQWGh
         FsiNROE1IR0U/VKr92kjo+rBhKPmRsQaVZA5XyNRpnToO9RFyCitQjv8Yb3mFjlDlSGH
         brtiEV4NmYxEicbg0QJMLXdPnIP1WsuSLmkEG8uuDp0+4LpD7yv9OEZBu+FNnA83fZTD
         T5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y04R6/08U9dkRFJf05cGeR44JCL1F2pFW48VsBx7hWw=;
        b=XYy/NVcNpzpNypVFYwd3uYb1UXLYi7iktCLXjjw0Bo6BD1cxKVTSEDK5S1D7dOMJ+a
         L1KK6pV/Nz7x14wWSKmdtPTvHjUq320ZhfRje9o2kbYJGO1208V/TDyCyeclkdjgx8tO
         PoDabz6HcSJV5j2wSlZS6oJ6nnyuG49eTn/+8AoelRhzjy0/K0rGwWdJVIs7WLtKgRHR
         mSiD/s+M9XkGCXL9EUHTx+yEGYgkQ1bk2vgTjiZA5zOA1XVFn0HN5DwmPhJV2/U0JHER
         fqzuvIGiSTFZgYH2gH+icsNVGW04Pi/h4wMch01cKInv4V5pEruCop2+z1dytHj6Dd02
         x+jA==
X-Gm-Message-State: AOAM531Yz2nqhn+Lox+2Az3xJFENRczmSKvkOMi9IREr1ehl8QtJaDgW
        bPuKxRzNVMHvGMrby1ixRvO6BJdB7MXJ/NYcQNA=
X-Google-Smtp-Source: ABdhPJx/SM2WU8m4e1W8990QsC+F+hMX8nETE38+8T0HCD1nBvBpwT+3bNGScZZFBW9wG93wgKbrGvyyW6qojmln5J8=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr21725708pfh.73.1621842798285; Mon, 24
 May 2021 00:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620735871.git.sander@svanheule.net> <cover.1621809029.git.sander@svanheule.net>
 <YKr9G3EfrM34gCsL@lunn.ch>
In-Reply-To: <YKr9G3EfrM34gCsL@lunn.ch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 10:53:01 +0300
Message-ID: <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Sander Vanheule <sander@svanheule.net>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 4:11 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Changes since v2:
> >   - MDIO regmap support was merged, so patch is dropped here
>
> Do you have any idea how this will get merged. It sounds like one of
> the Maintainers will need a stable branch of regmap.

This is not a problem if Mark provides an immutable branch to pull from.

> >   - Introduce GPIO regmap quirks to set output direction first
>
> I thought you had determined it was possible to set output before
> direction?

Same thoughts when I saw an updated version of that patch. My
anticipation was to not see it at all.

-- 
With Best Regards,
Andy Shevchenko
