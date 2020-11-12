Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE192B04B4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 13:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgKLMHp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 07:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgKLMHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 07:07:45 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94BAC0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 04:07:43 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id k7so2679276plk.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 04:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RszaLDToYH6nO4Sqpgj6prrhQ62xSJa0nDudetVemdw=;
        b=HHT0i23qjQKAdtd2CuX6hegL/REGo0qJDhiEjmw1IuVeUuS2nHUBnooX4Zg85MJrxE
         ALcZTe82klIpcDmfpq0hN1EdawR1NfK63I2GWUZNH5hLjT2T1SJpZZvumGs+EgLjU51M
         5UGXL8XXEkYzs8pT4Jh66GV7T9WBnm21xSkn75fkKCPORVu6rT0rGmkzYopfIXOmLADZ
         BlwmG4+MjZF9LBg/cHBsFEyDuNTdSFItRWy4TtvvE+bKnIC2s10ylC6Y5rgBmaA45uU9
         46QO59z9Xf3HCMB6ZhokYUPfFYYX4piRxKx9p8GWU/mPIyPtWawJ8hFWKNWSKu4Fc4z6
         rcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RszaLDToYH6nO4Sqpgj6prrhQ62xSJa0nDudetVemdw=;
        b=gdGqKayELwHIbbIpi/ZMz8utZtZViaU3qSflX/JociXIzB39m5rM3OBtI/5eN8SeNV
         o0ockMHczCrilFnrVtdunvNatLrZ5B6YPBCyoBbu40Hd7vJk5y4zGS+LxFtiAHrYYlU8
         eI5Nm7xQhWtcyX20Uy3ry+aAvcwZGyXU4DBEdmnovix7BJsWtYN/sCpOcA6PK/DmE6e2
         V+tOu25jEWLdf8Wcvz6kKLD5AWM3YwPGrxmqOoZwUwVW5tESp0U9CI97oiwqZd4A8AXt
         wlVUqrgFFfa5c22igsA5gB4NV/dursDiMzfLHw6Whk4STQb67uYJgxQlE4zkMyOTgc72
         Cc7Q==
X-Gm-Message-State: AOAM5332oLZL28nBTdXdiJstEHZ3IiUsg1ErBvzd78ppyzxdIyy7mB+J
        BpleW3UbVhOk5T27lpf+FVkY4yaoCbWLcsHA8NU=
X-Google-Smtp-Source: ABdhPJxL5v6WGkD6rKmj83INfAAZgE9DaPnnGLOH+cqPrl1bTyF3EIV95KSceKf16pTV2OCOt5E5aQIs2TkDbOplBIk=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr26516052plz.21.1605182863497; Thu, 12
 Nov 2020 04:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <20201111222008.39993-8-andriy.shevchenko@linux.intel.com>
 <20201112081638.GV2495@lahna.fi.intel.com> <CAHp75Vehbo-Ai5SE8JX1g4wggrQvz9TpwjsiS6C0r5mztwSg6A@mail.gmail.com>
 <20201112110601.GA2495@lahna.fi.intel.com> <e176656b-81e1-d9f8-a108-ac8376f6c136@redhat.com>
In-Reply-To: <e176656b-81e1-d9f8-a108-ac8376f6c136@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 14:08:31 +0200
Message-ID: <CAHp75VfEXW030w3Tnmig+8+wLFb=XUSvE9hjnZ8RPdJQxDRFZQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/18] gpiolib: Introduce gpio_set_debounce_timeout()
 for internal use
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 1:12 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/12/20 12:06 PM, Mika Westerberg wrote:
> > On Thu, Nov 12, 2020 at 12:19:37PM +0200, Andy Shevchenko wrote:
> >> On Thu, Nov 12, 2020 at 10:17 AM Mika Westerberg
> >> <mika.westerberg@linux.intel.com> wrote:
> >>> On Thu, Nov 12, 2020 at 12:19:57AM +0200, Andy Shevchenko wrote:
> >>
> >> ...
> >>
> >>>> +int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
> >>
> >>> Sorry for commenting this late but I realized we have
> >>> gpiod_set_debounce() already. At least this new function should follow
> >>> the naming (gpiod as it takes descriptior):
> >>>
> >>> int gpiod_set_debounce_optional(struct gpio_desc *desc, unsigned int debounce);
> >>
> >> Unfortunately it will be inconsistent with the naming schema. I
> >> explained the choice of name in the cover letter. I will elaborate a
> >> bit there.
> >
> > OK, It seems that I was not CC'd cover letter of the last two versions,
> > or it got dropped somewhere.
>
> Yes I did not get the cover-letter either, I was actually wondering if there
> was one...

Oops, I dropped --cc because of your Rb tags (and I have added Cc when
there is no tag), but I forgot to add Cc to the cover letter.

Here we are [1].

[1]: https://lore.kernel.org/linux-gpio/20201111222008.39993-1-andriy.shevchenko@linux.intel.com/


-- 
With Best Regards,
Andy Shevchenko
