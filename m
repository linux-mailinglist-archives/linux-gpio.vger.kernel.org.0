Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112542EBEBD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 14:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbhAFNfb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 08:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbhAFNf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 08:35:28 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A31FC06135A
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jan 2021 05:34:48 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id c22so2203942pgg.13
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2021 05:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xAokFMyuFTbXHLYCfysY6DFgADOvwjpcayIOVHIA054=;
        b=FYqY5cCgnER2zIg94Fn1LyhHmM4hG6xs7XKjEjRcDrwTjlTcQElDmoFyrq5HgBlrf/
         Pyo4arD2CWx9xdnEGHVoljiHLyGZ1MyTtlX2A57VleEvcEW+MlxrLFkg8q7o/x7rAbSt
         X7yAy/A/yLUS1tmYOxMjvZ2SPkiQ6CU0gohRRfpbpFN6y1X9qsZL/KLyGBgK0JlWbEVF
         PQYHPTYyeZqKGv56efHAgH619hdtlRTADjRapDb5E5RtSqltExcMJ0KNY15W5Pw1yiOx
         FFEk5b9fFfOWAnD6/D1sxzBmNGGAwPNHbTP5FINat3rkGOuKN43PFlADJGddTdJH+JNl
         QVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xAokFMyuFTbXHLYCfysY6DFgADOvwjpcayIOVHIA054=;
        b=GS/3PIz4oo2EqxWrhrqEQHfsahvqZf8P9NCFAJfe2uTPyEJ//CX/dwbcIujojIweHN
         C4W4hsRWkwKyDNAJE02xICmt1sYFeYgdjzxVA+1Rt+YkIcJF3XO/gKH1y9s4dunMYzKm
         STmadwXwyY5eg8+GgRtr0K03nVjyyGRt+6ObI9eF2Ge3NgVd8FBB4u9Y04RVhM9xEeP1
         VocCM0JkZ6zEQHsqcofmsuHS3+Pxxez+wQfTp5Q+zdgJYuQjyt/T8CudwWgiAFYdqbJS
         NT7/B8pbK21jsAWSHMUq/qcS4eQlNZGWIPkZvzzLfAsP537tAckpQyDYsOmth0Iofbz2
         vh2A==
X-Gm-Message-State: AOAM530uIhtoNQgwVylgZQ5d3+t2unmLIEFIFXmYMwCtXnHF+iwrsh/g
        tcFqF2HyQAqxNr4fzXJhJF08+PzKc7CLYOaHDwkHoWxAZ2uLiw==
X-Google-Smtp-Source: ABdhPJwK0NZY7zlXCbFempO4Wys5lt7+t49bpVzgAqT8A0iFQJVeze+SASbyUnST6wLmlxJ3EamOBJ3FQ0YJ4dEuk2A=
X-Received: by 2002:a63:c04b:: with SMTP id z11mr4586061pgi.74.1609940088107;
 Wed, 06 Jan 2021 05:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com> <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 Jan 2021 15:34:31 +0200
Message-ID: <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Flavio Suligoi <f.suligoi@asem.it>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 12:09 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, Jan 6, 2021 at 12:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Jan 5, 2021 at 6:28 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Jan 5, 2021 at 10:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > > We need to make this namespace hierarchical: at least do not
> > > > allow two lines on the same chip to have the same name, this
> > > > is just too much flexibility. If we name a line on a chip,
> > > > name it uniquely on that chip.
> > > >
> > > > This does not affect device tree and other gpiochips that
> > > > get named from device properties: the uniqueness
> > > > per-chip however affect all hotplugged devices such as
> > > > GPIO expanders on USB.
> > >
> > > ...
> > >
> > > > [Dropped warning for globally unique]
> > >
> > > > + * - Allow names to not be globally unique but warn about it.
> > >
> > > Is the second part of this sentence still ture?
> > > Maybe I missed a warning we are talking about here?
> >
> > Oops old text, Bartosz if this looks OK otherwise can you fix
> > this when applying? (Just delete that line.)

> I can do it alright. But in the context of user-space I think this
> doesn't really change anything. DT users still can use non-unique
> names and libgpiod still has to account for that if the API is to be
> considered correct. Is this change really useful?

IMHO it is useful and the earliest we do the better.

> How does it affect
> ACPI users that already define non-unique names?

I suppose that in ACPI we don't have many users that do it on their
own (for IoT Intel platforms GPIO expanders have unique names).
Also see above. I prefer to have a bug report with a clear source of
the issue (like a table that the user can't / won't change which
predates the date of kernel release with a patch.

+cc: to the user who lately was active in the area.

Flavio, perhaps one more rule to the gpio-line-names property has to
be added into documentation (Bart, same to DT docs?):
 - names inside one chip must be unique

-- 
With Best Regards,
Andy Shevchenko
