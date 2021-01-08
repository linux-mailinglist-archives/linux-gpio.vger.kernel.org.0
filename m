Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597352EF278
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 13:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbhAHMWG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 07:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbhAHMWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 07:22:04 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B705EC0612F4
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 04:21:23 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id 11so6135587pfu.4
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 04:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQcNdHnFUOsq5eBkFBOzj7p7zC5/tI9mSquB8RyNl7M=;
        b=QjNYs1THEq2wRE4ngdZTW/S2LhlSRdKabJ8q6sN2s1n2swlU8rPjYywDFyQZLrvJlM
         9ZBQ41r8YIH4EH0Mc/eRsZVmHu18LnkF/l8izq0zvMrNaGjHoxxtbKwegs0aJ0IE8p94
         vAgrPujRX1HUAW0kJNm6Rd2JZMJz+6FJ2x0fiBTOzf8gtcXoJTbLy47j8roPcLgdCpGB
         USSwCMwNaKC8Qt8b6nsCTG/VYqKsHLhd+8cyWZVFyv9mJwHwgGoChbbvSZQAJcOtujfH
         4TBEnh2v4UJlaVtLTL56B70JCApp6KONScyB/3bY5sPJrql82i3TqcbrMZCqEgx7Pcqv
         2gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQcNdHnFUOsq5eBkFBOzj7p7zC5/tI9mSquB8RyNl7M=;
        b=FisWCIWgWSqoYGl8rLZ45W9eYZwLLtFcm8FACGZfrP/ijI/KyoXtRzbWSzYIyypgln
         CzVtZ3Ec5/LKbfQWzVzELgdplCrH47onEQx214NSzUSc5VV/IMp+Y0iGQ3u3N8BeZ8hG
         60oSBE76sbVSx/rpQgW3JjzdxMieSwc9oCgyheQz+YccdX7mwBMWAQAt5WNXMmri+oKe
         z4zbp7VAFOeiu6dVk2exKLenyoX52LCnQzLbUSFmt+EnezwutwkxHsLgpHyVJNpnRoE2
         0k7G3kGB4Es54VL2uStETj8P9l1D0ecoh4HOO8qwyivNl1L/+GyfoE9JzLhVD2HvTuFp
         zJHQ==
X-Gm-Message-State: AOAM533vA/w3Cwl8WY8MpeUtfNo/5RV55s2Qllea4N/CsvpfV1TALMQm
        KQqVmarX1tmuo7NErUSDMCX+zCo6vls5WQ4PzKY=
X-Google-Smtp-Source: ABdhPJwVigst/dmMLGlvtuRXkdak3wUfkJApj+JAnFW66qUwNE9FxwppcJAxA22KIbhLdL19H8csPsq+bWgyL0bslIw=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr3550782pfe.40.1610108483267; Fri, 08 Jan
 2021 04:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-4-andriy.shevchenko@linux.intel.com> <20210108070722.GX968855@lahna.fi.intel.com>
In-Reply-To: <20210108070722.GX968855@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jan 2021 14:22:12 +0200
Message-ID: <CAHp75Vcckax+HYH1aYDG0tsgiL_1xXLqRW-8Xjq4+-OhLWXaLA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] pinctrl: intel: Convert capability list to features
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 9:09 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Jan 07, 2021 at 09:02:00PM +0200, Andy Shevchenko wrote:
> > Communities can have features provided in the capability list.
> > Traverse the list and convert to respective features.

...

> > +             /* Determine community features based on the capabilities */
> > +             offset = CAPLIST;
> > +             do {
> > +                     value = readl(regs + offset);
> > +                     switch ((value & CAPLIST_ID_MASK) >> CAPLIST_ID_SHIFT) {
> > +                     case CAPLIST_ID_GPIO_HW_INFO:
> > +                             community->features |= PINCTRL_FEATURE_GPIO_HW_INFO;
> > +                             break;
> > +                     case CAPLIST_ID_PWM:
> > +                             community->features |= PINCTRL_FEATURE_PWM;
> > +                             break;
> > +                     case CAPLIST_ID_BLINK:
> > +                             community->features |= PINCTRL_FEATURE_BLINK;
> > +                             break;
> > +                     case CAPLIST_ID_EXP:
> > +                             community->features |= PINCTRL_FEATURE_EXP;
> > +                             break;
> > +                     default:
> > +                             break;
> > +                     }
> > +                     offset = (value & CAPLIST_NEXT_MASK) >> CAPLIST_NEXT_SHIFT;
>
> I suggest adding some check, like that we visited the previous offset
> already, so that we do not loop here forever if we find wrongly
> formatted capability list.

I don't see how it could be achieved (offsets can be unordered). If
there is such an issue it will mean a silicon bug.
I never heard that we have similar checks in the PCI or xHCI code.
Maybe it's something new, do you know if it has similar code to see?

> Otherwise looks good.
>
> > +             } while (offset);



-- 
With Best Regards,
Andy Shevchenko
