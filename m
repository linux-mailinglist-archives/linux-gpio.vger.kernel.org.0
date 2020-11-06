Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71B302A9810
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 16:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgKFPJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 10:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKFPJr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 10:09:47 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508E4C0613CF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 07:09:47 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id g12so1140732pgm.8
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 07:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TNj0AhxxXfbGijoE+Fny6BLaymNupG4qZuvokAnOZ1w=;
        b=pmnlTvrriAlZomMzKyZkvJ8Tk2iZvyxjxpBTKM+MQgJrgLtSlv9c7g3TK90vlKrMbc
         n2Almoh6P0hfSmdyEq3sW1UQ3hXpkwhJh9puBk2/npVTWZJkfZ8uDV9UQNnkEoqUTQDy
         mXBTK9DN0nPIF2mJbKV9MG6fB3mYNy4q00XtvCLY5zeweDT3iIakdYX59+Z2HP7IvhdD
         4PdSAroPt3R4WEWyMkL7M0TtZtpNRGPEbnWcToSMUupwC4jf0jWQ8i7RtCBE9N7qQZWs
         2r1zgfQdElQbIhixKsi2npNmsxYcqoBYPPkPgLIjVaIma96l0SmRMgkpIqEWzV2gB+b1
         rKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TNj0AhxxXfbGijoE+Fny6BLaymNupG4qZuvokAnOZ1w=;
        b=MkK1Wr5yy22AL5B1/v8LcwW+BBGaRUOkRk3GgiR/bxjLz5M81lekIPDwDuYPBru0Bk
         8D9L3i1S/7ezFPVpvIVANreHM76T891PcntraDu+iKBNC5nKDe0R2rcVOAy4YHT4xIyy
         gMz18S+kGhsR6soY4aqZiqHGlN8I+3/83MIo7dCTa89yTaVHeowpPAWVH3+5G9kLKrTn
         vGIskN99ogVQ2Rfqsq0ucxbkepjSGxGoFA6Uw83PTqkfANyD3qjaEToGMvzM0QuMhChN
         P4I0RaL4falNDeylv2T5d3r/jshTOvf/+0u3dw+HgOveII+G6JFYJvYeKuYWEjefOTSy
         bgGA==
X-Gm-Message-State: AOAM533Cf7n6mOvmZch8hFb+LnoCOaNYBiA7QIyf8SQmdxWvqvLt64Yh
        m964yEP/+ayczpMooH3Nca7KDOh8V76b0vuEzGY=
X-Google-Smtp-Source: ABdhPJzv9OlXD1DhzbHlWywUGRVbVduATTMo4pMYcobmFLdoB9y+oQv2a04kR0ntZhgTjKQZrgrlKmPGlC7BvzlrYgs=
X-Received: by 2002:a05:6a00:850:b029:18a:a8ce:d346 with SMTP id
 q16-20020a056a000850b029018aa8ced346mr2338341pfk.73.1604675386078; Fri, 06
 Nov 2020 07:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20201102191722.81502-1-andriy.shevchenko@linux.intel.com> <CACRpkda-kiURXfFeU+3yu3q=gEXZe6ZEEKn6E_RrB1QQ++bffQ@mail.gmail.com>
In-Reply-To: <CACRpkda-kiURXfFeU+3yu3q=gEXZe6ZEEKn6E_RrB1QQ++bffQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 6 Nov 2020 17:10:34 +0200
Message-ID: <CAHp75VfS-MG2WMZvdi1+WWMXrn2+Efq1Z+1DDbAHLvHLB0tsHg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpiolib: acpi: pin configuration fixes
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 3:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Nov 2, 2020 at 8:17 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > I think the best way is to collect tags from GPIO maintainers and I
> > can incorporate this into our Intel pin control branch which I will
> > share with you as PR against GPIO and pin control subsystems.
> >
> > I'm also all ears for alternatives.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

> However I definitely trust you on any changes to gpiolib-acpi.c
> so if you want a definitive formal control over that I do not mind
> if you list yourself as maintainer of this file. I would
> definitely pull any GPIO-ACPI-stuff from you without any
> hesitation anyways.

Let's hear what Mika says. I'm fine to use my Intel GPIO tree for that purpose.

-- 
With Best Regards,
Andy Shevchenko
