Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E342EBC1E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 11:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbhAFKKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 05:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbhAFKKQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 05:10:16 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632A5C06134D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jan 2021 02:09:36 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id d17so4244000ejy.9
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2021 02:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Xxoc3aqmI9N1LWX/ckAIvicXF8Sk64sGBU3BMibBXw=;
        b=dGOt4KnINQO9hpxfzFH/L5uf3oe59AmxXvLGW+C3B4GYnPvv4lAhstFtA1RHpBdiw0
         PZP9ZApqXHjgjV22yF7Spx2L7dm5uZCqqmkjg9+1TY4IqvqeEaMWYBHQSYeyCIzXvKaV
         Z9eo2UONXnihqGPDx10SB51EZz5Eb0YsXiWZym90NUNES6H5xbChzqfOGu6knSpElbud
         rlBMKAjQKxIwlw7B6EZW3pvlJ19NCUDrzkCmBcR+nSTqIRUty4jH40068kYFsJaGbVh+
         o8p14OdfO+Gb8GvupNO78PzPqzQCKHFe4ceU+EJo6PzOs4KjqIKqOvVQ91nnbag6zPxL
         oEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Xxoc3aqmI9N1LWX/ckAIvicXF8Sk64sGBU3BMibBXw=;
        b=BMKtBVUwviz8eV19h2IO7wZ5IkQzu9qEKR1gm4EqQspLJuAyKmQmyiIU2NbyAKidsZ
         u1DEOPkFVq7LaXq+g41TRKB1pxNTC4N0nbEyVr0QQj5B/XRLkFDUwSxQu0PkWHUvm4ne
         +dtuyj1gmA4W465LR72zps+zoUwUNHqefycmt08a2oJzHujjwcDDn7wBjfhZTjcY9bp5
         R4vYCAKerTEXOo/6F3CuW9g1H/GwM4yqjyX/g3SgX1lsKpG1qTzNIMLoGzYDuxcWM9ea
         kk1H4DLdm6BtgM/q0ZdpF1tP3wqomayx5aU4yJCLUhfR1PyD0TOoTvWkYp2gCkvsNke5
         FKpA==
X-Gm-Message-State: AOAM5300doyLSslIfYcs5rypCS6z170oFWKliWUl2OAa6/6mDdYDHK7D
        8t6Zi9vn9Fh319lghWHjGFtLq0QQcBBZOws2eVdEqA==
X-Google-Smtp-Source: ABdhPJxS3jvCRCX/Zqz8JeCVP9z3PWQzHJVjDYlzhNK13Qe3rSQj+0+BIGUOlR91iG/SNuyNDx1ZRVbFC1kxbruS4cs=
X-Received: by 2002:a17:906:3a55:: with SMTP id a21mr2408375ejf.516.1609927775133;
 Wed, 06 Jan 2021 02:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com> <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
In-Reply-To: <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Jan 2021 11:09:24 +0100
Message-ID: <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 12:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jan 5, 2021 at 6:28 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Jan 5, 2021 at 10:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > We need to make this namespace hierarchical: at least do not
> > > allow two lines on the same chip to have the same name, this
> > > is just too much flexibility. If we name a line on a chip,
> > > name it uniquely on that chip.
> > >
> > > This does not affect device tree and other gpiochips that
> > > get named from device properties: the uniqueness
> > > per-chip however affect all hotplugged devices such as
> > > GPIO expanders on USB.
> >
> > ...
> >
> > > [Dropped warning for globally unique]
> >
> > > + * - Allow names to not be globally unique but warn about it.
> >
> > Is the second part of this sentence still ture?
> > Maybe I missed a warning we are talking about here?
>
> Oops old text, Bartosz if this looks OK otherwise can you fix
> this when applying? (Just delete that line.)
>
> Yours,
> Linus Walleij

I can do it alright. But in the context of user-space I think this
doesn't really change anything. DT users still can use non-unique
names and libgpiod still has to account for that if the API is to be
considered correct. Is this change really useful? How does it affect
ACPI users that already define non-unique names?

Bartosz
