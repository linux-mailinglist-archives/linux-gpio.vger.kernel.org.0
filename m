Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1532B029D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 11:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgKLKSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 05:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgKLKSt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 05:18:49 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8AAC0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 02:18:49 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id g7so4120086pfc.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 02:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=If19d4PlEmtpLirWXQE0qH5dDeLMMmzCA7Exweg6r7I=;
        b=Ffs2kssEL6e/DLq9lSybGYZQy5tQx7OGpp7amk2eoUJEPhRLkw/d2NscVAXnwSJUs0
         54V+mpEAsUrtf8kTtNIPa0kXXV51QVaHVl7BOWj3l/8DwuqajDEwIY2cLPcT4eHGgO4p
         R0neM5I+T3yBZyEqsokLtQiTQrxmpHs2sHEiHrNn7ws2coSqzkYmULKvJnpbBFNkgond
         WdymQqRM3OImX6lCVrzBYuSmMYvKMMlEB7pYoBGrHd3iZopqIAnPQ5rSY0xGwiv5tJQN
         0cWVSWETzZgJyBNu9gWLJqLQPzzhr2qM0UfSwdKhZx7lE0itk5jCNebBbtU8YtQHfwYl
         nQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=If19d4PlEmtpLirWXQE0qH5dDeLMMmzCA7Exweg6r7I=;
        b=jDwJqcLm6746zJxwbZmeuAMU8D1cuGmA7kR5sPqP1dQGw5Ch9HKyeKHB+FcQUb+itE
         CY6gAEYBIQP8UebG0oO7OXpq+NUu7sW5/wePohZXxQaEhTQ70YHNXtjZqpKsWA8kvd5u
         iEpKZIb8/3WXB9o888g3+hVVNnNAINv0iv8AucQO7lmC2qGGmF5b1BVYkZpLgMOKNMYn
         B9jd5e9SWYssW41DJ7xSPnzKzW2Qd1fWQUsEq5zvQo5m/oPATce9bwN04KmGmE4TnrdR
         GO4jT1bUH/GXnNWmy8mMaclFFHGAo//2ExTx9r3KukkV3n7oF3Zx4lPQ/FKIItdOqyMY
         j+pw==
X-Gm-Message-State: AOAM531TOU74ZVF7UVjUZEL1egzOxn2Uprl0eLXXGDN1F8lwiIbz/jYA
        Okns9NudJanc8sjs663Bhp8BO3YLSPU+N0IAdqVZIEMIZNY=
X-Google-Smtp-Source: ABdhPJx+tDF7vnm5Qp70shcQqxlI0Y2pbAamMjTFejVErBEpTQg1rVLRsn94Cd1ULD05Sqt+G/op/ROKc52tXyWDKqM=
X-Received: by 2002:a63:4511:: with SMTP id s17mr25448203pga.4.1605176328766;
 Thu, 12 Nov 2020 02:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <20201111222008.39993-8-andriy.shevchenko@linux.intel.com> <20201112081638.GV2495@lahna.fi.intel.com>
In-Reply-To: <20201112081638.GV2495@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 12:19:37 +0200
Message-ID: <CAHp75Vehbo-Ai5SE8JX1g4wggrQvz9TpwjsiS6C0r5mztwSg6A@mail.gmail.com>
Subject: Re: [PATCH v7 07/18] gpiolib: Introduce gpio_set_debounce_timeout()
 for internal use
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 10:17 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Nov 12, 2020 at 12:19:57AM +0200, Andy Shevchenko wrote:

...

> > +int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)

> Sorry for commenting this late but I realized we have
> gpiod_set_debounce() already. At least this new function should follow
> the naming (gpiod as it takes descriptior):
>
> int gpiod_set_debounce_optional(struct gpio_desc *desc, unsigned int debounce);

Unfortunately it will be inconsistent with the naming schema. I
explained the choice of name in the cover letter. I will elaborate a
bit there.


-- 
With Best Regards,
Andy Shevchenko
