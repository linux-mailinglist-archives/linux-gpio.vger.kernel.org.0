Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BFA27CF2E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 15:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgI2Nac (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 09:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgI2Naa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 09:30:30 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69394C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:30:29 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f18so4524338pfa.10
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VazNkNPkLrlh48L8ULGqwqqtfEVsLixhxcHOVvyAf0s=;
        b=A9SpZtry+RG4mlFkCSljAawheFtpGh+5jNkskTJtg32UlKu6jBisPlkoBth2soCXBw
         NG+OQm3yTxSK9CNIC7YlmDWz+JtDacmXyKYco5pm8bKqrs5NCQswXdcOXA27MteLBUX3
         ZloxqfmV1AcqulIEy0zzgJKhcgYTdrBYx4iiAb/5eFw5+EYr1FJ5IrzE8qxDIsoaYHDs
         pbtCQ2P1tgJy6IYDaDRWqSJaUvTL7r4thIHqsVnPfwO8GfhE/XXD24dqK+xa6mjSumko
         aK4YmakYhjiO8urqkYKABagjmDYGBX6YeFOpza0dbkxcqobmVy+AXd3nwOZW7BDQAKJw
         Y2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VazNkNPkLrlh48L8ULGqwqqtfEVsLixhxcHOVvyAf0s=;
        b=VTScAgCi4w/3qQlPrMdY6VkfxkFRrz9IJpg9mE3I38fduSA+cXZEkrukK64OLHJrb1
         ep+CW2KSjGH+Kzo6bGKCzqeO4oyO859vFlGlMh6yzLtNfqFCbDhpVJ4lC7605Q6QAQps
         N3m37e0jNocClNe3ad1kITnO8u1I6DGHDAjbj6cs1HOErNksZ5K8o5kSUteiqUESl0hS
         txH7Y6L0X4119iQcl5/wJUr6fV1S0LF6RO1Lx26eIp6WT+vBVia8o56vDzCYBUawfG0p
         ylIvDCldCYG8WHiw6jH4LRyXFhmElHJ8Moqbuhw6O/bh1IEBReWWBEka/w5dqzqHvx0Y
         nCOA==
X-Gm-Message-State: AOAM530DLhh/NGud7g9w+aXKoHy5gwrvnDt3obyY3tySIwqs9TmVeIJm
        68p0fpXrKpjRtO6+eosYo2FlZkkX+qfJye4wDzD6mEu/7ObSgQ==
X-Google-Smtp-Source: ABdhPJx1H+G9py4xHvzeVLch8l964vTFmrhl5DGv/13CInnhHz/5TNxxsjqZ1c+8nCwG2ZGkoOO+0smcGbcvggpfuV4=
X-Received: by 2002:a17:902:b481:b029:d2:686a:4e1f with SMTP id
 y1-20020a170902b481b02900d2686a4e1fmr4469620plr.17.1601386228872; Tue, 29 Sep
 2020 06:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com> <CACRpkdYgHt6ajbLPfajQ8ZJn9=SHfRiDZV6gDbwAPB8XSQBpGA@mail.gmail.com>
In-Reply-To: <CACRpkdYgHt6ajbLPfajQ8ZJn9=SHfRiDZV6gDbwAPB8XSQBpGA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Sep 2020 16:30:10 +0300
Message-ID: <CAHp75Vf2Ztqxfth31cysC3JWpcr813OxG8W3FUBQ4HhCbrd=Qg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: tigerlake: Fix register offsets for TGL-H variant
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 4:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Sep 29, 2020 at 1:03 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > It appears that almost traditionally the H variants have some deviations
> > in the register offsets in comparison to LP ones. This is the case for
> > Intel Tiger Lake as well. Fix register offsets for TGL-H variant.
> >
> > Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
> > Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> I could apply this one for fixes as you indicated in another thread,
> does the other two patches depend on it?

Logically -- yes, functionally -- no. They may be applied for v5.10
or, as I said, v5.11 (but in the latter case I will do it the usual
way, via our branch).
Thanks!

-- 
With Best Regards,
Andy Shevchenko
