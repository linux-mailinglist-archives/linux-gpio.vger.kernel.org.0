Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B740E2815A5
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 16:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387984AbgJBOsy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 10:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387919AbgJBOsy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 10:48:54 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7CEC0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 07:48:54 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id 144so1392894pfb.4
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ZsFy7t5Yg86WgWsW1D9/ljDa+7QOV/XOpbNOneDDlI=;
        b=dLqMc0LI6BsdaJTITzS7vNJGAhVt0PuMb3G7PqoT/5x9y0MSPZhDmB3Brtm8WJeVxC
         D6fo0MLMOQBqWCvxPvkZTvkPxYoo4NcEdtfTwZoAUMdW3/pqkljPb2SKmZd3NsXwQmMC
         7FCcqFsS8NbShFQ/keF5uDJ+QBzmCP8kl801Ixho9sWINbOvjRCcia7yyblN8efbttaw
         AwoKDGQD+OB8CU8tflTx9fbBjvuus53fvgLMAOiur0+tvbAbWq2aQlVVUj48FWiSQNgH
         cjKyvPHYW7Dg60352nNxqBm8RK2SqK8LcNVWkrZ0sAHKygTZDfWa+EliTZRSp7mRk8u5
         gQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ZsFy7t5Yg86WgWsW1D9/ljDa+7QOV/XOpbNOneDDlI=;
        b=EazzRaQaOyvY2j8/rVqfx1T1dud3mDVrnA+DgmZXZUeYbqeCF+jLzuMrCrRm5Db6CK
         cSilq3R5vN4frEtSBsoPwtYPpDGe9sR0cFwKIxe1NKQIvMVf550mZ7nhfWQOm8OivO/V
         xxnLT6K6Vh813e4fCFkZSBGLjmtOzunSbPq5KP8fOXcVIiAugunkl4jWHQbj6tTDp3ff
         yxNN0o4vYzDakpqIsHWKOYbWiIyBv/j8sCM29er/Kmy0vMacDBlN6JHi3s2YPoTy7GqZ
         Wy1yr9LKVyKbsd0IpaO7npobgobFKbSbXGQvCy/SX/L8BfIMBjQAe61fHJrVUl9Evm/1
         2jqg==
X-Gm-Message-State: AOAM533y2fB5XN3pQxTIekbzkL4Mng/X2ypAYewuJHDxq5/hKLZTKJA3
        M8tiphhyx7pEaXNG/iQX3UG2FjfPPieItJuJVcs=
X-Google-Smtp-Source: ABdhPJzPYR5BMc7kXdPTzDXY/1SpY2sDpG1lpMx0FfyX6Yu7UPKFTUSQhUBTAvc1+9bw4snx+MBeU0KRmNmo85BAY68=
X-Received: by 2002:a63:4c1d:: with SMTP id z29mr2571399pga.203.1601650132477;
 Fri, 02 Oct 2020 07:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
 <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com> <CAMRc=MfP9EBqUCvcKUmwF4Zd+yFO-yfC6718ZXeM1PbtEqYWNQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfP9EBqUCvcKUmwF4Zd+yFO-yfC6718ZXeM1PbtEqYWNQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Oct 2020 17:48:33 +0300
Message-ID: <CAHp75VdCfLrTcM5BeEgxyoRR5ptYDqQQQthrUmNoc7Fy9SwTXA@mail.gmail.com>
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

On Fri, Oct 2, 2020 at 10:25 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Thu, Oct 1, 2020 at 4:56 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

> > > 1. Switch the major version of libgpiod API to 2 and start working on
> > > the new API (preferably starting out by simply porting the current
> > > library to v2 uAPI).
> > > 2. Indefinitely support v1.6.x branch with bug fixes.
> > > 3. Consider v1.4.x as an LTS supported for as long as yocto uses v5.4
> > > kernel as their LTS (this is because v1.4 is the last version to not
> > > require v5.5 kernel headers to build).
> > > 4. (maybe) Create a compatibility layer between v1.x and v2.x once
> > > v2.0 is out that will ease the switch to the new release.
> >
> > I'm wondering if you are planning to develop v2.x with possibility to
> > coexist with v1 on the same machine (like gtk2 / gtk3 and other
> > examples).
> >
>
> Personally I would prefer to avoid doing this. This isn't a very big
> library so unlike gstreamer or gtk I think it won't take much to
> switch to v2.0. If anything - I prefer a compatibility layer included
> in the package where - if an option is passed to configure - the old
> header would be installed alongside the v2.0 .so file + another .so
> for translating the calls.
>
> If you see a very good reason to make them both live together - let me know.

Aspects that come to my mind, that needs to be taken into account are
the following:
 - would ABI be kept on a library level (will binary built against v1
be capable to run on v2)?
 - would API be kept compatible (seems so according to Kent's patch)?

Main point that users that have compiled something for older kernel to
work should be able to run this on newer distribution environments
(like one, that would have only v2 of the library).

-- 
With Best Regards,
Andy Shevchenko
