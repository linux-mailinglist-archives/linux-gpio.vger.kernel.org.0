Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EF6B0B7F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbfILJgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:36:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37262 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730218AbfILJgC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:36:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id w67so18760576lff.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kH4sFfjOL7A7KkMOV7vO4UQpyFz9162V/0NGhP2LeSw=;
        b=HC4txyRjxxz5UdDmhEgx85TIHyKxoHw2xFB4boVIniAuaYNptRdirmEVyOSmpxTlK/
         l/CSZ+KB0+6Cx13rsE3aBhIo1L1jAy18I6BmPAE1dTZOiFapkH17OTjZY94KGQpT0l2E
         szQD3XSjOdIMpaeBS7iY/NEbdKAzIttZ6jytZNnmyPg4/7hsrAWqkWCnd0qKKbeVKOuZ
         CdgSX8i0IElZQwO5Si1vmsuLR7dM37KB6z5mQwmBus5iGvcWwoKd/oZWJi1X9qzl0cLC
         S4t9QBD+TrljIfpI/6ImwJmy0vevu/vCe2RKPG7THWx+8gxQsa/hYPUgVbxmn1ywXfzl
         t83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kH4sFfjOL7A7KkMOV7vO4UQpyFz9162V/0NGhP2LeSw=;
        b=daUyUdONgfr4nNsh9yvD7zuR6nGWJS8hLXW+p3B0rHRhV/1vAvEj5hAATBESI0wbP6
         hmZHtCB/37gjqoSKbWqceKfzC8gaKRXcyDwbDRQjE9/mPs1eHCujknRPLgIOHSGqzjdG
         OdelsF/mD4S5vctVZH7TzCPVTMCpSSeMFtKpR0xtlgqpKyMOwnQt9VnFYyg5g/pw5E25
         jIbDqM0ikfoVHJwIyDO19AdLrB7mAShPY8s8Oo+r4tJui99y4MEsNOYKqz4rpK/FlaN3
         8cV40mj5XSPU3NwNBSOYpKsG3hicrEq8T7ptfxQ57MnxjSghH4p1iJDS0dYz5xu23y6z
         NIUA==
X-Gm-Message-State: APjAAAUq1FtRrE/KTd3I5BSw7ffbfXMBUZL+WlCOZ0yQmOCVfL2KQ+Y6
        h/wJl3RBcbvuflZNGqGLVTKeveu3FDwFkdFAIdSgtg==
X-Google-Smtp-Source: APXvYqyxNtgIo21vnlXm6rIfHw5trKnnP33CLddtU3yZiyvg20eJ+KsBoi44dzHBWHnwNIT4/vtfRWOEHEBXKqSKQto=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr27549722lfp.61.1568280960418;
 Thu, 12 Sep 2019 02:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-3-dmitry.torokhov@gmail.com> <20190911170140.GS2680@smile.fi.intel.com>
In-Reply-To: <20190911170140.GS2680@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:35:49 +0100
Message-ID: <CACRpkdZNy82SwDYThtD8Q3K_2MrFHXjWfv2k93sp=XnoWj71TA@mail.gmail.com>
Subject: Re: [PATCH 02/11] gpiolib: introduce devm_fwnode_gpiod_get_index()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 6:01 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Sep 11, 2019 at 12:52:06AM -0700, Dmitry Torokhov wrote:
> > devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
> > in question does not have to be a child of device node. Let's rename it
> > to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
> > for now.
> >
> > Also let's add a devm_fwnode_gpiod_get() wrapper as majority of the
> > callers need a single GPIO.
>
> > +     return devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
> > +                                        flags, label);
>
> At least one parameter can fit previous line, but taking into consideration
> that moving second one makes it 81 character long, I would do it completely on
> one line. I don't remember Linus' preferences.

I don't really have one, I don't mind 80+ chars, I don't mind breaking lines
to avoid it.

Yours,
Linus Walleij
