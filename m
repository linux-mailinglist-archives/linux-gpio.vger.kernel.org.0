Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8668E2AF5F2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 17:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgKKQO7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 11:14:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgKKQOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 11:14:52 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11942C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 08:14:52 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q5so1878830pfk.6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 08:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7xTgF/S6xSn4D+K2fMuG6UmmoOgpCf+V0fTNKYLCsJE=;
        b=TKgddnHenz/Gt9mhDfzikvI1Gey2EdvKVl/eMrcDN1/cNSha+jf6thfO8bgTtoL0GC
         Tg5gPqjRMAoBEpQVI9eFigDVTWFpTI+T90XFgIWHcPhluSqxRuQQ/5Gk1uw9aiKwfkcC
         4md4bFIT21Rypfh12dU+7gVasMV90Xfg6gk8dppPUIGNtSldyEIq6NBIRUKtM6NnM0BW
         cpM8jaZAyUV4pofpiq8kPV7FH6k6N8dJZxssCaXGhI3bHjhc+MMaXZ8LL/P5fOqNyaZo
         K2fU7I/qZ9xndnaNMNCfdyyImJnhmaxHVIhKpH/4Z5YW0HQKU7UR02VZ9A0A+ATT8iWo
         d6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7xTgF/S6xSn4D+K2fMuG6UmmoOgpCf+V0fTNKYLCsJE=;
        b=R895p7FmseSrZ6Rdk2AqpaPghYvU92DL18sd3vtgunFEzNAhj1LlpNPK7/TgZ6TJa+
         F8yA191y0exo/M20yUsaTRrUjL2Cq+XdNaMYynpHllTynr1TtQonoTX8Th76Ktsy5GZa
         +brBXkIAngVistveWYfIH2fb4OdHjfP8/o7FIufIgH72TAeYEWc8IlPiNM7CNu6dQA4U
         3jbwh4TJY0PldiX2vCQQ47LFdJ40HLPuEJBrwL89mQ3ovGX4akzn7R9napRqK1wy6CJV
         DAanoU9sBobdnLPxuRliLkqjnEbnodFhER4Tsawfh8n7GNa8CLJAUeurXWmAubWY0Ip5
         JcFw==
X-Gm-Message-State: AOAM530JQjzSQ85nVmwzXocOBYWTtBTOUP05OLssnkmN90K0y3Lvsgup
        MK5+U8W2bDXwONjM9JZAZLPJWDnctA8FnVO901I=
X-Google-Smtp-Source: ABdhPJxoJSYFNuIiYAlylLv/ueY5d/QJBr5gTObkNwUBQxrgDNZWalgs7R8ws5RfNeYdYJGPSDmySY7uU9q2tKWKYiw=
X-Received: by 2002:a63:4511:: with SMTP id s17mr22429846pga.4.1605111291621;
 Wed, 11 Nov 2020 08:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-9-andriy.shevchenko@linux.intel.com>
 <20201111153907.GE2495@lahna.fi.intel.com> <CAHp75VcfS7YDC=pEraqGaN1L4YT7EQEq6JHxMkq=Cz4PQPSkbQ@mail.gmail.com>
 <20201111155213.GJ2495@lahna.fi.intel.com>
In-Reply-To: <20201111155213.GJ2495@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 18:15:40 +0200
Message-ID: <CAHp75VeHs5oP-5ZVoweRmPN1efyZeeN+kQR8G3NLe9OkYidgmA@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] gpiolib: Extract gpio_set_debounce_timeout() for
 internal use
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

On Wed, Nov 11, 2020 at 5:54 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Wed, Nov 11, 2020 at 05:46:55PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 11, 2020 at 5:40 PM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Mon, Nov 09, 2020 at 10:53:23PM +0200, Andy Shevchenko wrote:

...

> > > Again I think mode variable is pretty useless here and does not improve
> > > readability.
> >
> > You mean something like
> >
> >     return gpio_set_config_with_argument_optional(desc,
> >                 PIN_CONFIG_INPUT_DEBOUNCE, debounce);
> >
> > is better?

Hmm... Not sure I can agree with this, but I can change.

-- 
With Best Regards,
Andy Shevchenko
