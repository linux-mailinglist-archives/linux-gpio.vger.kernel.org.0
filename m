Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747AA254A20
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 18:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgH0QCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 12:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgH0QCP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 12:02:15 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F717C06121B
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 09:02:15 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id b17so8369467ejq.8
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2EanueJM2XSw5YRZCjtUeiiCZijMpX8hJxxqxioM78=;
        b=Pb2La35wDygarqxiCkXeSo05iWU4CW7Rgv0VQojfZ1ZDhV2LgeE+yijO9R3VDvNmi7
         YZFVfEsMdVL8jArUxkiFjtnaIE+A7DKI6xQwekCT2tnJDKY0QKitgGNshY00aS9wVKuz
         yB0+R37A2THVuzBjXk3FFwonX9CfPdYkFfTmF/4wMc5TCLosP5W5HlzDKMWMjykW/8R8
         z4pSqrvpqewBqh1e1pHnXoW/f8RA5woqfsnZ+7pMieyyYXsNUKYxNn74frZ1tfM4C4ec
         CSL5hmhHEFZ89ou00bK63ldjQ7+l1hgj+ZGPcGuXdLM0agw8cN3kaXK4p3UG6OocYPkI
         k2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2EanueJM2XSw5YRZCjtUeiiCZijMpX8hJxxqxioM78=;
        b=G1J6FfQNOzejjtW6cbSAIafiQZw9SSlAk9U4joba94ojtjBx8ymZXaqq8jd+p3fWiL
         RIea82dqXdDGGY3wn5fCh1yRSI3ZWfAAJW+adb47BjwhBTLnq7eMGOnfZXZ8M6V11x2R
         72e9q0P55ufWhnWc0SJduKSTRj0hNVu4F74qviQ360BaRDcvOupXpTd3VjAHmgUZuOOT
         QCOoaRAqTZ5SU2iZfuDqfGSRNjSRzrw+y5EvHgk6OhH3E+n/e8QVFbTqiHvDrFuh23UH
         DiJkCI4ZFBKvOXSCtgA5gndoxu0oEOc8rIZ95ru45/sZK1ndRwpame7+Q4d/h4D1t5mC
         hMvw==
X-Gm-Message-State: AOAM530vluS3jNrchyPugzeqRO0u4ge+dMZwrIYza8qqfOjdDAAOycOP
        bhjF5UtZRi1HlSHNMzteLFtvYd9bL2ZGXm1GEkh7KQ==
X-Google-Smtp-Source: ABdhPJx0X1aK9V7O+lCHW4GVRc2yDb5PZkBCNGlXM3YXbRvH8p6kVD4z5l2kcfxOYFfVsy+6wEC1OjQYpcEPEnCc3Bg=
X-Received: by 2002:a17:906:19db:: with SMTP id h27mr19177114ejd.154.1598544133876;
 Thu, 27 Aug 2020 09:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200827140020.159627-1-warthog618@gmail.com> <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
In-Reply-To: <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 27 Aug 2020 18:02:03 +0200
Message-ID: <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 5:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Aug 27, 2020 at 4:00 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> > This patchset defines and implements a new version of the
> > GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> > support for debounce, event sequence numbers, and allow for requested
> > lines with different configurations.
> > It provides some future proofing by adding optional configuration fields
> > and padding reserved for future use.
> >
> > The series can be partitioned into three blocks; the first two patches
> > are minor fixes that impact later patches, the next eleven contain the
> > v2 uAPI definition and implementation, and the final seven port the GPIO
> > tools to the v2 uAPI and extend them to use new uAPI features.
> >
> > The more complicated patches include their own commentary where
> > appropriate.
>
> I'm ready to queue this now. Certainly any remaining snags can be
> fixed in-tree.
>
> It kind of keeps in tradition with proper software projects "plan to
> throw one away" which is what we have traditionally done several
> times: the first Bluetooh framework was tossed, JFFS was tossed
> for JFFS2, Video4Linux was tossed for V4L2. So let's do this.
>
> Anyone against? I will put it on an immutable branch and then merge
> that in for devel.
>

Hi Linus,

please hold it maybe for one more week - I'd love to have some more
people take a look at the user facing header at least. Andy is usually
very thorough in his reviews so I'm Ccing him here.

I'll too skim through the series one more time.

Bart
