Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DB42D8E1E
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 16:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390481AbgLMPB0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 10:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbgLMPB0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 10:01:26 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743C9C0613CF
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2020 07:00:46 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 11so10389807pfu.4
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2020 07:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MW2IiFPe6Jdpwnb2DvTPp81K7waEivior6YcDxzAST0=;
        b=YQzAS90ytCPO0fEYL3Seve60VC1ZViM9citjlgBT2IaEPMMXuTXl3Y3iUgkLDj4OVK
         5zWVBPnNC6+yfVMOsslVVOlcDE42Ey27S2X0ljKGAm1y+4WYYog18aW76jnQZjswyPX9
         Qu8IkUslT6JU5zn0STTV6SdFp5YS9O/INjXvSZylXLOSgwSy8drV5HXE298ieGzfL/pC
         hP0E8wOPah5q0QOBCfsh4NuivUhrz9eXYev5W+ZcTCgKYeW3zWxBu3wrvrQAZFk3v6g/
         q9WexddJ5yVPv8iqrxcLJ4kiOEIYQAXdJNsb8OvaDYe0nebs1CjkIuHFWhroPBv89KcJ
         N02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MW2IiFPe6Jdpwnb2DvTPp81K7waEivior6YcDxzAST0=;
        b=evVb4tCE6VbNzu/drLJ0X+BUwYQiAVmNv0S31d7XD7u6MJ3OCAg990tANIW039wRS0
         ojY9szm9o47eCwie+7jag8xtdp7yzyaVXqHDhEw+JmU8aSJoWdU778xbfeVpYfWC8e9s
         whKok+dgJVpEtdgS441P5k0ibc9MXf7OJgWwAEsbvq3yVd9GT3Ltc0oNydG1fuSVX3jm
         AQn1IAh6bRTOBDIi4aLEHylgmTq4K/LrxRvRBfa9kl/AXqQMZMuyYWIGcuz2Bxj1hFfx
         IuQsBii2Z/jt/yaeXDLgUfDYLQWlTPkjNaZTOqxT9XjR4VAux5fBO+M5n22i1RNRbchN
         9VYw==
X-Gm-Message-State: AOAM530cKwC8nCoisn/Dv69Pywps9W037Nv7d4b5bXHdDyzWIRULgHMr
        650Jp67EfQYa30fjgFn/dzr4w6oYYEPRikCiRR0=
X-Google-Smtp-Source: ABdhPJwm+Ceu3+5UFQ3sXFlgrIz2nLl3AaK2MyNfhXOlJ7n527utntXEqo4YuaWnbhDx3ZdaF2bTQb3m3BOR7u8PhE8=
X-Received: by 2002:a62:19cc:0:b029:19e:321b:a22e with SMTP id
 195-20020a6219cc0000b029019e321ba22emr12886919pfz.73.1607871645530; Sun, 13
 Dec 2020 07:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20201212003447.238474-1-linus.walleij@linaro.org>
In-Reply-To: <20201212003447.238474-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Dec 2020 17:00:29 +0200
Message-ID: <CAHp75VfqhXmw=eFsJuUOb9-6GsvLUEW00ivQfe6TNSmWzLD2+A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 13, 2020 at 3:56 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> We need to make this namespace hierarchical: at least do not
> allow two lines on the same chip to have the same name, this
> is just too much flexibility. If we name a line on a chip,
> name it uniquely on that chip.
>
> I don't know what happens if we just apply this, I *hope* there
> are not a lot of systems out there breaking this simple and
> intuitive rule.
>
> As a side effect, this makes the device tree naming code
> scream a bit if names are not globally unique.
>
> I think there are not super-many device trees out there naming
> their lines so let's fix this before the problem becomes
> widespread.

I think it is a right direction but the name space should be attached
to the GPIO chip, globally it may be several GPIO chips on some boards
which are doing the same thing semantically. So, the compound of
gpiochipN:name should be unique globally.

...

> +                               return -EINVAL;

> +                               return -EINVAL;

A nit: -EEXIST ?

-- 
With Best Regards,
Andy Shevchenko
