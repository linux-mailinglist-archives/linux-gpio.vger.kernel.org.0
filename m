Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9399F26DD27
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 15:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgIQNwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 09:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgIQNvt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 09:51:49 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DA1C061D73
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 06:51:34 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 7so1385050pgm.11
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 06:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kwt+Kw4aA/UG+Oq1cyFWdWlt/+7mIvQereDJrFlU1bY=;
        b=pbxKlmr4liqDrG3bLXzMYZfTe+pRlJDd8tkJXp4gryVW4J55gRhePMqdu0pkyQ4GpR
         sAhTJwST+VvEQMEBxzIUaaOMSxIk3O6+egkicTvlphqGQ5pjjVPH4wO9b2rDpeKf1mVS
         DSDsuGL/V916wd8Tb0NRJ53TYsORhsCG0z9PH5V5/swfFo64SE+xMF6IF6ADqx9CNgLq
         vkQhWfP4ZiHyeOmXpK41glJrf9GAGtKZvWSM1el81A6w8hT0yyvEgvWti0MKK89S2Tup
         PwZVu3Upt/MvIq8fmPDvg9LOxxYFIWPAFdZhvkWvmwZMSpWJC5SFvf+wNAu7BmP8Xd4c
         oVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kwt+Kw4aA/UG+Oq1cyFWdWlt/+7mIvQereDJrFlU1bY=;
        b=DI9mVVVlvI1g4FqulW4gadEl26KlCAicqYU8lBdM+sVY23Hh6/yYQrN1HuOqXgkHua
         JZ/e8G4N5Dt2UuF01NhReKb1uVOd4K4d7/AhaA1cTc7evS7ssZZ+rG1utKkzFk5qa7ef
         ozDpKJX/disWFkMUaQ9a/9pbc09u3zBqZatsm38VnDE0wU2n8Txt0atVPFowuBa4jtBb
         /Auu99GT+Z8MKDTkKcGX3LDarB9NZGjRxqr8pnOfWuTZOvKZtTOp1gDVoUmoj/uJeIhs
         PUZdxP3fg0TGlpi5+y+5+HnKvfOx1Wjmgjt63JwVfCgKTcUkj1IgWI+vaJshHDgwVPYn
         6m8w==
X-Gm-Message-State: AOAM530iCEij1C1AashmOmOL8PK7HfS6X1EDLLwjELGWgUTRy3EI/Bh3
        TeDph2Ew0IV2Aoeowo3fHbSm7gnsY3TOfolt4Jw=
X-Google-Smtp-Source: ABdhPJzHcYzP8u/HZrvY1MxsVnJ5Sk25FEleCWe40RqBY6I3B+vsshG7MU8xWByZ/L0nQv00uN2XLIjzOppSTE7JbCk=
X-Received: by 2002:aa7:9201:0:b029:13e:d13d:a10c with SMTP id
 1-20020aa792010000b029013ed13da10cmr26251633pfo.40.1600350694035; Thu, 17 Sep
 2020 06:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol> <20200915033428.GA14286@sol> <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
 <20200915135732.GA100294@sol> <CAMRc=MdbZh2CE3BXg0gg6CJxMGonvUN=yFc4kjXjUnkduwJgpA@mail.gmail.com>
 <20200916095734.GA32888@sol> <CAM4ZDbCvTsQ9QyW9bF2n-noF1+kArZpCb216W9tf7X=tqSHhwg@mail.gmail.com>
 <CAHp75Vf0vwgxC9=3n+GjW+26cMjUHO-9JnrMYg_i8Tn8MMZK7Q@mail.gmail.com> <CAM4ZDbAQsUL2V+bvyAkBxxAmk2MPYrzM+MV10_o1vX6rKYdynw@mail.gmail.com>
In-Reply-To: <CAM4ZDbAQsUL2V+bvyAkBxxAmk2MPYrzM+MV10_o1vX6rKYdynw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Sep 2020 16:51:16 +0300
Message-ID: <CAHp75Ve=PbStRuXVjD9TrQbNcJPv-YnD-0OTbToEAfeyrJV+=Q@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 4:45 PM Maxim Devaev <mdevaev@gmail.com> wrote:
>
> > As a workaround can you simply read the state separately (yes, I
> > understand that is not ideal but may help a bit to mitigate the
> > current situation)?
> > I.o.w. if you haven't got a new event during certain period of time,
> > read the pin state to actualise it.
>
> Yes, that's what I'm doing now. In principle, I am satisfied with this
> decision. Not perfect, but okay. The only thing I think is worth
> documenting this situation. Suddenly someone else will face similar
> problems.

Side note: please do avoid top postings.

-- 
With Best Regards,
Andy Shevchenko
