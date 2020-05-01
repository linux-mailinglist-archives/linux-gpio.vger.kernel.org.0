Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3005E1C13C2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2020 15:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728968AbgEANcq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 May 2020 09:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729504AbgEANco (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 May 2020 09:32:44 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7F7C061A0E;
        Fri,  1 May 2020 06:32:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id y6so2296262pjc.4;
        Fri, 01 May 2020 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eXZUCfdK7gY+Kv1hYGPVu4uc+SR+yxwik4zzcFw4aa4=;
        b=jy9nd5+8sIX4f67XLtJU1Ddc2S7xNmy0kmwE4u2l/biJGftOorp9LiZnPJqgqOqxpD
         MVOF+gGbJ8ESScoLQJqUwnl1QmhCxlN3A0NTpar+HqR1kb6Z6/B1Hdw2tgn3HsxiNTHd
         llkmOe547clbhmtHU5qt7cWhkNthcT99c8qyYROUE0bqjI+wJv/Y3dIxGa8tHKZzzPax
         hN/p1T6pH/YyQjNRJzkrYUFkwaXvABudC6P2hZ5Bbc6j1W0I2lpRALAzt1PC0bvr84EA
         STiy+EAQCVDzmwnW9RCuCgFgxOC3WWWjnhAVnTxEkzwA9+DTRCD99FtWPz+nYhwEv3A8
         0PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXZUCfdK7gY+Kv1hYGPVu4uc+SR+yxwik4zzcFw4aa4=;
        b=deWI9zVaPvEKOKl4mpq7PbByQ75dAzi7+lJ0zmcXkhLyZXGm8iJjAa8ThPNdeZa2eq
         r6mczsG/KOXB8iC8xmZwku5T2xLKUJhmlEc3esCzX47YSdPz8C47DAtzfeY60P1SXxI7
         J3mI2pubF6bVqPhhpG+R0LqlYYdG7yKjapYzdKXAZwNj/yXwRF09ez/0pJkHx4SOOB8W
         uNHNnnDSjtWnx0pzlvctntlbuH/otmGVvBklpmYveHqqmQtFv9oMwBMfmOp8XbkcIxAI
         MvM0KysyeRMHV1d1MsUMLDfYSWceI8CV2DVv9uQie/W4h6Bl50APisKYJOcVQu7BahXR
         kLOA==
X-Gm-Message-State: AGi0PubO2KzKQKUCeQJSun0u6Q5UYqEaSe8SOYTJlMHc3iPFQ4qnSFGL
        1DP8X/WvQE0QxFu6WQ4V4r/XP94z3qCgeHFAQ6E=
X-Google-Smtp-Source: APiQypI8YEF8TTFE0Xwx5h22aMqoXNhDREmgnyQi2I4fBaKHdsodV0zVauc4cwXsBohGC996GmyF9VbvXUF28vo6jqw=
X-Received: by 2002:a17:902:9306:: with SMTP id bc6mr4487958plb.255.1588339963862;
 Fri, 01 May 2020 06:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588112714.git.syednwaris@gmail.com> <80745504d15c87aa1da0d4be3c16d1279f48615b.1588112716.git.syednwaris@gmail.com>
 <20200429102114.GF185537@smile.fi.intel.com> <20200430161514.GA7107@syed>
 <20200430163855.GU185537@smile.fi.intel.com> <20200430233227.GA15963@icarus>
In-Reply-To: <20200430233227.GA15963@icarus>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 May 2020 16:32:32 +0300
Message-ID: <CAHp75VfCC_E9uB1eq2EVK_nLe=Oo1zqO=Dmm8kX6y-9YoosDqA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] gpio: xilinx: Utilize for_each_set_clump macro
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 1, 2020 at 2:38 AM William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> On Thu, Apr 30, 2020 at 07:38:55PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 30, 2020 at 09:45:14PM +0530, Syed Nayyar Waris wrote:
> > > On Wed, Apr 29, 2020 at 01:21:14PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Apr 29, 2020 at 04:39:47AM +0530, Syed Nayyar Waris wrote:
> >
> > ...
> >
> > > > > +       const unsigned long state_size = BITS_PER_TYPE(*state);
> > > >
> > > > This '*state' is unneeded complication, use BITS_PER_U32.
> > > >
> > > > > +#define TOTAL_BITS BITS_PER_TYPE(chip->gpio_state)
> > > >
> > > > This macro makes code uglier, besides the fact of absence of #undef.
> > > > And also see above.
> > >
> > > Thank you for your review comments. Just want to clarify, you want
> > >  a new macro to be created - 'BITS_PER_U32' ?
> >
> > It's already there (read bits.h).
>
> I'm having trouble finding the BITS_PER_U32 macro; are you thinking of
> BITS_PER_LONG?

Oh, my bad. I messed above with BITS_TO_U32() which is not what we want here.

> I don't think there are any cases where u32 is not 32
> bits wide, so perhaps it'll be better to just hardcode 32 directly in
> the code here to make it easier to read.

Yes, would work!

-- 
With Best Regards,
Andy Shevchenko
