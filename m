Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B375827D37B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 18:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgI2QUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 12:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgI2QUC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 12:20:02 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B13C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 09:20:02 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 34so4234963pgo.13
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6cgikAqmZNI0gBBduSWvtLBI0RTNeq5uBlZnPwDoE4=;
        b=glyMdJbi4ANDyNnY/IL7pNz8jo09DneB7x55TIKKcM91L5dsp3o2JNJ2vtFelQH4fG
         ns/4Dc5Rzvs+BaNgUtG5VpxmzScmLDfZft8tGRDRLiljSI2dL8wtEEEDZl2b6Iw+xFX4
         3Lh30/4P9EpOrfTEL0ObhItVAVuYLA9heXDn6DewBJAYSVSLbuILhKDvSNhBfiy7fV+M
         6JwZucdzvR90q1AK7twlDk8a/vxUWwZUMsQQyaSg4Xw/B+s1l3cDLUH7b8d5//ZJCqr6
         OheLPNBRE6DhwRzhTHH9LtSr5QIcoC+C6RaF64ZyUWmZFoh0E16qb8UdrYyd25PiypFm
         t5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6cgikAqmZNI0gBBduSWvtLBI0RTNeq5uBlZnPwDoE4=;
        b=iJUjd9bxa5g3SiQaqjea40WWbFe4HrBpPRkc5cF0tNvONfanNMxDl9UtOszCbNOr8E
         gzzv6kee81X642K4KaehNi5WEFgPm+nXXMlDkhJTBoXI7grOPa+fEPzX3DN7ElvB7icP
         TL7dkhAQ0gLN+z3vCNWRhx0oE46n2KdbGBJ3ezSReySb+l/98Ez7SJ4aOAIeJWpdBRIP
         X41Ydc5jJx6fE0M6Rk64s6OxvMrIVmdlmOSYeHP48I3m2HCHdR1tvTsLBFCTjdSsNPuT
         mPimkRV9ip5uQAtk/FjmQ9ZX64r3TaI2jLZ2wO9TbiksC8fk1tiIWuTiDE1O+qH+F3io
         tAEw==
X-Gm-Message-State: AOAM532uuZHCBH4B4eF/ar5SKy7KkMUh0CjGhBTbZqS5Tfd54ghTsCL5
        rmSe6xCmGph27xYAHewPWmiVa9Xynx89Q4CVsjFlTY5fz4p3kA==
X-Google-Smtp-Source: ABdhPJxcJUZGZjQ+HZwTAyA4WnC3GSdX+JEJAXHFs1WWYUPAklzAKZW7m1bXG/UaDYQuDRdvIirWhID1o5qCXpFExTo=
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id
 w82-20020a627b550000b029013e73672b2emr4699379pfc.7.1601396402283; Tue, 29 Sep
 2020 09:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-5-warthog618@gmail.com>
 <CAK8P3a1o4fp=-gU=SpwR540Xw+oySJ_ESkG+YXZJsDV-N6UF5w@mail.gmail.com>
 <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com>
 <20200928134217.GA1247496@sol> <CAMRc=MeUOOq9Zw+fvab1+rwKf066j9GqEMJ4mCHqVjMfwdo-Gw@mail.gmail.com>
In-Reply-To: <CAMRc=MeUOOq9Zw+fvab1+rwKf066j9GqEMJ4mCHqVjMfwdo-Gw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Sep 2020 19:19:43 +0300
Message-ID: <CAHp75VdtZ5cqhoepj_8wJABXmsXgtsFUGfRZ-HS-e12_PSp6kA@mail.gmail.com>
Subject: Re: strace decoding for GPIO uAPI
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 4:21 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Mon, Sep 28, 2020 at 3:42 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Tue, Sep 22, 2020 at 11:50:51AM +0200, Bartosz Golaszewski wrote:

...

> > I'm looking at doing this as it would be useful to have.

> > Does that work for you?

> This is perfect! Thanks for doing this! For the error cases: I'm not
> sure how strace handles this for other ioctls() - maybe we could print
> something like 'flags=N/A'? Unless what you did is the standard way,
> then leave it.

+1 here. Thanks for doing this, it's helpful!

-- 
With Best Regards,
Andy Shevchenko
