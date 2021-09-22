Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8864144F0
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 11:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbhIVJSr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 05:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbhIVJSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 05:18:47 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AA7C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:17:16 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id i132so7608091qke.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gn+nEFDKTURpjaS9um2R/6i047uMVQhOkWKtTTYm0Z4=;
        b=SVWGtILSIEYqWTEb0v/gF6eBghUTi+R7JoSeBl7o2vp/kc6IilMVjcX0AUfdH0IPBp
         56g2uoY1x21giwX+l3+KmB7wHgM+x3cJMQt4e8RrfWQ6geiOGg1BL1GLE/8Z6cN678C7
         h6OVvICoUdKg6sqUjXDXV7UMXPZ1F67oluPK+Enskt9HnuxTL4sqjXuCnKztcVtmbNeh
         +FqeJrBIhXx/zTSnOFEW9xYKNs3wQ8z/PxzQ+txCYiLk6Q3yoyYwMOgnR7tXd4VRm8/l
         sfagFgY6Jtam9zcD9sgSRzq1rnYn5Q6iSkhvXNoo4uo+RFY3lJTBHE1W76Ak2u+uMVTk
         GrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gn+nEFDKTURpjaS9um2R/6i047uMVQhOkWKtTTYm0Z4=;
        b=3M4Oq+GVzpR2GN9sN/AOuN/fCjxW8PbMzIDV8rb38zwXcmv1v9ocGaCZcjBIxLXs3/
         n97smtDo+A5oZGSkBmr52ealOl9PvgNDYZHHrLyBoSIHG3q7vq+7BBTRFriGRWjHL0Dy
         3DcLicvOMlTT4EQVESdb/Vv5l7fmc/21zHafbqSxjrEUBzs2wezpY1SInDQXPNshAsMv
         huB809JKnXRdERjOi0eCUfuphQbPd8cZJXEEyJaZ7B9eG9SqOVWmCnS1vjXKIpVHvTTO
         CPjsYRAl7VcL58LLn1indfSllwS663BaRX90vegAer9s9aJ+C3SZQYj1OEefZlrB869W
         n6kg==
X-Gm-Message-State: AOAM532xUijJXgx4EGw287elctgVeSfap0kqz8f0p3Gg99OVT8yYVpIJ
        YDuDXTHUP/ILRXaHa+LaCjGjFVCTevIjT6d+o5YMDA==
X-Google-Smtp-Source: ABdhPJzpM8eFo8R3MzUJabPRQCx+clQcA/NLKiTGLcclgrdU3AqhddoDrEFQJUt3+QwjKLzf5EEVYC0cafm9RBs42hc=
X-Received: by 2002:a25:7146:: with SMTP id m67mr43540306ybc.353.1632302235832;
 Wed, 22 Sep 2021 02:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210816093856.12313-1-hdegoede@redhat.com> <CACRpkdZ8ngakZhbrJp=OjcayLJ4j7C9gqb72N18fHExtMT7gNg@mail.gmail.com>
 <86fafc6f-113c-2ea9-579b-ea29343865da@redhat.com>
In-Reply-To: <86fafc6f-113c-2ea9-579b-ea29343865da@redhat.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:17:05 +0200
Message-ID: <CAMpxmJUtYoq1tX060dw6sKNpAf+D73Dr_s-pMhUdpeOKSr22gg@mail.gmail.com>
Subject: Re: [PATCH regression fix] gpiolib: acpi: Make set-debounce-timeout
 failures non fatal
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 21, 2021 at 8:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 9/21/21 8:28 PM, Linus Walleij wrote:
> > On Mon, Aug 16, 2021 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> >> Commit 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
> >> made the gpiolib-acpi code call gpio_set_debounce_timeout() when requesting
> >> GPIOs.
> >>
> >> This in itself is fine, but it also made gpio_set_debounce_timeout()
> >> errors fatal, causing the requesting of the GPIO to fail. This is causing
> >> regressions. E.g. on a HP ElitePad 1000 G2 various _AEI specified GPIO
> >> ACPI event sources specify a debouncy timeout of 20 ms, but the
> >> pinctrl-baytrail.c only supports certain fixed values, the closest
> >> ones being 12 or 14 ms and pinctrl-baytrail.c responds with -EINVAL
> >> when specified a value which is not one of the fixed values.
> >>
> >> This is causing the acpi_request_own_gpiod() call to fail for 3
> >> ACPI event sources on the HP ElitePad 1000 G2, which in turn is causing
> >> e.g. the battery charging vs discharging status to never get updated,
> >> even though a charger has been plugged-in or unplugged.
> >>
> >> Make gpio_set_debounce_timeout() errors non fatal, warning about the
> >> failure instead, to fix this regression.
> >>
> >> Note we should probably also fix various pinctrl drivers to just
> >> pick the first bigger discrete value rather then returning -EINVAL but
> >> this will need to be done on a per driver basis, where as this fix
> >> at least gets us back to where things were before and thus restores
> >> functionality on devices where this was lost due to
> >> gpio_set_debounce_timeout() errors.
> >>
> >> Fixes: 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Bartosz will pick this up I think, I'm a bit off duty with GPIO right now.
>
> Added Bartosz to the To: list, to make sure that he actually
> sees this. I somehow did not add him in the To/Cc when sending out
> the patch, sorry about that.
>

Yep, I only process patches that are directed to me personally (TO or CC).

Now applied but I'll only be able to send it out for v5.15-rc3.

Bart
