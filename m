Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282FA26CD99
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 23:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgIPVCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 17:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgIPQTJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 12:19:09 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F68C0611C0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 04:09:32 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n22so5856113edt.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 04:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PE/vVbtZ2t56eMH+tLAsyelGad3azKLrl8SBN4ILqow=;
        b=oeZNumN4eLapOPjgfGKkLMwW5SvcAEDtbJncpyNzl7vHRtvO+lrXXaCXI3EXtGHqc4
         QbEDPsjacGEyVqGbgPg65rqE19c5Wiw1db3tqGdMRh+T3NvuWnDHwgQ6oI6UVp4cc2uB
         +iivoeIYo+ePgSLsQON36XhjUgaUbRtJ8ETChvga+MykeScfKQlSo4O2YTOf4QR9tUKI
         OsWNviLlJnInjnp6gaFHPctijKGoNQb1QPlxU8hFG7meM0iTmgrmOC43P4Ff2dKmhfk1
         B9rF/X/x6EeWFyIeC2cXpjNg70FixKga+U16QN0yMyE2Cyg5NBojO9k4Kech7k+JdbWs
         SONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PE/vVbtZ2t56eMH+tLAsyelGad3azKLrl8SBN4ILqow=;
        b=Gj3siLXdxQZU8Rtoeyw+Pr2b8m0Yql6ndISPC2jyP96WwkcaMUI28eht4wLtSKtcG4
         eAIsfyzj2qT4jt9NC1d0K+aIZgV2XrrW5DwLrbkbL12O5plqKFfqC94nNW3i4TIR4nZ0
         944iCxG6jMNHczTz24miFWiwmj86ktysNvgKx9N9P3lioKf4WXCz3bJjK6YhHX0Zu36D
         pdI2jjQ4sOkhsH9EzWbxvgSI5RPPK+Ze7OkgiBuiviLrBzOFaVN17GcOKVUHfWG3IDxo
         fR1xDLDxxOrb8HpP6YBUgzIst2Ji7i483doLDzxkWTimFS53AGyHE+reg5LMVNUDG548
         /FMw==
X-Gm-Message-State: AOAM532ZqVEQW647zze7eVDW2KOYUHJz33jhIGUtbzE63q1Mw7PJ7e+2
        WKsGBa9zQHizBS8FRTaz/vuy25fQhtvLpBSBmJs4Ew==
X-Google-Smtp-Source: ABdhPJxdmac/FBfQsivBhz7Pi6CatnN7TB0meCEyrxgrANGU4k4nt7pw7+Ma40m3cYcGTP8UnaI2CvvHIWr7yfoEilw=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr27679411edn.371.1600254571184;
 Wed, 16 Sep 2020 04:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <CACPK8XdCkw7ix2J9WyOXDcwsMThXwQ62=E6cDLX+-9WJMsqrnA@mail.gmail.com> <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com>
In-Reply-To: <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Sep 2020 13:09:20 +0200
Message-ID: <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
To:     Joel Stanley <joel@jms.id.au>
Cc:     Jeremy Kerr <jk@codeconstruct.com.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 6:51 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hi GPIO maintainers,
>
> On Fri, 11 Sep 2020 at 02:20, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
> > >
> > > Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> > > corresponding to the 80 status bits available in hardware. Each of these
> > > lines can be configured as either an input or an output.
> > >
> > > However, each of these GPIOs is actually an input *and* an output; we
> > > actually have 80 inputs plus 80 outputs.
> > >
> > > This change expands the maximum number of GPIOs to 160; the lower half
> > > of this range are the input-only GPIOs, the upper half are the outputs.
> > > We fix the GPIO directions to correspond to this mapping.
> > >
> > > This also fixes a bug when setting GPIOs - we were reading from the
> > > input register, making it impossible to set more than one output GPIO.
> > >
> > > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > > Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> This series is good to go in for 5.10:
>

Hi Joel,

I don't have this in my inbox. Did you copy me on this series?

Bartosz
