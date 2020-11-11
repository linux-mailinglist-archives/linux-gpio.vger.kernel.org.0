Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F89F2AF52F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgKKPj2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgKKPj2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 10:39:28 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BF3C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:39:28 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id r186so1690247pgr.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 07:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E+O+pHOUSN0tBIXmWLYf+1ggsHEqRkKW4BcjNAjxsDk=;
        b=kBsP0AOIR7DYy/ne1uWUIZZZiIFTy+ZEUsFwMwFikAefVchc7iBJwg4mXVFNtlVMjq
         B6UstI/YFonyBuHMOEQfFVwRPVDKamkUkVKDrlmnQ9Q1B8fMm5CYy8KvWbxps6XvBJmH
         sSFZAYi12PamQEYEaB4zu0jO0I5TCFcew9o/UlczOlOcCEO8eCl4Yer7x24yQe9Gcdgy
         +/rQFztstuLsRabnMiDgyQ7iEu/OAoNoKb/fcKdCquE2Q4rmld7iwgExWclWTY3NByMk
         AHYdnGK1E79ffQjeLvMj6iyESNiMiZQnaX1l8E+Gd4RxfvSi47f34441kzHp9lUPEONp
         j9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+O+pHOUSN0tBIXmWLYf+1ggsHEqRkKW4BcjNAjxsDk=;
        b=GuLK/+0RgEZaY8TQvppeuag+u0RNHT3WKm8+JS3yuknKCZCjofH9kNuwCOYTk4IpKZ
         R++7xplgFiq2VhDJE7eYD8X22OEMtn7xCncE2BvQ7SEhk+io3d3sgjVHUNfJVlUnTkzi
         YvHB9G0o/HCi9p6LkTKuaC+PeNGWsUD2CtTgAheAjCkO3qunTQf6LI76j9+h3FulclqA
         jU0kJjOrVjpu46zQQojmPHodBqNegYvdCJjVx+U/WJLc89pqQrI3Wow67bQShyA0avCW
         7MyhtUh8inEOrOIKigROs6oQkqef3OSb+rFmIchgfjGA1rWoqkY/SJV/rgahMO9gF4pB
         EvpQ==
X-Gm-Message-State: AOAM531qEfuO8kC0kB3ZPtvEunVTBqnTkFvfy/qeF16zmkfN0ApJ5esM
        0oY6XgzCc8x0ntQ7ajSKhwmjlheuOuDDDujBaTU=
X-Google-Smtp-Source: ABdhPJwLpBMTNYSOw2gG3PfA8yn6a/t+eRV89p7Z+VZEb62qBiOia4XGs1t+qpJljzjuEfbHlKa7NjNDrxyIpamwJv8=
X-Received: by 2002:aa7:8c4f:0:b029:18b:f361:4aa3 with SMTP id
 e15-20020aa78c4f0000b029018bf3614aa3mr6382420pfd.73.1605109168032; Wed, 11
 Nov 2020 07:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-5-andriy.shevchenko@linux.intel.com> <20201111153231.GA2495@lahna.fi.intel.com>
In-Reply-To: <20201111153231.GA2495@lahna.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 11 Nov 2020 17:40:16 +0200
Message-ID: <CAHp75VeF8oDkFdyGoxA76QFxu0wuHRyRuwShrOZF8fvemLJO3w@mail.gmail.com>
Subject: Re: [PATCH v5 04/17] gpiolib: Add temporary variable to
 gpiod_set_transitory() for cleaner code
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

On Wed, Nov 11, 2020 at 5:33 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Nov 09, 2020 at 10:53:19PM +0200, Andy Shevchenko wrote:
> > Temporary variable that keeps mode allows to neat the code a bit.
> > It will also help for the future changes.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Not really sure if this is good change or not. Instead of constant you
> now introduce a useless variable just to get them to the same line.

No, it's useful in a patch in the series as promised in the commit
message. That variable reduces a line length a lot there.

> To me this looks better and reads easier:
>
>         packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE, !transitory);
>
> But not insisting so if GPIO maintainers are fine then no objections :)

-- 
With Best Regards,
Andy Shevchenko
