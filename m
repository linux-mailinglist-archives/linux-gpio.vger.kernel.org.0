Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF49280E02
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 09:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgJBH0B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 03:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgJBH0B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 03:26:01 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E70C0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 00:25:59 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id y74so531478iof.12
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CCuYDmE8rboxD2nNU9Fq4x9b6HDclvPnQv9CFoBo134=;
        b=SA/ZZr36EKnQUMEhKvXSWYL0sl6zpxUBVmDw2oZQD372X0jodfTBBcaAsiVjstsWvo
         ADT3hr8Mg57DuDfRPM3+UoC5wyvxLnmxRiKWqevg6vLgLeCwjypMerxwHlQHrdgMfgex
         qz6IfxChMHHWa3SyAz3EPdzEjUtb6DZJvbxcal1ZFNxYJJg8CRlQoAI6vPH2XdK13Jz2
         G3qJAPYktr7IdfR3SrSJx2/jpENJl1ACGdaqirYLFmXhR731EKvSuEXVYulopu0uKF+Z
         4JJAmYe0xzlT214Lqc+9xjDhdgoZIC9KtQLGy194i7b5M2X9OMhafl+WA5Xnn/nVG9F9
         fVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CCuYDmE8rboxD2nNU9Fq4x9b6HDclvPnQv9CFoBo134=;
        b=T3tLJpkKs60qCVskoxbT4PlavMMBo3fNa1dLrVcxbL3zrcPQdz3XYxwATeTtBU0Ufs
         m8vOgk+vgA9wfw4O7zKnZvrs7wCk7fkQaHZu1wktCITHby8xjrkFlbV50GVe9kID3J4p
         n4QMtvh4MX3k+gGvQTg+uz9soKr1xgIIBro9rpLOmWPa0yEL2z1BUlUTwNXORiazltVa
         Rhz0kWdhFkjKa105nluKiLUAOPGPItPDylPRxIPkIsHlrI+rupXnkzeieLRLtAkrDrTl
         InRrPBxuFtnUSj18C7CuEsSgaVaC6wMjWSdmhpFzOIj+UzqdsPzfqx/NGKzqqm/YN4IO
         FCPA==
X-Gm-Message-State: AOAM531KBHoponoiCPJD8nxRXVL9zyYFx+WKRRd6U/IZypw36gP2yAqf
        QSjq0Wg0wxmTcy7y86zZQ2Ju0Bqr6G9tO5Hv3R2QAQ==
X-Google-Smtp-Source: ABdhPJyrBE3R84aEnuw/InCFvgCizOTeHSlYChaeRZMJrewrV+Qy5URF7y+CEO+2MFhGl/G20oAI6XzP26L8KRiLs/w=
X-Received: by 2002:a5d:8e14:: with SMTP id e20mr1006721iod.119.1601623558902;
 Fri, 02 Oct 2020 00:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
 <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com>
In-Reply-To: <CAHp75Vfy8un3APcYqWyO9b8aFMAyKVSkAbn=6kxpbSthgq4jxA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Oct 2020 09:25:48 +0200
Message-ID: <CAMRc=MfP9EBqUCvcKUmwF4Zd+yFO-yfC6718ZXeM1PbtEqYWNQ@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v1.6 released
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Thu, Oct 1, 2020 at 4:56 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>

[snip]

> >
> > 1. Switch the major version of libgpiod API to 2 and start working on
> > the new API (preferably starting out by simply porting the current
> > library to v2 uAPI).
> > 2. Indefinitely support v1.6.x branch with bug fixes.
> > 3. Consider v1.4.x as an LTS supported for as long as yocto uses v5.4
> > kernel as their LTS (this is because v1.4 is the last version to not
> > require v5.5 kernel headers to build).
> > 4. (maybe) Create a compatibility layer between v1.x and v2.x once
> > v2.0 is out that will ease the switch to the new release.
>
> I'm wondering if you are planning to develop v2.x with possibility to
> coexist with v1 on the same machine (like gtk2 / gtk3 and other
> examples).
>

Personally I would prefer to avoid doing this. This isn't a very big
library so unlike gstreamer or gtk I think it won't take much to
switch to v2.0. If anything - I prefer a compatibility layer included
in the package where - if an option is passed to configure - the old
header would be installed alongside the v2.0 .so file + another .so
for translating the calls.

If you see a very good reason to make them both live together - let me know.

Bart

[snip]
