Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9993F2284C7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 18:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgGUQFv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 12:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgGUQFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 12:05:51 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5193BC061794;
        Tue, 21 Jul 2020 09:05:51 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x8so10451117plm.10;
        Tue, 21 Jul 2020 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9USfGMDVRb5jRH5KCWia/MeDjSymcmgAqiWXmG8Adhc=;
        b=rRNpckOUnHXXPB5v4HkjTWKIFGd7b8EmSRwn9OOjPt5LVwygeAW7Srv/BWclga25Ml
         +CF6GN+tsJUAsvaMc3jst1iSb33dCXBE+vsSYGlD8Mn792bQB9Iz9Wv976rxbPl3J3rD
         3S01aPcADrc/84+Iy/dWiH/q0u8AGmeJmOEdh+x3kihTuOe1mT9l4YiEis2DkpPZG6JI
         K3MvNkN+GnBCYbpGu119qVjFFmLI4W3gct5hxrniN5qRkUBX8yZDTWdYL+4MENShG9ml
         XcJS8MAIfS0sRKi5aBc6q/Eqos5SWzsTxdnc7GdT8lDf1U3UPE5YdwAn+HK2u7wEXWFh
         FWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9USfGMDVRb5jRH5KCWia/MeDjSymcmgAqiWXmG8Adhc=;
        b=WZ1QvtyppGnRGteIon6geKfeEfxPg5ScB3F8vKqXWSKK/D1xBzwobQ0mymfpYGoFyG
         C0sqqbIT9skj3z+sp/imBGR/pgwBovU5q+xaWI4WNv8DkoOeODa5myoxnypMfc5yhc7+
         fZU2l3rYXRdaPTjBSrTTe69HuvELHpjjUWhTwnEqFEoXNKmLY/7CNrRzpEW5QglHbNzg
         68GS/d/uMZcitFICj/i4gjnkPhmpm8Oot8t6U8dtxD2tTaYp+742rncp5UzfHFJcdOdv
         B2+YwGV1ptEMFIIH0d24dNaGP9T/w8JVtaAIWV2SIuCyohFkGFYymGOio9avwsZHTXwO
         va1w==
X-Gm-Message-State: AOAM5302ORN45C+Fr80qbHDCTsnMyvtzzaLhGPGpVeykL1F4diEVfjKg
        1HIaQ6qlt8FFZr3z8/4SOHvEHR8qdpDiTnpy2UO1tqCI
X-Google-Smtp-Source: ABdhPJzhRL6bJ77a9Xrw52AZodvYbwqe7iTmyNZKhrJd0VIZEgHKfqGmo1PjxVkE8ebTE+JdQrgMJ6Wqw7VBYVMlEjo=
X-Received: by 2002:a17:902:b098:: with SMTP id p24mr12443643plr.18.1595347550747;
 Tue, 21 Jul 2020 09:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200721144832.750728-1-abanoubsameh@protonmail.com>
In-Reply-To: <20200721144832.750728-1-abanoubsameh@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 19:05:36 +0300
Message-ID: <CAHp75VdFvAYR+z8c6R2J9Q2JK-WpHS4LU_-cWvsOa2g8+Gfk9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-crystalcove.c: changed every 'unsigned' to
 'unsigned int'
To:     Abanoub Sameh <abanoubsameh8@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 5:49 PM Abanoub Sameh <abanoubsameh8@gmail.com> wrote:
>
> Changed 'unsigned' to 'unsigned int'.
> This makes the code more uniform, and compliant with the kernel coding style.

In all patches you wrongly added 'gpio-' and '.c' parts. Also you
missed the version of the patches (I have told you about) and
changelog.

No need to resend, I fixed that this time for you. Be careful in the future.

-- 
With Best Regards,
Andy Shevchenko
