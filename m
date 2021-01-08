Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546C52EF2A9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 13:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbhAHMvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 07:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbhAHMvB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 07:51:01 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0532CC0612F4
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 04:50:21 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id p12so3584613pju.5
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 04:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gXqo7VCj4XU5FmYH0qUbpD+gulSAYThuEwmQg8YCx8M=;
        b=sa5w7qYUrdTD12m2vYRD1DWbvlHIcB/lDR9a77mTUyu7Y0twyDRTfXC0oEwSWQ+fqg
         ElpbPT0PfIq1+iiabmLLAvqASaQLTJk/15NTJL8WtxiTPmu/HOv6/z33hWQygArQQ80W
         amK4PxvHMln+cnyaInIXc2iGyd7OYuv7iq+Jk9yoK0igIFk9YGPENE5RXW9++8e/3vRf
         4mCtqs/Seb9Xfx/ROolknvMv8GR6NuXketa0djOyKySUJ9iV+sEItHfTX38AZC9692GC
         NO1FrnB4p33zHAcs9Ff1oR1d2NJWXbgDLowzBYiFp+yDplijxbbyujVQMbf59q93R9dF
         WkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gXqo7VCj4XU5FmYH0qUbpD+gulSAYThuEwmQg8YCx8M=;
        b=AwGanBbLbkiOvpyNgl+s5w3WHEvcDv1Mor+eIFzmjNXCK2T+/GtOzAFNrWA9wv6ljR
         LmdAmZaxmB9dSs4n/ofRTWHWSkOLIbtsz/J39Yxf2qXf/5PQPOzUzp/5O5XxKAZBTKeb
         27wv3gvc9mGDkNRm2uRS7wC8041JMXV6KFFa5cWhkDym6dlvvIw21Z98vwPujOR58zlN
         xBFgzsgvGtwxhxGO7rQtr+S0EYwsvyOhMajFZp6zpLFAsvCnzSdfKsO3HM3I3n/JnP6Z
         ZXiryHRlVvTGk7xX0qZfWIPK0CxJw8E9sIRhqyM9mmEJXPFPjuUtXdKguv3q5GMhsa2Z
         s+fA==
X-Gm-Message-State: AOAM531kwirTfsooNnPO/OCEDr3IXKcPVwT8x+4O0rJ4g7+IK+fJ376F
        osWNBWNZoT2YOWSHHl9SPUZDV96Xq7oH+Gil7N4=
X-Google-Smtp-Source: ABdhPJxMEhvlytosUnqMkLbiT616CRd4+ahfzbzw7Blz8wire1oHTkl+6Rm9Qq2g6afOu4uM1AqejDipCmpWz3/LMXw=
X-Received: by 2002:a17:90b:a17:: with SMTP id gg23mr3634198pjb.129.1610110220504;
 Fri, 08 Jan 2021 04:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-4-andriy.shevchenko@linux.intel.com>
 <20210108070722.GX968855@lahna.fi.intel.com> <CAHp75Vcckax+HYH1aYDG0tsgiL_1xXLqRW-8Xjq4+-OhLWXaLA@mail.gmail.com>
 <CAHp75VcPM0UH6iaCdbakgdaxM7CaJax8-kVLMzYvAeFfRYgdng@mail.gmail.com> <20210108124643.GA968855@lahna.fi.intel.com>
In-Reply-To: <20210108124643.GA968855@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jan 2021 14:51:09 +0200
Message-ID: <CAHp75VcrWhnM5xFEwhK8yPAJ9yLeuGMZh7Xr0V8_x7Jyvgvu2g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] pinctrl: intel: Convert capability list to features
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 2:46 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Fri, Jan 08, 2021 at 02:31:23PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 8, 2021 at 2:22 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Jan 8, 2021 at 9:09 AM Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:

...

> > > I don't see how it could be achieved (offsets can be unordered). If
> > > there is such an issue it will mean a silicon bug.
> >
> > Specification says clearly that one register is a must and its value
> > defines the behaviour.
> >
> > "The first Capability List register is located at offset 0x004...  and
> > contains a pointer/address to the next Capability List register. The
> > first Capability List register is no different than others... except
> > for its =E2=80=9CCapability Identification=E2=80=9D field is always 0. =
The total
> > number of Capability List registers... is 1 at the minimum (to
> > determine if there is any capability)."
>
> This is not the first time something like this is done wrong at silicon
> level.

I agree. What about solving the issue when it comes?

> IMHO it is always good idea to avoid possible infinite loops
> especially in the kernel space.

But do PCI / xHCI (the first two that came to my mind) have something like =
this?

> > So I prefer to stick with my original variant.
>
> OK.

--=20
With Best Regards,
Andy Shevchenko
