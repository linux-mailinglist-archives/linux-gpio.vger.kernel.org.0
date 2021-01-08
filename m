Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1E62EF47B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 16:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbhAHPFh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 10:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbhAHPFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 10:05:36 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D50C061380
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 07:04:56 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id q4so5788188plr.7
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sCFCbP7lyABmFnePyeCGN2LTKCq4E7kcALejd63lnIA=;
        b=rbywo7s08PLgWMKAZgergDdOiWIuRExpFWaCJj4DxW2eD8bM5lexqM5ro+HFqwOdcm
         NDN1J2bOw4zKpV1ZwVZJ1eMiNoK4pUtCR/KUybNwf4tflbqDimvwlufbBw7PzCEfMEC5
         v61/3GZ0DMmxAaDvs+a5eaZZiv4MM/xtV6KzPIM21PvGnm5+uQAnCRP/521USu25+HFQ
         NEcNtaQWquwuf66lKl52XGcMg+SV1wIhZHac5dSjIrrHaz/ecehDqSrVqciH/AtjtteI
         cHiAGDApYtET8JJBFfpLCJzsUX1ifY077TYw3rAtJDXcqkbxfUwFMrrtBZfoXSb6Uepp
         lt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sCFCbP7lyABmFnePyeCGN2LTKCq4E7kcALejd63lnIA=;
        b=CttOfkMGmBr+7FA2jz6h4RJYaMObrZK7fVSuWxy+kBq4C7Sr1BwnO8YS3P6C421XYF
         rkGd1pNz7bU9hzBEGA7Ir7sZYZBaiFJz5xLz6EemQAhSR1erdv8tZFWoLhccTWNVCOqs
         m2P5RjYu7LDkhMC324b73uIY510/pE5oO2QnQl98o3tA/UQFqZsU6faa1L2bPstjfG3c
         7zVV7Nn2WtXmqMc/bU23IuY5vd1luezihvJMrKytmofN6wkbkgNA5wuAXwI+clfA2sVg
         xDr1m0VxXVYUhXF8Nzc18QQWidJcy0iwXd0bRG/cff3pYyPt0GEtJ3Mn/J3zFe9V9GxX
         S8Xg==
X-Gm-Message-State: AOAM530XQVL+Z+lfCQDh+fygyLAh8ENZxDYBsTSYd63ZiON9Tpqf34Ud
        Ljy7AZa8dVwike0NSzLQHiUjI5rF7b4xXiCQkE4=
X-Google-Smtp-Source: ABdhPJxLtmN/VA5jOXL+PVtylPWwl0rRj36ESY9JEoBTlL+q2zy97Ywa3iGGUx9g0lbUUOvHPSaRsHnK8nJ05GaJ9L0=
X-Received: by 2002:a17:902:c244:b029:da:e63c:cede with SMTP id
 4-20020a170902c244b02900dae63ccedemr4271540plg.0.1610118296042; Fri, 08 Jan
 2021 07:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
 <63d69976687846c6a50e904b913bd235@asem.it> <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
 <860764e8df53481bb43c79560b859979@asem.it>
In-Reply-To: <860764e8df53481bb43c79560b859979@asem.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 8 Jan 2021 17:05:44 +0200
Message-ID: <CAHp75Vdy4c4j2k8LWL_5s3KvGXPL2Zystfqb1+vcpBJzdmuNnw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 4:39 PM Flavio Suligoi <f.suligoi@asem.it> wrote:

...

> > > For example, something like the following:
> > >
> > > # gpiofind button_1
> > > gpiochip0 20
> > > gpiochip0 22 (duplicate)
> >
> > This cannot happen, as the duplicate is on the same gpiochip.
>
> Just a question:  I think that a duplicate name can be present
> both in the same gpiochip

No. This is against common sense. Can you have the same pin numbers on one chip?

> and also in different gpiochips.

Yes and it's fine.

> The same gpio line name can be wrongly present on different gpiochips,
> for example caused by a mistake writing an ACPI table.

-- 
With Best Regards,
Andy Shevchenko
